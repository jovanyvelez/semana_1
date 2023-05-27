import { prisma } from '$lib/server/prisma';

export const load = async () => {
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
