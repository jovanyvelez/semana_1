import { prisma } from '$lib/server/prisma';


export const GET = async ({ url }: { url: any }): Promise<Response> => {
	let myDepartment = String(url.searchParams.get('departamento')).trim();
	const departamento:string = myDepartment;
	let ciudades;
	try {
		ciudades = await prisma.departamentos.findFirst({
			where:{departamento},
			select:{ciudad:{orderBy:{ciudad:'asc'}}}
		});
		console.log(JSON.stringify(ciudades,null,2));
	} catch (error) {
		console.error('Error al obtener los departamentos:', error);
	} finally {
		await prisma.$disconnect();
	}
	

	return new Response(JSON.stringify(ciudades.ciudad), { status: 201 });
};
