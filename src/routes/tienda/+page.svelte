<script>
    import Category from '$lib/components/Category.svelte';
      export let data;

  </script>
     
  {#each data.datos as category}
  <div class="pt-24"></div>
    <div class="categories">
      <Category {category} />
    </div>
  {/each}

