PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Category" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "padreId" TEXT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    CONSTRAINT "Category_padreId_fkey" FOREIGN KEY ("padreId") REFERENCES "Category" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO Category VALUES('08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f','Mercado',NULL,1680269995478,1680270070111);
INSERT INTO Category VALUES('3f21969e-3595-43d6-9c98-4e11cfcd201a','Panaderia','08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f',1680270036052,1680270076958);
INSERT INTO Category VALUES('331cd9c2-de4d-4451-a280-ae9daa5f4a4c','Panes','3f21969e-3595-43d6-9c98-4e11cfcd201a',1680270109652,1680270238930);
INSERT INTO Category VALUES('b4da0e1f-8f5e-4cec-bed0-afa0b3162b77','Horneados','3f21969e-3595-43d6-9c98-4e11cfcd201a',1680270191410,1680270247354);
INSERT INTO Category VALUES('3eed1e2d-8b81-4834-a7b3-acde8031f24d','Carnes','08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f',1680270289619,1680270266782);
INSERT INTO Category VALUES('152e41f8-886c-477a-8394-b6596f40ecaa','Res','3eed1e2d-8b81-4834-a7b3-acde8031f24d',1680270381597,1680270398080);
INSERT INTO Category VALUES('24f7375e-b3ee-4a88-8233-ea8871be2e13','Cerdo','3eed1e2d-8b81-4834-a7b3-acde8031f24d',1680270462013,1680270471381);
INSERT INTO Category VALUES('92f77b8e-66f4-4dfa-ba69-49de405d00d6','Pescados','3eed1e2d-8b81-4834-a7b3-acde8031f24d',1680270509186,1680270485945);
INSERT INTO Category VALUES('246dceb2-7f43-4be5-aee4-53419b66437e','Rancho y Licores','08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f',1680270635050,1680270609156);
INSERT INTO Category VALUES('d1b73db3-6277-4816-b979-a5f85d21c05a','Nacionales','246dceb2-7f43-4be5-aee4-53419b66437e',1680270670288,1680270651524);
INSERT INTO Category VALUES('400943b6-86f5-443b-893e-5ed1a963ad81','Importados','246dceb2-7f43-4be5-aee4-53419b66437e',1680270713036,1680270700397);
INSERT INTO Category VALUES('698579c4-b28c-46b6-9deb-48d9db33c8c9','Limpieza y Desinfeccion','08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f',1680270760987,1680270737381);
INSERT INTO Category VALUES('69456c5a-8af7-4588-9a63-ecc5612d0cc9','Jabones','698579c4-b28c-46b6-9deb-48d9db33c8c9',1680270826436,1680270812382);
INSERT INTO Category VALUES('87087ed1-2310-4cbe-b9c2-69d2a527667b','Desinfectantes','698579c4-b28c-46b6-9deb-48d9db33c8c9',1680270851009,1680270840975);
INSERT INTO Category VALUES('0b89718e-dfb3-4f61-99c7-a9bce876d59e','Aseo Personal','08daa8fa-f3e7-4cb4-a9ef-fb7b3cbae34f',1680270908050,1680270892735);
INSERT INTO Category VALUES('71f3169e-e0c5-4177-a1b6-8773fc85d43a','Desodorantes','0b89718e-dfb3-4f61-99c7-a9bce876d59e',1680270956509,1680270944551);
INSERT INTO Category VALUES('e08c9211-61d0-4ce5-8512-f1dd788f9edc','Hogar',NULL,1680271147550,1680271159254);
INSERT INTO Category VALUES('9cfdf12c-d319-4f90-902c-36547318e601','Lenceria','e08c9211-61d0-4ce5-8512-f1dd788f9edc',1680271185777,1680271169130);
INSERT INTO Category VALUES('fe515014-6c8b-4979-ac90-9bf9f3f6e48c','Muebles','e08c9211-61d0-4ce5-8512-f1dd788f9edc',1680271231254,1680271240909);
INSERT INTO Category VALUES('7be49220-6353-44ac-b8c1-882a04c799ce','Sala','fe515014-6c8b-4979-ac90-9bf9f3f6e48c',1680271273636,1680271262108);
INSERT INTO Category VALUES('9b666ca3-1868-4b95-a0d4-3355e41b5c2d','Comedor','fe515014-6c8b-4979-ac90-9bf9f3f6e48c',1680271369212,1680271359313);
INSERT INTO Category VALUES('abeee414-3981-48fb-9e76-32c60e248647','Varios','e08c9211-61d0-4ce5-8512-f1dd788f9edc',1680271397218,1680271443591);
CREATE TABLE IF NOT EXISTS "Price" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "price1" REAL NOT NULL,
    "price2" REAL,
    "price3" REAL,
    "price4" REAL,
    "price5" REAL,
    "price6" REAL,
    "productId" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    CONSTRAINT "Price_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Product" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO Price VALUES('85bab657-c617-4d6b-aa97-960e77ed526c',11280.0,11399.0,11000.0,NULL,NULL,NULL,'230ff1ad-fe33-4e8e-9e2f-bea0ded124f5',1680279934979,1680279874205);
