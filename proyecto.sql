-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler version: 1.0.4
-- PostgreSQL version: 15.0
-- Project Site: pgmodeler.io
-- Model Author: ---
-- -- object: pg_database_owner | type: ROLE --
-- -- DROP ROLE IF EXISTS pg_database_owner;
-- CREATE ROLE pg_database_owner WITH 
-- 	INHERIT
-- 	 PASSWORD '********';
-- -- ddl-end --
-- 
-- object: pgexercises | type: ROLE --
-- DROP ROLE IF EXISTS pgexercises;
CREATE ROLE pgexercises WITH 
	SUPERUSER
	CREATEDB
	CREATEROLE
	INHERIT
	LOGIN
	 PASSWORD '********';
-- ddl-end --


-- Database creation must be performed outside a multi lined SQL file. 
-- These commands were put in this file only as a convenience.
-- 
-- object: proyecto2 | type: DATABASE --
-- DROP DATABASE IF EXISTS proyecto2;
CREATE DATABASE proyecto2
	ENCODING = 'UTF8'
	LC_COLLATE = 'Spanish_United States.1252'
	LC_CTYPE = 'Spanish_United States.1252'
	TABLESPACE = pg_default
	OWNER = postgres;
-- ddl-end --


-- object: public.profesor_id_profesor_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.profesor_id_profesor_seq CASCADE;
CREATE SEQUENCE public.profesor_id_profesor_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.profesor_id_profesor_seq OWNER TO postgres;
-- ddl-end --

-- object: public.profesor | type: TABLE --
-- DROP TABLE IF EXISTS public.profesor CASCADE;
CREATE TABLE public.profesor (
	id_profesor integer NOT NULL DEFAULT nextval('public.profesor_id_profesor_seq'::regclass),
	nombre character varying(50) NOT NULL,
	apellidos character varying(50) NOT NULL,
	despacho character varying(50),
	telefono character varying(20),
	id_supervisor integer,
	CONSTRAINT profesor_pkey PRIMARY KEY (id_profesor)
);
-- ddl-end --
ALTER TABLE public.profesor OWNER TO postgres;
-- ddl-end --

-- object: public.proyectoinvestigacion_id_proyecto_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.proyectoinvestigacion_id_proyecto_seq CASCADE;
CREATE SEQUENCE public.proyectoinvestigacion_id_proyecto_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.proyectoinvestigacion_id_proyecto_seq OWNER TO postgres;
-- ddl-end --

-- object: public.proyectoinvestigacion | type: TABLE --
-- DROP TABLE IF EXISTS public.proyectoinvestigacion CASCADE;
CREATE TABLE public.proyectoinvestigacion (
	id_proyecto integer NOT NULL DEFAULT nextval('public.proyectoinvestigacion_id_proyecto_seq'::regclass),
	codigo_referencia character varying(10) NOT NULL,
	nombre character varying(100) NOT NULL,
	acronimo character varying(10) NOT NULL,
	presupuesto_total numeric(10,2),
	programa_financiamiento character varying(100),
	fecha_inicio date,
	fecha_fin date,
	descripcion character varying(500),
	id_investigador_principal integer,
	CONSTRAINT proyectoinvestigacion_pkey PRIMARY KEY (id_proyecto),
	CONSTRAINT proyectoinvestigacion_codigo_referencia_key UNIQUE (codigo_referencia)
);
-- ddl-end --
ALTER TABLE public.proyectoinvestigacion OWNER TO postgres;
-- ddl-end --

-- object: public.periodotrabajo_id_periodo_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.periodotrabajo_id_periodo_seq CASCADE;
CREATE SEQUENCE public.periodotrabajo_id_periodo_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.periodotrabajo_id_periodo_seq OWNER TO postgres;
-- ddl-end --

-- object: public.periodotrabajo | type: TABLE --
-- DROP TABLE IF EXISTS public.periodotrabajo CASCADE;
CREATE TABLE public.periodotrabajo (
	id_periodo integer NOT NULL DEFAULT nextval('public.periodotrabajo_id_periodo_seq'::regclass),
	id_profesor integer,
	id_proyecto integer,
	fecha_inicio date,
	fecha_fin date,
	CONSTRAINT periodotrabajo_pkey PRIMARY KEY (id_periodo)
);
-- ddl-end --
ALTER TABLE public.periodotrabajo OWNER TO postgres;
-- ddl-end --

-- object: public.publicacion_id_publicacion_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.publicacion_id_publicacion_seq CASCADE;
CREATE SEQUENCE public.publicacion_id_publicacion_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.publicacion_id_publicacion_seq OWNER TO postgres;
-- ddl-end --

