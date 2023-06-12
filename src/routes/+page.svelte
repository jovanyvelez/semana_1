<script>
  import { enhance } from '$app/forms';
	import { stringify } from 'postcss';
  export let data;
  const {elResultado, role} = data;
</script>

{#if role === 'cliente'}

{#if elResultado.length > 0}
    <div class="flex flex-wrap justify-center">
        {#each elResultado as category (category.rootid) }
            <h1 class="my-10 text-center text-yellow-400">{category.name}</h1>
            {#each category.products as product (product.id) }
                <div class="card glass w-64 bg-base-100 shadow-xl mx-2 mt-2">
                <figure><img src={ product.image[1].secureUrl } alt="article" class="" /></figure>
                <div class="card-body">
                    <h2 class="card-title">{product.name.trim()}</h2>
                </div>
                </div>
            {/each}
        {/each}
    </div>
{/if}
{/if}
<form use:enhance method="post">
	<input type="submit" class="btn btn-warning" value="Sign out" />
</form>