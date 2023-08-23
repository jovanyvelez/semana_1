<script>
	import Category from '$lib/components/Category.svelte';
	import Marcas from '$lib/components/Marcas.svelte';
	import Pie from '$lib/components/Pie.svelte';
	export let data;
</script>

<Marcas />

{#each data.datos as category}
	<div class="categories mx-10 mt-5">
		<Category {category} />
	</div>
{/each}

<Pie />