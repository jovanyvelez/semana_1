import { fail, redirect } from '@sveltejs/kit';
import type { Action, Actions } from './$types';
import bcrypt from 'bcrypt';
import { prisma } from '$lib/server/prisma';

export const load = async ({cookies}) => {
	cookies.delete('session', { path: '/' });
	return {};
};

const login: Action = async ({ cookies, request }) => {
	let form;

	try {
		form = await request.formData();
	} catch (error) {
		return fail(400, { message: 'error desconocido' });
	}

	const email = form.get('email');
	const password = form.get('password');

	if (!email || !password || typeof email !== 'string' || typeof password !== 'string') {
		return fail(400, {
			message: 'Login o contraseña incorrecta'
		});
	}

	try {
		const user = await prisma.AuthUser.findUnique({ where: { email } });
		if (!user) {
			return fail(400, {
				message: 'Login o contraseña incorrectaU'
			});
		}

		const userPassword = await bcrypt.compare(password, user.passwordHash);

		if (!userPassword) {
			return fail(400, { message: 'usuario / contraseña incorrecta' });
		}

		const authenticatedUser = await prisma.AuthUser.update({
			where: { email: user.email },
			data: { userAuthToken: crypto.randomUUID() }
		});

		cookies.set('session', authenticatedUser.userAuthToken, {
			// send cookie for every page
			path: '/',
			// only sent over HTTPS in production
			secure: false
		});
	} catch (error) {
		// database connection error
		console.error(error);
		return fail(500, {
			message: 'Unknown error occurred'
		});
	}
	throw redirect(302, '/');
};

export const actions: Actions = { login };