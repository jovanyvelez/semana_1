<script lang="ts">
	
	export let data;
	export let form;

</script>


<h1 class="text-center">Ingreso</h1>

<!--SuperDebug data={$form}/-->
<div class="px-4 pt-8 flex flex-col w-full place-items-center">
	<img src="menu.png" alt="">
	<form action="?/login" method="post">
		<div>
			<label for="email" class="label">Email</label>
			<input
				id="email"
				name="email"
				type="text"
				class="input input-md input-primary input-bordered rounded-md w-full max-w-xs"
			/>
		</div>



		<div>
			<label for="password" class="label">Password</label>
			<input
				id="password"
				name="password"
				type="password"
				class="input input-primary input-bordered w-full max-w-xs"
			/>
		</div>

		{#if form?.message}
			<small class="text-error">{form.message}</small>
		{/if}
		<div class="w-full flex justify-center">
			<button type="submit" class="btn btn-xs btn-primary w-full mt-4">Ingresar</button>
		</div>
	</form>

</div>