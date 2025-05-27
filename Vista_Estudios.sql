CREATE VIEW estudios_powerbi as
SELECT 
T3.idpedido AS ID
,T3.idconsulta	AS IDCONSULTA
,T1.nombre AS ESTUDIO_CATEGORIA
,T2.nombre AS ESTUDIO
FROM estudio T1
INNER JOIN det_estudio T2 ON T1.idestudio = T2.idestudio
INNER JOIN pedidos T3 ON T2.iddet_estudio = T3.iddet_estudio
go

