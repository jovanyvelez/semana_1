import fs from 'fs-extra';
import sharp from 'sharp';
import path from 'path';

export const load = async () => {
  const directorio = path.join(process.cwd(), 'static', 'tienda');

  try {
    const archivos = await fs.readdir(directorio);

    for (const archivo of archivos) {
      const rutaArchivo = path.join(directorio, archivo);
      
        const buffer = await fs.readFile(rutaArchivo);

        const rutaArchivoRedimensionado = path.join(directorio, `r_${archivo}`);
        await sharp(buffer)
          .resize(200, 300, {
            kernel: sharp.kernel.nearest,
            fit: 'contain',
            background: { r: 255, g: 255, b: 255, alpha: 0.5 }
          })
          .toFile(rutaArchivoRedimensionado);

        console.log(`Imagen redimensionada y guardada: ${rutaArchivoRedimensionado}`);
      
    }

    return {
      status: 200,
      body: 'Procesamiento de imágenes completado'
    };
  } catch (error) {
    console.error('Error al procesar las imágenes:', error);
    return {
      status: 500,
      body: 'Error en el procesamiento de imágenes'
    };
  }
}