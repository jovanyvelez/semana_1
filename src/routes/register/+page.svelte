<script lang="ts">
	import { superForm } from 'sveltekit-superforms/client';
	import SuperDebug from 'sveltekit-superforms/client/SuperDebug.svelte';
	import { userSchema } from '$lib/zodSchemas/schemas.js';

	export let data;


	const { form, errors, constraints, enhance } = superForm(data.form, {
		taintedMessage: 'Desea salir del formulario',
		validators: userSchema
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
				type="text"
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
				name="telefono"
				type="text"
				placeholder="Tefono de contacto"
				bind:value={$form.telefono}
				{...$constraints.telefono}
				class="input {$errors?.telefono
					? 'input-error'
					: 'input-bordered'}  input-bordered input-sm rounded-md w-full max-w-xs"
			/>
		</div>

		{#if $errors.telefono}
			<small>{$errors.telefono}</small>
		{/if}

		<label for="tipo" class="label">Tipo y Numero de documento</label>
		<div id="tipo" class="pt-4 px-2 border border-slate-300 rounded-lg mb-5">
			<select name="tipo" bind:value={$form.tipo} class="select select-xs max-w-xs mb-3">
				<option disabled selected>tipo</option>
				<option value="CC" selected>CC</option>
				<option value="CA">CA</option>
				<option value="PA">PA</option>
				<option value="NIT">NIT</option>
			</select>

			<input
				type="text"
				name="document"
				bind:value={$form.document}
				{...$constraints.document}
				class="input {$errors?.document
					? 'input-error'
					: 'input-bordered'} input-sm"
				placeholder="Numero de identificación"
			/>
		</div>
		{#if $errors.document}
			<small>{$errors.document}</small>
		{/if}
		{#if $errors.tipo}
			<small>{$errors.tipo}</small>
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
		</div>
		{#if $errors.documentConfirm}
			<small>{$errors.documentConfirm}</small>
		{/if}

		<div>
			<label for="password" class="label">Contraseña</label>
			<input
				id="password"
				name="password"
				type="password"
				placeholder="Contraseña"
				bind:value={$form.password}
				class="input {$errors?.password
					? 'input-error'
					: 'input-bordered'}input-bordered input-sm w-full max-w-xs"
			/>
		</div>

		{#if $errors.password}
			<small>{$errors.password}</small>
		{/if}

		<div>
			<label for="passwordConfirm" class="label">Confirmacion contraseña</label>
			<input
				id="passwordConfirm"
				name="passwordConfirm"
				type="password"
				placeholder="Confirmar Contraseña"
				bind:value={$form.passwordConfirm}
				{...$constraints.passwordConfirm}
				class="input {$errors?.passwordConfirm
					? 'input-error'
					: 'input-bordered'}input-bordered input-sm w-full max-w-xs"
			/>
		</div>

		{#if $errors.password}
			<small>{$errors.passwordConfirm}</small>
		{/if}

		<div class="w-full flex justify-center mt-5">
			<button type="submit" class="btn btn-sm">Registrar</button>
		</div>
	</form>
</div>

<div class="mt-5">
	<SuperDebug data={$form} />
</div>
