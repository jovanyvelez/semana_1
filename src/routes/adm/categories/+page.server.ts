import { prisma } from '$lib/server/prisma';
import type { Actions } from './$types';

export const load = async ()=>{

    const zonas = await prisma.zones.findMany(
        {
            orderBy:{name:'asc'}
        }
    );

    return {zonas}
}


export const actions = {
	default: async ({ request }) => {
        console.log("estoy en el action")
    }
} satisfies Actions













































