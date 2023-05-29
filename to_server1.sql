--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3 (Ubuntu 15.3-1.pgdg22.04+1)
-- Dumped by pg_dump version 15.3 (Ubuntu 15.3-1.pgdg22.04+1)

-- Started on 2023-05-29 09:36:56 -05

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
-- TOC entry 5 (class 2615 OID 16693)
-- Name: public; Type: SCHEMA; Schema: -; Owner: admin
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO admin;

--
-- TOC entry 3551 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: admin
--

COMMENT ON SCHEMA public IS '';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 222 (class 1259 OID 16738)
-- Name: Category; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."Category" (
    id text NOT NULL,
    name text NOT NULL,
    "padreId" text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Category" OWNER TO admin;

--
-- TOC entry 230 (class 1259 OID 17310)
-- Name: CcostoZoneCategories; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."CcostoZoneCategories" (
    id integer NOT NULL,
    zone text NOT NULL,
    "categoryId" text NOT NULL,
    ccosto text NOT NULL
);


ALTER TABLE public."CcostoZoneCategories" OWNER TO admin;

--
-- TOC entry 229 (class 1259 OID 17309)
-- Name: CcostoZoneCategories_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."CcostoZoneCategories_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."CcostoZoneCategories_id_seq" OWNER TO admin;

--
-- TOC entry 3553 (class 0 OID 0)
-- Dependencies: 229
-- Name: CcostoZoneCategories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."CcostoZoneCategories_id_seq" OWNED BY public."CcostoZoneCategories".id;


--
-- TOC entry 224 (class 1259 OID 16754)
-- Name: Image; Type: TABLE; Schema: public; Owner: admin
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


ALTER TABLE public."Image" OWNER TO admin;

--
-- TOC entry 220 (class 1259 OID 16722)
-- Name: OrdenDePedido; Type: TABLE; Schema: public; Owner: admin
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
    notes text
);


ALTER TABLE public."OrdenDePedido" OWNER TO admin;

--
-- TOC entry 221 (class 1259 OID 16731)
-- Name: OrdenDePedidoProducto; Type: TABLE; Schema: public; Owner: admin
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


ALTER TABLE public."OrdenDePedidoProducto" OWNER TO admin;

--
-- TOC entry 219 (class 1259 OID 16721)
-- Name: OrdenDePedido_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."OrdenDePedido_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."OrdenDePedido_id_seq" OWNER TO admin;

--
-- TOC entry 3554 (class 0 OID 0)
-- Dependencies: 219
-- Name: OrdenDePedido_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."OrdenDePedido_id_seq" OWNED BY public."OrdenDePedido".id;


--
-- TOC entry 225 (class 1259 OID 16762)
-- Name: Price; Type: TABLE; Schema: public; Owner: admin
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


ALTER TABLE public."Price" OWNER TO admin;

--
-- TOC entry 223 (class 1259 OID 16746)
-- Name: Product; Type: TABLE; Schema: public; Owner: admin
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


ALTER TABLE public."Product" OWNER TO admin;

--
-- TOC entry 218 (class 1259 OID 16713)
-- Name: Roles; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."Roles" (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public."Roles" OWNER TO admin;

--
-- TOC entry 217 (class 1259 OID 16712)
-- Name: Roles_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."Roles_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Roles_id_seq" OWNER TO admin;

--
-- TOC entry 3555 (class 0 OID 0)
-- Dependencies: 217
-- Name: Roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."Roles_id_seq" OWNED BY public."Roles".id;


--
-- TOC entry 216 (class 1259 OID 16704)
-- Name: Usuario; Type: TABLE; Schema: public; Owner: admin
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
    descount numeric(2,2) DEFAULT 0 NOT NULL
);


ALTER TABLE public."Usuario" OWNER TO admin;

--
-- TOC entry 215 (class 1259 OID 16703)
-- Name: Usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."Usuario_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Usuario_id_seq" OWNER TO admin;

--
-- TOC entry 3556 (class 0 OID 0)
-- Dependencies: 215
-- Name: Usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."Usuario_id_seq" OWNED BY public."Usuario".id;


--
-- TOC entry 232 (class 1259 OID 17320)
-- Name: Zones; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."Zones" (
    id integer NOT NULL,
    name text NOT NULL,
    code integer NOT NULL
);


ALTER TABLE public."Zones" OWNER TO admin;

--
-- TOC entry 231 (class 1259 OID 17319)
-- Name: Zones_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."Zones_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Zones_id_seq" OWNER TO admin;

--
-- TOC entry 3557 (class 0 OID 0)
-- Dependencies: 231
-- Name: Zones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."Zones_id_seq" OWNED BY public."Zones".id;


--
-- TOC entry 233 (class 1259 OID 17328)
-- Name: _CategoriasZonas; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."_CategoriasZonas" (
    "A" text NOT NULL,
    "B" integer NOT NULL
);


ALTER TABLE public."_CategoriasZonas" OWNER TO admin;

--
-- TOC entry 214 (class 1259 OID 16694)
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: admin
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


ALTER TABLE public._prisma_migrations OWNER TO admin;

--
-- TOC entry 228 (class 1259 OID 16784)
-- Name: auth_key; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_key (
    id text NOT NULL,
    hashed_password text,
    user_id text NOT NULL,
    primary_key boolean NOT NULL,
    expires bigint
);


ALTER TABLE public.auth_key OWNER TO admin;

--
-- TOC entry 227 (class 1259 OID 16777)
-- Name: auth_session; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_session (
    id text NOT NULL,
    user_id text NOT NULL,
    active_expires bigint NOT NULL,
    idle_expires bigint NOT NULL
);


ALTER TABLE public.auth_session OWNER TO admin;

--
-- TOC entry 226 (class 1259 OID 16770)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_user (
    id text NOT NULL,
    email text NOT NULL
);


ALTER TABLE public.auth_user OWNER TO admin;

--
-- TOC entry 3327 (class 2604 OID 17313)
-- Name: CcostoZoneCategories id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."CcostoZoneCategories" ALTER COLUMN id SET DEFAULT nextval('public."CcostoZoneCategories_id_seq"'::regclass);


--
-- TOC entry 3321 (class 2604 OID 16725)
-- Name: OrdenDePedido id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."OrdenDePedido" ALTER COLUMN id SET DEFAULT nextval('public."OrdenDePedido_id_seq"'::regclass);


--
-- TOC entry 3320 (class 2604 OID 16716)
-- Name: Roles id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Roles" ALTER COLUMN id SET DEFAULT nextval('public."Roles_id_seq"'::regclass);


