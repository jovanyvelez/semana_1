--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3 (Ubuntu 15.3-1.pgdg22.04+1)
-- Dumped by pg_dump version 15.3 (Ubuntu 15.3-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: ecommerce
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO ecommerce;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: ecommerce
--

COMMENT ON SCHEMA public IS '';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: AuthUser; Type: TABLE; Schema: public; Owner: ecommerce
--

CREATE TABLE public."AuthUser" (
    id text NOT NULL,
    email text NOT NULL,
    "passwordHash" text NOT NULL,
    "userAuthToken" text NOT NULL
);


ALTER TABLE public."AuthUser" OWNER TO ecommerce;

--
-- Name: Category; Type: TABLE; Schema: public; Owner: ecommerce
--

CREATE TABLE public."Category" (
    id text NOT NULL,
    name text NOT NULL,
    "padreId" text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Category" OWNER TO ecommerce;

--
-- Name: CcostoZoneCategories; Type: TABLE; Schema: public; Owner: ecommerce
--

CREATE TABLE public."CcostoZoneCategories" (
    id integer NOT NULL,
    zone text NOT NULL,
    "categoryId" text NOT NULL,
    ccosto text NOT NULL
);


ALTER TABLE public."CcostoZoneCategories" OWNER TO ecommerce;

--
-- Name: CcostoZoneCategories_id_seq; Type: SEQUENCE; Schema: public; Owner: ecommerce
--

CREATE SEQUENCE public."CcostoZoneCategories_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."CcostoZoneCategories_id_seq" OWNER TO ecommerce;

--
-- Name: CcostoZoneCategories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecommerce
--

ALTER SEQUENCE public."CcostoZoneCategories_id_seq" OWNED BY public."CcostoZoneCategories".id;


--
-- Name: Image; Type: TABLE; Schema: public; Owner: ecommerce
--

CREATE TABLE public."Image" (
    id text NOT NULL,
    "publicId" text NOT NULL,
    "secureUrl" text NOT NULL,
    "productId" text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    name text NOT NULL
);


ALTER TABLE public."Image" OWNER TO ecommerce;

--
-- Name: OrdenDePedido; Type: TABLE; Schema: public; Owner: ecommerce
--

CREATE TABLE public."OrdenDePedido" (
    id integer NOT NULL,
    fecha timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "userId" integer NOT NULL,
    "direccionEntrega" text NOT NULL,
    "ciudadEnt" text NOT NULL,
    "departamentoEnt" text NOT NULL,
    "metodoPago" text,
    estado text,
    "fechaDespacho" timestamp(3) without time zone,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    notes text,
    valor double precision
);


ALTER TABLE public."OrdenDePedido" OWNER TO ecommerce;

--
-- Name: OrdenDePedidoProducto; Type: TABLE; Schema: public; Owner: ecommerce
--

CREATE TABLE public."OrdenDePedidoProducto" (
    "ordenDePedidoId" integer NOT NULL,
    "productoId" text NOT NULL,
    cantidad integer NOT NULL,
    precio double precision NOT NULL,
    ccosto text NOT NULL,
    category text NOT NULL,
    "rootCategory" text NOT NULL
);


ALTER TABLE public."OrdenDePedidoProducto" OWNER TO ecommerce;

--
-- Name: OrdenDePedido_id_seq; Type: SEQUENCE; Schema: public; Owner: ecommerce
--

CREATE SEQUENCE public."OrdenDePedido_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."OrdenDePedido_id_seq" OWNER TO ecommerce;

--
-- Name: OrdenDePedido_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecommerce
--

ALTER SEQUENCE public."OrdenDePedido_id_seq" OWNED BY public."OrdenDePedido".id;


--
-- Name: Price; Type: TABLE; Schema: public; Owner: ecommerce
--

CREATE TABLE public."Price" (
    id text NOT NULL,
    price1 double precision NOT NULL,
    price2 double precision,
    price3 double precision,
    price4 double precision,
    price5 double precision,
    price6 double precision,
    "productId" text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Price" OWNER TO ecommerce;

--
-- Name: Product; Type: TABLE; Schema: public; Owner: ecommerce
--

CREATE TABLE public."Product" (
    id text NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    brand text NOT NULL,
    code text NOT NULL,
    eancode text NOT NULL,
    quantity double precision NOT NULL,
    promo boolean NOT NULL,
    active boolean NOT NULL,
    "categoryId" text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Product" OWNER TO ecommerce;

--
-- Name: Roles; Type: TABLE; Schema: public; Owner: ecommerce
--

CREATE TABLE public."Roles" (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public."Roles" OWNER TO ecommerce;

--
-- Name: Roles_id_seq; Type: SEQUENCE; Schema: public; Owner: ecommerce
--

CREATE SEQUENCE public."Roles_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Roles_id_seq" OWNER TO ecommerce;

--
-- Name: Roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecommerce
--

ALTER SEQUENCE public."Roles_id_seq" OWNED BY public."Roles".id;


--
-- Name: Usuario; Type: TABLE; Schema: public; Owner: ecommerce
--

CREATE TABLE public."Usuario" (
    id integer NOT NULL,
    "roleId" integer NOT NULL,
    name text NOT NULL,
    phone text NOT NULL,
    email text NOT NULL,
    "docType" text NOT NULL,
    "numDoc" text NOT NULL,
    "Departament" text NOT NULL,
    city text NOT NULL,
    address text NOT NULL,
    "bussinessUnit" text,
    zone text NOT NULL,
    asesor text,
    discount double precision DEFAULT 0
);


ALTER TABLE public."Usuario" OWNER TO ecommerce;

--
-- Name: Usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: ecommerce
--

CREATE SEQUENCE public."Usuario_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Usuario_id_seq" OWNER TO ecommerce;

--
-- Name: Usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecommerce
--

ALTER SEQUENCE public."Usuario_id_seq" OWNED BY public."Usuario".id;


--
-- Name: Zones; Type: TABLE; Schema: public; Owner: ecommerce
--

CREATE TABLE public."Zones" (
    id integer NOT NULL,
    name text NOT NULL,
    zone text NOT NULL
);


ALTER TABLE public."Zones" OWNER TO ecommerce;

--
-- Name: Zones_id_seq; Type: SEQUENCE; Schema: public; Owner: ecommerce
--

CREATE SEQUENCE public."Zones_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Zones_id_seq" OWNER TO ecommerce;

--
-- Name: Zones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecommerce
--

ALTER SEQUENCE public."Zones_id_seq" OWNED BY public."Zones".id;


--
-- Name: _CategoriasZonas; Type: TABLE; Schema: public; Owner: ecommerce
--

CREATE TABLE public."_CategoriasZonas" (
    "A" text NOT NULL,
    "B" integer NOT NULL
);


ALTER TABLE public."_CategoriasZonas" OWNER TO ecommerce;

--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: ecommerce
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO ecommerce;

--
-- Name: CcostoZoneCategories id; Type: DEFAULT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."CcostoZoneCategories" ALTER COLUMN id SET DEFAULT nextval('public."CcostoZoneCategories_id_seq"'::regclass);


--
-- Name: OrdenDePedido id; Type: DEFAULT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."OrdenDePedido" ALTER COLUMN id SET DEFAULT nextval('public."OrdenDePedido_id_seq"'::regclass);


--
-- Name: Roles id; Type: DEFAULT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."Roles" ALTER COLUMN id SET DEFAULT nextval('public."Roles_id_seq"'::regclass);


--
-- Name: Usuario id; Type: DEFAULT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."Usuario" ALTER COLUMN id SET DEFAULT nextval('public."Usuario_id_seq"'::regclass);


--
-- Name: Zones id; Type: DEFAULT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."Zones" ALTER COLUMN id SET DEFAULT nextval('public."Zones_id_seq"'::regclass);


--
-- Data for Name: AuthUser; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public."AuthUser" (id, email, "passwordHash", "userAuthToken") FROM stdin;
d20ae53e-4e46-4278-8b87-39e7ffb54eb3	oscar.padilla@equisol.com	$2b$10$qUTEXq9BUWnkDqRpuW.y..rPkqEjRC29.WCxJ62bd5sX5t9jrmhC.	148a5c54-c79c-4eac-b205-12344c56cbff
5328d672-0931-4474-9433-23b830012746	jovany.velez@gmail.com	$2b$10$Icuu7MvNNJzb3OjzJ6tP6O1XJRjrnGYTOovPM8f0WlCNVYxBKA4my	c872b3bd-9e1f-4210-bb73-f192c02c854a
\.


--
-- Data for Name: Category; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public."Category" (id, name, "padreId", "createdAt", "updatedAt") FROM stdin;
8e500d7a-b094-4211-aabd-9b23dbb97368	Comedor	9cd22346-c07a-4b4a-94d4-b078c294b8b5	2023-05-21 14:56:48.099	2023-05-21 14:56:11.179
da09249c-37f8-4947-b393-6392ba5f48dc	Sala	9cd22346-c07a-4b4a-94d4-b078c294b8b5	2023-05-21 14:55:56.162	2023-05-21 14:57:19.602
d40e26db-01df-45f5-89b3-3836422052cf	ALFA LAVAL	\N	2023-05-21 14:53:38.12	2023-05-25 02:40:43.748
08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f	RIELLO	\N	2023-05-21 13:50:37.119	2023-05-25 02:40:43.748
bd3d2de3-16f5-4c77-bbd5-007687664399	PARKER	\N	2023-05-25 02:42:30.362	2023-05-25 02:42:00.588
da4ace43-beb2-45c7-9cdd-7ad125179e1b	PIETRO	\N	2023-05-25 02:42:30.362	2023-05-25 02:42:05.191
991988d1-6e53-40ef-b09e-203beb71a626	Subcategoria1	d40e26db-01df-45f5-89b3-3836422052cf	2023-05-21 14:54:24.145	2023-05-29 11:19:49.305
9cd22346-c07a-4b4a-94d4-b078c294b8b5	Subcategoria3	d40e26db-01df-45f5-89b3-3836422052cf	2023-05-21 14:55:30.152	2023-05-29 11:21:14.698
9f104869-ed56-4586-abc6-897d1ce279a2	Subcategoria2	d40e26db-01df-45f5-89b3-3836422052cf	2023-05-21 14:57:40.969	2023-05-29 12:14:40.996
52488b66-6b6a-4212-9846-c1d853414dcd	Subcategoria1	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f	2023-05-21 13:55:27.044	2023-05-29 12:17:14.862
215f5344-b694-4fa9-8505-ec9e2095a90c	Subcategoria2	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f	2023-05-21 14:02:42.106	2023-05-29 12:17:58.262
350a2fc2-2467-4621-ab5d-de748d12afef	Subcategoria3	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f	2023-05-21 14:04:40.731	2023-05-29 12:18:32.833
565de8a2-395e-4677-991d-01fd3eed607c	Subcategoria4	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f	2023-05-21 14:05:56.935	2023-05-29 12:19:01.399
1d5b41aa-4a38-4b81-ae39-ef1149263e03	Subcategoria5	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f	2023-05-21 14:05:08.916	2023-05-29 12:19:13.059
e2eee2e4-5fbe-4749-9c72-30b2f47108d5	One	52488b66-6b6a-4212-9846-c1d853414dcd	2023-05-21 13:57:00.32	2023-05-29 12:20:20.743
31950fa6-7fb0-489b-919f-42743fc40082	Two	52488b66-6b6a-4212-9846-c1d853414dcd	2023-05-21 13:57:00.32	2023-05-29 12:20:20.743
ab076f01-185c-4c85-9201-c1354ecf839c	One	215f5344-b694-4fa9-8505-ec9e2095a90c	2023-05-21 14:47:07.197	2023-05-29 12:21:43.491
ac6d39f5-e44a-47a6-9242-b776194d8270	Three	215f5344-b694-4fa9-8505-ec9e2095a90c	2023-05-21 14:47:25.421	2023-05-29 12:21:43.491
e03a027c-9192-4b7d-afa4-baf035f8f792	One	350a2fc2-2467-4621-ab5d-de748d12afef	2023-05-21 14:49:50.933	2023-05-29 12:22:21.992
a8f457bc-202e-4407-945a-fc90428dc7c9	Two	350a2fc2-2467-4621-ab5d-de748d12afef	2023-05-21 14:49:50.933	2023-05-29 12:22:21.992
68b77e5d-b252-47b4-8e52-453935137f04	One	565de8a2-395e-4677-991d-01fd3eed607c	2023-05-21 14:53:08.264	2023-05-29 12:23:02.534
9e2085c7-822c-4174-9629-2826a749508a	One	1d5b41aa-4a38-4b81-ae39-ef1149263e03	2023-05-21 14:51:40.114	2023-05-29 12:23:02.534
9de62a43-d249-45d0-8fef-27cc6714258c	Two	1d5b41aa-4a38-4b81-ae39-ef1149263e03	2023-05-21 14:52:17.753	2023-05-29 12:23:02.534
f294f4ef-bc85-4281-8722-969de08cde43	Pruebas	\N	2023-06-05 16:18:01.34	2023-06-05 16:18:01.34
7606f174-60d1-4da8-957a-f0957a9825d2	Tubos	f294f4ef-bc85-4281-8722-969de08cde43	2023-06-06 01:12:53.342	2023-06-06 01:12:53.342
990e1935-504d-4329-b384-e6c597a7f107	Acerados	7606f174-60d1-4da8-957a-f0957a9825d2	2023-06-06 01:14:11.897	2023-06-06 01:14:11.897
5d87d293-9dc4-4fca-bd04-6c71ddf66ac5	Andamios	f294f4ef-bc85-4281-8722-969de08cde43	2023-06-06 01:16:41.881	2023-06-06 01:16:41.881
84b5d997-a2c5-4dc0-a0be-9d0770679289	Estructurales	5d87d293-9dc4-4fca-bd04-6c71ddf66ac5	2023-06-06 01:17:18.442	2023-06-06 01:17:18.442
3f53d9fd-bd92-4ecd-bcb7-db818fb304d8	MARCA DE PRUEBA	\N	2023-06-09 15:03:02.772	2023-06-09 15:03:02.772
9010f7d0-c467-4f36-b188-d0c335c9d554	LANZAMIENTOS	3f53d9fd-bd92-4ecd-bcb7-db818fb304d8	2023-06-09 15:06:55.859	2023-06-09 15:06:55.859
ff7ba603-50fe-4011-816c-def811c35f24	CATEGORIA DE EJEMPLO	\N	2023-06-09 16:13:13.871	2023-06-09 16:13:13.871
75eebb7e-5ee5-4cab-a7dd-bde8a85f61a6	TUBOS	ff7ba603-50fe-4011-816c-def811c35f24	2023-06-09 16:16:19.787	2023-06-09 16:16:19.787
\.


--
-- Data for Name: CcostoZoneCategories; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public."CcostoZoneCategories" (id, zone, "categoryId", ccosto) FROM stdin;
1	1	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f	0113
2	2	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f	0114
3	3	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f	0115
4	4	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f	0116
5	5	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f	0117
6	6	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f	0118
7	1	bd3d2de3-16f5-4c77-bbd5-007687664399	0408
8	2	bd3d2de3-16f5-4c77-bbd5-007687664399	0409
9	3	bd3d2de3-16f5-4c77-bbd5-007687664399	0410
10	4	bd3d2de3-16f5-4c77-bbd5-007687664399	0411
11	5	bd3d2de3-16f5-4c77-bbd5-007687664399	0412
12	6	bd3d2de3-16f5-4c77-bbd5-007687664399	0413
13	1	d40e26db-01df-45f5-89b3-3836422052cf	0308
14	2	d40e26db-01df-45f5-89b3-3836422052cf	0309
15	3	d40e26db-01df-45f5-89b3-3836422052cf	0310
16	4	d40e26db-01df-45f5-89b3-3836422052cf	0311
17	5	d40e26db-01df-45f5-89b3-3836422052cf	0312
18	6	d40e26db-01df-45f5-89b3-3836422052cf	0313
19	1	da4ace43-beb2-45c7-9cdd-7ad125179e1b	0120
20	2	da4ace43-beb2-45c7-9cdd-7ad125179e1b	0121
21	3	da4ace43-beb2-45c7-9cdd-7ad125179e1b	0122
22	4	da4ace43-beb2-45c7-9cdd-7ad125179e1b	0123
23	5	da4ace43-beb2-45c7-9cdd-7ad125179e1b	0124
24	6	da4ace43-beb2-45c7-9cdd-7ad125179e1b	0125
34	3	f294f4ef-bc85-4281-8722-969de08cde43	12121
36	3	ff7ba603-50fe-4011-816c-def811c35f24	6666
\.


--
-- Data for Name: Image; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public."Image" (id, "publicId", "secureUrl", "productId", "createdAt", "updatedAt", name) FROM stdin;
f2ad6a0f-aadc-4cd0-bc2a-050ace91d4f4	tienda/cwg5v2lbodzesg8fbojb	/tienda/cwg5v2lbodzesg8fbojb.png	94160dfe-9017-476e-b618-e07bc8641531	2023-05-21 18:22:08.161	2023-06-06 18:56:05.631	one
02b70d56-8ea2-4d4e-8d32-864b736d4e8b	tienda/wtmerzxwhm61s8wwbpio	/tienda/wtmerzxwhm61s8wwbpio.png	ddec76b9-67b6-40a8-8011-839d7769104e	2023-05-21 18:23:10.901	2023-06-06 18:53:25.129	one
d5308d5f-d7f6-4ce7-83dd-cdb80e74528e	tienda/t4emrm6bqyxqh51rurqt	/tienda/t4emrm6bqyxqh51rurqt.png	55c1a3cb-01f5-4a12-b637-423c0b87af93	2023-05-21 18:28:20.871	2023-06-06 18:56:05.631	one
b37de8b5-daf4-41c4-841e-46cd08c935f6	tienda/t4gwpnxf3kpwhkbvd6l4	/tienda/t4gwpnxf3kpwhkbvd6l4.png	9b38700d-f347-4ec3-96b4-89afdc9fb97b	2023-05-21 18:26:21.997	2023-06-06 18:56:05.631	one
b2c59ac6-787e-45b1-ad6a-591e50163074	tienda/eftehf4z3glck9cl3ish	/tienda/eftehf4z3glck9cl3ish.png	bf87c9e2-5f50-43eb-8f53-430baeafc68a	2023-05-21 18:27:24.559	2023-06-06 18:56:05.631	one
0e57d77e-2007-47f9-bd96-78d1adca5b06	tienda/cdkbnlqi55m3ucxritp3	/tienda/cdkbnlqi55m3ucxritp3.png	3a51e4d6-ca8a-46e9-ac73-3f42a5fe8cad	2023-05-21 18:33:44.058	2023-06-06 18:53:25.129	one
11f0102e-b43b-484b-848f-17fd06175ca0	tienda/uamo6loznfde7avbaryu	/tienda/uamo6loznfde7avbaryu.png	9b38700d-f347-4ec3-96b4-89afdc9fb97b	2023-05-21 18:26:21.997	2023-06-06 18:53:25.129	main
152c685c-8afe-4beb-9e55-4b93533b7513	tienda/bj6i3a9ue6scqmszwrts	/tienda/bj6i3a9ue6scqmszwrts.png	60921eb2-3fcb-43f3-831c-063322554f66	2023-05-21 18:30:12.935	2023-06-06 18:53:25.129	main
1761eeed-496a-480f-a89b-9394a8465a8d	tienda/b5frbes0ii0perk8cnay	/tienda/b5frbes0ii0perk8cnay.png	d34c8663-60db-4541-9d0d-1f6faba4d9ac	2023-05-21 18:31:15.179	2023-06-06 18:53:25.129	one
1c63f8d7-8122-4023-90fe-72523fba8bc0	tienda/tymaurkz9ijxgfnixxwj	/tienda/tymaurkz9ijxgfnixxwj.png	9820a1b0-c947-490a-b7e8-cf7a92f06488	2023-05-21 18:18:32.906	2023-06-06 18:53:25.129	one
246b8572-e23f-43d2-a911-8df7241e384a	tienda/ugh0bruh783x39mn7xdp	/tienda/ugh0bruh783x39mn7xdp.png	1e8e34ea-7752-40d2-aabe-2d30178a2e85	2023-05-21 18:18:32.906	2023-06-06 18:53:25.129	one
5e311c8d-a9d1-4510-ac1d-4e97ae1e5883	tienda/y7mfzr2tcln7xrmwqtbp	/tienda/y7mfzr2tcln7xrmwqtbp.png	e9f0cf99-216e-4a70-826f-64bd0c334f5c	2023-05-21 18:20:46.347	2023-06-06 18:53:25.129	one
5ead3ef1-ff65-4a9b-b940-ef5e0e192cad	tienda/vlkmxflyvfwuuc7blawc	/tienda/vlkmxflyvfwuuc7blawc.png	bae41e85-c627-4b57-b1b9-a25b233ccdb8	2023-05-21 18:32:52.67	2023-06-06 18:53:25.129	one
7040a9f9-372d-4483-80ed-dbfb8c82e4a3	tienda/eckt6cnpf24n1svqjxol	/tienda/eckt6cnpf24n1svqjxol.png	60921eb2-3fcb-43f3-831c-063322554f66	2023-05-21 18:30:12.935	2023-06-06 18:53:25.129	one
897e7f4c-ba60-4680-a9cc-1b791cbbb83e	tienda/r0uco7vb8o5riiqizsyv	/tienda/r0uco7vb8o5riiqizsyv.png	5a792989-6fb1-481a-8b3d-43a4f456e0e9	2023-05-21 18:24:05.814	2023-06-06 18:53:25.129	one
973d4ff9-6778-48c6-8a1e-ad8ed268f899	tienda/xjasf2cplwv28byhu6ov	/tienda/xjasf2cplwv28byhu6ov.png	097858ca-8b2b-4c5e-b32d-d8c267573232	2023-05-21 18:29:10.299	2023-06-06 18:53:25.129	one
37f7c8ec-4881-4006-bc65-8d679389c10b	tienda/icdde0nxlseewtcrokxc	/tienda/ga2un09rdxyejb3cihje.png	76cedd39-2479-4402-acfa-a0a2e95a4fc3	2023-05-21 18:25:13.735	2023-06-06 19:30:23.399	one
37144183-465e-4e3d-833a-684cbae5cf51	tienda/ddawle09aomymctx2rij	/tienda/qlfhcyauxymmhcivybfb.png	79ed59ab-7598-4997-bb18-b8d1699fb836	2023-05-21 18:19:34.881	2023-06-06 19:56:47.285	one
09961592-019c-4d53-a6ca-3f2802f7c487	tienda/k34kzem3gw7p19txfxio	/tienda/qlfhcyauxymmhcivybfb.png	79ed59ab-7598-4997-bb18-b8d1699fb836	2023-05-21 18:19:34.881	2023-06-06 19:56:47.285	main
489a77d8-0eec-459b-b45a-b46c0ea22648	tienda/suuhqmy3wxeb42tjwgbp	/tienda/suuhqmy3wxeb42tjwgbp.png	ac6999ce-57af-46e9-a129-ea92331f8fbd	2023-05-21 18:36:49.328	2023-06-06 18:53:25.129	one
514aed07-516c-4981-b4c0-f2d14d90bd1c	tienda/dnbb8pbnkim90ijflrzs	/tienda/dnbb8pbnkim90ijflrzs.png	097858ca-8b2b-4c5e-b32d-d8c267573232	2023-05-21 18:29:10.299	2023-06-06 18:53:25.129	main
e9a139ee-fa38-41e0-b50e-10ab62a402b8	tienda/uihvd7tl80moneboztw4	/tienda/uihvd7tl80moneboztw4.png	ae0acb35-6589-4b2e-8d43-0708485a4419	2023-05-21 18:34:51.874	2023-06-06 18:56:05.631	one
d8e8d890-8123-4155-a7ed-a2053a82ef69	tienda/znksamixi4ff531bpdxn	/tienda/znksamixi4ff531bpdxn.png	ac6999ce-57af-46e9-a129-ea92331f8fbd	2023-05-21 18:36:49.328	2023-06-06 18:56:05.631	main
2765e343-f358-413b-96f2-54823137c315	tienda/jpp1ljauaz9clujsw932	/tienda/jpp1ljauaz9clujsw932.png	5a792989-6fb1-481a-8b3d-43a4f456e0e9	2023-05-21 18:24:05.814	2023-06-06 18:53:25.129	main
28502bff-b0ba-4ef8-b69b-cad1cd5bde2d	tienda/skgtatuhjupaiucmiuxe	/tienda/skgtatuhjupaiucmiuxe.png	ddec76b9-67b6-40a8-8011-839d7769104e	2023-05-21 18:23:10.901	2023-06-06 18:53:25.129	main
2b621a5e-b12f-4ade-acba-350847e78a11	tienda/vxj893gmq4qdzcllz4yh	/tienda/vxj893gmq4qdzcllz4yh.png	bc3bb3ba-9d3b-4761-b94a-9ebfc9d5e43c	2023-05-21 18:35:48.997	2023-06-06 18:53:25.129	main
2be3a7dd-2e11-46ed-862b-79cd5dfbed90	tienda/dotvsqoucxdoztdlpnq6	/tienda/dotvsqoucxdoztdlpnq6.png	bae41e85-c627-4b57-b1b9-a25b233ccdb8	2023-05-21 18:32:52.67	2023-06-06 18:53:25.129	main
66086760-4ee9-470e-ab91-79ea1e716e2a	tienda/nbijt8zro1bjfkdkdk0i	/tienda/nbijt8zro1bjfkdkdk0i.png	55c1a3cb-01f5-4a12-b637-423c0b87af93	2023-05-21 18:28:20.871	2023-06-06 18:53:25.129	main
711b2d53-d43c-4e5b-9f5a-1a5e7e396cbf	tienda/fhjkbscsq2c1qau8hm9m	/tienda/fhjkbscsq2c1qau8hm9m.png	3a51e4d6-ca8a-46e9-ac73-3f42a5fe8cad	2023-05-21 18:33:44.058	2023-06-06 18:53:25.129	main
917a6cdc-3e6f-4904-9e97-fe9384fc12cb	tienda/elkfmdzrfacmqeydge4v	/tienda/elkfmdzrfacmqeydge4v.png	bc3bb3ba-9d3b-4761-b94a-9ebfc9d5e43c	2023-05-21 18:35:48.997	2023-06-06 18:53:25.129	one
9435d5d8-aff0-409a-9f23-3b6f887e1f22	tienda/ga2un09rdxyejb3cihje	/tienda/ga2un09rdxyejb3cihje.png	1e8e34ea-7752-40d2-aabe-2d30178a2e85	2023-05-21 18:16:40.689	2023-06-06 18:53:25.129	main
94317812-cf8b-490a-8264-1d57ec416e0b	tienda/jjjvdtqobaciwb1hgac6	/tienda/jjjvdtqobaciwb1hgac6.png	76cedd39-2479-4402-acfa-a0a2e95a4fc3	2023-05-21 18:25:13.735	2023-06-06 19:30:23.399	main
78b001fa-0c78-48f8-b39b-2a9ee915786b	tienda/btw1gvyxld6unxb0vexz	/tienda/btw1gvyxld6unxb0vexz.png	bf87c9e2-5f50-43eb-8f53-430baeafc68a	2023-05-21 18:27:24.559	2023-06-06 19:33:16.544	main
abbe9285-10d8-4b07-ac5f-8deb48e1e11e	tienda/nwueswqjmurotvrjh1ix	/tienda/nwueswqjmurotvrjh1ix.png	d34c8663-60db-4541-9d0d-1f6faba4d9ac	2023-05-21 18:31:15.179	2023-06-06 19:42:29.175	main
507f7099-5d13-4b1d-b226-d090cded7fcb	tienda/dvth4n3azlnm86zwwats	/tienda/dvth4n3azlnm86zwwats.png	ae0acb35-6589-4b2e-8d43-0708485a4419	2023-05-21 18:34:51.874	2023-06-06 19:44:16.753	main
9e8187e1-564b-441c-a2cf-c02a9a3d4417	tienda/l9te04k6k2wsztzajgjh	/tienda/l9te04k6k2wsztzajgjh.png	e9f0cf99-216e-4a70-826f-64bd0c334f5c	2023-05-21 18:20:46.347	2023-06-06 19:44:16.753	main
faabf75c-4434-4b58-b6ba-fdbdb66752ca	tienda/h0e89buxchmk0fiijylc	/tienda/h0e89buxchmk0fiijylc.png	94160dfe-9017-476e-b618-e07bc8641531	2023-05-21 18:22:08.161	2023-06-06 19:44:16.753	main
36d18214-7adf-4356-b756-86768bf005ca	tienda/fdg4oymmkxeubtp3dcbu	/tienda/fdg4oymmkxeubtp3dcbu.png	9820a1b0-c947-490a-b7e8-cf7a92f06488	2023-05-21 18:18:32.906	2023-06-06 19:44:16.753	main
4421a0da-f3a8-4ee6-a150-abe5df7232ce		/tienda/1686095916612.png	89334caa-1afb-460a-92c2-9abffbcd82fa	2023-06-06 23:58:36.835	2023-06-06 23:58:36.835	main
45ceead7-b2b3-4a04-a210-7932c0c19dde		/tienda/1686095916612.png	89334caa-1afb-460a-92c2-9abffbcd82fa	2023-06-06 23:58:36.835	2023-06-06 23:58:36.835	one
892a0046-0225-493d-ab24-4128927576b4		/tienda/1686327599335.png	b80fd054-a534-4a26-9c3d-4dea431fc149	2023-06-09 16:19:59.569	2023-06-09 16:19:59.569	main
b14031ae-f672-4a84-8ae5-b44269961861		/tienda/1686327599335.png	b80fd054-a534-4a26-9c3d-4dea431fc149	2023-06-09 16:19:59.569	2023-06-09 16:19:59.569	one
\.


--
-- Data for Name: OrdenDePedido; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public."OrdenDePedido" (id, fecha, "userId", "direccionEntrega", "ciudadEnt", "departamentoEnt", "metodoPago", estado, "fechaDespacho", "updatedAt", notes, valor) FROM stdin;
45	2023-05-29 20:17:59.611	1	Diagonal 23 # 432-234	San José del Fragua	Caquetá	\N	\N	\N	2023-05-29 20:17:59.611	werwer	\N
47	2023-05-29 23:05:51.722	1	Circunvalar 12 # 2-12	Piojó	Atlántico	\N	\N	\N	2023-05-29 23:05:51.722	SADFS	\N
48	2023-05-29 23:10:23.067	1	Diagonal 12 # 32-12	Sácama	Casanare	\N	\N	\N	2023-05-29 23:10:23.067	ASDFSD	\N
49	2023-05-29 23:11:23.057	1	Circunvalar 12 # 21-21	Neira	Caldas	\N	\N	\N	2023-05-29 23:11:23.057	WERW	\N
50	2023-05-29 23:12:28.613	1	Circunvalar 12 # 21-23	Florencia	Caquetá	\N	\N	\N	2023-05-29 23:12:28.613	ASDFS	\N
51	2023-05-29 23:17:17.061	1	Manzana 1 # 2-3	Puerto Arica	Amazonas	\N	\N	\N	2023-05-29 23:17:17.061	123	\N
52	2023-05-30 00:08:37.1	1	Diagonal 23 # 52-52	Apartadó	Antioquia	\N	\N	\N	2023-05-30 00:08:37.1	jkhjk	\N
53	2023-05-30 00:38:30.075	1	Circunvalar 12 # 2-545	Campohermoso	Boyacá	\N	\N	\N	2023-05-30 00:38:30.075	fdgfdgfd	\N
54	2023-05-30 00:51:14.128	1	Diagonal 2 # 3-2	Providencia	Archipiélago de San Andrés, Providencia y Santa Catalina	\N	\N	\N	2023-05-30 00:51:14.128	Jovany	\N
55	2023-05-30 01:47:44.088	1	Avenida 12 # 2-12	Luruaco	Atlántico	\N	\N	\N	2023-05-30 01:47:44.088	Apartamento 203 torre alto	\N
57	2023-05-30 12:22:49.85	1	Diagonal 23 # 33-33	Andes	Antioquia	\N	\N	\N	2023-05-30 12:22:49.85	asdsd	\N
59	2023-06-01 13:40:17.247	1	Manzana 23 # 22-3	Betéitiva	Boyacá	\N	\N	\N	2023-06-01 13:40:17.247	Compra de prueba	\N
60	2023-06-01 13:41:54.502	1	Calle 45 # 32-23	Alejandría	Antioquia	\N	\N	\N	2023-06-01 13:41:54.502	lkjlj	\N
61	2023-06-07 20:58:20.07	2	Carrera 1 # 2-14	Abriaquí	Antioquia	\N	\N	\N	2023-06-07 20:58:20.07	Casa 23, segundo piso	\N
62	2023-06-07 21:09:35.713	1	Calle 32 # 1-21	San Andrés	Archipiélago de San Andrés, Providencia y Santa Catalina	\N	\N	\N	2023-06-07 21:09:35.713	Avenida new oswald 	\N
63	2023-06-07 23:11:27.83	1	Avenida 2 # 3-23	Betulia	Antioquia	\N	\N	\N	2023-06-07 23:11:27.83	Barrio Alto	\N
65	2023-06-15 00:29:47.688	1	Manzana 23 # 3-23	Bello	Antioquia	\N	\N	\N	2023-06-15 00:29:47.688	Barrio la Aldea	\N
66	2023-06-15 18:54:30.619	1	Manzana 12 # 2-2	Guachené	Cauca	\N	\N	\N	2023-06-15 18:54:30.619	asf	\N
67	2023-06-15 18:56:05.608	1	Carrera 3 # 5-12	Armenia	Antioquia	\N	\N	\N	2023-06-15 18:56:05.608	ad	\N
68	2023-06-15 19:22:21.112	1	Circunvalar 1 # 1-1	Andes	Antioquia	\N	\N	\N	2023-06-15 19:22:21.112	sasds	\N
69	2023-06-15 19:27:14.43	1	Manzana 1 # 1-1	Pailitas	Cesar	\N	\N	\N	2023-06-15 19:27:14.43	sdf	\N
70	2023-06-15 19:34:11.201	1	Carrera 1 # 1-1	Arenal	Bolívar	\N	\N	\N	2023-06-15 19:34:11.201	asdf	\N
71	2023-06-15 19:35:14.551	1	Manzana 1 # 1-1	Chía	Cundinamarca	\N	\N	\N	2023-06-15 19:35:14.551	asdf	\N
72	2023-06-15 19:39:29.649	1	Carrera 52d # 23-23	Bello	Antioquia	\N	\N	\N	2023-06-15 19:39:29.649	Nada	\N
73	2023-06-15 19:42:17.393	1	Avenida 2 # 2-21	La Vega	Cauca	\N	\N	\N	2023-06-15 19:42:17.393	2as	\N
74	2023-06-15 22:57:08.659	1	Transversal 2 # 2-2	Sácama	Casanare	\N	\N	\N	2023-06-15 22:57:08.659	2	\N
75	2023-06-16 00:41:49.025	1	Diagonal 1 # 1-1	Anza	Antioquia	\N	\N	\N	2023-06-16 00:41:49.025	1	\N
76	2023-06-16 00:43:15.804	1	Circunvalar 2 # 2-2	Bello	Antioquia	\N	\N	\N	2023-06-16 00:43:15.804	2	\N
77	2023-06-16 00:48:29.608	1	Carrera 2 # 2-2	Bello	Antioquia	\N	\N	\N	2023-06-16 00:48:29.608	2	\N
79	2023-06-16 01:11:29.201	1	Avenida 2 # 2-2	Bello	Antioquia	\N	\N	\N	2023-06-16 11:07:46.799	asddd	12800
78	2023-06-16 01:06:49.882	1	Manzana 2 # 2-2	Bello	Antioquia	\N	\N	\N	2023-06-16 11:17:40.477	2	1000
64	2023-06-14 19:25:03.382	2	Transversal 12 # 32-23	Puerto Libertador	Córdoba	\N	\N	\N	2023-06-16 11:19:57.643	sdf	\N
80	2023-06-16 15:04:49.892	1	Calle 12 # 12-12	Bello	Antioquia	\N	\N	\N	2023-06-16 15:04:49.892	Edificio Mirador de altavista	40422.8
81	2023-06-16 17:11:04.361	1	Calle 2 # 2-2	Abriaquí	Antioquia	\N	\N	\N	2023-06-16 17:11:04.361	2	65319.57
82	2023-06-16 17:22:38.647	1	Manzana 2 # 2-2	Anza	Antioquia	\N	\N	\N	2023-06-16 17:22:38.647	2	918.6999999999999
83	2023-06-16 17:30:33.094	1	Avenida 3 # 3-3	Bello	Antioquia	\N	\N	\N	2023-06-16 17:30:33.094	3	131631.336
84	2023-06-16 18:21:10.652	1	Manzana 2 # 2-2	Cantagallo	Bolívar	\N	\N	\N	2023-06-16 18:21:10.652	2	918.6999999999999
85	2023-06-16 18:22:23.982	1	Transversal q # q-q	Chita	Boyacá	\N	\N	\N	2023-06-16 18:22:23.982	q	9830.09
86	2023-06-16 18:50:34.223	1	Manzana 2 # 2-2	Lloró	Chocó	\N	\N	\N	2023-06-16 18:50:34.223	2zone) \t\t\tconsole.log()	918.6999999999999
87	2023-06-16 19:36:29.21	1	Carrera 3 # 3-3	Tarapacá	Amazonas	\N	\N	\N	2023-06-16 19:36:29.21	s	11943.1
88	2023-06-16 19:50:31.492	1	Calle 2 # 2-2	Amalfi	Antioquia	\N	\N	\N	2023-06-16 19:50:31.492	2	213.1384
89	2023-06-16 20:14:56.299	1	Circunvalar 3 # 3-3	Cicuco	Bolívar	\N	\N	\N	2023-06-16 20:14:56.299	asd	13780.5
\.


--
-- Data for Name: OrdenDePedidoProducto; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public."OrdenDePedidoProducto" ("ordenDePedidoId", "productoId", cantidad, precio, ccosto, category, "rootCategory") FROM stdin;
47	3a51e4d6-ca8a-46e9-ac73-3f42a5fe8cad	3	1000	0308	991988d1-6e53-40ef-b09e-203beb71a626	d40e26db-01df-45f5-89b3-3836422052cf
47	76cedd39-2479-4402-acfa-a0a2e95a4fc3	5	4100	0308	8e500d7a-b094-4211-aabd-9b23dbb97368	d40e26db-01df-45f5-89b3-3836422052cf
47	9b38700d-f347-4ec3-96b4-89afdc9fb97b	1	3975	0308	9f104869-ed56-4586-abc6-897d1ce279a2	d40e26db-01df-45f5-89b3-3836422052cf
49	60921eb2-3fcb-43f3-831c-063322554f66	1	1100	0113	68b77e5d-b252-47b4-8e52-453935137f04	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
49	79ed59ab-7598-4997-bb18-b8d1699fb836	1	11000	0113	31950fa6-7fb0-489b-919f-42743fc40082	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
49	94160dfe-9017-476e-b618-e07bc8641531	1	13000	0113	9de62a43-d249-45d0-8fef-27cc6714258c	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
49	9820a1b0-c947-490a-b7e8-cf7a92f06488	1	4000	0113	e2eee2e4-5fbe-4749-9c72-30b2f47108d5	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
49	ae0acb35-6589-4b2e-8d43-0708485a4419	1	28000	0113	a8f457bc-202e-4407-945a-fc90428dc7c9	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
51	3a51e4d6-ca8a-46e9-ac73-3f42a5fe8cad	1	1000	0308	991988d1-6e53-40ef-b09e-203beb71a626	d40e26db-01df-45f5-89b3-3836422052cf
51	76cedd39-2479-4402-acfa-a0a2e95a4fc3	2	4100	0308	8e500d7a-b094-4211-aabd-9b23dbb97368	d40e26db-01df-45f5-89b3-3836422052cf
51	097858ca-8b2b-4c5e-b32d-d8c267573232	1	22000	0113	ac6d39f5-e44a-47a6-9242-b776194d8270	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
51	ae0acb35-6589-4b2e-8d43-0708485a4419	1	28000	0113	a8f457bc-202e-4407-945a-fc90428dc7c9	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
53	76cedd39-2479-4402-acfa-a0a2e95a4fc3	1	4100	0308	8e500d7a-b094-4211-aabd-9b23dbb97368	d40e26db-01df-45f5-89b3-3836422052cf
53	60921eb2-3fcb-43f3-831c-063322554f66	1	1100	0113	68b77e5d-b252-47b4-8e52-453935137f04	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
55	3a51e4d6-ca8a-46e9-ac73-3f42a5fe8cad	1	1000	0308	991988d1-6e53-40ef-b09e-203beb71a626	d40e26db-01df-45f5-89b3-3836422052cf
55	097858ca-8b2b-4c5e-b32d-d8c267573232	3	22000	0113	ac6d39f5-e44a-47a6-9242-b776194d8270	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
57	1e8e34ea-7752-40d2-aabe-2d30178a2e85	1	7100	0113	ab076f01-185c-4c85-9201-c1354ecf839c	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
60	76cedd39-2479-4402-acfa-a0a2e95a4fc3	2	4100	0308	8e500d7a-b094-4211-aabd-9b23dbb97368	d40e26db-01df-45f5-89b3-3836422052cf
60	9b38700d-f347-4ec3-96b4-89afdc9fb97b	2	3975	0308	9f104869-ed56-4586-abc6-897d1ce279a2	d40e26db-01df-45f5-89b3-3836422052cf
61	89334caa-1afb-460a-92c2-9abffbcd82fa	1	232	12121	7606f174-60d1-4da8-957a-f0957a9825d2	f294f4ef-bc85-4281-8722-969de08cde43
63	1e8e34ea-7752-40d2-aabe-2d30178a2e85	1	7100	0113	ab076f01-185c-4c85-9201-c1354ecf839c	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
63	097858ca-8b2b-4c5e-b32d-d8c267573232	1	22000	0113	ac6d39f5-e44a-47a6-9242-b776194d8270	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
45	60921eb2-3fcb-43f3-831c-063322554f66	2	1100	0113	68b77e5d-b252-47b4-8e52-453935137f04	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
45	ae0acb35-6589-4b2e-8d43-0708485a4419	2	28000	0113	a8f457bc-202e-4407-945a-fc90428dc7c9	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
48	60921eb2-3fcb-43f3-831c-063322554f66	2	1100	0113	68b77e5d-b252-47b4-8e52-453935137f04	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
48	ae0acb35-6589-4b2e-8d43-0708485a4419	3	28000	0113	a8f457bc-202e-4407-945a-fc90428dc7c9	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
48	d34c8663-60db-4541-9d0d-1f6faba4d9ac	2	7000	0113	a8f457bc-202e-4407-945a-fc90428dc7c9	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
50	3a51e4d6-ca8a-46e9-ac73-3f42a5fe8cad	2	1000	0308	991988d1-6e53-40ef-b09e-203beb71a626	d40e26db-01df-45f5-89b3-3836422052cf
50	76cedd39-2479-4402-acfa-a0a2e95a4fc3	3	4100	0308	8e500d7a-b094-4211-aabd-9b23dbb97368	d40e26db-01df-45f5-89b3-3836422052cf
50	1e8e34ea-7752-40d2-aabe-2d30178a2e85	1	7100	0113	ab076f01-185c-4c85-9201-c1354ecf839c	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
52	1e8e34ea-7752-40d2-aabe-2d30178a2e85	1	7100	0113	ab076f01-185c-4c85-9201-c1354ecf839c	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
52	097858ca-8b2b-4c5e-b32d-d8c267573232	1	22000	0113	ac6d39f5-e44a-47a6-9242-b776194d8270	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
52	55c1a3cb-01f5-4a12-b637-423c0b87af93	1	31000	0113	e03a027c-9192-4b7d-afa4-baf035f8f792	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
52	60921eb2-3fcb-43f3-831c-063322554f66	1	1100	0113	68b77e5d-b252-47b4-8e52-453935137f04	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
52	ae0acb35-6589-4b2e-8d43-0708485a4419	1	28000	0113	a8f457bc-202e-4407-945a-fc90428dc7c9	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
52	e9f0cf99-216e-4a70-826f-64bd0c334f5c	1	11280	0113	ab076f01-185c-4c85-9201-c1354ecf839c	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
54	3a51e4d6-ca8a-46e9-ac73-3f42a5fe8cad	2	1000	0308	991988d1-6e53-40ef-b09e-203beb71a626	d40e26db-01df-45f5-89b3-3836422052cf
59	76cedd39-2479-4402-acfa-a0a2e95a4fc3	3	4100	0308	8e500d7a-b094-4211-aabd-9b23dbb97368	d40e26db-01df-45f5-89b3-3836422052cf
59	1e8e34ea-7752-40d2-aabe-2d30178a2e85	2	7100	0113	ab076f01-185c-4c85-9201-c1354ecf839c	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
59	e9f0cf99-216e-4a70-826f-64bd0c334f5c	2	11280	0113	ab076f01-185c-4c85-9201-c1354ecf839c	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
59	60921eb2-3fcb-43f3-831c-063322554f66	2	1100	0113	68b77e5d-b252-47b4-8e52-453935137f04	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
62	89334caa-1afb-460a-92c2-9abffbcd82fa	2	232	12121	7606f174-60d1-4da8-957a-f0957a9825d2	f294f4ef-bc85-4281-8722-969de08cde43
62	1e8e34ea-7752-40d2-aabe-2d30178a2e85	2	7100	0113	ab076f01-185c-4c85-9201-c1354ecf839c	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
64	76cedd39-2479-4402-acfa-a0a2e95a4fc3	1	4100	0310	8e500d7a-b094-4211-aabd-9b23dbb97368	d40e26db-01df-45f5-89b3-3836422052cf
64	9820a1b0-c947-490a-b7e8-cf7a92f06488	1	4000	0115	e2eee2e4-5fbe-4749-9c72-30b2f47108d5	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
65	76cedd39-2479-4402-acfa-a0a2e95a4fc3	15	4100	0310	8e500d7a-b094-4211-aabd-9b23dbb97368	d40e26db-01df-45f5-89b3-3836422052cf
65	9b38700d-f347-4ec3-96b4-89afdc9fb97b	1	3975	0310	9f104869-ed56-4586-abc6-897d1ce279a2	d40e26db-01df-45f5-89b3-3836422052cf
65	3a51e4d6-ca8a-46e9-ac73-3f42a5fe8cad	2	1000	0310	991988d1-6e53-40ef-b09e-203beb71a626	d40e26db-01df-45f5-89b3-3836422052cf
66	76cedd39-2479-4402-acfa-a0a2e95a4fc3	1	4100	0310	8e500d7a-b094-4211-aabd-9b23dbb97368	d40e26db-01df-45f5-89b3-3836422052cf
67	3a51e4d6-ca8a-46e9-ac73-3f42a5fe8cad	1	1000	0310	991988d1-6e53-40ef-b09e-203beb71a626	d40e26db-01df-45f5-89b3-3836422052cf
67	76cedd39-2479-4402-acfa-a0a2e95a4fc3	1	4100	0310	8e500d7a-b094-4211-aabd-9b23dbb97368	d40e26db-01df-45f5-89b3-3836422052cf
68	76cedd39-2479-4402-acfa-a0a2e95a4fc3	3	4100	0310	8e500d7a-b094-4211-aabd-9b23dbb97368	d40e26db-01df-45f5-89b3-3836422052cf
68	1e8e34ea-7752-40d2-aabe-2d30178a2e85	5	7100	0115	ab076f01-185c-4c85-9201-c1354ecf839c	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
69	3a51e4d6-ca8a-46e9-ac73-3f42a5fe8cad	10	1000	0310	991988d1-6e53-40ef-b09e-203beb71a626	d40e26db-01df-45f5-89b3-3836422052cf
69	5a792989-6fb1-481a-8b3d-43a4f456e0e9	5	19000	0115	a8f457bc-202e-4407-945a-fc90428dc7c9	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
71	3a51e4d6-ca8a-46e9-ac73-3f42a5fe8cad	3	1000	0310	991988d1-6e53-40ef-b09e-203beb71a626	d40e26db-01df-45f5-89b3-3836422052cf
71	76cedd39-2479-4402-acfa-a0a2e95a4fc3	4	4100	0310	8e500d7a-b094-4211-aabd-9b23dbb97368	d40e26db-01df-45f5-89b3-3836422052cf
72	76cedd39-2479-4402-acfa-a0a2e95a4fc3	5	4100	0310	8e500d7a-b094-4211-aabd-9b23dbb97368	d40e26db-01df-45f5-89b3-3836422052cf
72	60921eb2-3fcb-43f3-831c-063322554f66	1	1100	0115	68b77e5d-b252-47b4-8e52-453935137f04	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
72	79ed59ab-7598-4997-bb18-b8d1699fb836	1	11000	0115	31950fa6-7fb0-489b-919f-42743fc40082	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
73	3a51e4d6-ca8a-46e9-ac73-3f42a5fe8cad	1	1000	0310	991988d1-6e53-40ef-b09e-203beb71a626	d40e26db-01df-45f5-89b3-3836422052cf
73	76cedd39-2479-4402-acfa-a0a2e95a4fc3	1	4100	0310	8e500d7a-b094-4211-aabd-9b23dbb97368	d40e26db-01df-45f5-89b3-3836422052cf
73	097858ca-8b2b-4c5e-b32d-d8c267573232	4	22000	0115	ac6d39f5-e44a-47a6-9242-b776194d8270	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
74	76cedd39-2479-4402-acfa-a0a2e95a4fc3	1	4100	0310	8e500d7a-b094-4211-aabd-9b23dbb97368	d40e26db-01df-45f5-89b3-3836422052cf
79	ddec76b9-67b6-40a8-8011-839d7769104e	1	16000	60115	565de8a2-395e-4677-991d-01fd3eed607c	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
79	d34c8663-60db-4541-9d0d-1f6faba4d9ac	1	7000	60115	a8f457bc-202e-4407-945a-fc90428dc7c9	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
79	e9f0cf99-216e-4a70-826f-64bd0c334f5c	5	11280	60115	ab076f01-185c-4c85-9201-c1354ecf839c	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
79	94160dfe-9017-476e-b618-e07bc8641531	5	13000	60115	9de62a43-d249-45d0-8fef-27cc6714258c	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
80	ac6999ce-57af-46e9-a129-ea92331f8fbd	1	1700	60115	31950fa6-7fb0-489b-919f-42743fc40082	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
80	bc3bb3ba-9d3b-4761-b94a-9ebfc9d5e43c	1	9200	60115	31950fa6-7fb0-489b-919f-42743fc40082	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
80	60921eb2-3fcb-43f3-831c-063322554f66	1	1100	60115	68b77e5d-b252-47b4-8e52-453935137f04	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
80	ddec76b9-67b6-40a8-8011-839d7769104e	2	16000	60115	565de8a2-395e-4677-991d-01fd3eed607c	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
81	097858ca-8b2b-4c5e-b32d-d8c267573232	1	22000	60115	ac6d39f5-e44a-47a6-9242-b776194d8270	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
81	1e8e34ea-7752-40d2-aabe-2d30178a2e85	1	7100	60115	ab076f01-185c-4c85-9201-c1354ecf839c	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
81	55c1a3cb-01f5-4a12-b637-423c0b87af93	1	31000	60115	e03a027c-9192-4b7d-afa4-baf035f8f792	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
81	79ed59ab-7598-4997-bb18-b8d1699fb836	1	11000	60115	31950fa6-7fb0-489b-919f-42743fc40082	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
82	3a51e4d6-ca8a-46e9-ac73-3f42a5fe8cad	1	1000	60310	991988d1-6e53-40ef-b09e-203beb71a626	d40e26db-01df-45f5-89b3-3836422052cf
83	3a51e4d6-ca8a-46e9-ac73-3f42a5fe8cad	4	1000	60310	991988d1-6e53-40ef-b09e-203beb71a626	d40e26db-01df-45f5-89b3-3836422052cf
83	ae0acb35-6589-4b2e-8d43-0708485a4419	4	28000	60115	a8f457bc-202e-4407-945a-fc90428dc7c9	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
83	e9f0cf99-216e-4a70-826f-64bd0c334f5c	1	11280	60115	ab076f01-185c-4c85-9201-c1354ecf839c	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
83	ddec76b9-67b6-40a8-8011-839d7769104e	1	16000	60115	565de8a2-395e-4677-991d-01fd3eed607c	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
84	3a51e4d6-ca8a-46e9-ac73-3f42a5fe8cad	1	1000	60310	991988d1-6e53-40ef-b09e-203beb71a626	d40e26db-01df-45f5-89b3-3836422052cf
85	3a51e4d6-ca8a-46e9-ac73-3f42a5fe8cad	1	1000	60310	991988d1-6e53-40ef-b09e-203beb71a626	d40e26db-01df-45f5-89b3-3836422052cf
85	9820a1b0-c947-490a-b7e8-cf7a92f06488	2	4000	60115	e2eee2e4-5fbe-4749-9c72-30b2f47108d5	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
85	ac6999ce-57af-46e9-a129-ea92331f8fbd	1	1700	60115	31950fa6-7fb0-489b-919f-42743fc40082	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
86	3a51e4d6-ca8a-46e9-ac73-3f42a5fe8cad	1	1000	60310	991988d1-6e53-40ef-b09e-203beb71a626	d40e26db-01df-45f5-89b3-3836422052cf
87	94160dfe-9017-476e-b618-e07bc8641531	1	13000	60115	9de62a43-d249-45d0-8fef-27cc6714258c	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
88	89334caa-1afb-460a-92c2-9abffbcd82fa	1	232	612121	7606f174-60d1-4da8-957a-f0957a9825d2	f294f4ef-bc85-4281-8722-969de08cde43
89	b80fd054-a534-4a26-9c3d-4dea431fc149	3	5000	66666	75eebb7e-5ee5-4cab-a7dd-bde8a85f61a6	ff7ba603-50fe-4011-816c-def811c35f24
\.


--
-- Data for Name: Price; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public."Price" (id, price1, price2, price3, price4, price5, price6, "productId", "createdAt", "updatedAt") FROM stdin;
c7b0380e-9067-4668-bd2a-3403476b5fe2	11280	11399	11400	\N	\N	\N	e9f0cf99-216e-4a70-826f-64bd0c334f5c	2023-05-21 18:39:38.946	2023-05-21 18:38:51.934
08d0693f-bf2e-4e00-8a42-3108a1c5f4d9	1000	2000	2998	\N	\N	\N	3a51e4d6-ca8a-46e9-ac73-3f42a5fe8cad	2023-05-21 18:43:02.459	2023-05-21 18:47:48.099
1390b052-721d-4ee8-b852-d4b47e6d32b5	4000	5000	5999	\N	\N	\N	9820a1b0-c947-490a-b7e8-cf7a92f06488	2023-05-21 18:41:39.22	2023-05-21 18:47:48.099
1e253e57-9456-48e1-810d-4c976524b7c4	7000	8000	9000	\N	\N	\N	d34c8663-60db-4541-9d0d-1f6faba4d9ac	2023-05-21 18:40:08.944	2023-05-21 18:47:48.099
2055302e-a3b3-4042-8464-2c2bd348ae24	1100	1200	1300	\N	\N	\N	60921eb2-3fcb-43f3-831c-063322554f66	2023-05-21 18:43:02.459	2023-05-21 18:47:48.099
39d1a7d9-356d-4423-a408-5ce7b53de974	4100	4200	4300	\N	\N	\N	76cedd39-2479-4402-acfa-a0a2e95a4fc3	2023-05-21 18:43:02.459	2023-05-21 18:47:48.099
41014ab8-5531-44ef-a67d-d6a8182c0c9a	7100	7200	7300	\N	\N	\N	1e8e34ea-7752-40d2-aabe-2d30178a2e85	2023-05-21 18:43:02.459	2023-05-21 18:47:48.099
532b3d7d-eccf-4dea-88e2-d78dc402c8a8	1200	1600	1798	\N	\N	\N	bae41e85-c627-4b57-b1b9-a25b233ccdb8	2023-05-21 18:41:39.22	2023-05-21 18:47:48.099
53dd9db2-fda8-4cd8-9c2a-b93fdafecab4	9200	8400	9235	\N	\N	\N	bc3bb3ba-9d3b-4761-b94a-9ebfc9d5e43c	2023-05-21 18:41:39.22	2023-05-21 18:47:48.099
5c8af188-73b4-4e5c-b55f-fc4a8637bf33	11000	12000	12001	\N	\N	\N	79ed59ab-7598-4997-bb18-b8d1699fb836	2023-05-21 18:43:02.459	2023-05-21 18:47:48.099
7266cc3e-1a46-47fa-86a7-5c98705ed488	13000	14000	15000	\N	\N	\N	94160dfe-9017-476e-b618-e07bc8641531	2023-05-21 18:41:39.22	2023-05-21 18:47:48.099
734d9a4d-e539-4a32-9740-2a8e2946b35b	16000	17000	18000	\N	\N	\N	ddec76b9-67b6-40a8-8011-839d7769104e	2023-05-21 18:40:08.944	2023-05-21 18:47:48.099
75fba7d6-a2b8-44cd-9c5f-57487e628a26	19000	20000	21000	\N	\N	\N	5a792989-6fb1-481a-8b3d-43a4f456e0e9	2023-05-21 18:43:02.459	2023-05-21 18:47:48.099
787d1c98-c364-49aa-a0e4-5883d78f7647	22000	23000	24000	\N	\N	\N	097858ca-8b2b-4c5e-b32d-d8c267573232	2023-05-21 18:43:02.459	2023-05-21 18:47:48.099
7932b547-47e2-49e2-8d2b-d5a217c628e7	25000	26000	27000	\N	\N	\N	bf87c9e2-5f50-43eb-8f53-430baeafc68a	2023-05-21 18:41:39.22	2023-05-21 18:47:48.099
97818398-644c-48f7-9b21-21dc74b32697	28000	29000	30000	\N	\N	\N	ae0acb35-6589-4b2e-8d43-0708485a4419	2023-05-21 18:41:39.22	2023-05-21 18:47:48.099
c570ea5f-d226-4bd1-a709-c92c6b8c5537	31000	32000	33000	\N	\N	\N	55c1a3cb-01f5-4a12-b637-423c0b87af93	2023-05-21 18:43:02.459	2023-05-21 18:47:48.099
db6757e5-261c-4da8-aea9-c345b8a98984	1700	1800	1749	\N	\N	\N	ac6999ce-57af-46e9-a129-ea92331f8fbd	2023-05-21 18:41:39.22	2023-05-21 18:47:48.099
fe6d2b88-30bd-48eb-bcb0-1b6e4a5f2143	3975	3812	3249	\N	\N	\N	9b38700d-f347-4ec3-96b4-89afdc9fb97b	2023-05-21 18:41:39.22	2023-05-21 18:47:48.099
ed7d37ad-4207-4dfc-b4fd-c14da1a8a287	232	0	0	\N	\N	\N	89334caa-1afb-460a-92c2-9abffbcd82fa	2023-06-06 23:58:36.846	2023-06-06 23:58:36.846
a16d3f98-804f-4a8a-aec2-75ce7f9bdba9	5000	0	0	\N	\N	\N	b80fd054-a534-4a26-9c3d-4dea431fc149	2023-06-09 16:19:59.58	2023-06-09 16:19:59.58
\.


--
-- Data for Name: Product; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public."Product" (id, name, description, brand, code, eancode, quantity, promo, active, "categoryId", "createdAt", "updatedAt") FROM stdin;
bf87c9e2-5f50-43eb-8f53-430baeafc68a	Equiopo15	500 grs	Red Cut	STEAK003	775465851259	14	f	t	ac6d39f5-e44a-47a6-9242-b776194d8270	2023-05-21 16:19:06.757	2023-05-29 20:14:50.175
d34c8663-60db-4541-9d0d-1f6faba4d9ac	Equipo16	750 ml	Black Barrel	LIQ001	775645851261	195	f	t	a8f457bc-202e-4407-945a-fc90428dc7c9	2023-05-21 16:37:03.046	2023-06-16 01:11:29.536
9b38700d-f347-4ec3-96b4-89afdc9fb97b	Equipo10	Para el dolor de cabeza	Dolex	Drog1254	7702114569888	2	f	t	9f104869-ed56-4586-abc6-897d1ce279a2	2023-05-21 17:53:28.595	2023-06-15 00:29:47.768
ac6999ce-57af-46e9-a129-ea92331f8fbd	Equipo11	450 grs	Horneaditos	BREAD002	775465851255	16	f	t	31950fa6-7fb0-489b-919f-42743fc40082	2023-05-21 17:58:15.513	2023-06-16 18:22:24.041
bc3bb3ba-9d3b-4761-b94a-9ebfc9d5e43c	Equipo14	Tajado	Horneaditos	BREAD003	775465851256	17	f	t	31950fa6-7fb0-489b-919f-42743fc40082	2023-05-21 16:25:59.268	2023-06-16 15:04:50.05
5a792989-6fb1-481a-8b3d-43a4f456e0e9	Equipo4	Doce años	Chirrinchi	wd54654	772114898752	192	f	t	a8f457bc-202e-4407-945a-fc90428dc7c9	2023-05-21 16:23:20.894	2023-06-15 19:27:14.498
60921eb2-3fcb-43f3-831c-063322554f66	Equipo5	Gel	Gillete	BODY001	775465851265	98	f	t	68b77e5d-b252-47b4-8e52-453935137f04	2023-05-21 17:47:56.151	2023-06-16 15:04:50.05
9820a1b0-c947-490a-b7e8-cf7a92f06488	Equipo9	250 grs	Horneaditos	SBREAD001	775465851257	5	f	t	e2eee2e4-5fbe-4749-9c72-30b2f47108d5	2023-05-21 16:33:30.489	2023-06-16 18:22:24.041
3a51e4d6-ca8a-46e9-ac73-3f42a5fe8cad	Equipo2	Azul Esmeralda	Home sweet	aj4564	77054698798	243	f	t	991988d1-6e53-40ef-b09e-203beb71a626	2023-05-21 16:24:30.906	2023-06-16 18:50:34.285
097858ca-8b2b-4c5e-b32d-d8c267573232	Equipo1	600 grs	GSF	STEAK0034	775465851260	133	f	t	ac6d39f5-e44a-47a6-9242-b776194d8270	2023-05-21 16:20:10.6	2023-06-16 17:11:04.436
55c1a3cb-01f5-4a12-b637-423c0b87af93	Equipo3	333 ml	Bavaria	LIQ0013	775465851269	179	f	t	e03a027c-9192-4b7d-afa4-baf035f8f792	2023-05-21 17:44:02.36	2023-06-16 17:11:04.436
94160dfe-9017-476e-b618-e07bc8641531	Equipo8	1.8 litros	JGB	lim23442	5454654544545	34	f	t	9de62a43-d249-45d0-8fef-27cc6714258c	2023-05-21 16:21:37.067	2023-06-16 19:36:29.283
89334caa-1afb-460a-92c2-9abffbcd82fa	Acetaminofen	Para el dolor de cabeza	Dolex	Drog125445	1277021145987	9	f	t	7606f174-60d1-4da8-957a-f0957a9825d2	2023-06-06 23:58:36.787	2023-06-16 19:50:31.584
1e8e34ea-7752-40d2-aabe-2d30178a2e85	Equipo2	500 grs	Red Cut	STEAK002	775465851253	79	f	t	ab076f01-185c-4c85-9201-c1354ecf839c	2023-05-21 16:18:01.498	2023-06-16 17:11:04.436
b80fd054-a534-4a26-9c3d-4dea431fc149	Producto demo	Tuberia pvc	pavc	ad123	7897987987999	453	f	t	75eebb7e-5ee5-4cab-a7dd-bde8a85f61a6	2023-06-09 16:19:59.544	2023-06-16 20:14:56.366
76cedd39-2479-4402-acfa-a0a2e95a4fc3	Equipo6	Cuatro puestos	Pullman	COM6751	7705456466455	735	f	t	8e500d7a-b094-4211-aabd-9b23dbb97368	2023-05-21 17:52:01.155	2023-06-16 00:48:29.648
bae41e85-c627-4b57-b1b9-a25b233ccdb8	Equipo13	Aerosol	Brilla King	CLEANP001	77515697565	115	f	t	9de62a43-d249-45d0-8fef-27cc6714258c	2023-05-21 17:46:58.136	2023-06-16 01:06:49.943
79ed59ab-7598-4997-bb18-b8d1699fb836	Equipo7	450 grs	Horneaditos	BREAD001	775465851254	4	f	t	31950fa6-7fb0-489b-919f-42743fc40082	2023-05-21 18:00:14.879	2023-06-16 17:11:04.436
e9f0cf99-216e-4a70-826f-64bd0c334f5c	Equipo18	500 grs	Red Cut	STEAK001	775465851258	109	f	t	ab076f01-185c-4c85-9201-c1354ecf839c	2023-05-21 16:16:27.411	2023-06-16 17:30:33.166
ddec76b9-67b6-40a8-8011-839d7769104e	Equipo17	Tocador, 2 unidades 220 grs	Colombiana de Jabones	SOAP001	775465851263	152	f	t	565de8a2-395e-4677-991d-01fd3eed607c	2023-05-21 17:45:54.649	2023-06-16 17:30:33.166
ae0acb35-6589-4b2e-8d43-0708485a4419	Equipo12	333 ml	Bahia	LIQ002	775465851262	416	f	t	a8f457bc-202e-4407-945a-fc90428dc7c9	2023-05-21 16:39:21.57	2023-06-16 17:30:33.166
\.


--
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public."Roles" (id, name) FROM stdin;
1	cliente
3	admin
\.


--
-- Data for Name: Usuario; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public."Usuario" (id, "roleId", name, phone, email, "docType", "numDoc", "Departament", city, address, "bussinessUnit", zone, asesor, discount) FROM stdin;
2	1	Oscar Alberto Padilla	3333333333	oscar.padilla@equisol.com	cc	44444444	Antioquia	Sta Elena	Calle 2 # 3-4	6	2	\N	1.5
3	1	Wilfer Castaño	4444444444	wilfer.castano@equisol.com.co	cc	33333333	Cordoba	Montería	Carrera 12 # 4-13	6	5	\N	20.14
5	1	Mariana Velez Vergara	3006005124	super@example.com	CC	43740489	Cundinamarca	Villeta	Calle 52D # 57A-40	6	02	jovany.velez@gmail.com	0
7	1	Sandra Paola Vergara	3006005323	spvergara@gmail.com	CC	43740482	Antioquia	Arboletes	Calle 23a # 32-41	6	03	jairo.rivera@gmail.com	0
1	1	Jovany Velez Arango	3002005393	jovany.velez@gmail.com	cc	15263832	Antioquia	Bello	calle 52d # 57a-40	6	3	jvelez23@misena.edu.co	8.13
\.


--
-- Data for Name: Zones; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public."Zones" (id, name, zone) FROM stdin;
15	Antioquia	1
16	Costa	2
17	Centro	3
18	Oriente	4
19	Occidente	5
20	Sur	6
\.


--
-- Data for Name: _CategoriasZonas; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public."_CategoriasZonas" ("A", "B") FROM stdin;
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
0ce34ed8-5dd3-464c-b8ac-c64f3ab6fa68	d1fb6e9016e537e539c0b04aef95773de5a46db3802cbff96c9df7f92ed33356	2023-05-20 23:50:26.882655-05	20230520162805_creating_tables	\N	\N	2023-05-20 23:50:25.308654-05	1
\.


--
-- Name: CcostoZoneCategories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecommerce
--

SELECT pg_catalog.setval('public."CcostoZoneCategories_id_seq"', 36, true);


--
-- Name: OrdenDePedido_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecommerce
--

SELECT pg_catalog.setval('public."OrdenDePedido_id_seq"', 89, true);


--
-- Name: Roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecommerce
--

SELECT pg_catalog.setval('public."Roles_id_seq"', 3, true);


--
-- Name: Usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecommerce
--

SELECT pg_catalog.setval('public."Usuario_id_seq"', 10, true);


--
-- Name: Zones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecommerce
--

SELECT pg_catalog.setval('public."Zones_id_seq"', 20, true);


--
-- Name: AuthUser AuthUser_pkey; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."AuthUser"
    ADD CONSTRAINT "AuthUser_pkey" PRIMARY KEY (id);


--
-- Name: Category Category_pkey; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."Category"
    ADD CONSTRAINT "Category_pkey" PRIMARY KEY (id);


--
-- Name: CcostoZoneCategories CcostoZoneCategories_pkey; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."CcostoZoneCategories"
    ADD CONSTRAINT "CcostoZoneCategories_pkey" PRIMARY KEY (id);


--
-- Name: Image Image_pkey; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."Image"
    ADD CONSTRAINT "Image_pkey" PRIMARY KEY (id);


--
-- Name: OrdenDePedidoProducto OrdenDePedidoProducto_pkey; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."OrdenDePedidoProducto"
    ADD CONSTRAINT "OrdenDePedidoProducto_pkey" PRIMARY KEY ("ordenDePedidoId", "productoId");


--
-- Name: OrdenDePedido OrdenDePedido_pkey; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."OrdenDePedido"
    ADD CONSTRAINT "OrdenDePedido_pkey" PRIMARY KEY (id);


--
-- Name: Price Price_pkey; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."Price"
    ADD CONSTRAINT "Price_pkey" PRIMARY KEY (id);


--
-- Name: Product Product_pkey; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_pkey" PRIMARY KEY (id);


--
-- Name: Roles Roles_pkey; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_pkey" PRIMARY KEY (id);


--
-- Name: Usuario Usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_pkey" PRIMARY KEY (id);


--
-- Name: Zones Zones_pkey; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."Zones"
    ADD CONSTRAINT "Zones_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: AuthUser_email_key; Type: INDEX; Schema: public; Owner: ecommerce
--

CREATE UNIQUE INDEX "AuthUser_email_key" ON public."AuthUser" USING btree (email);


--
-- Name: AuthUser_userAuthToken_key; Type: INDEX; Schema: public; Owner: ecommerce
--

CREATE UNIQUE INDEX "AuthUser_userAuthToken_key" ON public."AuthUser" USING btree ("userAuthToken");


--
-- Name: CcostoZoneCategories_ccosto_key; Type: INDEX; Schema: public; Owner: ecommerce
--

CREATE UNIQUE INDEX "CcostoZoneCategories_ccosto_key" ON public."CcostoZoneCategories" USING btree (ccosto);


--
-- Name: Product_code_key; Type: INDEX; Schema: public; Owner: ecommerce
--

CREATE UNIQUE INDEX "Product_code_key" ON public."Product" USING btree (code);


--
-- Name: Product_eancode_key; Type: INDEX; Schema: public; Owner: ecommerce
--

CREATE UNIQUE INDEX "Product_eancode_key" ON public."Product" USING btree (eancode);


--
-- Name: Roles_name_key; Type: INDEX; Schema: public; Owner: ecommerce
--

CREATE UNIQUE INDEX "Roles_name_key" ON public."Roles" USING btree (name);


--
-- Name: Usuario_email_key; Type: INDEX; Schema: public; Owner: ecommerce
--

CREATE UNIQUE INDEX "Usuario_email_key" ON public."Usuario" USING btree (email);


--
-- Name: Usuario_numDoc_key; Type: INDEX; Schema: public; Owner: ecommerce
--

CREATE UNIQUE INDEX "Usuario_numDoc_key" ON public."Usuario" USING btree ("numDoc");


--
-- Name: _CategoriasZonas_AB_unique; Type: INDEX; Schema: public; Owner: ecommerce
--

CREATE UNIQUE INDEX "_CategoriasZonas_AB_unique" ON public."_CategoriasZonas" USING btree ("A", "B");


--
-- Name: _CategoriasZonas_B_index; Type: INDEX; Schema: public; Owner: ecommerce
--

CREATE INDEX "_CategoriasZonas_B_index" ON public."_CategoriasZonas" USING btree ("B");


--
-- Name: Category Category_padreId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."Category"
    ADD CONSTRAINT "Category_padreId_fkey" FOREIGN KEY ("padreId") REFERENCES public."Category"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: CcostoZoneCategories CcostoZoneCategories_categoryId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."CcostoZoneCategories"
    ADD CONSTRAINT "CcostoZoneCategories_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES public."Category"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Image Image_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."Image"
    ADD CONSTRAINT "Image_productId_fkey" FOREIGN KEY ("productId") REFERENCES public."Product"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: OrdenDePedidoProducto OrdenDePedidoProducto_ordenDePedidoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."OrdenDePedidoProducto"
    ADD CONSTRAINT "OrdenDePedidoProducto_ordenDePedidoId_fkey" FOREIGN KEY ("ordenDePedidoId") REFERENCES public."OrdenDePedido"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: OrdenDePedidoProducto OrdenDePedidoProducto_productoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."OrdenDePedidoProducto"
    ADD CONSTRAINT "OrdenDePedidoProducto_productoId_fkey" FOREIGN KEY ("productoId") REFERENCES public."Product"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: OrdenDePedido OrdenDePedido_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."OrdenDePedido"
    ADD CONSTRAINT "OrdenDePedido_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."Usuario"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Price Price_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."Price"
    ADD CONSTRAINT "Price_productId_fkey" FOREIGN KEY ("productId") REFERENCES public."Product"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Product Product_categoryId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES public."Category"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Usuario Usuario_roleId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES public."Roles"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: _CategoriasZonas _CategoriasZonas_A_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."_CategoriasZonas"
    ADD CONSTRAINT "_CategoriasZonas_A_fkey" FOREIGN KEY ("A") REFERENCES public."Category"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _CategoriasZonas _CategoriasZonas_B_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."_CategoriasZonas"
    ADD CONSTRAINT "_CategoriasZonas_B_fkey" FOREIGN KEY ("B") REFERENCES public."Zones"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: ecommerce
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


--
-- PostgreSQL database dump complete
--

