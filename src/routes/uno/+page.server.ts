import { redirect } from '@sveltejs/kit';
import type { Actions } from './$types';

export const actions = {
    default: async ({request}) => {
        // TODO log the user in
        const datos = await request.formData();
        console.log(datos.get("name"))
        redirect(300,'/dos')
    }
} satisfies Actions;