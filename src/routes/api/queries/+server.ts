export const GET = async ({ url }: { url: any }): Promise<Response> => {
	let searchTerm = String(url.searchParams.get('searchTerm')).trim();

	const products = await prisma.product.findMany({
		where: {
			OR: [
				{ name: { contains: searchTerm, mode: 'insensitive' } },
				{ code: { contains: searchTerm, mode: 'insensitive' } }
			]
		},
		select: {
			id: true,
			name: true,
			quantity: true,
			price: {
				select: { price1: true }
			},

			image: {
				where: { name: 'main' },
				select: { secureUrl: true }
			}
		}
	});
	return new Response(JSON.stringify(products), { status: 201 });
};
