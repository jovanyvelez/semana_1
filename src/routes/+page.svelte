<script>
	export let data;
	const { elResultado, role, images } = data;
</script>

{#if role === 'cliente'}
	{#if elResultado.length > 0}
		<div class="flex flex-wrap justify-center">
			{#each elResultado as category (category.rootid)}
				<h1 class="my-10 text-center text-blue-600">{category.name}</h1>
				{#each category.products as product (product.id)}
					<div class="card glass w-48 sm:w-64 bg-base-100 shadow-xl mx-2 mt-2">
						<figure><img src={images==='true' ? product.image[0].secureUrl:product.image[0].publicId} alt="article" class="" /></figure>
						<div class="card-body">
							<h2 class="card-title">{product.name.trim()}</h2>
						</div>
					</div>
				{/each}
			{/each}
		</div>
	{/if}
{/if}

