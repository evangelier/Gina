
-- a.	Top de empresas que sus trabajadores presentan más licencias.
SELECT TOP 10 
E,nombreEmpresa, L.cantidad
FROM [Empresa] E
	LEFT JOIN 
			(
				SELECT idEmpresa, COUNT(idLicencia) cantidad
				FROM [Licencia]
				GROUP BY idEmpresa
			) L
	ON E.idEmpresa=L.idEmpresa
ORDER BY L.cantidad desc

-- b.	Las sucursales que reciben más documentación, segmentados por región o comuna, 
-- así como sucursales que no están aptas para recibir documentación.
SELECT idSucursal, comunaSucursal as Comuna, count(1) cantidad, 
'aptas para recibir documentación' comentario
FROM [Sucursal]
WHERE licenciaFEisica=1
GROUP BY idSucursal, comunaSucursal
UNION ALL
SELECT idSucursal, comunaSucursal as Comuna, count(1) cantidad, 
'NO están aptas para recibir documentación' comentario
FROM [Sucursal]
WHERE licenciaFEisica=0
GROUP BY idSucursal, comunaSucursal
ORDER BY 3 desc

-- c.	Top de documentos que hacen que la licencia reinicie su flujo.
SELECT TOP 10 PL.ComentarioRechazo, count(1) cantidadDocumentos
FROM [PagoLicencias] PL
	LEFT JOIN [EstadoLicencvias] EL
	ON PL.idEstado=EL.idEstado
WHERE EL.nombreEstado<>'PAGADA'	
GROUP BY PL.ComentarioRechazo
ORDER BY 2 DESC

-- d.	Tiempos promedios, mínimos y máximos, desde el inicio del proceso hasta el cálculo del monto a pagar por cada licencia
SELECT R.idLicencia, DATEDIFF(dd,  R.fecha_recepcion, A.fecha_resolucion) dias_proceso
FROM 
	(
	SELECT idLicencia, fecha_recepcion
	FROM [PagoLicencias] PL
		LEFT JOIN [EstadoLicencvias] EL
		ON PL.idEstado=EL.idEstado
	WHERE EL.nombreEstado='RECEPCIONADA'	
	GROUP BY PL.ComentarioRechazo
	) R
	INNER JOIN 
	(
	SELECT idLicencia, fecha_resolucion
	FROM [PagoLicencias] PL
		LEFT JOIN [EstadoLicencvias] EL
		ON PL.idEstado=EL.idEstado
	WHERE EL.nombreEstado='APROBADA'	
	GROUP BY PL.ComentarioRechazo
	) A
	ON R.idLicencia=A.idLicencia

-- e.	Estadísticas de licencias manuales vs electrónicas vs mixtas
SELECT T.nombreTipoLicencia, count(L.idLicencia)
FROM [Licencia] L
	INNER JOIN TipoLicencia T
		ON L.idLicencia=T.idLicencia

-- f.	Los estados del proceso que almacenan la mayor cantidad de licencias así como los cambios de estado que tardan más tiempo en ser modificados
SELECT EL.nombreEstado, count(1) cantidad
FROM [PagoLicerncias] PL
	LEFT JOIN [EstadoLicencias] EL
	ON PL.idEstado=El.idEstado
-- g.	Trabajadores que tienen licencia y son desafiliados
SELECT L.idLicencia
FROM [Licencia] L
	LEFT JOIN [Trabajador] T
		ON L.idTrabajador=T.idTrabajador
	LEFT JOIN [PagoLicencias] P
		ON L.idLicencia=P.idLicencia
WHERE T.estadoAfiliacion=0
-- h.	Manejo de data histórica, de validación de procesos y log’s de cambios de estado o actualización de data relevante.
SELECT 	LEL.idLog, EL.nombreEstado, PL.fecha_recepcion, PL.fecha_resolucion, PL.comentarioRechazo,
		LEL.idEstado, LEL.fecha
FROM [PagoLicencias] PL
	INNER JOIN [LogEstadoLicencias] LEL
		ON PL.idLicencia=LEL.idLicencia
	INNER JOIN [EstadoLicencias] EL
		ON PL.idEstado=El.idEstado
GROUP BY LEL.idLog, EL.nombreEstado, PL.fecha_recepcion, PL.fecha_resolucion, PL.comentarioRechazo,
		LEL.idEstado, LEL.fecha
ORDER BY LEL.idLog, EL.nombreEstado, PL.fecha_recepcion, PL.fecha_resolucion, PL.comentarioRechazo,
		LEL.idEstado, LEL.fecha		

