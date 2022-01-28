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
  idProv INT AUTO_INCREMENT,
  nom VARCHAR(40) NOT NULL,
  nif VARCHAR(20) NOT NULL,
  telefon INT NOT NULL,
  correuElectr VARCHAR(70),
  fax INT,
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
INSERT INTO
  ulleres VALUE(
    1,
    'oakley',
    'oak1',
    '0.5',
    '0.25',
    'FLOTANT',
    'TRANSPARENT',
    'TRANSPARENT',
    223
  );
INSERT INTO
  ulleres VALUE(
    2,
    'PRADA',
    'MLO4',
    '1.25',
    '1.5',
    'pasta',
    'negre',
    'TRANSPARENT',
    125
  );
INSERT INTO
  ulleres VALUE(
    3,
    'PRADA',
    'MLO3',
    '1',
    '1.25',
    'metàl·lica',
    'gris',
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
    8,
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
  proveidors VALUE(
    1,
    'ulleres_barates1',
    '11111111A',
    111111111,
    'ulleres_barates1@ulleres_barates1.com',
    111111110,
    'ulleres 1',
    08000,
    'barcelona',
    'pais',
    2
  );
  
INSERT INTO
  proveidors VALUE(
    2,
    'ulleres_barates2',
    '22222222B',
    222222222,
    'ulleres_barates2@ulleres_barates2.com',
    222222220,
    'ulleres 2',
    08000,
    'barcelona',
    'pais',
    1
  );