CREATE TABLE public.departments (
	departments_id serial4 NOT NULL,
	departments_name varchar(50) NOT NULL,
	manager_id int4 NULL,
	CONSTRAINT departments_pkey PRIMARY KEY (departments_id)
)