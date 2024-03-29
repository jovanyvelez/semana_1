import { type Actions, type Action, redirect } from '@sveltejs/kit';
import { prisma } from '$lib/server/prisma.js';
import { superValidate, message } from 'sveltekit-superforms/server';
import { userSchema } from '$lib/zodSchemas/schemas.js';

const userCreateSchema = userSchema.extend({
	id: userSchema.shape.id.optional()
})
export const load = async ({locals}) => {
	
	const user =   locals.user;
	if(!user) throw redirect(303, '/'); 

	
	const tipos = await prisma.roles.findMany();
	
	let departamentos;
	
	
	
	try {
		departamentos = await prisma.departamentos.findMany({
			select: {
				departamento: true,
				codigo: true
			},
			orderBy: {
				departamento: 'asc'
			}	
		});
	} catch (error) {
		console.error('Error al obtener los departamentos:', error);
	} finally {
		await prisma.$disconnect();
	}
	
	const form = await superValidate(userCreateSchema);
	return {
		form, tipos, departamentos
	};
};

const register: Action = async ({ request }) => {

	const datos = await request.formData();
	//const form = await superValidate(datos, userCreateSchema);
	console.log(datos);
	/*if (!form.valid) return fail(400, {form});
	//const newUser = JSON.parse(JSON.stringify(form.data));
	try {
			await prisma.usuario.create({
			data: {
				name:form.data.name as string,
				email: form.data.email as string,
				phone: form.data.phone as string,
				docType: form.data.docType as string,
				numDoc: form.data.numDoc as string,
				address: form.data.address as string,
				Departament: form.data.Department as string,
				city: form.data.city as string,
				bussinessUnit: form.data.bussinessUnit as string,
				zone: form.data.zone as string,
				discount: form.data.discount as number,
				asesor: form.data.asesor as string,
				roleId: form.data.roleId as number
			}
		})
	} catch (error) {
		console.log("No se pudo grabar el registro")
		return fail(400, {form});
	}

	*/
	return ;

/*
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
	}*/

};

export const actions: Actions = { register };