INSERT INTO Price VALUES('542d057b-e53a-4a0e-ab71-f813a23a0cf8',10280.0,10399.0,10000.0,NULL,NULL,NULL,'013c2a95-e20b-4978-8944-2e59a61e6675',1680280335893,1680280276656);
INSERT INTO Price VALUES('273d12f9-e93d-496d-8099-5b07ef7273a3',10992.0,10399.0,10000.0,NULL,NULL,NULL,'44f56eb6-343f-4250-aa66-4bf9deb00b03',1680280425507,1680280403569);
INSERT INTO Price VALUES('fe6b6da3-f9de-43ed-bf0c-51ca83324e82',11490.0,11399.0,11000.0,NULL,NULL,NULL,'64473b1e-f968-4e4e-a277-7130b44c63a3',1680280506095,1680280486202);
INSERT INTO Price VALUES('76933620-8b43-4547-9d44-1c50e78672d5',400.0,600.0,500.0,NULL,NULL,NULL,'31e299bb-19d7-4d4c-a45e-e5ddc46f055d',1680282290708,1680281542198);
INSERT INTO Price VALUES('923e76b2-1b33-4210-a6f3-d0d50af70930',45000.0,56000.0,60000.0,NULL,NULL,NULL,'3c893b74-bfdc-4a6a-b35b-e62dd7a8e012',1680282933352,1680282906149);
INSERT INTO Price VALUES('90c01708-f6f5-4436-8ea4-1d954f88ce04',455236.0,420000.0,410000.0,NULL,NULL,NULL,'b79c582e-8f42-436b-8459-a1952e1a8db9',1680283856918,1680283777671);
INSERT INTO Price VALUES('f509e06a-e722-4ed2-bef6-4590f5d06ba2',4800.0,5400.0,5000.0,NULL,NULL,NULL,'c74e8b3a-ef62-4b64-9b19-2dd20fd19ae0',1680286277192,1680286240573);
INSERT INTO Price VALUES('7f34aa4f-9f2c-4351-94fd-8c3c1e63182e',5800.0,6400.0,6000.0,NULL,NULL,NULL,'d8456364-bfd6-46ae-826e-3760d87a093a',1680286698471,1680286665293);
INSERT INTO Price VALUES('c140cfe7-5b88-418e-b82a-29bb7a74b92f',3280.0,3390.0,3000.0,NULL,NULL,NULL,'1c1f3d45-5fd3-41ff-a1b2-333ebd0968f3',1680287250946,1680287226367);
INSERT INTO Price VALUES('d93cef21-1df4-4821-9f35-1859c9f3458f',1280.0,1399.0,1000.0,NULL,NULL,NULL,'139906b2-e3e3-414e-9f25-2d70b91a5b83',1680287588188,1680287564225);
INSERT INTO Price VALUES('35442481-14ae-4cfb-a6c8-317b9bbf3212',30990.0,30399.0,30000.0,NULL,NULL,NULL,'a37e4cd1-ab00-42ff-8958-c28f4b374967',1680287892395,1680287859091);
INSERT INTO Price VALUES('cdbbf230-7448-4b97-a7d9-ba5d895a3d1b',1690.0,1700.0,1600.0,NULL,NULL,NULL,'c5547d20-6a0d-48cf-9f91-19c07ef10d8a',1680288198456,1680288165009);
INSERT INTO Price VALUES('88e56b3c-a290-4363-a503-0467a85642ce',1990.0,2000.0,1900.0,NULL,NULL,NULL,'57ea928f-dade-4dfd-abe5-977a9deb4dba',1680288548830,1680288518299);
INSERT INTO Price VALUES('c1aab55f-9a45-41f7-986a-7f558d6d5412',5890.0,5800.0,5500.0,NULL,NULL,NULL,'39a143f3-41ed-4d6e-b06e-62bf227e85ec',1680288999546,1680288967291);
INSERT INTO Price VALUES('e42583f7-182b-42da-a318-c0221cd584f4',5950.0,5500.0,6000.0,NULL,NULL,NULL,'b77b5401-3899-4586-ad6d-7b8b8ca77e8c',1680289329580,1680289303538);
INSERT INTO Price VALUES('c5417666-01c6-4a1f-951a-873c5d186d1d',6150.0,6500.0,6700.0,NULL,NULL,NULL,'7b7b8e2d-f101-4625-8229-2b7e81211099',1680289926233,1680289882756);
INSERT INTO Price VALUES('be786a7a-6f30-410a-8320-8b4cddb6b2bd',972400.0,1600000.0,1450000.0,NULL,NULL,NULL,'3ea04078-f890-4b49-b13c-37a3a9087f05',1680290654595,1680290598786);
INSERT INTO Price VALUES('2f60d4e4-381b-4e92-ac2e-92edd65271e9',15721.0,15550.0,15000.0,NULL,NULL,NULL,'4416efec-6f58-4c07-8c9b-f2df0b0c9e51',1683211040867,1683211040867);
CREATE TABLE IF NOT EXISTS "Product" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "brand" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "eancode" TEXT NOT NULL,
    "quantity" REAL NOT NULL,
    "promo" BOOLEAN NOT NULL,
    "active" BOOLEAN NOT NULL,
    "categoryId" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    CONSTRAINT "Product_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "Category" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO Product VALUES('230ff1ad-fe33-4e8e-9e2f-bea0ded124f5','Carne Res','500 grs','Red Cut','STEAK001','775465851258',123.0,0,1,'152e41f8-886c-477a-8394-b6596f40ecaa',1680273984005,1680275352447);
