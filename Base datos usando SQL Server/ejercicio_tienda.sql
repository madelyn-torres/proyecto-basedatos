USE tienda;

CREATE TABLE fabricante (
  id INT PRIMARY KEY identity,
  nombre VARCHAR(100) NOT NULL
);



CREATE TABLE producto (
  id INT PRIMARY KEY identity,
  nombre VARCHAR(100) NOT NULL,
  precio float NOT NULL,
  id_fabricante INT NOT NULL,
  FOREIGN KEY (id_fabricante) REFERENCES fabricante(id)
);

INSERT INTO fabricante VALUES('Asus');
INSERT INTO fabricante VALUES('Lenovo');
INSERT INTO fabricante VALUES('Hewlett-Packard');
INSERT INTO fabricante VALUES('Samsung');
INSERT INTO fabricante VALUES('Seagate');
INSERT INTO fabricante VALUES('Crucial');
INSERT INTO fabricante VALUES('Gigabyte');
INSERT INTO fabricante VALUES('Huawei');
INSERT INTO fabricante VALUES('Xiaomi');

select * from fabricante;


INSERT INTO producto VALUES('Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES('Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES('Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES('GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES('GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES('Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES('Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES('Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES('Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES('Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES('Impresora HP Laserjet Pro M26nw', 180, 3);


select nombre from producto;

select nombre, precio from producto;

select * from producto;

select nombre, precio*7, precio*9 from producto;

select nombre, precio*7 as dolares, precio*9 as euros from producto;

select UPPER(nombre), precio from producto;

select LOWER(nombre), precio from producto;

select UPPER(nombre), upper(SUBSTRING(nombre, 1,2)) from fabricante;

select nombre, ROUND(precio,2) from producto;

select nombre, FLOOR(precio) from producto;

select fabricante.id, fabricante.nombre from fabricante
select * from producto

select fabricante.id, fabricante.nombre from fabricante where
exists (select  id_fabricante from producto)

select distinct fabricante.id, fabricante.nombre 
from fabricante, producto
where fabricante.id = producto.id_fabricante order by id