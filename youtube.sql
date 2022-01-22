DROP DATABASE IF EXISTS youtube;
CREATE DATABASE youtube;
USE youtube;

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
  descript VARCHAR(100) NOT NULL,
  size INT NOT NULL,
  nameFile VARCHAR(10) NOT NULL,
  duration INT NOT NULL,
  thumbnail BLOB,
  nRepro INT NOT NULL,
  typeVideo ENUM ('public', 'hidden', 'private') NOT NULL,
  createDate DATETIME NOT NULL,
  idUser INT NOT NULL,
  FOREIGN KEY (idUser) REFERENCES usuari (idUser)
);
CREATE TABLE tag (
  idTag INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  nameTag VARCHAR(50) NOT NULL,
  idVideo INT NOT NULL,
  FOREIGN KEY (idVideo) REFERENCES video (idVideo)
);
CREATE TABLE channel (
  idChannel INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  nameChannel VARCHAR(50) NOT NULL,
  descript VARCHAR(100),
  createDate DATETIME NOT NULL,
  idUser INT NOT NULL,
  FOREIGN KEY (idUser) REFERENCES usuari (idUser)
);
CREATE TABLE subscription (
  idChannel INT NOT NULL,
  idUser INT NOT NULL,
  FOREIGN KEY (idUser) REFERENCES usuari (idUser),
  FOREIGN KEY (idChannel) REFERENCES channel (idChannel)
);
CREATE TABLE video_like_dislike (
  type_like ENUM ('like', 'dislike'),
  createDate DATETIME NOT NULL,
  idVideo INT NOT NULL,
  idUser INT NOT NULL,
  FOREIGN KEY (idUser) REFERENCES usuari (idUser),
  FOREIGN KEY (idVideo) REFERENCES video (idVideo)
);
CREATE TABLE playlists (
  idPlaylist INT AUTO_INCREMENT PRIMARY KEY,
  namePlaylist VARCHAR(10) NOT NULL,
  typePlaylist ENUM ('public', 'private'),
  createDate DATETIME NOT NULL,
  idVideo INT NOT NULL,
  idUser INT NOT NULL,
  FOREIGN KEY (idUser) REFERENCES usuari (idUser),
  FOREIGN KEY (idVideo) REFERENCES video (idVideo)
);
CREATE TABLE comments (
  idComment INT AUTO_INCREMENT PRIMARY KEY,
  commentText VARCHAR(100) NOT NULL,
  createDate DATETIME NOT NULL,
  idVideo INT NOT NULL,
  idUser INT NOT NULL,
  FOREIGN KEY (idUser) REFERENCES usuari (idUser),
  FOREIGN KEY (idVideo) REFERENCES video (idVideo)
);
CREATE TABLE comment_like_dislike (
  type_like ENUM ('like', 'dislike'),
  createDate DATETIME NOT NULL,
  idComment INT NOT NULL,
  idUser INT NOT NULL,
  FOREIGN KEY (idUser) REFERENCES usuari (idUser),
  FOREIGN KEY (idComment) REFERENCES comments (idComment)
);