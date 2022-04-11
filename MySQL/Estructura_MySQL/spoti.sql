DROP DATABASE IF EXISTS spotify;
CREATE DATABASE spotify;
USE spotify;

CREATE TABLE usuaris(
  id_usuari INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(50) NOT NULL,
  nom_usuari VARCHAR(50) NOT NULL,
  login VARCHAR(50) NOT NULL,
  data_naixement DATE NOT NULL,
  sexe VARCHAR(20) NOT NULL,
  pais VARCHAR(30) NOT NULL,
  cp INT NOT NULL,
  subscripcio ENUM('free', 'premium')
);

CREATE TABLE subscripcions_premium( 
  id_sp INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  data_sp DATE NOT NULL,
  data_renovacio DATE NOT NULL,
  forma_pagament ENUM('targeta', 'Paypal'),
  id_usuari INT NOT NULL,
  FOREIGN KEY(id_usuari) REFERENCES usuaris(id_usuari)
);
CREATE TABLE pagaments(
  id_pagar INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  data_pagament DATETIME NOT NULL,
  total_pagament FLOAT NOT NULL,
  id_sp INT NOT NULL,
  FOREIGN KEY(id_sp) REFERENCES subscripcions_premium(id_sp)
);

CREATE TABLE targetes(
    id_targeta INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    num_targeta INT NOT NULL,
    caducitat DATE NOT NULL,
    codi_seg INT NOT NULL,
    id_sp INT NOT NULL,
   FOREIGN KEY(id_sp) REFERENCES subscripcions_premium (id_sp)
);

CREATE TABLE paypal(
    id_paypal INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    usuari_paypal VARCHAR(30) NOT NULL,
	id_sp INT NOT NULL,   
   FOREIGN KEY(id_sp) REFERENCES subscripcions_premium (id_sp)
);

CREATE TABLE artistes(
    id_artista INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(49) NOT NULL,
    cover BLOB NOT NULL   
);

CREATE TABLE albums(
  id_album INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  titol VARCHAR(30) NOT NULL,
  any_publicacio YEAR NOT NULL,
  cover BLOB NOT NULL,
  id_artista INT NOT NULL,
  FOREIGN KEY(id_artista) REFERENCES artistes(id_artista)
);

CREATE TABLE playlist_activa(
    id_playlistA INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    titol VARCHAR(20) NOT NULL,
    nombre_songs INT NOT NULL,
    data_creacio TIMESTAMP,
     id_usuari INT NOT NULL,
    FOREIGN KEY(id_usuari) REFERENCES usuaris (id_usuari)
);
CREATE TABLE playlist_esborrada(
    id_playlistX INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    data_eliminacio TIMESTAMP,
    id_playlistA INT NOT NULL,
    FOREIGN KEY(id_playlistA) REFERENCES playlist_activa (id_playlistA)
);



CREATE TABLE songs(
    id_song INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    titol VARCHAR(25) NOT NULL,
    durada VARCHAR(10) NOT NULL,
    nombre_plays INT NOT NULL,
    id_album INT NOT NULL,
    FOREIGN KEY(id_album) REFERENCES albums (id_album)
);
CREATE TABLE songs_afegides(
    id_song_afegida INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    data_afegit TIMESTAMP NOT NULL,
    id_playlistA INT NOT NULL,
    id_usuari INT NOT NULL,
    id_song INT NOT NULL,
    FOREIGN KEY(id_playlistA) REFERENCES playlist_activa (id_playlistA),
    FOREIGN KEY(id_usuari) REFERENCES usuaris (id_usuari),
    FOREIGN KEY(id_song) REFERENCES songs (id_song)
);
CREATE TABLE artista_relacionat(
    id_artista_rel INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_artista1 INT NOT NULL,
    id_artista2 INT NOT NULL,
    FOREIGN KEY(id_artista1) REFERENCES artistes (id_artista),
    FOREIGN KEY(id_artista2) REFERENCES artistes (id_artista)
);
CREATE TABLE albums_preferits(
    id_album_prefe INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_usuari INT NOT NULL,
    id_album INT NOT NULL,
    FOREIGN KEY(id_usuari) REFERENCES usuaris (id_usuari),
    FOREIGN KEY(id_album) REFERENCES albums (id_album)
);
CREATE TABLE songs_prefererides(
    id_pref INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_usuari INT NOT NULL,
    id_song INT NOT NULL,
    FOREIGN KEY(id_usuari) REFERENCES usuaris (id_usuari),
    FOREIGN KEY(id_song) REFERENCES songs (id_song)
);