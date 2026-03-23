CREATE DATABASE IF NOT EXISTS centro_eventos_grupoX;
/*creamos tabla salas */
CREATE TABLE IF NOT EXISTS Salas ( id_sala INT AUTO_INCREMENT PRIMARY KEY, nombre VARCHAR(100) NOT NULL, ubicacion VARCHAR(100), capacidad INT NOT NULL );
/* creamos la tabla participantes */
CREATE TABLE Participantes ( id_participante INT AUTO_INCREMENT PRIMARY KEY, nombre VARCHAR(100), apellidos VARCHAR(100), email VARCHAR(100) UNIQUE, telefono VARCHAR(20) );
CREATE TABLE Organizadores ( id_organizador INT AUTO_INCREMENT PRIMARY KEY, nombre VARCHAR(100), contacto VARCHAR(100) );
CREATE TABLE Eventos ( id_evento INT AUTO_INCREMENT PRIMARY KEY, titulo VARCHAR(150) NOT NULL, fecha DATE, hora_inicio TIME, hora_fin TIME, descripcion TEXT, aforo_maximo INT, tipo_evento VARCHAR(50), id_sala INT, CONSTRAINT fk_evento_sala FOREIGN KEY (id_sala) REFERENCES Salas(id_sala) );
CREATE TABLE Inscripciones ( id_inscripcion INT AUTO_INCREMENT PRIMARY KEY, id_participante INT, id_evento INT, fecha_inscripcion DATE, CONSTRAINT fk_inscripcion_participante FOREIGN KEY (id_participante) REFERENCES Participantes(id_participante), CONSTRAINT fk_inscripcion_evento FOREIGN KEY (id_evento) REFERENCES Eventos(id_evento) );
CREATE TABLE Evento_Organizador ( id_evento INT, id_organizador INT, PRIMARY KEY (id_evento, id_organizador), -- Clave primaria compuesta CONSTRAINT fk_eo_evento FOREIGN KEY (id_evento) REFERENCES Eventos(id_evento), CONSTRAINT fk_eo_organizador FOREIGN KEY (id_organizador) REFERENCES Organizadores(id_organizador) );
