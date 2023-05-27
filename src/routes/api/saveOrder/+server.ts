
export const GET = async ({url}:{url:any}):Promise<Response> => {
   

  let myDepartment = String(url.searchParams.get('orden')).trim();
  console.log(myDepartment)


return new Response(
  JSON.stringify(myDepartment),
    { status:201 }
)
}