import { prisma } from '$lib/server/prisma';
import type { Actions } from '../$types';
import { fail, redirect } from '@sveltejs/kit';

export const load = async () => {
	const zonas = await prisma.zones.findMany({
		orderBy: { name: 'asc' }
	});

	return { zonas };
};

export const actions = {
	default: async ({ request }) => {
		
        //tomo los datos que me envían
        const datos = await request.formData();
		const categoria = JSON.parse(datos.get('categoria') as string);

        //valido los datos que envian
        if(!categoria.category) {
            return fail(422, { error: true, message:"No hay nombre de la catetoria" });
        }

        if(categoria.zones.length <1){
            return fail(422, { error: true, message:"No seleccionas ninguna zona" });
        }

        const count = categoria.zones.reduce((a,c) =>{
            if(!c.ccosto || c.ccosto === ""){
                return a+1
            }else{
                return a
            }
        }, 0 )

        if(count > 0){
            return fail(422, { error: true, messsage:"Algunas zonas no tienen centro de costo" });
        }

        const exist = await prisma.category.findFirst({
            where:{name:categoria.category}
        })
        console.log(exist);
        if(exist){
            return fail(422, { error: true, message: "ya existe la categoria" });
        }

		const newCategory = await prisma.category.create({
			data: {
				name: categoria.category
			}
		});

		const ccostoCategoria = categoria.zones.map((e) => {
			return { zone: e.zone, ccosto: e.ccosto, categoryId: newCategory.id };
		});


        const grabaCcosto = await prisma.ccostoZoneCategories.createMany({
            data:ccostoCategoria
        })
        return { success: true };
	}
} satisfies Actions;
