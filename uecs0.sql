--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: t_ccm; Type: TABLE; Schema: public; Owner: uecs0
--

CREATE TABLE public.t_ccm (
    tod timestamp with time zone DEFAULT now(),
    ver text DEFAULT '1.00-E10'::text,
    num integer NOT NULL,
    ccmtype text NOT NULL,
    room integer NOT NULL,
    region integer NOT NULL,
    ord integer NOT NULL,
    priority integer NOT NULL,
    ct integer DEFAULT 0,
    unit text,
    sr character(1) NOT NULL,
    lv text NOT NULL,
    serialid bigint NOT NULL
);


ALTER TABLE public.t_ccm OWNER TO uecs0;

--
-- Name: t_ccm_serialid_seq; Type: SEQUENCE; Schema: public; Owner: uecs0
--

CREATE SEQUENCE public.t_ccm_serialid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_ccm_serialid_seq OWNER TO uecs0;

--
-- Name: t_ccm_serialid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uecs0
--

ALTER SEQUENCE public.t_ccm_serialid_seq OWNED BY public.t_ccm.serialid;


--
-- Name: t_data; Type: TABLE; Schema: public; Owner: uecs0
--

CREATE TABLE public.t_data (
    tod timestamp with time zone DEFAULT now(),
    ver text DEFAULT '1.00-E10'::text,
    ccmtype text NOT NULL,
    room integer NOT NULL,
    region integer NOT NULL,
    ord integer NOT NULL,
    priority integer NOT NULL,
    value bigint NOT NULL,
    ip inet NOT NULL,
    serialid bigint NOT NULL
);


ALTER TABLE public.t_data OWNER TO uecs0;

--
-- Name: t_data_serialid_seq; Type: SEQUENCE; Schema: public; Owner: uecs0
--

CREATE SEQUENCE public.t_data_serialid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_data_serialid_seq OWNER TO uecs0;

--
-- Name: t_data_serialid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uecs0
--

ALTER SEQUENCE public.t_data_serialid_seq OWNED BY public.t_data.serialid;


--
-- Name: t_node; Type: TABLE; Schema: public; Owner: uecs0
--

CREATE TABLE public.t_node (
    tod timestamp with time zone DEFAULT now(),
    ver text DEFAULT '1.00-E10'::text,
    name text NOT NULL,
    vender text NOT NULL,
    uecsid character(12) NOT NULL,
    ip inet NOT NULL,
    macaddr macaddr NOT NULL,
    serialid bigint NOT NULL
);


ALTER TABLE public.t_node OWNER TO uecs0;

--
-- Name: t_node_serialid_seq; Type: SEQUENCE; Schema: public; Owner: uecs0
--

CREATE SEQUENCE public.t_node_serialid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_node_serialid_seq OWNER TO uecs0;

--
-- Name: t_node_serialid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uecs0
--

ALTER SEQUENCE public.t_node_serialid_seq OWNED BY public.t_node.serialid;


--
-- Name: t_ccm serialid; Type: DEFAULT; Schema: public; Owner: uecs0
--

ALTER TABLE ONLY public.t_ccm ALTER COLUMN serialid SET DEFAULT nextval('public.t_ccm_serialid_seq'::regclass);


--
-- Name: t_data serialid; Type: DEFAULT; Schema: public; Owner: uecs0
--

ALTER TABLE ONLY public.t_data ALTER COLUMN serialid SET DEFAULT nextval('public.t_data_serialid_seq'::regclass);


--
-- Name: t_node serialid; Type: DEFAULT; Schema: public; Owner: uecs0
--

ALTER TABLE ONLY public.t_node ALTER COLUMN serialid SET DEFAULT nextval('public.t_node_serialid_seq'::regclass);


--
-- PostgreSQL database dump complete
--

