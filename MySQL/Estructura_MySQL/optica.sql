DROP DATABASE IF EXISTS cul_ampolla;
CREATE DATABASE cul_ampolla;
USE cul_ampolla;
CREATE TABLE proveidors (
  idProv INT AUTO_INCREMENT PRIMARY KEY,
  nom VARCHAR(40) NOT NULL,
  nif VARCHAR(20) NOT NULL,
  telefon INT NOT NULL,
  correuElectr VARCHAR(70),
  fax INT,
  adress VARCHAR(100) NOT NULL,
  codiPostal INT NOT NULL,
  ciutat VARCHAR(50) NOT NULL,
  pais VARCHAR(100) NOT NULL
);
   
   CREATE TABLE ulleres(
idUll INT AUTO_INCREMENT PRIMARY KEY,
marca VARCHAR(60) NOT NULL,
model VARCHAR(40),
graduacioUd VARCHAR(60) NOT NULL,
graduacioUe VARCHAR(60) NOT NULL,
tipusMuntura ENUM ('PASTA', 'FLOTANT', 'METÀL·LICA') NOT NULL,
colorMuntura VARCHAR(50) NOT NULL,
colorVidres VARCHAR(50) NOT NULL,
preu FLOAT NOT NULL,
idProv INT NOT NULL,
FOREIGN KEY(idProv) REFERENCES proveidors (idProv)
);
   
CREATE TABLE clients (
  idClient INT AUTO_INCREMENT PRIMARY KEY,
  nom VARCHAR(40) NOT NULL,
  telefon INT NOT NULL,
  correuElectr VARCHAR(70),
  adress VARCHAR(100) NOT NULL,
  codiPostal INT NOT NULL,
  ciutat VARCHAR(50) NOT NULL,
  pais VARCHAR(100) NOT NULL,
  dataRegistre DATETIME,
  clientRecomanador INT,
  venedor VARCHAR(50) NOT NULL,
  dataCompra DATETIME,
  idUll INT NOT NULL,
  FOREIGN KEY (idUll) REFERENCES ulleres (idUll),
  FOREIGN KEY (clientRecomanador) REFERENCES clients (idClient)
);
INSERT INTO proveidors (idProv, nom, nif, telefon, correuElectr, fax, adress, codiPostal, ciutat, pais)
 VALUES (1, 'ulleres_barates1', '11111111A', 111111111, 'ulleres_barates1@ulleres_barates1.com', 111111110, 
 'ulleres 1', 08000, 'barcelona', 'pais');
 
