import { z } from 'zod';

export const productSchema = z
	.object({
		name: z
		.string({ required_error: 'Se requiere nombre' })
		.min(3, { message: 'Se requiere minimo de 3 caracteres' })
		.max(48, { message: 'Debe usar menos de 49 caracteres' })
		.trim(),
		description: z
		.string({ required_error: 'Se requiere descripcion' })
		.min(3, { message: 'Se requiere minimo de 3 caracteres' })
		.max(32)
		.trim(),
		brand: z
		.string({ required_error: 'Se requiere Marca' })
		.min(3, { message: 'Se requiere minimo de 3 caracteres' })
		.max(32)
		.trim(),
		code: z
		.string({ required_error: 'Se requiero Codigo' })
		.min(1, { message: 'Se requiere codigo' })
		.max(16)
		.trim(),
		quantity: z
		.number({required_error:'Se requiere cantidad'})
		.nonnegative({message:'No puede ser negativa'})
		,
		price1: z
		.number({required_error:'Se requiere cantidad'})
		.nonnegative({message:'No puede ser negativa'}),
		
		categoryId: z
		.string({required_error:'Debes escoger una categoria'}).uuid({message:'Error'}),

		imagen: z
		.object({
			size: z.number({required_error:"Debe incluir archivo"})
			.gt(0,{message:'No hay archivo'})
			.lt(3000000,{message:"menor que dos megas"}),
			type: z.enum(["image/gif", "image/jpeg", "image/png"])
		  })
	})
	//
	/*	
        code: z.string({required_error:"Debe ingresar codigo"}).trim(),
        eancode: z.string({required_error:"Falta codigo Ean"}).length(13).regex(/^\d+$/),
        quantity: z.number({required_error: "Falta cantidad"}).default(0),
        price1: z.number({required_error:"Falta precio"}).default(0),
        price2: z.number({required_error:"Falta precio"}).default(0),
        price3: z.number({required_error:"Falta precio"}).default(0),
		/*email: z.string().email().min(5),
		telefono: z.string().regex(/^((3\d{9})|(60\d{8}))$/, 'Número telefónico no es de Colombia'),
		tipo: z.enum(['CC', 'CA', 'PA', 'NIT']),
		document: z.string().regex(/^[0-9]{4,}$/i, 'Requeriod solo numeros y mínimo 4 caracteres'),
		documentConfirm: z
			.string()
			.regex(/^[0-9]{4,}$/i, 'Requeriod solo numeros y mínimo 4 caracteres'),
		password: z.string().min(4).trim().regex(/^(?=.*[a-zA-Z])(?=.*\d).*$/, 'debe terner al menos un numero y una letra'),
		passwordConfirm: z.string().min(4).trim()
	})*/
	/*.superRefine(({ passwordConfirm, password, document, documentConfirm }, ctx) => {
		if (passwordConfirm !== password) {
			ctx.addIssue({
				code: 'custom',
				message: 'Password y Confirmación no coinciden',
				path: ['password']
			});
			ctx.addIssue({
				code: 'custom',
				message: 'Password y Confirmación no coinciden',
				path: ['passwordConfirm']
			});
		}

		if (documentConfirm !== document) {
			ctx.addIssue({
				code: 'custom',
				message: 'Documento y Confirmación no coinciden',
				path: ['document']
			});
			ctx.addIssue({
				code: 'custom',
				message: 'Documento y Confirmación no coinciden',
				path: ['passwordConfirm']
			});
		}
	});*/