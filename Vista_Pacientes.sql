CREATE VIEW pacientes_powerbi as 
SELECT 
T1.idpaciente AS ID
,T1.apellidos + ' ' + T1.nombres AS PACIENTE
,T1.fecha_nac AS FECHA_NACIMIENTO
,T1.sexo AS GENERO
,T1.estado_civil AS ESTADO_CIVIL
,IIF(T1.estado=1,'SI','NO') AS ACTIVO
FROM paciente T1
go