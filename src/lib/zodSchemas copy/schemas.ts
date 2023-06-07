import { z } from 'zod';

export const userSchema = z
	.object({
		name: z.string({required_error:"Se requiere nombre de usuario"})
		.min(5,{message:"Nombre requiere mas de cinco caracteres"}).trim(),
		email: z.string().email().min(5),
		telefono: z.string().regex(/^((3\d{9})|(60\d{8}))$/, 'Número telefónico no es de Colombia'),
		tipo: z.enum(['CC', 'CA', 'PA', 'NIT']),
		document: z.string().regex(/^[0-9]{4,}$/i, 'Requeriod solo numeros y mínimo 4 caracteres'),
		documentConfirm: z
			.string()
			.regex(/^[0-9]{4,}$/i, 'Requeriod solo numeros y mínimo 4 caracteres'),
		password: z.string().min(4).trim().regex(/^(?=.*[a-zA-Z])(?=.*\d).*$/, 'debe terner al menos un numero y una letra'),
		passwordConfirm: z.string().min(4).trim()
	})
	.superRefine(({ passwordConfirm, password, document, documentConfirm }, ctx) => {
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
	});

	export const createUserSchema = z
	.object({
		name: z.string({required_error:"Se requiere nombre de usuario"})
		.min(5,{message:"Nombre requiere mas de cinco caracteres"}).trim(),
		email: z.string().email().min(5),
		telefono: z.string().regex(/^((3\d{9})|(60\d{8}))$/, 'Número telefónico no es de Colombia'),
		tipo: z.enum(['CC', 'CA', 'PA', 'NIT']),
		document: z.string().regex(/^[0-9]{4,}$/i, 'Requeriod solo numeros y mínimo 4 caracteres'),
		documentConfirm: z
			.string()
			.regex(/^[0-9]{4,}$/i, 'Requeriod solo numeros y mínimo 4 caracteres'),
		password: z.string().min(4).trim().regex(/^(?=.*[a-zA-Z])(?=.*\d).*$/, 'debe terner al menos un numero y una letra'),
		passwordConfirm: z.string().min(4).trim()
	})	