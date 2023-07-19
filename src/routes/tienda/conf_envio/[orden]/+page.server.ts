import { env } from '$env/dynamic/private';
import { prisma } from '$lib/server/prisma';
import { transporter } from '$lib/server/nodemailer';
import { htmlTable } from '$lib/server/utils/htmlMail.js';
import { redirect } from '@sveltejs/kit';

export async function load({ params, locals }) {

	
	const user = locals.user
	if(!user) throw redirect(302,'/')
	
	//Get email from locals
	const {email} = locals.user;
	const ordenNumber = parseInt(params.orden, 10);
	console.log(typeof ordenNumber)
	//Query order with the route parameter
	const orden = await prisma.OrdenDePedido.findUnique({
		where: { id: ordenNumber },
		
		include: {
			cliente: {
				select: {
					name: true,
					phone: true,
					email: true,
					discount:true,
					asesor:true
				}
			},


			productos:{
				include:{
					producto:{
						select:{
							name:true
						}
					}
				}
			},

		}
	});

	//If user not auth
	
	if(email !== orden.cliente.email) return { error: 'User not found' }

	//detalle is a function that grab the html to send in the email body
	const detalle = htmlTable(orden)

	
	//transporter.sendMail in return	 object, for show quick the final order to the user
		return {
			orden, envio: await transporter.sendMail({
				from: `"Equisol" ${env.NODE_MAILER_USER}`, // email address sender
				to: [`${orden.cliente.email}`, `${orden.cliente.asesor}`], // Email, client and seller
				subject: `Numero de orden de compra: ${orden.id}`, // Order number in a subject
				//text: `${JSON.stringify(orden,null,2)}`, // plain text body
				html: detalle, // html body
			}) 
		}
}
