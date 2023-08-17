<script lang="ts">
	import { superForm } from 'sveltekit-superforms/client';
	import { userSchema } from '$lib/zodSchemas/schemas.js';
	
	
	export let data;
	const { departamentos, vendedores } = data;

	const userCreateSchema = userSchema.extend({
		id: userSchema.shape.id.optional(),
		codVendedor: userSchema.shape.codVendedor.optional()
	});
	
	type Municipio = {
		municipio: string,
		codigo: string,
	};
	
	type Vendedor = {
		code: string,
		email: string
		id: number,
	}
	
	let vendedor: Vendedor | undefined = undefined;

	const { tipos } = data;



	let municipios: Array<Municipio> = [];

	const { form, errors, enhance, delayed, message, reset, constraints } = superForm(data.form, {
		resetForm: true,
		validators: userCreateSchema
	});

	async function handleSubmit() {
		const response = await fetch(`/api/ciudad?departamento=${$form.Departament}`);
		const data = await response.json();
		municipios = data;
		console.log(municipios);
	}

	function ejecutar() {
		vendedor = vendedores.find((option) => option.email === $form.asesor)
		if ( vendedor === undefined) {
			$form.asesor = '';
			$form.codVendedor = '';
		}else{
			$form.codVendedor = vendedor.code;
		}

	}
</script>