--
-- TOC entry 3318 (class 2604 OID 16707)
-- Name: Usuario id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Usuario" ALTER COLUMN id SET DEFAULT nextval('public."Usuario_id_seq"'::regclass);


--
-- TOC entry 3328 (class 2604 OID 17323)
-- Name: Zones id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Zones" ALTER COLUMN id SET DEFAULT nextval('public."Zones_id_seq"'::regclass);


--
-- TOC entry 3534 (class 0 OID 16738)
-- Dependencies: 222
-- Data for Name: Category; Type: TABLE DATA; Schema: public; Owner: admin
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
301d9226-1cec-4836-9526-934daae7ae52	Two	215f5344-b694-4fa9-8505-ec9e2095a90c	2023-05-21 14:47:43.564	2023-05-29 12:21:43.491
e03a027c-9192-4b7d-afa4-baf035f8f792	One	350a2fc2-2467-4621-ab5d-de748d12afef	2023-05-21 14:49:50.933	2023-05-29 12:22:21.992
a8f457bc-202e-4407-945a-fc90428dc7c9	Two	350a2fc2-2467-4621-ab5d-de748d12afef	2023-05-21 14:49:50.933	2023-05-29 12:22:21.992
68b77e5d-b252-47b4-8e52-453935137f04	One	565de8a2-395e-4677-991d-01fd3eed607c	2023-05-21 14:53:08.264	2023-05-29 12:23:02.534
9e2085c7-822c-4174-9629-2826a749508a	One	1d5b41aa-4a38-4b81-ae39-ef1149263e03	2023-05-21 14:51:40.114	2023-05-29 12:23:02.534
9de62a43-d249-45d0-8fef-27cc6714258c	Two	1d5b41aa-4a38-4b81-ae39-ef1149263e03	2023-05-21 14:52:17.753	2023-05-29 12:23:02.534
\.


--
-- TOC entry 3542 (class 0 OID 17310)
-- Dependencies: 230
-- Data for Name: CcostoZoneCategories; Type: TABLE DATA; Schema: public; Owner: admin
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
\.


