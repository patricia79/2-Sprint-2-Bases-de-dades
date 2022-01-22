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
  idUser INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  email VARCHAR(50) NOT NULL,
  epassword VARCHAR(10) NOT NULL,
  birth DATE,
  gender ENUM ('female', 'male'),
  country VARCHAR(50) NOT NULL,
  postalCode INT NOT NULL
);
CREATE TABLE video (
  idVideo INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(50) NOT NULL,
  descript VARCHAR(10) NOT NULL,
  size INT NOT NULL,
  nameFile VARCHAR(10) NOT NULL,
  duration INT NOT NULL,
  thumbnail BLOB,
  nRepro INT NOT NULL,
  likes INT NOT NULL,
  dislikes INT NOT NULL,
  estat ENUM ('public', 'ocult', 'privat') NOT NULL
);
CREATE TABLE tag (
  idTag INT AUTO_INCREMENT PRIMARY KEY,
  nameTag VARCHAR(50) NOT NULL,
  refprov INT NOT NULL,
  FOREIGN KEY (refprov) REFERENCES provincia (idprov)
);
FOREIGN KEY (idlocal) REFERENCES localitat (idlocal)
);
FOREIGN KEY (idClients) REFERENCES clients (idClients),
FOREIGN KEY (idbotiga) REFERENCES botiga (idbotiga),
FOREIGN KEY (repartidor) REFERENCES empleat (idempleat)