<script lang="ts">
	import { onMount } from 'svelte';
	import { superForm } from 'sveltekit-superforms/client';
	import SuperDebug from 'sveltekit-superforms/client/SuperDebug.svelte';
	import { userSchema } from '$lib/zodSchemas/schemas.js';

	export let data;

	type Department = {
		departamento: string,
		c_digo_dane_del_departamento:string
	}

	type Municipio = {
		municipio:string,
		c_digo_dane_del_municipio:string
	}

	let departamentos: Array<Department> = [];
	let municipios:Array<Municipio> = [];


	const { form, errors, constraints, enhance } = superForm(data.form, {
		taintedMessage: 'Desea salir del formulario',
		validators: userSchema
	});

	async function handleSubmit() {
		const response = await fetch(`/api/ciudad?departamento=${$form.Department}`);
		const data = await response.json();
		municipios = data;
	}

	onMount(async () => {
		const response = await fetch('/api/department');
		const data = await response.json();
		departamentos = data;
		console.log(JSON.stringify(departamentos,null,2))
	});
</script>

<div class="px-4 pt-8 flex flex-col w-full place-items-center">
	<h1 class="text-center">Registro</h1>

	<form action="?/register" method="post" use:enhance>
		<div>
			<label for="name" class="label">Nombre/Razón Social</label>
			<input
				id="name"
				name="name"
				type="text"
				placeholder="Nombre o Razon Social"
				bind:value={$form.name}
				{...$constraints.name} 	
				class="input {$errors?.name
					? 'input-error'
					: 'input-bordered'} input-sm rounded-md w-full max-w-xs"
			/>
		</div>

		{#if $errors.name}
			<small class="text-error">{$errors.name}</small>
		{/if}

		<div>
			<label for="email" class="label">Email</label>
			<input
				id="email"
				name="email"
				type="email"
				placeholder="Correo Electrónico"
				bind:value={$form.email}
				{...$constraints.email}
				class="input {$errors?.email
					? 'input-error'
					: 'input-bordered'}  input-bordered input-sm rounded-md w-full max-w-xs"
			/>
		</div>

		{#if $errors.email}
			<small>{$errors.email}</small>
		{/if}

		<div>
			<label for="telefono" class="label">Telefono</label>
			<input
				id="telefono"
				name="phone"
				type="text"
				placeholder="Tefono de contacto"
				bind:value={$form.phone}
				{...$constraints.phone}
				class="input {$errors?.phone
					? 'input-error'
					: 'input-bordered'}  input-bordered input-sm rounded-md w-full max-w-xs"
			/>
		</div>

		{#if $errors.phone}
			<small>{$errors.phone}</small>
		{/if}

		<label for="tipo" class="label">Tipo y Numero de documento</label>
		<div id="tipo" class="pt-4 px-2 border border-slate-300 rounded-lg mb-5">
			<select name="docType" bind:value={$form.docType} class="select select-xs max-w-xs mb-3">
				<option disabled selected>tipo</option>
				<option value="CC" selected>CC</option>
				<option value="CA">CA</option>
				<option value="PA">PA</option>
				<option value="NIT">NIT</option>
			</select>

			<input
				type="text"
				name="numDoc"
				bind:value={$form.numDoc}
				{...$constraints.numDoc}
				class="input {$errors?.numDoc
					? 'input-error'
					: 'input-bordered'} input-sm"
				placeholder="Numero de identificación"
			/>
		</div>
		{#if $errors.numDoc}
			<small>{$errors.numDoc}</small>
		{/if}
		{#if $errors.docType}
			<small>{$errors.docType}</small>
		{/if}

		<div>
			<label for="documentConfirm" class="label">Confirmación número de documento</label>
			<input
				type="text"
				name="documentConfirm"
				id="documentConfirm"
				bind:value={$form.documentConfirm}
				{...$constraints.documentConfirm}
				class="input {$errors?.documentConfirm
					? 'input-error'
					: 'input-bordered'}input-bordered input-sm w-full"
				placeholder="Confirmar numero de identificación"
			/>
		</div>{#if $errors.city}
		<small>{$errors.city}</small>
	{/if}
		{#if $errors.documentConfirm}
			<small>{$errors.documentConfirm}</small>
		{/if}

		<div>
			<label for="direccion" class="label">Direccion</label>
			<input
				id="direccion"
				name="address"
				type="text"
				placeholder="Escriba direccion"
				bind:value={$form.address}
				{...$constraints.address} 	
				class="input {$errors?.address
					? 'input-error'
					: 'input-bordered'} input-sm rounded-md w-full max-w-xs"
			/>
		</div>

		<div class="flex justify flex-col">
			<label class="label" for="departamento"
				>Seleccione el Departamento</label
			>
	
			<select
				id="departamento"
				bind:value={$form.Department}
				class="select select-bordered select-xs  w-11/12 mb-5"
				{...$constraints.Department}
				on:change={() => handleSubmit()}
				name="Departament"
			>
				{#each departamentos as departamento (departamento.c_digo_dane_del_departamento)}
					<option value={departamento.departamento }>
						{departamento.departamento}
					</option>
				{/each}
			</select>

			{#if $errors.Department}
				<small>{$errors.Department}</small>
			{/if}

			{#if municipios.length > 0}
				<label class="label mr-6 my-2 p-2" for="municipio"
					>Seleccione Ciudad</label
				>
				<select
					id="municipio"
					{...$constraints.city}
					bind:value={$form.city}
					class="select select-bordered select-xs w-11/12 mb-5"
					name="city"
				>
					{#each municipios as municipio (municipio.c_digo_dane_del_municipio)}
						<option value={municipio.municipio}>
							{municipio.municipio}
						</option>
					{/each}
				</select>
				{#if $errors.city}
					<small>{$errors.city}</small>
				{/if}
			{/if}
		</div>
		<div>
			<label for="Bussiness" class="label">Digito Ccosto</label>
			<input
				id="Bussiness"
				name="name"
				type="text"
				bind:value={$form.bussinessUnit}
				{...$constraints.bussinessUnit} 	
				class="input {$errors?.bussinessUnit
					? 'input-error'
					: 'input-bordered'} input-sm rounded-md w-full max-w-xs"
			/>
		</div>
		{#if $errors.bussinessUnit}
			<small>{$errors.bussinessUnit}</small>
		{/if}
		<div>
			<label for="zona" class="label">Nro Zona</label>
			<input
				id="zona"
				name="zone"
				type="text"
				bind:value={$form.zone}
				{...$constraints.zone} 	
				class="input {$errors?.zone
					? 'input-error'
					: 'input-bordered'} input-sm rounded-md w-full max-w-xs"
			/>
		</div>
		{#if $errors.zone}
		<small>{$errors.zone}</small>
		{/if}

		<div>
			<label for="descuento" class="label">%Descuento</label>
			<input
				id="descuento"
				name="zone"
				type="number"
				step="0.01"
				bind:value={$form.discount}
				{...$constraints.discount} 	
				class="input {$errors?.discount
					? 'input-error'
					: 'input-bordered'} input-sm rounded-md w-full max-w-xs"
			/>
		</div>
		{#if $errors.discount}
		<small>{$errors.discount}</small>
		{/if}



		<div class="w-full flex justify-center mt-5">
			<button type="submit" class="btn btn-sm">Registrar</button>
		</div>
	</form>
</div>

<div class="mt-5">
	<SuperDebug data={$form} />
</div>
