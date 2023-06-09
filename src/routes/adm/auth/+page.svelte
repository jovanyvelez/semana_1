<script lang="ts">
	import { authSchema } from '$lib/zodSchemas/schemas';
	import SuperDebug from 'sveltekit-superforms/client/SuperDebug.svelte';
	import { superForm } from 'sveltekit-superforms/client';

	export let data;

	const { form, enhance, reset, constraints, errors } = superForm(data.form, {
		applyAction: true,
		invalidateAll: true,
		resetForm: false,
		validators: authSchema
	});
</script>


<form action="?/register" method="post" use:enhance>
	<div class="flex flex-wrap items-center p-5 flex-col">
		<h2 class="text-center">Asignación de Contraseña de Usuario</h2>
		<label for="email" class="label">Email de usuario</label>
		<div>
			<input
				id="email"
				name="email"
				data-invalid={$errors.email}
				{...$constraints.email}
				class="input {$errors?.email ? 'input-error' : 'input-bordered'} input-sm rounded-md "
				bind:value={$form.email}
			/>
			
		</div>

		<label for="password" class="label">password</label>
		<div>
			<input
				type="password"
				id="password"
				name="password"
				class="input {$errors?.email ? 'input-error' : 'input-bordered'} input-sm rounded-md "
				data-invalid={$errors.password}
				{...$constraints.password}
				bind:value={$form.password}
			/>
		</div>
		<div>
			{#if $errors.password}
					<small class="jovastext-red-500">{$errors.password}</small>
			{/if}
			{#if $errors.email}
				<small class="text-red-500">{$errors.email}</small>
			{/if}
		</div>

		<input type="submit" value="Continue" class="btn btn-warning mt-4 btn-sm" />
	</div>
</form>

<!--SuperDebug data={$form} /-->
