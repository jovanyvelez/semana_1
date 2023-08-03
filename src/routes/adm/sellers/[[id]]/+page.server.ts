import type { PageServerLoad } from './$types';
import { prisma } from '$lib/server/prisma';
import { z } from 'zod';
import { message, superValidate } from 'sveltekit-superforms/server';
import { error, fail, redirect } from '@sveltejs/kit';

const sellerSchema = z.object({
	id: z.number().int(),
	code: z.string().length(2),
	email: z.string().email()
});

const crudSchema = sellerSchema.extend({
    id: sellerSchema.shape.id.optional()
})

export const load = (async ({ locals,params }) => {

    const user =   locals.user;
	if(!user) throw redirect(303, '/'); 

	const id = parseInt(params.id, 10);
    let dato;

	if (id) {
		dato = await prisma.sellers.findFirst({
			where: { id }
		});
        if(!dato) throw error(404)
	} 

	const form = superValidate(dato,crudSchema);
	const allSellers = prisma.sellers.findMany();
	prisma.$disconnect();
	return { form, allSellers };

}) satisfies PageServerLoad;

export const actions = {
	default: async ({ request }) => {
		const formData = await request.formData();
		const form = await superValidate(formData, crudSchema);
		console.log(form);
        if(!form.valid) return fail(400,{form});
        try {
            await prisma.sellers.create({
                data:{
                    code: form.data.code,
                    email: form.data.email
                }
            })
        } catch (error) {
            console.log("No se pudo guardar el registro");
            return fail(400,{form});
        }

        return message(form,'Vendedor creado')
	}
};
