
DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda CHARACTER SET utf8mb4;
USE tienda;

CREATE TABLE fabricante (
    codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE producto (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio DOUBLE NOT NULL,
  codigo_fabricante INT UNSIGNED NOT NULL,
  FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo)
);

INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');

INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

# Queries

# 1 Llista el nom de tots els productos que hi ha en la taula producto.
SELECT nombre FROM producto;
 
# 2 Llista els noms i els preus de tots els productos de la taula producto.
SELECT nombre, precio FROM producto;

#3 Llista totes les columnes de la taula producto.
SELECT * FROM producto;

#4 Llista el nom dels productos, el preu en euros i el preu en dòlars estatunidencs (USD).
SELECT nombre, precio, precio * 1.13 FROM producto;

/*5 Llista el nom dels productos, el preu en euros i el preu en dòlars estatunidencs (USD). 
Utilitza els següents àlies per a les columnes: nom de producto, euros, dolars.*/

SELECT nombre AS nom_de_producto, precio AS euros, precio * 1.088 AS dolars FROM producto;

#6 Llista els noms i els preus de tots els productos de la taula producto, convertint els noms a majúscula.
SELECT UPPER(nombre), precio FROM producto;

#7 Llista els noms i els preus de tots els productos de la taula producto, convertint els noms a minúscula.
SELECT LOWER(nombre), precio FROM producto;

/*8 Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules els dos primers caràcters 
del nom del fabricant.*/
SELECT nombre, LEFT(UPPER(nombre), 2) FROM fabricante;

#9 Llista els noms i els preus de tots els productos de la taula producto, arrodonint el valor del preu.
SELECT nombre, ROUND(precio) AS 'PREU APROX' FROM producto;

/*10 Llista els noms i els preus de tots els productos de la taula producto, truncant el valor del preu per a mostrar-lo sense 
cap xifra decimal.*/
SELECT nombre, TRUNCATE(precio, 0) FROM producto;

#11 Llista el codi dels fabricants que tenen productos en la taula producto.
SELECT codigo_fabricante FROM producto ORDER BY codigo_fabricante;

#12 Llista el codi dels fabricants que tenen productos en la taula producto, eliminant els codis que apareixen repetits.
SELECT DISTINCT codigo_fabricante FROM producto ORDER BY codigo_fabricante;

#13 Llista els noms dels fabricants ordenats de manera ascendent.
SELECT nombre FROM fabricante ORDER BY nombre;

#14 Llista els noms dels fabricants ordenats de manera descendent.
SELECT nombre FROM fabricante ORDER BY nombre DESC;

#15 Llista els noms dels productos ordenats en primer lloc pel nom de manera ascendent i en segon lloc pel preu de manera descendent.
SELECT nombre FROM producto ORDER BY nombre, precio DESC;

#16 Retorna una llista amb les 5 primeres files de la taula fabricante.
SELECT * FROM fabricante LIMIT 5;

#17 Retorna una llista amb 2 files a partir de la quarta fila de la taula fabricante. La quarta fila també s'ha d'incloure en la resposta.
SELECT * FROM fabricante LIMIT 3, 2;

/*18 Llista el nom i el preu del producto més barat. (Utilitzi solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar 
MIN(preu), necessitaria GROUP BY*/
SELECT nombre, precio FROM producto ORDER BY precio LIMIT 1;

/*19 Llista el nom i el preu del producto més car. (Utilitzi solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MAX(preu), 
necessitaria GROUP BY.*/
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;

#20 Llista el nom de tots els productos del fabricant el codi de fabricant del qual és igual a 2.
SELECT nombre FROM fabricante WHERE codigo = 2;

#21 Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades.
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante
ORDER BY producto.nombre;

/*22 Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. Ordeni el resultat 
pel nom del fabricador, per ordre alfabètic.*/
SELECT fabricante.nombre, producto.precio, producto.nombre FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante
ORDER BY fabricante.nombre;

/*23 Retorna una llista amb el codi del producte, nom del producte, codi del fabricador i nom del fabricador, de tots els productes de 
la base de dades. NO FUNCIONA- REPASAR
SELECT producto.codigo,producto.nombre, fabricante.nombre FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante
ORDER BY producto.codigo*/

#24 Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més barat.
SELECT prod.nombre, precio, fab.nombre FROM producto prod INNER JOIN fabricante fab ON prod.codigo_fabricante = fab.codigo ORDER BY precio ASC LIMIT 1;

