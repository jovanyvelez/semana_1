<script lang="ts">

	import Item from '$lib/components/Item.svelte';

	export let data;
	const {images, user} = data;


	let products = [];
	let datos = [];
	let paginacion = true;

	let pags: number[] = [...Array(data.pages).keys()];

	let texto = '';

	const handleKeyDown = (event) => {
		if (event.key === 'Enter') {
			handleClick();
		}
	}

	const handleClick = async () => {
		//const textos = `'/api/queries?searchTerm='${texto}'`;
		const response = await fetch(`/api/queries?searchTerm=${texto}`);
		products = await response.json();
		paginacion = false;
	};

	$: if (paginacion) {
		datos = data.products;
	} else {
		datos = products;
	}

</script>

<div class="flex flex-wrap justify-center mb-3 mt-5">
	<div class="input-group w-4/12 flex justify-center">
		<input
			type="text"
			placeholder="Buscar…"
			class="input input-bordered"
			bind:value={texto}
			on:keydown={handleKeyDown}
		/>
		<button class="btn btn-square bg-blue-200" on:click={() => handleClick()}>
			<svg
				xmlns="http://www.w3.org/2000/svg"
				class="h-6 w-6"
				fill="none"
				viewBox="0 0 24 24"
				stroke="#1877F2"
				><path
					stroke-linecap="round"
					stroke-linejoin="round"
					stroke-width="2"
					d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"
				/></svg
			>
		</button>
	</div>
</div>


{#if datos.length > 0}
	<div class="flex flex-wrap justify-center">
		{#each datos as product (product.id)}
			<Item {product} {images} nombre={data.cliente.name} user={data.cliente.id}/>
		{/each}
	</div>
{:else}
	<h1 class="text-xl sm:text-7xl">Ups, no hay productos aquí</h1>
{/if}



{#if pags.length > 1 && paginacion}
	<div class="flex flex-wrap justify-center pagination">
		{#each pags as pag, i}
			<a
				class="mx-1 {i + 1 === data.page ? 'active' : ''}"
				href={`/tienda/${JSON.stringify({ param: data.query.param, page: 1 + i })}`}
			>
				{i + 1}
			</a>
		{/each}
	</div>
{/if}


<!---->
<style>
	.pagination a {
		padding: 0.5rem;
		margin: 0.5rem;
		border-radius: 0.5rem;
		border: 0.1rem #a4a4a4 solid;
		font-size: 0.8rem;
		font-family: Helvetica, Arial, sans-serif;
		-webkit-font-smoothing: antialiased;
		-moz-osx-font-smoothing: grayscale;
	}
	.pagination a.active {
		font-weight: bold;
		color: red;
	}
</style>