--
-- TOC entry 3536 (class 0 OID 16754)
-- Dependencies: 224
-- Data for Name: Image; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."Image" (id, "publicId", "secureUrl", "productId", "createdAt", "updatedAt", name) FROM stdin;
1c63f8d7-8122-4023-90fe-72523fba8bc0	tienda/tymaurkz9ijxgfnixxwj	https://res.cloudinary.com/dqlbbx7ud/image/upload/v1675527497/tienda/tymaurkz9ijxgfnixxwj.png	9820a1b0-c947-490a-b7e8-cf7a92f06488	2023-05-21 18:18:32.906	2023-05-21 18:16:46.446	one
246b8572-e23f-43d2-a911-8df7241e384a	tienda/ugh0bruh783x39mn7xdp	https://res.cloudinary.com/dqlbbx7ud/image/upload/v1675527982/tienda/ugh0bruh783x39mn7xdp.png	1e8e34ea-7752-40d2-aabe-2d30178a2e85	2023-05-21 18:18:32.906	2023-05-21 18:16:56.754	one
37144183-465e-4e3d-833a-684cbae5cf51	tienda/ddawle09aomymctx2rij	https://res.cloudinary.com/dqlbbx7ud/image/upload/v1675527343/tienda/ddawle09aomymctx2rij.png	79ed59ab-7598-4997-bb18-b8d1699fb836	2023-05-21 18:19:34.881	2023-05-21 18:18:38.025	one
5e311c8d-a9d1-4510-ac1d-4e97ae1e5883	tienda/y7mfzr2tcln7xrmwqtbp	https://res.cloudinary.com/dqlbbx7ud/image/upload/v1675527879/tienda/y7mfzr2tcln7xrmwqtbp.png	e9f0cf99-216e-4a70-826f-64bd0c334f5c	2023-05-21 18:20:46.347	2023-05-21 18:19:37.053	one
f2ad6a0f-aadc-4cd0-bc2a-050ace91d4f4	tienda/cwg5v2lbodzesg8fbojb	https://res.cloudinary.com/dqlbbx7ud/image/upload/v1673931330/tienda/cwg5v2lbodzesg8fbojb.png	94160dfe-9017-476e-b618-e07bc8641531	2023-05-21 18:22:08.161	2023-05-21 18:20:51.337	one
02b70d56-8ea2-4d4e-8d32-864b736d4e8b	tienda/wtmerzxwhm61s8wwbpio	https://res.cloudinary.com/dqlbbx7ud/image/upload/v1675529629/tienda/wtmerzxwhm61s8wwbpio.png	ddec76b9-67b6-40a8-8011-839d7769104e	2023-05-21 18:23:10.901	2023-05-21 18:22:12.498	one
897e7f4c-ba60-4680-a9cc-1b791cbbb83e	tienda/r0uco7vb8o5riiqizsyv	https://res.cloudinary.com/dqlbbx7ud/image/upload/v1674333072/tienda/r0uco7vb8o5riiqizsyv.png	5a792989-6fb1-481a-8b3d-43a4f456e0e9	2023-05-21 18:24:05.814	2023-05-21 18:23:13.91	one
b37de8b5-daf4-41c4-841e-46cd08c935f6	tienda/t4gwpnxf3kpwhkbvd6l4	https://res.cloudinary.com/dqlbbx7ud/image/upload/v1683211038/tienda/t4gwpnxf3kpwhkbvd6l4.png	9b38700d-f347-4ec3-96b4-89afdc9fb97b	2023-05-21 18:26:21.997	2023-05-21 18:25:20.966	one
b2c59ac6-787e-45b1-ad6a-591e50163074	tienda/eftehf4z3glck9cl3ish	https://res.cloudinary.com/dqlbbx7ud/image/upload/v1675528127/tienda/eftehf4z3glck9cl3ish.png	bf87c9e2-5f50-43eb-8f53-430baeafc68a	2023-05-21 18:27:24.559	2023-05-21 18:26:25.21	one
d5308d5f-d7f6-4ce7-83dd-cdb80e74528e	tienda/t4emrm6bqyxqh51rurqt	https://res.cloudinary.com/dqlbbx7ud/image/upload/v1675529377/tienda/t4emrm6bqyxqh51rurqt.png	55c1a3cb-01f5-4a12-b637-423c0b87af93	2023-05-21 18:28:20.871	2023-05-21 18:27:29.442	one
973d4ff9-6778-48c6-8a1e-ad8ed268f899	tienda/xjasf2cplwv28byhu6ov	https://res.cloudinary.com/dqlbbx7ud/image/upload/v1675528264/tienda/xjasf2cplwv28byhu6ov.png	097858ca-8b2b-4c5e-b32d-d8c267573232	2023-05-21 18:29:10.299	2023-05-21 18:28:30.384	one
7040a9f9-372d-4483-80ed-dbfb8c82e4a3	tienda/eckt6cnpf24n1svqjxol	https://res.cloudinary.com/dqlbbx7ud/image/upload/v1675530011/tienda/eckt6cnpf24n1svqjxol.png	60921eb2-3fcb-43f3-831c-063322554f66	2023-05-21 18:30:12.935	2023-05-21 18:29:13.609	one
1761eeed-496a-480f-a89b-9394a8465a8d	tienda/b5frbes0ii0perk8cnay	https://res.cloudinary.com/dqlbbx7ud/image/upload/v1675528720/tienda/b5frbes0ii0perk8cnay.png	d34c8663-60db-4541-9d0d-1f6faba4d9ac	2023-05-21 18:31:15.179	2023-05-21 18:30:14.339	one
5ead3ef1-ff65-4a9b-b940-ef5e0e192cad	tienda/vlkmxflyvfwuuc7blawc	https://res.cloudinary.com/dqlbbx7ud/image/upload/v1675529838/tienda/vlkmxflyvfwuuc7blawc.png	bae41e85-c627-4b57-b1b9-a25b233ccdb8	2023-05-21 18:32:52.67	2023-05-21 18:31:16.268	one
0e57d77e-2007-47f9-bd96-78d1adca5b06	tienda/cdkbnlqi55m3ucxritp3	https://res.cloudinary.com/dqlbbx7ud/image/upload/v1674362286/tienda/cdkbnlqi55m3ucxritp3.png	3a51e4d6-ca8a-46e9-ac73-3f42a5fe8cad	2023-05-21 18:33:44.058	2023-05-21 18:32:54.211	one
09961592-019c-4d53-a6ca-3f2802f7c487	tienda/k34kzem3gw7p19txfxio	https://res.cloudinary.com/dqlbbx7ud/image/upload/v1675527342/tienda/k34kzem3gw7p19txfxio.jpg	79ed59ab-7598-4997-bb18-b8d1699fb836	2023-05-21 18:19:34.881	2023-05-29 11:02:52.517	main
37f7c8ec-4881-4006-bc65-8d679389c10b	tienda/icdde0nxlseewtcrokxc	https://res.cloudinary.com/dqlbbx7ud/image/upload/v1676914809/tienda/ga2un09rdxyejb3cihje.jpg	76cedd39-2479-4402-acfa-a0a2e95a4fc3	2023-05-21 18:25:13.735	2023-05-28 16:15:56.003	one
11f0102e-b43b-484b-848f-17fd06175ca0	tienda/uamo6loznfde7avbaryu	https://res.cloudinary.com/dqlbbx7ud/image/upload/v1683211039/tienda/uamo6loznfde7avbaryu.png	9b38700d-f347-4ec3-96b4-89afdc9fb97b	2023-05-21 18:26:21.997	2023-05-29 11:05:01.728	main
152c685c-8afe-4beb-9e55-4b93533b7513	tienda/bj6i3a9ue6scqmszwrts	https://res.cloudinary.com/dqlbbx7ud/image/upload/v1675530011/tienda/bj6i3a9ue6scqmszwrts.png	60921eb2-3fcb-43f3-831c-063322554f66	2023-05-21 18:30:12.935	2023-05-29 11:16:26.907	main
e9a139ee-fa38-41e0-b50e-10ab62a402b8	tienda/uihvd7tl80moneboztw4	https://res.cloudinary.com/dqlbbx7ud/image/upload/v1675528955/tienda/uihvd7tl80moneboztw4.png	ae0acb35-6589-4b2e-8d43-0708485a4419	2023-05-21 18:34:51.874	2023-05-21 18:33:45.212	one
917a6cdc-3e6f-4904-9e97-fe9384fc12cb	tienda/elkfmdzrfacmqeydge4v	https://res.cloudinary.com/dqlbbx7ud/image/upload/v1675526801/tienda/elkfmdzrfacmqeydge4v.png	bc3bb3ba-9d3b-4761-b94a-9ebfc9d5e43c	2023-05-21 18:35:48.997	2023-05-21 18:34:53.126	one
489a77d8-0eec-459b-b45a-b46c0ea22648	tienda/suuhqmy3wxeb42tjwgbp	https://res.cloudinary.com/dqlbbx7ud/image/upload/v1675527124/tienda/suuhqmy3wxeb42tjwgbp.png	ac6999ce-57af-46e9-a129-ea92331f8fbd	2023-05-21 18:36:49.328	2023-05-21 18:35:50.528	one
2765e343-f358-413b-96f2-54823137c315	tienda/jpp1ljauaz9clujsw932	https://res.cloudinary.com/dqlbbx7ud/image/upload/v1674333072/tienda/jpp1ljauaz9clujsw932.png	5a792989-6fb1-481a-8b3d-43a4f456e0e9	2023-05-21 18:24:05.814	2023-05-29 11:16:26.907	main
28502bff-b0ba-4ef8-b69b-cad1cd5bde2d	tienda/skgtatuhjupaiucmiuxe	https://res.cloudinary.com/dqlbbx7ud/image/upload/v1675529628/tienda/skgtatuhjupaiucmiuxe.png	ddec76b9-67b6-40a8-8011-839d7769104e	2023-05-21 18:23:10.901	2023-05-29 11:16:26.907	main
2b621a5e-b12f-4ade-acba-350847e78a11	tienda/vxj893gmq4qdzcllz4yh	https://res.cloudinary.com/dqlbbx7ud/image/upload/v1675526800/tienda/vxj893gmq4qdzcllz4yh.png	bc3bb3ba-9d3b-4761-b94a-9ebfc9d5e43c	2023-05-21 18:35:48.997	2023-05-29 11:16:26.907	main
2be3a7dd-2e11-46ed-862b-79cd5dfbed90	tienda/dotvsqoucxdoztdlpnq6	https://res.cloudinary.com/dqlbbx7ud/image/upload/v1675529837/tienda/dotvsqoucxdoztdlpnq6.png	bae41e85-c627-4b57-b1b9-a25b233ccdb8	2023-05-21 18:32:52.67	2023-05-29 11:16:26.907	main
36d18214-7adf-4356-b756-86768bf005ca	tienda/fdg4oymmkxeubtp3dcbu	https://res.cloudinary.com/dqlbbx7ud/image/upload/v1675527496/tienda/fdg4oymmkxeubtp3dcbu.jpg	9820a1b0-c947-490a-b7e8-cf7a92f06488	2023-05-21 18:18:32.906	2023-05-29 11:16:26.907	main
507f7099-5d13-4b1d-b226-d090cded7fcb	tienda/dvth4n3azlnm86zwwats	https://res.cloudinary.com/dqlbbx7ud/image/upload/v1675528954/tienda/dvth4n3azlnm86zwwats.jpg	ae0acb35-6589-4b2e-8d43-0708485a4419	2023-05-21 18:34:51.874	2023-05-29 11:16:26.907	main
514aed07-516c-4981-b4c0-f2d14d90bd1c	tienda/dnbb8pbnkim90ijflrzs	https://res.cloudinary.com/dqlbbx7ud/image/upload/v1675528263/tienda/dnbb8pbnkim90ijflrzs.png	097858ca-8b2b-4c5e-b32d-d8c267573232	2023-05-21 18:29:10.299	2023-05-29 11:16:26.907	main
66086760-4ee9-470e-ab91-79ea1e716e2a	tienda/nbijt8zro1bjfkdkdk0i	https://res.cloudinary.com/dqlbbx7ud/image/upload/v1675529377/tienda/nbijt8zro1bjfkdkdk0i.png	55c1a3cb-01f5-4a12-b637-423c0b87af93	2023-05-21 18:28:20.871	2023-05-29 11:16:26.907	main
711b2d53-d43c-4e5b-9f5a-1a5e7e396cbf	tienda/fhjkbscsq2c1qau8hm9m	https://res.cloudinary.com/dqlbbx7ud/image/upload/v1674362286/tienda/fhjkbscsq2c1qau8hm9m.png	3a51e4d6-ca8a-46e9-ac73-3f42a5fe8cad	2023-05-21 18:33:44.058	2023-05-29 11:16:26.907	main
78b001fa-0c78-48f8-b39b-2a9ee915786b	tienda/btw1gvyxld6unxb0vexz	https://res.cloudinary.com/dqlbbx7ud/image/upload/v1675528126/tienda/btw1gvyxld6unxb0vexz.jpg	bf87c9e2-5f50-43eb-8f53-430baeafc68a	2023-05-21 18:27:24.559	2023-05-29 11:16:26.907	main
94317812-cf8b-490a-8264-1d57ec416e0b	tienda/jjjvdtqobaciwb1hgac6	https://res.cloudinary.com/dqlbbx7ud/image/upload/v1676914808/tienda/jjjvdtqobaciwb1hgac6.jpg	76cedd39-2479-4402-acfa-a0a2e95a4fc3	2023-05-21 18:25:13.735	2023-05-29 11:16:26.907	main
9435d5d8-aff0-409a-9f23-3b6f887e1f22	tienda/ga2un09rdxyejb3cihje	https://res.cloudinary.com/dqlbbx7ud/image/upload/v1675527981/tienda/ga2un09rdxyejb3cihje.png	1e8e34ea-7752-40d2-aabe-2d30178a2e85	2023-05-21 18:16:40.689	2023-05-29 11:16:26.907	main
9e8187e1-564b-441c-a2cf-c02a9a3d4417	tienda/l9te04k6k2wsztzajgjh	https://res.cloudinary.com/dqlbbx7ud/image/upload/v1675527879/tienda/l9te04k6k2wsztzajgjh.jpg	e9f0cf99-216e-4a70-826f-64bd0c334f5c	2023-05-21 18:20:46.347	2023-05-29 11:16:26.907	main
abbe9285-10d8-4b07-ac5f-8deb48e1e11e	tienda/nwueswqjmurotvrjh1ix	https://res.cloudinary.com/dqlbbx7ud/image/upload/v1675528719/tienda/nwueswqjmurotvrjh1ix.jpg	d34c8663-60db-4541-9d0d-1f6faba4d9ac	2023-05-21 18:31:15.179	2023-05-29 11:16:26.907	main
d8e8d890-8123-4155-a7ed-a2053a82ef69	tienda/znksamixi4ff531bpdxn	https://res.cloudinary.com/dqlbbx7ud/image/upload/v1675527123/tienda/znksamixi4ff531bpdxn.png	ac6999ce-57af-46e9-a129-ea92331f8fbd	2023-05-21 18:36:49.328	2023-05-29 11:16:26.907	main
faabf75c-4434-4b58-b6ba-fdbdb66752ca	tienda/h0e89buxchmk0fiijylc	https://res.cloudinary.com/dqlbbx7ud/image/upload/v1673931330/tienda/h0e89buxchmk0fiijylc.jpg	94160dfe-9017-476e-b618-e07bc8641531	2023-05-21 18:22:08.161	2023-05-29 11:16:26.907	main
\.


