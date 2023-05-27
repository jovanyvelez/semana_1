<script>
	import '../app.css';
    import Menu from '$lib/components/Menu.svelte';
	export let data;
</script>

<svelte:head>
	<title>Mi Tienda Virtuale</title>
</svelte:head>

{#if data.user}
		<Menu />
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
</style>
	