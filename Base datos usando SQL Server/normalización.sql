create database normalizacion

use normalizacion

CREATE TABLE autor(
idautor int identity primary key, 
nombre varchar(25))

CREATE TABLE editoriales(
ideditoriales int identity primary key,
editorial varchar(25))

CREATE TABLE prestatario(
idprestatario int identity primary key,
apellido varchar(25),
nombre varchar(25))

select * from autor
select * from editoriales
select * from prestatario

insert into editoriales (editorial) values ('McGraw Hill') 
insert into editoriales (editorial) values ('Anaya') 
insert into editoriales (editorial) values ('Oracle Corp') 

insert into autor (nombre) values ('Murray Spiegel')
insert into autor (nombre) values ('E. Petroustsos')
insert into autor (nombre) values ('Nancy Greenberg')
insert into autor (nombre) values ('Ramalho')

insert into prestatario (apellido , nombre) values ('Pérez Gomez' , 'Juan')
insert into prestatario (apellido , nombre) values ('Rios Teran' , 'Ana')
insert into prestatario (apellido , nombre) values ('Roca' , 'Rene')
insert into prestatario (apellido , nombre) values ('Garcia Roque' , 'Luis')

CREATE TABLE libros(
codlibro int primary key,
titulo varchar(25),
idautor int, 
foreign key (idautor) references autor(idautor),
ideditoriales int, 
foreign key (ideditoriales) references editoriales(ideditoriales)
)

select * from libros

insert into libros (codlibro, titulo, idautor, ideditoriales) 
values (1001, 'Variable Compleja', 1,1)
insert into libros (codlibro, titulo, idautor, ideditoriales) 
values (1004, 'Visual Basic',2,2)
insert into libros (codlibro, titulo, idautor, ideditoriales) 
values (1005, 'Estadística', 1,1)
insert into libros (codlibro, titulo, idautor, ideditoriales) 
values (1006, 'Oracle University', 1,1)
insert into libros (codlibro, titulo, idautor, ideditoriales) 
values (1007, 'Estadística', 1,1)

CREATE TABLE prestamos(
idprestamo int identity primary key, 
codlibro int,
foreign key (codlibro) references libros(codlibro),
idprestatario int,
foreign key (idprestatario) references prestatario(idprestatario),
fecha date)

insert into prestamos (codlibro, idprestatario, fecha) values (1001,1,'04/15/2014' )
insert into prestamos (codlibro, idprestatario, fecha) values (1004,2,'04/17/2014' )
insert into prestamos (codlibro, idprestatario, fecha) values (1005,3,'04/16/2014' )
insert into prestamos (codlibro, idprestatario, fecha) values (1006,4,'04/20/2014')
insert into prestamos (codlibro, idprestatario, fecha) values (1007,1,'04/18/2014' )

create procedure consulta as
select libros.codlibro as codlibro, libros.titulo as Titulo, autor.nombre as Autor, editoriales.editorial as Editoriales, 
prestatario.apellido  as Apellido, prestatario.nombre as Nombre, prestamos.fecha
from prestamos 
inner join libros on prestamos.codlibro = libros.codlibro 
inner join autor on autor.idautor = libros.idautor
inner join editoriales on editoriales.ideditoriales = libros.ideditoriales
inner join prestatario on prestatario.idprestatario = prestamos.idprestatario
