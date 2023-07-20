<script lang="ts">
	import ButonQuantity from '$lib/components/ButonQuantity.svelte';
	import { cart } from '$lib/stores/stores';
	import { goto } from '$app/navigation';


	export let data;

	let empty: boolean = false;
	let yes = false;
	let resum: { total: number; items: number };

	const outOfCart = (product:string) => {
		const index = $cart.findIndex((x) => x.id === product);
		$cart.splice(index, 1);
		$cart = $cart;
	};

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
<div class="grid grid-cols-1 sm:grid-cols-4 mx-5 sm:mx-10 lg:mx-36 my-5">
	<div class="flex justify-center items-center"></div>
	<div class="hidden sm:block text-center font-semibold">Precio</div>
	<div class="hidden sm:block text-center font-semibold">Cantidad</div>
	<div class="hidden sm:block text-center font-semibold">Total</div>
	{#each $cart as product (product.id)}
		<div class="divider sm:col-span-4 mx-10"></div>
		<div class="flex flex-col items-center justify-center">
			<img src={product.image[0].secureUrl} alt="product" class="w-20 mb-2 mx-3" />
			<div class="flex">
				<button on:click={() => outOfCart(product.id)}>
					<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" viewBox="0 0 72 72"><g transform="translate(72 0) scale(-1 1)"><path fill="#D0CFCE" d="M15.076 12.068v5.951h35.745l.644-5.951zm6.833 42.621l.5 5.282h21.518l.592-5.282z"/><path fill="#9B9B9A" d="M42.096 60.178h7.323l.515-5.731h-7.238zm14.433-47.89h-7.59l-.628 5.613h8.218z"/><g fill="none" stroke="#000" stroke-miterlimit="10"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m21.38 50.393l-3.607-28.381m36.49-.029l-3.757 28.395m-9.93-28.289l8.173 10.02M30.417 22.13l17.152 20.642M22.352 24.253l21.864 26.172M23.902 36.996L35.928 50.63m-10.611-1.234l1.363 1.357m-3.452-19.519l8.585-9.131M24.61 41.882L42.853 22.13m-15.968 28.5l22.497-23.915M36.574 50.63l11.543-11.946m-3.901 12.069l2.127-1.793M14.905 12.028H56.95v5.946H14.905z"/><path d="M42.853 54.404h7.271"/><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m50.124 54.404l-.708 5.562H22.43l-.681-5.562h28.375"/></g></g></svg>
				</button>
				<p class="font-bold mx-4 mt-2 text-center">{product.name}</p>
			</div>
		</div>
		<div class="flex justify-center items-center">
			${(product.price[0].price1).toLocaleString()}
		</div>
		<div class="flex flex-col justify-center items-center">
			<ButonQuantity {product} />
		</div>
		<div class="flex justify-center items-center">
			${(product.price[0].price1*product.qtyBuy).toLocaleString()}
		</div>
		<div class="divider  mx-10  sm:col-span-4"></div>
	{/each}
</div>

<div class="flex justify-end mx-5 sm:mx-16 lg:mx-36 my-0">
	<div class="flex flex-col mr-10 text-end">
		{#key resum}
			<h1 class="text-slate-500 text-sm lg:text-lg">SUBTOTAL: ${(resum.total).toLocaleString()}</h1>	
		{/key}
		<h1 class="text-slate-400 text-sm lg:text-lg">
			Iva incluido. Envío y descuentos agregados en el checkout
		</h1>
		<div class="flex justify-end">
			<label class="label cursor-pointer">
				<input type="checkbox" bind:checked={yes}  class="checkbox mr-1" />
				<span class=" font-semibold text-slate-400 text-sm lg:text-lg">Acepto los terminos y condiciones</span> 
			</label>
		</div>
	</div>
</div>

<div class="flex flex-wrap justify-around my-5">
	<a href='/tienda/' type="submit" class="btn btn-outline btn-primary btn-wide"
		>SEGUIR COMPRANDO</a
	>
	<button on:click={() => goto('/tienda/address')} type="submit" class="btn btn-primary btn-wide {!yes? 'btn-disabled ':''}"
		>CHECKOUT</button
	>
</div>

{:else}
	<span class="mr-2">No has hecho compras</span>
	<a href="/" class="text-blue-500">Regresar a la tienda</a>
{/if}




