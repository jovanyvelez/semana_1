<script lang="ts">
	import { cart } from '$lib/stores/stores.js';
	import { jovanyActions } from '$lib/jovanyActions';
	
	import type { ProductStore } from '$lib/interfaces/Product';

	export let product: ProductStore;

	export let mostrarCosto: boolean = false;

	let mProduct = product;
	let item: ProductStore;
	let quantity = 0;
	let show = true;
	let disabled = false; //para habilitar o desabilitar el boton '+' del componente
	
	$: cost = quantity * product.price[0].price1;

	const addToCart = (product: ProductStore) => {
		if(product.quantity === 0)return;
		const index = $cart.findIndex((x) => x.id === product.id);
		
		if (index < 0) {
			item = { ...product, qtyBuy: 1 };
			$cart = [...$cart, item];
			show = false;
		} else {
			console.log($cart[index].qtyBuy)
			if($cart[index].qtyBuy===$cart[index].quantity) {
				disabled = true; 
				return
			} //No permite comprar mas de lo que tenemos
			$cart[index].qtyBuy += 1;
			if($cart[index].qtyBuy==$cart[index].quantity) disabled = true; //No permite comprar mas de lo que tenemos
			$cart = $cart; //Para que carro sea reactivo
		}
		quantity++;
	};
	const outOfCart = (product: ProductStore) => {
		const index = $cart.findIndex((x) => x.id === product.id);
		if ($cart[index].qtyBuy === 1) {
			$cart.splice(index, 1);
			quantity = 0;
			show = true;
		} else {
			$cart[index].qtyBuy -= 1;
			quantity = $cart[index].qtyBuy;
		}
		if(disabled) disabled=false;
		$cart = $cart; //para hacer reactivo los cambios en el carro
	};

	function upDate() {
		if ($cart.length > 0) {
			const index = $cart.findIndex((x) => x.id === product.id);
			if (index >= 0) {
				mProduct = JSON.parse(JSON.stringify($cart[index]));
				show = false;
				quantity = mProduct.qtyBuy;		
			}
		}
	}
	upDate();
</script>

{#if show}
	<button
		on:click={() => addToCart(mProduct)}
		class="btn btn-xs btn-outline btn-primary mb-1"
	>
		Comprar
	</button>
{:else}
	
		<div class="flex items-center justify-evenly">
			<button
				on:click={() => outOfCart(mProduct)}
				class='btn btn-link'
			>
				{#if quantity===1}
				<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 72 72"><g transform="translate(72 0) scale(-1 1)"><path fill="#D0CFCE" d="M15.076 12.068v5.951h35.745l.644-5.951zm6.833 42.621l.5 5.282h21.518l.592-5.282z"/><path fill="#9B9B9A" d="M42.096 60.178h7.323l.515-5.731h-7.238zm14.433-47.89h-7.59l-.628 5.613h8.218z"/><g fill="none" stroke="#000" stroke-miterlimit="10"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m21.38 50.393l-3.607-28.381m36.49-.029l-3.757 28.395m-9.93-28.289l8.173 10.02M30.417 22.13l17.152 20.642M22.352 24.253l21.864 26.172M23.902 36.996L35.928 50.63m-10.611-1.234l1.363 1.357m-3.452-19.519l8.585-9.131M24.61 41.882L42.853 22.13m-15.968 28.5l22.497-23.915M36.574 50.63l11.543-11.946m-3.901 12.069l2.127-1.793M14.905 12.028H56.95v5.946H14.905z"/><path d="M42.853 54.404h7.271"/><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m50.124 54.404l-.708 5.562H22.43l-.681-5.562h28.375"/></g></g></svg>
				{:else}
				<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 50 50"><g transform="translate(50 0) scale(-1 1)"><path fill="currentColor" d="M25 42c-9.4 0-17-7.6-17-17S15.6 8 25 8s17 7.6 17 17s-7.6 17-17 17zm0-32c-8.3 0-15 6.7-15 15s6.7 15 15 15s15-6.7 15-15s-6.7-15-15-15z"/><path fill="currentColor" d="M16 24h18v2H16z"/></g></svg>
				{/if}
			</button>
			<span class=" text-lg font-semibold" use:jovanyActions={quantity}></span>
			{#if !disabled}
				<button
					on:click={() => addToCart(mProduct)}
					class="btn btn-link"
				>
					<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 50 50"><g transform="translate(50 0) scale(-1 1)"><path fill="currentColor" d="M25 42c-9.4 0-17-7.6-17-17S15.6 8 25 8s17 7.6 17 17s-7.6 17-17 17zm0-32c-8.3 0-15 6.7-15 15s6.7 15 15 15s15-6.7 15-15s-6.7-15-15-15z"/><path fill="currentColor" d="M16 24h18v2H16z"/><path fill="currentColor" d="M24 16h2v18h-2z"/></g></svg>
				</button>
			{/if}
		
			{#if cost > 0 && mostrarCosto}
				<span use:jovanyActions={`$${cost}`} />
			{/if}
		
</div>
{/if}
