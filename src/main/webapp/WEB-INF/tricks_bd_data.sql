use tricks;
-- ------------------------------------------------------------------------------------------------------------
-- datos de tipo de usuario
-- ------------------------------------------------------------------------------------------------------------
INSERT INTO `tricks`.`tipousuario` (`id_rol`, `tipoUsuarioRol`) VALUES ('1', 'Administrador');
INSERT INTO `tricks`.`tipousuario` (`id_rol`, `tipoUsuarioRol`) VALUES ('2', 'Docente');

-- ------------------------------------------------------------------------------------------------------------
-- Datos de la tabla estado
-- ------------------------------------------------------------------------------------------------------------

INSERT INTO `tricks`.`estado` (`id_estado`, `estado`) VALUES ('1', 'Activo');
INSERT INTO `tricks`.`estado` (`id_estado`, `estado`) VALUES ('2', 'No Activo');

-- ------------------------------------------------------------------------------------------------------------
-- DIVICIONES ACADEMICAS
-- ------------------------------------------------------------------------------------------------------------

INSERT INTO `tricks`.`divisiones_academicas` (`id_division`, `nombre_division`, `coordinador_division`, `siglas`, `estado_id_estado`) VALUES ('12', 'División Académica de Tecnologías de la Información y Diseño', 'Dra. Martha Fabiola Wences Díaz', 'DATID', 1);
INSERT INTO `tricks`.`divisiones_academicas` (`id_division`, `nombre_division`, `coordinador_division`, `siglas`, `estado_id_estado`) VALUES ('13', 'División Académica de Mecánica Industrial', 'M. en C. Jaime Vázquez Colín', 'DAMI', 1);
INSERT INTO `tricks`.`divisiones_academicas` (`id_division`, `nombre_division`, `coordinador_division`, `siglas`, `estado_id_estado`) VALUES ('14', 'División Académica Económica-Administrativa', 'M.C.C.I. Jonathan Espinoza Mendoza', 'DACEA', 1);
INSERT INTO `tricks`.`divisiones_academicas` (`id_division`,`nombre_division`, `coordinador_division`, `siglas`, `estado_id_estado`) VALUES (15,'División Académica de Terapia Física', 'M.M.F. y R. Dennice Jaqueline García Mendoza', 'DATEFI', 1);


-- ------------------------------------------------------------------------------------------------------------
-- datos carreras
-- ------------------------------------------------------------------------------------------------------------

INSERT INTO `tricks`.`carreras` (`id_carrera`, `nombre_carrera`, `divisiones_academicas_id_division`, `estado_id_estado`) VALUES ('1', 'Gestión del Capital Humano', '14',1);
INSERT INTO `tricks`.`carreras` (`id_carrera`, `nombre_carrera`, `divisiones_academicas_id_division`, `estado_id_estado`) VALUES ('2', 'Mercadotecnia', '14',1);
INSERT INTO `tricks`.`carreras` (`id_carrera`, `nombre_carrera`, `divisiones_academicas_id_division`, `estado_id_estado`) VALUES ('4', 'Procesos Productivos', '13',1);
INSERT INTO `tricks`.`carreras` (`id_carrera`, `nombre_carrera`, `divisiones_academicas_id_division`, `estado_id_estado`) VALUES ('5', 'Automatización', '13',1);
INSERT INTO `tricks`.`carreras` (`id_carrera`, `nombre_carrera`, `divisiones_academicas_id_division`, `estado_id_estado`) VALUES ('6', 'Mantenimiento Industrial', '13',1);
INSERT INTO `tricks`.`carreras` (`id_carrera`, `nombre_carrera`, `divisiones_academicas_id_division`, `estado_id_estado`) VALUES ('7', 'Nanotecnología', '13',1);
INSERT INTO `tricks`.`carreras` (`id_carrera`, `nombre_carrera`, `divisiones_academicas_id_division`, `estado_id_estado`) VALUES ('8', 'Gestión del Bienestar', '15',1);
INSERT INTO `tricks`.`carreras` (`id_carrera`, `nombre_carrera`, `divisiones_academicas_id_division`, `estado_id_estado`) VALUES ('9', 'Diseño y Animación Digital', '12',1);
INSERT INTO `tricks`.`carreras` (`id_carrera`, `nombre_carrera`, `divisiones_academicas_id_division`, `estado_id_estado`) VALUES ('10', 'Diseño y Moda Industrial en Producción', '12',1);
INSERT INTO `tricks`.`carreras` (`id_carrera`, `nombre_carrera`, `divisiones_academicas_id_division`, `estado_id_estado`) VALUES ('11', 'Desarrollo de Software Multiplataforma', '12',1);
INSERT INTO `tricks`.`carreras` (`id_carrera`, `nombre_carrera`, `divisiones_academicas_id_division`, `estado_id_estado`) VALUES ('12', 'Infraestructura de Redes Digitales', '12',1);

