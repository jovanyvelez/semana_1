<script>
	import Category from '$lib/components/Category.svelte';
	import Pie from '$lib/components/Pie.svelte';
	export let data;
</script>

{#each data.datos as category}
	<div class="categories mx-10 mt-5">
		<Category {category} />
	</div>
{/each}

<Pie />