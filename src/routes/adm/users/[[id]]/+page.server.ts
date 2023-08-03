import { type Actions, type Action, redirect, error, fail } from '@sveltejs/kit';
import { prisma } from '$lib/server/prisma.js';
import { superValidate, message } from 'sveltekit-superforms/server';
import { userSchema } from '$lib/zodSchemas/schemas.js';

const userCreateSchema = userSchema.extend({
	id: userSchema.shape.id.optional()
})


export const load = async ({locals, params}) => {
	
	const user =   locals.user;
	if(!user) throw redirect(303, '/'); 	

	let idUser;
	let usersDb = null;
	if(params.id){
		idUser =  parseInt(params.id,10);
		if(idUser < 1) throw error(404);
		try {
			usersDb = await prisma.usuario.findUnique({
				where:{id: idUser}
			});
			if(!usersDb) throw error(404);
		} catch (error) {
			console.error('Error al obtener los departamentos:', error);
		} finally {
			await prisma.$disconnect();
		}
	}

	console.log(usersDb)

	const form = await superValidate(usersDb,userCreateSchema);
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
	
	return {
		form, tipos, departamentos
	};
};

const register: Action = async ({ request }) => {
	
	console.log("En la accion registro");
	const datos = await request.formData();
	const form = await superValidate(datos, userCreateSchema);
	let registro = form.data;
	console.log(form.data);
	if(!form.valid) return fail(400, {form})
	
	const vendedor = await prisma.sellers.findFirst({
		where: { email: registro.asesor },
	});
	
	registro = {...registro, codVendedor: vendedor.code}
	
	console.log(registro)
	
	try {
			await prisma.usuario.create({
			data: {roleId: form.data.roleId,
					name: form.data.name,
					phone: form.data.phone,
					email: form.data.email,
					docType: form.data.docType,
					numDoc: form.data.numDoc,
					Departament: form.data.Departament,
					city: form.data.city,
					address: form.data.address,
					bussinessUnit: form.data.bussinessUnit,
					zoneid: form.data.zoneid,
					asesor:form.data.asesor,
					codVendedor: vendedor?.code
				}

		})
	} catch (error) {
		console.log("No se grabó el usuario")
		return fail(400, {form});
	}


	return message(form, 'Usuario creado!');

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
