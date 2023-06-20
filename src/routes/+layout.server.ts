
export const load = async ({locals}) => {

	const user =  locals.user;
	console.log(user)
	
	if(user){
		return { email: user.email, role: user.role.name };
	}
	return {}
};
