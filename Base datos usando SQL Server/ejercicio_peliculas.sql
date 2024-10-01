create database peliculas
use peliculas

create table NACIONES(
idNacion int primary key identity,
nacion varchar(25))

create table PAPELES(
idPapel int primary key identity,
papel varchar(20))

create table TRABAJOS(
idTrabajo int primary key identity,
trabajo varchar(20))

create table ACTORES(
idActor int primary key, 
actor varchar(25),
idPais int, 
foreign key(idPais) references NACIONES(idNacion))

create table ASIGNACIONES(
idAsignaciones int primary key identity, 
idTrabajo int,
idActor int,
idPapel int,
pago float,
foreign key (idTrabajo) references TRABAJOS(idTrabajo), 
foreign key (idActor) references ACTORES(idActor), 
foreign key (idPapel) references PAPELES(idPapel))

insert into NACIONES(nacion) values ('Colombia')
insert into NACIONES(nacion) values ('Francia')
insert into NACIONES(nacion) values ('España')

insert into PAPELES(papel) values ('Protagonista')
insert into PAPELES(papel) values ('Coprotagonista')

insert into TRABAJOS(trabajo) values ('Novela')
insert into TRABAJOS(trabajo) values ('Pelicula')
insert into TRABAJOS(trabajo) values ('Serie')

insert into ACTORES(idActor, actor, idPais) values (1012, 'Juan', 1)
insert into ACTORES(idActor, actor, idPais) values (1015, 'Raul', 2)
insert into ACTORES(idActor, actor, idPais) values (1016, 'Clara',3)

insert into ASIGNACIONES(idTrabajo,idActor, idPapel, pago) values (1, 1012, 1, 900000)
insert into ASIGNACIONES(idTrabajo,idActor, idPapel, pago) values (3, 1012, 2, 100000)
insert into ASIGNACIONES(idTrabajo,idActor, idPapel, pago) values (2, 1015, 1, 1100000)
insert into ASIGNACIONES(idTrabajo,idActor, idPapel, pago) values (2, 1012, 1, 1200000)
insert into ASIGNACIONES(idTrabajo,idActor, idPapel, pago) values (3, 1015, 2, 1900000)
insert into ASIGNACIONES(idTrabajo,idActor, idPapel, pago) values (1, 1016, 2, 8000000)
insert into ASIGNACIONES(idTrabajo,idActor, idPapel, pago) values (2, 1016, 1, 1050000)

select ACTORES.idActor, ACTORES.actor, nacion, papel, TRABAJOS.idTrabajo, TRABAJOS.trabajo, ASIGNACIONES.pago
from ACTORES inner join NACIONES on actores.idPais = NACIONES.idNacion
inner join ASIGNACIONES on ACTORES.idActor = ASIGNACIONES.idActor
inner join TRABAJOS on ASIGNACIONES.idTrabajo = TRABAJOS.idTrabajo
inner join PAPELES on ASIGNACIONES.idPapel = PAPELES.idPapel