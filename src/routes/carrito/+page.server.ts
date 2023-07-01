import { redirect, type Actions } from '@sveltejs/kit';


export const load = async ({locals}) => {
	
	const user =  locals.user;

	if(!user) throw redirect(303, '/login');
	const {discount, name} = locals.user
	return { discount, name };
};

export const actions: Actions = {
	default: async () => {
//
	}
};
