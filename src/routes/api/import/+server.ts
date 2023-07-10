

export const PUT = async ({request}:{request:Request}):Promise<Response> => {
    
    const temporal = await request.json();
  
    console.log (temporal)
  
    return new Response(
      JSON.stringify({success:'Ok Muchacho', resultado: 'todo muy bien'}),
        { status:201 }
    )
  }