DROP DATABASE IF EXISTS youtube;
CREATE DATABASE youtube;
USE youtube;


/* De cada usuari guardem un identificador únic, email, password, nom d'usuari, data de naixement, sexe, país, 
codi postal. Un usuari publica vídeos. De cada vídeo guardem un identificador únic, un títol, una descripció, 
una grandària, el nom de l'arxiu de vídeo, durada del vídeo, un thumbnail, el nombre de reproduccions, 
el número de likes, el número de dislikes.
Un vídeo pot tenir tres estats diferents: públic, ocult i privat. Un vídeo pot tenir moltes etiquetes. 
Una etiqueta s'identifica per una Identificador únici un nom d'etiqueta. Interessa guardar qui és l'usuari que 
publica el vídeo i en quina data/hora el fa. Un usuari pot crear un canal. Un canal té un identificador únic, 
un nom, una descripció i una data de creació. Un usuari es pot subscriure als canals d'altres usuaris. 
Un usuari pot donar-li un like o un dislike a un vídeo una única vegada. Caldrà portar un registre dels usuaris 
que li han donat like i dislike a un determinat vídeo i en quina data/hora ho van fer. Un usuari pot crear 
playlists amb els vídeos que li agraden. Cada playlist té un identificador únic, un nom, una data de creació, 
i un estat que indica que pot ser pública o privada. Un usuari pot escriure comentaris en un vídeo determinat.
Cada comentari està identificat per un identificador únic, el text del comentari i la data/hora en la qual es va 
realitzar. Un usuari pot marcar un comentari com m'agrada o no m'agrada. Caldrà portar un registre dels usuaris que
 han marcat un comentari com m'agrada/no m'agrada, i en quina data/hora ho van fer.*/

CREATE TABLE usuari (
  idUs INT AUTO_INCREMENT PRIMARY KEY,
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

