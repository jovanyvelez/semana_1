
import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

async function guardarOrdenDePedido(ordenDePedidoData) {
  const { clienteId, direccionEntrega, productos } = ordenDePedidoData

  // Crear la orden de pedido
  const ordenDePedido = await prisma.ordenDePedido.create({
    data: {
      clienteId,
      direccionEntrega,
      productos: {
        // Crear los productos asociados a la orden de pedido
        create: productos.map(producto => ({
          productoId: producto.productoId,
          cantidad: producto.cantidad,
          precio: producto.precio,
          producto: { connect: { id: producto.productoId } }
        }))
      }
    }
  })

  return ordenDePedido
}

// Ejemplo de uso
guardarOrdenDePedido({
  clienteId: 1,
  direccionEntrega: "Calle Falsa 123",
  productos: [
    { productoId: "1", cantidad: 2, precio: 10.99 },
    { productoId: "2", cantidad: 1, precio: 25.99 }
  ]
}).then(console.log).catch(console.error).finally(() => prisma.disconnect())