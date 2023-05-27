import { fail, redirect } from '@sveltejs/kit';
import { prisma } from '$lib/server/prisma';
import type { Actions } from './$types';

export const actions = {
    default: async ({request}) => {
        // TODO log the user in
        const datos = await request.formData();

        const productos = JSON.parse(datos.get('products') as string)
        const { userId, departamento, municipio, notes, address, products, zone  } = productos

        if( departamento.length>1 && municipio.length>1 && address.length>1 && notes.length>1){
            products.forEach(async element => {
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
                    console.log(result[0].id)
                    const ccosto = await prisma.ccostoZoneCategories.findUnique({
                        where: {zone, categoryId:result[0].id},
                        select:{categoryId:true}
                      });
                      console.log(ccosto)
                } catch (error) {
                    //console.log("hubo un error con la consulta ccosto")
                    return fail(422, {success:false });
                }
            });
            return { success: true };
        }
        console.log("Sorry")
        return fail(422, {success:false });
    }
} satisfies Actions;