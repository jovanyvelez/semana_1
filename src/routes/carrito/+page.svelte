<script lang="ts">
	import ButonQuantity from '$lib/components/ButonQuantity.svelte';
	import { jovanyActions } from '$lib/jovanyActions';
	import { cart } from '$lib/stores/stores';
	import { goto } from '$app/navigation';


	export let data;

	let empty: boolean = false;

	let resum: { total: number; items: number };

	$cart.length > 0 ? (empty = false) : (empty = true);

	$: if ($cart.length == 0) {
		empty = true;
	}

	$: $cart,
		(resum = {
			total: $cart.reduce(
				(a, c) => a + c.qtyBuy * c.price[0].price1 * (1 - data.discount / 100),
				0
			),
			items: $cart.reduce((a, c) => a + c.qtyBuy, 0)
		});
</script>
<h1 class="my-16 text-center">TU CARRITO</h1>
{#if !empty}
	<div class="flex flex-col md:flex-row w-10/12 mx-auto">
		<div class="">
			{#each $cart as product (product.id)}
				<div
					class="flex flex-col border border-primary my-2 rounded-lg w-full"
				>
					<small class="text-left font-bold mx-4 mt-2">{product.name}</small>

					<div class="flex items-center">
						<div class="flex items-center mr-3">
							<img src={product.image[0].secureUrl} alt="product" class="w-32 mb-2 mx-3" />
							<ButonQuantity {product} />
						</div>

						<div class="relative mx-5">
							<div class="z-100">
								<p>{(product.price[0].price1).toLocaleString('es-ES', { style: 'currency', currency: 'COP' })}</p>
							</div>
							<div
								class="absolute bottom-0 left-1/2 transform -translate-x-1/2 -rotate-90 translate-y-1/3 z-50"
							>
								<p class="text-sm font-bold text-blue-200 text-opacity-95">
									{data.name}
								</p>
							</div>
						</div>
					</div>
				</div>
			{/each}
		</div>
		<div class="flex flex-col mx-auto justify-center ">
			<!--span use:jovanyActions={`Items(${resum.items}) `} /-->
			{#key resum}
				<h1 class="text-sm md:text-3xl"><span class="text-blue-500">Total de equipos:</span> {resum.items}</h1>
				<h1 class="text-sm md:text-3xl"><span class="text-blue-500">Valor:</span> {(resum.total).toLocaleString('es-ES', { style: 'currency', currency: 'COP' })}</h1>	
			{/key}
		</div>
	</div>

	<div class="flex flex-wrap justify-center">
		<button on:click={() => goto('/tienda/address')} type="submit" class="btn btn-primary btn-wide"
			>Hacer compra</button
		>
	</div>
{:else}
	<span class="mr-2">No has hecho compras</span>
	<a href="/" class="text-blue-500">Regresar a la tienda</a>
{/if}
