<script>
	import Marcas from '$lib/components/Marcas.svelte';
	export let data;
	const { elResultado, role, images } = data;
</script>


{#if role === 'cliente'}
	
	<div class="relative">
		<img class="h-64 w-full" src="portada1.jpeg" alt="portada">
		<div class="absolute top-5 w-full text-center text-white">
				<h1 ><span class="text-5xl">hola!</span> {data.user}</h1>
				<h1 class="">Bienvenido al portal transaccional de canales</h1>
		</div>
	</div>

	<h3 class="text-center text-xl font-bold mt-4">Encuentra aquí productos listos para la acción</h3>
	  
	<Marcas/>

	{#if elResultado.length > 0}
		<div class="flex flex-wrap justify-center">
			{#each elResultado as category (category.rootid)}
				<h1 class="my-10 ml-12 text-blue-600">{category.name}</h1>
				{#each category.products as product (product.id)}
					<div class="card glass w-96 sm:w-64 bg-base-100 shadow-xl mx-2 mt-2">
						<figure><img src={images==='true' ? product.image[0].secureUrl:product.image[0].publicId} alt="article" class="" /></figure>
						<div class="card-body">
							<p class="card-title text-sm font-bold">{product.name.trim()}</p>
							<div class="card-actions justify-end">
								<small class="font-bold">code: {product.code}</small>
							</div>
						</div>
					</div>
				{/each}
			{/each}
		</div>
	{/if}
{/if}