-- ------------------------------------------------------------------------------------------------------------
-- datos grupos
-- ------------------------------------------------------------------------------------------------------------

-- Grupos para la carrera 'Gestión del Capital Humano' (id_carrera = 1)
INSERT INTO `tricks`.`grupos` (`id_grupo`, `nombre_grupo`, `carreras_id_carrera`, `estado_id_estado`) VALUES
                                                                                                          (1, 'A-GCH', 1, 1),
                                                                                                          (2, 'B-GCH', 1, 1);
-- Grupos para la carrera 'Mercadotecnia' (id_carrera = 2)
INSERT INTO `tricks`.`grupos` (`id_grupo`, `nombre_grupo`, `carreras_id_carrera`, `estado_id_estado`) VALUES
                                                                                                          (6, 'A-M', 2, 1),
                                                                                                          (7, 'B-M', 2, 1);
-- Grupos para la carrera 'Procesos Productivos' (id_carrera = 4)
INSERT INTO `tricks`.`grupos` (`id_grupo`, `nombre_grupo`, `carreras_id_carrera`, `estado_id_estado`) VALUES
                                                                                                          (11, 'A-PP', 4, 1),
                                                                                                          (12, 'B-PP', 4, 1);
-- Grupos para la carrera 'Automatización' (id_carrera = 5)
INSERT INTO `tricks`.`grupos` (`id_grupo`, `nombre_grupo`, `carreras_id_carrera`, `estado_id_estado`) VALUES
                                                                                                          (16, 'A-A', 5, 1),
                                                                                                          (17, 'B-A', 5, 1);
-- Grupos para la carrera 'Mantenimiento Industrial' (id_carrera = 6)
INSERT INTO `tricks`.`grupos` (`id_grupo`, `nombre_grupo`, `carreras_id_carrera`, `estado_id_estado`) VALUES
                                                                                                          (21, 'A-MI', 6, 1),
                                                                                                          (22, 'B-MI', 6, 1);
-- Grupos para la carrera 'Nanotecnología' (id_carrera = 7)
INSERT INTO `tricks`.`grupos` (`id_grupo`, `nombre_grupo`, `carreras_id_carrera`, `estado_id_estado`) VALUES
                                                                                                          (26, 'A-N', 7, 1),
                                                                                                          (27, 'B-N', 7, 1);
-- Grupos para la carrera 'Gestión del Bienestar' (id_carrera = 8)
INSERT INTO `tricks`.`grupos` (`id_grupo`, `nombre_grupo`, `carreras_id_carrera`, `estado_id_estado`) VALUES
                                                                                                          (31, 'A-GB', 8, 1),
                                                                                                          (32, 'B-GB', 8, 1);
-- Grupos para la carrera 'Diseño y Animación Digital' (id_carrera = 9)
INSERT INTO `tricks`.`grupos` (`id_grupo`, `nombre_grupo`, `carreras_id_carrera`, `estado_id_estado`) VALUES
                                                                                                          (36, 'A-DAD', 9, 1),
                                                                                                          (37, 'B-DAD', 9, 1);
