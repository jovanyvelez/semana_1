import { redirect, type Actions, fail } from '@sveltejs/kit';
import { prisma } from '$lib/server/prisma';
import { auth } from '$lib/server/lucia';
import { LuciaError } from 'lucia-auth';

export const load = async ({ locals }) => {
	const { user } = await locals.auth.validateUser();
	if (!user) throw redirect(303, '/login');

	const result = await prisma.$queryRaw`
    WITH RECURSIVE CategoryHierarchy AS (
        SELECT "id", "name", "padreId", "id" AS rootId, 0 AS level
        FROM "Category"
        WHERE "padreId" IS NULL
        
        UNION ALL
        
        SELECT c."id", c."name", c."padreId", ch.rootId, ch.level + 1
        FROM "Category" c
        INNER JOIN CategoryHierarchy ch ON c."padreId" = ch."id"
    )
    SELECT 
        ch."id", 
        ch."name", 
        ch."padreId",
        ch.level,
        (SELECT "name" FROM "Category" WHERE "id" = ch.rootId) AS rootName,
		(SELECT "id" FROM "Category" WHERE "id" = ch.rootId) AS rootid
    FROM CategoryHierarchy ch
    ORDER BY ch.rootId, ch.level;
`;

	const categoriesAndDescendants = result.reduce((result, objeto) => {
		const existingItem = result.find((item) => item.rootid === objeto.rootid);
		if (existingItem) {
			existingItem.ids.push(objeto.id);
		} else {
			result.push({ rootid: objeto.rootid, name: objeto.name, ids: [objeto.id] });
		}
		return result;
	}, []);

	const elResultado = await Promise.all(
		categoriesAndDescendants.map(async (obj) => {
			const quantity = await prisma.Product.count({
				where: {
					categoryId: { in: obj.ids }
				}
			});

			let skip;
			let take = 4;

			if (quantity < 5) {
				skip = 0;
			} else {
				skip = Math.floor(Math.random() * quantity);
				if (skip > quantity - 4) {
					skip = quantity - 4;
				}
			}

			let values;

			values = await prisma.Product.findMany({
				take,
				skip,
				where: {
					categoryId: { in: obj.ids }
				},
				include: { image: true }
			});

			obj['products'] = values;
			return obj;
		})
	);

	prisma.$disconnect();
	return { elResultado, user };
};

export const actions: Actions = {
	// signout
	default: async ({ locals }) => {
		try {
			const session1 = await locals.auth.validate();
			if (!session1) return fail(401);
			await auth.invalidateSession(session1.sessionId);
			locals.auth.setSession(null);

			//Crear usuario
			/*const user = await auth.createUser({
				primaryKey: {
					providerId: 'username',
					providerUserId: 'wilfer.castano@equisol.com',
					password: 'wilfer123'
				},
				attributes: {
					email: 'wilfer.castano@equisol.com'
				}
			});
			const session = await auth.createSession(user.userId);
			locals.auth.setSession(session);
			console.log('usuario creado');*/
		} catch (error) {
			console.log('ERROR');
		}
	}
};
