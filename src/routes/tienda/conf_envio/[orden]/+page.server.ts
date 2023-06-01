import { prisma } from '$lib/server/prisma';
import { transporter } from '$lib/server/nodemailer';
import { htmlTable } from '$lib/server/utils/htmlMail.js';

export async function load({ params }) {
	const orden = await prisma.OrdenDePedido.findUnique({
		where: { id: parseInt(params.orden, 10) },
		include: {

			cliente: {
				select: {
					name: true,
					phone: true,
					email: true
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
			}

		}
	});

	const detalle = htmlTable(orden.productos)

	console.log(`${JSON.stringify(orden,null,2)}`)
	
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