--
-- TOC entry 3532 (class 0 OID 16722)
-- Dependencies: 220
-- Data for Name: OrdenDePedido; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."OrdenDePedido" (id, fecha, "userId", "direccionEntrega", "ciudadEnt", "departamentoEnt", "metodoPago", estado, "fechaDespacho", "updatedAt", notes) FROM stdin;
29	2023-05-28 15:49:37.44	1	Calle 23 # 33-23	Alejandría	Antioquia	\N	\N	\N	2023-05-28 15:49:37.44	sdfsfs
30	2023-05-28 15:55:05.109	1	Carrera 12 # 45-45	Arauquita	Arauca	\N	\N	\N	2023-05-28 15:55:05.109	iiuiyi
31	2023-05-28 16:35:10.214	1	Carrera 12 # 21-32	Apartadó	Antioquia	\N	\N	\N	2023-05-28 16:35:10.214	Edificio plaza principal, piso 4, 303
32	2023-05-28 16:59:58.964	1	Transversal 32 # 32-32	Arauquita	Arauca	\N	\N	\N	2023-05-28 16:59:58.964	234234
33	2023-05-29 04:12:50.794	1	Transversal 23 # 34-423	Puerto Santander	Amazonas	\N	\N	\N	2023-05-29 04:12:50.794	werwer
34	2023-05-29 04:51:16.358	1	Diagonal 23 # 34-33	Arboletes	Antioquia	\N	\N	\N	2023-05-29 04:51:16.358	werwe
35	2023-05-29 04:58:19.801	1	Manzana 21 # 23-43	Arboletes	Antioquia	\N	\N	\N	2023-05-29 04:58:19.801	Jovany
36	2023-05-29 05:04:51.202	1	Transversal 22 # ee-ww	San Vicente del Caguán	Caquetá	\N	\N	\N	2023-05-29 05:04:51.202	asdf
37	2023-05-29 05:07:23.84	1	Diagonal 32 # 32-32	Puerto Rico	Caquetá	\N	\N	\N	2023-05-29 05:07:23.84	dsf
38	2023-05-29 12:46:59.182	1	Diagonal 23 # 32-32	Puerto Rico	Caquetá	\N	\N	\N	2023-05-29 12:46:59.182	loi
39	2023-05-29 12:50:50.009	1	Diagonal 22 # 23-45	La Sierra	Cauca	\N	\N	\N	2023-05-29 12:50:50.009	adasda
40	2023-05-29 12:54:20.735	1	Circunvalar 1 # 21-21	San Vicente del Caguán	Caquetá	\N	\N	\N	2023-05-29 12:54:20.735	adsf
\.


