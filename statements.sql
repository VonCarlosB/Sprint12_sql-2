/* Relación tipo 1:1 */
-- PASO 1
-- Tu código aquí
create table usuarios (
	id_usuario int auto_increment primary key,
    nombre varchar(50) not null,
    apellido varchar(100) not null,
    email varchar(100) not null,
    edad int
);

INSERT INTO usuarios (nombre, apellido, email, edad) VALUES
('Juan', 'Gomez', 'juan.gomez@example.com', 28),
('Maria', 'Lopez', 'maria.lopez@example.com', 32),
('Carlos', 'Rodriguez', 'carlos.rodriguez@example.com', 25),
('Laura', 'Fernandez', 'laura.fernandez@example.com', 30),
('Pedro', 'Martinez', 'pedro.martinez@example.com', 22),
('Ana', 'Hernandez', 'ana.hernandez@example.com', 35),
('Miguel', 'Perez', 'miguel.perez@example.com', 28),
('Sofia', 'Garcia', 'sofia.garcia@example.com', 26),
('Javier', 'Diaz', 'javier.diaz@example.com', 31),
('Luis', 'Sanchez', 'luis.sanchez@example.com', 27),
('Elena', 'Moreno', 'elena.moreno@example.com', 29),
('Daniel', 'Romero', 'daniel.romero@example.com', 33),
('Paula', 'Torres', 'paula.torres@example.com', 24),
('Alejandro', 'Ruiz', 'alejandro.ruiz@example.com', 28),
('Carmen', 'Vega', 'carmen.vega@example.com', 29),
('Adrian', 'Molina', 'adrian.molina@example.com', 34),
('Isabel', 'Gutierrez', 'isabel.gutierrez@example.com', 26),
('Hector', 'Ortega', 'hector.ortega@example.com', 30),
('Raquel', 'Serrano', 'raquel.serrano@example.com', 32),
('Alberto', 'Reyes', 'alberto.reyes@example.com', 28);

-- PASO 2
-- Tu código aquí
create table roles (
    id_rol int auto_increment primary key,
    nombre_rol varchar(50) not null
);

-- PASO 3
-- Tu código aquí
alter table usuarios add column id_rol int
UPDATE `usuarios` SET `id_rol` = '1' WHERE (`id_usuario` = '1');
UPDATE `usuarios` SET `id_rol` = '2' WHERE (`id_usuario` = '2');
UPDATE `usuarios` SET `id_rol` = '3' WHERE (`id_usuario` = '3');
UPDATE `usuarios` SET `id_rol` = '4' WHERE (`id_usuario` = '4');
UPDATE `usuarios` SET `id_rol` = '1' WHERE (`id_usuario` = '5');
UPDATE `usuarios` SET `id_rol` = '1' WHERE (`id_usuario` = '6');
UPDATE `usuarios` SET `id_rol` = '1' WHERE (`id_usuario` = '7');
UPDATE `usuarios` SET `id_rol` = '1' WHERE (`id_usuario` = '8');
UPDATE `usuarios` SET `id_rol` = '2' WHERE (`id_usuario` = '9');
UPDATE `usuarios` SET `id_rol` = '2' WHERE (`id_usuario` = '10');
UPDATE `usuarios` SET `id_rol` = '2' WHERE (`id_usuario` = '11');
UPDATE `usuarios` SET `id_rol` = '1' WHERE (`id_usuario` = '12');
UPDATE `usuarios` SET `id_rol` = '2' WHERE (`id_usuario` = '13');
UPDATE `usuarios` SET `id_rol` = '1' WHERE (`id_usuario` = '14');
UPDATE `usuarios` SET `id_rol` = '3' WHERE (`id_usuario` = '15');
UPDATE `usuarios` SET `id_rol` = '3' WHERE (`id_usuario` = '16');
UPDATE `usuarios` SET `id_rol` = '4' WHERE (`id_usuario` = '17');
UPDATE `usuarios` SET `id_rol` = '4' WHERE (`id_usuario` = '18');
UPDATE `usuarios` SET `id_rol` = '2' WHERE (`id_usuario` = '19');
UPDATE `usuarios` SET `id_rol` = '2' WHERE (`id_usuario` = '20');

