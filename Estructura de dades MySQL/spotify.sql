DROP DATABASE IF EXISTS spotify;
CREATE DATABASE spotify;
USE spotify;

/*
Existeixen dos tipus d'usuaris: usuari free i usuari premium. De cada usuari guardem un identificador únic, email,
 password, nom d'usuari, data de naixement, sexe, país, codi postal.
Els usuaris premium realitzen subscripcions. Les dades necessàries que caldrà guardar per a cada subscripció són: 
data d'inici de la subscripció, data de renovació del servei i una forma de pagament, que pot ser mitjançant targeta
 de crèdit o PayPal.
De les targetes de crèdit guardem el número de targeta, mes i any de caducitat i el codi de seguretat. 
Dels usuaris que paguen amb PayPal guardem el nom d'usuari de PayPal. Ens interessa portar un registre de tots 
els pagaments que un usuari premium ha anat realitzant durant el període que està subscrit. De cada pagament es 
guarda la data, un número d'ordre (que és únic) i un total.
Un usuari pot crear moltes playlists. De cada playlist guardem un títol, el nombre de cançons que conté, 
un identificador únic i una data de creació. Quan un usuari esborra una playlist no s'esborra del sistema, sinó que
 es marca com que ha estat eliminada. D'aquesta manera l'usuari pot tornar a recuperar els seus playlists en cas 
 que les hagi eliminat per error. És necessari emmagatzemar la data en la qual uneixi playlist ha estat marcada com 
 eliminada.
Podem dir que existeixen dos tipus de playlists: actives i esborrades. Una playlist que està activa pot ser 
compartida amb altres usuaris, això vol dir que altres usuaris poden afegir cançons en ella. En una llista 
compartida ens interessa saber quin usuari ha estat el que ha afegit cada cançó i en quina data ho va fer. 
Una cançó només pot pertànyer a un únic àlbum. Un àlbum pot contenir moltes cançons. Un àlbum ha estat publicat
 per un únic artista. Un artista pot haver publicat molts àlbums. De cada cançó guardem un identificador únic, un 
 títol, una durada i el nombre de vegades que ha estat reproduïda pels usuaris de Spotify.
De cada àlbum guardem un identificador únic, títol, any de publicació i una imatge amb la portada. 
De cada artista guardem un identificador únic, nom i una imatge de l'artista. Un usuari pot seguir a molts artistes.
 Un artista pot estar relacionat amb altres artistes que facin música semblant. De manera que Spotify pugui 
 mostrar-nos un llistat d'artistes relacionats amb els artistes que ens agraden. També ens interessa guardar 
 quins són els àlbums i les cançons favorites d'un usuari. Un usuari pot seleccionar molts àlbums i moltes cançons
  com a favorites.
*/

CREATE TABLE provincia (
  idprov INT AUTO_INCREMENT PRIMARY KEY,
  nom VARCHAR(100) NOT NULL
);
INSERT INTO
  provincia VALUE(1, 'Barcelona' 08);
INSERT INTO
  provincia VALUE(2, 'Lleida' 25);
INSERT INTO
  provincia VALUE(3, 'Girona' 17);
INSERT INTO
  provincia VALUE(4, 'Tarragona' 43);
CREATE TABLE localitat (
    idlocal INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    refprov INT NOT NULL,
    FOREIGN KEY (refprov) REFERENCES provincia (idprov)
  );
INSERT INTO
  localitat VALUE(1, 'Sabadell', 1);
INSERT INTO
  localitat VALUE(2, 'Manresa', 1);
INSERT INTO
  localitat VALUE(3, 'Barcelona', 1);
INSERT INTO
  localitat VALUE(4, 'Badalona', 1);
INSERT INTO
  localitat VALUE(5, 'Lleida', 2);
INSERT INTO
  localitat VALUE(6, 'Balaguer', 2);
INSERT INTO
  localitat VALUE(7, 'Olot', 3);
INSERT INTO
  localitat VALUE(8, 'Flix', 4);
CREATE TABLE clients (
    idClients INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(40) NOT NULL,
    cognom VARCHAR(40) NOT NULL,
    adre ç a VARCHAR(100) NOT NULL,
    codiPostal INT NOT NULL,
    idlocal INT NOT NULL,
    telefon INT NOT NULL,
    FOREIGN KEY (idlocal) REFERENCES localitat (idlocal)
  );
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
CREATE TABLE botiga (
    idbotiga INT AUTO_INCREMENT PRIMARY KEY,
    adre ç a VARCHAR(100) NOT NULL,
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
    repartidor INT,
    FOREIGN KEY (idClients) REFERENCES clients (idClients),
    FOREIGN KEY (idbotiga) REFERENCES botiga (idbotiga),
    FOREIGN KEY (repartidor) REFERENCES empleat (idempleat)
  );
CREATE TABLE producte (
    idprod INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(40) NOT NULL,
    imatge LONGBLOB,
    descripci ó VARCHAR(60) NOT NULL,
    preu FLOAT NOT NULL,
    idcat INT,
    FOREIGN KEY (idcat) REFERENCES categoria (idcat)
  );