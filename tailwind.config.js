/** @type {import('tailwindcss').Config} */
export default {
	content: ['./src/**/*.{html,js,svelte,ts}'],
	theme: {
		extend: {}
	},
	daisyui: {
		themes: [
			{
				mytheme: {
					primary: '#0000FF',

					secondary: '#f000b8',

					accent: '#1dcdbc',

					neutral: '#2b3440',

					'base-100': '#ffffff',

					info: '#3abff8',

					success: '#36d399',

					warning: '#fbbd23',

					error: '#f87272'
				}
			}
		]
	},

	plugins: [require('daisyui')]
};
