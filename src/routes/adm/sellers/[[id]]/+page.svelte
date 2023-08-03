<script lang="ts">
	import type { PageData } from './$types';
	import { superForm } from 'sveltekit-superforms/client';
	export let data: PageData;
	const { form, message, enhance, errors } = superForm(data.form, {
		resetForm: true
	});
</script>

<h1 class="text-center">Ingreso de Vendedores</h1>

<form method="post" use:enhance>
	<input type="hidden" name="id" bind:value={$form.id} />
	{#if $message}
		<h3>{$message}</h3>
	{/if}
	<div class="flex flex-col justify-center sm:w-1/3 mx-auto">
		
		<label for="code" class="label"> Codigo </label>
		<input name="code" id="code" class="input input-primary" bind:value={$form.code} />
		{#if $errors.code } <span class="text-red-500">{$errors.code}</span> {/if}

		<label for="" class="label"> Email </label>
		<input name="email" id="email" class="input input-primary" bind:value={$form.email} />
		{#if $errors.email } <span class="text-red-500">{$errors.email}</span> {/if}
		<button class="btn btn-primary btn-xs mt-5">Grabar</button>
	</div>
</form>

<div class="grid grid-cols-1 sm:grid-cols-2 mt-5">
	{#each data.allSellers as seller }
		<a href="/adm/sellers/{seller.id}">{seller.email}</a>
		<h3>{seller.code}</h3>
	{/each}
</div>