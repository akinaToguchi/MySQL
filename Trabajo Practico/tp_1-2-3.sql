
# Ejercicio 1, 2
drop database videoclub;
create database videoclub; #Se realizo visualmente pero lo dejo con codigo
use videoclub;

# Ejercicio 3
create table pelicula(
	codigo_pelicula int not null auto_increment primary key,
    titulo varchar(50) not null,
    ano varchar(50) not null,
    duracion int
);

create table amigo(
	codigo_amigo int not null auto_increment primary key,
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    telefono int not null,
    direccion varchar(50) not null
);

# Ejercicio 4
insert into pelicula values (1, "El Padrino", 2000, 1),
(2, "El mago de Oz", 2001, 2),
(3, "Ciudadano Kane", 2002, 3),
(4, "Sueño de libertad", 2003, null),
(5, "Pulp Fiction", 2004, 1),
(6, "Casablanca ", 2005, 2),
(7, "El Padrino: Parte II", 2006, 3),
(8, "E.T., el extraterrestre", 2007, null),
(9, "2001: Odisea del espacio", 2008, 1),
(10, "La lista de Schindler", 2009, 2);

insert into amigo values (1, "Federico", "Quiñones", 1111, "calle 1"),
(2, "Maria ", "Rodríguez", 1111, "calle 2"),
(3, "Jose ", "González", 2222, "calle 3"),
(4, "David ", "Fernández", 3333, "calle 4"),
(5, "Ana", "López", 4444, "calle 5"),
(6, "Miguel ", "Martínez", 5555, "calle 6"),
(7, "Juan ", "Sánchez", 6666, "calle 7"),
(8, "Francisco", "Pérez", 7777, "calle 8"),
(9, "Rodolfo", "Gómez", 8888, "calle 9"),
(10, "Noemi", "Jiménez", 9999, "calle 10");

# Ejercicio 5
update pelicula set titulo="Duro de Matar" where codigo_pelicula=3;

# Ejercicio 6
delete from pelicula where codigo_pelicula=6;
delete from pelicula where codigo_pelicula=7;
delete from pelicula where codigo_pelicula=8;

# Ejercicio 7 -> se creo visualmente pero pongo el codigo asi lo puede ejecutar
create table prestamo(
	numero_alquiler int not null auto_increment primary key,
    fecha_fin date,
    fecha_inicio date not null,
    codigo_pelicula int not null,
    codigo_amigo int not null
);

# Ejercicio 8
insert into prestamo values (1, "2020-01-01", "2000-01-29", 1, 1),
(2, "2020-02-01", "2000-02-29", 2, 2),
(3, "2020-02-01", "2000-02-29", 3, 3),
(4, "2020-03-01", "2000-03-29", 4, 4),
(5, "2020-03-01", "2000-03-29", 5, 5),
(6, "2020-04-01", "2000-04-29", 6, 6),
(7, "2020-04-01", "2000-04-29", 7, 7),
(8, "2020-05-01", "2000-05-29", 8, 8),
(9, "2020-05-01", "2000-05-29", 9, 9),
(10, "2020-06-01", "2000-06-29", 10, 10);

# Ejercicio 9
rename table pelicula to peliculas;
rename table amigo to amigos;
rename table prestamo to prestamos;

# Ejercicio 10
select * from prestamos;
select distinct nombre from amigos;
select titulo,duracion from peliculas;

# Ejercicio 11
select * from prestamos where codigo_pelicula between 3 and 6;
select * from amigos where codigo_amigo not between 2 and 5;

# Ejercicio 12
select * from peliculas where titulo like'%to%';

# Ejercicio 13
insert into amigos values (11, "Marina", "Fernandez", 45128956, "Parana 555"),
(12, "Lujan", "Tucci", 1137589612, "Lavalle 1100"),
(13, "Gabriel", "Dominguez", 41109956, "Carlos Calvo 100 "),
(14, "Raul", "Vazquez", 45120014, "Peru 1120 "),
(15, "Martina", "Perez", 113202044, "Uruguay 220");

# Ejercicio 14
set sql_safe_updates= 0;
update amigos set nombre="Lujan" where nombre="Lorena";
update amigos set apellido="Milone" where apellido="Tucci";

# Ejercicio 15
create table auxiliar select * from amigos;

# Ejercicio 16
truncate auxiliar;

# Ejercicio 17
drop table auxiliar;

# Ejercicio 18
select count(distinct nombre) as "Cantidad Amigos" from amigos;

# Ejercicio 19
select max(ano) as "Maximo", min(ano) as "Minimo" from peliculas;

# Ejercicio 20 -> No existe (pasa del 19 al 21)

# Ejercicio 21 -> Tablas creadas en DER exportado
# Ejercicio 22 -> Relaciones echas en DER exportado
# Ejercicio 23

/*
-- MySQL Script generated by MySQL Workbench
-- Fri Jan 20 14:52:03 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema videoclub
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `videoclub` ;

-- -----------------------------------------------------
-- Schema videoclub
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `videoclub` DEFAULT CHARACTER SET utf8 ;
USE `videoclub` ;

-- -----------------------------------------------------
-- Table `videoclub`.`peliculas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `videoclub`.`peliculas` ;

CREATE TABLE IF NOT EXISTS `videoclub`.`peliculas` (
  `codigo_peliculas` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `ano` INT NOT NULL,
  `duracion` INT NULL,
  PRIMARY KEY (`codigo_peliculas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `videoclub`.`amigos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `videoclub`.`amigos` ;

CREATE TABLE IF NOT EXISTS `videoclub`.`amigos` (
  `codigo_amigos` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `telefono` INT NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codigo_amigos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `videoclub`.`prestamos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `videoclub`.`prestamos` ;

CREATE TABLE IF NOT EXISTS `videoclub`.`prestamos` (
  `numero_alquiler` INT NOT NULL AUTO_INCREMENT,
  `fecha_fin` DATE NULL,
  `fecha_inicio` DATE NOT NULL,
  `codigo_pelicula` INT NOT NULL,
  `prestamoscol` INT NOT NULL,
  `peliculas_codigo_peliculas` INT NOT NULL,
  `amigos_codigo_amigos` INT NOT NULL,
  PRIMARY KEY (`numero_alquiler`, `prestamoscol`, `codigo_pelicula`, `peliculas_codigo_peliculas`, `amigos_codigo_amigos`),
  INDEX `fk_prestamos_peliculas_idx` (`peliculas_codigo_peliculas` ASC) VISIBLE,
  INDEX `fk_prestamos_amigos1_idx` (`amigos_codigo_amigos` ASC) VISIBLE,
  CONSTRAINT `fk_prestamos_peliculas`
    FOREIGN KEY (`peliculas_codigo_peliculas`)
    REFERENCES `videoclub`.`peliculas` (`codigo_peliculas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_prestamos_amigos1`
    FOREIGN KEY (`amigos_codigo_amigos`)
    REFERENCES `videoclub`.`amigos` (`codigo_amigos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

*/


