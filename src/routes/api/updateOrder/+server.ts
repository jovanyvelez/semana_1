
import { arrayBienFormado } from '$lib/server/utils/check_data';
import { actualizarProductos } from '$lib/server/utils/updatePriceAndInventory';

export const PUT = async ({ request }: { request: Request }): Promise<Response> => {

  const data = await request.json();

  if(!data){
    return new Response(JSON.stringify({ message: 'no recibido', status: 500 }));
  }

  if(!Array.isArray(data)){
    return new Response(JSON.stringify({ message: 'json mal formado', status: 500 }));
  }
	
	const { user, pass } = data[0];

	if (!user || !pass) {
    return new Response(JSON.stringify({ message: 'problema en credenciales', status: 500 }));
	}

  if(!(user === "controlar" && pass=="controlar123")){
    return new Response(JSON.stringify({ message: 'credenciales no validas', status: 500 }));
  }
  
  data.shift();

  if(!arrayBienFormado(data)){
    return new Response(JSON.stringify({ message: 'json mal formado', status: 500 }));

  }

  const result = await actualizarProductos(data);

  if(result.length === 0){
    return new Response(JSON.stringify({ success: 'Actualizado', status: 201 }));
  }else{
    return new Response(JSON.stringify({ success: 'Actualizacion parcial', status: 207, result }));
  }

};
