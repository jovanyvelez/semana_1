<script>
	export let data;
	const { orden, envio, } = data;
</script>


{#await data.envio}
	<h3 class="text-warning">Un momento por favor</h3>
{:then envio}
	{#if orden}
		<div class="flex flex-col mx-auto md:ml-5 p-5 w-11/12 md:w-2/3 md:border m-2">
			<div class="text-center font-semibold bg-gray-100">
				Este es tu numero de orden de compra: <span class="font-bold" />
				{orden.id}
			</div>
			<h3>{orden.cliente.name}</h3>
			<p>
				Direccion de Entrega: {orden.direccionEntrega}
				{orden.ciudadEnt}, {orden.departamentoEnt}
			</p>
			<p>{orden.notes}</p>
			<p>Teléfono: {orden.cliente.phone}</p>
			<p>Email: {orden.cliente.email}</p>
		</div>

		<div class="p-5  mx-5">
			<div class="overflow-auto rounded-lg shadow hidden md:block">
				<table class="w-full">
					<thead class="bg-gray-100 border-b-2 border-gray-200">
						<tr>
							<th class="p-3 text-sm font-semibold tracking-wide text-left">Producto</th>
							<th class="w-24 p-3 text-sm font-semibold tracking-wide text-left">Precio</th>
							<th class="w-24 p-3 text-sm font-semibold tracking-wide text-left">Iva</th>
							<th class="w-24 p-3 text-sm font-semibold tracking-wide text-left">Cantidad</th>
							<th class="w-32 p-3 text-sm font-semibold tracking-wide text-left">Total</th>
						</tr>
					</thead>
					<tbody class="divide-y divide-gray-100">
						{#each orden.productos as producto, i}
							<tr class:bg-white={i % 2 === 0} class:bg-gray-50={i % 2 !== 0}>
								<td class="p-3 text-sm text-gray-700 whitespace-nowrap">
									{producto.producto.name}
								</td>
								<td class="p-3 text-sm text-gray-700 whitespace-nowrap">
									{(producto.precio/(1+producto.producto.tax/100)).toLocaleString('es-CO', { style: 'currency', currency: 'COP' })}
								</td>
								<td class="p-3 text-sm text-gray-700 whitespace-nowrap">
									{((producto.precio/(1+producto.producto.tax/100))*(producto.producto.tax/100)).toLocaleString('es-CO', { style: 'currency', currency: 'COP' })}
								</td>
								<td class="p-3 text-sm text-gray-700 whitespace-nowrap"
									>{producto.cantidad}</td
								>
								<td class="p-3 text-sm text-gray-700 whitespace-nowrap"
									>{(producto.precio * producto.cantidad).toLocaleString('es-CO', { style: 'currency', currency: 'COP' })}</td
								>
							</tr>
						{/each}
						<tr>
							<th />
							<td />
							<td />
							<td class="p-3 text-sm text-gray-700 whitespace-nowrap font-semibold">Total</td>
							<td class="p-3 text-sm text-gray-700 whitespace-nowrap font-semibold"
								>{orden.valor.toLocaleString('es-CO', { style: 'currency', currency: 'COP' })}</td
							>
						</tr>
					</tbody>
				</table>
			</div>

			<h2 class="text-lg md:hidden">Resumen de Pedido</h2>
			<div class="grid grid-cols-1 sm:grid-cols-2 gap-4 md:hidden">
				{#each orden.productos as producto, i}
					<div class="bg-white space-y-3 p-4 rounded-lg shadow-md">
						<div class="text-sm text-primary text-center">{producto.producto.name}</div>
						<div class="text-sm font-medium text-black">
							Precio: {(producto.precio/(1+producto.producto.tax/100)).toLocaleString('es-CO', { style: 'currency', currency: 'COP' })}
						</div>
						<div class="text-sm font-medium text-black">
							Iva: {((producto.precio/(1+producto.producto.tax/100))*(producto.producto.tax/100)).toLocaleString('es-CO', { style: 'currency', currency: 'COP' })}
						</div>
						<div class="text-sm font-medium text-black">
							Cantidad: {producto.cantidad}
						</div>
						<div class="text-sm font-medium text-black">
							Total: {(producto.precio * producto.cantidad).toLocaleString('es-CO', { style: 'currency', currency: 'COP' })}
						</div>
					</div>
				{/each}
			</div>
			<div class="flex md:hidden my-5 ">
				<span class="font-semibold mr-1">El valor total de tu orden es de: </span> {orden.valor.toLocaleString('es-CO', { style: 'currency', currency: 'COP' })}
			</div>
		</div>
	{:else}
		<p>Numero de orden no existe</p>
	{/if}
{/await}
<h1 class="text-slate-400 text-sm lg:text-lg text-center">
	Iva incluido. Envío y descuentos agregados en el checkout
</h1>
<div class="flex justify-center btn btn-primary w-1/12 mx-auto"><a href="/" class="mx-auto">Volver al comercio</a></div>
