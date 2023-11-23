DROP DATABASE IF EXISTS hospital_modulo;

CREATE DATABASE hospital_modulo;
USE hospital_modulo;

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
('Salud Integral Medical Center'),
('Esperanza Wellness Campus'),
('VidaCare Health Hub'),
('Serenity Medical Plaza'),
('Renacer Hospital Complex'),
('Vitality Health Village'),
('Compassion Care Campus'),
('Harmony Medical Haven'),
('Prospera Health Center'),
('Equilibrio Life Campus');

INSERT INTO edificio (idComplejoHospitalario,nombreEdificio) VALUES
(1,'Torre Ébano'),
(6,'Edificio Azahar'),
(7,'Pabellón Diamante'),
(10,'Bloque Esmeralda'),
(6,'Centro Zafiro'),
(5,'Ala Coral'),
(9,'Torre Ópalo'),
(6,'Edificio Amatista'),
(4,'Pabellón Rubí'),
(4,'Bloque Topacio');

INSERT INTO especialidad (nombreEspecialidad) VALUES
('Cardiología Avanzada'),
('Neurociencias y Rehabilitación'),
('Oncología Integrativa'),
('Cirugía Minimamente Invasiva'),
('Salud Materno-Infantil'),
('Medicina de Precisión y Genómica'),
('Cuidados Intensivos y Trauma'),
('Reumatología y Enfermedades Autoinmunes'),
('Salud Mental y Bienestar Emocional'),
('Medicina Geriátrica y Cuidados Paliativos');

INSERT INTO empleado (nombreEmpleado, cargo) VALUES
('Luis González', 'Pediatra'),
('Patricia Herrera', 'Terapeuta Ocupacional'),
('Roberto Vargas', 'Especialista en Neurología'),
('Verónica Silva', 'Fisioterapeuta'),
('Javier Mendoza', 'Coordinador de Logística Médica'),
('Alejandra Ramírez', 'Psicólogo Clínico'),
('Daniel Cordero', 'Técnico de Imagenología'),
('Silvia Ortega', 'Especialista en Infectología'),
('Ricardo Morales', 'Gerente de Finanzas'),
('Carmen Núñez', 'Enfermero Jefe');

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