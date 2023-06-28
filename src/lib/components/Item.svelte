<script lang="ts">
	import ButonQuantity from '$lib/components/ButonQuantity.svelte';
	import type { Product } from '$lib/interfaces/Product';
	export let product: Product;
	const imgCloud = product.image[0].secureUrl;
	const imgServer = product.image[0].publicId.split('/').pop();
	console.log(imgServer)
	export let nombre:string 
	export let images:string
	console.log(product)
	//class="container1 no-select" style="--watermark-content: '{nombre}'"
</script>

<div class="flex flex-col items-center border-2 mb-4 mx-2 text-center w-72 bg-white">
	<img src={ images==='true' ? imgCloud : imgServer } alt="article" class="w-45" />
	
	
	<div class="container1 no-select" style="--watermark-content: '{nombre}'">	
		<small><span class="font-bold">code:</span> {product.code}</small>
		<p class="">{product.name}</p>
		<p class="text-slate-700"><strong>${product.price[0].price1.toLocaleString('es-CO', { currency: 'COP', minimumFractionDigits: 2, maximumFractionDigits: 2 })}</strong></p>
		<p><small class="font-semibold">{product.description}</small></p>
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