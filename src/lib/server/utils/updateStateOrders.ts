import { prisma } from '$lib/server/prisma';

interface Orden {
    id: number;
  }

export const updateOrders = async (orders:Orden[]) => {
	const noUpdateOrders = [];

	for (const order of orders) {
		const id = order.id;

        if (id) {
			const existeOrden = await prisma.OrdenDePedido.findFirst({ where: { id } });

			if (existeOrden) {

				try {
					// Actualizar el campo "Procesado" a true
                    await prisma.OrdenDePedido.update({
                        where: { id },
                        data: { Procesado: true },
                      });
                      console.log(`Orden de Pedido con id ${id} actualizada correctamente.`);
				} catch (error) {
					console.error(`Error al actualizar la orden ${id}:`, error);
					noUpdateOrders.push(order);
				}
			} else {
				console.log(
					`La orden ${id} no existe en la base de datos. No se pudo actualizar.`
				);
				noUpdateOrders.push(order);
			}
		}else{
			noUpdateOrders.push(order)
		}
	}
	prisma.$disconnect();
	return noUpdateOrders;
};