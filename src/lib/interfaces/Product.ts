import type { string } from "zod";

interface Price{
  price1     : number,
  price2    ?: number,
  price3    ?: number,
  price4    ?: number,
  price5    ?: number,
  price6    ?: number,
  productId ?: string
}

interface Image {
  publicId  : string,
  secureUrl : string,
  productId : string 
}

export interface Product {
    id           ?: string,
    name          : string,
    description   : string,
    brand         : string,
    code          : string,
    eancode       : string,
    quantity      : number,
    promo         : boolean,
    active        : boolean,
    categoryId    : string,
    price         : [Price],
    image         : Image,
  };

  export interface ProductStore extends Product{
    qtyBuy: number
  }


  export interface StoreSections {
    id?:       string;
    name:       string;
    sections?:  StoreSections[];
  }

  export interface SearchStoreModel<T extends Record<PropertyKey, any>> {
    data: T[]
    filtered: T[]
    search: string
  }
  
  export interface client {
    nombre          :string,
    telefono        :string,
    email           :string,
    tipoDoc         :string,
    numDoc          :string,
    Departamento    :string,
    Ciudad          :string,
    direccion       :string,
    bussinessUnit   :string,
    role:{
      name:string
    }
  }