import { env } from '$env/dynamic/private';
import { prisma } from '$lib/server/prisma';
import { productSchema } from '$lib/zodSchemas/productSchema.js';
import { fail } from '@sveltejs/kit';
import sharp from 'sharp';
import { uploadImage } from '$lib/server/cloudinary';
import fs from 'fs-extra';

//import { uploadImage } from '$lib/server/cloudinary';

import { ZodError, string } from 'zod';

export const load = async () => {
	const categories = await prisma.category.findMany({
		where: { padreId: null },

		select: {
			id: true,
			name: true,
			hijos: {
				select: {
					id: true,
					name: true,
					hijos: {
						select: {
							id: true,
							name: true,
							hijos: true
						}
					}
				}
			}
		}
	});

	await prisma.$disconnect();

	return { categories };
};

//Actions

export const actions = {
	add: async ({ request }) => {
		//let formData = Object.fromEntries( await request.formData());
		const data = await request.formData();
		const product = {
			name: data.get('name'),
			description: data.get('description'),
			brand: data.get('brand'),
			code: data.get('code'),
			eancode: data.get('eancode'),
			quantity: Number(data.get('quantity')),
			price1: Number(data.get('price1')),
			price2: Number(data.get('price2')),
			price3: Number(data.get('price3')),
			promo: data.get('promo') ? true : false,
			active: data.get('active') ? true : false,
			categoryId: data.get('categoryId'),
			imagen: data.get('imagen') as Blob
		};
		try {
			const result = productSchema.parse(product);

		} catch (error: unknown) {
			if (error instanceof ZodError) {
				const { fieldErrors: errors } = error.flatten();
				console.log(errors);
				const { imagen, ...data } = product;
				return fail(400, { data, errors, error:'tipo de datos incorrectos' });
			}
		}

		try {
			//Verificamos que este código de producto no exista
			const codigo = await prisma.Product.findFirst({
				where: {
					code: product.code
				}
			});

			if (codigo) {
				await prisma.$disconnect();
				const { imagen, ...data } = product;
				return fail(400, { data, error: 'Codigo ya existe' });
			}


		} catch (error) {
			console.log('No se pudo hacer la consulta en la tabla Productos');
		} finally {
			await prisma.$disconnect();
		}

		let buffer;
		try {
			buffer = Buffer.from(await product.imagen.arrayBuffer());
		} catch (error) {
			return fail(400, { message: 'errorImagen', error: 'No se pudo crear buffer' });
		}

		/**
		 * Guardamos la imagen en un directorio temp usando
		 * la libreria fs-extra
		 */
		//fs.writeFileSync(`static/tienda/temp.png`, buffer, 'base64');

		/**
		 * Creamos una imagen mas pequeña a partir de imagen original
		 * con ayuda de la libreria sharp
		 * y la guardamos en el directorio static/tienda
		 */
		//const filePath = `/tienda/${Date.now()}.png`;

		let outputFilePath;		


		if(env.NODE_ENV === "development"){
			outputFilePath = 'static/tmp.png';
		}else{
			outputFilePath = 'build/client/tmp.png';
		}

		try {
			await sharp(buffer)
				.resize(200, 300, {
					kernel: sharp.kernel.nearest,
					fit: 'contain',
					background: { r: 255, g: 255, b: 255, alpha: 0.5 }
				})
				.toFile(outputFilePath)
				.then(() => {
					// output.png is a 200 pixels wide and 300 pixels high image
					// containing a centered scaled version
					// contained within the north-east corner of a semi-transparent white canvas					
				});
		} catch (error) {
			console.log('No se pudo redimensionar la imagen');
			return fail(400, { message: 'No se pudo Redim Image', error:'no se redimensionó la imagen' });
		}
		
		/**
		 * Guardamos en cloudinary
		 */

		
        let result;

		try {
			result = await uploadImage(outputFilePath);
		} catch (err) {
			console.log('No fue posible crear algunas imagenes en cloudinary');
			return fail(400, { message: 'No se pudo Redim Image', error:'no se guardo cloudinary' });
		}
		
		try {
			console.log("vamos aqui")
			console.log(outputFilePath)
	
			if(env.NODE_ENV === "development"){
				fs.copyFile(outputFilePath, `static/${result.public_id}.${result.format}`);
			}else{
				fs.copyFile(outputFilePath, `build/client/${result.public_id}.${result.format}`);
				//fs.rename(`build/client/${result.public_id}.${result.format}`,'build/client/tienda/tmp.png')
			}
			
		} catch (error) {
			return fail(400, { message: 'No se creó backup de imagen', error:'no se guardo backup de imagen' });
		}

		const { price1, price2, price3, imagen, ...rest } = product;

		let newProduct;

		try {
			newProduct = await prisma.Product.create({
				data: rest
			});
		} catch (error) {
			console.error(error);
		}

		try {
			const newImage = await prisma.Image.create({
				data: 
					{
						publicId: `${result.public_id}.${result.format}`,
						secureUrl: result.secure_url,
						productId: newProduct.id,
						name: 'main'
					},
			});

			const newPrice = await prisma.Price.create({
				data: {
					price1,
					price2,
					price3,
					productId: newProduct.id
				}
			});
		} catch (error) {
			console.error(error);
		}
		//fs.chmodSync(outputFilePath, '777');
		return { success: true };
	},

	delete: async ({ cookies, request }) => {
		const data = await request.formData();
	}
};