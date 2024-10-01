CREATE DATABASE CONCIERTOSS
DROP DATABASE CONCIERTOSS
USE CONCIERTOSS

CREATE TABLE PROPIETARIOS(
dpiPropietario int primary key, 
nombrePropietario varchar(30),
apellidoPropietario varchar(30),
telefonoPropiertario varchar(40),
edadPropiertario int, 
profesionPropietario varchar(40))

CREATE TABLE PATROCINADOR(
idPatrocinador int primary key identity, 
nombreEmpresa varchar(40),
telefonoEmpresa varchar(40),
dpiPropietario int, 
foreign key (dpiPropietario) references PROPIETARIOS(dpiPropietario))

CREATE TABLE CIUDAD(
idCiudad  int primary key identity, 
nombreDepartamento varchar(40))

CREATE TABLE LUGAR(
idLugar int primary key identity, 
nombreLugar varchar(60),
idCiudad int, 
dpiPropietario int, 
foreign key (idCiudad) references CIUDAD(idCiudad),
foreign key (dpiPropietario) references PROPIETARIOS(dpiPropietario),
telefonoLugar varchar(20))

CREATE TABLE EVENTO(
idEvento int primary key identity, 
nombreEvento varchar(40),
fechaEvento date, 
duracionEvento varchar(10),
idLugar int, 
idCiudad int, 
idPatrocinador int,
foreign key (idLugar) references LUGAR(idLugar),
foreign key (idCiudad) references CIUDAD(idCiudad),
foreign key (idPatrocinador) references PATROCINADOR(idPatrocinador),
precioEntrada float)

CREATE TABLE ARTISTA(
idArtista int primary key identity,
edadArtsita int,
nacionalidad varchar(30),
nombreArtista varchar(30),
idEvento int, 
foreign key (idEvento) references EVENTO(idEvento))

insert into PROPIETARIOS(dpiPropietario, nombrePropietario, apellidoPropietario, telefonoPropiertario, edadPropiertario, profesionPropietario)
values (1001, 'Juan', 'Hernandez', '45521023', 42, 'Productor') 
insert into PROPIETARIOS(dpiPropietario, nombrePropietario, apellidoPropietario, telefonoPropiertario, edadPropiertario, profesionPropietario)
values (1002, 'Carlos', 'Martinez', '45521023', 42, 'Gerente') 
insert into PROPIETARIOS(dpiPropietario, nombrePropietario, apellidoPropietario, telefonoPropiertario, edadPropiertario, profesionPropietario)
values (1003, 'Pablo', 'Hernandez', '45545674', 42, 'Cantante')

insert into PATROCINADOR(nombreEmpresa, telefonoEmpresa, dpiPropietario)
values ('Coca Cola', '22354789', 1001) --1
insert into PATROCINADOR(nombreEmpresa, telefonoEmpresa, dpiPropietario)
values ('Pepsi', '22354789', 1002) --2
insert into PATROCINADOR(nombreEmpresa, telefonoEmpresa, dpiPropietario)
values ('Cervecería Centroamericana', '22354789', 1001) --3
insert into PATROCINADOR(nombreEmpresa, telefonoEmpresa, dpiPropietario)
values ('Grupo Proamérica', '22354789', 1003) --4
insert into PATROCINADOR(nombreEmpresa, telefonoEmpresa, dpiPropietario)
values ('Los Manantiales', '22354789', 1002) --5

insert into CIUDAD(nombreDepartamento) values ('Guatemala') --1
insert into CIUDAD(nombreDepartamento) values ('Quetzaltenango') --2
insert into CIUDAD(nombreDepartamento) values ('Retalhuleu ') --3
insert into CIUDAD(nombreDepartamento) values ('Huehuetenango') --4

insert into LUGAR(nombreLugar, idCiudad, dpiPropietario, telefonoLugar) 
values ('Estadio Nacional Doroteo Guamuch Flores', 1, 1001, '45631201')
insert into LUGAR(nombreLugar, idCiudad, dpiPropietario, telefonoLugar) 
values ('Estadio Mario Camposeco', 2, 1002, '45631451')
insert into LUGAR(nombreLugar, idCiudad, dpiPropietario, telefonoLugar) 
values ('Estadio del Ejército', 1, 1003, '45631201')
insert into LUGAR(nombreLugar, idCiudad, dpiPropietario, telefonoLugar) 
values ('Estadio Oscar Monterroso Izaguirre', 3, 1001, '45645740')
insert into LUGAR(nombreLugar, idCiudad, dpiPropietario, telefonoLugar) 
values ('Estadio Kaibil Balam', 4, 1002, '45631201')

select * from EVENTO
select * from LUGAR
select * from ARTISTA

drop table EVENTO

insert into EVENTO(nombreEvento, fechaEvento, duracionEvento, idLugar, idCiudad, idPatrocinador, precioEntrada)
values ('Final Copa Guate','2024/09/30','1.30', 6, 1, 1, 3500 )
insert into EVENTO(nombreEvento, fechaEvento, duracionEvento, idLugar, idCiudad, idPatrocinador, precioEntrada)
values ('Fiesta Independecia','2024/09/15', '1.30', 7, 2, 2, 2900 )
insert into EVENTO(nombreEvento, fechaEvento, duracionEvento, idLugar, idCiudad, idPatrocinador, precioEntrada)
values ('MusicFestGallo','2024/09/25', '1.30', 8, 1, 3, 3000 )
insert into EVENTO(nombreEvento, fechaEvento, duracionEvento, idLugar, idCiudad, idPatrocinador, precioEntrada)
values ('ReuFest','2024/09/28', '1.30', 9, 3, 4, 4000 )
insert into EVENTO(nombreEvento, fechaEvento, duracionEvento, idLugar, idCiudad, idPatrocinador, precioEntrada)
values ('Independecia Huehuetenango','2024/09/20', '1.30', 10, 4, 5, 1500 )

insert into ARTISTA(nombreArtista, edadArtsita, idEvento, nacionalidad)
values ('Taylor Swift', 30, 1 ,'Estaunidense')
insert into ARTISTA(nombreArtista, edadArtsita, idEvento, nacionalidad)
values ('Ariana Grande', 30, 2,'Estaunidense')
insert into ARTISTA(nombreArtista, edadArtsita, idEvento, nacionalidad)
values ('Kali Uchis', 30, 3 ,'Estaunidense')
insert into ARTISTA(nombreArtista, edadArtsita, idEvento, nacionalidad)
values ('Eminem', 30, 4 ,'Estaunidense')
insert into ARTISTA(nombreArtista, edadArtsita, idEvento, nacionalidad)
values ('Malacates Trebol Shop', 30, 5 ,'Estaunidense')

create procedure consulta
as
select ARTISTA.nombreArtista as Artista,
		EVENTO.nombreEvento as Evento, 
		LUGAR.nombreLugar as Lugar, 
		CIUDAD.nombreDepartamento as Departamento, 
		PATROCINADOR.nombreEmpresa as Patrocinador, 
		EVENTO.precioEntrada as ValorEntrada, 
		EVENTO.fechaEvento as Fecha

from ARTISTA 
inner join EVENTO on EVENTO.idEvento = ARTISTA.idEvento
inner join LUGAR on LUGAR.idLugar = EVENTO.idLugar
inner join CIUDAD on CIUDAD.idCiudad = EVENTO.idCiudad
inner join PATROCINADOR on PATROCINADOR.idPatrocinador = EVENTO.idPatrocinador

consulta