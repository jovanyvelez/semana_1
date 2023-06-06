import { prisma } from '$lib/server/prisma';
import type { Actions } from '../$types';
import { fail, redirect } from '@sveltejs/kit';

export const load = async () => {

    const categoriasHijasRaiz = await prisma.category.findMany({
        where: {
          padre: null // Filtra las categorías que no tienen un padre, es decir, la categoría raíz
        },
        select: {
          id: true,
          name: true,
          hijos: {
            select: {
              id: true,
              name: true
            }
          }
        }
      });    
         

	return { categoriasHijasRaiz };
};


export const actions = {

	default: async ({ request }) => {

        console.log("Entro a grabar")
		
        //tomo los datos que me envían
        const datos = await request.formData();
		const categoria = JSON.parse(datos.get('categoria') as string);

        //valido los datos que envian
        if(!categoria.name) {
            return fail(422, { error: true, message:"No hay nombre de la catetoria" });
        }

        if(categoria.padreId.length <1){
            return fail(422, { error: true, message:"No hay categoria padre" });
        }

       
        const exist = await prisma.category.findFirst({
            where:{name:categoria.name, padreId: categoria.padreId}
        })
        console.log(exist);
        if(exist){
            return fail(422, { error: true, message: "ya existe la categoria" });
        }

		const newCategory = await prisma.category.create({
			data: {
				name: categoria.name,
                padreId: categoria.padreId
			}
		});
        console.log("Todo ok")
        return { success: true };
	}
} satisfies Actions;