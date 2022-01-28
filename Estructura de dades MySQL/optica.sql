DROP DATABASE IF EXISTS cul_ampolla;
CREATE DATABASE cul_ampolla;
USE cul_ampolla;
CREATE TABLE ulleres (
  idUll INT AUTO_INCREMENT PRIMARY KEY,
  marca VARCHAR(40) NOT NULL,
  model VARCHAR(40),
  graduacioUd VARCHAR(60) NOT NULL,
  graduacioUe VARCHAR(60) NOT NULL,
  tipusMuntura ENUM ('PASTA', 'FLOTANT', 'METÀL·LICA'),
  colorMuntura VARCHAR(50) NOT NULL,
  colorVidres VARCHAR(50) NOT NULL,
  preu FLOAT NOT NULL
);
CREATE TABLE proveidors (
  idProv INT AUTO_INCREMENT PRIMARY KEY,
  nom VARCHAR(40) NOT NULL,
  nif VARCHAR(40) NOT NULL,
  telefon VARCHAR(60) NOT NULL,
  correuElectr VARCHAR(70),
  fax VARCHAR(50),
  adress VARCHAR(100) NOT NULL,
  codiPostal INT NOT NULL,
  ciutat VARCHAR(50) NOT NULL,
  pais VARCHAR(100) NOT NULL,
   idUll INT NOT NULL,
    FOREIGN KEY (idUll) REFERENCES ulleres (idUll)
);
CREATE TABLE clients (
  idClient INT AUTO_INCREMENT PRIMARY KEY,
  nom VARCHAR(40) NOT NULL,
  telefon VARCHAR(60) NOT NULL,
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

;
INSERT INTO
  ulleres VALUE(
    3,
    'PRADA',
    'MLO3',
    '1',
    '1.25',
    'FLOTANT',
    'TRANSPARENT',
    'TRANSPARENT',
    125
  );
INSERT INTO
  ulleres VALUE(
    4,
    'TOUS',
    '7583',
    '1',
    '1.25',
    'FLOTANT',
    'TRANSPARENT',
    'TRANSPARENT',
    421
  );
INSERT INTO
  ulleres VALUE(
    5,
    'TOUS',
    '35',
    '0.75',
    '1.25',
    'METÀL·LICA',
    'PLATA',
    'TRANSPARENT',
    254
  );
INSERT INTO
  ulleres VALUE(
    6,
    'PRADA',
    '3000',
    '2.75',
    '3',
    'METÀL·LICA',
    'GRIS',
    'TRANSPARENT',
    138
  );
INSERT INTO
  ulleres VALUE(
    7,
    'OAKLEY',
    'MIMO',
    '1.5',
    '2.5',
    'PASTA',
    'BLANC',
    'TRANSPARENT',
    321
  );
INSERT INTO
  ulleres VALUE(
    1,
    'D&G',
    'LKIOP',
    '3.25',
    '3.25',
    'METÀL·LICA',
    'NEGRA',
    'TRANSPARENT',
    564
  );
INSERT INTO
  ulleres VALUE(
    2,
    'PRADA',
    'KJU3',
    '0.5',
    '1.5',
    'PASTA',
    'NEGRA',
    'TRANSPARENT',
    365
  );
INSERT INTO
  proveidors VALUE(
    1,
    'Ulleres_barates1',
    'NIFProv1',
    '111111111',
    'Ulleres_barates1@Ulleres_barates1.com',
    '111111110',
    'adress_ulleres barates1',
    08100,
    'barcelona',
    'PAIS'
  );
INSERT INTO
  proveidors VALUE(
    2,
    'Ulleres_barates2',
    'NIFProv2',
    '222222222',
    'Ulleres_barates2@Ulleres_barates2.com',
    '222222220',
    'adress_ulleres barates2',
    08200,
    'barcelona',
    'PAIS'
  );
INSERT INTO
  proveidors VALUE(
    3,
    'Ulleres_barates3',
    'NIFProv3',
    '333333333',
    'Ulleres_barates3@Ulleres_barates3.com',
    '333333330',
    'adress_ulleres barates3',
    08300,
    'barcelona',
    'PAIS'
  );
INSERT INTO
  clients VALUE(
    1,
    'client1',
    '111111111',
    '1client@client.com',
    'adress client 1',
    08100,
    'barcelona',
    'PAIS',
    '2021-10-08',
    null
  );
INSERT INTO
  clients VALUE(
    2,
    'client2',
    '222222222',
    '2client@client.com',
    'adress client 2',
    08200,
    'barcelona',
    'PAIS',
    '2021-09-08',
    null
  );
INSERT INTO
  clients VALUE(
    3,
    'client3',
    '333333333',
    '3client@client.com',
    'adress client 3',
    08300,
    'barcelona',
    'PAIS',
    '2021-08-08',
    null
  );
INSERT INTO
  clients VALUE(
    4,
    'client4',
    '444444444',
    '4client@client.com',
    'adress client 4',
    08400,
    'barcelona',
    'PAIS',
    '2021-07-08',
    null
  );
INSERT INTO
  clients VALUE(
    5,
    'client5',
    '555555555',
    '5client@client.com',
    'adress client 5',
    08500,
    'barcelona',
    'PAIS',
    '2021-06-08',
    null
  );
INSERT INTO
  clients VALUE(
    6,
    'client6',
    '666666666',
    '6client@client.com',
    'adress client 6',
    08600,
    'barcelona',
    'PAIS',
    '2021-05-08',
    null
  );
INSERT INTO
  clients VALUE(
    7,
    'client7',
    '777777777',
    '7client@client.com',
    'adress client 7',
    08700,
    'barcelona',
    'PAIS',
    '2021-04-08',
    null
  );
INSERT INTO
  clients VALUE(
    8,
    'client8',
    '888888888',
    '8client@client.com',
    'adress client 8',
    08800,
    'barcelona',
    'PAIS',
    '2021-03-08',
    null
  );
INSERT INTO
  clients VALUE(
    9,
    'client9',
    '999999999',
    '9client@client.com',
    'adress client 9',
    08900,
    'barcelona',
    'PAIS',
    '2021-02-08',
    null
  );

# Queries
  # Query 1
SELECT
  COUNT(*)
FROM
  cul_ampolla.facturapart
WHERE
  idClient = 1;
# Query 2
SELECT
  distinct ulleres.idUll,
  ulleres.marca,
  ulleres.model
FROM
  cul_ampolla.facturapart
  INNER JOIN cul_ampolla.ulleres ON cul_ampolla.facturapart.idUll = cul_ampolla.ulleres.idUll
WHERE
  venedor = 'Venedor2'
  AND YEAR(dataCompra) = 2021;
# Query 3
SELECT
  distinct prov.idProv,
  prov.nom,
  prov.nif
FROM
  facturapart fap
  INNER JOIN factura_ulleres facull ON fap.idull = facull.idull
  INNER JOIN facturaprov facprov ON facull.idfact = facprov.idfact
  INNER JOIN proveidors prov ON facprov.idprov = prov.idprov;
