import { writable } from 'svelte/store';
import {type Product, type ProductStore, type SearchStoreModel, type StoreSections, type client}  from '$lib/interfaces/Product';
import { browser } from '$app/environment';


export const products = writable<Product[]>( [] );

export const busqueda = writable([]);


const initCart: ProductStore[] = ( browser && JSON.parse( localStorage.getItem( "cart" ) ) ) || [];


export const cart = writable<ProductStore[]>( initCart );

cart.subscribe( (valor) => browser && (localStorage.cart = JSON.stringify(valor)));



export const arbol = writable<StoreSections[]>([]);


//Componentes 


export const createSearchStore = <T extends Record<PropertyKey, any>>(data:T[])=>{
    const { subscribe, set, update} = writable<SearchStoreModel<T>>({
        data:data,
        filtered:data,
        search: ""
    });

    return {
        subscribe,
        set,
        update
    }
}

export const searchHandler = <T extends Record<PropertyKey, any>>( store:SearchStoreModel<T> ) => {
    const searchTerm = store.search.toLowerCase() || "";
    store.filtered = store.data.filter( ( item ) => {
        return item.searchTerms.toLowerCase().includes(searchTerm) ;
    })
}