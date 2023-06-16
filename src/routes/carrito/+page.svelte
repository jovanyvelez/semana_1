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
			total: $cart.reduce((a, c) => a + (c.qtyBuy * c.price[0].price1)*(1-(data.discount)/100), 0),
			items: $cart.reduce((a, c) => a + c.qtyBuy, 0)
		}); 
</script>

{#if !empty}
	<div class="flex flex-col justify-center">
		{#each $cart as product (product.id)}
			<div class="flex items-center">
				<img src={product.image[0].secureUrl} alt="product" class="w-32 mb-2 mr-3" />
				<ButonQuantity {product} mostrarCosto={true} />
			</div>
		{/each}
		<div>
			<span use:jovanyActions={`Items(${resum.items}) `} />
			<span>Valor Total: </span>
			<span use:jovanyActions={`$${resum.total}`} />
		</div>
	</div>
	<div class="flex flex-wrap justify-center">

			<button on:click={()=>goto('/tienda/address')} type="submit" class="btn btn-warning btn-wide">Hacer compra</button>

	</div>
{:else}
	<span class="mr-2">No has hecho compras</span>
	<a href="/" class="text-blue-500">Regresar a la tienda</a>
{/if}
