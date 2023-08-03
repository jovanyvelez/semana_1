<script>
	import { slide } from 'svelte/transition';
	export let category;
	export let depth = 0;
	let isExpanded = false;

	function toggleExpand() {
		isExpanded = !isExpanded;
	}

	$: arrowDown = isExpanded;
</script>

<div class="category" style="margin-left: {depth * 2}rem;">
	<button class="my-2 arrow font-extrabold text-blue-600 hover:text-slate-950 text-2xl" class:arrowDown on:click={toggleExpand}
		>&gt;</button
	>
	<a
		href="/tienda/{category.id}"
		class="font-extrabold py-5 px-3 sm:text-xl md:text-2xl lg:text-3xl hover:text-blue-600 transition duration-200"
		>{category.name}</a
	>

	{#if isExpanded && category.hijos.length > 0}
		<ul transition:slide={{ duration: 500 }}>
			{#each category.hijos as child}
				<li>
					<svelte:self category={child} depth={depth + 1} />
				</li>
			{/each}
		</ul>
	{/if}

	<!--Esto codigo funciona si quisieramos icluir los productos!!!

      {#if isExpanded && category.product.length > 0}
      <ul>
        {#each category.product as product}
          <li>{product.name}</li>
        {/each}
      </ul>
    {/if}

  -->
</div>

<style>

	.category {
		margin-bottom: 20px;
	}
	.arrow {
		cursor: pointer;	
		display: inline-block;
		transition-duration: 300ms;
		transition-property: transform;
	}
	.arrowDown {
		transform: rotate(90deg);
		color:red
	}
</style>