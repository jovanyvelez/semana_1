import nodemailer from 'nodemailer';
import { env } from '$env/dynamic/private';

// create reusable transporter object using the default SMTP transport
export let transporter = nodemailer.createTransport({
	host: 'smtp.zoho.com',
	port: 465,
	secure: true, // true si uso puerto 465, falso para otros puertos
	auth: {
		user: env.MAIL_USER, 
		pass: env.MAIL_PASS 
	}
});
