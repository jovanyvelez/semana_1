<script lang="ts">
	import { enhance } from '$app/forms';
	export let data;
	export let form;

	let producto = {
		name: '',
		descripcion: '',
		marca: '',
		codigo: '',
		ean: '',
		inventario: 0,
		precio1: 0,
		precio2: 0,
		precio3: 0,
		selected: undefined,
		error: '',
		status: false
	};
	interface StoreSections {
		id: string;
		name: string;
		hijos: StoreSections[];
	}

	let categoria: string | undefined;

	let allSections: StoreSections[] = data.categories;
	let sections: StoreSections[] = [];
	let sections1: StoreSections[] | undefined = [];
	let sections2 = [];
	let selected: StoreSections;
	let selected1: StoreSections | undefined;
	let selected2: StoreSections | undefined;

	const change = () => {
		sections1 = [];
		selected1 = undefined;
		selected2 = undefined;

		if (!selected) {
			sections = [];
			categoria = undefined;
			return;
		}

		sections = selected.hijos;
		categoria = selected.id;
		//product.hijos = selected.name;
	};
	let labelClass = 'text-blue-400 text-xl mr-6 my-2';

	const save = ({ cancel, formData }) => {
		if (!selected || selected.name === '') {
			alert('Debe ingresar al menos una categoria');
			cancel();
		}

		formData.append('categoryId', categoria ? categoria : '');

		return async ({ result }) => {
			if (result.type === 'success') {
				producto = {
					name: '',
					descripcion: '',
					marca: '',
					codigo: '',
					inventario: 0,
					precio1: 0,
					precio2: 0,
					precio3: 0,
					selected: undefined,
					error: '',
					status: false,
				};
				change();
					alert('Producto creado');
					producto.status = true
			}
			if (result.type === 'failure') {
				alert("NO SE CREO NADA")
				producto.error = result.data.error;

			}
		};
	};
</script>

<form
	method="post"
	action="?/add"
	enctype="multipart/form-data"
	use:enhance={save}
