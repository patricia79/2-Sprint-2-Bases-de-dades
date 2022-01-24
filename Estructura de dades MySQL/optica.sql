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
  colorVidres VARCHAR(50)NOT NULL,
  preu FLOAT NOT NULL
);
INSERT INTO
  ulleres VALUE(1,'D&G','LKIOP','3.25', '3.25','METÀL·LICA','NEGRA','TRANSPARENT', 564);
 INSERT INTO
  ulleres VALUE(2,'PRADA','KJU3','0.5', '1.5','PASTA','NEGRA','TRANSPARENT', 365);
  INSERT INTO
  ulleres VALUE(3,'PRADA','MLO3','1', '1.25','FLOTANT','TRANSPARENT','TRANSPARENT',125);
  INSERT INTO
  ulleres VALUE(4,'TOUS','7583','1', '1.25','FLOTANT','TRANSPARENT','TRANSPARENT',421);
  INSERT INTO
  ulleres VALUE(5,'TOUS','35','0.75', '1.02','METÀL·LICA','PLATA','TRANSPARENT',254);

   INSERT INTO
  ulleres VALUE(6,'PRADA','3000','2.75', '3','METÀL·LICA','GRIS','TRANSPARENT',138);
  INSERT INTO
  ulleres VALUE(7,'OAKLEY','MIMO','1.5', '2.5','PASTA','BLANC','TRANSPARENT',321);

CREATE TABLE proveidors (
    idProv INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(40) NOT NULL,
    nif VARCHAR(40) NOT NULL,
    telefon VARCHAR(60) NOT NULL,
    correuElectr VARCHAR(70),
    fax VARCHAR(50),
    adress VARCHAR(100) NOT NULL,
    codiPostal INT NOT NULL ,
    ciutat VARCHAR(50) NOT NULL ,
    pais VARCHAR(100) NOT NULL
  );
INSERT INTO
  proveidors VALUE(1,'Ulleres_barates1','NIFProv1','111111111','Ulleres_barates1@Ulleres_barates1.com','999999999','adress_ulleres 
  barates1',08100, 'barcelona', 'PAIS');
    proveidors VALUE(2,'Ulleres_barates2','NIFProv2','222222222','Ulleres_barates1@Ulleres_barates2.com','999999999','adress_ulleres 
  barates2',08200, 'barcelona', 'PAIS');
    proveidors VALUE(3,'Ulleres_barates1','NIFProv1','333333333','Ulleres_barates1@Ulleres_barates1.com','333333330','adress_ulleres 
  barates1',08300, 'barcelona', 'PAIS');
    proveidors VALUE(4,'Ulleres_barates1','NIFProv1','444444444','Ulleres_barates1@Ulleres_barates1.com','444444440','adress_ulleres 
  barates1',08400, 'barcelona', 'PAIS');
    proveidors VALUE(5,'Ulleres_barates1','NIFProv1','555555555','Ulleres_barates1@Ulleres_barates1.com','555555550','adress_ulleres 
  barates1',08500, 'barcelona', 'PAIS');
    proveidors VALUE(6,'Ulleres_barates1','NIFProv1','38383','Ulleres_barates1@Ulleres_barates1.com','666666660','adress_ulleres 
  barates1',08600, 'barcelona', 'PAIS');
    proveidors VALUE(7,'Ulleres_barates1','NIFProv1','777777777','Ulleres_barates1@Ulleres_barates1.com','777777770','adress_ulleres 
  barates1',08700, 'barcelona', 'PAIS');
    proveidors VALUE(8,'Ulleres_barates1','NIFProv1','88888888','Ulleres_barates1@Ulleres_barates1.com','888888880','adress_ulleres 
  barates1',08800, 'barcelona', 'PAIS');
    proveidors VALUE(9,'Ulleres_barates9','NIFProv9','999999999','Ulleres_barates9@Ulleres_barates9.com','999999990','adress_ulleres 
  barates9',08900, 'barcelona', 'PAIS');
INSERT INTO
  proveidors VALUE(
    2,
    'Proveidor 2',
    'NIFProv2',
    '38382',
    'proveidor2@proveidor2.com',
    'fax',
    'adreça 2'
  );
INSERT INTO
  proveidors VALUE(
    3,
    'Proveidor 3',
    'NIFProv3',
    '38381',
    'proveidor3@proveidor3.com',
    'fax',
    'adreça 3'
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
    clientReco INT,
    FOREIGN KEY (clientReco) REFERENCES clients (idClient)
  );
INSERT INTO
  clients VALUE(
    1,
    'Client 1',
    'Telefon 1',
    'client1@client1.com',
    'adreça 1',
    '2022-01-07',
    null
  );
INSERT INTO
  clients VALUE(
    2,
    'Client 2',
    'Telefon 2',
    'client2@client2.com',
    'adreça 2',
    '2022-01-07',
    1
  );
INSERT INTO
  clients VALUE(
    3,
    'Client 3',
    'Telefon 3',
    'client3@client3.com',
    'adreça 3',
    '2022-01-07',
    null
  );
CREATE TABLE facturaPart (
    idUll INT NOT NULL,
    idClient INT NOT NULL,
    venedor VARCHAR(50) NOT NULL,
    dataCompra DATETIME,
    FOREIGN KEY (idUll) REFERENCES ulleres (idUll),
    FOREIGN KEY (idClient) REFERENCES clients (idClient)
  );
INSERT INTO
  facturaPart VALUE(1, 1, 'Silvia', '2022-01-07');
INSERT INTO
  facturaPart VALUE(2, 3, 'Charo', '2021-12-31');
INSERT INTO
  facturaPart VALUE(1, 2, 'Charo', '2021-11-03');
INSERT INTO
  facturaPart VALUE(3, 1, 'Silvia', '2021-01-07');
INSERT INTO
  facturaPart VALUE(1, 2, 'Silvia', '2021-03-07');
INSERT INTO
  facturaPart VALUE(1, 3, 'Silvia', '2021-04-07');
INSERT INTO
  facturaPart VALUE(4, 2, 'Silvia', '2021-05-07');
CREATE TABLE facturaProv (
    idFact INT PRIMARY KEY,
    idProv INT NOT NULL,
    dataCompra DATETIME,
    FOREIGN KEY (idProv) REFERENCES proveidors (idProv)
  );
INSERT INTO
  facturaprov VALUE(1, 1, '2022-01-07');
INSERT INTO
  facturaprov VALUE(2, 2, '2021-01-07');
INSERT INTO
  facturaprov VALUE(3, 3, '2021-12-07');
CREATE Table factura_ulleres (
    idFact INT NOT NULL,
    idUll INT NOT NULL,
    FOREIGN KEY (idFact) REFERENCES facturaProv(idFact),
    FOREIGN KEY (idUll) REFERENCES ulleres(idUll)
  );
INSERT INTO
  factura_ulleres VALUE(1, 1);
INSERT INTO
  factura_ulleres VALUE(1, 2);
INSERT INTO
  factura_ulleres VALUE(2, 3);
INSERT INTO
  factura_ulleres VALUE(3, 4);
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
  venedor = 'Silvia'
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