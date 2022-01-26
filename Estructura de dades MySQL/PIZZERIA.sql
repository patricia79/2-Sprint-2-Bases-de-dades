DROP DATABASE IF EXISTS pizzeria;
CREATE DATABASE pizzeria;
USE pizzeria;
CREATE TABLE province (
  idProv INT AUTO_INCREMENT PRIMARY KEY,
  nameProv VARCHAR(100) NOT NULL
);
INSERT INTO
  province VALUE(1, 'Barcelona');
INSERT INTO
  province VALUE(2, 'Lleida');
INSERT INTO
  province VALUE(3, 'Girona');
INSERT INTO
  province VALUE(4, 'Tarragona');
CREATE TABLE locality (
    idLocal INT AUTO_INCREMENT PRIMARY KEY,
    nameLocal VARCHAR(100) NOT NULL,
    refProv INT NOT NULL,
    FOREIGN KEY (refProv) REFERENCES province (idProv)
  );
CREATE TABLE customer (
    idCust INT AUTO_INCREMENT PRIMARY KEY,
    name1 VARCHAR(40) NOT NULL,
    lastName VARCHAR(40) NOT NULL,
    adress VARCHAR(100) NOT NULL,
    postCode INT NOT NULL,
    telefon INT NOT NULL,
    idLocal INT NOT NULL,
    FOREIGN KEY (idLocal) REFERENCES locality (idLocal)
  );
CREATE TABLE store (
    idStore INT AUTO_INCREMENT PRIMARY KEY,
    adress VARCHAR(100) NOT NULL,
    postCode INT NOT NULL,
    telefon INT NOT NULL,
    idlocal INT NOT NULL,
    FOREIGN KEY (idLocal) REFERENCES locality (idLocal)
  );
CREATE TABLE employee (
    idEmployee INT AUTO_INCREMENT PRIMARY KEY,
    name1 VARCHAR(40) NOT NULL,
    lastName VARCHAR(40) NOT NULL,
    nif VARCHAR(100) NOT NULL,
    telefon INT NOT NULL,
    typeEmployee enum ('cook', 'delivery'),
    idStore INT NOT NULL,
    FOREIGN KEY (idStore) REFERENCES store (idStore)
  );
CREATE TABLE category (
    idCat INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nameCat VARCHAR(40) NOT NULL
  );

  CREATE TABLE pizza (
    idPizza INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    namePizza VARCHAR(40) NOT NULL
  );

   CREATE TABLE burguer (
    idPizza INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nameBurguer VARCHAR(40) NOT NULL
  );

   CREATE TABLE drink (
    idDrink INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nameDrink VARCHAR(40) NOT NULL
  );


CREATE TABLE order (
    idOrder INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    idCust INT NOT NULL,
    idStore INT NOT NULL,
    dataHora DATETIME,
    deliveryMethod enum ('store', 'delivery'),
    product enum('pizza', 'burguer', 'drink')
    totalPrice FLOAT NOT NULL,
    deliveryMan INT,
    FOREIGN KEY (idClients) REFERENCES clients (idClients),
    FOREIGN KEY (idStore) REFERENCES botiga (idStore),
    FOREIGN KEY (deliveryMan) REFERENCES employee (idEmployee)
  );
CREATE TABLE product (
    idProd INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nameP VARCHAR(40) NOT NULL,
    picture LONGBLOB,
    descript VARCHAR(60) NOT NULL,
    price FLOAT NOT NULL,
    idCat INT,
    FOREIGN KEY (idCat) REFERENCES category (idCat)
  );
  /*Llista quants productes del tipus 'begudes' s'han venut en una determinada localitat*/
  /*Llista quantes comandes ha efectuat un determinat empleat*/
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
  clients VALUE(
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