-- Grupos para la carrera 'Diseño y Moda Industrial en Producción' (id_carrera = 10)
INSERT INTO `tricks`.`grupos` (`id_grupo`, `nombre_grupo`, `carreras_id_carrera`, `estado_id_estado`) VALUES
                                                                                                          (41, 'A-DMIP', 10, 1),
                                                                                                          (42, 'B-DMIP', 10, 1);
-- Grupos para la carrera 'Desarrollo de Software Multiplataforma' (id_carrera = 11)
INSERT INTO `tricks`.`grupos` (`id_grupo`, `nombre_grupo`, `carreras_id_carrera`, `estado_id_estado`) VALUES
                                                                                                          (46, 'A-DSM', 11, 1),
                                                                                                          (47, 'B-DSM', 11, 1);
-- Grupos para la carrera 'Infraestructura de Redes Digitales' (id_carrera = 12)
INSERT INTO `tricks`.`grupos` (`id_grupo`, `nombre_grupo`, `carreras_id_carrera`, `estado_id_estado`) VALUES
                                                                                                          (51, 'A-IRD', 12, 1),
                                                                                                          (52, 'B-IRD', 12, 1);

-- ------------------------------------------------------------------------------------------------------------
-- aspirantes
-- ------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------
INSERT INTO `aspirante` VALUES ('A1','Juan','Pérez','PERJ920521HDFRRN07',1,'1992-05-21 00:00:00',1),('A2','María','Gómez','GOMM871015MDFRRN09',1,'1987-10-15 00:00:00',1),('A3','Carlos','Martínez','MARC900702GTMRTL08',1,'1990-07-02 00:00:00',1),('AA1','Mariano','Gómez','GOMM920420MDFRMN07',1,'1992-04-20 00:00:00',27),('AA2','Cecilia','Ramírez','RAMC900701GTMCLS08',1,'1990-07-01 00:00:00',27),('AA3','Arturo','Martínez','MARA950212HDFRTR03',1,'1995-02-12 00:00:00',27),('AE1','Juan','González','GONJ920521HDFRLL07',1,'1992-05-21 00:00:00',31),('AE2','Ana','Martínez','MARA871015MDFRRA09',1,'1987-10-15 00:00:00',31),('AE3','Pedro','Hernández','HERP900702GTMPTR08',1,'1990-07-02 00:00:00',31),('AF1','María','López','LOPM880320MDFRLR01',1,'1988-03-20 00:00:00',32),('AF2','Jorge','Castro','CASJ910505MDFRTR04',1,'1991-05-05 00:00:00',32),('AF3','Sofía','Gómez','GOMS950215GTMSFN02',1,'1995-02-15 00:00:00',32),('AJ1','Martha','Jiménez','JIMM910425GTMJMR03',1,'1991-04-25 00:00:00',36),('AJ2','Martín','Pérez','PERM900701HDFRRT08',1,'1990-07-01 00:00:00',36),('AJ3','Fernanda','Gutiérrez','GUTF960212MDFRNN02',1,'1996-02-12 00:00:00',36),('AK1','Diego','Castro','CAST930510MDFRST01',1,'1993-05-10 00:00:00',37),('AK2','Alejandra','Ruiz','RUIA900803GTMRLD04',1,'1990-08-03 00:00:00',37),('AK3','Roberta','Mendoza','MENR950705HDFRZB09',1,'1995-07-05 00:00:00',37),('AO1','Diana','López','LOPD910510MDFRDN01',1,'1991-05-10 00:00:00',41),('AO2','Javier','Castro','CAJJ900803GTMVCR04',1,'1990-08-03 00:00:00',41),('AO3','Adriana','Sánchez','SANA950705HDFRAD09',1,'1995-07-05 00:00:00',41),('AP1','Mariano','Gómez','GOMM920420MDFRMN07',1,'1992-04-20 00:00:00',42),('AP2','Cecilia','Ramírez','RAMC900701GTMCLS08',1,'1990-07-01 00:00:00',42),('AP3','Arturo','Martínez','MARA950212HDFRTR03',1,'1995-02-12 00:00:00',42),('AT1','Juan','González','GONJ920521HDFRLL07',1,'1992-05-21 00:00:00',46),('AT2','Ana','Martínez','MARA871015MDFRRA09',1,'1987-10-15 00:00:00',46),('AT3','Pedro','Hernández','HERP900702GTMPTR08',1,'1990-07-02 00:00:00',46),('AU1','María','López','LOPM880320MDFRLR01',1,'1988-03-20 00:00:00',47),('AU2','Jorge','Castro','CASJ910505MDFRTR04',1,'1991-05-05 00:00:00',47),('AU3','Sofía','Gómez','GOMS950215GTMSFN02',1,'1995-02-15 00:00:00',47),('AY1','Martha','Jiménez','JIMM910425GTMJMR03',1,'1991-04-25 00:00:00',51),('AY2','Martín','Pérez','PERM900701HDFRRT08',1,'1990-07-01 00:00:00',51),('AY3','Fernanda','Gutiérrez','GUTF960212MDFRNN02',1,'1996-02-12 00:00:00',51),('AZ1','Diego','Castro','CAST930510MDFRST01',1,'1993-05-10 00:00:00',52),('AZ2','Alejandra','Ruiz','RUIA900803GTMRLD04',1,'1990-08-03 00:00:00',52),('AZ3','Roberta','Mendoza','MENR950705HDFRZB09',1,'1995-07-05 00:00:00',52),('B1','Laura','García','GARL880320MDFCLR01',1,'1988-03-20 00:00:00',2),('B2','Pedro','López','LOPP910505MDFPTR04',1,'1991-05-05 00:00:00',2),('B3','Ana','Hernández','HERA950215GTMNNA02',1,'1995-02-15 00:00:00',2),('F1','Martha','Jiménez','JIMM910425GTMJMR03',1,'1991-04-25 00:00:00',6),('F2','Martín','Pérez','PERM900701HDFRRT08',1,'1990-07-01 00:00:00',6),('F3','Fernanda','Gutiérrez','GUTF960212MDFRNN02',1,'1996-02-12 00:00:00',6),('G1','Diego','Castro','CAST930510MDFRST01',1,'1993-05-10 00:00:00',7),('G2','Alejandra','Ruiz','RUIA900803GTMRLD04',1,'1990-08-03 00:00:00',7),('G3','Roberta','Mendoza','MENR950705HDFRZB09',1,'1995-07-05 00:00:00',7),('K1','Diana','López','LOPD910510MDFRDN01',1,'1991-05-10 00:00:00',11),('K2','Javier','Castro','CAJJ900803GTMVCR04',1,'1990-08-03 00:00:00',11),('K3','Adriana','Sánchez','SANA950705HDFRAD09',1,'1995-07-05 00:00:00',11),('L1','Mariano','Gómez','GOMM920420MDFRMN07',1,'1992-04-20 00:00:00',12),('L2','Cecilia','Ramírez','RAMC900701GTMCLS08',1,'1990-07-01 00:00:00',12),('L3','Arturo','Martínez','MARA950212HDFRTR03',1,'1995-02-12 00:00:00',12),('P1','Juan','González','GONJ920521HDFRLL07',1,'1992-05-21 00:00:00',16),('P2','Ana','Martínez','MARA871015MDFRRA09',1,'1987-10-15 00:00:00',16),('P3','Pedro','Hernández','HERP900702GTMPTR08',1,'1990-07-02 00:00:00',16),('Q1','María','López','LOPM880320MDFRLR01',1,'1988-03-20 00:00:00',17),('Q2','Jorge','Castro','CASJ910505MDFRTR04',1,'1991-05-05 00:00:00',17),('Q3','Sofía','Gómez','GOMS950215GTMSFN02',1,'1995-02-15 00:00:00',17),('U1','Martha','Jiménez','JIMM910425GTMJMR03',1,'1991-04-25 00:00:00',21),('U2','Martín','Pérez','PERM900701HDFRRT08',1,'1990-07-01 00:00:00',21),('U3','Fernanda','Gutiérrez','GUTF960212MDFRNN02',1,'1996-02-12 00:00:00',21),('V1','Diego','Castro','CAST930510MDFRST01',1,'1993-05-10 00:00:00',22),('V2','Alejandra','Ruiz','RUIA900803GTMRLD04',1,'1990-08-03 00:00:00',22),('V3','Roberta','Mendoza','MENR950705HDFRZB09',1,'1995-07-05 00:00:00',22),('Z1','Diana','López','LOPD910510MDFRDN01',1,'1991-05-10 00:00:00',26),('Z2','Javier','Castro','CAJJ900803GTMVCR04',1,'1990-08-03 00:00:00',26),('Z3','Adriana','Sánchez','SANA950705HDFRAD09',1,'1995-07-05 00:00:00',26);
/*!40000 ALTER TABLE `aspirante` ENABLE KEYS */;
UNLOCK TABLES;

