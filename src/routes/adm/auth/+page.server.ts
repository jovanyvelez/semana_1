import { fail, type Actions, type Action } from '@sveltejs/kit';
import bcrypt from 'bcrypt'
import { Prisma } from '@prisma/client';
import { prisma } from '$lib/server/prisma';
import { superValidate, message, setError } from 'sveltekit-superforms/server';
import { authSchema } from '$lib/zodSchemas/schemas';



export const load = async () => {
	const form = await superValidate(authSchema);
	return { form };
};


const register: Action = async ({ request }) => {
	
	const datos = await request.formData();
	const form = await superValidate(datos, authSchema);
	
	if (!form.valid) return fail(400, { form });

	const email = form.data.email as string;
	const password = form.data.password as string;
	
	
	try {
	
		const user = await prisma.usuario.findUnique({
			where: { email }
		});
	
		if (!user) return setError(form, 'email', 'Upss, problemas creando usuario');;
		
		await prisma.AuthUser.create({
			data: {
			  email,
			  passwordHash: await bcrypt.hash(password, 10),
			  userAuthToken: crypto.randomUUID(),
			},
		  })
		
	} catch (e) {
		if (e instanceof Prisma.PrismaClientKnownRequestError) {
		  // The .code property can be accessed in a type-safe manner
		  if (e.code === 'P2002') {
			console.log(
			  'Email ya existe en la tabla, no puede crear autenticacion con este email'
			)
		  }
		}
		return setError(form, 'email', 'Usuario y/o contraseña ya existe');
	}

	return message(form, 'usuario creado')
};

export const actions: Actions = { register };
