
export const load = async ({locals}) => {

	const user =  locals.user;
	
	if(user){
		return { email: user.email, role: user.role.name, nombre: user.name };
	}
	return {}
};
