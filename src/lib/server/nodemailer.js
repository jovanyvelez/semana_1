import nodemailer from 'nodemailer';
import { env } from '$env/dynamic/private';


export let transporter = nodemailer.createTransport({
	host: env.NODE_MAILER_HOST,
	port: parseInt(env.NODE_MAILER_PORT),
	secure: false, // true si uso puerto 465, falso para otros puertos
	auth: {
		user: env.NODE_MAILER_USER, 
		pass: env.NODE_MAILER_PASS
	}
});

