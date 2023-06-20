<script lang="ts">
	import { cart } from '$lib/stores/stores';
	let buttonMenu = true;
	let showClass = 'hidden';
	let salir = false;
	const buttonToggle = () => {
		buttonMenu = !buttonMenu;
		buttonMenu ? (showClass = 'hidden') : (showClass = '');
	};
	$:items = $cart.length
</script>
{#if !salir }
	
<div class="navbar bg-base-100 bg-gradient-to-t mb-4 from-yellow-50 to-yellow-600 text-black">
	
	<div class="flex-1">
		<div class="ml-3 text-xl text-black sm:text-xl font-bold">EQUISOL STORE</div>
	</div>
	
	
	<a  href="/carrito">
		<svg  xmlns="http://www.w3.org/2000/svg" width="38" height="38" viewBox="0 0 21 21"><g fill="none" fill-rule="evenodd"><path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" d="M5 6.5h12.5l-1.586 5.55a2 2 0 0 1-1.923 1.45h-6.7a2 2 0 0 1-1.989-1.78L4.5 4.5h-2"/><g fill="currentColor" transform="translate(2 4)"><circle cx="5" cy="12" r="1"/><circle cx="13" cy="12" r="1"/></g></g></svg>
		<span class="mr-10">{items}</span>
	</a>
	
	<div class="hidden md:block flex-none">
		<ul class="menu menu-horizontal px-1">
			
			<li><a href="/">Inicio</a></li>
			<li><a href="/tienda">Tienda</a></li>
			<li><a href="/carrito">Comprar</a></li>
			<li><a on:click={()=>{salir = true}} href="/login"><li>Salir</a></li>
		</ul>
	</div>
	
	<div class="md:hidden flex items-center text-black">
		<button on:click={buttonToggle}>
			<svg
			xmlns="http://www.w3.org/2000/svg"
			class="h-6 w-6"
			viewBox="0 0 20 20"
			fill="currentColor"
			>
			<path
			fill-rule="evenodd"
			d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z"
			clip-rule="evenodd"
			/>
		</svg>
	</button>
</div>

</div>

<div class="navbar md:hidden">
	<div class="{showClass} flex-none">
		<ul class="menu menu-vertical px-1">
			<li><a on:click={buttonToggle} href="/">Inicio</a></li>
			<li><a on:click={buttonToggle} href="/tienda">Tienda</a></li>
			<li><a on:click={buttonToggle} href="/carrito">Comprar</a></li>
			<li><a on:click={()=>{salir = true}} href="/login"><li>Salir</a></li>
		</ul>
	</div>
</div>
{/if}