<div class="px-4 pt-8 flex flex-col w-full place-items-center">
	<h1 class="text-center">Registro</h1>
	{#if $message}
		<h3>{$message}</h3>
	{/if}
	<form action="?/register" method="post" use:enhance>
		<input type="hidden" name="codVendedor" bind:value={$form.codVendedor}>
		<input type="hidden" name="id" bind:value={$form.id} on:focusout={ejecutar} />
		<label for="name" class="label">Nombre/Razón Social</label>
		<div class="flex flex-wrap">
			<input
				id="name"
				name="name"
				type="text"
				placeholder="Nombre o Razon Social"
				data-invalid={$errors.name}
				bind:value={$form.name}
				{...$constraints.name}
				class="input {$errors?.name
					? 'input-error'
					: 'input-bordered'} input-sm rounded-md w-full max-w-xs"
			/>
			<select
				id="tipoUser"
				bind:value={$form.roleId}
				class="select select-bordered select-xs w-4/12 mt-2"
				data-invalid={$errors.roleId}
				{...$constraints.roleId}
				name="roleId"
			>
				{#each tipos as tipo (tipo.id)}
					<option value={tipo.id}>
						{tipo.name}
					</option>
				{/each}
			</select>
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
				data-invalid={$errors.email}
				bind:value={$form.email}
				{...$constraints.email}
				class="input {$errors?.email
					? 'input-error'
					: 'input-bordered'}  input-bordered input-sm rounded-md w-full max-w-xs"
			/>
		</div>

		{#if $errors.email}
			<small class="text-error">{$errors.email}</small>
		{/if}

		<div>
			<label for="telefono" class="label">Telefono</label>
			<input
				id="telefono"
				name="phone"
				type="text"
				placeholder="Tefono de contacto"
				data-invalid={$errors.phone}
				bind:value={$form.phone}
				{...$constraints.phone}
				class="input {$errors?.phone
					? 'input-error'
					: 'input-bordered'}  input-bordered input-sm rounded-md w-full max-w-xs"
			/>
		</div>

		{#if $errors.phone}
			<small class="text-error">{$errors.phone}</small>
		{/if}

		<label for="tipo" class="label">Tipo y Numero de documento</label>
		<div id="tipo" class="pt-4 px-2 border border-slate-300 rounded-lg mb-5">
			<select
				name="docType"
				bind:value={$form.docType}
				data-invalid={$errors.docType}
				class="select select-xs max-w-xs mb-3"
			>
				<option disabled>tipo</option>
				<option value="CC">CC</option>
				<option value="CA">CA</option>
				<option value="PA">PA</option>
				<option value="NIT">NIT</option>
			</select>

			<input
				type="text"
				name="numDoc"
				bind:value={$form.numDoc}
				{...$constraints.numDoc}
				data-invalid={$errors.numDoc}
				class="input {$errors?.numDoc ? 'input-error' : 'input-bordered'} input-sm"
				placeholder="Numero de identificación"
			/>
		</div>
		{#if $errors.numDoc}
			<small class="text-error">{$errors.numDoc}</small>
		{/if}
		{#if $errors.docType}
			<small class="text-error">{$errors.docType}</small>
		{/if}

		<div>
			<label for="direccion" class="label">Direccion</label>
			<input
				id="direccion"
				name="address"
				type="text"
				placeholder="Escriba direccion"
				data-invalid={$errors.address}
				bind:value={$form.address}
				{...$constraints.address}
				class="input {$errors?.address
					? 'input-error'
					: 'input-bordered'} input-sm rounded-md w-full max-w-xs"
			/>
		</div>
		{#if $errors.address}
			<small class="text-error">{$errors.address}</small>
		{/if}
		<div class="flex justify flex-col">
			<label class="label" for="departamento">Seleccione el Departamento</label>

			<select
				id="departamento"
				bind:value={$form.Departament}
				class="select select-bordered select-xs w-11/12 mb-5"
				data-invalid={$errors.Departament}
				{...$constraints.Departament}
				on:change={() => handleSubmit()}
				name="Departament"
			>
				{#each departamentos as departamento (departamento.codigo)}
					<option value={departamento.departamento}>
						{departamento.departamento}
					</option>
				{/each}
			</select>

			{#if $errors.Departament}
				<small class="text-error">{$errors.Departament}</small>
			{/if}

			{#if municipios.length > 0}
				<label class="label mr-6 my-2 p-2" for="municipio">Seleccione Ciudad</label>
				<select
					id="municipio"
					{...$constraints.city}
					bind:value={$form.city}
					class="select select-bordered select-xs w-11/12 mb-5"
					name="city"
				>
					{#each municipios as municipio (municipio.codigo)}
						<option value={municipio.ciudad}>
							{municipio.ciudad}
						</option>
					{/each}
				</select>
				{#if $errors.city}
					<small class="text-error">{$errors.city}</small>
				{/if}
			{/if}
		</div>
		<div>
			<label for="Bussiness" class="label">Digito Ccosto</label>
			<input
				id="Bussiness"
				name="bussinessUnit"
				type="text"
				bind:value={$form.bussinessUnit}
				{...$constraints.bussinessUnit}
				class="input {$errors?.bussinessUnit
					? 'input-error'
					: 'input-bordered'} input-sm rounded-md w-full max-w-xs"
			/>
		</div>
		{#if $errors.bussinessUnit}
			<small class="text-error">{$errors.bussinessUnit}</small>
		{/if}

		<div>
			<label for="zona" class="label">Nro Zona</label>
			<input
				id="zona"
				name="zoneid"
				type="number"
				bind:value={$form.zoneid}
				{...$constraints.zoneid}
				class="input {$errors?.zoneid
					? 'input-error'
					: 'input-bordered'} input-sm rounded-md w-full max-w-xs"
			/>
		</div>
		{#if $errors.zoneid}
			<small>{$errors.zoneid}</small>
		{/if}

		<div>
			<label for="descuento" class="label">%Descuento</label>
			<input
				id="descuento"
				name="discount"
				type="number"
				step="0.01"
				bind:value={$form.discount}
				data-invalid={$errors.discount}
				{...$constraints.discount}
				class="input {$errors?.discount
					? 'input-error'
					: 'input-bordered'} input-sm rounded-md w-full max-w-xs"
			/>
		</div>
		{#if $errors.discount}
			<small class="text-error">{$errors.discount}</small>
		{/if}

		<!--div>
			<label for="asesors" class="label">Email Asesor</label>
			<input
				id="asesors"
				name="asesor"
				type="email"
				placeholder="Correo Asesor"
				data-invalid={$errors.asesor}
				bind:value={$form.asesor}
				{...$constraints.asesor}
				class="input {$errors?.asesor
					? 'input-error'
					: 'input-bordered'}  input-bordered input-sm rounded-md w-full max-w-xs"
			/>
		</div-->

		<div>
			<input
				list="sellers"
				type="email"
				id="asesors"
				name="asesor"
				placeholder="Ingrese correo valido"
				data-invalid={$errors.asesor}
				{...$constraints.asesor}
				class="input {$errors?.asesor
					? 'input-error'
					: 'input-bordered'}  input-bordered input-sm rounded-md w-full max-w-xs"
				bind:value={$form.asesor}
				on:blur={ejecutar}
			/>
			<datalist id="sellers">
				{#each vendedores as vendedor}
					<option value={vendedor.email} />
				{/each}
			</datalist>
		</div>
		{#if $errors.asesor}
			<small class="text-error">{$errors.asesor}</small>
		{/if}

		<div class="w-full flex justify-center mt-5">
			<button type="submit" class="btn btn-sm">Registrar</button>

			{#if $delayed}
				<span class="text-4xl">Un momento</span>
			{/if}
		</div>
	</form>
</div>
