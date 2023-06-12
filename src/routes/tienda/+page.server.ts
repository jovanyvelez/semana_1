import { prisma } from '$lib/server/prisma';
import { redirect } from '@sveltejs/kit';

export const load = async ({locals}) => {

	if(!locals.user) throw redirect(302,'/login')

	const rootCategory = await prisma.category.findMany({
		where: { padreId: null },
		select: {
			id: true,
			name: true,
			hijos: {
				select: {
					id: true,
					name: true,
					hijos: {
						select: {
							id: true,
							name: true,
							hijos: {
								select: {
									id: true,
									name: true
								}
							}
						}
					}
				}
			}
		}
	});
	prisma.$disconnect();
	return { datos: rootCategory };
};
