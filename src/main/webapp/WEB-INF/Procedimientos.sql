DELIMITER //
CREATE PROCEDURE verDocentes ()
BEGIN
SELECT u.id_usuario AS matricula,
       u.nombre as nombre,
       u.apellido as apellido,
       u.mail AS correo,
       u.estado AS estadoCorrecto
FROM usuarios u
WHERE u.rol = 2;
END //
    DELIMITER ;



    DELIMITER //
CREATE PROCEDURE verGrupos()
BEGIN
SELECT
    grupos.id_grupo AS idGrupo,
    grupos.nombre_grupo AS nombreGrupo,
    usuarios.nombre as nombre,
    usuarios.apellido as apellido,
    carreras.nombre_carrera AS carrera,
    divisiones_academicas.siglas as  divisionAcademica,
    grupos.estado as estadoIdEstado,
    grupos.carreras_id_carrera as carreras_id_carrera,
    usuarios.id_usuario as id_usuario
FROM
    grupos
        JOIN
    carreras ON grupos.carreras_id_carrera = carreras.id_carrera
        JOIN
    divisiones_academicas ON carreras.divisiones_academicas_id_division = divisiones_academicas.id_division
        LEFT JOIN
    usuarios ON grupos.id_grupo = usuarios.grupos_id_grupo
        JOIN
    aspirantes ON grupos.id_grupo = aspirantes.grupos_id_grupo
GROUP BY
    grupos.id_grupo, usuarios.id_usuario, carreras.id_carrera, divisiones_academicas.id_division;
END //
        DELIMITER ;





    DELIMITER //
CREATE PROCEDURE verCarreras()
BEGIN
select c.id_carrera ,c.nombre_carrera, d.siglas, c.estado as estado
from carreras c
         inner join divisiones_academicas d on d.id_division = c.divisiones_academicas_id_division;
END //
    DELIMITER ;


        -- procedimeinto para ver divisiones academiscas
DELIMITER //
CREATE PROCEDURE verDivisionesAcademicas()
BEGIN
SELECT * FROM divisiones_academicas;
END //
DELIMITER ;




DELIMITER //
CREATE PROCEDURE GetAllAspirantes()
BEGIN
SELECT a.folio_aspirante, a.nombre, a.apellido, a.curp, a.estado, a.fecha_nac, g.nombre_grupo
FROM aspirantes a
         LEFT JOIN grupos g
                   ON g.id_grupo = a.grupos_id_grupo;
END //
DELIMITER ;


//procedimiento para ver los alumnos conforme el id del grupo
DELIMITER //

CREATE PROCEDURE GetAlumnosPorGrupo(IN grupo_id INT)
BEGIN
SELECT a.folio_aspirante, a.nombre, a.apellido, c.nombre_carrera, a.estado,
       COALESCE(cal.calificacion, 0) as calificacion
FROM aspirantes a
         JOIN grupos g ON a.grupos_id_grupo = g.id_grupo
         JOIN carreras c ON g.carreras_id_carrera = c.id_carrera
         LEFT JOIN calificaciones cal ON a.folio_aspirante = cal.aspirante_folio_aspirante
WHERE g.id_grupo = grupo_id;
END //

DELIMITER ;