--
-- TOC entry 3533 (class 0 OID 16731)
-- Dependencies: 221
-- Data for Name: OrdenDePedidoProducto; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."OrdenDePedidoProducto" ("ordenDePedidoId", "productoId", cantidad, precio, ccosto, category, "rootCategory") FROM stdin;
30	3a51e4d6-ca8a-46e9-ac73-3f42a5fe8cad	2	1000	0310	991988d1-6e53-40ef-b09e-203beb71a626	d40e26db-01df-45f5-89b3-3836422052cf
30	ac6999ce-57af-46e9-a129-ea92331f8fbd	1	1700	0115	31950fa6-7fb0-489b-919f-42743fc40082	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
30	bc3bb3ba-9d3b-4761-b94a-9ebfc9d5e43c	1	9200	0115	31950fa6-7fb0-489b-919f-42743fc40082	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
32	60921eb2-3fcb-43f3-831c-063322554f66	1	1100	0115	68b77e5d-b252-47b4-8e52-453935137f04	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
32	3a51e4d6-ca8a-46e9-ac73-3f42a5fe8cad	1	1000	0310	991988d1-6e53-40ef-b09e-203beb71a626	d40e26db-01df-45f5-89b3-3836422052cf
32	79ed59ab-7598-4997-bb18-b8d1699fb836	1	11000	0115	31950fa6-7fb0-489b-919f-42743fc40082	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
32	ae0acb35-6589-4b2e-8d43-0708485a4419	9	28000	0115	a8f457bc-202e-4407-945a-fc90428dc7c9	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
33	3a51e4d6-ca8a-46e9-ac73-3f42a5fe8cad	1	1000	0308	991988d1-6e53-40ef-b09e-203beb71a626	d40e26db-01df-45f5-89b3-3836422052cf
33	76cedd39-2479-4402-acfa-a0a2e95a4fc3	1	4100	0308	8e500d7a-b094-4211-aabd-9b23dbb97368	d40e26db-01df-45f5-89b3-3836422052cf
33	9b38700d-f347-4ec3-96b4-89afdc9fb97b	1	3975	0308	9f104869-ed56-4586-abc6-897d1ce279a2	d40e26db-01df-45f5-89b3-3836422052cf
36	55c1a3cb-01f5-4a12-b637-423c0b87af93	2	31000	0113	e03a027c-9192-4b7d-afa4-baf035f8f792	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
36	5a792989-6fb1-481a-8b3d-43a4f456e0e9	1	19000	0113	a8f457bc-202e-4407-945a-fc90428dc7c9	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
38	9b38700d-f347-4ec3-96b4-89afdc9fb97b	1	3975	0308	9f104869-ed56-4586-abc6-897d1ce279a2	d40e26db-01df-45f5-89b3-3836422052cf
38	76cedd39-2479-4402-acfa-a0a2e95a4fc3	1	4100	0308	8e500d7a-b094-4211-aabd-9b23dbb97368	d40e26db-01df-45f5-89b3-3836422052cf
40	1e8e34ea-7752-40d2-aabe-2d30178a2e85	1	7100	0113	ab076f01-185c-4c85-9201-c1354ecf839c	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
40	5a792989-6fb1-481a-8b3d-43a4f456e0e9	1	19000	0113	a8f457bc-202e-4407-945a-fc90428dc7c9	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
40	9820a1b0-c947-490a-b7e8-cf7a92f06488	1	4000	0113	e2eee2e4-5fbe-4749-9c72-30b2f47108d5	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
31	9820a1b0-c947-490a-b7e8-cf7a92f06488	1	4000	0115	e2eee2e4-5fbe-4749-9c72-30b2f47108d5	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
34	3a51e4d6-ca8a-46e9-ac73-3f42a5fe8cad	1	1000	0308	991988d1-6e53-40ef-b09e-203beb71a626	d40e26db-01df-45f5-89b3-3836422052cf
34	097858ca-8b2b-4c5e-b32d-d8c267573232	1	22000	0113	ac6d39f5-e44a-47a6-9242-b776194d8270	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
29	76cedd39-2479-4402-acfa-a0a2e95a4fc3	1	4100	0310	8e500d7a-b094-4211-aabd-9b23dbb97368	d40e26db-01df-45f5-89b3-3836422052cf
29	097858ca-8b2b-4c5e-b32d-d8c267573232	1	22000	0115	ac6d39f5-e44a-47a6-9242-b776194d8270	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
29	ddec76b9-67b6-40a8-8011-839d7769104e	1	16000	0115	565de8a2-395e-4677-991d-01fd3eed607c	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
37	ae0acb35-6589-4b2e-8d43-0708485a4419	1	28000	0113	a8f457bc-202e-4407-945a-fc90428dc7c9	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
37	d34c8663-60db-4541-9d0d-1f6faba4d9ac	1	7000	0113	a8f457bc-202e-4407-945a-fc90428dc7c9	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
37	55c1a3cb-01f5-4a12-b637-423c0b87af93	1	31000	0113	e03a027c-9192-4b7d-afa4-baf035f8f792	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
39	3a51e4d6-ca8a-46e9-ac73-3f42a5fe8cad	1	1000	0308	991988d1-6e53-40ef-b09e-203beb71a626	d40e26db-01df-45f5-89b3-3836422052cf
39	9b38700d-f347-4ec3-96b4-89afdc9fb97b	1	3975	0308	9f104869-ed56-4586-abc6-897d1ce279a2	d40e26db-01df-45f5-89b3-3836422052cf
39	55c1a3cb-01f5-4a12-b637-423c0b87af93	1	31000	0113	e03a027c-9192-4b7d-afa4-baf035f8f792	08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f
\.


--
-- TOC entry 3537 (class 0 OID 16762)
-- Dependencies: 225
-- Data for Name: Price; Type: TABLE DATA; Schema: public; Owner: admin
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
\.


