const detail = ( productos )=>{
    //
    const chain = productos.reduce((acum,detalle) => {
        return acum + `<tr>
        <td>${detalle.producto.name}</td>
        <td>${detalle.cantidad}</td>
        <td>${detalle.precio}</td>
      </tr>`
    },"");
    return chain;
}


export const htmlTable = (productos) => {
    const detalle = detail(productos);
    const table = `
      <html>
          <head>
              <style>
                  @media screen and (max-width: 600px) {
                      table {
                          width: 100%;
                      }    
                      table thead {
                          display: none;
                      }
                      table tbody td {
                          display: block;
                          text-align: center;
                      }
                      table tbody td:before {
                          content: attr(data-label);
                          font-weight: bold;
                          display: block;
                      }
                  }
              </style>   
          </head>
  
          <body>
              <table>
              <thead>
                  <tr>
                  <th>Nombre</th>
                  <th>Cantidad</th>
                  <th>Valor</th>
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
  }
