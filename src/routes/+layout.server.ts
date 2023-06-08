import { redirect, type Actions, fail } from '@sveltejs/kit';
import { prisma } from '$lib/server/prisma';

export const load = async ({locals}) => {
	
	const { user } = await locals.auth.validateUser();
	
	if(user){
		const appUser = await prisma.usuario.findUnique({
			where: {
				email: user?.email
			},
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
				zone: true,
				role: {
					select: {
						name: true
					}
				}
			}
		});
		prisma.$disconnect();
		return { email:appUser?.email, role:appUser?.role.name };
	}
	return {}
};
