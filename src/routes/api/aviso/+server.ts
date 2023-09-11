import { env } from '$env/dynamic/private';
import fs from 'fs-extra'
export const GET = async (): Promise<Response> => {
	
  let buffer;
   
    // Read the contents of a file into a Buffer
      if(env.NODE_ENV === "development"){
        buffer = fs.readFileSync('static/AVISO.pdf');
      } else{
				buffer = fs.readFileSync('build/client/AVISO.pdf');
			}
      
    
    return new Response(buffer, {
		headers: {
			'Content-type': 'application/pdf',
			'Content-Disposition': 'attachment; filename=aviso_privacidad.pdf',
		},
	})

};