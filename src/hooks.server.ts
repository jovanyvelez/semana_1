import type { Handle } from '@sveltejs/kit';

import { authtenticateUser } from '$lib/server/utils/auth';
import { urlMain } from '$lib/server/utils/urlvalidate';

export const handle: Handle = async ({ event, resolve}) => {

	event.locals.user = await authtenticateUser(event);

	// Apply CORS header for API routes
	if (event.url.pathname.startsWith('/api/import')) {
		// Required for CORS to work
		if (event.request.method === 'OPTIONS') {
			return new Response(null, {
				headers: {
					'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, PATCH, OPTIONS',
					'Access-Control-Allow-Origin': '*',
					'Access-Control-Allow-Headers': '*'
				}
			});
		}
	}

	const response = await resolve(event);

	if (event.url.pathname.startsWith('/api/import')) {
		response.headers.append('Access-Control-Allow-Origin', `*`);
	}

	const appData = urlMain();

	if (appData.appkey) {
		return new Response(appData.text, appData.status);
	}
	return response;
};
