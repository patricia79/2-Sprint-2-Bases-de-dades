DROP DATABASE IF EXISTS spotify;
CREATE DATABASE spotify;
USE spotify;
CREATE TABLE free_user (
  id_free_user INT AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(100) NOT NULL,
  pasword_free VARCHAR(100) NOT NULL,
  name_free VARCHAR(100) NOT NULL
  
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
  carrec enum ('cuinera', 'repartidora'),
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

CREATE TABLE comandes (																											
 idcomanda INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 idclient INT NOT NULL,   
 idbotiga INT NOT NULL,
 data_hora DATETIME,
 mètode_entrega enum ('botiga', 'domicili'),
 preu_total FLOAT NOT NULL,  
 id_treballador INT NOT NULL,
 idburger INT NOT NULL,
 idpizza INT NOT NULL,
 idbeguda INT NOT NULL, 
 
 FOREIGN KEY (idburger) REFERENCES burgers (idburger),
 FOREIGN KEY (idpizza) REFERENCES pizzes (idpizza),
 FOREIGN KEY (idbeguda) REFERENCES begudes (idbeguda),
 FOREIGN KEY (idclient) REFERENCES clients (idclient),
 FOREIGN KEY (idbotiga) REFERENCES botigues (idbotiga),
  FOREIGN KEY (id_treballador) REFERENCES treballadors (id_treballador)
 );
 CREATE TABLE productes_demanats(
  idprod_com INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  producte enum ('pizzes', 'burger', 'begudes'),
  idburger INT NOT NULL,
  idpizza INT NOT NULL,
  idbeguda INT NOT NULL,
  idcomanda INT NOT NULL,
  FOREIGN KEY (idburger) REFERENCES burgers (idburger),
  FOREIGN KEY (idpizza) REFERENCES pizzes (idpizza),
  FOREIGN KEY (idbeguda) REFERENCES begudes (idbeguda),
  FOREIGN KEY (idcomanda) REFERENCES comandes (idcomanda)
);
 
 CREATE TABLE domicilis (
 idprod_com INT NOT NULL,
 data_hora DATETIME,
 preu_total FLOAT NOT NULL,  
 id_repartidor INT NOT NULL,
 
  FOREIGN KEY (id_repartidor) REFERENCES treballadors (id_treballador),
  FOREIGN KEY (idprod_com) REFERENCES productes_demanats (idprod_com)
 );




INSERT INTO clients (idclient, nomclient, cognom, adress, codipostal, telefon, idLocal)
VALUES (1, 'Cristina', 'Puig', 'Carrer Cristina Puig 1', 08000, 111111111, 1);
INSERT INTO clients (idclient, nomclient, cognom, adress, codipostal, telefon, idLocal)
VALUES (2, 'Pilar', 'Rahola', 'Carrer Pilar Rahola 2', 25000, 222222222, 2);
INSERT INTO clients (idclient, nomclient, cognom, adress, codipostal, telefon, idLocal)
VALUES (3, 'Montserrat', 'Roig', 'Carrer Montserrat Roig 3', 17000, 333333333, 3);
INSERT INTO clients (idclient, nomclient, cognom, adress, codipostal, telefon, idLocal)
VALUES (4, 'Helena', 'Garcia', 'Carrer Helena Garcia 4', 43000, 444444444, 4);
  
INSERT INTO botigues (idbotiga, adress, codipostal, telefon, idlocal)
VALUES (1, 'Carrer Botiga 1', 08000, 111111111, 1);
INSERT INTO botigues (idbotiga, adress, codipostal, telefon, idlocal)
VALUES (2, 'Carrer Botiga 2', 25000, 222222222, 2);
INSERT INTO botigues (idbotiga, adress, codipostal, telefon, idlocal)
VALUES (3, 'Carrer Botiga 3', 17000, 333333333, 3);
INSERT INTO botigues (idbotiga, adress, codipostal, telefon, idlocal)
VALUES (4, 'Carrer Botiga 4', 43000, 444444444, 4);   
    
INSERT INTO treballadors (id_treballador, nom, cognom, nif, telefon, carrec, idbotiga)
VALUES (1, 'Emma', 'Puig', '11111111A', 111111111, 'cuinera', 1);
INSERT INTO treballadors (id_treballador, nom, cognom, nif, telefon, carrec, idbotiga)
VALUES (2, 'Imma', 'Puig', '22222222A', 222222222, 'repartidora', 2); 
INSERT INTO treballadors (id_treballador, nom, cognom, nif, telefon, carrec, idbotiga)
VALUES (3, 'Clara', 'Puig','33333333C', 333333333, 'cuinera', 3);
INSERT INTO treballadors (id_treballador, nom, cognom, nif, telefon, carrec, idbotiga)
VALUES (4, 'Pepa', 'Puig','44444444C', 444444444, 'repartidora', 4);   

INSERT INTO categories (idCat, nameCat)
VALUES (1, 'categoria1');
INSERT INTO categories (idCat, nameCat)
VALUES (2, 'categoria2');
INSERT INTO categories (idCat, nameCat)
VALUES (3, 'categoria3');
INSERT INTO categories (idCat, nameCat)
VALUES (4, 'categoria4');

INSERT INTO pizzes( idpizza, nompizza, imatge, descripcio, preu, idCat)
VALUES (1, 'pizza1', 'imatge1', 'descripcio1', 10, 1); 
INSERT INTO pizzes( idpizza, nompizza, imatge, descripcio, preu, idCat)
VALUES (2, 'pizza2', 'imatge2', 'descripcio2', 10, 2); 
INSERT INTO pizzes( idpizza, nompizza, imatge, descripcio, preu, idCat)
VALUES (3, 'pizza3', 'imatge3', 'descripcio3', 10, 3); 
INSERT INTO pizzes( idpizza, nompizza, imatge, descripcio, preu, idCat)
VALUES (4, 'pizza4', 'imatge4', 'descripcio4', 10, 4); 

INSERT INTO burgers (idburger, nom_burger, imatge, descripcio, preu)
VALUES (1, 'burger1', 'imatge1', 'descripcio1', 10); 
INSERT INTO burgers (idburger, nom_burger, imatge, descripcio, preu)
VALUES (2, 'burger2', 'imatge2', 'descripcio2', 10); 
INSERT INTO burgers (idburger, nom_burger, imatge, descripcio, preu)
VALUES (3, 'burger3', 'imatge3', 'descripcio3', 10); 
INSERT INTO burgers (idburger, nom_burger, imatge, descripcio, preu)
VALUES (4, 'burger4', 'imatge4', 'descripcio4', 10); 

INSERT INTO begudes (idbeguda, nom_beguda, imatge, descripcio, preu)
VALUES (1, 'beguda1', 'imatge1', 'descripcio1', 10); 
INSERT INTO begudes (idbeguda, nom_beguda, imatge, descripcio, preu)
VALUES (2, 'beguda2', 'imatge2', 'descripcio2', 10); 
INSERT INTO begudes (idbeguda, nom_beguda, imatge, descripcio, preu)
VALUES (3, 'beguda3', 'imatge3', 'descripcio3', 10); 
INSERT INTO begudes (idbeguda, nom_beguda, imatge, descripcio, preu)
VALUES (4, 'beguda4', 'imatge4', 'descripcio4', 10); 

INSERT INTO comandes (idcomanda, idclient, idbotiga, data_hora, mètode_entrega, preu_total, id_treballador, idpizza, idburger, idbeguda)
VALUES (1, 1, 1, '2022-01-10','domicili', 30, 1, 1, 1, 1); 

INSERT INTO productes_demanats(idprod_com, producte, idburger, idpizza, idbeguda, idcomanda)
VALUES (1, 1, 1, 1, 1, 1); 
 
INSERT INTO domicilis (idprod_com,  data_hora, preu_total, id_repartidor)
VALUES (1,'2022-01-10', 30, 1); 

  /*Llista quants productes del tipus 'begudes' s'han venut en una determinada localitats
  Llista quantes comandes ha efectuat un determinat empleat*/

