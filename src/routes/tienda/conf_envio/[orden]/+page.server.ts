import { prisma } from '$lib/server/prisma';
import { transporter } from '$lib/server/nodemailer';

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
			productos: true
		}
	});

    try {
        await transporter.sendMail({
            from: '"Equisol" SOPORTE.TI@EQUISOL.COM.CO', // sender address
            to: "jovany.velez@gmail.com, spvergara@gmail.com", // list of receivers
            subject: "Hello ✔", // Subject line
            text: "Hello world?", // plain text body
            html: "<b>Hello world?</b>", // html body
          });
    } catch (error) {
        console.log(error)
    }

	return { orden };
}