INSERT INTO Product VALUES('013c2a95-e20b-4978-8944-2e59a61e6675','Carne Molida Res','500 grs','Red Cut','STEAK002','775465851253',93.0,0,1,'152e41f8-886c-477a-8394-b6596f40ecaa',1680275352447,1680275363777);
INSERT INTO Product VALUES('44f56eb6-343f-4250-aa66-4bf9deb00b03','Lomo de Cerdo','500 grs','Red Cut','STEAK003','775465851259',15.0,0,1,'24f7375e-b3ee-4a88-8233-ea8871be2e13',1680275998361,1680275831595);
INSERT INTO Product VALUES('64473b1e-f968-4e4e-a277-7130b44c63a3','Chuleta de cerdo','600 grs','GSF','STEAK0034','775465851260',151.0,0,1,'24f7375e-b3ee-4a88-8233-ea8871be2e13',1680276662678,1680276543241);
INSERT INTO Product VALUES('31e299bb-19d7-4d4c-a45e-e5ddc46f055d','Limpido jgb','1.8 litros','JGB','lim23442','5454654544545',45.0,0,1,'87087ed1-2310-4cbe-b9c2-69d2a527667b',1680282020693,1680281859256);
INSERT INTO Product VALUES('3c893b74-bfdc-4a6a-b35b-e62dd7a8e012','Whiskey Balantine','Doce años','Chirrinchi','wd54654','77887',200.0,0,1,'400943b6-86f5-443b-893e-5ed1a963ad81',1680282900041,1680282663432);
INSERT INTO Product VALUES('b79c582e-8f42-436b-8459-a1952e1a8db9','Acolchado puntos','Azul Esmeralda','Home sweet','aj4564','77054698798',12.0,0,1,'9cfdf12c-d319-4f90-902c-36547318e601',1680283763578,1680283527638);
INSERT INTO Product VALUES('c74e8b3a-ef62-4b64-9b19-2dd20fd19ae0','Pan Caiman','Tajado','Horneaditos','BREAD001','775465851254',14.0,0,1,'331cd9c2-de4d-4451-a280-ae9daa5f4a4c',1680286210624,1680286116919);
INSERT INTO Product VALUES('d8456364-bfd6-46ae-826e-3760d87a093a','Pan Artesano','Tajado 500 grs','Horneaditos','BREAD002','775465851255',24.0,0,1,'331cd9c2-de4d-4451-a280-ae9daa5f4a4c',1680286607549,1680286492777);
INSERT INTO Product VALUES('1c1f3d45-5fd3-41ff-a1b2-333ebd0968f3','Pan Tajado Integral','450 grs','Horneaditos','BREAD003','775465851256',20.0,0,1,'331cd9c2-de4d-4451-a280-ae9daa5f4a4c',1680287194443,1680286936914);
INSERT INTO Product VALUES('139906b2-e3e3-414e-9f25-2d70b91a5b83','Choco Tajada','250 grs','Horneaditos','SBREAD001','775465851257',11.0,0,1,'b4da0e1f-8f5e-4cec-bed0-afa0b3162b77',1680287520680,1680287390022);
INSERT INTO Product VALUES('a37e4cd1-ab00-42ff-8958-c28f4b374967','Ron Añejo Cartavio','750 ml','Black Barrel','LIQ001','775645851261',200.0,0,1,'400943b6-86f5-443b-893e-5ed1a963ad81',1680287827479,1680287742224);
INSERT INTO Product VALUES('c5547d20-6a0d-48cf-9f91-19c07ef10d8a','Cerveza Bahia','333 ml','Bahia','LIQ002','775465851262',452.0,0,1,'400943b6-86f5-443b-893e-5ed1a963ad81',1680288103653,1680288029141);
INSERT INTO Product VALUES('57ea928f-dade-4dfd-abe5-977a9deb4dba','Cerveza Club Colombia Dorada','333 ml','Bavaria','LIQ0013','775465851269',200.0,0,1,'d1b73db3-6277-4816-b979-a5f85d21c05a',1680288491986,1680288383794);
INSERT INTO Product VALUES('39a143f3-41ed-4d6e-b06e-62bf227e85ec','Jabon Protex Avena x 2','Tocador, 2 unidades 220 grs','Colombiana de Jabones','SOAP001','775465851263',157.0,0,1,'69456c5a-8af7-4588-9a63-ecc5612d0cc9',1680288889415,1680288768734);
INSERT INTO Product VALUES('b77b5401-3899-4586-ad6d-7b8b8ca77e8c','Desinfectante Aire','Aerosol','Brilla King','CLEANP001','77515697565',120.0,0,1,'87087ed1-2310-4cbe-b9c2-69d2a527667b',1680289284700,1680289187645);
INSERT INTO Product VALUES('7b7b8e2d-f101-4625-8229-2b7e81211099','Desodorante Gel Gillete','Gel','Gillete','BODY001','775465851265',120.0,0,1,'71f3169e-e0c5-4177-a1b6-8773fc85d43a',1680289778992,1680289629891);
INSERT INTO Product VALUES('3ea04078-f890-4b49-b13c-37a3a9087f05','Comedor Moderno','Cuatro puestos','Pullman','COM6751','7705456466455',4.0,0,1,'9b666ca3-1868-4b95-a0d4-3355e41b5c2d',1680290492255,1680290393059);
INSERT INTO Product VALUES('4416efec-6f58-4c07-8c9b-f2df0b0c9e51','Acetaminofen','Para el dolor de cabeza','Dolex','Drog1254','7702114569888',14.0,0,1,'d1b73db3-6277-4816-b979-a5f85d21c05a',1683211040250,1683211040250);
CREATE TABLE IF NOT EXISTS "auth_session" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "user_id" TEXT NOT NULL,
    "active_expires" BIGINT NOT NULL,
    "idle_expires" BIGINT NOT NULL,
    CONSTRAINT "auth_session_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth_user" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO auth_session VALUES('UGztwPJjozfZqA2ARtF3TyNdxhbtqEdcLnNsSE7C','OzTgmumhrsxECOR',1683690756120,1684900356120);
