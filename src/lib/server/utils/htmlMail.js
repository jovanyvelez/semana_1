const detail = (productos) => {
    const chain = productos.reduce((acum,detalle) => {
      return acum  + `
      <div style="margin-top: 16px; margin-bottom: 16px; background-color: #f8fafc; box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -2px rgba(0, 0, 0, 0.1)">
        <p style="text-align: center; font-size: 18px; font-weight: 600">${detalle.producto.name}</p>
        <div style="margin-left: 40px; margin-right: 40px; font-size: 18px;">
          <div style="max-width: fit-content; border-radius: 6px">
            <span style="font-weight: 600;">Cantidad: </span> ${detalle.cantidad}
          </div>
          <div>
            <p><span>Total    : </span> ${(detalle.precio * detalle.cantidad).toLocaleString('en-US', {
              style: 'currency',
              currency: 'USD',
              precision: 2
              })}
            </p>
          </div>
        </div>
      </div>`
    }, "");
    return chain
  }
  
     
    export const htmlTable = (orden) => {
      const detalle = detail(orden.productos);
      const table = `
      <!DOCTYPE html>
      <html lang="en" xmlns:v="urn:schemas-microsoft-com:vml">
      <head>
        <meta charset="utf-8">
        <meta name="x-apple-disable-message-reformatting">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="format-detection" content="telephone=no, date=no, address=no, email=no, url=no">
        <meta name="color-scheme" content="light dark">
        <meta name="supported-color-schemes" content="light dark">
      
        <title>Confirm your order</title>
        <style>
          @media (max-width: 600px) {
            .sm-my-8 {
              margin-top: 32px !important;
              margin-bottom: 32px !important
            }
            .sm-px-4 {
              padding-left: 16px !important;
              padding-right: 16px !important
            }
            .sm-px-6 {
              padding-left: 24px !important;
              padding-right: 24px !important
            }
            .sm-leading-8 {
              line-height: 32px !important
            }
          }
        </style>
      </head>
      <body style="margin: 0; width: 100%; background-color: #f8fafc; padding: 0; -webkit-font-smoothing: antialiased; word-break: break-word">
        <div style="display: none">
          Equisol
          &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847; &#8199;&#65279;&#847;
        </div>
        <div role="article" aria-roledescription="email" aria-label="Confirm your email address" lang="en">
          <div class="sm-px-4" style="background-color: #f8fafc; font-family: ui-sans-serif, system-ui, -apple-system, 'Segoe UI', sans-serif">
            <table align="center" cellpadding="0" cellspacing="0" role="presentation">
              <tr>
                <td style="width: 552px; max-width: 100%">
                  <div class="sm-my-8" style="margin-top: 48px; margin-bottom: 48px">
                    <a href="https://equisol.com.co/">
                      <img src="https://equisol.com.co/wp-content/uploads/2022/08/cropped-18_LOGO_EQUISOL-19-1536x391.png" width="180" alt="Equisol" style="max-width: 100%; vertical-align: middle; line-height: 1; border: 0">
                    </a>
                  </div>
                  <table style="width: 100%;" cellpadding="0" cellspacing="0" role="presentation">
                    <tr>
                      <td class="sm-px-6" style="border-radius: 4px; background-color: #fff; padding: 48px; font-size: 16px; color: #334155; box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -2px rgba(0, 0, 0, 0.1)">
                        <h1 class="sm-leading-8" style="margin: 0 0 24px; text-align: center; font-size: 24px; font-weight: 600; color: #000">
                          Resúmen de la compra
                        </h1>
                        <h3 style="margin: 0; font-size: 16px; font-weight: 600; text-transform: uppercase; color: #475569">
                          Numero de orden de compra <span style="color: #3b82f6">${orden.id}</span>
                        </h3>
                        <h3>
                          ${orden.cliente.name}
                        </h3>
                        <p style="font-weight: 600;">
                          Dirección de Entrega:
                        </p>
                        <div style="margin-left: 40px; margin-right: 40px">
                          <p>
                            ${orden.direccionEntrega}
                          </p>
                          <p>
                            ${orden.notes}
                          </p>
                          <p>
                            ${orden.ciudadEnt}, ${orden.departamentoEnt}
                          </p>
                        </div>
                        <p>
                          <span style="font-weight: 600;">Telefono:</span>
                            ${orden.cliente.phone}
                        </p>
                        <p>
                          <span style="font-weight: 600;">Email:</span>
                            ${orden.cliente.email}
                        </p>
                      </td>
                    </tr>
                    <tr role="separator">
                      <td style="line-height: 32px">&zwj;</td>
                    </tr>
                    <tr>
                      <td class="sm-px-6" style="border-radius: 4px; background-color: #fff; padding: 48px; font-size: 16px; color: #334155; box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -2px rgba(0, 0, 0, 0.1)">
                        <h3 style="margin: 0; font-size: 16px; font-weight: 600; text-transform: uppercase; color: #475569;">
                          Resúmen de la orden
                        </h3>
                          ${detalle}
                        <div>
                          <span style="font-weight: 600;">Total Compra: ${orden.valor.toLocaleString('en-US', {
                            style: 'currency',
                            currency: 'USD',
                            precision: 2
                            })} </span>
                        </div>
                      </td>
                    </tr>
                    <tr role="separator">
                      <td style="line-height: 32px;">&zwj;</td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </div>
        </div>
      </body>
      </html>
      `;
    
      return table;
    };
    