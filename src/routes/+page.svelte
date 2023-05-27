<script>
  import Category from '$lib/components/Category.svelte';
  import Item from '$lib/components/Item.svelte';
  export let data;
  const {elResultado} = data;
</script>

{#if elResultado.length > 0}

    <div class="flex flex-wrap justify-center">
        {#each elResultado as category (category.rootid) }
            <h1 class="my-10 text-center text-yellow-400">{category.name}</h1>
            {#each category.products as product (product.id) }
                <div class="card glass w-64 bg-base-100 shadow-xl mx-2 mt-2">
                <figure><img src={ product.image[0].secureUrl } alt="article" class="" /></figure>
                <div class="card-body">
                    <h2 class="card-title">{product.name.trim()}</h2>
                </div>
                </div>
            {/each}
        {/each}
    </div>
{/if}



<!--div class="flex flex-wrap justify-center">
{#each data.elResultado as category (category.id) }
  <h1 class="my-10 text-center text-yellow-400">{category.name}</h1>
  {#each category.productos as product (product.id) }

  <div class="card glass w-64 bg-base-100 shadow-xl mx-2 mt-2">
    <figure><img src={ product.image[0].secureUrl } alt="article" class="" /></figure>
    <div class="card-body">
      <h2 class="card-title">{product.name.trim()}</h2>
    </div>
  </div>
    
  {/each}

{/each}

  
</div-->
<!--
{:else}
  <h1 class="text-xl sm:text-7xl ">Ups, no hay productos aquí</h1>
{/if}
-->
