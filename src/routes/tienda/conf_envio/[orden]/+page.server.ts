import { prisma } from '$lib/server/prisma';
import { transporter } from '$lib/server/nodemailer';
import { htmlTable } from '$lib/server/utils/htmlMail.js';

export async function load({ params, locals }) {

	const {email} = locals.user;
	console.log(email)
	const orden = await prisma.OrdenDePedido.findUnique({
		where: { id: parseInt(params.orden, 10) },
		include: {
			cliente: {
				select: {
					name: true,
					phone: true,
					email: true,
					discount:true,
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

	
	try {
		let info = await transporter.sendMail({
			from: '"Fred Foo 👻" jovany.velez@zohomail.com', // sender address
			to: `${orden.cliente.email}`, // list of receivers
			subject: `Numero de orden de compra: ${orden.id}`, // Subject line
			//text: `${JSON.stringify(orden,null,2)}`, // plain text body
			html: detalle, // html body
		});

		console.log("Message sent: %s", info.messageId);

    } catch (error) {
        console.log(error)
    }
	return { orden };
}