INSERT INTO auth_session VALUES('kB8P3vi9JhaYqIOzT80C8PLgfi0CWRCWoNjdhli7','OzTgmumhrsxECOR',1683690795244,1684900395244);
INSERT INTO auth_session VALUES('xpP8sRrthNIHSxBxlb8iM9bssZLiCv2gsDcg8FK8','OzTgmumhrsxECOR',1683690995228,1684900595228);
INSERT INTO auth_session VALUES('QSysz7DwDRYOkFssLk1Nj8nxKTj0rgxKTDgxLfkg','OzTgmumhrsxECOR',1683690999273,1684900599273);
INSERT INTO auth_session VALUES('rDS8W3YZV3nItRmoJh7Pk7guLw17WSiewfPJ07sB','OzTgmumhrsxECOR',1683723616315,1684933216315);
INSERT INTO auth_session VALUES('FnfTJ318lEkTzdcb6mJ0rldnFFDtFuc9AbIHSVFV','OzTgmumhrsxECOR',1683734242188,1684943842188);
INSERT INTO auth_session VALUES('iQVRpDMOZwajc1D9eCioTR3WNOJnXjgjXhGFGfsN','OzTgmumhrsxECOR',1683735218912,1684944818912);
INSERT INTO auth_session VALUES('EDWWSUGC9mnSwcnsGrIyONMJvqHzFk0nt2MsnfUP','OzTgmumhrsxECOR',1683735456342,1684945056342);
INSERT INTO auth_session VALUES('qWBzsrFiJU5jDAImD2NeCd9GvFZCGNArHmZnJgPO','OzTgmumhrsxECOR',1683735558755,1684945158755);
INSERT INTO auth_session VALUES('GLLij176IpTLnwSLp2gYks3cHdhmLue69twX1eRT','OzTgmumhrsxECOR',1683735692710,1684945292710);
INSERT INTO auth_session VALUES('DAP6E2L66xoiEb7hvY7rV3prHIzxMeFAzsApip2b','OzTgmumhrsxECOR',1683735773701,1684945373701);
INSERT INTO auth_session VALUES('GRNobtjBLFcVZHY9k4agCkGmE272n5oBL7dGqu01','OzTgmumhrsxECOR',1683735813904,1684945413904);
INSERT INTO auth_session VALUES('Z56y98GBVP3O2P0aj76PsIufXnRx3i9Pxvcdt5h2','OzTgmumhrsxECOR',1683735900722,1684945500722);
INSERT INTO auth_session VALUES('Ya4p6SsKDdGgjVsIwlBbhuIZ8NIq6cJJdszUXjAQ','OzTgmumhrsxECOR',1683735927157,1684945527157);
INSERT INTO auth_session VALUES('o9Qhsg1IGLcxOVqoP7jVMzLNjIJ9CirbGE6IRCxt','OzTgmumhrsxECOR',1683735973450,1684945573450);
INSERT INTO auth_session VALUES('Cvql791PxjHlJZwaoWesTKvDbgGKSTZ8U2Wj1RK7','OzTgmumhrsxECOR',1683736012545,1684945612545);
INSERT INTO auth_session VALUES('qy751ZGOk43IH14GCC2HcyLgxaleQbJdxcQrqb67','OzTgmumhrsxECOR',1683736054292,1684945654292);
INSERT INTO auth_session VALUES('nnZPnIVt1zkR3J1exaICaQcD6CdBX5np87bfqBRn','OzTgmumhrsxECOR',1683736175380,1684945775380);
INSERT INTO auth_session VALUES('wGg3C96IkgfLjqc2vayAF9Gb0aGgnM8OnSnwEOL6','OzTgmumhrsxECOR',1683736441832,1684946041832);
INSERT INTO auth_session VALUES('8p5KGDTtoeDiDSHMCOAc6si4dq9cXDm5k9vBmQcB','OzTgmumhrsxECOR',1683736998594,1684946598594);
INSERT INTO auth_session VALUES('n4kI6mH6KftCzmkjFAnBhlSBdlgbWG9Pib9FEvM4','OzTgmumhrsxECOR',1683737024172,1684946624172);
INSERT INTO auth_session VALUES('zOsc73X9V5dSWUXzhQfxXg8FXu6m78TJwhHtno2l','OzTgmumhrsxECOR',1683737054400,1684946654400);
INSERT INTO auth_session VALUES('7tYL2rnZLu0hZphEHF9zORu85KI26jasYbNL6OBt','OzTgmumhrsxECOR',1683737846249,1684947446249);
INSERT INTO auth_session VALUES('GSXphaznsKlzhRVOV7n8NR89CBVBk1DPiOPrOxEV','OzTgmumhrsxECOR',1683737943035,1684947543035);
INSERT INTO auth_session VALUES('GmKw5U1Z5geOd6JOagkEvTcW54kwVhIzZwoXY8nY','OzTgmumhrsxECOR',1683738218844,1684947818844);
INSERT INTO auth_session VALUES('euEBAxlYmnaqAjkZrhi7OucPPCT0QevMf8J0rBT6','OzTgmumhrsxECOR',1683738337830,1684947937830);
INSERT INTO auth_session VALUES('FUH55QRRNEfKWtcWEU7VIQj72bdWwekGvJOnmRO9','OzTgmumhrsxECOR',1683738361563,1684947961563);
INSERT INTO auth_session VALUES('cmpaGxqpUmMj9WLhmB2Uxf08Yn2gz93ueJSMjy6V','OzTgmumhrsxECOR',1683738599154,1684948199154);
INSERT INTO auth_session VALUES('4AZ5WfPRQmrnVZXZncLpWkKnD8jfOUDG8omXzl64','OzTgmumhrsxECOR',1683741595808,1684951195808);
INSERT INTO auth_session VALUES('Csj45QWibjGvrEGAE77M3OhL3LhpsTnXw9KbYYXS','OzTgmumhrsxECOR',1683781222084,1684990822084);
INSERT INTO auth_session VALUES('O35tgyKzxivWOqTz6IiB08oXebVW0yTTTgDqQKGE','OzTgmumhrsxECOR',1683814706109,1685024306109);
INSERT INTO auth_session VALUES('i0RuZJC2Fg83xieGWKZit5rooMFDj1mJewhWAQZk','OzTgmumhrsxECOR',1683947385914,1685156985914);
INSERT INTO auth_session VALUES('ALnSrvc26rVcOZywpkKu2Ih02gFuAYvm3qRyigRP','OzTgmumhrsxECOR',1684083819291,1685293419291);
INSERT INTO auth_session VALUES('zT9SsAnXNp2J2ADXiAaGkTSbaDQ3bXGrq5j4GRli','OzTgmumhrsxECOR',1684178050928,1685387650928);
INSERT INTO auth_session VALUES('r9UTZoDa9WRmjel8tT9RrnC5BSwPlgYmm3isIqKS','OzTgmumhrsxECOR',1684285741835,1685495341835);
INSERT INTO auth_session VALUES('86kw6EjxKXRnxGz8ybtstLluh1c2lWxbWZGMH2YK','OzTgmumhrsxECOR',1684617506205,1685827106205);
INSERT INTO auth_session VALUES('D9npHnjHkvolGJ7ePZzfkrm4I0C81JeVXj0SP1nh','OzTgmumhrsxECOR',1684680932697,1685890532697);
INSERT INTO auth_session VALUES('hGLpVb6v9kfWZfT5TqE8MwYnJzckkBTXA5ND5UYl','OzTgmumhrsxECOR',1684717922656,1685927522656);
INSERT INTO auth_session VALUES('XnXHXVtUXU0V2ieX8NGkgGODDBKNWEeArfoJd53e','OzTgmumhrsxECOR',1684718315959,1685927915959);
CREATE TABLE IF NOT EXISTS "auth_key" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "hashed_password" TEXT,
    "user_id" TEXT NOT NULL,
    "primary_key" BOOLEAN NOT NULL,
    "expires" BIGINT,
    CONSTRAINT "auth_key_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth_user" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO auth_key VALUES('username:jovany.velez@gmail.com','s2:NW4qefuKUq5wtzE0:6607032ffffab849864b1ed2b375e0840a464550519dda493592d27f27180767aab9a692c811228af9e670a83ebb04e2c880275096ca5702ab0475c0ca359ed4','OzTgmumhrsxECOR',1,NULL);
