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
  carrec enum ('cuinera', 'repartidora'),
  idbotiga INT NOT NULL,
  FOREIGN KEY (idbotiga) REFERENCES botigues (idbotiga)
);
CREATE TABLE categories (
  idCat INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nameCat VARCHAR(40) NOT NULL
);
CREATE TABLE productes (
  id_producte INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  tipus_producte ENUM ('beguda', 'pizza', 'burger'),
  nom VARCHAR(40) NOT NULL,
  imatge LONGBLOB,
  descripcio VARCHAR(60) NOT NULL,
  preu FLOAT NOT NULL,
  idCat INT ,
  FOREIGN KEY (idCat) REFERENCES categories (idCat)
);
CREATE TABLE comandes (																											
 idcomanda INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 idclient INT NOT NULL,   
 idbotiga INT NOT NULL,
 data_hora DATETIME,
 mètode_entrega enum ('botiga', 'domicili'),
 preu_total INT NOT NULL,
 repartidor INT ,
 FOREIGN KEY (idclient) REFERENCES clients (idclient),
 FOREIGN KEY (idbotiga) REFERENCES botigues (idbotiga),
  FOREIGN KEY (repartidor) REFERENCES treballadors (id_treballador)
 );
 CREATE TABLE productes_demanats(
  idprod_com INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  id_producte INT NOT NULL,
  idcomanda INT NOT NULL,
  FOREIGN KEY (id_producte) REFERENCES productes (id_producte),
  FOREIGN KEY (idcomanda) REFERENCES comandes (idcomanda)
);
 
INSERT INTO provincies (idProv, nomProv)
VALUES (1, 'Barcelona'),
(2, 'Lleida'),
(3, 'Girona'),
(4, 'Tarragona');
INSERT INTO localitats (idLocal, nomLocal, idProv)
VALUES (1,'Igualada',1),
(2, 'Balaguer',2),
(3,' Cadaqués' ,3),
(4, 'Flix' ,4),
(5, 'Flix' ,4),
(6, 'Igualada' ,1),
(7, 'Igualada',1),
(8, 'Igualada',1),
(9, 'Igualada' ,1),
(10, 'Balaguer' ,2),
(11, 'Balaguer' ,2),
(12, 'Cadaqués' ,3),
(13, 'Cadaqués' ,3);
INSERT INTO clients (idclient, nomclient, cognom, adress, codipostal, telefon, idLocal)
VALUES (1, 'Cristina', 'Puig', 'Carrer Cristina Puig 1', 08000, 111111111, 1),
(2, 'Pilar', 'Rahola', 'Carrer Pilar Rahola 2', 25000, 222222222, 2),
(3, 'Montserrat', 'Roig', 'Carrer Montserrat Roig 3', 17000, 333333333, 3),
(4, 'Helena', 'Garcia', 'Carrer Helena Garcia 4', 43000, 444444444, 4);
  
INSERT INTO botigues (idbotiga, adress, codipostal, telefon, idlocal)
VALUES (1, 'Carrer Botiga 1', 08000, 111111111, 1),
(2, 'Carrer Botiga 2', 25000, 222222222, 2),
(3, 'Carrer Botiga 3', 17000, 333333333, 3),
(4, 'Carrer Botiga 4', 43000, 444444444, 4);   
    
INSERT INTO treballadors (id_treballador, nom, cognom, nif, telefon, carrec, idbotiga)
VALUES (1, 'Emma', 'Puig', '11111111A', 111111111, 'cuinera', 1),
(2, 'Imma', 'Puig', '22222222A', 222222222, 'repartidora', 1),
(3, 'Clara', 'Puig','33333333C', 333333333, 'cuinera', 2),
(4, 'Pepa', 'Puig','44444444C', 444444444, 'repartidora', 2),
(5, 'Laura', 'Puig', '55555555A', 555555555, 'cuinera', 3),
(6, 'Kika', 'Puig', '66666666A', 666666666, 'repartidora', 3),
(7, 'Lia', 'Puig','77777777A', 777777777, 'cuinera', 4),
(8, 'Anna', 'Puig','88888888A', 888888888, 'repartidora', 4);
 
