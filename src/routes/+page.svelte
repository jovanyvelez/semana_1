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