
export const POST = async ({request}:{request:any}):Promise<Response> => {
    
    const temporal = await request.json();
  
    console.log (temporal)
  
    return new Response(
      JSON.stringify({success:'Ok Muchacho', resultado: 'todo muy bien'}),
        { status:201 }
    )
  }