-- object: public.publicacion | type: TABLE --
-- DROP TABLE IF EXISTS public.publicacion CASCADE;
CREATE TABLE public.publicacion (
	id_publicacion integer NOT NULL DEFAULT nextval('public.publicacion_id_publicacion_seq'::regclass),
	id_proyecto integer,
	numero_secuencia integer,
	titulo character varying(100) NOT NULL,
	CONSTRAINT publicacion_pkey PRIMARY KEY (id_publicacion)
);
-- ddl-end --
ALTER TABLE public.publicacion OWNER TO postgres;
-- ddl-end --

-- object: public.publicacioncongreso | type: TABLE --
-- DROP TABLE IF EXISTS public.publicacioncongreso CASCADE;
CREATE TABLE public.publicacioncongreso (
	id_publicacion integer NOT NULL,
	nombre_congreso character varying(100),
	tipo_congreso character varying(20),
	fecha_inicio date,
	fecha_fin date,
	lugar_celebracion character varying(100),
	pais character varying(50),
	editorial_actas character varying(100),
	CONSTRAINT publicacioncongreso_pkey PRIMARY KEY (id_publicacion)
);
-- ddl-end --
ALTER TABLE public.publicacioncongreso OWNER TO postgres;
-- ddl-end --

-- object: public.publicacionrevista | type: TABLE --
-- DROP TABLE IF EXISTS public.publicacionrevista CASCADE;
CREATE TABLE public.publicacionrevista (
	id_publicacion integer NOT NULL,
	nombre_revista character varying(100),
	editorial_revista character varying(100),
	volumen integer,
	numero integer,
	pagina_inicio integer,
	pagina_fin integer,
	CONSTRAINT publicacionrevista_pkey PRIMARY KEY (id_publicacion)
);
-- ddl-end --
ALTER TABLE public.publicacionrevista OWNER TO postgres;
-- ddl-end --

-- object: public.lineainvestigacion_id_linea_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.lineainvestigacion_id_linea_seq CASCADE;
CREATE SEQUENCE public.lineainvestigacion_id_linea_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.lineainvestigacion_id_linea_seq OWNER TO postgres;
-- ddl-end --

-- object: public.lineainvestigacion | type: TABLE --
-- DROP TABLE IF EXISTS public.lineainvestigacion CASCADE;
CREATE TABLE public.lineainvestigacion (
	id_linea integer NOT NULL DEFAULT nextval('public.lineainvestigacion_id_linea_seq'::regclass),
	codigo character varying(10) NOT NULL,
	nombre character varying(100) NOT NULL,
	CONSTRAINT lineainvestigacion_pkey PRIMARY KEY (id_linea),
	CONSTRAINT lineainvestigacion_codigo_key UNIQUE (codigo)
);
-- ddl-end --
ALTER TABLE public.lineainvestigacion OWNER TO postgres;
-- ddl-end --

-- object: public.lineainvestigaciondescriptor | type: TABLE --
-- DROP TABLE IF EXISTS public.lineainvestigaciondescriptor CASCADE;
CREATE TABLE public.lineainvestigaciondescriptor (
	id_linea integer,
	descriptor character varying(100)

);
-- ddl-end --
ALTER TABLE public.lineainvestigaciondescriptor OWNER TO postgres;
-- ddl-end --

-- object: public.profesorlineainvestigacion | type: TABLE --
-- DROP TABLE IF EXISTS public.profesorlineainvestigacion CASCADE;
CREATE TABLE public.profesorlineainvestigacion (
	id_profesor integer,
	id_linea integer

);
-- ddl-end --
ALTER TABLE public.profesorlineainvestigacion OWNER TO postgres;
-- ddl-end --

-- object: public.publicacionlineainvestigacion | type: TABLE --
-- DROP TABLE IF EXISTS public.publicacionlineainvestigacion CASCADE;
CREATE TABLE public.publicacionlineainvestigacion (
	id_publicacion integer,
	id_linea integer

);
-- ddl-end --
ALTER TABLE public.publicacionlineainvestigacion OWNER TO postgres;
-- ddl-end --