--
-- TOC entry 3535 (class 0 OID 16746)
-- Dependencies: 223
-- Data for Name: Product; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."Product" (id, name, description, brand, code, eancode, quantity, promo, active, "categoryId", "createdAt", "updatedAt") FROM stdin;
55c1a3cb-01f5-4a12-b637-423c0b87af93	Equipo3	333 ml	Bavaria	LIQ0013	775465851269	195	f	t	e03a027c-9192-4b7d-afa4-baf035f8f792	2023-05-21 17:44:02.36	2023-05-29 12:50:50.057
9b38700d-f347-4ec3-96b4-89afdc9fb97b	Equipo10	Para el dolor de cabeza	Dolex	Drog1254	7702114569888	7	f	t	9f104869-ed56-4586-abc6-897d1ce279a2	2023-05-21 17:53:28.595	2023-05-29 12:50:50.057
60921eb2-3fcb-43f3-831c-063322554f66	Equipo5	Gel	Gillete	BODY001	775465851265	109	f	t	68b77e5d-b252-47b4-8e52-453935137f04	2023-05-21 17:47:56.151	2023-05-29 10:53:11.087
5a792989-6fb1-481a-8b3d-43a4f456e0e9	Equipo4	Doce años	Chirrinchi	wd54654	772114898752	197	f	t	a8f457bc-202e-4407-945a-fc90428dc7c9	2023-05-21 16:23:20.894	2023-05-29 12:54:20.785
79ed59ab-7598-4997-bb18-b8d1699fb836	Equipo7	450 grs	Horneaditos	BREAD001	775465851254	14	f	t	31950fa6-7fb0-489b-919f-42743fc40082	2023-05-21 18:00:14.879	2023-05-29 10:53:11.087
9820a1b0-c947-490a-b7e8-cf7a92f06488	Equipo9	250 grs	Horneaditos	SBREAD001	775465851257	9	f	t	e2eee2e4-5fbe-4749-9c72-30b2f47108d5	2023-05-21 16:33:30.489	2023-05-29 12:54:20.785
94160dfe-9017-476e-b618-e07bc8641531	Equipo8	1.8 litros	JGB	lim23442	5454654544545	44	f	t	9de62a43-d249-45d0-8fef-27cc6714258c	2023-05-21 16:21:37.067	2023-05-29 10:53:11.087
1e8e34ea-7752-40d2-aabe-2d30178a2e85	Equipo2	500 grs	Red Cut	STEAK002	775465851253	92	f	t	ab076f01-185c-4c85-9201-c1354ecf839c	2023-05-21 16:18:01.498	2023-05-29 12:54:20.785
3a51e4d6-ca8a-46e9-ac73-3f42a5fe8cad	Equipo2	Azul Esmeralda	Home sweet	aj4564	77054698798	298	f	t	991988d1-6e53-40ef-b09e-203beb71a626	2023-05-21 16:24:30.906	2023-05-29 13:03:38.462
ac6999ce-57af-46e9-a129-ea92331f8fbd	Equipo11	450 grs	Horneaditos	BREAD002	775465851255	19	f	t	31950fa6-7fb0-489b-919f-42743fc40082	2023-05-21 17:58:15.513	2023-05-29 10:54:38.621
ae0acb35-6589-4b2e-8d43-0708485a4419	Equipo12	333 ml	Bahia	LIQ002	775465851262	436	f	t	a8f457bc-202e-4407-945a-fc90428dc7c9	2023-05-21 16:39:21.57	2023-05-29 10:54:38.621
bae41e85-c627-4b57-b1b9-a25b233ccdb8	Equipo13	Aerosol	Brilla King	CLEANP001	77515697565	120	f	t	9de62a43-d249-45d0-8fef-27cc6714258c	2023-05-21 17:46:58.136	2023-05-29 10:54:38.621
76cedd39-2479-4402-acfa-a0a2e95a4fc3	Equipo6	Cuatro puestos	Pullman	COM6751	7705456466455	799	f	t	8e500d7a-b094-4211-aabd-9b23dbb97368	2023-05-21 17:52:01.155	2023-05-29 13:03:38.462
bc3bb3ba-9d3b-4761-b94a-9ebfc9d5e43c	Equipo14	Tajado	Horneaditos	BREAD003	775465851256	19	f	t	31950fa6-7fb0-489b-919f-42743fc40082	2023-05-21 16:25:59.268	2023-05-29 10:54:38.621
bf87c9e2-5f50-43eb-8f53-430baeafc68a	Equiopo15	500 grs	Red Cut	STEAK003	775465851259	15	f	t	ac6d39f5-e44a-47a6-9242-b776194d8270	2023-05-21 16:19:06.757	2023-05-29 10:54:38.621
d34c8663-60db-4541-9d0d-1f6faba4d9ac	Equipo16	750 ml	Black Barrel	LIQ001	775645851261	198	f	t	a8f457bc-202e-4407-945a-fc90428dc7c9	2023-05-21 16:37:03.046	2023-05-29 10:54:38.621
ddec76b9-67b6-40a8-8011-839d7769104e	Equipo17	Tocador, 2 unidades 220 grs	Colombiana de Jabones	SOAP001	775465851263	156	f	t	565de8a2-395e-4677-991d-01fd3eed607c	2023-05-21 17:45:54.649	2023-05-29 10:54:38.621
e9f0cf99-216e-4a70-826f-64bd0c334f5c	Equipo18	500 grs	Red Cut	STEAK001	775465851258	123	f	t	ab076f01-185c-4c85-9201-c1354ecf839c	2023-05-21 16:16:27.411	2023-05-29 10:54:38.621
097858ca-8b2b-4c5e-b32d-d8c267573232	Equipo1	600 grs	GSF	STEAK0034	775465851260	147	f	t	ac6d39f5-e44a-47a6-9242-b776194d8270	2023-05-21 16:20:10.6	2023-05-29 10:47:52.905
\.


--
-- TOC entry 3530 (class 0 OID 16713)
-- Dependencies: 218
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."Roles" (id, name) FROM stdin;
1	cliente
2	usuario
3	admin
\.


--
-- TOC entry 3528 (class 0 OID 16704)
-- Dependencies: 216
-- Data for Name: Usuario; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."Usuario" (id, "roleId", name, phone, email, "docType", "numDoc", "Departament", city, address, "bussinessUnit", zone, descount) FROM stdin;
1	1	Jovany Velez Arango	3002005393	jovany.velez@gmail.com	cc	15263832	Antioquia	Bello	calle 52d # 57a-40	6	3	0.00
\.


--
-- TOC entry 3544 (class 0 OID 17320)
-- Dependencies: 232
-- Data for Name: Zones; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."Zones" (id, name, code) FROM stdin;
\.


