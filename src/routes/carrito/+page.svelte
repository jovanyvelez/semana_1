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
	<div class="flex flex-col justify-center mx-10">
		{#each $cart as product (product.id)}
			<div class="flex items-center">
				<img src={product.image[0].secureUrl} alt="product" class="w-32 mb-2 mr-3" />
				<div class="container1 no-select " style="--watermark-content: '{data.name}'">
					<ButonQuantity {product} mostrarCosto={true} />
				</div>
			</div>
		{/each}
		<div >
			<span use:jovanyActions={`Items(${resum.items}) `} />
			<span>Valor Total: </span>
			<span use:jovanyActions={`$${resum.total}`} />
		</div>
	</div>
	<div class="flex flex-wrap justify-center">

			<button on:click={()=>alert("revisando servidor de correo")} type="submit" class="btn btn-primary btn-wide">Hacer compra</button>

	</div>
{:else}
	<span class="mr-2">No has hecho compras</span>
	<a href="/" class="text-blue-500">Regresar a la tienda</a>
{/if}


<style>
	.container1 {
  		position: relative;
	}

.container1::after {
  content: var(--watermark-content);
  z-index: 9999;
  position: absolute;
  bottom: 0;
  left: 50%;
  transform: translateX(-50%);
  font-size: 0.9em;
  font-weight: bold;
  color: rgba(3, 28, 39, 0.4);
}

.no-select {
  user-select: none;
}
</style>