-- ------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------
-- asistencias
-- ------------------------------------------------------------------------------------------------------------
INSERT INTO asistencias (id_asistencia, fecha, presente, aspirante_folio_aspirante) VALUES
                                                                                        (1, '2024-06-01', 'Sí', 'AA1'),
                                                                                        (2, '2024-06-01', 'No', 'AA2'),
                                                                                        (3, '2024-06-01', 'Sí', 'AA3'),
                                                                                        (4, '2024-06-02', 'Sí', 'AE1'),
                                                                                        (5, '2024-06-02', 'Sí', 'AE2'),
                                                                                        (6, '2024-06-02', 'No', 'AE3'),
                                                                                        (7, '2024-06-03', 'Sí', 'AF1'),
                                                                                        (8, '2024-06-03', 'Sí', 'AF2'),
                                                                                        (9, '2024-06-03', 'No', 'AF3'),
                                                                                        (10, '2024-06-04', 'Sí', 'AJ1'),
                                                                                        (11, '2024-06-04', 'No', 'AJ2'),
                                                                                        (12, '2024-06-04', 'Sí', 'AJ3'),
                                                                                        (13, '2024-06-05', 'Sí', 'AK1'),
                                                                                        (14, '2024-06-05', 'No', 'AK2'),
                                                                                        (15, '2024-06-05', 'Sí', 'AK3'),
                                                                                        (16, '2024-06-06', 'Sí', 'AO1'),
                                                                                        (17, '2024-06-06', 'Sí', 'AO2'),
                                                                                        (18, '2024-06-06', 'No', 'AO3'),
                                                                                        (19, '2024-06-07', 'Sí', 'AP1'),
                                                                                        (20, '2024-06-07', 'Sí', 'AP2'),
                                                                                        (21, '2024-06-07', 'No', 'AP3'),
                                                                                        (22, '2024-06-08', 'Sí', 'AT1'),
                                                                                        (23, '2024-06-08', 'Sí', 'AT2'),
                                                                                        (24, '2024-06-08', 'No', 'AT3'),
                                                                                        (25, '2024-06-09', 'Sí', 'AU1'),
                                                                                        (26, '2024-06-09', 'Sí', 'AU2'),
                                                                                        (27, '2024-06-09', 'No', 'AU3'),
                                                                                        (28, '2024-06-10', 'Sí', 'AY1'),
                                                                                        (29, '2024-06-10', 'Sí', 'AY2'),
                                                                                        (30, '2024-06-10', 'No', 'AY3'),
                                                                                        (31, '2024-06-11', 'Sí', 'AZ1'),
                                                                                        (32, '2024-06-11', 'Sí', 'AZ2'),
                                                                                        (33, '2024-06-11', 'No', 'AZ3'),
                                                                                        (34, '2024-06-12', 'Sí', 'B1'),
                                                                                        (35, '2024-06-12', 'Sí', 'B2'),
                                                                                        (36, '2024-06-12', 'No', 'B3'),
                                                                                        (37, '2024-06-13', 'Sí', 'F1'),
                                                                                        (38, '2024-06-13', 'Sí', 'F2'),
                                                                                        (39, '2024-06-13', 'No', 'F3'),
                                                                                        (40, '2024-06-14', 'Sí', 'G1'),
                                                                                        (41, '2024-06-14', 'Sí', 'G2'),
                                                                                        (42, '2024-06-14', 'No', 'G3'),
                                                                                        (43, '2024-06-15', 'Sí', 'K1'),
                                                                                        (44, '2024-06-15', 'Sí', 'K2'),
                                                                                        (45, '2024-06-15', 'No', 'K3'),
                                                                                        (46, '2024-06-16', 'Sí', 'L1'),
                                                                                        (47, '2024-06-16', 'Sí', 'L2'),
                                                                                        (48, '2024-06-16', 'No', 'L3'),
                                                                                        (49, '2024-06-17', 'Sí', 'P1'),
                                                                                        (50, '2024-06-17', 'Sí', 'P2'),
                                                                                        (51, '2024-06-17', 'No', 'P3'),
                                                                                        (52, '2024-06-18', 'Sí', 'Q1'),
                                                                                        (53, '2024-06-18', 'Sí', 'Q2'),
                                                                                        (54, '2024-06-18', 'No', 'Q3'),
                                                                                        (55, '2024-06-19', 'Sí', 'U1'),
                                                                                        (56, '2024-06-19', 'Sí', 'U2'),
                                                                                        (57, '2024-06-19', 'No', 'U3'),
                                                                                        (58, '2024-06-20', 'Sí', 'V1'),
                                                                                        (59, '2024-06-20', 'Sí', 'V2'),
                                                                                        (60, '2024-06-20', 'No', 'V3'),
                                                                                        (61, '2024-06-21', 'Sí', 'Z1'),
                                                                                        (62, '2024-06-21', 'Sí', 'Z2'),
                                                                                        (63, '2024-06-21', 'No', 'Z3');


