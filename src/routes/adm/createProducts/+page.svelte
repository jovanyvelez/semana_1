<script lang="ts">
    import { enhance } from '$app/forms';
	export let data;
    export let form;
	
	
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
		sections = selected.hijos;
		sections1 = [];
		selected1 = undefined;
		selected2 = undefined;
		categoria = selected.id;
		//product.hijos = selected.name;
	};
	let labelClass = 'text-yellow-400 text-xl mr-6 my-2';
	let formClass = 'flex justify-evenly items-center lg:flex-wrap sm:flex-col mx-auto w-full';
</script>

<form
    method="post"
	action="?/add"
	enctype="multipart/form-data"
	use:enhance = {({data})=>data.append('categoryId', categoria ? categoria : '')}
    class={formClass}>
    
	<div class="flex flex-col">
		
		<label for="name" class={labelClass}>Nombre:</label>

		<input
			type="text"
			id="name"
			name="name"
			placeholder="product name"
			class="input input-warning {` ${form?.errors?.name ? 'border-error' : ''}`}"
		/>

		{#if form?.errors?.name}
			<span class="label-text-alt text-error">{form?.errors.name[0]}</span>
		{/if}

	</div>

	<div class="flex flex-col">
		<label for="description" class={labelClass}>Descripcion:</label>

		<input
			type="text"
			id="description"
			name="description"
			class="input input-warning {` ${form?.errors?.description ? 'border-error' : ''}`}"
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
			class="input input-warning {`${form?.errors?.brand ? 'border-error' : ''}`}"
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
			class="input input-warning {`${form?.errors?.code ? 'border-error' : ''}`}"
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
		<label for="codigoean" class={labelClass}>Codigo Ean:</label>

		<input
			type="text"
			id="codigoean"
			name="eancode"
			placeholder="Ean code"
			class="input input-warning {`${form?.errors?.eancode ? 'border-error' : ''}`}"
		/>
		{#if form?.errors?.eancode}
			<span class="label-text-alt text-error">{form?.errors.eancode[0]}</span>
		{/if}
		{#if form?.eancodExist}
			<span class="label-text-alt text-error">Codigo ya existe</span>
		{/if}
	</div>

	<div class="flex flex-col">
		<label for="qty" class={labelClass}>Inventario:</label>
		<input
			type="number"
			id="qty"
			name="quantity"
			class="input input-warning {` ${form?.errors?.quantity ? 'border-error' : ''}`}"
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
			class="input input-warning {` ${form?.errors?.price1 ? 'border-error' : ''}`}"
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
			class="input input-warning {` ${form?.errors?.price2 ? 'border-error' : ''}`}"
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
			class="input input-warning {` ${form?.errors?.price3 ? 'border-error' : ''}`}"
		/>
		{#if form?.errors?.price3}
			<span class="label-text-alt text-error">{form?.errors.price3[0]}</span>
		{/if}
	</div>

	<div class="flex my-5">
		<input
			type="checkbox"
			id="promo"
			name="promo"
			class="mr-6 h-10 w-6 border border-yellow-400"
		/>
		<label for="active" class={labelClass}>Está en oferta?</label>
	</div>

	<div class="flex my-5">
		<input
			type="checkbox"
			id="active"
			name="active"
			class="mr-6 h-10 w-6 border border-yellow-400"
		/>
		<label for="active" class={labelClass}>Activar en stock?</label><br />
	</div>

	<div class="px-4 pt-8 flex flex-col w-full place-items-center">
		<div class="grid gap-6 mb-6 md:grid-cols-2">
			<div>
				<select bind:value={selected} on:change={change} class="select select-warning select-lg">
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
					class="select select-warning select-md"
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
						class="select select-warning select-sm w-full max-w-xs"
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
		class="text-yellow-400"
	 	placeholder=" "
	/>
	{#if form?.errors?.imagen}
			<span class="label-text-alt text-error">{form?.errors.imagen[0]}</span>
	{/if}

    <input type="submit" class="btn btn-warning">

</form>
