CREATE DATABASE TF;
GO
USE TF;
--Database: TF
CREATE TABLE instituciones (
    id int NOT NULL,
    nombre varchar(50) NOT NULL,
    tipo varchar(50) NOT NULL,
    CONSTRAINT instituciones_pk PRIMARY KEY (id)
);

CREATE TABLE carreras (
    id int NOT NULL,
    nombre varchar(50) NOT NULL,
    CONSTRAINT carreras_pk PRIMARY KEY (id)
);

CREATE TABLE instituciones_carreras(
    carrera_id int NOT NULL,
    institucion_id int NOT NULL,
    CONSTRAINT instituciones_carreras_pk PRIMARY KEY (carrera_id,institucion_id),
    CONSTRAINT  i_c_carreras_fk FOREIGN KEY (carrera_id) REFERENCES carreras (id),
    CONSTRAINT i_c_instituciones_fk FOREIGN KEY (institucion_id) REFERENCES instituciones(id)
);

CREATE TABLE usuarios(
    id int NOT NULL,
    nombre varchar(20) NOT NULL,
    apellido varchar(20) NOT NULL ,
    edad int NOT NULL,
    fecha_nacimiento date NOT NULL,
    correo varchar(50) NOT NULL,
    num_celular int NOT NULL,
    CONSTRAINT usuarios_pk PRIMARY KEY (id)
);

CREATE TABLE usuarios_carreras(
    carrera_id int NOT NULL,
    usuario_id int NOT NULL,
    CONSTRAINT usuarios_carreras_pk PRIMARY KEY (carrera_id,usuario_id),
    CONSTRAINT  u_c_carreras_fk FOREIGN KEY (carrera_id) REFERENCES carreras(id),
    CONSTRAINT  u_c_usuarios_fk FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

CREATE TABLE simulaciones(
    id int NOT NULL,
    usuario_id int NOT NULL,
    hora time NOT NULL,
    fecha date NOT NULL,
    calificacion int NOT NULL,
    CONSTRAINT simulaciones_pk PRIMARY KEY (id),
    CONSTRAINT s_usuarios_fk FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);
CREATE TABLE preguntas(
    id int NOT NULL,
    enunciado varchar(120),
    CONSTRAINT preguntas_pk PRIMARY KEY (id)
);
CREATE TABLE simulaciones_preguntas(
    simulacion_id int NOT NULL,
    pregunta_id int NOT NULL,
    puesto_laboral varchar(50),
    respuesta varchar(240),
    CONSTRAINT simulaciones_preguntas_pk PRIMARY KEY (simulacion_id,pregunta_id),
    CONSTRAINT s_p_simulaciones_fk FOREIGN KEY (simulacion_id) REFERENCES  simulaciones(id),
    CONSTRAINT s_p_preguntas_fk FOREIGN KEY (pregunta_id) REFERENCES  preguntas(id)
);

CREATE TABLE grabaciones(
    id int NOT NULL,
    simulacion_id int NOT NULL,
    hora_final time NOT NULL,
    hora_inicio time NOT NULL,
    duracion time NOT NULL,
    CONSTRAINT grabaciones_pk PRIMARY KEY (id),
    CONSTRAINT g_simulaciones_fk FOREIGN KEY (simulacion_id) REFERENCES simulaciones(id)
);

CREATE TABLE curriculums(
    id int NOT NULL,
    usuario_id int NOT NULL,
    CONSTRAINT curriculums_pk PRIMARY KEY (id),
    CONSTRAINT c_usuarios_fk FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

CREATE TABLE fortalezas(
    id int NOT NULL,
    descripcion varchar(20),
    CONSTRAINT fortalezas_pk PRIMARY KEY (id)
);

CREATE TABLE curriculums_fortalezas(
    curriculum_id int NOT NULL,
    fortaleza_id int NOT NULL,
    CONSTRAINT curriculums_fortalezas_pk PRIMARY KEY (curriculum_id, fortaleza_id),
    CONSTRAINT c_f_curriculums_fk FOREIGN KEY (curriculum_id) REFERENCES curriculums(id),
    CONSTRAINT c_f_fortalezas_fk FOREIGN KEY (fortaleza_id) REFERENCES fortalezas(id)
);

CREATE TABLE habilidades_tecnicas(
    id int NOT NULL,
    descripcion varchar(120),
    nivel_expertiz varchar(50),
    CONSTRAINT habilidades_tecnicas_pk PRIMARY KEY (id)
);

CREATE TABLE curriculums_habilidades_tecnicas(
    curriculum_id int NOT NULL,
    habilidad_tecnica_id int NOT NULL,
    CONSTRAINT curriculums_hablidades_tecnicas_pk PRIMARY KEY (curriculum_id,habilidad_tecnica_id),
    CONSTRAINT c_ht_curriculums_fk FOREIGN KEY (curriculum_id) REFERENCES curriculums(id),
    CONSTRAINT c_ht_habilidades_tecnicas_fk FOREIGN KEY (habilidad_tecnica_id) REFERENCES habilidades_tecnicas(id)
);

CREATE  TABLE idiomas(
    id int NOT NULL,
    nombre varchar(50),
    nivel_expertiz varchar(50),
    CONSTRAINT idiomas_pk PRIMARY KEY (id)
)

CREATE TABLE curriculums_idiomas(
    curriculum_id int NOT NULL,
    idioma_id int NOT NULL,
    CONSTRAINT curriculums_idiomas_pk PRIMARY KEY (curriculum_id,idioma_id),
    CONSTRAINT c_i_curriculums_fk FOREIGN KEY (curriculum_id) REFERENCES curriculums(id),
    CONSTRAINT c_i_idiomas_fk FOREIGN KEY (idioma_id) REFERENCES idiomas(id)
);
