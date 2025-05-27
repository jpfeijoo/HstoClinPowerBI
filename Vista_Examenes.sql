CREATE VIEW examen_powerbi as
SELECT 
T1.idexamenes AS ID
,T1.idconsulta AS IDCONSULTA
,T1.idespecialista AS IDSOLICITANTE
,T2.titulo + ' ' + T2.nombres + ' ' + T2.apellidos AS MED_SOLICITANTE
FROM examenes T1
INNER JOIN especialista T2 ON T1.idespecialista = T2.idespecialista
WHERE T1.estado = 1
go