#25 Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més car.
SELECT prod.nombre, precio, fab.nombre FROM producto prod INNER JOIN fabricante fab ON prod.codigo_fabricante = fab.codigo ORDER BY precio DESC LIMIT 1;

#26 Retorna una llista de tots els productes del fabricador Lenovo.
SELECT prod.* FROM producto prod INNER JOIN fabricante fab ON fab.codigo = prod.codigo_fabricante WHERE fab.nombre = 'Lenovo';

#27 Retorna una llista de tots els productes del fabricant Crucial que tinguin un preu major que 200€.
SELECT prod.* FROM producto prod JOIN fabricante fab ON fab.codigo = prod.codigo_fabricante WHERE fab.nombre = 'Crucial' AND prod.precio > 200;

#28 Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packard i Seagate. Sense utilitzar l'operador IN.
SELECT prod.* FROM producto prod JOIN fabricante fab ON fab.codigo = prod.codigo_fabricante WHERE fab.nombre = 'Asus' OR fab.nombre = 'Hewlett-Packard' OR fab.nombre = 'Seagate';

#29 Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packard i Seagate. Utilitzant l'operador IN.

SELECT prod.* FROM producto prod JOIN fabricante fab ON fab.codigo = prod.codigo_fabricante WHERE fab.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');

#30 Retorna un llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la vocal e.
SELECT prod.nombre, prod.precio FROM producto prod JOIN fabricante fab ON prod.codigo_fabricante = fab.codigo WHERE fab.nombre LIKE '%e';

#31 Retorna un llistat amb el nom i el preu de tots els productes el nom de fabricant dels quals contingui el caràcter w en el seu nom.
SELECT prod.nombre, prod.precio FROM producto prod JOIN fabricante fab ON prod.codigo_fabricante = fab.codigo WHERE fab.nombre LIKE '%w%';

/*32 Retorna un llistat amb el nom de producte, preu i nom de fabricant, de tots els productes que tinguin un preu major o igual a 180€. 
Ordeni el resultat en primer lloc pel preu (en ordre descendent) i en segon lloc pel nom (en ordre ascendent)*/
SELECT prod.nombre AS nombre_producto, prod.precio AS precio_producto, fab.nombre AS nombre_fabricante FROM producto prod JOIN fabricante fab ON prod.codigo_fabricante = fab.codigo WHERE precio >= 180 ORDER BY precio DESC, prod.nombre ASC;

#33 Retorna un llistat amb el codi i el nom de fabricant, solament d'aquells fabricants que tenen productes associats en la base de dades.
SELECT DISTINCT fab.* FROM fabricante fab JOIN producto prod ON fab.codigo = prod.codigo_fabricante;

/*34 Retorna un llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que té cadascun d'ells. 
El llistat haurà de mostrar també aquells fabricants que no tenen productes associats.*/
SELECT fab.nombre AS fabricante, prod.nombre AS producto FROM fabricante fab  LEFT JOIN producto prod ON prod.codigo_fabricante = fab.codigo;

#35 Retorna un llistat on només apareguin aquells fabricants que no tenen cap producte associat.
SELECT fab.nombre, prod.nombre FROM fabricante fab  LEFT JOIN producto prod ON prod.codigo_fabricante = fab.codigo  WHERE prod.codigo is NULL;

#36 Retorna tots els productes del fabricador Lenovo. (Sense utilitzar INNER JOIN).
SELECT fab.nombre, prod.nombre FROM fabricante fab, producto prod WHERE prod.codigo_fabricante = fab.codigo AND fab.nombre = 'Lenovo';

/*37 Retorna totes les dades dels productes que tenen el mateix preu que el producte més car del fabricador Lenovo. (Sense utilitzar 
INNER JOIN).*/

SELECT * FROM producto WHERE precio = (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));

#38 Llista el nom del producte més car del fabricador Lenovo.
SELECT nombre FROM producto prod WHERE prod.precio = (SELECT MAX(prod.precio) FROM producto prod 
WHERE prod.codigo_fabricante = (SELECT fab.codigo FROM fabricante fab WHERE fab.nombre = 'Lenovo'));

#39 Llista el nom del producte més barat del fabricant Hewlett-Packard.
SELECT nombre FROM producto prod WHERE prod.precio = (SELECT MIN(prod.precio) FROM producto prod 
WHERE prod.codigo_fabricante = (SELECT fab.codigo FROM fabricante fab WHERE fab.nombre = 'Hewlett-Packard'));
