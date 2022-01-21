DROP DATABASE IF EXISTS pizzeria;
CREATE DATABASE pizzeria;
USE pizzeria;

CREATE TABLE provincia (
  idprov INT AUTO_INCREMENT PRIMARY KEY,
  nom VARCHAR(100) NOT NULL
);


INSERT INTO provincia VALUE(1, 'Barcelona'08);
INSERT INTO provincia VALUE(2,  'Lleida'25);
INSERT INTO provincia VALUE(3,  'Girona'17);
INSERT INTO provincia VALUE(4,  'Tarragona'43);

CREATE TABLE localitat (
  idlocal INT AUTO_INCREMENT PRIMARY KEY,
  nom VARCHAR(100) NOT NULL,
  refprov INT NOT NULL,

  FOREIGN KEY (refprov) REFERENCES provincia (idprov)
);

INSERT INTO localitat VALUE(1, 'Sabadell', 1);
INSERT INTO localitat VALUE(2,  'Manresa', 1);
INSERT INTO localitat VALUE(3,  'Barcelona', 1);
INSERT INTO localitat VALUE(4,  'Badalona', 1);
INSERT INTO localitat VALUE(5, 'Lleida', 2);
INSERT INTO localitat VALUE(6,  'Balaguer', 2);
INSERT INTO localitat VALUE(7,  'Olot', 3);
INSERT INTO localitat VALUE(8,  'Flix', 4);

CREATE TABLE clients (
  idClients INT AUTO_INCREMENT PRIMARY KEY,
  nom VARCHAR(40) NOT NULL,
  cognom VARCHAR(40) NOT NULL,
  adreça VARCHAR(100) NOT NULL,
  codiPostal INT NOT NULL,
  idlocal INT NOT NULL,
  telefon INT NOT NULL,

FOREIGN KEY (idlocal) REFERENCES localitat (idlocal)

);

INSERT INTO clients VALUE(1, 'nom1', 'cognom1', 'adreça1', 08000, 1, 933333333);
INSERT INTO clients VALUE(2, 'nom1', 'cognom1', 'adreça1', 08000, 2, 933333333);
INSERT INTO clients VALUE(3, 'nom1', 'cognom1', 'adreça1', 08000, 3, 933333333);
INSERT INTO clients VALUE(4, 'nom1', 'cognom1', 'adreça1', 08000, 4, 933333333);
INSERT INTO clients VALUE(5, 'nom1', 'cognom1', 'adreça1', 25000, 5, 973333333);
INSERT INTO clients VALUE(6, 'nom1', 'cognom1', 'adreça1', 25000, 6, 973333333);
INSERT INTO clients VALUE(7, 'nom1', 'cognom1', 'adreça1', 17000, 7, 699999999);
INSERT INTO clients VALUE(8, 'nom8', 'cognom8', 'adreça8', 43000, 8, 733333333);

CREATE TABLE botiga (
  idbotiga INT AUTO_INCREMENT PRIMARY KEY,
  adreça VARCHAR(100) NOT NULL,
  codiPostal INT NOT NULL,
  idlocal INT NOT NULL,
  telefon INT,

FOREIGN KEY (idlocal) REFERENCES localitat (idlocal)

);


CREATE TABLE empleat (
  idempleat INT AUTO_INCREMENT PRIMARY KEY,
  nom VARCHAR(40) NOT NULL,
  cognoms VARCHAR(40) NOT NULL,
  nif VARCHAR(100) NOT NULL,
  telefon INT NOT NULL,
  cuiner BIT,
  idbotiga INT NOT NULL,

FOREIGN KEY (idbotiga) REFERENCES botiga (idbotiga)

);

CREATE TABLE categoria (
  idcat INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nom VARCHAR(40) NOT NULL
);


CREATE TABLE comandes (
  idComandes INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  idClients INT NOT NULL,
  idbotiga INT NOT NULL,
  dataHora DATETIME,
  botiga BIT,
  preuTotal FLOAT NOT NULL,
  repartidor INT ,


  FOREIGN KEY (idClients) REFERENCES clients (idClients),
  FOREIGN KEY (idbotiga) REFERENCES botiga (idbotiga),
  FOREIGN KEY (repartidor) REFERENCES empleat (idempleat)

);
CREATE TABLE producte (
  idprod INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nom VARCHAR(40) NOT NULL,
  imatge LONGBLOB,
  descripció VARCHAR(60) NOT NULL,
  preu FLOAT NOT NULL,
  idcat INT,

  FOREIGN KEY (idcat) REFERENCES categoria (idcat)
);

