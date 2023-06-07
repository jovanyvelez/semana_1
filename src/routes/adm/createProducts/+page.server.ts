import { prisma } from '$lib/server/prisma';
import { productSchema } from '$lib/zodSchemas/productSchema.js';
import { fail } from '@sveltejs/kit';
import sharp from 'sharp';
//import fs from 'fs-extra';
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
			console.log(product);
		} catch (error: unknown) {
			if (error instanceof ZodError) {
				//console.log(error.flatten());
				const { fieldErrors: errors } = error.flatten();
				console.log(errors);
				const { imagen, ...data } = product;
				return fail(400, { data, errors });
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
				return fail(400, { data, codeExist: true });
			}

			//Verificamos que el código ean no exista
			const eancode = await prisma.Product.findFirst({
				where: {
					eancode: product.eancode
				}
			});

			if (eancode) {
				await prisma.$disconnect();
				const { imagen, ...data } = product;
				return fail(400, { data, eancodExist: true });
			}
		} catch (error) {
			console.log('No se pudo hacer la consulta en la tabla Productos');
		} finally {
			await prisma.$disconnect();
		}

		let buffer;
		try {
			console.log('buffer');
			buffer = Buffer.from(await product.imagen.arrayBuffer());
		} catch (error) {
			return fail(400, { message: 'error' });
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
		const path = `/tienda/${Date.now()}.png`;
		console.log(path);
		try {
			await sharp(buffer)
				.resize(200, 300, {
					kernel: sharp.kernel.nearest,
					fit: 'contain',
					background: { r: 255, g: 255, b: 255, alpha: 0.5 }
				})
				.toFile(`static${path}`)
				.then(() => {
					// output.png is a 200 pixels wide and 300 pixels high image
					// containing a centered scaled version
					// contained within the north-east corner of a semi-transparent white canvas
				});
		} catch (error) {
			console.log('No se pudo redimensionar la imagen');
			return fail(400, { message: 'No se pudo Redim Image' });
		}
		/**
		 * Si quisieramos guardar en cloudinary
		 */

		/*
        let result, result1;
		try {
			result = await uploadImage('./temp/temp.png');
			result1 = await uploadImage('./temp/output.png');
		} catch (err) {
			console.log('No fue posible crear algunas imagenes en cloudinary');
		}
		*/
		const { price1, price2, price3, imagen, ...rest } = product;
		console.log(rest);
		let newProduct;

		try {
			newProduct = await prisma.Product.create({
				data: rest
			});
		} catch (error) {
			console.error(error);
		}

		try {
			const newImage = await prisma.Image.createMany({
				data: [
					{
						publicId: '', //result1?.public_id,
						secureUrl: path, //result1?.secure_url,
						productId: newProduct.id,
						name: 'main'
					},
					{
						publicId: '',
						secureUrl: path,
						productId: newProduct.id,
						name: 'one'
					}
				]
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
		return { success: true };
	},

	delete: async ({ cookies, request }) => {
		const data = await request.formData();
	}
};
