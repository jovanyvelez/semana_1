import type { Actions } from '@sveltejs/kit';


export const load = async ({locals}) => {
	//todo
	const {discount, name} = locals.user
	return { discount, name };
};

export const actions: Actions = {
	default: async () => {
//
	}
};
