<script>
	import { enhance } from '$app/forms';

    export let data;
	export let form;
	
	const categorias = data.categoriasHijasRaiz;
	console.log(categorias);
    let errors
    let name = '';
    let selected;
	let selected1;
	let option = 0;

    const saveCategory = ({ cancel, formData }) => {
		
        errors = {};
        let padreId;

        if(typeof name !=='string'|| name.length < 1){
				errors.name = "No ingresa nombre de categoria"
                cancel()
            }

        if(option === 0){
            cancel()
        }

        if(option===1){
            padreId = selected;
            if(typeof selected !=='string'|| selected.length < 1){
                errors.raiz = "No selecciona cat padre"
				cancel()
            }
        }

        if(option===2){
            padreId = selected1;
            if(typeof selected1 !=='string'|| selected1.length < 1){
				errors.padre = "No selecciona cat padre"
                cancel()
            }
        }

		formData.append('categoria', JSON.stringify({name,padreId}));
        

		return async ({ result }) => {
			console.log(result);
			if (result.type === 'success') {
				name = '';
				option = 0;
				alert('Categoria grabada')
				//goto(`/tienda/conf_envio/${result.data.savedorder}`)
			}
			if (result.type === 'failure') {
				errors.generic = result.data.message;
			}
		};
	};


	$: hijas = categorias.find((e) => e.id === selected)?.hijos;

</script>

<div class="flex justify-center flex-wrap items-center p-2 flex-col">
	<label for="catName">
		Nombre de Categoria
		<input type="text" bind:value={name} id="catName" class="input input-warning input-sm" />
	</label>
	{#if errors?.name}
			<small class="text-error">{errors.name}</small>
	{/if}
	{#if option === 0}
		<div>
			<div class="form-control">
				<label class="label cursor-pointer">
					<input
						type="radio"
						name="radio-10"
						bind:group={option}
						value={1}
						class="radio checked:bg-red-500"
					/>
					A categoria raiz
				</label>
			</div>
			<div class="form-control">
				<label class="label cursor-pointer">
					<input
						type="radio"
						name="radio-10"
						bind:group={option}
						value={2}
						class="radio checked:bg-blue-500"
					/>
					A categoria hija
				</label>
			</div>
		</div>
	{/if}
</div>


	<div class="flex justify-center flex-col items-center">
		<label for="" class:hidden="{option === 0}">
			Pertenece a:
			<select bind:value={selected} class="select select-bordered w-full max-w-xs">
				{#each categorias as categoria (categoria.id)}
					<option value={categoria.id}>{categoria.name}</option>
				{/each}
			</select>
		</label>
		{#if errors?.raiz}
			<small class="text-error">{errors.raiz}</small>
		{/if}

		{#if option === 2}

			<label for="">
				Pertenece a:
				<select bind:value={selected1} class="select select-bordered w-full max-w-xs">
					{#each hijas as categoria (categoria.id)}
						<option value={categoria.id}>{categoria.name}</option>
					{/each}
				</select>
			</label>
			{#if errors?.padre}
			<small class="text-error">{errors.padre}</small>
		{/if}
		{/if}
		
		<form method="post" use:enhance={saveCategory}>
			<button type="submit" class="btn btn-warning mt-5">Grabar</button>
		</form>
	</div>

