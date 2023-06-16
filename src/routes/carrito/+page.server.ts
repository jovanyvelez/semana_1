import type { Actions } from '@sveltejs/kit';


export const load = async ({locals}) => {
	//todo
	const discount = locals.user.discount
	return { discount };
};

export const actions: Actions = {
	default: async () => {
//
	}
};
