<script>
	import '../app.css';
	import Menu from '$lib/components/Menu.svelte';
	import MenuAdmon from '$lib/components/MenuAdmon.svelte';
	export let data;
</script>

<svelte:head>
	<title>Mi Tienda Virtuale</title>
</svelte:head>


{#if data.user?.email && data?.user?.role?.name==='cliente'}
	<Menu />
{/if}

{#if data.user?.email && data?.user?.role?.name==='admin'}
	<MenuAdmon />
{/if}

<main class="overflow-auto">
	<slot />
</main>

<pre>{JSON.stringify(data.user,null,2)}</pre>

<style lang="postcss">
	:global(h1) {
		@apply text-3xl font-semibold w-full mb-8;
	}
	:global(h2) {
		@apply text-2xl font-semibold w-full mb-2;
	}
</style>
