<script lang="ts">
	export let nombre:string='';
	import { cart } from '$lib/stores/stores';
	let buttonMenu = true;
	let showClass = 'hidden';
	let salir = false;
	const buttonToggle = () => {
		buttonMenu = !buttonMenu;
		buttonMenu ? (showClass = 'hidden') : (showClass = '');
	};
	$: items = $cart.length;
</script>

{#if !salir}
	<div
		class="navbar flex justify-between bg-white text-black border-b-2 border-blue-300 py-1 font-bold font-sans"
	>
		<div class=" ml-10">
			<img src="menu.png" alt="logo equisol" />
		</div>
		
		<div class=" hidden md:flex justify-start text-xl">
			<ul class="menu menu-horizontal px-1">
				<li class="hover:text-blue-600"><a href="/"><span>Inicio</span></a></li>
				<li class="hover:text-blue-600"><a href="/tienda">Tienda</a></li>
				<!--li class="hover:text-blue-600"><a href="/carrito">Comprar</a></li-->
				
				<li class="hover:text-blue-00">
					<a
						data-sveltekit-preload-data="tap"
						on:click={() => {
							salir = true;
						}}
						href="/login"><li>Salir</li></a
					>
				</li>
			</ul>
		</div>
		<div class="flex">
			<span class="text-xs mr-1">{nombre}</span>
			<div class="relative flex">
				<a class="hover:text-blue-600 text-xl mr-10" href="/carrito">
					<svg xmlns="http://www.w3.org/2000/svg" width="38" height="38" viewBox="0 0 21 21"
						><g fill="none" fill-rule="evenodd"
							><path
								stroke="currentColor"
								stroke-linecap="round"
								stroke-linejoin="round"
								d="M5 6.5h12.5l-1.586 5.55a2 2 0 0 1-1.923 1.45h-6.7a2 2 0 0 1-1.989-1.78L4.5 4.5h-2"
							/><g fill="currentColor" transform="translate(2 4)"
								><circle cx="5" cy="12" r="1" /><circle cx="13" cy="12" r="1" /></g
							></g
						></svg
					>
				</a>
				{#if items > 0}
					<div
						class="absolute top-0 left-8 text-xs w-5 h-5 rounded-full bg-black flex justify-center"
					>
						{#key items}
							<span class="text-white">{items}</span>
						{/key}
					</div>
				{/if}
			</div>
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
				<!--li><a on:click={buttonToggle} href="/carrito">Comprar</a></li-->
				<li>
					<a
						on:click={() => {
							salir = true;
						}}
						href="/login"><li>Salir</li></a
					>
				</li>
			</ul>
		</div>
	</div>
{/if}
