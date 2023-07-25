interface Producto {
    code: string;
    quantity: number;
    price1: number;
  }
  
  interface Orden {
    id: string;
  }

  export const arrayBienFormado = (productosActualizar: unknown): boolean => {
    if (!Array.isArray(productosActualizar)) {
      return false;
    }
  
    return productosActualizar.every((item: unknown) => {
      if (typeof item === 'object' && item !== null) {
        const producto = item as Producto;
        return typeof producto.code === 'string' &&
               typeof producto.quantity === 'number' &&
               typeof producto.price1 === 'number';
      }
      return false;
    });
  };



  export const arrayBienFormado1 = (ordenesActualizar: Orden[]): boolean => {
    
    if (!Array.isArray(ordenesActualizar)) {
      return false;
    }
  
    return ordenesActualizar.every((item: Orden) => {
      if (typeof item === 'object' && item !== null) {
        const orden = item;
        return typeof orden.id === 'number'
      }
      return false;
    });
  };
  
