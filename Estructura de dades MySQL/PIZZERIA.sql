DROP DATABASE IF EXISTS pizzeria;
CREATE DATABASE pizzeria;
USE pizzeria;
CREATE TABLE provincies (
  idProv INT AUTO_INCREMENT PRIMARY KEY,
  nomProv VARCHAR(100) NOT NULL
);
CREATE TABLE localitats (
  idLocal INT AUTO_INCREMENT PRIMARY KEY,
  nomLocal VARCHAR(100) NOT NULL,
  idProv INT NOT NULL,
  FOREIGN KEY (idProv) REFERENCES provincies (idProv)
);
CREATE TABLE clients (
  idclient INT AUTO_INCREMENT PRIMARY KEY,
  nomclient VARCHAR(40) NOT NULL,
  cognom VARCHAR(40) NOT NULL,
  adress VARCHAR(100) NOT NULL,
  codipostal INT NOT NULL,
  telefon INT NOT NULL,
  idLocal INT NOT NULL,
  FOREIGN KEY (idLocal) REFERENCES localitats (idLocal)
);
CREATE TABLE botigues (
  idbotiga INT AUTO_INCREMENT PRIMARY KEY,
  adress VARCHAR(100) NOT NULL,
  codipostal INT NOT NULL,
  telefon INT NOT NULL,
  idlocal INT NOT NULL,
  FOREIGN KEY (idLocal) REFERENCES localitats (idLocal)
);
CREATE TABLE treballadors (
  id_treballador INT AUTO_INCREMENT PRIMARY KEY,
  nom VARCHAR(40) NOT NULL,
  cognom VARCHAR(40) NOT NULL,
  nif VARCHAR(100) NOT NULL,
  telefon INT NOT NULL,
  carrec enum ('cuiner', 'repartidor'),
  idbotiga INT NOT NULL,
  FOREIGN KEY (idbotiga) REFERENCES botigues (idbotiga)
);
CREATE TABLE categories (
  idCat INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nameCat VARCHAR(40) NOT NULL
);
CREATE TABLE pizzes(
  idpizza INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nompizza VARCHAR(40) NOT NULL,
  imatge LONGBLOB,
  descripcio VARCHAR(60) NOT NULL,
  preu FLOAT NOT NULL,
  idCat INT NOT NULL,
  FOREIGN KEY (idCat) REFERENCES categories (idCat)
);
CREATE TABLE burgers (
  idburger INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nom_burger VARCHAR(40) NOT NULL,
  imatge LONGBLOB,
  descripcio VARCHAR(60) NOT NULL,
  preu FLOAT NOT NULL
);
CREATE TABLE begudes (
  idbeguda INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nom_beguda VARCHAR(40) NOT NULL,
  imatge LONGBLOB,
  descripcio VARCHAR(60) NOT NULL,
  preu FLOAT NOT NULL
);
CREATE TABLE productes (
  idprod INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  producte enum ('pizzes', 'burger', 'begudes'),
  idburger INT NOT NULL,
  idpizza INT NOT NULL,
  idbeguda INT NOT NULL,
  FOREIGN KEY (idburger) REFERENCES burgers (idburger),
  FOREIGN KEY (idpizza) REFERENCES pizzes (idpizza),
  FOREIGN KEY (idbeguda) REFERENCES begudes (idbeguda)
);
CREATE TABLE comandes (
 idcomanda INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 idclient INT NOT NULL,   
 idbotiga INT NOT NULL,
 data_hora DATETIME,
 mètode_entrega enum ('botiga', 'domicili'),
 preu_total FLOAT NOT NULL,  
 id_treballador INT NOT NULL,
 repartidor INT,
 idburger INT NOT NULL,
 idpizza INT NOT NULL,
 idbeguda INT NOT NULL, 
 
 FOREIGN KEY (idburger) REFERENCES burgers (idburger),
 FOREIGN KEY (idpizza) REFERENCES pizzes (idpizza),
 FOREIGN KEY (idbeguda) REFERENCES begudes (idbeguda),
 FOREIGN KEY (idclient) REFERENCES clients (idclient),
 FOREIGN KEY (idbotiga) REFERENCES botigues (idbotiga),
 FOREIGN KEY (repartidor) REFERENCES treballadors (id_treballador)
 );

/*
INSERT INTO
  province VALUE(1, 'Barcelona');
INSERT INTO
  province VALUE(2, 'Lleida');
INSERT INTO
  province VALUE(3, 'Girona');
INSERT INTO
  province VALUE(4, 'Tarragona');
INSERT INTO
  clients VALUE(
    1,
    'nom1',
    'cognom1',
    'adreça1',
    08000,
    1,
    933333333
  );
INSERT INTO
  clients VALUE(
    2,
    'nom1',
    'cognom1',
    'adreça1',
    08000,
    2,
    933333333
  );
INSERT INTO
  clients VALUE(
    3,
    'nom1',
    'cognom1',
    'adreça1',
    08000,
    3,
    933333333
  );
INSERT INTO
  clients VALUE(
    4,
    'nom1',
    'cognom1',
    'adreça1',
    08000,
    4,
    933333333
  );
INSERT INTO
  clients VALUE(
    5,
    'nom1',
    'cognom1',
    'adreça1',
    25000,
    5,
    973333333
  );
INSERT INTO
  clients VALUE(
    6,
    'nom1',
    'cognom1',
    'adreça1',
    25000,
    6,
    973333333
  );
INSERT INTO
  clients VALUEs(
    7,
    'nom1',
    'cognom1',
    'adreça1',
    17000,
    7,
    699999999
  );
INSERT INTO
  clients VALUE(
    8,
    'nom8',
    'cognom8',
    'adreça8',
    43000,
    8,
    733333333
  );
INSERT INTO
  locality VALUE(1, 'Sabadell', 1);
INSERT INTO
  locality VALUE(2, 'Manresa', 1);
INSERT INTO
  locality VALUE(3, 'Barcelona', 1);
INSERT INTO
  locality VALUE(4, 'Badalona', 1);
INSERT INTO
  locality VALUE(5, 'Lleida', 2);
INSERT INTO
  locality VALUE(6, 'Balaguer', 2);
INSERT INTO
  locality VALUE(7, 'Olot', 3);
INSERT INTO
  locality VALUE(8, 'Flix', 4);
  Llista quants productes del tipus 'begudes' s'han venut en una determinada localitats
  Llista quantes comandes ha efectuat un determinat empleat*/