INSERT INTO proveidors (idProv, nom, nif, telefon, correuElectr, fax, adress, codiPostal, ciutat, pais)
 VALUES (2, 'ulleres_barates2', '22222222B', 222222222, 'ulleres_barates2@ulleres_barates2.com', 222222220, 
 'ulleres 2', 08000, 'barcelona', 'pais');
 
 INSERT INTO proveidors (idProv, nom, nif, telefon, correuElectr, fax, adress, codiPostal, ciutat, pais)
 VALUES (3, 'ulleres_barates3', '33333333B', 333333333, 'ulleres_barates3@ulleres_barates3.com', 333333330, 
 'ulleres 3', 08000, 'barcelona', 'pais');
 /*
INSERT INTO  clients (idClient, nom, telefon, correuElectr, adress, codiPostal, ciutat, pais, dataRegistre, clientRecomanador,
venedor, dataCompra, idUll)
VALUES (1, 'client 1', 111111111, 'client1@client1.com', 'client 1', 08000, 'barcelona', 
'pais', '2021-11-25',NULL, 'venedor1', '2021-11-30', 1);
INSERT INTO clients (idClient, nom, telefon, correuElectr, adress, codiPostal, ciutat, pais, dataRegistre, clientRecomanador,
venedor, dataCompra, idUll)
VALUES (2, 'client 2', 222222222, 'client2@client2.com', 'client 2', 08000, 'barcelona', 
'pais', '2021-10-25',1, 'venedor2', '2021-10-31', 2);
  INSERT INTO clients (idClient, nom, telefon, correuElectr, adress, codiPostal, ciutat, pais, dataRegistre, clientRecomanador,
venedor, dataCompra, idUll)
  VALUES (3, 'client 3', 333333333, 'client3@client3.com', 'client 3', 08000, 'barcelona', 
  'pais', '2021-09-25',2, 'venedor1', '2021-09-30', 2);
  INSERT INTO clients (idClient, nom, telefon, correuElectr, adress, codiPostal, ciutat, pais, dataRegistre, clientRecomanador,
venedor, dataCompra, idUll)
  VALUES (4, 'client 4', 444444444, 'client4@client4.com', 'client 4', 08000, 'barcelona', 
  'pais', '2021-08-25',3, 'venedor2', '2021-08-30', 2);
  INSERT INTO clients (idClient, nom, telefon, correuElectr, adress, codiPostal, ciutat, pais, dataRegistre, clientRecomanador,
venedor, dataCompra, idUll)
  VALUES (5,'client 5', 555555555, 'client5@client5.com', 'client 5', 08000, 'barcelona', 
  'pais', '2020-07-25',4, 'venedor1', '2020-07-30', 4);
   INSERT INTO clients (idClient, nom, telefon, correuElectr, adress, codiPostal, ciutat, pais, dataRegistre, clientRecomanador,
venedor, dataCompra, idUll)
VALUES(6, 'client 6', 666666666, 'client6@client6.com', 'client 6', 08000, 'barcelona', 
   'pais', '2021-07-25',5, 'venedor2', '2021-07-30', 8);*/

INSERT INTO ulleres VALUES (1,'PRADA','MLO1','1.25','1.5','pasta','negre','TRANSPARENT',125,3);
INSERT INTO ulleres VALUES (2,'PRADA','MLO4','1.25','1.5','pasta', 'blanca','transparent',225,3);
INSERT INTO ulleres VALUES (3,'PRADA','MLO3','1','1.25','metàl·lica','gris','TRANSPARENT',128,3);
INSERT INTO ulleres VALUES (4,'TOUS','7583','1','1.25','FLOTANT','TRANSPARENT','TRANSPARENT',421,2);
INSERT INTO ulleres VALUES (5,'TOUS','35','0.75','1.25','METÀL·LICA','PLATA','TRANSPARENT',254, 2);
INSERT INTO ulleres VALUES (6,'PRADA','3000','2.75','3','METÀL·LICA','GRIS','TRANSPARENT',138, 3);
INSERT INTO ulleres VALUES (7,'OAKLEY','MIMO','1.5','2.5','PASTA','BLANC','TRANSPARENT',321,1);
INSERT INTO ulleres VALUES (8,'D&G','LKIOP','3.25','3.25','METÀL·LICA','NEGRA','TRANSPARENT',564,1);

# Queries

# Query 1

 /* Llista el total de compres d'un client */
SELECT COUNT(*) FROM cul_ampolla.clients WHERE idClient = 1;

# Query 2

/* Llista les diferents ulleres que ha venut un empleat durant un any */
/*
SELECT distinct ulleres.idUll, ulleres.marca, ulleres.model
FROM cul_ampolla.facturapart INNER JOIN cul_ampolla.ulleres ON cul_ampolla.facturapart.idUll = cul_ampolla.ulleres.idUll
WHERE venedor = 'Silvia' AND YEAR(dataCompra) = 2021;*/

# Query 3

/* Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica 
SELECT distinct prov.idProv, prov.nom, prov.nif
FROM facturapart fap INNER JOIN factura_ulleres facull ON fap.idull = facull.idull
	INNER JOIN facturaprov facprov ON facull.idfact = facprov.idfact
    INNER JOIN proveidors prov ON facprov.idprov = prov.idprov;*/