--
-- TOC entry 3545 (class 0 OID 17328)
-- Dependencies: 233
-- Data for Name: _CategoriasZonas; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."_CategoriasZonas" ("A", "B") FROM stdin;
\.


--
-- TOC entry 3526 (class 0 OID 16694)
-- Dependencies: 214
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
0ce34ed8-5dd3-464c-b8ac-c64f3ab6fa68	d1fb6e9016e537e539c0b04aef95773de5a46db3802cbff96c9df7f92ed33356	2023-05-20 23:50:26.882655-05	20230520162805_creating_tables	\N	\N	2023-05-20 23:50:25.308654-05	1
\.


--
-- TOC entry 3540 (class 0 OID 16784)
-- Dependencies: 228
-- Data for Name: auth_key; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_key (id, hashed_password, user_id, primary_key, expires) FROM stdin;
username:jovany.velez@gmail.com	s2:6fDeFibRe2PHKsAt:459b92fde8c01946ddb61b285f3778d0f4790949897a80c0df841a7aa7f620b31403ba2d9b8621630014f637ef1b590d1ab63e3172294e9c0675934a7649f70d	wpDMrek4jqymxhK	t	\N
\.


--
-- TOC entry 3539 (class 0 OID 16777)
-- Dependencies: 227
-- Data for Name: auth_session; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_session (id, user_id, active_expires, idle_expires) FROM stdin;
VlmAKt6gLzYV7KbWRZUYp63mwoyMU7yHVqzWrJVz	wpDMrek4jqymxhK	1684781744973	1685991344973
kcy5vi1THXYJzwH1xBZCPvbanOriDZtQoMBvqMhL	wpDMrek4jqymxhK	1684853265013	1686062865013
2iTSNrmT9p755Fu4S8zZmQSSYLaZpyIXUNpUUrpz	wpDMrek4jqymxhK	1684853962633	1686063562633
Wvxjho7Abqaccs50mv4NLLUOnKJ3L0yOUVHYhYlb	wpDMrek4jqymxhK	1684854173725	1686063773725
ZHv7qRVDVlNuT7nsz02fDzR8N7iwZSuLxDaVL0eT	wpDMrek4jqymxhK	1684861019987	1686070619987
Btkc4V5sDFMVbBt7H3cxoPYKQCFCsN1loY2NN64c	wpDMrek4jqymxhK	1684875214780	1686084814780
pf7b4wMDtx2wPnBy5xX1Auo7caAhGf0Bj8mS4yTB	wpDMrek4jqymxhK	1684884024846	1686093624846
9nNDTimzSEhufJbUDv3rOOUmRTLZsHrmwasnrs7u	wpDMrek4jqymxhK	1684892739646	1686102339646
CvLdm8xVb2nRNN4coJsh7B7vdwGLkjJgF68bVgBu	wpDMrek4jqymxhK	1684895157787	1686104757787
z6wkhYrHqphZsd7hiT50bloK8eqzt4yng8cPWGW4	wpDMrek4jqymxhK	1684979846291	1686189446291
m10Bdd3oJraHOPYsDtyWczda1vbS8DLLbuuvUKA1	wpDMrek4jqymxhK	1684984250920	1686193850920
MVq1tkVEFWbJCQU3eopJzKOaun7d1TgMguGTNdIA	wpDMrek4jqymxhK	1685033590737	1686243190737
LTbX1HEvYVHXFMwLX0T9xvVhpoMa9erzek2xtySg	wpDMrek4jqymxhK	1685158638668	1686368238668
ooYs3GfwOSTnKObOq2K2td1vaMn9ySZzXLJBnOAQ	wpDMrek4jqymxhK	1685158691044	1686368291044
WXRMPGrSnM6TH4QmHAdX7GLFsfafy9weaicf8aOH	wpDMrek4jqymxhK	1685206922284	1686416522284
QxYxQ5qKK0GGN5skTLQpBfRPRvLHgBeDNpOaKxhg	wpDMrek4jqymxhK	1685215371106	1686424971106
Qx8Y07pYbsMM4rGzf7x01nKJExo5QSjM7HjOB6WK	wpDMrek4jqymxhK	1685457281073	1686666881073
\.


--
-- TOC entry 3538 (class 0 OID 16770)
-- Dependencies: 226
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_user (id, email) FROM stdin;
wpDMrek4jqymxhK	jovany.velez@gmail.com
\.


--
-- TOC entry 3558 (class 0 OID 0)
-- Dependencies: 229
-- Name: CcostoZoneCategories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."CcostoZoneCategories_id_seq"', 24, true);


--
-- TOC entry 3559 (class 0 OID 0)
-- Dependencies: 219
-- Name: OrdenDePedido_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."OrdenDePedido_id_seq"', 40, true);


--
-- TOC entry 3560 (class 0 OID 0)
-- Dependencies: 217
-- Name: Roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."Roles_id_seq"', 3, true);


--
-- TOC entry 3561 (class 0 OID 0)
-- Dependencies: 215
-- Name: Usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."Usuario_id_seq"', 1, true);


--
-- TOC entry 3562 (class 0 OID 0)
-- Dependencies: 231
-- Name: Zones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."Zones_id_seq"', 1, false);


--
-- TOC entry 3343 (class 2606 OID 16745)
-- Name: Category Category_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Category"
    ADD CONSTRAINT "Category_pkey" PRIMARY KEY (id);


--
-- TOC entry 3366 (class 2606 OID 17317)
-- Name: CcostoZoneCategories CcostoZoneCategories_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."CcostoZoneCategories"
    ADD CONSTRAINT "CcostoZoneCategories_pkey" PRIMARY KEY (id);


--
-- TOC entry 3349 (class 2606 OID 16761)
-- Name: Image Image_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Image"
    ADD CONSTRAINT "Image_pkey" PRIMARY KEY (id);


--
-- TOC entry 3341 (class 2606 OID 16737)
-- Name: OrdenDePedidoProducto OrdenDePedidoProducto_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."OrdenDePedidoProducto"
    ADD CONSTRAINT "OrdenDePedidoProducto_pkey" PRIMARY KEY ("ordenDePedidoId", "productoId");


--
-- TOC entry 3339 (class 2606 OID 16730)
-- Name: OrdenDePedido OrdenDePedido_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."OrdenDePedido"
    ADD CONSTRAINT "OrdenDePedido_pkey" PRIMARY KEY (id);


--
-- TOC entry 3351 (class 2606 OID 16769)
-- Name: Price Price_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Price"
    ADD CONSTRAINT "Price_pkey" PRIMARY KEY (id);