alter table usuarios add foreign key (id_rol) references roles(id_rol);

-- PASO 4
-- Tu código aquí
select usuarios.id_usuario, usuarios.nombre, usuarios.apellido, usuarios.email, usuarios.edad, roles.nombre_rol
from usuarios
join roles on usuarios.id_rol = roles.id_rol;

/* Relación tipo 1:N */
-- PASO 1
-- Tu código aquí
create table categorias(
	id_categoria int auto_increment primary key,
    nombre_categoria varchar(100) not null
);

INSERT INTO categorias (nombre_categoria) VALUES
('Electrónicos'),
('Ropa y Accesorios'),
('Libros'),
('Hogar y Cocina'),
('Deportes y aire libre'),
('Salud y cuidado personal'),
('Herramientas y mejoras para el hogar'),
('Juguetes y juegos'),
('Automotriz'),
('Música y Películas');

-- PASO 2
-- Tu código aquí
alter table usuarios add column id_categoria int;

-- PASO 3
-- Tu código aquí
UPDATE usuarios SET id_categoria = 1 WHERE id_usuario IN (1, 2, 3);
UPDATE usuarios SET id_categoria = 2 WHERE id_usuario IN (4, 5);
UPDATE usuarios SET id_categoria = 3 WHERE id_usuario IN (6);
UPDATE usuarios SET id_categoria = 4 WHERE id_usuario IN (7, 8, 9);
UPDATE usuarios SET id_categoria = 5 WHERE id_usuario IN (10);
UPDATE usuarios SET id_categoria = 6 WHERE id_usuario IN (11, 12, 13);
UPDATE usuarios SET id_categoria = 7 WHERE id_usuario IN (14, 15, 16);
UPDATE usuarios SET id_categoria = 8 WHERE id_usuario IN (17);
UPDATE usuarios SET id_categoria = 9 WHERE id_usuario IN (18, 19);
UPDATE usuarios SET id_categoria = 10 WHERE id_usuario IN (20);

-- PASO 4
-- Tu código aquí
select usuarios.id_usuario, usuarios.nombre, usuarios.apellido, usuarios.email, usuarios.edad, roles.nombre_rol, categorias.nombre_categoria
from usuarios
join roles, categorias where usuarios.id_rol = roles.id_rol and usuarios.id_categoria = categorias.id_categoria

/* Relación tipo N:M */
-- PASO 1
-- Tu código aquí
create table usuarios_categorias(
	id_usuario_categoria int primary key auto_increment,
    id_usuario int,
    id_categoria int
);
alter table usuarios_categorias add foreign key (id_usuario) references usuarios(id_usuario)
alter table usuarios_categorias add foreign key (id_categoria) references categorias(id_categoria)

-- PASO 2
-- Tu código aquí
INSERT INTO usuarios_categorias (id_usuario, id_categoria) VALUES
(1, 1), (1, 2), (1, 3),
(2, 4), (2, 5),
(3, 6), (3, 7),
(4, 8), (4, 9), (4, 10),
(5, 1),
(6, 5), (6, 3),
(7, 4), (7, 5), (7, 10),
(8, 3), (8, 2), (8, 1),
(9, 2), (9, 5), (9, 9),
(10, 1), (10, 4), (10, 3),
(11, 1), (11, 6), (11, 9), (11, 10),
(12, 2), (12, 8),
(13, 3), (13, 1),
(14, 4), 
(15, 5),
(16, 6), (16, 3),
(17, 7),
(18, 8), (18, 3),
(19, 9), (19, 10),
(20, 10), (20, 9)

-- PASO 3
-- Tu código aquí
select usuarios.id_usuario, usuarios.nombre, usuarios.apellido, usuarios.email, usuarios.edad, roles.nombre_rol, categorias.nombre_categoria
from usuarios
join roles, categorias, usuarios_categorias where usuarios.id_rol = roles.id_rol 
	and usuarios_categorias.id_categoria = categorias.id_categoria
	and usuarios_categorias.id_usuario = usuarios.id_usuario