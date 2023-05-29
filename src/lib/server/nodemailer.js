import nodemailer from 'nodemailer';

// create reusable transporter object using the default SMTP transport
export let transporter = nodemailer.createTransport({
	host: 'smtp.zoho.com',
	port: 465,
	secure: true, // true si uso puerto 465, falso para otros puertos
	auth: {
		user:'jovany.velez@zohomail.com', 
		pass: 'mILULU&.1' 
	}
});
