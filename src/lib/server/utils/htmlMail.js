const detail = (productos) => {
    
    const chain = productos.reduce((acum, detalle) => {
      return acum + `<tr>
        <td data-label="Nombre"><strong>${detalle.producto.name}</strong></td>
        <td data-label="Cantidad">${detalle.cantidad}</td>
        <td data-label="Valor">$ ${detalle.precio}</td>
        <td data-label="Total">$ ${detalle.precio * detalle.cantidad}</td>
      </tr>`;
    }, "");
    return chain;
  };
  
  export const htmlTable = (orden) => {
    const detalle = detail(orden.productos);
    const table = `
      <html>
        <head>
          <style>
            table {
              width: 100%;
              border-collapse: collapse;
            }
  
            th, td {
              border: 1px solid #ddd;
              padding: 8px;
              text-align: left;
            }
  
            th {
              background-color: #f2f2f2;
            }
  
            @media screen and (max-width: 360px) {
              table {
                border: none;
              }
  
              table thead {
                display: none;
              }
  
              table tbody td {
                display: block;
                border: none;
                position: relative;
                padding-left: 50%;
                text-align: center;
              }
  
              table tbody td:before {
                content: attr(data-label);
                font-weight: bold;
                position: absolute;
                left: 0;
                top: 0;
                width: 50%;
                padding-left: 8px;
                box-sizing: border-box;
              }
            }
          </style>
        </head>
        <body>
        <h1>Este es tu numero de orden de compra:  <span class="font-bold">${orden.id}</span></h1>
        <h3>${orden.cliente.name}</h3>
        <p><strong>Direccion de Entrega:</strong> ${orden.direccionEntrega}  ${orden.ciudadEnt}, ${orden.departamentoEnt}</p>
        <p><strong>Notas:</strong> ${orden.notes}</p>
        <p><strong>Teléfono:</strong> ${orden.cliente.phone}</p>
        <p><strong>Email:</strong> ${orden.cliente.email}</p>
        <p><strong>Valor:</strong> ${orden.valor}</p>
        <br/>
          <table>
            <thead>
              <tr>
                <th>Nombre</th>
                <th>Cantidad</th>
                <th>Valor</th>
                <th>Total</th>
              </tr>
            </thead>
            <tbody>
              ${detalle}
            </tbody>
          </table>
        </body>
      </html>
    `;
  
    return table;
  };
  