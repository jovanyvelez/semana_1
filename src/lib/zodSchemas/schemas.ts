import { z } from 'zod';

export const userSchema = z
	.object({
		name: z.string({required_error:"Se requiere nombre de usuario"})
			.min(5,{message:"Nombre requiere mas de cinco caracteres"}).trim(),
		email: z.string().email().min(5),
		phone: z.string().regex(/^((3\d{9})|(60\d{8}))$/, 'Número telefónico no es de Colombia'),
		docType: z.enum(['CC', 'CA', 'PA', 'NIT']),
		numDoc: z.string().regex(/^[0-9]{4,}$/i, 'Requeriod solo numeros y mínimo 4 caracteres').trim(),
		address: z.string({required_error:"No escribió direccion"})
			.min(10,{message:"Debe temer mas de 10 caracteres"}).trim(),
		Department: z.string({required_error:"Se requiere nombre de Departamento"})
			.min(4,{message:"Nombre requiere mas de tres caracteres"}).trim(),
		city: z.string({required_error:"Se requiere nombre de Ciudad"})
			.min(3,{message:"Nombre requiere mas de dos caracteres"}).trim(),
		bussinessUnit: z.string({required_error:"Se requiere ccosto"})
			.max(2,{message:"No puede ser mas de 2 caracteres"}).trim().default('6'),
		zone: z.string({required_error:"Se requiere zona"})
			.max(2,{message:"No puede ser mas de 2 caracteres"}).trim(),
		discount: z.number().lte(100).nonnegative(),
		asesor: z.string().email().min(5),
		roleId: z.number().lte(3).nonnegative().default(1),
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

	export const authSchema = z
	.object({
		email: z.string().email().min(5),
		password: z.string().min(4).trim().regex(/^(?=.*[a-zA-Z])(?=.*\d).*$/, 'debe terner al menos un numero y una letra'),
	})
	