-- object: profesor_id_supervisor_fkey | type: CONSTRAINT --
-- ALTER TABLE public.profesor DROP CONSTRAINT IF EXISTS profesor_id_supervisor_fkey CASCADE;
ALTER TABLE public.profesor ADD CONSTRAINT profesor_id_supervisor_fkey FOREIGN KEY (id_supervisor)
REFERENCES public.profesor (id_profesor) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: proyectoinvestigacion_id_investigador_principal_fkey | type: CONSTRAINT --
-- ALTER TABLE public.proyectoinvestigacion DROP CONSTRAINT IF EXISTS proyectoinvestigacion_id_investigador_principal_fkey CASCADE;
ALTER TABLE public.proyectoinvestigacion ADD CONSTRAINT proyectoinvestigacion_id_investigador_principal_fkey FOREIGN KEY (id_investigador_principal)
REFERENCES public.profesor (id_profesor) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: periodotrabajo_id_profesor_fkey | type: CONSTRAINT --
-- ALTER TABLE public.periodotrabajo DROP CONSTRAINT IF EXISTS periodotrabajo_id_profesor_fkey CASCADE;
ALTER TABLE public.periodotrabajo ADD CONSTRAINT periodotrabajo_id_profesor_fkey FOREIGN KEY (id_profesor)
REFERENCES public.profesor (id_profesor) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: periodotrabajo_id_proyecto_fkey | type: CONSTRAINT --
-- ALTER TABLE public.periodotrabajo DROP CONSTRAINT IF EXISTS periodotrabajo_id_proyecto_fkey CASCADE;
ALTER TABLE public.periodotrabajo ADD CONSTRAINT periodotrabajo_id_proyecto_fkey FOREIGN KEY (id_proyecto)
REFERENCES public.proyectoinvestigacion (id_proyecto) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: publicacion_id_proyecto_fkey | type: CONSTRAINT --
-- ALTER TABLE public.publicacion DROP CONSTRAINT IF EXISTS publicacion_id_proyecto_fkey CASCADE;
ALTER TABLE public.publicacion ADD CONSTRAINT publicacion_id_proyecto_fkey FOREIGN KEY (id_proyecto)
REFERENCES public.proyectoinvestigacion (id_proyecto) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: publicacioncongreso_id_publicacion_fkey | type: CONSTRAINT --
-- ALTER TABLE public.publicacioncongreso DROP CONSTRAINT IF EXISTS publicacioncongreso_id_publicacion_fkey CASCADE;
ALTER TABLE public.publicacioncongreso ADD CONSTRAINT publicacioncongreso_id_publicacion_fkey FOREIGN KEY (id_publicacion)
REFERENCES public.publicacion (id_publicacion) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: publicacionrevista_id_publicacion_fkey | type: CONSTRAINT --
-- ALTER TABLE public.publicacionrevista DROP CONSTRAINT IF EXISTS publicacionrevista_id_publicacion_fkey CASCADE;
ALTER TABLE public.publicacionrevista ADD CONSTRAINT publicacionrevista_id_publicacion_fkey FOREIGN KEY (id_publicacion)
REFERENCES public.publicacion (id_publicacion) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: lineainvestigaciondescriptor_id_linea_fkey | type: CONSTRAINT --
-- ALTER TABLE public.lineainvestigaciondescriptor DROP CONSTRAINT IF EXISTS lineainvestigaciondescriptor_id_linea_fkey CASCADE;
ALTER TABLE public.lineainvestigaciondescriptor ADD CONSTRAINT lineainvestigaciondescriptor_id_linea_fkey FOREIGN KEY (id_linea)
REFERENCES public.lineainvestigacion (id_linea) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: profesorlineainvestigacion_id_profesor_fkey | type: CONSTRAINT --
-- ALTER TABLE public.profesorlineainvestigacion DROP CONSTRAINT IF EXISTS profesorlineainvestigacion_id_profesor_fkey CASCADE;
ALTER TABLE public.profesorlineainvestigacion ADD CONSTRAINT profesorlineainvestigacion_id_profesor_fkey FOREIGN KEY (id_profesor)
REFERENCES public.profesor (id_profesor) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: profesorlineainvestigacion_id_linea_fkey | type: CONSTRAINT --
-- ALTER TABLE public.profesorlineainvestigacion DROP CONSTRAINT IF EXISTS profesorlineainvestigacion_id_linea_fkey CASCADE;
ALTER TABLE public.profesorlineainvestigacion ADD CONSTRAINT profesorlineainvestigacion_id_linea_fkey FOREIGN KEY (id_linea)
REFERENCES public.lineainvestigacion (id_linea) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: publicacionlineainvestigacion_id_publicacion_fkey | type: CONSTRAINT --
-- ALTER TABLE public.publicacionlineainvestigacion DROP CONSTRAINT IF EXISTS publicacionlineainvestigacion_id_publicacion_fkey CASCADE;
ALTER TABLE public.publicacionlineainvestigacion ADD CONSTRAINT publicacionlineainvestigacion_id_publicacion_fkey FOREIGN KEY (id_publicacion)
REFERENCES public.publicacion (id_publicacion) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: publicacionlineainvestigacion_id_linea_fkey | type: CONSTRAINT --
-- ALTER TABLE public.publicacionlineainvestigacion DROP CONSTRAINT IF EXISTS publicacionlineainvestigacion_id_linea_fkey CASCADE;
ALTER TABLE public.publicacionlineainvestigacion ADD CONSTRAINT publicacionlineainvestigacion_id_linea_fkey FOREIGN KEY (id_linea)
REFERENCES public.lineainvestigacion (id_linea) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: "grant_CU_26541e8cda" | type: PERMISSION --
GRANT CREATE,USAGE
   ON SCHEMA public
   TO pg_database_owner;
-- ddl-end --

-- object: "grant_U_cd8e46e7b6" | type: PERMISSION --
GRANT USAGE
   ON SCHEMA public
   TO PUBLIC;
-- ddl-end --


