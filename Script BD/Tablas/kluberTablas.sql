CREATE TABLE Admin(
	usuario VARCHAR[100] PRIMARY KEY NOT NULL,
	clave VARCHAR[100] PRIMARY KEY NOT	NULL
)

CREATE TABLE Persona (
	correo VARCHAR(256) PRIMARY KEY NOT NULL,
	nombre VARCHAR(256) NOT NULL,
	apPaterno VARCHAR(256) NOT NULL,
	apMaterno VARCHAR(256) NOT NULL,
	direccion VARCHAR(256) NOT NULL,
	telefono VARCHAR(256) NOT NULL,
	clave VARCHAR(256) NOT NULL
);

CREATE TABLE Empresa (
	rut VARCHAR(256) PRIMARY KEY NOT NULL,
	correo VARCHAR(256) NOT NULL,
	nombre VARCHAR(256) NOT NULL,
	direccion VARCHAR(256) NOT NULL,
	telefono VARCHAR(256) NOT NULL,
	clave VARCHAR(256)
);

CREATE TABLE Encargado (
	refPersona VARCHAR(256),
	refEmpresa VARCHAR(256),
	FOREIGN KEY (refPersona) REFERENCES Persona(correo) ON UPDATE CASCADE,
	FOREIGN KEY (refEmpresa) REFERENCES Empresa(rut) ON UPDATE CASCADE
);

CREATE TABLE Pasajeros(
	id VARCHAR(256) PRIMARY KEY NOT NULL,
	nombre VARCHAR(256) NOT NULL,
	apPaterno VARCHAR(256) NOT NULL,
	apMaterno VARCHAR(256) NOT NULL
);


CREATE TABLE Taxista(
	rut VARCHAR(256) PRIMARY KEY NOT NULL,
	correo VARCHAR(256) NOT NULL,
	nombre VARCHAR(256) NOT NULL,
	apPaterno VARCHAR(256) NOT NULL,
	apMaterno VARCHAR(256) NOT NULL,
	telefono BIGINT NOT NULL,
	clave VARCHAR(256) NOT NULL
)

CREATE TABLE Recorrido (
	id VARCHAR(256) NOT NULL,
	fecha DATE NOT NULL,
	hora TIME NOT NULL,
	lugarInicio VARCHAR[100] NOT NULL,
	lugarDestino VARCHAR[100] NOT NULL
);


CREATE TABLE EmpresarRecorrido(
	refRecorrido VARCHAR(256),
	refEmpresa VARCHAR(256),
	refPasajeros VARCHAR(256),
	FOREIGN KEY (refRecorrido) REFERENCES Recorrido(id) ON UPDATE CASCADE,
	FOREIGN KEY (refEmpresa) REFERENCES Empresa(rut) ON UPDATE CASCADE,
	FOREIGN KEY (refPasajeros) REFERENCES Pasajeros(id) ON UPDATE CASCADE
)

CREATE TABLE PersonaRecorrido(
	refRecorrido VARCHAR(256),
	refEmpresa VARCHAR(256),
	FOREIGN KEY (refRecorrido) REFERENCES Recorrido(id) ON UPDATE CASCADE,
	FOREIGN KEY (refPersona) REFERENCES Persona(correo) ON UPDATE CASCADE
)

CREATE TABLE AdminRecorrido(
	refRecorrido VARCHAR(256),
	refAdmin VARCHAR(256),
	FOREIGN KEY (refRecorrido) REFERENCES Recorrido(id) ON UPDATE CASCADE,
	FOREIGN KEY (refAdmin) REFERENCES Admin(usuario) ON UPDATE CASCADE
)

CREATE TABLE TaxistaRecorrido(
	refRecorrido VARCHAR(256),
	refTaxista VARCHAR(256),
	FOREIGN KEY (refRecorrido) REFERENCES Recorrido(id) ON UPDATE CASCADE,
	FOREIGN KEY (refTaxista) REFERENCES Taxista(rut) ON UPDATE CASCADE
)

CREATE TABLE Taxi(
	patente VARCHAR(256) PRIMARY KEY NOT NULL,
	modelo VARCHAR(256) NOT NULL,
	numTaxi INTEGER NOT NULL
)

CREATE TABLE EncargadoTaxi(
	refTaxista VARCHAR(256),
	refTaxi VARCHAR(256),
	FOREIGN KEY (refTaxista) REFERENCES Taxista(rut) ON UPDATE CASCADE,
	FOREIGN KEY (refTaxi) REFERENCES Taxi(patente) ON UPDATE CASCADE
)

CREATE TABLE Impresora(
	mac VARCHAR(256) PRIMARY KEY NOT NULL,
	modelo VARCHAR(256) NOT NULL,
	marca VARCHAR(256) NOT NULL
)

CREATE TABLE ImpresoraTaxi(
	refTaxi VARCHAR(256),
	refImpresora VARCHAR(256),
	FOREIGN KEY (refTaxi) REFERENCES Taxi(patente) ON UPDATE CASCADE,
	FOREIGN KEY (refImpresora) REFERENCES Impresora(mac) ON UPDATE CASCADE
)


CREATE TABLE Boleta(
	id VARCHAR[100] PRIMARY KEY NOT NULL,
	fecha DATE NOT NULL,
	bajadaBandera INTEGER NOT NULL,
	costoMetro INTEGER NOT NULL,
	costoSegDetencion INTEGER NOT NULL,
	distancia INTEGER NOT NULL,
	tiempoDetencion INTEGER NOT NULL,
	costo INTEGER NOT NULL
)


CREATE TABLE BoletaRecorrido(
	refRecorrido VARCHAR(256),
	refBoleta VARCHAR(256),
	FOREIGN KEY (refRecorrido) REFERENCES Recorrido(id) ON UPDATE CASCADE,
	FOREIGN KEY (refBoleta) REFERENCES Boleta(id) ON UPDATE CASCADE
)

