import { prisma } from '$lib/server/prisma';

export const GET = async (): Promise<Response> => {
	
  let departamentos;

  try {
		departamentos = await prisma.departamentos.findMany({
			select:{
        			departamento:true,
        			codigo:true
      				},
      				orderBy: {
								departamento: 'asc' 
							}
		});
		
	} catch (error) {
		console.error('Error al obtener los departamentos:', error);
	} finally {
		await prisma.$disconnect();
	}

	return new Response(JSON.stringify(departamentos), { status: 201 });
};
