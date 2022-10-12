/* ---------------------------------------------------------------------- */
/* Script generated with: DeZign for Databases 13.0.1                     */
/* Target DBMS:           Oracle 11g                                      */
/* Project file:          ModeloLicencias.dez                             */
/* Project name:                                                          */
/* Author:                                                                */
/* Script type:           Database drop script                            */
/* Created on:            2022-10-08 22:43                                */
/* ---------------------------------------------------------------------- */


/* ---------------------------------------------------------------------- */
/* Drop foreign key constraints                                           */
/* ---------------------------------------------------------------------- */

ALTER TABLE Liquidacion_Resumen DROP CONSTRAINT Empresa_Liquidacion_Resumen;

ALTER TABLE Liquidacion_Resumen DROP CONSTRAINT Trabajador_Liquidacion_Resumen;

ALTER TABLE Liquidacion_Detalle DROP CONSTRAINT Liquidacion_Resumen_Liquidacion_Detalle;

ALTER TABLE Licencia DROP CONSTRAINT Empresa_Licencia;

ALTER TABLE Licencia DROP CONSTRAINT TipoLicencia_Licencia;

ALTER TABLE Licencia DROP CONSTRAINT Sucursal_Licencia;

ALTER TABLE Licencia DROP CONSTRAINT Trabajador_Licencia;

ALTER TABLE PagoLicencias DROP CONSTRAINT Licencia_PagoLicencias;

ALTER TABLE PagoLicencias DROP CONSTRAINT EstadoLicencias_PagoLicencias;

/* ---------------------------------------------------------------------- */
/* Drop table "PagoLicencias"                                             */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE PagoLicencias DROP CONSTRAINT NN_PagoLicencias_idPago;

ALTER TABLE PagoLicencias DROP CONSTRAINT NN_PagoLicencias_idLicencia;

ALTER TABLE PagoLicencias DROP CONSTRAINT NN_PagoLicencias_idEstado;

ALTER TABLE PagoLicencias DROP CONSTRAINT NN_PagoLicencias_fecha_recepcion;

ALTER TABLE PagoLicencias DROP CONSTRAINT NN_PagoLicencias_fecha_resolucion;

ALTER TABLE PagoLicencias DROP CONSTRAINT PK_PagoLicencias;

DROP TABLE PagoLicencias;

/* ---------------------------------------------------------------------- */
/* Drop table "Licencia"                                                  */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE Licencia DROP CONSTRAINT NN_Licencia_idLicencia;

ALTER TABLE Licencia DROP CONSTRAINT NN_Licencia_idTipoLicencia;

ALTER TABLE Licencia DROP CONSTRAINT NN_Licencia_idEmpresa;

ALTER TABLE Licencia DROP CONSTRAINT NN_Licencia_idTrabajador;

ALTER TABLE Licencia DROP CONSTRAINT NN_Licencia_id_Sucursal;

ALTER TABLE Licencia DROP CONSTRAINT NN_Licencia_fecha_inicio;

ALTER TABLE Licencia DROP CONSTRAINT PK_Licencia;

DROP TABLE Licencia;

/* ---------------------------------------------------------------------- */
/* Drop table "Liquidacion_Detalle"                                       */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE Liquidacion_Detalle DROP CONSTRAINT NN_Liquidacion_Detalle_idLiquidacion;

ALTER TABLE Liquidacion_Detalle DROP CONSTRAINT NN_Liquidacion_Detalle_item;

ALTER TABLE Liquidacion_Detalle DROP CONSTRAINT PK_Liquidacion_Detalle;

DROP TABLE Liquidacion_Detalle;

/* ---------------------------------------------------------------------- */
/* Drop table "Liquidacion_Resumen"                                       */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE Liquidacion_Resumen DROP CONSTRAINT NN_Liquidacion_Resumen_idLiquidacion;

ALTER TABLE Liquidacion_Resumen DROP CONSTRAINT NN_Liquidacion_Resumen_idEmpresa;

ALTER TABLE Liquidacion_Resumen DROP CONSTRAINT NN_Liquidacion_Resumen_idTrabajador;

ALTER TABLE Liquidacion_Resumen DROP CONSTRAINT PK_Liquidacion_Resumen;

DROP TABLE Liquidacion_Resumen;

/* ---------------------------------------------------------------------- */
/* Drop table "EstadoLicencias"                                           */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE EstadoLicencias DROP CONSTRAINT NN_EstadoLicencias_idEstado;

ALTER TABLE EstadoLicencias DROP CONSTRAINT NN_EstadoLicencias_nombreEstado;

ALTER TABLE EstadoLicencias DROP CONSTRAINT PK_EstadoLicencias;

DROP TABLE EstadoLicencias;

/* ---------------------------------------------------------------------- */
/* Drop table "Sucursal"                                                  */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE Sucursal DROP CONSTRAINT NN_Sucursal_id_Sucursal;

ALTER TABLE Sucursal DROP CONSTRAINT NN_Sucursal_nombreSucursal;

ALTER TABLE Sucursal DROP CONSTRAINT NN_Sucursal_licenciaDigital;

ALTER TABLE Sucursal DROP CONSTRAINT NN_Sucursal_licenciaFisica;

ALTER TABLE Sucursal DROP CONSTRAINT NN_Sucursal_licenciaSanna;

ALTER TABLE Sucursal DROP CONSTRAINT PK_Sucursal;

DROP TABLE Sucursal;

/* ---------------------------------------------------------------------- */
/* Drop table "TipoLicencia"                                              */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE TipoLicencia DROP CONSTRAINT NN_TipoLicencia_idTipoLicencia;

ALTER TABLE TipoLicencia DROP CONSTRAINT PK_TipoLicencia;

DROP TABLE TipoLicencia;

/* ---------------------------------------------------------------------- */
/* Drop table "Trabajador"                                                */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE Trabajador DROP CONSTRAINT NN_Trabajador_idTrabajador;

ALTER TABLE Trabajador DROP CONSTRAINT NN_Trabajador_rutTrabajador;

ALTER TABLE Trabajador DROP CONSTRAINT PK_Trabajador;

DROP TABLE Trabajador;

/* ---------------------------------------------------------------------- */
/* Drop table "Empresa"                                                   */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE Empresa DROP CONSTRAINT NN_Empresa_idEmpresa;

ALTER TABLE Empresa DROP CONSTRAINT NN_Empresa_rutEmpresa;

ALTER TABLE Empresa DROP CONSTRAINT PK_Empresa;

DROP TABLE Empresa;
