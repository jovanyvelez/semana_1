<script lang="ts">
	import ButonQuantity from '$lib/components/ButonQuantity.svelte';
	import type { Product } from '$lib/interfaces/Product';
	export let product: Product;
	export let nombre:string 
	//class="container1 no-select" style="--watermark-content: '{nombre}'"
</script>

<div class="flex flex-col items-center border-2 mb-4 mx-2 text-center w-72 bg-white">
	<img src={ product.image[0].secureUrl } alt="article" class="w-45" />
	
	
	<div class="container1 no-select" style="--watermark-content: '{nombre}'">
		<p class="">{product.name}</p>
		<p class=""><strong>${product.price[0].price1}</strong></p>
		<p>disponible: {product.quantity}</p>
	</div>
	
	{#key product}
		<ButonQuantity product = {{...product, qtyBuy:0}} mostrarCosto={false}/>
	{/key}
	</div>

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
  transform: translateX(-50%) rotate(-90deg);
  font-size: 1.5em;
  font-weight: bold;
  color: rgba(7, 16, 97, 0.4);
}

.no-select {
  user-select: none;
}
</style>