CREATE TABLE IF NOT EXISTS "auth_user" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "email" TEXT NOT NULL
);
INSERT INTO auth_user VALUES('OzTgmumhrsxECOR','jovany.velez@gmail.com');
CREATE TABLE IF NOT EXISTS "OrdenDePedidoProducto" (
    "ordenDePedidoId" INTEGER NOT NULL,
    "productoId" TEXT NOT NULL,
    "cantidad" INTEGER NOT NULL,
    "precio" REAL NOT NULL,

    PRIMARY KEY ("ordenDePedidoId", "productoId"),
    CONSTRAINT "OrdenDePedidoProducto_ordenDePedidoId_fkey" FOREIGN KEY ("ordenDePedidoId") REFERENCES "OrdenDePedido" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "OrdenDePedidoProducto_productoId_fkey" FOREIGN KEY ("productoId") REFERENCES "Product" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
CREATE TABLE IF NOT EXISTS "Roles" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);
INSERT INTO Roles VALUES(1,'Admin');
INSERT INTO Roles VALUES(2,'Cliente');
INSERT INTO Roles VALUES(3,'Vendedor');
CREATE TABLE IF NOT EXISTS "Image" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "publicId" TEXT NOT NULL,
    "secureUrl" TEXT NOT NULL,
    "productId" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    "name" TEXT NOT NULL,
    CONSTRAINT "Image_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Product" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO Image VALUES('2af723f6-8f6d-4b82-b8a4-f1af20c2733a','tienda/wg7rnc2re32fagnj4nur','https://res.cloudinary.com/dqlbbx7ud/image/upload/v1675527879/tienda/wg7rnc2re32fagnj4nur.jpg','230ff1ad-fe33-4e8e-9e2f-bea0ded124f5',1680274421592,1680274343725,'main');
