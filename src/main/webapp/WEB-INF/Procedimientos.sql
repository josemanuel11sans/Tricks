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
    aspirantes ON grupos.id_grupo = aspirantes.grupos_id_grupo
GROUP BY
    grupos.id_grupo, usuarios.id_usuario, carreras.id_carrera, divisiones_academicas.id_division;
END //
	DELIMITER ;



   DELIMITER //
CREATE PROCEDURE verAspirantes()
BEGIN
SELECT DISTINCT a.folio_aspirante AS folio_aspirante,
                a.nombre AS nombre,
                a.apellido AS apellido,
                a.curp AS curp,
                a.grupos_id_grupo AS grupos_id_grupo,
                a.estado AS estado_id_estado,
                a.fecha_nac AS fecha_nac,
                g.nombre_grupo AS grupo
FROM aspirantes a
         INNER JOIN grupos g ON a.grupos_id_grupo = g.id_grupo
ORDER BY folio_aspirante ASC;
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

