import { prisma } from '$lib/server/prisma';
import { transporter } from '$lib/server/nodemailer';
import { htmlTable } from '$lib/server/utils/htmlMail.js';

export async function load({ params, locals }) {

	const {email} = locals.user;

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

	//Solo mostramos ordenes del usuario registrado
	
	if(email !== orden.cliente.email) return { }

	const detalle = htmlTable(orden)

	/*let correo;
	try {
		let info = await transporter.sendMail({
			from: '"Equisol" jovany.velez@zohomail.com', // direccion de quien envía
			to: [`${orden.cliente.email}`, `${orden.cliente.asesor}`], // direcciones de quien recibe
			subject: `Numero de orden de compra: ${orden.id}`, // 
			//text: `${JSON.stringify(orden,null,2)}`, // plain text body
			html: detalle, // html body
		});

		correo = info.messageId;
		console.log("Message sent: %s", correo);

    } catch (error) {
        console.log(error)
    }
	return { orden, envio:correo };*/

	return {//Vemos que pasa con esto
		orden,
		envio: await transporter.sendMail({
			from: '"Equisol" jovany.velez@zohomail.com', // direccion de quien envía
			to: [`${orden.cliente.email}`, `${orden.cliente.asesor}`], // direcciones de quien recibe
			subject: `Numero de orden de compra: ${orden.id}`, // 
			//text: `${JSON.stringify(orden,null,2)}`, // plain text body
			html: detalle, // html body
		}).messageId
	}//Hastaaquí el ensayo
}
