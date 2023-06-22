<script lang="ts">

	let buttonMenu = true;
	let showClass = 'hidden';
	let salir = false;
	const buttonToggle = () => {
		buttonMenu = !buttonMenu;
		buttonMenu ? (showClass = 'hidden') : (showClass = '');
	};
	
</script>

{#if !salir }
<div class="navbar bg-base-100 bg-gradient-to-t mb-4 from-yellow-50 to-yellow-600 text-black">
	
	<div class="flex-1">
		<div class="ml-3 text-xl text-black sm:text-xl font-bold">EQUISOL STORE</div>
	</div>

	<div class="hidden md:block flex-none">
		<ul class="menu menu-horizontal px-1">
			<li>
				<a href="/">
					Categorias
					<svg
						class="fill-current"
						xmlns="http://www.w3.org/2000/svg"
						width="20"
						height="20"
						viewBox="0 0 24 24"
						><path d="M7.41,8.58L12,13.17L16.59,8.58L18,10L12,16L6,10L7.41,8.58Z" /></svg
					>
				</a>
				<ul class="p-2 bg-base-100">
					<li><a href="/adm/categories/raiz">Crear Raiz</a></li>
					<li><a href="/adm/categories/hija">Crear Secundaria</a></li>
				</ul>
			</li>
			<li>
				<a href="/">
					Productos
					<svg
						class="fill-current"
						xmlns="http://www.w3.org/2000/svg"
						width="20"
						height="20"
						viewBox="0 0 24 24"
						><path d="M7.41,8.58L12,13.17L16.59,8.58L18,10L12,16L6,10L7.41,8.58Z" /></svg
					>
				</a>
				<ul class="p-2 bg-base-100">
					<li><a href="/adm/createProducts">Crear</a></li>
				</ul>
			</li>
			<li>
				<a href="/">
					Usuarios
					<svg
						class="fill-current"
						xmlns="http://www.w3.org/2000/svg"
						width="20"
						height="20"
						viewBox="0 0 24 24"
						><path d="M7.41,8.58L12,13.17L16.59,8.58L18,10L12,16L6,10L7.41,8.58Z" /></svg
					>
				</a>
				<ul class="p-2 bg-base-100">
					<!--li><a href="/adm/register">Crear</a></li-->
					<li><a href="/adm/auth">Contraseña</a></li>
				</ul>
			</li>
			<li><a on:click={()=>{salir = true}} href="/login"><li>Salir</a></li>
		</ul>
	</div>

	<div class="md:hidden flex items-center text-black">
		<button on:click={buttonToggle}>
			<svg
				xmlns="http://www.w3.org/2000/svg"
				class="h-6 w-6"
				viewBox="0 0 20 20"
				fill="currentColor"
			>
				<path
					fill-rule="evenodd"
					d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z"
					clip-rule="evenodd"
				/>
			</svg>
		</button>
	</div>

</div>

<div class="navbar md:hidden">
	<div class="{showClass} flex-none">
		<ul class="menu menu-vertical px-1">
			<li>
				<a href="/">
					Categorias
					<svg
						class="fill-current"
						xmlns="http://www.w3.org/2000/svg"
						width="20"
						height="20"
						viewBox="0 0 24 24"
						><path d="M7.41,8.58L12,13.17L16.59,8.58L18,10L12,16L6,10L7.41,8.58Z" /></svg
					>
				</a>
				<ul class="p-2 bg-base-100">
					<li ><a on:click={buttonToggle} href="/adm/categories/raiz">Crear Raiz</a></li>
					<li><a on:click={buttonToggle} href="/adm/categories/hija">Crear Secundaria</a></li>
				</ul>
			</li>
			<li>
				<a href="/">
					Productos
					<svg
						class="fill-current"
						xmlns="http://www.w3.org/2000/svg"
						width="20"
						height="20"
						viewBox="0 0 24 24"
						><path d="M7.41,8.58L12,13.17L16.59,8.58L18,10L12,16L6,10L7.41,8.58Z" /></svg
					>
				</a>
				<ul class="p-2 bg-base-100">
					<li><a on:click={buttonToggle}  href="/adm/createProducts">Crear</a></li>
				</ul>
			</li>
			<li>
				<a href="/">
					Usuarios
					<svg
						class="fill-current"
						xmlns="http://www.w3.org/2000/svg"
						width="20"
						height="20"
						viewBox="0 0 24 24"
						><path d="M7.41,8.58L12,13.17L16.59,8.58L18,10L12,16L6,10L7.41,8.58Z" /></svg
					>
				</a>
				<ul class="p-2 bg-base-100">
					<!--li><a href="/adm/register">Crear</a></li-->
					<li><a on:click={buttonToggle} href="/adm/auth">Contraseña</a></li>
				</ul>
			</li>
			<li>
				<a href="/">
					Parent
					<svg
						class="fill-current"
						xmlns="http://www.w3.org/2000/svg"
						width="20"
						height="20"
						viewBox="0 0 24 24"
						><path d="M7.41,8.58L12,13.17L16.59,8.58L18,10L12,16L6,10L7.41,8.58Z" /></svg
					>
				</a>
				<ul class="p-2 bg-base-100">
					<li><a href="/">Submenu 1</a></li>
					<li><a href="/">Submenu 2</a></li>
				</ul>
			</li>
		</ul>
	</div>
</div>
{/if}