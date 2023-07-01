import {prisma} from '$lib/server/prisma'

export const GET = async ({ url }: { url: any }): Promise<Response> => {
	let searchTerm = String(url.searchParams.get('searchTerm')).trim();

	const products = await prisma.product.findMany({
		where: {
			OR: [
				{ name: { contains: searchTerm, mode: 'insensitive' } },
				{ code: { contains: searchTerm, mode: 'insensitive' } },
				{ description: { contains: searchTerm, mode: 'insensitive' } }
			]
		},
		select: {
			id: true,
			name: true,
			quantity: true,
			description:true,
			code:true,
			categoryId: true,
			price: {
				select: { price1: true }
			},

			image: {
				where: { name: 'main' },
				select: { secureUrl: true, publicId:true }
			}
		}
	});
	prisma.$disconnect()
	console.log(products);
	return new Response(JSON.stringify(products), { status: 201 });
};
