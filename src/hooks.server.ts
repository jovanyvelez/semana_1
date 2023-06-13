import type { Handle } from '@sveltejs/kit';
import { prisma } from '$lib/server/prisma';

export const handle: Handle = async ({ event, resolve }) => {
	
	// get cookies from browser
	const session = event.cookies.get('session');
	console.log(session)
	if (!session) {
		// if there is no session load page as normal
		return await resolve(event);
	}

	// find the user based on the session
	const authUser = await prisma.AuthUser.findUnique({
		where: { userAuthToken: session },
		select: { email: true }
	});

	console.log(authUser)

	const user = await prisma.Usuario.findUnique({
		where: { email: authUser.email },
		select: {
			id: true,
			name: true,
			phone: true,
			email: true,
			docType: true,
			numDoc: true,
			Departament: true,
			city: true,
			address: true,
			bussinessUnit: true,
			zone: true,
			discount: true,
			role: {
				select: {
					name: true
				}
			},
			asesor: true
		}
	});

	if (user) {
		event.locals.user = user;
	}

	return await resolve(event);
};