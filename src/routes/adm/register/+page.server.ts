import { auth } from '$lib/server/lucia';
import { fail, redirect, type Actions, type Action } from '@sveltejs/kit';
import { LuciaError } from 'lucia-auth';
import { Prisma } from '@prisma/client';
import { prisma } from '$lib/server/prisma.js';
import { superValidate } from 'sveltekit-superforms/server';
import { userSchema } from '$lib/zodSchemas/schemas.js';




export const load = async () => {
	
	//const session = await locals.auth.validate();
	
	//if (session) throw redirect(302, '/');

	//const user = auth.deleteUser('Q7RD8tt47Qy3RKV');
	const form = await superValidate(userSchema);

	return {
		form
	};
};

const register: Action = async ({ request, locals }) => {
	const form = await superValidate(request, userSchema);
	
	console.log('En el servidor');
	if (!form.valid) {
		return fail(400, {
			form
		});
	}
/*
	try {
		const usuario = await prisma.user.findUnique({
			where: { email: form.data.email }
		});

		await prisma.user.create({
			data: {
				email: form.data.email,
				nombre: form.data.name,
				telefono: form.data.telefono,
				role: { connect: { name: 'cliente' } }
			}
		});

	} catch (error) {
		
	}finally{
		prisma.$disconnect;
	}
*/

	try {
		const user = await auth.createUser({
			primaryKey: {
				providerId: 'username',
				providerUserId: form.data.email,
				password: form.data.password
			},
			attributes: {
				email: form.data.email
			}
		});
		const session = await auth.createSession(user.userId);
		locals.auth.setSession(session);
		console.log("usuario creado")
	} catch (error) {
		if (
			error instanceof Prisma.PrismaClientKnownRequestError &&
			error.code === 'P2002' &&
			error.message?.includes('username')
		) {
			return fail(400, {
				message: 'Username already in use'
			});
		}
		if (error instanceof LuciaError && error.message === 'AUTH_DUPLICATE_KEY_ID') {
			return fail(400, {
				message: 'Username already in use'
			});
		}
		console.error(error);
		return fail(500, {
			message: 'Unknown error occurred'
		});
	}
	return { form };
	/*
	

	if (usuario) {
		form.valid = false;
		form.errors.email = ['email ya existe'];
		await prisma.Sdisconnect();
		return fail(400, {
			form
		});
	}
	await prisma.user.create({
		data: {
			email: form.data.email,
			username: form.data.email,
			passwordHash: await bcrypt.hash(form.data.password, 10),
			userAuthToken: crypto.randomUUID(),
			role: { connect: { name: Roles.USER } }
		}
	});
	await prisma.$disconnect();
	console.log('Weldone');
	redirect(303, '/login');
	//return {form}
	*/
};

export const actions: Actions = { register };
