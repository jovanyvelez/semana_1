import { fail, type Actions, type Action } from '@sveltejs/kit';
import { auth } from '$lib/server/lucia';
import { Prisma } from '@prisma/client';
import { prisma } from '$lib/server/prisma';
import { LuciaError } from 'lucia-auth';
import { superValidate, message, setError } from 'sveltekit-superforms/server';
import { authSchema } from '$lib/zodSchemas/schemas';
import type { PrismaClientKnownRequestError } from '@prisma/client/runtime';


export const load = async () => {
	const form = await superValidate(authSchema);
	return { form };
};


const register: Action = async ({ request }) => {
	
	const datos = await request.formData();
	const form = await superValidate(datos, authSchema);
	
	console.log(form);

	if (!form.valid) return fail(400, { form });

	const email = form.data.email as string;
	const password = form.data.password as string;


	
	const user = await prisma.usuario.findFirst({
		where: { email }
	});
	console.log(user)

	if (!user) return setError(form, 'email', 'Primero debe crear al usuario');;
	
	
	
	try {
		const user = await auth.createUser({
			primaryKey: {
				providerId: 'username',
				providerUserId: email,
				password
			},
			attributes: {
				email
			}
		});
	} catch (e) {
		if (e instanceof Prisma.PrismaClientKnownRequestError) {
		  // The .code property can be accessed in a type-safe manner
		  if (e.code === 'P2002') {
			console.log(
			  'There is a unique constraint violation, a new user cannot be created with this email'
			)
		  }
		}
		return setError(form, 'email', 'La contraseña ya está creada');
	}

	return message(form, 'usuario creado')
};

export const actions: Actions = { register };
