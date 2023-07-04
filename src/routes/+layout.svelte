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
	<Menu />
{/if}

{#if data.email && data.role==='admin'}
	<MenuAdmon />
{/if}

<main class="overflow-auto">
	<slot />
</main>


<style lang="postcss">
	:global(h1) {
		@apply text-3xl font-semibold w-full mb-8;
	}
	:global(h2) {
		@apply text-2xl font-semibold w-full mb-2;
	}
	:global(body) {
		@apply bg-slate-100
	}
</style>
