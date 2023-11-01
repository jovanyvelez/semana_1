import { prisma } from '$lib/server/prisma';

interface Producto {
    code: string;
    quantity: number;
    price1: number;
}

export const actualizarProductos = async (productosActualizar:Producto[]) => {
	const productosNoActualizados = [];

	for (const producto of productosActualizar) {
		const code = producto.code;
		const quantity = producto.quantity;
		const price1 = producto.price1;
		if (code && typeof quantity === "number" && typeof price1 === "number") {
			const existeProducto = await prisma.product.findUnique({ where: { code } });

			if (existeProducto) {
				const productId = existeProducto.id;

				try {
					await prisma.product.update({
						where: { code },
						data: { quantity }
					});

					await prisma.price.updateMany({
						where: { productId },
						data: { price1 }
					});
				} catch (error) {
					console.error(`Error al actualizar el producto con código ${code}:`, error);
					productosNoActualizados.push(producto);
				}
			} else {
				console.log(
					`El producto con código ${code} no existe en la base de datos. No se pudo actualizar.`
				);
				productosNoActualizados.push(producto);
			}
		}else{
			productosNoActualizados.push(producto)
		}
	}
	prisma.$disconnect();
	return productosNoActualizados;
};