--
-- TOC entry 3347 (class 2606 OID 16753)
-- Name: Product Product_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_pkey" PRIMARY KEY (id);


--
-- TOC entry 3337 (class 2606 OID 16720)
-- Name: Roles Roles_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_pkey" PRIMARY KEY (id);


--
-- TOC entry 3334 (class 2606 OID 16711)
-- Name: Usuario Usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_pkey" PRIMARY KEY (id);


--
-- TOC entry 3368 (class 2606 OID 17327)
-- Name: Zones Zones_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Zones"
    ADD CONSTRAINT "Zones_pkey" PRIMARY KEY (id);


--
-- TOC entry 3330 (class 2606 OID 16702)
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3362 (class 2606 OID 16790)
-- Name: auth_key auth_key_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_key
    ADD CONSTRAINT auth_key_pkey PRIMARY KEY (id);


--
-- TOC entry 3358 (class 2606 OID 16783)
-- Name: auth_session auth_session_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_session
    ADD CONSTRAINT auth_session_pkey PRIMARY KEY (id);


--
-- TOC entry 3355 (class 2606 OID 16776)
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3364 (class 1259 OID 17318)
-- Name: CcostoZoneCategories_ccosto_key; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX "CcostoZoneCategories_ccosto_key" ON public."CcostoZoneCategories" USING btree (ccosto);


--
-- TOC entry 3344 (class 1259 OID 16795)
-- Name: Product_code_key; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX "Product_code_key" ON public."Product" USING btree (code);


--
-- TOC entry 3345 (class 1259 OID 16796)
-- Name: Product_eancode_key; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX "Product_eancode_key" ON public."Product" USING btree (eancode);


--
-- TOC entry 3335 (class 1259 OID 16793)
-- Name: Roles_name_key; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX "Roles_name_key" ON public."Roles" USING btree (name);


--
-- TOC entry 3331 (class 1259 OID 16791)
-- Name: Usuario_email_key; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX "Usuario_email_key" ON public."Usuario" USING btree (email);


--
-- TOC entry 3332 (class 1259 OID 16792)
-- Name: Usuario_numDoc_key; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX "Usuario_numDoc_key" ON public."Usuario" USING btree ("numDoc");


--
-- TOC entry 3369 (class 1259 OID 17333)
-- Name: _CategoriasZonas_AB_unique; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX "_CategoriasZonas_AB_unique" ON public."_CategoriasZonas" USING btree ("A", "B");


--
-- TOC entry 3370 (class 1259 OID 17334)
-- Name: _CategoriasZonas_B_index; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "_CategoriasZonas_B_index" ON public."_CategoriasZonas" USING btree ("B");


--
-- TOC entry 3360 (class 1259 OID 16801)
-- Name: auth_key_id_key; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX auth_key_id_key ON public.auth_key USING btree (id);


--
-- TOC entry 3363 (class 1259 OID 16802)
-- Name: auth_key_user_id_idx; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_key_user_id_idx ON public.auth_key USING btree (user_id);


--
-- TOC entry 3356 (class 1259 OID 16799)
-- Name: auth_session_id_key; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX auth_session_id_key ON public.auth_session USING btree (id);


--
-- TOC entry 3359 (class 1259 OID 16800)
-- Name: auth_session_user_id_idx; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_session_user_id_idx ON public.auth_session USING btree (user_id);


--
-- TOC entry 3352 (class 1259 OID 16798)
-- Name: auth_user_email_key; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX auth_user_email_key ON public.auth_user USING btree (email);


--
-- TOC entry 3353 (class 1259 OID 16797)
-- Name: auth_user_id_key; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX auth_user_id_key ON public.auth_user USING btree (id);


--
-- TOC entry 3375 (class 2606 OID 16823)
-- Name: Category Category_padreId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Category"
    ADD CONSTRAINT "Category_padreId_fkey" FOREIGN KEY ("padreId") REFERENCES public."Category"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3381 (class 2606 OID 17335)
-- Name: CcostoZoneCategories CcostoZoneCategories_categoryId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."CcostoZoneCategories"
    ADD CONSTRAINT "CcostoZoneCategories_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES public."Category"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3377 (class 2606 OID 16833)
-- Name: Image Image_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Image"
    ADD CONSTRAINT "Image_productId_fkey" FOREIGN KEY ("productId") REFERENCES public."Product"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3373 (class 2606 OID 16818)
-- Name: OrdenDePedidoProducto OrdenDePedidoProducto_ordenDePedidoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."OrdenDePedidoProducto"
    ADD CONSTRAINT "OrdenDePedidoProducto_ordenDePedidoId_fkey" FOREIGN KEY ("ordenDePedidoId") REFERENCES public."OrdenDePedido"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3374 (class 2606 OID 16813)
-- Name: OrdenDePedidoProducto OrdenDePedidoProducto_productoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."OrdenDePedidoProducto"
    ADD CONSTRAINT "OrdenDePedidoProducto_productoId_fkey" FOREIGN KEY ("productoId") REFERENCES public."Product"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3372 (class 2606 OID 16808)
-- Name: OrdenDePedido OrdenDePedido_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."OrdenDePedido"
    ADD CONSTRAINT "OrdenDePedido_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."Usuario"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3378 (class 2606 OID 16838)
-- Name: Price Price_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Price"
    ADD CONSTRAINT "Price_productId_fkey" FOREIGN KEY ("productId") REFERENCES public."Product"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3376 (class 2606 OID 16828)
-- Name: Product Product_categoryId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES public."Category"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3371 (class 2606 OID 16803)
-- Name: Usuario Usuario_roleId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES public."Roles"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3382 (class 2606 OID 17340)
-- Name: _CategoriasZonas _CategoriasZonas_A_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."_CategoriasZonas"
    ADD CONSTRAINT "_CategoriasZonas_A_fkey" FOREIGN KEY ("A") REFERENCES public."Category"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3383 (class 2606 OID 17345)
-- Name: _CategoriasZonas _CategoriasZonas_B_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."_CategoriasZonas"
    ADD CONSTRAINT "_CategoriasZonas_B_fkey" FOREIGN KEY ("B") REFERENCES public."Zones"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3380 (class 2606 OID 16848)
-- Name: auth_key auth_key_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_key
    ADD CONSTRAINT auth_key_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_user(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3379 (class 2606 OID 16843)
-- Name: auth_session auth_session_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_session
    ADD CONSTRAINT auth_session_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_user(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3552 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: admin
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


-- Completed on 2023-05-29 09:36:56 -05

--
-- PostgreSQL database dump complete
--

