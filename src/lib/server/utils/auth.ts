import type { RequestEvent } from "@sveltejs/kit"
import { prisma } from '$lib/server/prisma';

/**
 * Esta función retorna el usuario si, este existe en la
 * tabla Usurio, siempre y cuando el token de session 
 * coincida con el campo usetAuthToken  de la tabla AuthUser
 */

export const authtenticateUser = async (event: RequestEvent) => {
    
    const session = event.cookies.get('session');
    //Si la cookie no exite
    if (!session) {
		return null;
	}
    const authUser = await prisma.AuthUser.findUnique({
        where: { userAuthToken: session },
		select: { email: true }
	});
    
    //Si el token no coincide
    if(!authUser){
        return null
	}

	const user = await prisma.Usuario.findUnique({
		where: { email: authUser.email },
		select: {
			id: true,
			name: true,
			phone: true,
			email: true,
			docType: true,
			numDoc: true,
			Departament: true,
			city: true,
			address: true,
			bussinessUnit: true,
			zone: true,
			discount: true,
			codVendedor: true,
			role: {
				select: {
					name: true
				}
			},
			asesor: true
		}
	});

    if (user) {
        //Retornamos el usuario
		return user;
	}else{
        //usuario no existe (revizar porque no esta creado!!)
        return null
    }
}