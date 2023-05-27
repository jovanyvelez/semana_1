
export const GET = async ({url,request}:{url:any, request:any}):Promise<Response> => {
   
      const response = await fetch('https://www.datos.gov.co/resource/xdk5-pm3f.json?$select=departamento,c_digo_dane_del_departamento&$order=departamento%20ASC&$group=departamento,c_digo_dane_del_departamento');
      const data = await response.json();

    
    //console.log(data);
  
    return new Response(
      JSON.stringify(data),
        { status:201 }
    )
  }