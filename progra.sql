create database progra;
use progra;

create table estudiantePracticante(
carne int primary key not null,
pimerNombre varchar(30) not null,
segundoNombre varchar(30) not null,
primerApellido varchar(30) not null,
segundoApellido varchar(30) not null,
correoElectronico varchar(30) not null,
telefono varchar(11) not null,
idProvincia int not null,
idCanton int not null,
idDistrito int not null,
sennas varchar(30) not null
)

create table profesor(
carne int primary key not null,
usuario varchar(15) not null,
contrasenna varchar(15) not null,
primerNombre varchar(30) not null,
segundoNombre varchar(30) not null,
primerApellido varchar(30) not null,
segundoApellido varchar(30) not null,
telefono varchar(11) not null,
correoElectronico varchar(30) not null
)

create table entregable(
idEntregable int primary key not null,
fechaEntregado date not null,
idTipo int not null,
porcentaje int not null,
cedulaProfesor int not null,
notaEntregable int not null
)

create table practica(
idPractica int primary key not null,
carneEstudiante int not null,
idPeriodoPractica int not null,
profesorAsesor int not null,
profesorCurso int not null,
representanteEmpresa int not null
)

create table empresa(
cedulaJuridica int primary key not null,
nombreEmpresa varchar(30) not null,
telefono int not null,
idProvincia int not null,
idCanton int not null,
idDistrito int not null,
sennas varchar(30) not null
)

create table representanteEmpresa(
cedula int primary key not null,
primerNombre varchar(30) not null,
segundoNombre varchar(30) not null,
primerApellido varchar(30) not null,
segundoApellido varchar(30) not null,
puesto varchar (30) not null,
correoElectronico varchar(30) not null,
telefono int not null
)

create table periodoPractica(
idPeriodo int primary key not null,
numeroSemestre int not null,
anno int not null,
estudiantePracticante int not null,
encargadoPractica int not null
)

create table reunion(
idReunion int primary key not null,
carneEstudiante int not null,
profesorAsesor int not null,
lugar varchar(30) not null,
tema varchar(20) not null,
fecha date not null,
agenda varchar(30) not null
)

create table minutas(
idMinuta int not null,
idReunion int not null,
lugar varchar(30) not null,
idEstudiante int not null,
titulo varchar(20) not null,
fotografia image, 
horaInicio smalldatetime not null,
horaFinal smalldatetime not null,
primary key (idMinuta, idReunion)
)

create table nota(
idEntregable int primary key not null,
notaProfAsesor int not null,
notaSupervisor int not null,
fechaRegistro30 date not null,
comentario varchar(30) not null
)

create table provincia(
idProvincia int primary key not null,
nombreProvincia int not null
)

create table distrito(
idDistrito int primary key not null,
nombreDistrito int not null
)

create table canton(
idCanton int primary key not null,
nombreCanton int not null
)

create table tipoEntregable(
idTipoEntregable int primary key not null, 
detalleTipo varchar(20) not null
)

create table rolProfesor(
idRol int not null,
idProfesor int not null,
primary key (idRol, idProfesor)
)

create table rol(
idRol int primary key not null,
nombreRol varchar(20) not null
)

--llaves foraneas
alter table estudiantePracticante
add foreign key (idProvincia) references provincia(idProvincia);
alter table estudiantePracticante
add foreign key (idCanton) references canton(idCanton);
alter table estudiantePracticante
add foreign key (idDistrito) references distrito(idDistrito);

alter table entregable
add foreign key (idTipo) references tipoEntregable(idTipoEntregable);
alter table entregable
add foreign key (carneEstudiante) references estudiantePracticante(carne);
alter table entregable
add foreign key (notaEntregable) references nota(idEntregable);

alter table practica
add foreign key (carneEstudiante) references estudiantePracticante(carne);
alter table practica
add foreign key (idPeriodoPractica) references periodoPractica(idPeriodo);
alter table practica
add foreign key (profesorAsesor) references profesor(carne);
alter table practica
add foreign key (profesorCurso) references profesor(carne);
alter table practica
add foreign key (representanteEmpresa) references representanteEmpresa(cedula);

alter table empresa
add foreign key (idProvincia) references provincia(idProvincia);
alter table empresa
add foreign key (idCanton) references canton(idCanton);
alter table empresa
add foreign key (idDistrito) references distrito(idDistrito);

alter table representanteEmpresa
add foreign key (empresa) references empresa(cedulaJuridica);

alter table periodoPractica
add foreign key (estudiantePracticante) references estudiantePracticante(carne);
alter table periodoPractica
add foreign key (encargadoPractica) references profesor(carne);

alter table reunion
add foreign key (carneEstudiante) references estudiantePracticante(carne);
alter table reunion
add foreign key (profesorAsesor) references profesor(carne);

alter table minutas
add foreign key (idReunion) references reunion(idReunion);
alter table minutas
add foreign key (carneEstudiante) references estudiantePracticante(carne);