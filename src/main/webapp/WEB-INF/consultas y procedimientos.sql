-- ------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------
-- RECUERDEN QUE ESTE SCRIPT DE SQL NO SE EJECUTA DE JALON
-- ES PROCEDIMIENTO POT PROCEDIMIENTO
-- ESTA MARCADO CADA UNO QUE ES LO QUE HACE
-- ------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------
USE tricks;

SELECT * FROM tricks.usuarios;
-- muestra los usuario no activos
select u.id_usuario as matricula, u.nombre as nombre,
       u.apellido as apellido, u.mail as mail, e.estado
from usuarios u  inner join estado e on e.id_estado = u.id_estado where u.id_estado = 2 group by matricula ;
-- -------------------------------------------------------------------------------------------------------------
-- muestra los usuarios activos
select u.id_usuario as matricula, u.nombre as nombre,
       u.apellido as apellido, u.mail as mail, e.estado
from usuarios u  inner join estado e on e.id_estado = u.id_estado where u.id_estado = 1 group by matricula ;
-- -------------------------------------------------------------------------------------------------------------

-- procedimiento que mermite ver los usuarios segun su rol
-- la variable de entrada es el tipo de rol, con esto podemos mostra o solos maestros, solo admistradores
-- en el caso de bombre y apelldio se concatena  para que se muestren juntos en la tabla, y es usa el identificador
-- "nombre completo"
DELIMITER //
CREATE PROCEDURE verUsuarios(
    IN new_id_rol INT  -- Parámetro de entrada para el nuevo id_rol
)
BEGIN
SELECT u.id_usuario, CONCAT(u.nombre, ' ', u.apellido) AS nombre_completo, u.contrasena, u.mail, e.estado
FROM usuarios u
         INNER JOIN estado e ON e.id_estado = u.id_estado
WHERE u.id_rol = new_id_rolusuarios
GROUP BY u.id_usuario
ORDER BY u.id_usuario ASC;
END //
	DELIMITER ;
CALL verUsuarios(2);
DROP PROCEDURE IF EXISTS verUsuarios ;
-- -------------------------------------------------------------------------------------------------------------

-- ----------------------------------------------------------------------------
-- procedimiento para ver Docentes
-- ------------------------------------------------------------------------------
DELIMITER //

CREATE PROCEDURE verDocentes ()
BEGIN
SELECT u.id_usuario AS matricula,
       CONCAT(u.nombre, ' ', u.apellido) AS nombre_completo,
       u.mail AS correo,
       e.estado AS estado
FROM usuarios u
         JOIN estado e ON u.id_estado = e.id_estado
WHERE u.id_rol = 2;
END //

DELIMITER ;
CALL verDocentes();


-- ----------------------------------------------------------------------------
-- procedimiento para ver grupos
-- ------------------------------------------------------------------------------
select * from  grupos;
select * from  usuarios where id_rol = 2;
select * from carreras;
select * from divisiones_academicas;

-- consulta
select grupos.id_grupo as idGrupo, grupos.nombre_grupo as nombreGrupo, CONCAT(usuarios.nombre, ' ', usuarios.apellido) as decente,
       carreras.nombre_carrera as carrera, divisiones_academicas.siglas as  divisionAcademica from grupos
                                                                                                       join carreras on grupos.carreras_id_carrera = carreras.id_carrera
                                                                                                       join divisiones_academicas on carreras.divisiones_academicas_id_division = divisiones_academicas.id_division
                                                                                                       left join usuarios on grupos.id_grupo = usuarios.grupos_id_grupo
                                                                                                       left join aspirante on grupos.id_grupo = aspirante.grupos_id_grupo
group by grupos.id_grupo, usuarios.id_usuario, carreras.id_carrera, divisiones_academicas.id_division;

-- procedimiento
DELIMITER //
CREATE PROCEDURE verGrupos()
BEGIN
SELECT
    grupos.id_grupo AS idGrupo,
    grupos.nombre_grupo AS nombreGrupo,
    CONCAT(usuarios.nombre, ' ', usuarios.apellido) AS docente,
    carreras.nombre_carrera AS carrera,
    divisiones_academicas.siglas as  divisionAcademica
FROM
    grupos
        JOIN
    carreras ON grupos.carreras_id_carrera = carreras.id_carrera
        JOIN
    divisiones_academicas ON carreras.divisiones_academicas_id_division = divisiones_academicas.id_division
        LEFT JOIN
    usuarios ON grupos.id_grupo = usuarios.grupos_id_grupo
        LEFT JOIN
    aspirante ON grupos.id_grupo = aspirante.grupos_id_grupo
GROUP BY
    grupos.id_grupo, usuarios.id_usuario, carreras.id_carrera, divisiones_academicas.id_division;
END //
	DELIMITER ;

call verGrupos();
DROP PROCEDURE IF EXISTS verGrupos ;

-- Procedimiento ver Aspirantes
DELIMITER //
CREATE PROCEDURE verAspirantes()
BEGIN
SELECT DISTINCT a.folio_aspirante AS folio_aspirante,
                a.nombre AS nombre,
                a.apellido AS apellido,
                a.curp AS curp,
                a.grupos_id_grupo AS grupos_id_grupo,
                a.estado_id_estado AS estado_id_estado,
                a.fecha_nac AS fecha_nac,
                g.nombre_grupo AS grupo
FROM aspirante a
         INNER JOIN grupos g ON a.grupos_id_grupo = g.id_grupo
ORDER BY folio_aspirante ASC;
END //
DELIMITER ;

-- Llamada al procedimiento
CALL verAspirantes();

-- Si deseas eliminar el procedimiento después de usarlo
DROP PROCEDURE IF EXISTS verAspirantes;
