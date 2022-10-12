
CREATE TABLE Empresa (
    idEmpresa INTEGER,
    rutEmpresa VARCHAR(15),
    nombreEmpresa VARCHAR(35),
    PRIMARY KEY (idEmpresa)
);

/* ---------------------------------------------------------------------- */
/* Add table "Trabajador"                                                 */
/* ---------------------------------------------------------------------- */

CREATE TABLE Trabajador (
    idTrabajador INTEGER,
    rutTrabajador VARCHAR(11),
    nombres VARCHAR(40),
    apellidoPaterno VARCHAR(20),
    apellidoMaterno VARCHAR(20),
    fechaNacimiento DATE,
    estadoAfiliacion INTEGER ,
    PRIMARY KEY (idTrabajador, rutTrabajador)
);

/* ---------------------------------------------------------------------- */
/* Add table "TipoLicencia"                                               */
/* ---------------------------------------------------------------------- */

CREATE TABLE TipoLicencia (
    idTipoLicencia INTEGER ,
    nombreTipoLicencia VARCHAR(40),
    PRIMARY KEY (idTipoLicencia)
);

/* ---------------------------------------------------------------------- */
/* Add table "Sucursal"                                                   */
/* ---------------------------------------------------------------------- */

CREATE TABLE Sucursal (
    id_Sucursal INTEGER CONSTRAINT NN_Sucursal_id_Sucursal NOT NULL,
    comunaSucursal VARCHAR(30),
    nombreSucursal VARCHAR(25),
    licenciaDigital INTEGER,
    licenciaFisica INTEGER,
    licenciaSanna INTEGER,
    PRIMARY KEY (id_Sucursal)
);

/* ---------------------------------------------------------------------- */
/* Add table "EstadoLicencias"                                            */
/* ---------------------------------------------------------------------- */

CREATE TABLE EstadoLicencias (
    idEstado INTEGER ,
    nombreEstado VARCHAR(10),
    PRIMARY KEY (idEstado)
);

/* ---------------------------------------------------------------------- */
/* Add table "Liquidacion_Resumen"                                        */
/* ---------------------------------------------------------------------- */

CREATE TABLE Liquidacion_Resumen (
    idLiquidacion INTEGER ,
    idEmpresa INTEGER ,
    idTrabajador INTEGER,
    fechaLiquidacion DATE,
    totalPago INTEGER,
    PRIMARY KEY (idLiquidacion, idEmpresa, idTrabajador)
);

/* ---------------------------------------------------------------------- */
/* Add table "Liquidacion_Detalle"                                        */
/* ---------------------------------------------------------------------- */

CREATE TABLE Liquidacion_Detalle (
    idLiquidacion INTEGER,
    item VARCHAR(10) ,
    valor INTEGER NOT NULL,
    PRIMARY KEY (idLiquidacion)
);

/* ---------------------------------------------------------------------- */
/* Add table "Licencia"                                                   */
/* ---------------------------------------------------------------------- */

CREATE TABLE Licencia (
    idLicencia INTEGER,
    idTipoLicencia INTEGER,
    idEmpresa INTEGER ,
    idTrabajador INTEGER,
    id_Sucursal INTEGER,
    fecha_inicio DATE,
    fecha_fin DATE NOT NULL,
    PRIMARY KEY (idLicencia, idTipoLicencia, id_Sucursal)
);

/* ---------------------------------------------------------------------- */
/* Add table "PagoLicencias"                                              */
/* ---------------------------------------------------------------------- */

CREATE TABLE PagoLicencias (
    idPago INTEGER,
    idLicencia INTEGER,
    idEstado INTEGER ,
    fecha_recepcion DATE,
    fecha_resolucion DATE,
    comentarioRechazo VARCHAR(100),
    PRIMARY KEY (idPago, idLicencia, idEstado)
);

/* ---------------------------------------------------------------------- */
/* Add table "LogEstadoLicencias"                                         */
/* ---------------------------------------------------------------------- */

CREATE TABLE LogEstadoLicencias (
    idLog INTEGER ,
    idLicencia INTEGER,
    idEstado INTEGER,
    idEstadoAntrerior INTEGER,
    fecha DATE ,
    fechaEstadoAnterior DATE,
    idPago INTEGER,
    PRIMARY KEY (idLog, fecha)
);

/* ---------------------------------------------------------------------- */
/* Add foreign key constraints                                            */
/* ---------------------------------------------------------------------- */

ALTER TABLE Liquidacion_Resumen ADD FOREIGN KEY (idEmpresa) REFERENCES Empresa (idEmpresa);

ALTER TABLE Liquidacion_Resumen ADD  FOREIGN KEY (idTrabajador) REFERENCES Trabajador (idTrabajador);

ALTER TABLE Liquidacion_Detalle ADD FOREIGN KEY (idLiquidacion) REFERENCES Liquidacion_Resumen (idLiquidacion);

ALTER TABLE Licencia ADD FOREIGN KEY (idTrabajador) REFERENCES Trabajador (idTrabajador);

ALTER TABLE Licencia ADD FOREIGN KEY (idEmpresa) REFERENCES Empresa (idEmpresa);

ALTER TABLE Licencia ADD FOREIGN KEY (idTipoLicencia) REFERENCES TipoLicencia (idTipoLicencia);

ALTER TABLE Licencia ADD FOREIGN KEY (id_Sucursal) REFERENCES Sucursal (id_Sucursal);

ALTER TABLE PagoLicencias ADD FOREIGN KEY (idLicencia) REFERENCES Licencia (idLicencia);

ALTER TABLE PagoLicencias ADD  FOREIGN KEY (idEstado) REFERENCES EstadoLicencias (idEstado);

ALTER TABLE LogEstadoLicencias ADD FOREIGN KEY (idPago, idLicencia, idEstado) REFERENCES PagoLicencias (idPago,idLicencia,idEstado);
