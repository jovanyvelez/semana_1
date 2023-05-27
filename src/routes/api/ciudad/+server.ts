export const GET = async ({ url }: { url: any }): Promise<Response> => {
	let myDepartment = String(url.searchParams.get('departamento')).trim();
	const response = await fetch(
		`https://www.datos.gov.co/resource/xdk5-pm3f.json?$select=municipio,c_digo_dane_del_municipio&$where=departamento%20like%20%27${myDepartment}%27&$order=municipio ASC,c_digo_dane_del_municipio ASC`
	);
	const data = await response.json();

	return new Response(JSON.stringify(data), { status: 201 });
};
