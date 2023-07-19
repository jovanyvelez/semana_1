<script>
	import '../app.css';
	import Menu from '$lib/components/Menu.svelte';
	import MenuAdmon from '$lib/components/MenuAdmon.svelte';
	import MenuRedes from '$lib/components/MenuRedes.svelte';
	export let data;
</script>

<svelte:head>
	<title>equisol-ecommerce</title>
</svelte:head>


{#if data.email && data.role==='cliente'}
	<MenuRedes />
	<Menu nombre={data.nombre}/>
{/if}

{#if data.email && data.role==='admin'}
	<MenuAdmon />
{/if}

<main class="overflow-auto">
	<slot />
</main>

<div class="bg-slate-800 text-slate-100 flex mt-5">
	<div class="w-2/3 flex flex-col items-center">
		<p class="font-bold my-5 text-xl">Equisol equipos y soluciones</p>
		<p>Diagonal 43 # 28-41 Bodega 104 Unidad Industrial Marandúa, Itagüi, Antioquia</p>
		<p>(+57 ) 312 851 8512</p>
		<p>Lunes - Viernes / 7:00 AM - 5:00 PM</p>
	</div>

	<div class="flex flex-col">
		<p class="my-5 font-bold">INFORMACION</p>
		<a href="https://equisol.com.co/nosotros">Nosotros</a>
		<a href="https://equisol.com.co/contacto-equisol">Contacto</a>
		<a href="https://equisol.com.co/wp-content/uploads/2023/03/Politica-Habeas-Data-EQUISOL-EQUIPOS-Y-SOLUCIONES.pdf">
			Politica de tratamiento de datos</a>
		<a href="https://acrobat.adobe.com/link/review?uri=urn:aaid:scds:US:44078405-f1b1-31a3-b76d-224b8d27927a">Términos de garantía</a>
	</div>
</div>

<div class="bg-primary text-center text-white">
	<p>© COPYRIGHT – EQUISOL EQUIPOS Y SOLUCIONES</p>
</div>

<style lang="postcss">
	:global(h1) {
		@apply text-3xl font-semibold w-full mb-8;
	}
	:global(h2) {
		@apply text-2xl font-semibold w-full mb-2;
	}
	:global(body) {
		@apply bg-white
	}
</style>
