import nodemailer from 'nodemailer';

// create reusable transporter object using the default SMTP transport
export let transporter = nodemailer.createTransport({
	host: 'smtp.office365.com',
	port: 587,
	secure: false, // true for 465, false for other ports
	auth: {
		user:'SOPORTE.TI@EQUISOL.COM.CO', // generated ethereal user
		pass: 'Equisol.2022*' // generated ethereal password
	}
});
