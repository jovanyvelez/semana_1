
export const load = async ({locals}) => {

	const user =  locals.user;

	console.log(user);
	console.log("en layout load function")
	
	if(user){
		return { email: user.email, role: user.role.name };
	}
	return {}
};
