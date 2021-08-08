CREATE TABLE public.rolempleado
(
    rol_id integer NOT NULL,
    rol_descripcion character varying(255) COLLATE pg_catalog."default",
    rol_nombre character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT rolempleado_pkey PRIMARY KEY (rol_id)
)

TABLESPACE pg_default;

ALTER TABLE public.rolempleado
    OWNER to postgres;	






CREATE TABLE public.empleado
(
    emp_id integer NOT NULL,
    emp_cedula character varying(255) COLLATE pg_catalog."default",
    emp_celular character varying(255) COLLATE pg_catalog."default",
    emp_departamento character varying(255) COLLATE pg_catalog."default",
    emp_email character varying(255) COLLATE pg_catalog."default",
    emp_nombre character varying(255) COLLATE pg_catalog."default",
    emp_password character varying(255) COLLATE pg_catalog."default",
    rolempleado_rol_id integer,
    CONSTRAINT empleado_pkey PRIMARY KEY (emp_id),
    CONSTRAINT fk5wnxeh9qm9c4ciimvna79delh FOREIGN KEY (rolempleado_rol_id)
        REFERENCES public.rolempleado (rol_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.empleado
    OWNER to postgres;
	
	
INSERT INTO rolempleado(rol_id, rol_descripcion, rol_nombre) VALUES (1,'rol admin', 'ADMINISTRADOR');
		
INSERT INTO empleado (emp_id,emp_cedula, emp_nombre, emp_celular,emp_email,emp_password, emp_departamento,rolempleado_rol_id) values (1,'0107529877', 'PEDRO ILLAISACA', '0994090599','pedro@illaisaca', '1234567890','',1);	
