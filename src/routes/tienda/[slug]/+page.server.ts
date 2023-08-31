import { prisma } from '$lib/server/prisma';
import { redirect } from '@sveltejs/kit';
import { env } from '$env/dynamic/private';

export async function load({ params, locals }) {

	const user = locals.user;
	if (!user) throw redirect(303, '/');

	type mQuery = {
		param: string;
		page: number;
	};

	let query: mQuery;

	let continuar = true;
	try {
		query = JSON.parse(params.slug);
	} catch (error) {
		query = { param: params.slug, page: 1 };
	}


	const cliente = await prisma.usuario.findUnique({
		where: { email: user.email },
		select: {
			id:true,
			name: true,
			phone: true,
			email: true,
			docType: true,
			numDoc: true,
			Departament: true,
			city: true,
			address: true,
			role: { select: { name: true } }
		}
	});

	if (!continuar) {
		return { cliente };
	}
	const pageSize = 10;

	const resultado = await prisma.$queryRaw`
    WITH RECURSIVE CategoryHierarchy AS (
        SELECT "id", "name", "padreId", "id" AS rootId, 0 AS level
        FROM "Category"
        WHERE "padreId" = ${query.param}
        
        UNION ALL
        
        SELECT c."id", c."name", c."padreId", ch.rootId, ch.level + 1
        FROM "Category" c
        INNER JOIN CategoryHierarchy ch ON c."padreId" = ch."id"
    )
    SELECT 
        ch."id"
    FROM CategoryHierarchy ch
    ORDER BY ch.rootId, ch.level`;


	let categorias;

	if (resultado.length === 0) {
		categorias = [params.slug];
	} else {
		categorias = resultado.map((obj) => obj.id);
	}

	categorias = [...categorias,query.param];

	const products = await prisma.product.findMany({
		where: {
			categoryId: {
				in: categorias
			}
		},
		select: {
			id: true,
			name: true,
			quantity: true,
			description:true,
			code:true,
			categoryId: true,
			rootCategory:true,
			price: {
				select: { price1: true }
			},

			image: {
				where: { name: 'main' },
				select: { secureUrl: true, publicId:true }
			},
			tax:true,
		},
		skip: pageSize * (query.page - 1),
		take: pageSize
	});

	const count = await prisma.product.count({
		where: {
			categoryId: {
				in: categorias
			}
		}
	});

	prisma.$disconnect();

	return { products, query, page: query.page, pages: Math.ceil(count / pageSize), cliente, images: env.CLOUD_IMAGES };
}