-- ------------------------------------------------------------------------------------------------------------
-- Datos de usuarios
-- ------------------------------------------------------------------------------------------------------------

INSERT INTO usuarios (id_usuario, nombre, apellido, mail, contrasena, id_estado, id_rol, grupos_id_grupo)
VALUES (123, 'Jose', 'Saldaña', 'ejemplo1@gmial.com', 'admin', 1, 1,  NULL);
INSERT INTO usuarios (id_usuario, nombre, apellido, mail, contrasena, id_estado, id_rol, grupos_id_grupo)
VALUES (124, 'Orlanddo', 'ruiz', 'ejemplo2@gmial.com', 'admin', 1, 1,  NULL);
INSERT INTO usuarios (id_usuario, nombre, apellido, mail, contrasena, id_estado, id_rol,  grupos_id_grupo)
VALUES (125, 'pepe', 'sanchez', 'ejemplo3@gmial.com', 'admin', 2, 1, NULL);
INSERT INTO usuarios (id_usuario, nombre, apellido, mail, contrasena, id_estado, id_rol, grupos_id_grupo)
VALUES (126, 'Mauro', 'Bahena', 'ejemplo4@gmial.com', 'maesro', 1, 2,  22);
INSERT INTO usuarios (id_usuario, nombre, apellido, mail, contrasena, id_estado, id_rol, grupos_id_grupo)
VALUES (127, 'Sebastian', 'Sota', 'ejemplo5@gmial.com', 'maestro', 1, 2,  NULL);
INSERT INTO usuarios (id_usuario, nombre, apellido, mail, contrasena, id_estado, id_rol,  grupos_id_grupo)
VALUES (128, 'Carlos', 'Hernandez', 'carlos.hernandez@example.com', 'password1', 1, 1,  NULL);
INSERT INTO usuarios (id_usuario, nombre, apellido, mail, contrasena, id_estado, id_rol,  grupos_id_grupo)
VALUES (129, 'Laura', 'Martinez', 'laura.martinez@example.com', 'password2', 2, 2,  26);
INSERT INTO usuarios (id_usuario, nombre, apellido, mail, contrasena, id_estado, id_rol,  grupos_id_grupo)
VALUES (130, 'Miguel', 'Lopez', 'miguel.lopez@example.com', 'password3', 1, 2,  NULL);
INSERT INTO usuarios (id_usuario, nombre, apellido, mail, contrasena, id_estado, id_rol,  grupos_id_grupo)
VALUES (131, 'Ana', 'Gomez', 'ana.gomez@example.com', 'password4', 2, 1,  NULL);
INSERT INTO usuarios (id_usuario, nombre, apellido, mail, contrasena, id_estado, id_rol, grupos_id_grupo)
VALUES (132, 'Luis', 'Perez', 'luis.perez@example.com', 'password5', 1, 2,  22);
INSERT INTO usuarios (id_usuario, nombre, apellido, mail, contrasena, id_estado, id_rol,  grupos_id_grupo)
VALUES (133, 'Isabel', 'Diaz', 'isabel.diaz@example.com', 'password6', 2, 2,  NULL);
INSERT INTO usuarios (id_usuario, nombre, apellido, mail, contrasena, id_estado, id_rol,  grupos_id_grupo)
VALUES (134, 'David', 'Ramirez', 'david.ramirez@example.com', 'password7', 1, 1,  NULL);
INSERT INTO usuarios (id_usuario, nombre, apellido, mail, contrasena, id_estado, id_rol,  grupos_id_grupo)
VALUES (135, 'Sofia', 'Torres', 'sofia.torres@example.com', 'password8', 2, 2,  26);
INSERT INTO usuarios (id_usuario, nombre, apellido, mail, contrasena, id_estado, id_rol,  grupos_id_grupo)
VALUES (136, 'Andres', 'Sanchez', 'andres.sanchez@example.com', 'password9', 1, 2,  NULL);
INSERT INTO usuarios (id_usuario, nombre, apellido, mail, contrasena, id_estado, id_rol,  grupos_id_grupo)
VALUES (137, 'Maria', 'Ortiz', 'maria.ortiz@example.com', 'password10', 2, 1,  NULL);
INSERT INTO usuarios (id_usuario, nombre, apellido, mail, contrasena, id_estado, id_rol,  grupos_id_grupo)
VALUES (138, 'Jorge', 'Morales', 'jorge.morales@example.com', 'password11', 1, 2,  22);
INSERT INTO usuarios (id_usuario, nombre, apellido, mail, contrasena, id_estado, id_rol,  grupos_id_grupo)
VALUES (139, 'Natalia', 'Mendoza', 'natalia.mendoza@example.com', 'password12', 2, 2,  NULL);
INSERT INTO usuarios (id_usuario, nombre, apellido, mail, contrasena, id_estado, id_rol,  grupos_id_grupo)
VALUES (140, 'Pablo', 'Vargas', 'pablo.vargas@example.com', 'password13', 1, 1,  NULL);
INSERT INTO usuarios (id_usuario, nombre, apellido, mail, contrasena, id_estado, id_rol,  grupos_id_grupo)
VALUES (141, 'Lucia', 'Rojas', 'lucia.rojas@example.com', 'password14', 2, 2, NULL);
INSERT INTO usuarios (id_usuario, nombre, apellido, mail, contrasena, id_estado, id_rol, grupos_id_grupo)
VALUES (142, 'Enrique', 'Cruz', 'enrique.cruz@example.com', 'password15', 1, 2,  NULL);
INSERT INTO usuarios (id_usuario, nombre, apellido, mail, contrasena, id_estado, id_rol, grupos_id_grupo)
VALUES (143, 'Valeria', 'Herrera', 'valeria.herrera@example.com', 'password16', 2, 1, NULL);
INSERT INTO usuarios (id_usuario, nombre, apellido, mail, contrasena, id_estado, id_rol,  grupos_id_grupo)
VALUES (144, 'Adrian', 'Ibañez', 'adrian.ibanez@example.com', 'password17', 1, 2,  22);
INSERT INTO usuarios (id_usuario, nombre, apellido, mail, contrasena, id_estado, id_rol,  grupos_id_grupo)
VALUES (145, 'Laura', 'Garcia', 'laura.garcia@example.com', 'password18', 2, 2, NULL);
INSERT INTO usuarios (id_usuario, nombre, apellido, mail, contrasena, id_estado, id_rol,  grupos_id_grupo)
VALUES (146, 'Roberto', 'Castro', 'roberto.castro@example.com', 'password19', 1, 1, NULL);
INSERT INTO usuarios (id_usuario, nombre, apellido, mail, contrasena, id_estado, id_rol,  grupos_id_grupo)
VALUES (147, 'Carolina', 'Silva', 'carolina.silva@example.com', 'password20', 2, 2,  NULL);