INSERT INTO Image VALUES('adcbb756-7412-4e13-aae5-974ab05a6e62','tienda/y7mfzr2tcln7xrmwqtbp','https://res.cloudinary.com/dqlbbx7ud/image/upload/v1675527879/tienda/y7mfzr2tcln7xrmwqtbp.png','230ff1ad-fe33-4e8e-9e2f-bea0ded124f5',1680274637313,1680274586226,'one');
INSERT INTO Image VALUES('c5266785-24f2-4a51-9c1e-a588e509adb0','tienda/hk7hazqtgmtj9o7pbmdu','https://res.cloudinary.com/dqlbbx7ud/image/upload/v1675527981/tienda/hk7hazqtgmtj9o7pbmdu.png','013c2a95-e20b-4978-8944-2e59a61e6675',1680275398241,1680274855403,'main');
INSERT INTO Image VALUES('d6b9312b-6ad0-494f-8723-27286e075fa4','tienda/ugh0bruh783x39mn7xdp','https://res.cloudinary.com/dqlbbx7ud/image/upload/v1675527982/tienda/ugh0bruh783x39mn7xdp.png','013c2a95-e20b-4978-8944-2e59a61e6675',1680275523638,1680275461915,'one');
INSERT INTO Image VALUES('837d1df2-0da2-4b3b-b695-10ce332f9fd0','tienda/uwbmm3im4zyhfxrd7krk','https://res.cloudinary.com/dqlbbx7ud/image/upload/v1675528126/tienda/uwbmm3im4zyhfxrd7krk.jpg','44f56eb6-343f-4250-aa66-4bf9deb00b03',1680276174485,1680276036037,'main');
INSERT INTO Image VALUES('ea139101-eefe-437e-8f95-3a02447db969','tienda/eftehf4z3glck9cl3ish','https://res.cloudinary.com/dqlbbx7ud/image/upload/v1675528127/tienda/eftehf4z3glck9cl3ish.png','44f56eb6-343f-4250-aa66-4bf9deb00b03',1680276269452,1680276210040,'one');
INSERT INTO Image VALUES('d0a89503-a5ac-4fd4-bfa2-b66dddf13183','tienda/x6zbkhrc0us1rtwttbgv','https://res.cloudinary.com/dqlbbx7ud/image/upload/v1675528263/tienda/x6zbkhrc0us1rtwttbgv.png','64473b1e-f968-4e4e-a277-7130b44c63a3',1680276771917,1680276694598,'main');
INSERT INTO Image VALUES('3a7e5dfe-8bdf-4dea-8d26-7b6e1f66d0b7','tienda/xjasf2cplwv28byhu6ov','https://res.cloudinary.com/dqlbbx7ud/image/upload/v1675528264/tienda/xjasf2cplwv28byhu6ov.png','64473b1e-f968-4e4e-a277-7130b44c63a3',1680276857366,1680276794583,'one');
INSERT INTO Image VALUES('8d1b84f9-6d94-4d3a-a338-d0b74c7c42cf','tienda/dipyolisoq2c3cjkuxpo','https://res.cloudinary.com/dqlbbx7ud/image/upload/v1673931330/tienda/dipyolisoq2c3cjkuxpo.jpg','31e299bb-19d7-4d4c-a45e-e5ddc46f055d',1680282625951,1680282398999,'main');
INSERT INTO Image VALUES('0f55c48b-2e7f-4947-afe6-0d5a750049b0','tienda/cwg5v2lbodzesg8fbojb','https://res.cloudinary.com/dqlbbx7ud/image/upload/v1673931330/tienda/cwg5v2lbodzesg8fbojb.png','31e299bb-19d7-4d4c-a45e-e5ddc46f055d',1680282625951,1680282401063,'one');
INSERT INTO Image VALUES('3bf37c84-24a0-4129-8c39-e4a03710fe2e','tienda/w89n5z7i03choujnqozp','https://res.cloudinary.com/dqlbbx7ud/image/upload/v1674333072/tienda/w89n5z7i03choujnqozp.png','3c893b74-bfdc-4a6a-b35b-e62dd7a8e012',1680283045369,1680282941397,'main');
INSERT INTO Image VALUES('6704919e-0be8-4a0f-8a34-7af4445992e3','tienda/r0uco7vb8o5riiqizsyv','https://res.cloudinary.com/dqlbbx7ud/image/upload/v1674333072/tienda/r0uco7vb8o5riiqizsyv.png','3c893b74-bfdc-4a6a-b35b-e62dd7a8e012',1680283045369,1680284182504,'one');
INSERT INTO Image VALUES('dab3e855-5609-4f2f-919f-154b5cc3ccc8','tienda/mozvd2jlxf6a5i0i5zw9','https://res.cloudinary.com/dqlbbx7ud/image/upload/v1674362285/tienda/mozvd2jlxf6a5i0i5zw9.jpg','b79c582e-8f42-436b-8459-a1952e1a8db9',1680283966957,1680283866589,'main');
INSERT INTO Image VALUES('3753b559-3af4-42e3-b88a-ddbe73ba8a76','tienda/cdkbnlqi55m3ucxritp3','https://res.cloudinary.com/dqlbbx7ud/image/upload/v1674362286/tienda/cdkbnlqi55m3ucxritp3.png','b79c582e-8f42-436b-8459-a1952e1a8db9',1680283966957,1680283869087,'one');
INSERT INTO Image VALUES('26a84443-826c-4168-9911-2e55563a055f','tienda/lybcjzxonvk1v55s4s9x','https://res.cloudinary.com/dqlbbx7ud/image/upload/v1675526800/tienda/lybcjzxonvk1v55s4s9x.png','c74e8b3a-ef62-4b64-9b19-2dd20fd19ae0',1680286464056,1680286346119,'main');
INSERT INTO Image VALUES('b5992d01-eea3-4f4e-a443-481e751e2220','tienda/elkfmdzrfacmqeydge4v','https://res.cloudinary.com/dqlbbx7ud/image/upload/v1675526801/tienda/elkfmdzrfacmqeydge4v.png','c74e8b3a-ef62-4b64-9b19-2dd20fd19ae0',1680286464056,1680286346805,'one');
INSERT INTO Image VALUES('96500f37-a958-46c6-ae3a-8772dd326718','tienda/kyiqjfqco7f9hihwx5k3','https://res.cloudinary.com/dqlbbx7ud/image/upload/v1675527123/tienda/kyiqjfqco7f9hihwx5k3.png','d8456364-bfd6-46ae-826e-3760d87a093a',1680286825227,1680286720305,'main');
INSERT INTO Image VALUES('91e46a38-36b9-46ce-be2e-a7041aae7824','tienda/suuhqmy3wxeb42tjwgbp','https://res.cloudinary.com/dqlbbx7ud/image/upload/v1675527124/tienda/suuhqmy3wxeb42tjwgbp.png','d8456364-bfd6-46ae-826e-3760d87a093a',1680286825227,1680286720987,'one');
INSERT INTO Image VALUES('5218df96-1209-48ca-b146-f60cfb9dd90f','tienda/rc9cgwslgwysukcadpst','https://res.cloudinary.com/dqlbbx7ud/image/upload/v1675527342/tienda/rc9cgwslgwysukcadpst.png','1c1f3d45-5fd3-41ff-a1b2-333ebd0968f3',1680287332083,1680287257376,'main');
INSERT INTO Image VALUES('1d60918f-ae1a-4feb-a783-9fad0f657d1c','tienda/ddawle09aomymctx2rij','https://res.cloudinary.com/dqlbbx7ud/image/upload/v1675527343/tienda/ddawle09aomymctx2rij.png','1c1f3d45-5fd3-41ff-a1b2-333ebd0968f3',1680287332083,1680287257971,'one');
INSERT INTO Image VALUES('ce5c0a1c-a446-43d7-80da-31fecb9db885','tienda/zmugogb1ckebeog5i0f5','https://res.cloudinary.com/dqlbbx7ud/image/upload/v1675527496/tienda/zmugogb1ckebeog5i0f5.jpg','139906b2-e3e3-414e-9f25-2d70b91a5b83',1680287666553,1680287594139,'main');
INSERT INTO Image VALUES('ce66dfa8-1293-40e7-88b5-190efcebac81','tienda/tymaurkz9ijxgfnixxwj','https://res.cloudinary.com/dqlbbx7ud/image/upload/v1675527497/tienda/tymaurkz9ijxgfnixxwj.png','139906b2-e3e3-414e-9f25-2d70b91a5b83',1680287666553,1680287594667,'one');
INSERT INTO Image VALUES('96730abb-0c00-49be-9eb2-ed233268fcd9','tienda/i4wprcxvoteqgopxo16h','https://res.cloudinary.com/dqlbbx7ud/image/upload/v1675528719/tienda/i4wprcxvoteqgopxo16h.jpg','a37e4cd1-ab00-42ff-8958-c28f4b374967',1680287991501,1680287914889,'main');
INSERT INTO Image VALUES('a9025b1c-66aa-49dc-a901-13d23d1e4a9e','tienda/b5frbes0ii0perk8cnay','https://res.cloudinary.com/dqlbbx7ud/image/upload/v1675528720/tienda/b5frbes0ii0perk8cnay.png','a37e4cd1-ab00-42ff-8958-c28f4b374967',1680287991501,1680287915888,'one');
INSERT INTO Image VALUES('a386f9be-e69e-499c-833b-24a4602205e3','tienda/slnzutadap02uupjrxhp','https://res.cloudinary.com/dqlbbx7ud/image/upload/v1675528954/tienda/slnzutadap02uupjrxhp.jpg','c5547d20-6a0d-48cf-9f91-19c07ef10d8a',1680288294869,1680288222806,'main');
INSERT INTO Image VALUES('bc8a8a87-3980-41ec-8210-597b692f61e2','tienda/uihvd7tl80moneboztw4','https://res.cloudinary.com/dqlbbx7ud/image/upload/v1675528955/tienda/uihvd7tl80moneboztw4.png','c5547d20-6a0d-48cf-9f91-19c07ef10d8a',1680288294869,1680288223485,'one');
INSERT INTO Image VALUES('e8337e09-a901-465d-a9a2-7c502f55d50c','tienda/sxajk9dyjaelfthhm5ho','https://res.cloudinary.com/dqlbbx7ud/image/upload/v1675529377/tienda/sxajk9dyjaelfthhm5ho.png','57ea928f-dade-4dfd-abe5-977a9deb4dba',1680288601413,1680288553570,'main');
INSERT INTO Image VALUES('7fd14087-9977-494e-9309-d21eef63ce9b','tienda/t4emrm6bqyxqh51rurqt','https://res.cloudinary.com/dqlbbx7ud/image/upload/v1675529377/tienda/t4emrm6bqyxqh51rurqt.png','57ea928f-dade-4dfd-abe5-977a9deb4dba',1680288669231,1680288621372,'one');
INSERT INTO Image VALUES('35d023c0-b2f6-43c8-a638-7d4cd6cab05b','tienda/is8nkmrm6dwqfpd22253','https://res.cloudinary.com/dqlbbx7ud/image/upload/v1675529628/tienda/is8nkmrm6dwqfpd22253.png','39a143f3-41ed-4d6e-b06e-62bf227e85ec',1680289096762,1680289064747,'main');
INSERT INTO Image VALUES('77136efe-d643-4fb1-9bef-9b8505fd1706','tienda/wtmerzxwhm61s8wwbpio','https://res.cloudinary.com/dqlbbx7ud/image/upload/v1675529629/tienda/wtmerzxwhm61s8wwbpio.png','39a143f3-41ed-4d6e-b06e-62bf227e85ec',1680289141369,1680289102920,'one');
INSERT INTO Image VALUES('0957a3d0-efcb-445f-a865-e762460ba1b7','tienda/f7ksmi7z2ccoamifczzq','https://res.cloudinary.com/dqlbbx7ud/image/upload/v1675529837/tienda/f7ksmi7z2ccoamifczzq.png','b77b5401-3899-4586-ad6d-7b8b8ca77e8c',1680289450271,1683203503471,'main');
INSERT INTO Image VALUES('9243c965-7951-4d4f-b2eb-ebf83717536a','tienda/vlkmxflyvfwuuc7blawc','https://res.cloudinary.com/dqlbbx7ud/image/upload/v1675529838/tienda/vlkmxflyvfwuuc7blawc.png','b77b5401-3899-4586-ad6d-7b8b8ca77e8c',1680289450271,1683203503471,'one');
INSERT INTO Image VALUES('71235da6-d876-4027-ae78-fa3feb8b481a','tienda/r1n2ohuentacw7zf1vys','https://res.cloudinary.com/dqlbbx7ud/image/upload/v1675530011/tienda/r1n2ohuentacw7zf1vys.png','7b7b8e2d-f101-4625-8229-2b7e81211099',1680290089166,1683203532256,'main');
INSERT INTO Image VALUES('d878affe-4dc9-4f9a-8338-913fc636a61b','tienda/eckt6cnpf24n1svqjxol','https://res.cloudinary.com/dqlbbx7ud/image/upload/v1675530011/tienda/eckt6cnpf24n1svqjxol.png','7b7b8e2d-f101-4625-8229-2b7e81211099',1680290089166,1683203578383,'one');
INSERT INTO Image VALUES('1a4b5fab-0d75-4487-8978-6c18a175c4b6','tienda/zhgeemgsvwjgqwhbvted','https://res.cloudinary.com/dqlbbx7ud/image/upload/v1676914808/tienda/zhgeemgsvwjgqwhbvted.jpg','3ea04078-f890-4b49-b13c-37a3a9087f05',1680290809851,1683203532256,'main');
INSERT INTO Image VALUES('58cf7ede-68dc-4f01-a458-986456558411','tienda/icdde0nxlseewtcrokxc','https://res.cloudinary.com/dqlbbx7ud/image/upload/v1676914809/tienda/icdde0nxlseewtcrokxc.png','3ea04078-f890-4b49-b13c-37a3a9087f05',1680290809851,1683203532256,'one');
INSERT INTO Image VALUES('2e912a38-70d6-4710-bf2b-062ceb3b2e18','tienda/eb9j6elivjktcp9g7ety','https://res.cloudinary.com/dqlbbx7ud/image/upload/v1683211039/tienda/eb9j6elivjktcp9g7ety.png','4416efec-6f58-4c07-8c9b-f2df0b0c9e51',1683211040519,1683211040519,'main');
INSERT INTO Image VALUES('9dde84b8-15c8-41ab-a5f3-1fed85eed1bd','tienda/t4gwpnxf3kpwhkbvd6l4','https://res.cloudinary.com/dqlbbx7ud/image/upload/v1683211038/tienda/t4gwpnxf3kpwhkbvd6l4.png','4416efec-6f58-4c07-8c9b-f2df0b0c9e51',1683211040694,1683211040694,'one');
CREATE TABLE IF NOT EXISTS "OrdenDePedido" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "fecha" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userId" INTEGER NOT NULL,
    "direccionEntrega" TEXT NOT NULL,
    "ciudadEnt" TEXT NOT NULL,
    "departamentoEnt" TEXT NOT NULL,
    "metodoPago" TEXT NOT NULL,
    "estado" TEXT NOT NULL,
    "fechaDespacho" DATETIME NOT NULL,
    CONSTRAINT "OrdenDePedido_userId_fkey" FOREIGN KEY ("userId") REFERENCES "Usuario" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
