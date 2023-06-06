<script lang="ts">
	import { enhance } from '$app/forms';

	export let data;
	export let form;
	console.log(form);
	let errors = {};

	const zonas = data.zonas;

	const saveCategory = ({ cancel, formData }) => {
		errors = {};
		if (!final.category) {
			errors.category = 'No hay nombre de la categoria';
			cancel();
		}

		if (final.zones.length < 1) {
			errors.zone = 'No seleccionas ninguna zona';
			cancel();
		} else {
			const count = final.zones.reduce((a, c) => {
				if (!c.ccosto || c.ccosto === '') {
					return a + 1;
				} else {
					return a;
				}
			}, 0);
			if (count > 0) {
				errors.ccosto = 'Algunas zonas no tienen centro de costo';
				cancel();
			}
		}

		formData.append('categoria', JSON.stringify(final));

		return async ({ result }) => {
			console.log(result);
			if (result.type === 'success') {
				console.log(result);
				//goto(`/tienda/conf_envio/${result.data.savedorder}`)
			}
			if (result.type === 'failure') {
				errors.generic = result.data.message;
			}
		};
	};

	let rootCategory = 0;

	let selectedZones = [];

	let category = '';

	function handleTextChange(zona, event) {
		const index = selectedZones.findIndex((z) => z.id === zona.id);

		if (index !== -1) {
			selectedZones[index].ccosto = event.target.value;
		}
	}

	$: final = { category, zones: selectedZones };
	//$:console.log(final)
</script>

<h1 class="text-center">Creacion de categoria raiz</h1>

<div class="flex justify-center">
	<div class="flex justify-center items-center flex-wrap border w-10/12 border-yellow-500 p-5">
		<div class="flex flex-col md:flex-row mr-5">
			<label for="catName" class="mr-5 text-xl"> Nombre de la categoría </label>
			<input type="text" id="catName" class="input input-warning input-xs" bind:value={category} />
			{#if errors?.category}
				<small class="text-red-600">{errors.category}</small>
			{/if}
		</div>

		<div>
			{#each zonas as zona (zona.id)}
				<label class="block">
					<input type="checkbox" bind:group={selectedZones} value={zona} />
					{zona.name}
				</label>
				{#if selectedZones.find((z) => z.id === zona.id)}
					<input
						type="text"
						class="input input-warning input-xs w-2/3"
						placeholder="centro de costos"
						value={zona.ccosto ? zona.ccosto : ''}
						on:input={(event) => handleTextChange(zona, event)}
					/>
				{/if}
			{/each}
			{#if errors?.zone}
				<small class="text-red-600 text-center">{errors.zone}</small>
			{/if}
			{#if errors?.ccosto}
				<small class="text-red-600 text-center">{errors.ccosto}</small>
			{/if}
		</div>
	</div>
</div>
<div class="flex flex-col justify-center items-center">
	{#if errors?.generic}
		<small class="text-red-600 text-center">{errors.generic}</small>
	{/if}
	<form method="post" use:enhance={saveCategory}>
		<button type="submit" class="btn btn-warning btn-sm mt-5">Grabar</button>
	</form>
</div>