-- ------------------------------------------------------------------------------------------------------------
-- Agregar calificaciones para los aspirantes
-- ------------------------------------------------------------------------------------------------------------
INSERT INTO calificaciones (id_calificacion, calificacion, aspirante_folio_aspirante)
VALUES
    (1, 8.5, 'A1'),
    (2, 7.2, 'A2'),
    (3, 9.0, 'A3'),
    (4, 6.8, 'AA1'),
    (5, 8.9, 'AA2'),
    (6, 7.5, 'AA3'),
    (7, 9.2, 'AE1'),
    (8, 6.5, 'AE2'),
    (9, 8.0, 'AE3'),
    (10, 8.7, 'AF1'),
    (11, 7.0, 'AF2'),
    (12, 9.5, 'AF3'),
    (13, 8.1, 'AJ1'),
    (14, 7.8, 'AJ2'),
    (15, 9.3, 'AJ3'),
    (16, 8.4, 'AK1'),
    (17, 7.3, 'AK2'),
    (18, 9.8, 'AK3'),
    (19, 8.9, 'AO1'),
    (20, 7.2, 'AO2'),
    (21, 9.1, 'AO3'),
    (22, 8.6, 'AP1'),
    (23, 7.5, 'AP2'),
    (24, 9.4, 'AP3'),
    (25, 8.2, 'AT1'),
    (26, 7.7, 'AT2'),
    (27, 9.7, 'AT3'),
    (28, 8.3, 'AU1'),
    (29, 7.9, 'AU2'),
    (30, 9.2, 'AU3'),
    (31, 8.8, 'AY1'),
    (32, 7.1, 'AY2'),
    (33, 9.6, 'AY3'),
    (34, 8.0, 'AZ1'),
    (35, 7.6, 'AZ2'),
    (36, 9.5, 'AZ3'),
    (37, 8.5, 'B1'),
    (38, 7.4, 'B2'),
    (39, 9.0, 'B3'),
    (40, 8.1, 'F1'),
    (41, 7.2, 'F2'),
    (42, 9.3, 'F3'),
    (43, 8.2, 'G1'),
    (44, 7.8, 'G2'),
    (45, 9.1, 'G3'),
    (46, 8.3, 'K1'),
    (47, 7.7, 'K2'),
    (48, 9.4, 'K3'),
    (49, 8.4, 'L1'),
    (50, 7.5, 'L2'),
    (51, 9.2, 'L3'),
    (52, 8.5, 'P1'),
    (53, 7.4, 'P2'),
    (54, 9.0, 'P3'),
    (55, 8.6, 'Q1'),
    (56, 7.9, 'Q2'),
    (57, 9.3, 'Q3'),
    (58, 8.7, 'U1'),
    (59, 7.6, 'U2'),
    (60, 9.5, 'U3'),
    (61, 8.8, 'V1'),
    (62, 7.3, 'V2'),
    (63, 9.7, 'V3'),
    (64, 8.9, 'Z1'),
    (65, 7.2, 'Z2'),
    (66, 9.8, 'Z3');



