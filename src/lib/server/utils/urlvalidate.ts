export const urlMain = () => {
	const current = new Date();
	const limit = new Date('2023-12-01');
	if (current >= limit) {
		return {
			appkey: true,
			text: '404. Not found',
			status: { status: 404, statusText: 'page not found' }
		};
	}else{
        return {appkey:false}
    }
};
