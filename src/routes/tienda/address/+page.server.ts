import { fail, redirect } from '@sveltejs/kit';
//import { prisma } from '$lib/server/prisma';
import type { Actions } from './$types';

export async function load({ locals }) {

	const usuario  = locals.user;
	if (!usuario) throw redirect(303, '/login');
	return { usuario }
}

export const actions = {
	default: async ({ request }) => {
		// TODO log the user in
		const datos = await request.formData();
		
		const productos = JSON.parse(datos.get('products') as string);
		const { userId, departamento, municipio, notes, address, products, zone } = productos;
		let newProducts;
		if (departamento.length > 1 && municipio.length > 1 && address.length > 1 && notes.length > 1) {
			newProducts = await Promise.all(
				products.map(async (element) => {
					try {
						const result = await prisma.$queryRaw`
                      WITH RECURSIVE CategoryHierarchy AS (
                        SELECT "id", "name", "padreId"
                        FROM "Category"
                        WHERE "id" = ${element.category}
              
                        UNION ALL
              
                        SELECT c."id", c."name", c."padreId"
                        FROM "Category" c
                        INNER JOIN CategoryHierarchy ch ON c."id" = ch."padreId"
                      )
                      SELECT "id"
                      FROM CategoryHierarchy
                      WHERE "padreId" IS NULL;
                    `;
						return {
							productoId: element.id,
							rootCategory: result[0].id,
							cantidad: element.cantidad,
							precio: element.price,
							category: element.category
						};
					} catch (error) {

						return fail(422, { success: false });
					}
				})
				);
				
				
				newProducts = await Promise.all(
					newProducts.map(async (element) => {
						const ccosto = await prisma.ccostoZoneCategories.findFirst({
							where: { zone, categoryId: element.rootCategory },
							select: { ccosto: true }
						});
						return { ...element, ccosto };
					})
					);
					
					newProducts = newProducts.map((obj) => {
						return { ...obj, ccosto: obj.ccosto.ccosto };
					});
					
					
					
					const finalOrder = await prisma.OrdenDePedido.create({
						data: {
							userId,
							direccionEntrega: address,
							ciudadEnt: municipio,
							departamentoEnt: departamento,
							notes
						}
					});
					newProducts = newProducts.map((element) => {
				return { ...element, ordenDePedidoId: finalOrder.id };
			});
			
			try {
				const detalle = await prisma.OrdenDePedidoProducto.createMany({
					data: newProducts
				});
			} catch (error) {
				console.error(error)
			}


			await Promise.all(
				products.map(async (element) => {
					await prisma.Product.update({
						where: {
							id: element.id
						},
						data: {
							quantity: element.quantity - element.cantidad
						}
					});
				})
			);
            prisma.$disconnect();
			return { success: true, savedorder: finalOrder.id };
		}
        prisma.$disconnect()
		console.log('Sorry');
		return fail(422, { success: false });
	}
} satisfies Actions;
