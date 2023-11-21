DROP DATABASE IF EXISTS db_hospital;

CREATE DATABASE db_hospital;
USE db_hospital;

CREATE TABLE complejoHospitalario (
  idComplejoHospitalario INT PRIMARY KEY AUTO_INCREMENT,
  nombreComplejo VARCHAR(50) NOT NULL
);

CREATE TABLE edificio (
  idEdificio INT PRIMARY KEY AUTO_INCREMENT,
  idComplejoHospitalario INT NOT NULL,
  nombreEdificio VARCHAR(50) NOT NULL
);

CREATE TABLE piso (
  idPisoEdificio INT PRIMARY KEY AUTO_INCREMENT,
  idEdificio INT NOT NULL,
  nroPiso INT NOT NULL,
  idEmpleadoJefe INT NOT NULL
);

CREATE TABLE especialidad (
  idEspecialidad INT PRIMARY KEY AUTO_INCREMENT,
  nombreEspecialidad VARCHAR(50) NOT NULL
);

CREATE TABLE pisoEspecialidad (
  estado enum('principal', 'secundario'),
  idPisoEdificio INT NOT NULL,
  idEspecialidad INT NOT NULL,
  PRIMARY KEY (idPisoEdificio, idEspecialidad)
);

CREATE TABLE empleado (
  idEmpleado INT PRIMARY KEY AUTO_INCREMENT,
  nombreEmpleado VARCHAR(50) NOT NULL,
  cargo VARCHAR(50) NOT NULL
);

CREATE TABLE habitacion (
  idPisoEdificio INT NOT NULL,
  idHabitacion INT PRIMARY KEY AUTO_INCREMENT,
  camas INT NOT NULL
);

ALTER TABLE edificio ADD CONSTRAINT fk_complejo_edificio FOREIGN KEY (idComplejoHospitalario) REFERENCES complejoHospitalario (idComplejoHospitalario);

ALTER TABLE piso ADD CONSTRAINT fk_edificio_piso FOREIGN KEY (idEdificio) REFERENCES edificio (idEdificio);

ALTER TABLE pisoEspecialidad ADD CONSTRAINT fk_especialidad FOREIGN KEY (idEspecialidad) REFERENCES especialidad (idEspecialidad);

ALTER TABLE pisoEspecialidad ADD CONSTRAINT fk_piso_pisoEspecialidad FOREIGN KEY (idPisoEdificio) REFERENCES piso (idPisoEdificio);

ALTER TABLE piso ADD CONSTRAINT fk_empleado_piso FOREIGN KEY (idEmpleadoJefe) REFERENCES empleado (idEmpleado);

ALTER TABLE habitacion ADD CONSTRAINT fk_piso_habitacion FOREIGN KEY (idPisoEdificio) REFERENCES piso (idPisoEdificio);

INSERT INTO complejoHospitalario (nombreComplejo) VALUES
('Amet Industries'),
('Rhoncus Donec Inc.'),
('Sit Amet Foundation'),
('Mauris Aliquam Incorporated'),
('Nisi A Associates'),
('Ultrices Posuere Consulting'),
('Nisi Nibh Ltd'),
('In Faucibus Corporation'),
('Laoreet Libero Et Associates'),
('At Arcu Industries');

INSERT INTO edificio (idComplejoHospitalario,nombreEdificio) VALUES
(1,'Yunnan'),
(6,'Chungju'),
(7,'Pottsching'),
(10,'Berlin'),
(6,'Macclesfield'),
(5,'Florencia'),
(9,'Goksun'),
(6,'Uyo'),
(4,'Marina South'),
(4,'Miraflores');

INSERT INTO especialidad (nombreEspecialidad) VALUES
('Cardiología'),
('Dermatología'),
('Neurología'),
('Gastroenterología'),
('Oftalmología'),
('Ortopedia'),
('Pediatría'),
('Psiquiatría'),
('Radiología'),
('Urología');

INSERT INTO empleado (nombreEmpleado, cargo) VALUES
('Juan Pérez', 'Médico General'),
('María García', 'Enfermera'),
('Carlos Rodríguez', 'Especialista en Cardiología'),
('Laura Martínez', 'Técnico de Laboratorio'),
('Pedro Sánchez', 'Administrativo'),
('Ana López', 'Fisioterapeuta'),
('José Ramírez', 'Farmacéutico'),
('Isabel Fernández', 'Radiólogo'),
('Miguel Torres', 'Asistente de Recursos Humanos');

INSERT INTO piso (idEdificio, nroPiso, idEmpleadoJefe) VALUES
(1, 1, 1),
(1, 2, 2),
(2, 1, 3),
(2, 2, 4),
(2, 3, 5),
(3, 1, 6),
(3, 2, 7),
(4, 1, 8),
(5, 1, 9);

INSERT INTO pisoEspecialidad (estado, idPisoEdificio, idEspecialidad) VALUES
('principal', 1, 1),
('secundario', 1, 2),
('principal', 2, 3),
('secundario', 2, 4),
('principal', 3, 5),
('secundario', 3, 6),
('principal', 4, 7),
('secundario', 4, 8),
('principal', 5, 9),
('secundario', 5, 10);

INSERT INTO habitacion (idPisoEdificio, camas) VALUES
(1, 2),
(1, 5),
(2, 3),
(2, 2),
(3, 4),
(3, 1);