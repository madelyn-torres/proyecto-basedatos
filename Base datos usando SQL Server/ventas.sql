create procedure ver_detalle
as
select cliente, nit, producto, precio, cantidad, cantidad*precio as SubTotal
from 
DETALLE_VENTAS inner join VENTAS
on DETALLE_VENTAS.nit = ventas.nit_Cliente
inner join PRODUCTOS
on PRODUCTOS.idProducto = VENTAS.idProducto

ver_detalle;
execute ver_detalle

create procedure insertar_productos
@nomproducto varchar(20), @precio float
as
select producto into x from PRODUCTOS where producto = @nomproducto
insert into PRODUCTOS (producto, precio) values (@nomproducto , @precio)

insertar_productos 'Avena', 160


select * from PRODUCTOS


create procedure editar_producto
@nomproducto varchar(20), @codigo int
as
update PRODUCTOS set producto = @nomproducto where idProducto = @codigo

editar_producto 'Mosh',6