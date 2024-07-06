-- Create tables
create database tricks;
use tricks;
CREATE TABLE asistencias (
                             id_asistencia INT PRIMARY KEY,
                             fecha DATE,
                             presente VARCHAR(10),
                             aspirante_folio_aspirante VARCHAR(10)
);

CREATE TABLE calificaciones (
                                id_calificacion INT PRIMARY KEY,
                                calificacion FLOAT,
                                aspirante_folio_aspirante VARCHAR(10)
);

CREATE TABLE aspirante (
                           folio_aspirante VARCHAR(10) PRIMARY KEY,
                           nombre VARCHAR(50),
                           apellido VARCHAR(50),
                           curp VARCHAR(25),
                           estado_id_estado INT,
                           fecha_nac DATETIME,
                           grupos_id_grupo INT
);

CREATE TABLE divisiones_academicas (
                                       id_division INT PRIMARY KEY,
                                       nombre_division VARCHAR(61),
                                       coordinador_division VARCHAR(45),
                                       siglas VARCHAR(45),
                                       estado_id_estado INT
);

CREATE TABLE estado (
                        id_estado INT PRIMARY KEY,
                        estado VARCHAR(45)
);

CREATE TABLE grupos (
                        id_grupo INT PRIMARY KEY,
                        nombre_grupo VARCHAR(100),
                        carreras_id_carrera INT,
                        estado_id_estado INT
);

CREATE TABLE carreras (
                          id_carrera INT PRIMARY KEY,
                          nombre_carrera VARCHAR(100),
                          divisiones_academicas_id_division INT,
                          estado_id_estado INT
);

CREATE TABLE cursos (
                        id_curso INT PRIMARY KEY,
                        nombre VARCHAR(45),
                        id_docente INT,
                        estado_id_estado INT
);

CREATE TABLE usuarios (
                          id_usuario INT PRIMARY KEY,
                          nombre VARCHAR(50),
                          apellido VARCHAR(50),
                          mail VARCHAR(50),
                          contrasena VARCHAR(255),
                          id_estado INT,
                          id_rol INT,
                          grupos_id_grupo INT
);

CREATE TABLE tipousuario (
                             id_rol INT PRIMARY KEY,
                             tipoUsuarioRol VARCHAR(45)
);

CREATE TABLE Historial (
                           id_historial INT PRIMARY KEY,
                           descripcion VARCHAR(100),
                           fecha DATETIME,
                           usuarios_id_usuario INT
);

-- Add foreign key constraints

ALTER TABLE asistencias
    ADD FOREIGN KEY (aspirante_folio_aspirante) REFERENCES aspirante(folio_aspirante);

ALTER TABLE calificaciones
    ADD FOREIGN KEY (aspirante_folio_aspirante) REFERENCES aspirante(folio_aspirante);

ALTER TABLE aspirante
    ADD FOREIGN KEY (estado_id_estado) REFERENCES estado(id_estado),
ADD FOREIGN KEY (grupos_id_grupo) REFERENCES grupos(id_grupo);

ALTER TABLE divisiones_academicas
    ADD FOREIGN KEY (estado_id_estado) REFERENCES estado(id_estado);

ALTER TABLE grupos
    ADD FOREIGN KEY (carreras_id_carrera) REFERENCES carreras(id_carrera),
ADD FOREIGN KEY (estado_id_estado) REFERENCES estado(id_estado);

ALTER TABLE carreras
    ADD FOREIGN KEY (divisiones_academicas_id_division) REFERENCES divisiones_academicas(id_division),
ADD FOREIGN KEY (estado_id_estado) REFERENCES estado(id_estado);

ALTER TABLE cursos
    ADD FOREIGN KEY (estado_id_estado) REFERENCES estado(id_estado),
ADD FOREIGN KEY (id_docente) REFERENCES usuarios(id_usuario);

ALTER TABLE usuarios
    ADD FOREIGN KEY (id_estado) REFERENCES estado(id_estado),
ADD FOREIGN KEY (id_rol) REFERENCES tipousuario(id_rol),
ADD FOREIGN KEY (grupos_id_grupo) REFERENCES grupos(id_grupo);

ALTER TABLE Historial
    ADD FOREIGN KEY (usuarios_id_usuario) REFERENCES usuarios(id_usuario);