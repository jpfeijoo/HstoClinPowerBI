ALTER VIEW consultas_powerbi as
SELECT 
T1.idconsulta AS ID
,CONVERT(varchar,T1.fecha, 103) AS FECHA
,T2.idservicio AS IDSERVICIO
,T3.nombre AS ATENCION
,IIF(T3.tipo_servicio=1,'EXAMEN','CONSULTA') AS ES_EXAMEN
,T2.costo AS VALOR
,T2.idpaciente AS IDPACIENTE
,T2.idespecialista AS IDESPECIALISTA
,T7.titulo + ' ' + T7.nombres + ' ' + T7.apellidos ESPECIALISTA
,IIF(T1.alergias=1,'SI','NO') ALERGIAS
,T4.presion_arterail AS PRESION_ARTERIAL
,T4.temperatura AS TEMPERATURA
,T4.frec_resp AS FRECUENCIA_RESPIRATORIA
,T4.frec_card AS FRECUENCIA_CARDIACA
,T4.saturacion AS SATURACION
,T4.peso AS PESO
,T4.talla AS TALLA
,T1.iddiagnostico AS IDDIAGNOSTICO
,T5.diagnostico AS DIAGNOSTICO
,T1.idcie10 AS IDCIE10
,T6.CODCIE10 + ' - ' + T6.nombre CIE10
FROM consultas T1
INNER JOIN atencion T2 ON T2.idatencion = T1.idatencion
INNER JOIN servicio T3 ON T3.idservicio = T2.idservicio
INNER JOIN turno T4 ON T4.idatencion = T2.idatencion
INNER JOIN diagnostico T5 ON T5.iddiagnostico = T1.iddiagnostico
INNER JOIN cie10_detalle T6 ON T6.idcie10det = T1.idcie10
INNER JOIN especialista T7 ON T7.idespecialista = T2.idespecialista
WHERE T2.estado = 1
AND T3.tipo_servicio = 0
UNION
SELECT 
T1.idconsulta AS ID
,CONVERT(varchar,T1.fecha, 103)  AS FECHA
,T2.idservicio AS IDSERVICIO
,T3.nombre AS ATENCION
,IIF(T3.tipo_servicio=1,'EXAMEN','CONSULTA') AS ES_EXAMEN
,T2.costo AS VALOR
,T2.idpaciente AS IDPACIENTE
,T2.idespecialista AS IDESPECIALISTA
,T7.titulo + ' ' + T7.nombres + ' ' + T7.apellidos ESPECIALISTA
,IIF(T1.alergias=1,'SI','NO') ALERGIAS
,ISNULL(T4.presion_arterail,'0/0') AS PRESION_ARTERIAL
,ISNULL(T4.temperatura,'0') AS TEMPERATURA
,ISNULL(T4.frec_resp,'0') AS FRECUENCIA_RESPIRATORIA
,ISNULL(T4.frec_card,'0') AS FRECUENCIA_CARDIACA
,ISNULL(T4.saturacion,'0') AS SATURACION
,ISNULL(T4.peso,'0') AS PESO
,ISNULL(T4.talla,'0') AS TALLA
,T1.iddiagnostico AS IDDIAGNOSTICO
,T5.diagnostico AS DIAGNOSTICO
,T1.idcie10 AS IDCIE10
,T6.CODCIE10 + ' - ' + T6.nombre CIE10
FROM consultas T1
INNER JOIN atencion T2 ON T2.idatencion = T1.idatencion
INNER JOIN servicio T3 ON T3.idservicio = T2.idservicio
LEFT OUTER JOIN turno T4 ON T4.idatencion = T2.idatencion
INNER JOIN diagnostico T5 ON T5.iddiagnostico = T1.iddiagnostico
INNER JOIN cie10_detalle T6 ON T6.idcie10det = T1.idcie10
INNER JOIN especialista T7 ON T7.idespecialista = T2.idespecialista
WHERE T2.estado = 1
AND T3.tipo_servicio = 1
GO