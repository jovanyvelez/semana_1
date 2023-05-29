import { redirect, type Actions, fail } from '@sveltejs/kit';
import { prisma } from '$lib/server/prisma';



export const load = async ({locals}) => {
	
	const { user } = await locals.auth.validateUser();
	
	/*const cliente = await prisma.usuario.findUnique({
		where: {
			email: 'jovany.velez@gmail.com'
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
	});*/
	prisma.$disconnect();
	if(user){
		return { email:user.email };
	}
	return {}
};
