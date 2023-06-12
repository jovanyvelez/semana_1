
export const load = async ({locals}) => {

	const user =  locals.user;
	
	if(user){
		return { user };
	}
	return {}
};
