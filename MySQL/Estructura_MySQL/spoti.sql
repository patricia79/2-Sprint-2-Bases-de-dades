DROP DATABASE IF EXISTS spotify;
CREATE DATABASE spotify;
USE spotify;
CREATE TABLE usuaris(
  id_usuari int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  email varchar(50) NOT NULL,
  nom_usuari varchar(50) NOT NULL,
  login varchar(50) NOT NULL,
  data_naixament date NOT NULL,
  sexe varchar(20) NOT NULL,
  pais varchar(30) NOT NULL,
  cp int NOT NULL,
  subscripcio enum('gratis', 'premium')
);
CREATE TABLE subscripcions(
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  data_subscripcio date NOT NULL,
  data_renovacio date NOT NULL,
  tipus_pagament enum('credit card', 'Paypal'),
  user_id int NOT NULL,
  FOREIGN KEY(user_id) REFERENCES usuaris(id)
);
CREATE TABLE payments(
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  payment_date date NOT NULL,
  total float NOT NULL,
  subscription_id int NOT NULL,
  FOREIGN KEY(subscription_id) REFERENCES subscriptions(id)
);
CREATE TABLE credit_card(
  card_number int NOT NULL,
  exp_date date NOT NULL,
  sec_code int NOT NULL,
  payment_id int NOT NULL,
  FOREIGN KEY(payment_id) REFERENCES payments(id)
);
CREATE TABLE paypal(
  username varchar(30) NOT NULL,
  payment_id int NOT NULL,
  FOREIGN KEY(payment_id) REFERENCES payments(id)
);
CREATE TABLE playlists(
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  title varchar(30) NOT NULL,
  number_of_songs int NOT NULL,
  date_made date NOT NULL,
  status enum('active', 'erased'),
  user_id int NOT NULL,
  FOREIGN KEY(user_id) REFERENCES users(id)
);
CREATE TABLE artists(
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  artist_name varchar(30) NOT NULL,
  cover blob NOT NULL
);
CREATE TABLE albums(
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  title varchar(30) NOT NULL,
  release_year year NOT NULL,
  cover blob NOT NULL,
  artist_id int NOT NULL,
  FOREIGN KEY(artist_id) REFERENCES artists(id)
);
CREATE TABLE songs(
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  title varchar(30) NOT NULL,
  date_added date NOT NULL,
  song_length int NOT NULL,
  number_played int NOT NULL,
  user_id int NOT NULL,
  album_id int NOT NULL,
  artist_id int NOT NULL,
  FOREIGN KEY(user_id) REFERENCES users(id),
  FOREIGN KEY(album_id) REFERENCES albums(id),
  FOREIGN KEY(artist_id) REFERENCES artists(id)
);