import { env } from '$env/dynamic/private';
import { prisma } from '$lib/server/prisma';
import { transporter } from '$lib/server/nodemailer';
import { htmlTable } from '$lib/server/utils/htmlMail.js';

export async function load({ params, locals }) {

	//Get email from locals
	const {email} = locals.user;

	//Query order with the route parameter
	const orden = await prisma.OrdenDePedido.findUnique({
		where: { id: parseInt(params.orden, 10) },
		
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

	//transporter.sendMail in return object, for show quick the final order to the user
	try {
		return {
			envio: await transporter.sendMail({
				from: `"Equisol" ${env.MAIL_USER}`, // email address sender
				to: [`${orden.cliente.email}`, `${orden.cliente.asesor}`], // Email, client and seller
				subject: `Numero de orden de compra: ${orden.id}`, // Order number in a subject
				//text: `${JSON.stringify(orden,null,2)}`, // plain text body
				html: detalle, // html body
			}).messageId,
			orden
		}
	} catch (error) {
		if(!orden){
			return {error:"No se pudo crear la orden, Favor contactenos"}
		}
		console.log("Fallo en transporter.sendMail. El Correo no se envió")
		return {envio: "No fue posible enviar el email"}
	}
}