>
<div class="flex flex-col mx-auto md:w-10/12 lg:w-2/5 px-5">

	<div class="flex flex-col justify-center items-center">
		<label for="name" class={labelClass}>Nombre:</label>
		
		<input
		type="text"
		id="name"
		name="name"
		placeholder="product name"
		bind:value={producto.name}
		class="input input-primary {` ${form?.errors?.name ? 'border-error' : ''}`}"
		/>
		
		{#if form?.errors?.name}
		<span class="label-text-alt text-error">{form?.errors.name[0]}</span>
		{/if}
	</div>
	
	<div class="flex flex-col justify-center items-center ">
		<label for="description" class={labelClass}>Descripcion:</label>
		
		<input
		type="text"
		id="description"
			name="description"
			bind:value={producto.descripcion}
			class="input input-primary {` ${form?.errors?.description ? 'border-error' : ''}`}"
			placeholder="description"
		/>

		{#if form?.errors?.description}
		<span class="label-text-alt text-error">{form?.errors.description[0]}</span>
		{/if}
	</div>
	
	<div class="flex flex-col">
		<label for="brand" class={labelClass}>Marca:</label>
		
		<input
		type="text"
		id="brand"
		name="brand"
		bind:value={producto.marca}
			class="input input-primary {`${form?.errors?.brand ? 'border-error' : ''}`}"
			placeholder="type"
			/>
			
			{#if form?.errors?.brand}
			<span class="label-text-alt text-error">{form?.errors.brand[0]}</span>
			{/if}
		</div>

	<div class="flex flex-col">
		<label for="codigo" class={labelClass}>Codigo:</label>
		<input
			type="text"
			id="codigo"
			name="code"
			bind:value={producto.codigo}
			class="input input-primary {`${form?.errors?.code ? 'border-error' : ''}`}"
			placeholder="code"
		/>
		{#if form?.errors?.code}
			<span class="label-text-alt text-error">{form?.errors.code[0]}</span>
		{/if}
		{#if form?.codeExist}
			<span class="label-text-alt text-error">Codigo ya existe</span>
		{/if}
	</div>

	<div class="flex flex-col">
		<label for="qty" class={labelClass}>Inventario:</label>
		<input
			type="number"
			id="qty"
			name="quantity"
			bind:value={producto.inventario}
			class="input input-primary {` ${form?.errors?.quantity ? 'border-error' : ''}`}"
		/>
		{#if form?.errors?.quantity}
			<span class="label-text-alt text-error">{form?.errors.quantity[0]}</span>
		{/if}
	</div>

	<div class="flex flex-col">
		<label for="precio1" class={labelClass}>Precio lista1:</label>
		<input
			type="number"
			name="price1"
			id="precio1"
			bind:value={producto.precio1}
			class="input input-primary {` ${form?.errors?.price1 ? 'border-error' : ''}`}"
		/>
		{#if form?.errors?.price1}
			<span class="label-text-alt text-error">{form?.errors.price1[0]}</span>
		{/if}
	</div>

	<div class="flex flex-col">
		<label for="precio2" class={labelClass}>Precio lista2 :</label>
		<input
			type="number"
			id="precio2"
			name="price2"
			bind:value={producto.precio2}
			class="input input-primary {` ${form?.errors?.price2 ? 'border-error' : ''}`}"
		/>
		{#if form?.errors?.price2}
		<span class="label-text-alt text-error">{form?.errors.price2[0]}</span>
		{/if}
	</div>

	<div class="flex flex-col">
		<label for="precio3" class={labelClass}>Precio lista3:</label>
		
		<input
		type="number"
			id="precio3"
			name="price3"
			bind:value={producto.precio3}
			class="input input-primary {` ${form?.errors?.price3 ? 'border-error' : ''}`}"
			/>
			{#if form?.errors?.price3}
			<span class="label-text-alt text-error">{form?.errors.price3[0]}</span>
			{/if}
		</div>

	<div class="flex my-5">
		<input type="checkbox" id="promo" name="promo" class="mr-6 h-10 w-6 border border-yellow-400" />
		<label for="active" class={labelClass}>Está en oferta?</label>
	</div>

	<div class="flex my-5">
		<input
			type="checkbox"
			id="active"
			name="active"
			checked
			class="mr-6 h-10 w-6 border border-blue-400"
			/>
			<label for="active" class={labelClass}>Activar en stock?</label><br />
		</div>
		
		<div class="px-4 pt-8 flex flex-col w-full place-items-center">
			<div class="grid gap-6 mb-6 md:grid-cols-2">
				<div>
					<select bind:value={selected} on:change={change} class="select select-primary select-lg">
						<option value={undefined} on:click={change} />
						{#each allSections as section}
						{#if section.name !== ''}
							<option value={section} on:click={change}>
								{section.name}
							</option>
						{/if}
						{/each}
					</select>
			</div>

			<div>
				<select
				bind:value={selected1}
				on:change={() => {
					sections1 = selected1?.hijos;
					sections2 = [];
					selected2 = undefined;
					categoria = selected1?.id;
				}}
					class="select select-primary select-md"
					>
					{#each sections as section}
						<option value={section}>
							{section.name}
						</option>
					{/each}
				</select>
			</div>

			{#if sections1}
				<div>
					<select
						bind:value={selected2}
						on:change={() => (categoria = selected2?.id)}
						class="select select-primary select-sm w-full max-w-xs"
						>
						{#each sections1 as section}
						<option value={section}>
							{section.name}
						</option> <label for="floating_filled" />
						{/each}
					</select>
				</div>
			{/if}
		</div>
	</div>
	{#if form?.errors?.categoryId}
		<span class="label-text-alt text-error">{form?.errors.categoryId[0]}</span>
	{/if}
	<label for="floating_filled" class={labelClass}>Subir archivo</label>
	<input
		type="file"
		name="imagen"
		id="floating_filled"
		accept=".jpg, .jpeg, .png"
		class="bg-blue-400 mb-2"
		placeholder=" "
	/>
	{#if form?.errors}
		<pre class="text-error">{JSON.stringify(form?.errors,null,2)}</pre>
	{/if}
	{#if producto.error}
	<small class="label-text-alt text-error">{producto.error}</small>
	{/if}
	{#if producto.status}
	<small class="label-text-alt text-green-400">producto creado!</small>
	{/if}
	<input type="submit" class="btn btn-primary btn-sm my-5" />
</div>
</form>