CREATE TABLE IF NOT EXISTS "Usuario" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "roleId" INTEGER NOT NULL,
    "nombre" TEXT NOT NULL,
    "telefono" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "tipoDoc" TEXT NOT NULL,
    "numDoc" TEXT NOT NULL,
    "Departamento" TEXT NOT NULL,
    "Ciudad" TEXT NOT NULL,
    "direccion" TEXT NOT NULL,
    CONSTRAINT "Usuario_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES "Roles" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO Usuario VALUES(1,2,'Jovany Vélez Arango','3002005393','jovany.velez@gmail.com','Cedula','15263832','Antioquia','Bello','Calle 52d # 57a-40');
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('Roles',3);
INSERT INTO sqlite_sequence VALUES('OrdenDePedido',0);
INSERT INTO sqlite_sequence VALUES('Usuario',1);
CREATE UNIQUE INDEX "Category_name_key" ON "Category"("name");
CREATE UNIQUE INDEX "Product_code_key" ON "Product"("code");
CREATE UNIQUE INDEX "Product_eancode_key" ON "Product"("eancode");
CREATE UNIQUE INDEX "auth_session_id_key" ON "auth_session"("id");
CREATE INDEX "auth_session_user_id_idx" ON "auth_session"("user_id");
CREATE UNIQUE INDEX "auth_key_id_key" ON "auth_key"("id");
CREATE INDEX "auth_key_user_id_idx" ON "auth_key"("user_id");
CREATE UNIQUE INDEX "auth_user_id_key" ON "auth_user"("id");
CREATE UNIQUE INDEX "auth_user_email_key" ON "auth_user"("email");
CREATE UNIQUE INDEX "Roles_name_key" ON "Roles"("name");
CREATE UNIQUE INDEX "Usuario_email_key" ON "Usuario"("email");
CREATE UNIQUE INDEX "Usuario_numDoc_key" ON "Usuario"("numDoc");
COMMIT;
