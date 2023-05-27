import lucia from 'lucia-auth';
import { sveltekit } from 'lucia-auth/middleware';
import prismaAdapter from '@lucia-auth/adapter-prisma';
import { prisma } from '$lib/server/prisma';
import { dev } from '$app/environment';

export const auth = lucia({
    adapter: prismaAdapter(prisma),
    env: dev ? 'DEV' : 'PROD',
    transformDatabaseUser: (userData) => {
        return {
             userId: userData.id,
             email: userData.email
        };
    },
    middleware: sveltekit()
});

export type Auth = typeof auth;