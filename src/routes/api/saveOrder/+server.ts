import { prisma } from '$lib/server/prisma';
export const GET = async ({ url }: { url: any }): Promise<Response> => {
	
  function formatDate(date) {
    const day = date.getDate().toString().padStart(2, '0');
    const month = (date.getMonth() + 1).toString().padStart(2, '0');
    const year = date.getFullYear().toString();
    return `${day}/${month}/${year}`;
  }

  function formatProducts(product) {
    const products = product.map(e => {
      const data = { CodCC: e.ccosto,
                     CodProducto: e.producto.code,
                     ValorUnitario:e.precio*(1-e.producto.tax/100),
                     Cantidad: e.cantidad,
                     Iva: e.producto.tax}
      return data;  
    })
    return products;
  }
  
  const orders = await prisma.ordenDePedido.findMany({
		where: { Procesado: false },
		select: { id: true,
              Procesado: true, 
              updatedAt: true,
              cliente:{
                select:{
                  numDoc: true
                }
              },
              codVendedor: true,
              direccionEntrega:true,
              notes: true,
              codMunicipio: true,
              productos:{
                select: {
                  ccosto: true,
                  producto:{
                    select:{code:true,
                            tax:true}
                  },
                  precio:true,
                  cantidad:true,
                }
              }
              }
	});

  const result = orders.map(e => {
    const data = {Procesado: e.Procesado,
                  FechaDocumento: formatDate(e.updatedAt),
                  Pedido: e.id,
                  Nit: e.cliente.numDoc,
                  Dv: e.cliente.numDoc.slice(-1),
                  CodVendedor: e.codVendedor,
                  DireccionEnvio: e.direccionEntrega + ', ' + e.notes,
                  CiudadEnvio: e.codMunicipio,
                  Productos: formatProducts(e.productos)   
    }
    return data
  })

 	console.dir(orders, { depth: Infinity });

	return new Response(JSON.stringify(result), { status: 201 });
};
