import { env } from '$env/dynamic/private';
import fs from 'fs-extra'
export const GET = async (): Promise<Response> => {
	
  let buffer;
   
    // Read the contents of a file into a Buffer
      if(env.NODE_ENV === "development"){
        buffer = fs.readFileSync('static/DISCLAIMER.pdf');
      } else{
				buffer = fs.readFileSync('build/client/DISCLAIMER.pdf');
			}
      
    
    return new Response(buffer, {
		headers: {
			'Content-type': 'application/pdf',
			'Content-Disposition': 'attachment; filename=disclaimer.pdf',
		},
	})

};