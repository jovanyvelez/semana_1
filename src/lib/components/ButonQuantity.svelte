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
	<div>
		<button
			on:click={() => outOfCart(mProduct)}
			class='btn btn-sm btn-outline btn-primary'
		>
			-
		</button>
		<span class="mx-2" use:jovanyActions={quantity}></span>
		<button
			disabled={disabled}
			on:click={() => addToCart(mProduct)}
			class="{disabled ? 'btn btn-sm btn-outline':'btn btn-sm btn-outline btn-primary'}"
		>
			+
		</button>
		{#if cost > 0 && mostrarCosto}
			<span use:jovanyActions={`$${cost}`} />
		{/if}
	</div>
{/if}
