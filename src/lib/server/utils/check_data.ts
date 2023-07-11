interface Producto {
    code: string;
    quantity: number;
    price1: number;
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
  
