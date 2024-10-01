CREATE DATABASE jugadores
use jugadores

create table gerentes(
idGerente int primary key identity, 
nombreGerente varchar(30),
apellidoGerente varchar(30))

create table tecnicos(
dpiTecnico int primary key,
nombreTecnico varchar(30),
apellidoTecnico varchar(30))

create table nacionalidades(
idPais int primary key identity, 
pais varchar(30))

create table ciudades(
idCiudad int primary key identity, 
ciudad varchar(40)) 

create table sedes(
idSede int primary key identity, 
direccionSede varchar(40),
telefonoSede varchar(10)) 

create table posiciones(
idPosicion int primary key identity, 
posicion varchar(20))

create table jugadores(
dpiJugador int primary key,
nombreJugador varchar(30),
apellidoJugador varchar(30),
edadJugador varchar(30),
salario float, 
golesMarcador int, 
idPais int, 
idCiudad int, 
idPosicion int, 
foreign key (idPais) references nacionalidades(idPais),
foreign key (idCiudad) references ciudades(idCiudad),
foreign key (idPosicion) references posiciones(idPosicion))

alter table jugadores 
add golesRecibidos int;

select * from jugadores

create table equipos(
idEquipos int primary key identity,
nombreEquipos varchar(30),
idSede int, 
idGerente int, 
dpiTecnico int, 
foreign key (idSede) references sedes(idSede),
foreign key (idGerente) references gerentes(idGerente),
foreign key (dpiTecnico) references tecnicos(dpiTecnico))

select * from partidos

create table partidos(
idPartido int primary key identity,
dpiJugador int,
idEquipo int, 
foreign key (dpiJugador) references jugadores(dpiJugador),
foreign key (idEquipo) references equipos(idEquipos),
partidosJugados int)


insert into gerentes(nombreGerente, apellidoGerente) values ('Juan', 'Perez')
insert into gerentes(nombreGerente, apellidoGerente) values ('Luis', 'Mendez')

insert into tecnicos(dpiTecnico, apellidoTecnico, nombreTecnico) values (1004,'Pedro' , 'Sosa')
insert into tecnicos(dpiTecnico, apellidoTecnico, nombreTecnico) values (1010, 'Chentrone' , 'Manuel')

insert into nacionalidades(pais) values ('Guatemala')
insert into nacionalidades(pais) values ('Urugay')

insert into ciudades(ciudad) values ('zona 6')

insert into sedes(direccionSede, telefonoSede) values ('Huehuetenango' , '44589698')

insert into posiciones(posicion) values ('Portero')
insert into posiciones(posicion) values ('Medio')
insert into posiciones(posicion) values ('Defensa')
insert into posiciones(posicion) values ('Delantero')

select * from jugadores
insert into jugadores(dpiJugador, apellidoJugador, nombreJugador , edadJugador, salario, golesMarcador, idPais, idCiudad, idPosicion,golesRecibidos)
values (123,'Moreno Alfaro', 'Jorge Estuardo',18, 2000, 0, 1, 1, 1, 1)
insert into jugadores(dpiJugador, apellidoJugador, nombreJugador , edadJugador, salario, golesMarcador, idPais, idCiudad, idPosicion,golesRecibidos)
values (456,'Juarez Mendoza', 'Pablo Roberto',20, 3000, 1, 1, 1, 2, 1)
insert into jugadores(dpiJugador, apellidoJugador, nombreJugador , edadJugador, salario, golesMarcador, idPais, idCiudad, idPosicion,golesRecibidos)
values (789,'Sanchez Perez', 'Jose Andres',21, 3000, 1, 1, 1, 2, 1)
insert into jugadores(dpiJugador, apellidoJugador, nombreJugador , edadJugador, salario, golesMarcador, idPais, idCiudad, idPosicion,golesRecibidos)
values (129,'Amaral Benitez', 'Uri Emanuel',19, 5000, 3, 2, 1, 4, 2)

select * from equipos
insert into equipos(nombreEquipos, idSede, idGerente, dpiTecnico) 
values ('Goleadores', 1, 1, 1010)

select * from partidos
insert into partidos(dpiJugador, idEquipo, partidosJugados) 
values (123, 2, 3 )
insert into partidos(dpiJugador, idEquipo, partidosJugados) 
values (456, 2, 3 )
insert into partidos(dpiJugador, idEquipo, partidosJugados) 
values (789, 2, 1 )
insert into partidos(dpiJugador, idEquipo, partidosJugados) 
values (129, 2, 2 )


select * from partidos
select * from jugadores
select * from equipos

create procedure consulta
as
select nombreJugador, apellidoJugador, pais, golesMarcador, direccionSede, apellidoTecnico, nombreTecnico, partidosJugados

from partidos inner join jugadores on jugadores.dpiJugador = partidos.dpiJugador

inner join nacionalidades on jugadores.idPais = nacionalidades.idPais
inner join equipos on equipos.idEquipos =partidos.idEquipo
inner join sedes on sedes.idSede = equipos.idSede
inner join tecnicos on tecnicos.dpiTecnico = equipos.dpiTecnico

consulta