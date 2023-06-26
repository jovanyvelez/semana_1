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
    eancode text,
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
    zoneid integer NOT NULL,
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
cc26b23a-7e4b-447a-9608-e0f0bcb53db3	jairo.rivera@equisol.com.co	$2b$10$iO2FNS.zgAn2wrC5R7tlmO13XdeouqKERAyhYeXZYJ3aEokeoFCKW	923d5479-3ca4-483e-bf4a-bb66e2c1a3d5
b9f52fdf-6cc2-4ff9-a3a8-815405d82bae	ejara461@gmail.com	$2b$10$E7Qy22SaL69c6LSiqzEbYu5cz1xUM6ZraDeVBCUqqz1WQ77Cob.w2	63db79ea-7524-4d15-88d9-467a2aeac998
458de0e6-d0da-4ea0-b6a6-e6d572d924c9	jovany.velez@gmail.com	$2b$10$1wI/zWcCEj3xXVGckd2bfObIDE3e04XkeVc3Czi5/gpiGE5L8pN4a	594fd3a1-e4eb-40ff-b7fa-7f45423554bd
8a1e6285-2a83-495a-97dc-8dc41b2d4d7b	jvelez23@misena.edu.co	$2b$10$bPM4bgDU5uC/wJEQgbrfReHHuZbjUvLqm1luxPBqEnYSkGrb0fmIi	a7bff9bd-34da-4fc4-94a1-d807d5011543
\.


--
-- Data for Name: Category; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public."Category" (id, name, "padreId", "createdAt", "updatedAt") FROM stdin;
178c0668-5076-4d34-942d-83893934346c	Parker	\N	2023-06-23 13:47:22.726	2023-06-23 13:47:22.726
\.


--
-- Data for Name: CcostoZoneCategories; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public."CcostoZoneCategories" (id, zone, "categoryId", ccosto) FROM stdin;
17	1	178c0668-5076-4d34-942d-83893934346c	123123
\.


--
-- Data for Name: Image; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public."Image" (id, "publicId", "secureUrl", "productId", "createdAt", "updatedAt", name) FROM stdin;
52b5d61e-7cc4-49c6-958a-9087e20b9d1c	tienda/i1np4yldyieebsccxcsu.png	https://res.cloudinary.com/dqlbbx7ud/image/upload/v1687819443/tienda/i1np4yldyieebsccxcsu.png	5dabcb03-ca6c-4834-b4cb-4ae9deed2f84	2023-06-26 22:44:03.948	2023-06-26 22:44:03.948	main
\.


--
-- Data for Name: OrdenDePedido; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public."OrdenDePedido" (id, fecha, "userId", "direccionEntrega", "ciudadEnt", "departamentoEnt", "metodoPago", estado, "fechaDespacho", "updatedAt", notes, valor) FROM stdin;
10	2023-06-26 14:26:46.624	3	Calle 52D # 57A-40	Bello	Antioquia	\N	\N	\N	2023-06-26 14:26:46.624	Mirador de altavista, Apartamento 402	2552000
\.


--
-- Data for Name: OrdenDePedidoProducto; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public."OrdenDePedidoProducto" ("ordenDePedidoId", "productoId", cantidad, precio, ccosto, category, "rootCategory") FROM stdin;
\.


--
-- Data for Name: Price; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public."Price" (id, price1, price2, price3, price4, price5, price6, "productId", "createdAt", "updatedAt") FROM stdin;
915f3093-170d-4afe-ba2f-ada91b28817c	234234234	0	0	\N	\N	\N	5dabcb03-ca6c-4834-b4cb-4ae9deed2f84	2023-06-26 22:44:03.959	2023-06-26 22:44:03.959
\.


--
-- Data for Name: Product; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public."Product" (id, name, description, brand, code, eancode, quantity, promo, active, "categoryId", "createdAt", "updatedAt") FROM stdin;
5dabcb03-ca6c-4834-b4cb-4ae9deed2f84	Comedor Moderno	Media libra	Bulldog Frances	dsdfs	\N	23	f	t	178c0668-5076-4d34-942d-83893934346c	2023-06-26 22:44:03.915	2023-06-26 22:44:03.915
\.


--
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public."Roles" (id, name) FROM stdin;
1	cliente
2	admin
\.


--
-- Data for Name: Usuario; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public."Usuario" (id, "roleId", name, phone, email, "docType", "numDoc", "Departament", city, address, "bussinessUnit", zoneid, asesor, discount) FROM stdin;
3	1	Jovany Vélez Arango	3002005393	jvelez23@misena.edu.co	cc	15263832-1	Antioquia	Bello	Calle 52D # 57A-40 apto 402	6	1	jovany.velez@gmail.com	12
1	2	Jovany Vélez Arango	3002005393	jovany.velez@gmail.com	cc	15263832	Antioquia	Bello	Calle 52D # 57A-40 apto 402	6	1	jvelez23@misena.edu.co	0
4	1	Jairo Alonso Rivera Arango	3006865293	ejara461@gmail.com	cc	303030303	Antioquia	Bello	Cabañas, bello antioqui	6	1	jairo.rivera@equisol.com.co	18.5
5	2	Jairo Alonso Rivera Arango	3006865293	jairo.rivera@equisol.com.co	cc	3030303030	Antioquia	Bello	Cabañas, bello antioqui	6	1	jairo.rivera@equisol.com.co	0
\.


--
-- Data for Name: Zones; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public."Zones" (id, name, zone) FROM stdin;
1	Antioquia	1
4	Cundiboyacense	2
2	Costa	3
5	Valle	4
6	Eje cafetero	5
3	Santanderes	6
\.


--
-- Name: CcostoZoneCategories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecommerce
--

SELECT pg_catalog.setval('public."CcostoZoneCategories_id_seq"', 17, true);


--
-- Name: OrdenDePedido_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecommerce
--

SELECT pg_catalog.setval('public."OrdenDePedido_id_seq"', 10, true);


--
-- Name: Roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecommerce
--

SELECT pg_catalog.setval('public."Roles_id_seq"', 2, true);


--
-- Name: Usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecommerce
--

SELECT pg_catalog.setval('public."Usuario_id_seq"', 5, true);


--
-- Name: Zones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecommerce
--

SELECT pg_catalog.setval('public."Zones_id_seq"', 6, true);


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
-- Name: Zones_zone_key; Type: INDEX; Schema: public; Owner: ecommerce
--

CREATE UNIQUE INDEX "Zones_zone_key" ON public."Zones" USING btree (zone);


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
-- Name: CcostoZoneCategories CcostoZoneCategories_zone_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."CcostoZoneCategories"
    ADD CONSTRAINT "CcostoZoneCategories_zone_fkey" FOREIGN KEY (zone) REFERENCES public."Zones"(zone) ON UPDATE CASCADE ON DELETE RESTRICT;


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
-- Name: Usuario Usuario_zoneid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_zoneid_fkey" FOREIGN KEY (zoneid) REFERENCES public."Zones"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: ecommerce
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


--
-- PostgreSQL database dump complete
--

