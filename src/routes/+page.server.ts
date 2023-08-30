import { redirect, type Actions, fail } from '@sveltejs/kit';
import { prisma } from '$lib/server/prisma';
import { env } from '$env/dynamic/private';

export const load = async ({ locals }) => {
	const user = locals.user ? locals.user?.name : undefined;

	if (!user) throw redirect(303, '/login');

	const root = await prisma.category.findMany({
		where: {
			padreId: null
		},
		select: {
			id: true,
			name: true
		}
	});
	prisma.$disconnect();

	const elResultado = await Promise.all(
		root.map(async (obj) => {
			const quantity = await prisma.product.count({
				where: {
					rootCategory: obj.id
				}
			});

			let skip;
			const take = 4;

			if (quantity < 5) {
				skip = 0;
			} else {
				skip = Math.floor(Math.random() * quantity);
				if (skip > quantity - 4) {
					skip = quantity - 4;
				}
			}

			const values = await prisma.product.findMany({
				take,
				skip,
				where: {
					rootCategory: obj.id
				},
				select: {
					id: true,
					name: true,
					code: true,
					image: true
				}
			});

			obj['products'] = values;
			return obj;
		})
	);

	prisma.$disconnect();

	return { elResultado, user, images: env.CLOUD_IMAGES };
};

//Actions
