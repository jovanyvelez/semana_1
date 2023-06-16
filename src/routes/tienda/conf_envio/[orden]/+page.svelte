<script>
	export let data;
	const { orden } = data;
</script>

{#if orden}
	
<h1>Este es tu numero de orden de compra:  <span class="font-bold" /> {orden.id}</h1>

<h3>{orden.cliente.name}</h3>
<p>Direccion de Entrega: {orden.direccionEntrega}  {orden.ciudadEnt}, {orden.departamentoEnt}</p>
<p>{orden.notes} </p>
<p>Teléfono: {orden.cliente.phone}</p>
<p>Email: {orden.cliente.email}</p>

<div class="overflow-x-auto flex flex-wrap justify-center">
	<table class="table flex">
		<thead>
			<tr class="bg-red-500">
				<th>Producto</th>
				<th>Cantidad</th>
				<th>Precio</th>
				<th>Total</th>
			</tr>
		</thead>
		<tbody>
			{#each orden.productos as producto (producto.productoId)}
				<tr>
					<th>{producto.producto.name}</th>
					<td>{producto.cantidad}</td>	
					<td>{producto.precio}</td>
					<td>{producto.precio*producto.cantidad}</td>
				</tr>
			{/each}
				<tr>
					<th></th>
					<td></td>	
					<td>Total</td>
					<td>{orden.valor}</td>
				</tr>
		</tbody>
	</table>
</div>
{:else}
<p>Numero de orden no existe</p>
{/if}