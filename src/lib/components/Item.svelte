<script lang="ts">
	import ButonQuantity from '$lib/components/ButonQuantity.svelte';
	import type { Product } from '$lib/interfaces/Product';
	export let product: Product;
	const imgCloud = product.image[0].secureUrl;
	const imgServer = product.image[0].publicId.split('/').pop();
	export let nombre: string;
	export let images: string;
	export let user: number;
	//class="container1 no-select" style="--watermark-content: '{nombre}'"
</script>

<div class="flex flex-col items-center border-2 mb-4 mx-2 text-center w-72 bg-white rounded-xl shadow-lg
			{product.quantity <= 0?'opacity-50':''}">

	
	<img src={images === 'true' ? imgCloud : imgServer} alt="article" class="w-45" />

	<div>
		<small><span class="font-bold">code:</span> {product.code}-{user}</small>
		<p class="mx-2 text-sm font-bold">{product.name}</p>
		<p class="text-slate-700">
			<strong
				>{product.price[0].price1.toLocaleString('es-ES', { style: 'currency', currency: 'EUR' })}</strong
			>
		</p>
		<p><small class=''>{product.description}</small></p>
		<p class={product.quantity <= 0?'text-red-500':''}>disponible: {product.quantity}</p>
	</div>
	{#if product.quantity > 0}
		<div class="z-30">
			{#key product}
				<ButonQuantity product={{ ...product, qtyBuy: 0 }} mostrarCosto={false} />
			{/key}
		</div>
	{/if}
</div>

<!--style>
	.container1 {
  		position: relative;
	}

.container1::after {
  content: var(--watermark-content);
  z-index: 20;
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
</style-->
