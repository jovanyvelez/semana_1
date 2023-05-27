<script lang="ts">
	import { enhance } from "$app/forms";
	import { goto } from "$app/navigation";
	import { onMount } from 'svelte';
	import { cart } from '$lib/stores/stores.js';
	import type { ProductStore} from "$lib/interfaces/Product"

	export let data;

	let address1 = '';
	let address2 = '';
	let address3 = '';
	let address4 = '';
	let notes = '';

	let departamento = '';
	let departamentos = [];
	let municipio = '';
	let municipios = [];
	let order = {};

	order.userId = data.user.id;
	order.zone = data.user.zone;
	order.address = data.user.address;
	$: completeAddress = `${address1} ${address2} # ${address3}-${address4}`;

	const saveOrder = ({cancel, formData})=>{

		order.address = completeAddress;
		order.notes = notes;
		order.departamento = departamento;
		order.municipio = municipio;
		order.products = $cart.map((e) => {
			return { id: e.id, cantidad: e.qtyBuy, price: e.price[0].price1, category: e.categoryId };
		});

		formData.append('products', JSON.stringify(order,null,2))

		console.log("entro")
		//cancel();
		console.log("salgo")
		return async({result})=>{
			console.log(result.type)
			if(result.type==='success'){
				const temp: ProductStore[] = []
				$cart = temp
				goto('/')
			}
		}
	}

	async function handleSubmit(event) {
		const response = await fetch(`/api/ciudad?departamento=${departamento}`);
		const data = await response.json();
		municipios = data;
	}

	onMount(async () => {
		const response = await fetch('/api/department');
		const data = await response.json();
		departamentos = data;
	});

</script>





<form method="post" use:enhance={saveOrder}>
	<pre>{JSON.stringify(order, null, 2)}</pre>

	<h1 class="text-center">Direccion de Envío</h1>

	<div class="flex justify flex-col ml-5">
		<label class="font-bold text-yellow-400 text-xl mr-6 my-2 p-2" for="departamento"
			>Seleccione el Departamento</label
		>

		<select
			id="departamento"
			bind:value={departamento}
			class="select select-warning select-xs md:select-md w-11/12 mb-5"
			on:change={() => handleSubmit()}
			name="departamento"
		>
			{#each departamentos as departamento (departamento.c_digo_dane_del_departamento)}
				<option value={departamento.departamento}>
					{departamento.departamento}
				</option>
			{/each}
		</select>

		{#if municipios.length > 0}
			<label class="font-bold text-yellow-400 text-xl mr-6 my-2 p-2" for="departamento"
				>Seleccione Ciudad</label
			>
			<select
				id="municipio"
				bind:value={municipio}
				class="select select-warning select-xs md:select-md w-11/12 mb-5"
				name="municipio"
			>
				{#each municipios as municipio (municipio.c_digo_dane_del_municipio)}
					<option value={municipio.municipio}>
						{municipio.municipio}
					</option>
				{/each}
			</select>
		{/if}

		{#if municipio !== ''}
			<div class="flex flex-col">
				<h3 class="text-warning font-bold">Direccion</h3>
				<div class="flex flex-nowrap">
					<select bind:value={address1} class="select select-warning select-xs w-3/12 ml-5 mr-2">
						<option value="Calle">Calle</option>
						<option value="Carrera">Carrera</option>
						<option value="Avenida">Avenida</option>
						<option value="Avenida">Circular</option>
						<option value="Circunvalar">Circunvalar</option>
						<option value="Diagonal">Diagonal</option>
						<option value="Manzana">Manzana</option>
						<option value="Transversal">Transversal</option>
						<option value="Via">Via</option>
					</select>

					<input
						type="text"
						bind:value={address2}
						class="input input-warning input-xs w-2/12 mr-1"
					/>
					<span class="font-bold">#</span>
					<input
						type="text"
						bind:value={address3}
						class="input input-warning w-2/12 input-xs ml-1 mr-2"
					/>
					<span class="font-bold">-</span>
					<input
						type="text"
						bind:value={address4}
						class="input input-warning w-2/12 input-xs ml-1 mr-2"
					/>
				</div>

				<input
					type="text"
					class="input input-warning mx-5 w-10/12 input-md p-3 mt-5"
					placeholder="Notas: Barrio, edificio, casa apartamento, piso"
					bind:value={notes}
				/>
			</div>
		{/if}
	</div>
	<button type="submit" class="btn btn-warning btn-sm mr-5">Finalizar compra </button>
</form>
