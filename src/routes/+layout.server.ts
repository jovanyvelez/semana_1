//Agrego comentario
import { prisma } from '$lib/server/prisma';
// SvelteKit + PocketBase Integration: User Login and Registration 
export const load = async () => {
	const cliente = await prisma.usuario.findUnique({
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
	});
	prisma.$disconnect();
    // console.log(JSON.stringify(cliente,null,2))
	return { user: cliente };
};
