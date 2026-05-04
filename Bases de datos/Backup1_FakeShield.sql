--
-- PostgreSQL database dump
--

\restrict X75eI23P7w7tUmTXTBMbveXUgqZQFqwRwKfuTJsmmyuSb1c0JNNEfZrtZrKikOr

-- Dumped from database version 16.11
-- Dumped by pg_dump version 16.11

-- Started on 2026-05-04 19:33:42

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 225 (class 1255 OID 98398)
-- Name: diez(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.diez() RETURNS void
    LANGUAGE plpgsql
    AS $$
declare 
	i Integer;
begin
	for i in 1..10 loop
	raise notice 'Numero: % ',i;
	end loop;
end;
$$;


ALTER FUNCTION public.diez() OWNER TO postgres;

--
-- TOC entry 223 (class 1255 OID 98393)
-- Name: euros(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.euros(integer) RETURNS numeric
    LANGUAGE plpgsql
    AS $_$
BEGIN
RETURN ROUND($1/166.386,2);
END; $_$;


ALTER FUNCTION public.euros(integer) OWNER TO postgres;

--
-- TOC entry 226 (class 1255 OID 98399)
-- Name: imp(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.imp() RETURNS void
    LANGUAGE plpgsql
    AS $$
declare
	i Integer;
begin
	for i in 1..50 loop
		if i % 2 <> 0 then
			raise notice '%', i;
			end if;
	end loop;
end;
$$;


ALTER FUNCTION public.imp() OWNER TO postgres;

--
-- TOC entry 228 (class 1255 OID 98401)
-- Name: max2(numeric, numeric); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.max2(a numeric, b numeric) RETURNS numeric
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF a > b THEN
        RETURN a;
    ELSE
        RETURN b;
    END IF;
END;
$$;


ALTER FUNCTION public.max2(a numeric, b numeric) OWNER TO postgres;

--
-- TOC entry 227 (class 1255 OID 98400)
-- Name: taula_mult(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.taula_mult(num integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    i INTEGER;
    resultado TEXT := '';
BEGIN
    FOR i IN 1..10 LOOP
        resultado := resultado || num || 'x' || i || '=' || (num*i);

        IF i < 10 THEN
            resultado := resultado || ' | ';
        END IF;
    END LOOP;

    RAISE NOTICE '%', resultado;
END;
$$;


ALTER FUNCTION public.taula_mult(num integer) OWNER TO postgres;

--
-- TOC entry 224 (class 1255 OID 98394)
-- Name: traure_pi(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.traure_pi() RETURNS void
    LANGUAGE plpgsql
    AS $$
begin
raise notice 'El número PI es: %',PI();
end;
$$;


ALTER FUNCTION public.traure_pi() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 90172)
-- Name: departamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departamento (
    id_departamento integer NOT NULL,
    nombre character varying(15) NOT NULL,
    presupuesto money NOT NULL,
    id_director integer,
    ubicacion character varying NOT NULL
);


ALTER TABLE public.departamento OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 90175)
-- Name: departamento_id_departamento_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.departamento_id_departamento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.departamento_id_departamento_seq OWNER TO postgres;

--
-- TOC entry 4941 (class 0 OID 0)
-- Dependencies: 216
-- Name: departamento_id_departamento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.departamento_id_departamento_seq OWNED BY public.departamento.id_departamento;


--
-- TOC entry 217 (class 1259 OID 90176)
-- Name: dispositivo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dispositivo (
    id_dispositivo integer NOT NULL,
    ip character varying(15) NOT NULL,
    mac character varying(17),
    tipo character varying(10) NOT NULL,
    so character varying(10),
    id_empleado integer
);


ALTER TABLE public.dispositivo OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 90181)
-- Name: dispositivo_id_dispositivo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dispositivo_id_dispositivo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dispositivo_id_dispositivo_seq OWNER TO postgres;

--
-- TOC entry 4944 (class 0 OID 0)
-- Dependencies: 218
-- Name: dispositivo_id_dispositivo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dispositivo_id_dispositivo_seq OWNED BY public.dispositivo.id_dispositivo;


--
-- TOC entry 219 (class 1259 OID 90182)
-- Name: empleado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.empleado (
    id_empleado integer NOT NULL,
    dni character varying(9) NOT NULL,
    nombre character varying(15) NOT NULL,
    apellidos character varying(25),
    email character varying(25) NOT NULL,
    tlf_pers character varying(9) NOT NULL,
    tlf_corp character varying(9) NOT NULL,
    fecha_contratacion date NOT NULL,
    salario money NOT NULL,
    teletrabajo boolean,
    rol character varying(10),
    id_departamento integer
);


ALTER TABLE public.empleado OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 90185)
-- Name: empleado_id_empleado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.empleado_id_empleado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.empleado_id_empleado_seq OWNER TO postgres;

--
-- TOC entry 4947 (class 0 OID 0)
-- Dependencies: 220
-- Name: empleado_id_empleado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.empleado_id_empleado_seq OWNED BY public.empleado.id_empleado;


--
-- TOC entry 221 (class 1259 OID 90186)
-- Name: incidencia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.incidencia (
    id_incidencia integer NOT NULL,
    estado character varying(10) NOT NULL,
    fecha_alta date NOT NULL,
    fecha_cierre date,
    id_dispositivo integer,
    id_empleado_pone integer,
    id_empleado_gestiona integer
);


ALTER TABLE public.incidencia OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 90189)
-- Name: incidencia_id_incidencia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.incidencia_id_incidencia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.incidencia_id_incidencia_seq OWNER TO postgres;

--
-- TOC entry 4950 (class 0 OID 0)
-- Dependencies: 222
-- Name: incidencia_id_incidencia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.incidencia_id_incidencia_seq OWNED BY public.incidencia.id_incidencia;


--
-- TOC entry 4756 (class 2604 OID 98391)
-- Name: departamento id_departamento; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamento ALTER COLUMN id_departamento SET DEFAULT nextval('public.departamento_id_departamento_seq'::regclass);


--
-- TOC entry 4757 (class 2604 OID 98390)
-- Name: dispositivo id_dispositivo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dispositivo ALTER COLUMN id_dispositivo SET DEFAULT nextval('public.dispositivo_id_dispositivo_seq'::regclass);


--
-- TOC entry 4758 (class 2604 OID 98386)
-- Name: empleado id_empleado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleado ALTER COLUMN id_empleado SET DEFAULT nextval('public.empleado_id_empleado_seq'::regclass);


--
-- TOC entry 4759 (class 2604 OID 98387)
-- Name: incidencia id_incidencia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incidencia ALTER COLUMN id_incidencia SET DEFAULT nextval('public.incidencia_id_incidencia_seq'::regclass);


--
-- TOC entry 4927 (class 0 OID 90172)
-- Dependencies: 215
-- Data for Name: departamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departamento (id_departamento, nombre, presupuesto, id_director, ubicacion) FROM stdin;
\.


--
-- TOC entry 4929 (class 0 OID 90176)
-- Dependencies: 217
-- Data for Name: dispositivo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dispositivo (id_dispositivo, ip, mac, tipo, so, id_empleado) FROM stdin;
\.


--
-- TOC entry 4931 (class 0 OID 90182)
-- Dependencies: 219
-- Data for Name: empleado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.empleado (id_empleado, dni, nombre, apellidos, email, tlf_pers, tlf_corp, fecha_contratacion, salario, teletrabajo, rol, id_departamento) FROM stdin;
\.


--
-- TOC entry 4933 (class 0 OID 90186)
-- Dependencies: 221
-- Data for Name: incidencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.incidencia (id_incidencia, estado, fecha_alta, fecha_cierre, id_dispositivo, id_empleado_pone, id_empleado_gestiona) FROM stdin;
\.


--
-- TOC entry 4952 (class 0 OID 0)
-- Dependencies: 216
-- Name: departamento_id_departamento_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.departamento_id_departamento_seq', 1, false);


--
-- TOC entry 4953 (class 0 OID 0)
-- Dependencies: 218
-- Name: dispositivo_id_dispositivo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dispositivo_id_dispositivo_seq', 1, false);


--
-- TOC entry 4954 (class 0 OID 0)
-- Dependencies: 220
-- Name: empleado_id_empleado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.empleado_id_empleado_seq', 1, false);


--
-- TOC entry 4955 (class 0 OID 0)
-- Dependencies: 222
-- Name: incidencia_id_incidencia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.incidencia_id_incidencia_seq', 1, false);


--
-- TOC entry 4761 (class 2606 OID 90200)
-- Name: departamento departamento_id_director_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamento
    ADD CONSTRAINT departamento_id_director_key UNIQUE (id_director);


--
-- TOC entry 4763 (class 2606 OID 90202)
-- Name: departamento departamento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamento
    ADD CONSTRAINT departamento_pkey PRIMARY KEY (id_departamento);


--
-- TOC entry 4765 (class 2606 OID 90204)
-- Name: dispositivo dispositivo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dispositivo
    ADD CONSTRAINT dispositivo_pkey PRIMARY KEY (id_dispositivo);


--
-- TOC entry 4767 (class 2606 OID 90206)
-- Name: empleado empleado_dni_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_dni_key UNIQUE (dni);


--
-- TOC entry 4769 (class 2606 OID 90208)
-- Name: empleado empleado_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_email_key UNIQUE (email);


--
-- TOC entry 4771 (class 2606 OID 90210)
-- Name: empleado empleado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_pkey PRIMARY KEY (id_empleado);


--
-- TOC entry 4773 (class 2606 OID 90212)
-- Name: empleado empleado_tlf_corp_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_tlf_corp_key UNIQUE (tlf_corp);


--
-- TOC entry 4775 (class 2606 OID 90214)
-- Name: empleado empleado_tlf_pers_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_tlf_pers_key UNIQUE (tlf_pers);


--
-- TOC entry 4777 (class 2606 OID 90216)
-- Name: incidencia incidencia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incidencia
    ADD CONSTRAINT incidencia_pkey PRIMARY KEY (id_incidencia);


--
-- TOC entry 4778 (class 2606 OID 90219)
-- Name: departamento departamento_id_director_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamento
    ADD CONSTRAINT departamento_id_director_fkey FOREIGN KEY (id_director) REFERENCES public.empleado(id_empleado);


--
-- TOC entry 4779 (class 2606 OID 90224)
-- Name: dispositivo dispositivo_id_empleado_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dispositivo
    ADD CONSTRAINT dispositivo_id_empleado_fkey FOREIGN KEY (id_empleado) REFERENCES public.empleado(id_empleado);


--
-- TOC entry 4780 (class 2606 OID 90229)
-- Name: empleado fk_empleado_departamento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT fk_empleado_departamento FOREIGN KEY (id_departamento) REFERENCES public.departamento(id_departamento);


--
-- TOC entry 4781 (class 2606 OID 90234)
-- Name: incidencia incidencia_id_dispositivo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incidencia
    ADD CONSTRAINT incidencia_id_dispositivo_fkey FOREIGN KEY (id_dispositivo) REFERENCES public.dispositivo(id_dispositivo);


--
-- TOC entry 4782 (class 2606 OID 90239)
-- Name: incidencia incidencia_id_empleado_gestiona_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incidencia
    ADD CONSTRAINT incidencia_id_empleado_gestiona_fkey FOREIGN KEY (id_empleado_gestiona) REFERENCES public.empleado(id_empleado);


--
-- TOC entry 4783 (class 2606 OID 90244)
-- Name: incidencia incidencia_id_empleado_pone_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incidencia
    ADD CONSTRAINT incidencia_id_empleado_pone_fkey FOREIGN KEY (id_empleado_pone) REFERENCES public.empleado(id_empleado);


--
-- TOC entry 4940 (class 0 OID 0)
-- Dependencies: 215
-- Name: TABLE departamento; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.departamento TO administrador;
GRANT SELECT ON TABLE public.departamento TO rrhh;
GRANT SELECT ON TABLE public.departamento TO tecnico;
GRANT SELECT,UPDATE ON TABLE public.departamento TO direccion;


--
-- TOC entry 4942 (class 0 OID 0)
-- Dependencies: 216
-- Name: SEQUENCE departamento_id_departamento_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.departamento_id_departamento_seq TO administrador;


--
-- TOC entry 4943 (class 0 OID 0)
-- Dependencies: 217
-- Name: TABLE dispositivo; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.dispositivo TO administrador;
GRANT SELECT ON TABLE public.dispositivo TO rrhh;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.dispositivo TO tecnico;
GRANT SELECT ON TABLE public.dispositivo TO direccion;


--
-- TOC entry 4945 (class 0 OID 0)
-- Dependencies: 218
-- Name: SEQUENCE dispositivo_id_dispositivo_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.dispositivo_id_dispositivo_seq TO administrador;


--
-- TOC entry 4946 (class 0 OID 0)
-- Dependencies: 219
-- Name: TABLE empleado; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.empleado TO administrador;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.empleado TO rrhh;
GRANT SELECT ON TABLE public.empleado TO tecnico;
GRANT SELECT ON TABLE public.empleado TO direccion;
GRANT SELECT ON TABLE public.empleado TO empleado_user;


--
-- TOC entry 4948 (class 0 OID 0)
-- Dependencies: 220
-- Name: SEQUENCE empleado_id_empleado_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.empleado_id_empleado_seq TO administrador;


--
-- TOC entry 4949 (class 0 OID 0)
-- Dependencies: 221
-- Name: TABLE incidencia; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.incidencia TO administrador;


--
-- TOC entry 4951 (class 0 OID 0)
-- Dependencies: 222
-- Name: SEQUENCE incidencia_id_incidencia_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.incidencia_id_incidencia_seq TO administrador;


-- Completed on 2026-05-04 19:33:42

--
-- PostgreSQL database dump complete
--

\unrestrict X75eI23P7w7tUmTXTBMbveXUgqZQFqwRwKfuTJsmmyuSb1c0JNNEfZrtZrKikOr