INSERT INTO categories (idCat, nameCat)
VALUES (1, 'categoria1'),
(2, 'categoria2'),
(3, 'categoria3'),
(4, 'categoria4');
INSERT INTO productes (id_producte, tipus_producte, nom, imatge, descripcio, preu, idCat) 
VALUES (1, 'beguda', 'cola', 'imatge1', 'descripcio', 2.50, null),
(2,'beguda', 'cola', 'imatge1', 'descripcio', 2.50, null),
(3, 'beguda', 'suc', 'imatge1', 'descripcio', 2.50, null),
(4,'beguda', 'suc', 'imatge1', 'descripcio', 2.50, null),
(5,'beguda', 'aigua', 'imatge1', 'descripcio', 2.50, null),
(6,'beguda', 'aigua', 'imatge1', 'descripcio', 2.50, null),
(7,'pizza', 'carbonara', 'imatge1', 'descripcio', 10, 1),
(8,'pizza', 'hawaiana', 'imatge1', 'descripcio', 10, 2),
(9,'pizza', 'vegana', 'imatge1', 'descripcio', 10, 3),
(10,'pizza', 'tonyina', 'imatge1', 'descripcio', 10, 4),
(11,'pizza', 'barbacoa', 'imatge1', 'descripcio', 10, 4),
(12,'burger', 'pollastre', 'imatge1', 'descripcio', 5, null),
(13,'burger', 'vegana', 'imatge1', 'descripcio', 5, null),
(14,'burger', 'completa', 'imatge1', 'descripcio', 5, null),
(15,'burger', 'bacon-ceba', 'imatge1', 'descripcio', 5, null),
(16,'burger', 'doble formatge', 'imatge1', 'descripcio', 5, null);
INSERT INTO comandes (idcomanda, idclient, idbotiga, data_hora, mètode_entrega, preu_total, repartidor)
VALUES (1, 1, 1, '2022-01-10 20:04:05','botiga', 30, null), 
(2, 1, 1, '2022-01-11 21:04:05','domicili', 25, 2), 
(3, 1, 1, '2022-01-12 20:04:05','domicili', 35, 2), 
(4, 2, 2, '2022-01-13 20:04:05','botiga', 35, null ), 
(5, 2, 2, '2022-01-14 20:04:05','domicili', 20, 4), 
(6, 2, 2, '2022-01-15 20:04:05','domicili', 15, 4), 
(7, 3, 3, '2022-01-16 20:04:05','botiga', 25, null), 
(8, 3, 3, '2022-01-17 20:04:05','domicili', 30, 6), 
(9, 3, 3, '2022-01-18 20:04:05','domicili', 35, 6), 
(10, 4, 4, '2022-01-19 20:04:05','botiga', 40, null), 
(11, 4,4, '2022-01-20 20:04:05','domicili', 20, 8), 
(12, 4, 4, '2022-01-21 20:04:05','domicili', 30, 8);
INSERT INTO productes_demanats(idprod_com, id_producte, idcomanda)
VALUES (1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 2),
(6, 6, 2),
(7, 7, 2),
(8, 8, 2),
(9, 9, 3),
(10, 10, 3),
(11, 11, 3),
(12, 12, 3),
(13, 13, 4),
(14, 14, 4),
(15, 15, 4),
(16, 16, 4);

# Query 1

 /*Llista quants productes del tipus 'begudes' s'han venut en una determinada localitat
SELECT COUNT(*) FROM pizzeria.productes WHERE tipus_producte = 'beguda' AND  nomProv= 'Barcelona' ;*/

# Query 2

/* Llista quantes comandes ha efectuat un determinat empleat */
SELECT DISTINCT idcomanda FROM comandes WHERE repartidor = 8;