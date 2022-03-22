--
-- PostgreSQL database dump
--

-- Dumped from database version 11.12
-- Dumped by pg_dump version 11.12

-- Started on 2021-10-21 13:55:15

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

DROP DATABASE groundwater;
--
-- TOC entry 3050 (class 1262 OID 43911)
-- Name: groundwater; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE groundwater WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


ALTER DATABASE groundwater OWNER TO postgres;

\connect groundwater

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
-- TOC entry 2 (class 3079 OID 44012)
-- Name: ogr_fdw; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS ogr_fdw WITH SCHEMA public;


--
-- TOC entry 3051 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION ogr_fdw; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION ogr_fdw IS 'foreign-data wrapper for GIS data access';


--
-- TOC entry 1790 (class 1417 OID 44018)
-- Name: excel_server; Type: SERVER; Schema: -; Owner: postgres
--

CREATE SERVER excel_server FOREIGN DATA WRAPPER ogr_fdw OPTIONS (
    datasource E'C:\\projects\\GW_Monitoring.xlsx',
    format 'XLSX'
);


ALTER SERVER excel_server OWNER TO postgres;

--
-- TOC entry 1791 (class 1417 OID 44394)
-- Name: ground_water; Type: SERVER; Schema: -; Owner: postgres
--

CREATE SERVER ground_water FOREIGN DATA WRAPPER ogr_fdw OPTIONS (
    datasource E'C:\\projects\\database_upload.xlsx',
    format 'XLSX'
);


ALTER SERVER ground_water OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 206 (class 1259 OID 44062)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 44060)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- TOC entry 3052 (class 0 OID 0)
-- Dependencies: 205
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- TOC entry 208 (class 1259 OID 44072)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 44070)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 3053 (class 0 OID 0)
-- Dependencies: 207
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- TOC entry 204 (class 1259 OID 44054)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 44052)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- TOC entry 3054 (class 0 OID 0)
-- Dependencies: 203
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- TOC entry 210 (class 1259 OID 44080)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 44090)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 44088)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- TOC entry 3055 (class 0 OID 0)
-- Dependencies: 211
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- TOC entry 209 (class 1259 OID 44078)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- TOC entry 3056 (class 0 OID 0)
-- Dependencies: 209
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- TOC entry 214 (class 1259 OID 44098)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 44096)
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 3057 (class 0 OID 0)
-- Dependencies: 213
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- TOC entry 216 (class 1259 OID 44158)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 44156)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- TOC entry 3058 (class 0 OID 0)
-- Dependencies: 215
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- TOC entry 202 (class 1259 OID 44044)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 44042)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- TOC entry 3059 (class 0 OID 0)
-- Dependencies: 201
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- TOC entry 200 (class 1259 OID 44033)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 44031)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- TOC entry 3060 (class 0 OID 0)
-- Dependencies: 199
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- TOC entry 217 (class 1259 OID 44189)
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;












--
-- TOC entry 226 (class 1259 OID 44398)
-- Name: gw_monitoring_kobo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gw_monitoring_kobo (
    date date NOT NULL,
    district character varying,
    latitude double precision,
    longitude double precision,
    altitude double precision,
    "precision" double precision,
    well_type character varying,
    measurement_point_cm integer,
    measurement_of_wet_point_on_tape__in_m_ character varying,
    gw_level_from_mp double precision,
    mp_in_m double precision,
    gw_level double precision,
    fid integer NOT NULL,
    well_num character varying
);


ALTER TABLE public.gw_monitoring_kobo OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 44019)
-- Name: gw_monitoring_pilot_project; Type: FOREIGN TABLE; Schema: public; Owner: postgres
--

CREATE FOREIGN TABLE public.gw_monitoring_pilot_project (
    fid bigint,
    start character varying,
    "end" character varying,
    today character varying,
    deviceid character varying,
    enumerator_name character varying,
    select_district character varying,
    geographic_location character varying,
    _geographic_location_latitude character varying,
    _geographic_location_longitude character varying,
    _geographic_location_altitude character varying,
    _geographic_location_precision character varying,
    well_type__ character varying,
    well_no__bd_dw character varying,
    well_no__bd_sw character varying,
    well_no__bk_dw character varying,
    well_no__bk_sw character varying,
    measurement_point_cm character varying,
    _your_mp_is___measurement_point_cm__cm_above_ground__ character varying,
    photo_of_well__use_the_camera_to_take_a_clear_photo_of_the_well character varying,
    measurement_of_tape_at_measurement_point__mp___in_m_ character varying,
    measurement_of_wet_point_on_tape__in_m_ character varying,
    gw_level_from_mp character varying,
    mp_in_m character varying,
    gw_level character varying,
    _the_water_level_is___gw_level__m_below_ground_ character varying,
    notes character varying,
    audio_notes__use_the_camera_s_microphone_to_record_any_notes character varying,
    __version__ character varying,
    _id integer,
    _uuid character varying,
    _submission_time character varying,
    _validation_status character varying,
    _notes character varying,
    _status character varying,
    _submitted_by character varying,
    _tags character varying,
    _index integer
)
SERVER excel_server
OPTIONS (
    layer 'GW Monitoring Pilot Project'
);
ALTER FOREIGN TABLE public.gw_monitoring_pilot_project ALTER COLUMN enumerator_name OPTIONS (
    column_name 'Enumerator Name'
);
ALTER FOREIGN TABLE public.gw_monitoring_pilot_project ALTER COLUMN select_district OPTIONS (
    column_name 'Select District'
);
ALTER FOREIGN TABLE public.gw_monitoring_pilot_project ALTER COLUMN geographic_location OPTIONS (
    column_name 'Geographic location'
);
ALTER FOREIGN TABLE public.gw_monitoring_pilot_project ALTER COLUMN _geographic_location_latitude OPTIONS (
    column_name '_Geographic location_latitude'
);
ALTER FOREIGN TABLE public.gw_monitoring_pilot_project ALTER COLUMN _geographic_location_longitude OPTIONS (
    column_name '_Geographic location_longitude'
);
ALTER FOREIGN TABLE public.gw_monitoring_pilot_project ALTER COLUMN _geographic_location_altitude OPTIONS (
    column_name '_Geographic location_altitude'
);
ALTER FOREIGN TABLE public.gw_monitoring_pilot_project ALTER COLUMN _geographic_location_precision OPTIONS (
    column_name '_Geographic location_precision'
);
ALTER FOREIGN TABLE public.gw_monitoring_pilot_project ALTER COLUMN well_type__ OPTIONS (
    column_name 'Well type :'
);
ALTER FOREIGN TABLE public.gw_monitoring_pilot_project ALTER COLUMN well_no__bd_dw OPTIONS (
    column_name 'Well No. BD/DW'
);
ALTER FOREIGN TABLE public.gw_monitoring_pilot_project ALTER COLUMN well_no__bd_sw OPTIONS (
    column_name 'Well No. BD/SW'
);
ALTER FOREIGN TABLE public.gw_monitoring_pilot_project ALTER COLUMN well_no__bk_dw OPTIONS (
    column_name 'Well No. BK/DW'
);
ALTER FOREIGN TABLE public.gw_monitoring_pilot_project ALTER COLUMN well_no__bk_sw OPTIONS (
    column_name 'Well No. BK/SW'
);
ALTER FOREIGN TABLE public.gw_monitoring_pilot_project ALTER COLUMN _your_mp_is___measurement_point_cm__cm_above_ground__ OPTIONS (
    column_name '"Your MP is ${measurement_point_cm} cm above ground."'
);
ALTER FOREIGN TABLE public.gw_monitoring_pilot_project ALTER COLUMN photo_of_well__use_the_camera_to_take_a_clear_photo_of_the_well OPTIONS (
    column_name 'Photo of Well: Use the camera to take a clear photo of the well outlet with a marked measurement point'
);
ALTER FOREIGN TABLE public.gw_monitoring_pilot_project ALTER COLUMN measurement_of_tape_at_measurement_point__mp___in_m_ OPTIONS (
    column_name 'Measurement of tape at measurement point (MP) (in m)'
);
ALTER FOREIGN TABLE public.gw_monitoring_pilot_project ALTER COLUMN measurement_of_wet_point_on_tape__in_m_ OPTIONS (
    column_name 'Measurement of wet point on tape (in m)'
);
ALTER FOREIGN TABLE public.gw_monitoring_pilot_project ALTER COLUMN _the_water_level_is___gw_level__m_below_ground_ OPTIONS (
    column_name '"The water level is ${gw_level} m below ground"'
);
ALTER FOREIGN TABLE public.gw_monitoring_pilot_project ALTER COLUMN audio_notes__use_the_camera_s_microphone_to_record_any_notes OPTIONS (
    column_name 'Audio Notes: Use the camera''s microphone to record any notes'
);


ALTER FOREIGN TABLE public.gw_monitoring_pilot_project OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 44395)
-- Name: sheet1; Type: FOREIGN TABLE; Schema: public; Owner: postgres
--

CREATE FOREIGN TABLE public.sheet1 (
    fid bigint,
    date character varying,
    district character varying,
    latitude double precision,
    longitude double precision,
    altitude double precision,
    "precision" double precision,
    well_type character varying,
    measurement_point_cm integer,
    measurement_of_wet_point_on_tape__in_m_ character varying,
    gw_level_from_mp double precision,
    mp_in_m double precision,
    gw_level double precision,
    index integer,
    well_num character varying
)
SERVER ground_water
OPTIONS (
    layer 'Sheet1'
);
ALTER FOREIGN TABLE public.sheet1 ALTER COLUMN measurement_of_wet_point_on_tape__in_m_ OPTIONS (
    column_name 'Measurement of wet point on tape (in m)'
);


ALTER FOREIGN TABLE public.sheet1 OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 44286)
-- Name: type_of_well; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.type_of_well (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.type_of_well OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 44284)
-- Name: type_of_well_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.type_of_well_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.type_of_well_id_seq OWNER TO postgres;

--
-- TOC entry 3062 (class 0 OID 0)
-- Dependencies: 220
-- Name: type_of_well_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.type_of_well_id_seq OWNED BY public.type_of_well.id;


--
-- TOC entry 224 (class 1259 OID 44360)
-- Name: waterApp_gwlocationsdata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."waterApp_gwlocationsdata" (
    id bigint NOT NULL,
    well_number character varying(100),
    well_num character varying(100),
    district character varying(100),
    longitude double precision,
    latitude double precision,
    type_id integer NOT NULL,
    location character varying(100)
);


ALTER TABLE public."waterApp_gwlocationsdata" OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 44358)
-- Name: waterApp_gwlocationsdata_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."waterApp_gwlocationsdata_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."waterApp_gwlocationsdata_id_seq" OWNER TO postgres;

--
-- TOC entry 3063 (class 0 OID 0)
-- Dependencies: 223
-- Name: waterApp_gwlocationsdata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."waterApp_gwlocationsdata_id_seq" OWNED BY public."waterApp_gwlocationsdata".id;


--
-- TOC entry 230 (class 1259 OID 44426)
-- Name: waterApp_historicaldata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."waterApp_historicaldata" (
    id integer NOT NULL,
    well_number character varying(100),
    well_num character varying(100),
    longitude double precision,
    latitude double precision,
    location character varying(100),
    remarks text,
    date date NOT NULL,
    water_level double precision,
    type_id integer NOT NULL
);


ALTER TABLE public."waterApp_historicaldata" OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 44424)
-- Name: waterApp_historicaldata_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."waterApp_historicaldata_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."waterApp_historicaldata_id_seq" OWNER TO postgres;

--
-- TOC entry 3064 (class 0 OID 0)
-- Dependencies: 229
-- Name: waterApp_historicaldata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."waterApp_historicaldata_id_seq" OWNED BY public."waterApp_historicaldata".id;


--
-- TOC entry 228 (class 1259 OID 44418)
-- Name: waterApp_offlineloggerdata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."waterApp_offlineloggerdata" (
    id integer NOT NULL,
    date date NOT NULL,
    pressure double precision NOT NULL,
    temperature double precision NOT NULL,
    water_level double precision NOT NULL,
    location character varying(200) NOT NULL
);


ALTER TABLE public."waterApp_offlineloggerdata" OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 44416)
-- Name: waterApp_offlineloggerdata_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."waterApp_offlineloggerdata_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."waterApp_offlineloggerdata_id_seq" OWNER TO postgres;

--
-- TOC entry 3065 (class 0 OID 0)
-- Dependencies: 227
-- Name: waterApp_offlineloggerdata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."waterApp_offlineloggerdata_id_seq" OWNED BY public."waterApp_offlineloggerdata".id;


--
-- TOC entry 2804 (class 2604 OID 44065)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- TOC entry 2805 (class 2604 OID 44075)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 2803 (class 2604 OID 44057)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- TOC entry 2806 (class 2604 OID 44083)
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- TOC entry 2807 (class 2604 OID 44093)
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- TOC entry 2808 (class 2604 OID 44101)
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 2809 (class 2604 OID 44161)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- TOC entry 2802 (class 2604 OID 44047)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- TOC entry 2801 (class 2604 OID 44036)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);




--
-- TOC entry 2812 (class 2604 OID 44289)
-- Name: type_of_well id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_of_well ALTER COLUMN id SET DEFAULT nextval('public.type_of_well_id_seq'::regclass);


--
-- TOC entry 2813 (class 2604 OID 44363)
-- Name: waterApp_gwlocationsdata id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."waterApp_gwlocationsdata" ALTER COLUMN id SET DEFAULT nextval('public."waterApp_gwlocationsdata_id_seq"'::regclass);


--
-- TOC entry 2815 (class 2604 OID 44429)
-- Name: waterApp_historicaldata id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."waterApp_historicaldata" ALTER COLUMN id SET DEFAULT nextval('public."waterApp_historicaldata_id_seq"'::regclass);


--
-- TOC entry 2814 (class 2604 OID 44421)
-- Name: waterApp_offlineloggerdata id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."waterApp_offlineloggerdata" ALTER COLUMN id SET DEFAULT nextval('public."waterApp_offlineloggerdata_id_seq"'::regclass);


--
-- TOC entry 3021 (class 0 OID 44062)
-- Dependencies: 206
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3023 (class 0 OID 44072)
-- Dependencies: 208
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3019 (class 0 OID 44054)
-- Dependencies: 204
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (25, 'Can add gw monitoring', 7, 'add_gwmonitoring');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (26, 'Can change gw monitoring', 7, 'change_gwmonitoring');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (27, 'Can delete gw monitoring', 7, 'delete_gwmonitoring');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (28, 'Can view gw monitoring', 7, 'view_gwmonitoring');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (29, 'Can add gw locations', 8, 'add_gwlocations');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (30, 'Can change gw locations', 8, 'change_gwlocations');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (31, 'Can delete gw locations', 8, 'delete_gwlocations');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (32, 'Can view gw locations', 8, 'view_gwlocations');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (33, 'Can add well type', 9, 'add_welltype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (34, 'Can change well type', 9, 'change_welltype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (35, 'Can delete well type', 9, 'delete_welltype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (36, 'Can view well type', 9, 'view_welltype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (37, 'Can add gw locations data', 10, 'add_gwlocationsdata');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (38, 'Can change gw locations data', 10, 'change_gwlocationsdata');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (39, 'Can delete gw locations data', 10, 'delete_gwlocationsdata');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (40, 'Can view gw locations data', 10, 'view_gwlocationsdata');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (41, 'Can add gw monitoring kobo', 11, 'add_gwmonitoringkobo');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (42, 'Can change gw monitoring kobo', 11, 'change_gwmonitoringkobo');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (43, 'Can delete gw monitoring kobo', 11, 'delete_gwmonitoringkobo');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (44, 'Can view gw monitoring kobo', 11, 'view_gwmonitoringkobo');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (45, 'Can add offline logger data', 12, 'add_offlineloggerdata');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (46, 'Can change offline logger data', 12, 'change_offlineloggerdata');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (47, 'Can delete offline logger data', 12, 'delete_offlineloggerdata');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (48, 'Can view offline logger data', 12, 'view_offlineloggerdata');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (49, 'Can add historical data', 13, 'add_historicaldata');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (50, 'Can change historical data', 13, 'change_historicaldata');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (51, 'Can delete historical data', 13, 'delete_historicaldata');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (52, 'Can view historical data', 13, 'view_historicaldata');


--
-- TOC entry 3025 (class 0 OID 44080)
-- Dependencies: 210
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3027 (class 0 OID 44090)
-- Dependencies: 212
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3029 (class 0 OID 44098)
-- Dependencies: 214
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3031 (class 0 OID 44158)
-- Dependencies: 216
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3017 (class 0 OID 44044)
-- Dependencies: 202
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.django_content_type (id, app_label, model) VALUES (1, 'admin', 'logentry');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (2, 'auth', 'permission');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (3, 'auth', 'group');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (4, 'auth', 'user');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (6, 'sessions', 'session');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (7, 'waterApp', 'gwmonitoring');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (8, 'waterApp', 'gwlocations');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (9, 'waterApp', 'welltype');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (10, 'waterApp', 'gwlocationsdata');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (11, 'waterApp', 'gwmonitoringkobo');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (12, 'waterApp', 'offlineloggerdata');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (13, 'waterApp', 'historicaldata');


--
-- TOC entry 3015 (class 0 OID 44033)
-- Dependencies: 200
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.django_migrations (id, app, name, applied) VALUES (1, 'contenttypes', '0001_initial', '2021-08-25 22:04:46.982112+05:45');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (2, 'auth', '0001_initial', '2021-08-25 22:04:47.049738+05:45');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (3, 'admin', '0001_initial', '2021-08-25 22:04:47.1234+05:45');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2021-08-25 22:04:47.137707+05:45');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2021-08-25 22:04:47.147607+05:45');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2021-08-25 22:04:47.161851+05:45');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2021-08-25 22:04:47.165727+05:45');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (8, 'auth', '0003_alter_user_email_max_length', '2021-08-25 22:04:47.175088+05:45');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (9, 'auth', '0004_alter_user_username_opts', '2021-08-25 22:04:47.179094+05:45');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (10, 'auth', '0005_alter_user_last_login_null', '2021-08-25 22:04:47.185103+05:45');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (11, 'auth', '0006_require_contenttypes_0002', '2021-08-25 22:04:47.189809+05:45');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2021-08-25 22:04:47.195262+05:45');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (13, 'auth', '0008_alter_user_username_max_length', '2021-08-25 22:04:47.208508+05:45');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2021-08-25 22:04:47.216704+05:45');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (15, 'auth', '0010_alter_group_name_max_length', '2021-08-25 22:04:47.224736+05:45');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (16, 'auth', '0011_update_proxy_permissions', '2021-08-25 22:04:47.228715+05:45');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (17, 'sessions', '0001_initial', '2021-08-25 22:04:47.242251+05:45');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (18, 'waterApp', '0001_initial', '2021-08-25 22:05:07.698136+05:45');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (19, 'waterApp', '0002_auto_20210825_2205', '2021-08-25 22:06:02.847035+05:45');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (20, 'waterApp', '0003_auto_20210825_2210', '2021-08-25 22:10:50.311291+05:45');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (21, 'waterApp', '0004_auto_20210825_2217', '2021-08-25 22:17:14.471284+05:45');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (22, 'waterApp', '0005_gwlocations', '2021-08-26 10:06:44.889194+05:45');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (24, 'waterApp', '0006_welltype', '2021-08-26 12:33:59.526109+05:45');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (25, 'waterApp', '0007_gwlocations_type', '2021-08-26 12:42:27.878019+05:45');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (26, 'waterApp', '0008_auto_20210911_1038', '2021-09-11 10:40:03.129676+05:45');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (27, 'waterApp', '0009_auto_20210911_1041', '2021-09-11 10:41:32.773215+05:45');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (28, 'waterApp', '0010_auto_20210911_1041', '2021-09-11 10:42:03.629623+05:45');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (29, 'waterApp', '0011_auto_20210911_1043', '2021-09-11 10:43:08.698564+05:45');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (30, 'waterApp', '0012_gwlocationsdata', '2021-09-11 12:05:10.32232+05:45');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (31, 'waterApp', '0013_gwlocationsdata_location', '2021-09-11 12:09:26.702071+05:45');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (32, 'waterApp', '0014_gwmonitoringkobo', '2021-09-14 13:23:35.228797+05:45');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (33, 'waterApp', '0015_auto_20210914_1323', '2021-09-14 13:23:51.786819+05:45');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (34, 'waterApp', '0016_auto_20210914_1328', '2021-09-14 13:28:27.794867+05:45');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (35, 'waterApp', '0017_offlineloggerdata', '2021-09-16 11:22:36.985445+05:45');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (36, 'waterApp', '0018_historicaldata', '2021-09-21 10:38:04.869035+05:45');


--
-- TOC entry 3032 (class 0 OID 44189)
-- Dependencies: 217
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3034 (class 0 OID 44263)
-- Dependencies: 219
--


--
-- TOC entry 3040 (class 0 OID 44398)
-- Dependencies: 226
-- Data for Name: gw_monitoring_kobo; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3036 (class 0 OID 44286)
-- Dependencies: 221
-- Data for Name: type_of_well; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.type_of_well (id, name) VALUES (1, 'Shallow Tubewells');
INSERT INTO public.type_of_well (id, name) VALUES (2, 'Deep Tubewells');

INSERT INTO public.gw_monitoring_kobo (date, district, latitude, longitude, altitude, "precision", well_type, measurement_point_cm, measurement_of_wet_point_on_tape__in_m_, gw_level_from_mp, mp_in_m, gw_level, fid, well_num) VALUES ('2021-09-08', 'Banke', 28.196234, 83.71193, 103.907109904801004, 4.80, '1', 20, NULL, 1.9, 0.200000000000000011, 2.72999999999999998, 1, 'bk-sw-01');
INSERT INTO public.gw_monitoring_kobo (date, district, latitude, longitude, altitude, "precision", well_type, measurement_point_cm, measurement_of_wet_point_on_tape__in_m_, gw_level_from_mp, mp_in_m, gw_level, fid, well_num) VALUES ('2021-08-08', 'Banke', 28.19602, 82.71165, 126.394308032484005, 4.85400000000000009, '1', 20, NULL, 2.14999999999999991, 1.200000000000000011, 1.94999999999999996, 2, 'bk-sw-01');
INSERT INTO public.gw_monitoring_kobo (date, district, latitude, longitude, altitude, "precision", well_type, measurement_point_cm, measurement_of_wet_point_on_tape__in_m_, gw_level_from_mp, mp_in_m, gw_level, fid, well_num) VALUES ('2021-02-01', 'Banke', 28.1960, 83.71174, 107, 4.55100000000000016, '1', 20, NULL, 3.14999999999999991, 0.200000000000000011, 1.018, 3, 'bk-sw-01');
INSERT INTO public.gw_monitoring_kobo (date, district, latitude, longitude, altitude, "precision", well_type, measurement_point_cm, measurement_of_wet_point_on_tape__in_m_, gw_level_from_mp, mp_in_m, gw_level, fid, well_num) VALUES ('2021-01-27', 'Banke', 28.0, 85.6419293, 114, 13.3490000000000002, '1', 20, NULL, 2.39999999999999991, 0.200000000000000011, 3.00018, 4, 'bk-sw-01');
INSERT INTO public.gw_monitoring_kobo (date, district, latitude, longitude, altitude, "precision", well_type, measurement_point_cm, measurement_of_wet_point_on_tape__in_m_, gw_level_from_mp, mp_in_m, gw_level, fid, well_num) VALUES ('2021-03-02', 'Banke', 28.081, 83.5465, 103.484036185508003, 4.80299999999999994, '2', 37, NULL, 11.3499999999999996, 0.996, 5, 299, 'bk-dw-01');
INSERT INTO public.gw_monitoring_kobo (date, district, latitude, longitude, altitude, "precision", well_type, measurement_point_cm, measurement_of_wet_point_on_tape__in_m_, gw_level_from_mp, mp_in_m, gw_level, fid, well_num) VALUES ('2021-02-05', 'Banke', 28.0, 84.5466408, 84, 4.55100000000000016, '2', 37, NULL, 11.3499999999999996, 0.369999999999999996, 0.9800000000000004, 6, 'bk-dw-01');
INSERT INTO public.gw_monitoring_kobo (date, district, latitude, longitude, altitude, "precision", well_type, measurement_point_cm, measurement_of_wet_point_on_tape__in_m_, gw_level_from_mp, mp_in_m, gw_level, fid, well_num) VALUES ('2021-02-05', 'Banke', 28.0818, 82.54664, 84, 4.55100000000000016, '2', 37, NULL, 11.3499999999999996, 0.369999999999999996, 1.9800000000000004, 7, 'bk-dw-01');
INSERT INTO public.gw_monitoring_kobo (date, district, latitude, longitude, altitude, "precision", well_type, measurement_point_cm, measurement_of_wet_point_on_tape__in_m_, gw_level_from_mp, mp_in_m, gw_level, fid, well_num) VALUES ('2021-01-28', 'Bardiya', 28.080, 82.642070, 64, 51.578000000000003, '1', 0, NULL, 2, 0, 2, 363, 'bd-sw-01');
INSERT INTO public.gw_monitoring_kobo (date, district, latitude, longitude, altitude, "precision", well_type, measurement_point_cm, measurement_of_wet_point_on_tape__in_m_, gw_level_from_mp, mp_in_m, gw_level, fid, well_num) VALUES ('2021-01-28', 'Bardiya', 28.085, 81.5163, 83, 4.80299999999999994, '2', 25, NULL, 12, 0.25, 11.75, 345, 'bd-dw-01');
INSERT INTO public.gw_monitoring_kobo (date, district, latitude, longitude, altitude, "precision", well_type, measurement_point_cm, measurement_of_wet_point_on_tape__in_m_, gw_level_from_mp, mp_in_m, gw_level, fid, well_num) VALUES ('2021-01-28', 'Bardiya', 28.08, 82.516361599, 83, 4.80299999999999994, '2', 25, NULL, 12, 0.25, 11.75, 345, 'bd-dw-01');
--
-- TOC entry 3039 (class 0 OID 44360)
-- Dependencies: 224
-- Data for Name: waterApp_gwlocationsdata; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."waterApp_gwlocationsdata" (id, well_number, well_num, district, longitude, latitude, type_id, location) VALUES (1, 'well num', 'bk-sw-01', 'Banke', 84.30, 28.0804943000000016, 1, 'Rohini Khola');
INSERT INTO public."waterApp_gwlocationsdata" (id, well_number, well_num, district, longitude, latitude, type_id, location) VALUES (2, 'well num', 'bd-sw-01', 'Bardiya', 83.6420700000000039, 28.0803240999999986, 1, 'Bertani');
INSERT INTO public."waterApp_gwlocationsdata" (id, well_number, well_num, district, longitude, latitude, type_id, location) VALUES (3, 'well num', 'bk-dw-01', 'Banke', 83.5466408999999999, 28.0818215000000002, 2, 'K Gaon');
INSERT INTO public."waterApp_gwlocationsdata" (id, well_number, well_num, district, longitude, latitude, type_id, location) VALUES (4, 'well num', 'bd-dw-01', 'Bardiya', 82.5163615999999962, 28.0851809999999986, 2, 'Shantipur');



--
-- TOC entry 3044 (class 0 OID 44426)
-- Dependencies: 230
-- Data for Name: waterApp_historicaldata; Type: TABLE DATA; Schema: public; Owner: postgres
--
INSERT INTO public."waterApp_historicaldata" (id, well_number, well_num, longitude, latitude, location, remarks, date, water_level, type_id) VALUES (1, 'well_number', 'bk-sw-01', 561500, 3119130, 'Rohini_Khola', NULL, '2001-01-15', 1.995, 1);
INSERT INTO public."waterApp_historicaldata" (id, well_number, well_num, longitude, latitude, location, remarks, date, water_level, type_id) VALUES (2, 'well_number', 'bk-sw-01', 562500, 3119130, 'Rohini_Khola', NULL, '2001-02-15', 1.20000000000000018, 1);
INSERT INTO public."waterApp_historicaldata" (id, well_number, well_num, longitude, latitude, location, remarks, date, water_level, type_id) VALUES (3, 'well_number', 'bk-sw-01', 563500, 3119130, 'Rohini_Khola', NULL, '2001-10-15', 2.000000021, 1);
INSERT INTO public."waterApp_historicaldata" (id, well_number, well_num, longitude, latitude, location, remarks, date, water_level, type_id) VALUES (4, 'well_number', 'bk-sw-01', 561500, 3119130, 'Rohini_Khola', NULL, '2002-04-15', 2.25, 1);
INSERT INTO public."waterApp_historicaldata" (id, well_number, well_num, longitude, latitude, location, remarks, date, water_level, type_id) VALUES (5, 'well_number', 'bk-sw-01', 562500, 3119130, 'Rohini_Khola', NULL, '2002-10-15', NULL, 1);
INSERT INTO public."waterApp_historicaldata" (id, well_number, well_num, longitude, latitude, location, remarks, date, water_level, type_id) VALUES (6, 'well_number', 'bk-dw-01', 82.646, 28.0513100000000009, 'K_Gaon', NULL, '2002-10-15', NULL, 2);
INSERT INTO public."waterApp_historicaldata" (id, well_number, well_num, longitude, latitude, location, remarks, date, water_level, type_id) VALUES (7, 'well_number', 'bk-dw-01', 83.60000046, 28.0513100000000009, 'K_Gaon', NULL, '2002-10-15', NULL, 2);
INSERT INTO public."waterApp_historicaldata" (id, well_number, well_num, longitude, latitude, location, remarks, date, water_level, type_id) VALUES (8, 'well_number', 'bk-dw-01', 83.6046, 28.0513100000000009, 'K_Gaon', NULL, '2002-11-15', 5.0064, 2);
INSERT INTO public."waterApp_historicaldata" (id, well_number, well_num, longitude, latitude, location, remarks, date, water_level, type_id) VALUES (9, 'well_number', 'bk-dw-01', 82.6000046, 28.0513100000000009, 'K_Gaon', NULL, '2003-03-15', 1.0005, 2);
INSERT INTO public."waterApp_historicaldata" (id, well_number, well_num, longitude, latitude, location, remarks, date, water_level, type_id) VALUES (10, 'well_number', 'bk-dw-01', 83.0000046, 28.0513100000000009, 'K_Gaon', NULL, '2003-12-15', 3.9964, 2);
INSERT INTO public."waterApp_historicaldata" (id, well_number, well_num, longitude, latitude, location, remarks, date, water_level, type_id) VALUES (11, 'well_number', 'bk-dw-01', 84.00046, 28.0513100000000009, 'K_Gaon', NULL, '2005-02-15', 1.0007, 2);


--
-- TOC entry 3042 (class 0 OID 44418)
-- Dependencies: 228
-- Data for Name: waterApp_offlineloggerdata; Type: TABLE DATA; Schema: public; Owner: postgres
--


INSERT INTO public."waterApp_offlineloggerdata" (id, date, pressure, temperature, water_level, location) VALUES (1, '2021-02-08', 19.997000000000014, 24.9310000000000009, 1.39999988, 'Rohini Khola');
INSERT INTO public."waterApp_offlineloggerdata" (id, date, pressure, temperature, water_level, location) VALUES (2, '2021-02-09', 29.822000000000003, 24.9310000000000009, 2.0011, 'Rohini Khola');
INSERT INTO public."waterApp_offlineloggerdata" (id, date, pressure, temperature, water_level, location) VALUES (3, '2021-02-09', 29.753999999999991, 24.8350000000000009, 7.9999979, 'Rohini Khola');
INSERT INTO public."waterApp_offlineloggerdata" (id, date, pressure, temperature, water_level, location) VALUES (4, '2021-02-13', 320.032000000000011, 24.9310000000000009, 2.35599999999999987, 'Rohini Khola');
INSERT INTO public."waterApp_offlineloggerdata" (id, date, pressure, temperature, water_level, location) VALUES (5, '2021-08-05', 50.139999999999986, 24.8350000000000009, 1.32600000000000007, 'Rohini Khola');
INSERT INTO public."waterApp_offlineloggerdata" (id, date, pressure, temperature, water_level, location) VALUES (6, '2021-08-06', 40.349999999999994, 24.8350000000000009, 1.33, 'Rohini Khola');
INSERT INTO public."waterApp_offlineloggerdata" (id, date, pressure, temperature, water_level, location) VALUES (7, '2021-08-09', 640.806000000000012, 24.8350000000000009, 6.25800000000000001, 'Rohini Khola');
INSERT INTO public."waterApp_offlineloggerdata" (id, date, pressure, temperature, water_level, location) VALUES (8, '2021-08-09', 140.52600000000001, 24.8350000000000009, 2.28600000000000003, 'Rohini Khola');

--
-- TOC entry 3066 (class 0 OID 0)
-- Dependencies: 205
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- TOC entry 3067 (class 0 OID 0)
-- Dependencies: 207
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 3068 (class 0 OID 0)
-- Dependencies: 203
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 52, true);


--
-- TOC entry 3069 (class 0 OID 0)
-- Dependencies: 211
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- TOC entry 3070 (class 0 OID 0)
-- Dependencies: 209
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, false);


--
-- TOC entry 3071 (class 0 OID 0)
-- Dependencies: 213
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 3072 (class 0 OID 0)
-- Dependencies: 215
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- TOC entry 3073 (class 0 OID 0)
-- Dependencies: 201
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 13, true);


--
-- TOC entry 3074 (class 0 OID 0)
-- Dependencies: 199
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 36, true);








--
-- TOC entry 3077 (class 0 OID 0)
-- Dependencies: 220
-- Name: type_of_well_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.type_of_well_id_seq', 2, true);


--
-- TOC entry 3078 (class 0 OID 0)
-- Dependencies: 223
-- Name: waterApp_gwlocationsdata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."waterApp_gwlocationsdata_id_seq"', 1, false);


--
-- TOC entry 3079 (class 0 OID 0)
-- Dependencies: 229
-- Name: waterApp_historicaldata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."waterApp_historicaldata_id_seq"', 1, false);


--
-- TOC entry 3080 (class 0 OID 0)
-- Dependencies: 227
-- Name: waterApp_offlineloggerdata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."waterApp_offlineloggerdata_id_seq"', 1, false);


--
-- TOC entry 2829 (class 2606 OID 44187)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 2834 (class 2606 OID 44124)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 2837 (class 2606 OID 44077)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2831 (class 2606 OID 44067)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 44110)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 2826 (class 2606 OID 44059)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2845 (class 2606 OID 44095)
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2848 (class 2606 OID 44139)
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- TOC entry 2839 (class 2606 OID 44085)
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2851 (class 2606 OID 44103)
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2854 (class 2606 OID 44153)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- TOC entry 2842 (class 2606 OID 44181)
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 2857 (class 2606 OID 44167)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 2819 (class 2606 OID 44051)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 2821 (class 2606 OID 44049)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 44041)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2861 (class 2606 OID 44196)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);





--
-- TOC entry 2872 (class 2606 OID 44415)
-- Name: gw_monitoring_kobo gw_monitoring_kobo_fid_885340d6_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gw_monitoring_kobo
    ADD CONSTRAINT gw_monitoring_kobo_fid_885340d6_pk PRIMARY KEY (fid);


--
-- TOC entry 2874 (class 2606 OID 44413)
-- Name: gw_monitoring_kobo gw_monitoring_kobo_fid_885340d6_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gw_monitoring_kobo
    ADD CONSTRAINT gw_monitoring_kobo_fid_885340d6_uniq UNIQUE (fid);


--
-- TOC entry 2867 (class 2606 OID 44291)
-- Name: type_of_well type_of_well_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_of_well
    ADD CONSTRAINT type_of_well_pkey PRIMARY KEY (id);


--
-- TOC entry 2869 (class 2606 OID 44365)
-- Name: waterApp_gwlocationsdata waterApp_gwlocationsdata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."waterApp_gwlocationsdata"
    ADD CONSTRAINT "waterApp_gwlocationsdata_pkey" PRIMARY KEY (id);


--
-- TOC entry 2878 (class 2606 OID 44434)
-- Name: waterApp_historicaldata waterApp_historicaldata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."waterApp_historicaldata"
    ADD CONSTRAINT "waterApp_historicaldata_pkey" PRIMARY KEY (id);


--
-- TOC entry 2876 (class 2606 OID 44423)
-- Name: waterApp_offlineloggerdata waterApp_offlineloggerdata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."waterApp_offlineloggerdata"
    ADD CONSTRAINT "waterApp_offlineloggerdata_pkey" PRIMARY KEY (id);


--
-- TOC entry 2827 (class 1259 OID 44188)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 2832 (class 1259 OID 44125)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 2835 (class 1259 OID 44126)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 2822 (class 1259 OID 44111)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 2843 (class 1259 OID 44141)
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- TOC entry 2846 (class 1259 OID 44140)
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- TOC entry 2849 (class 1259 OID 44155)
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 2852 (class 1259 OID 44154)
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 2840 (class 1259 OID 44182)
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 2855 (class 1259 OID 44178)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 2858 (class 1259 OID 44179)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 2859 (class 1259 OID 44198)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 2862 (class 1259 OID 44197)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);





--
-- TOC entry 2870 (class 1259 OID 44371)
-- Name: waterApp_gwlocationsdata_type_id_33def277; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "waterApp_gwlocationsdata_type_id_33def277" ON public."waterApp_gwlocationsdata" USING btree (type_id);


--
-- TOC entry 2879 (class 1259 OID 44440)
-- Name: waterApp_historicaldata_type_id_e8f16a8c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "waterApp_historicaldata_type_id_e8f16a8c" ON public."waterApp_historicaldata" USING btree (type_id);


--
-- TOC entry 2882 (class 2606 OID 44118)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2881 (class 2606 OID 44113)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2880 (class 2606 OID 44104)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2884 (class 2606 OID 44133)
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2883 (class 2606 OID 44128)
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2886 (class 2606 OID 44147)
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2885 (class 2606 OID 44142)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2887 (class 2606 OID 44168)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2888 (class 2606 OID 44173)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;





--
-- TOC entry 2890 (class 2606 OID 44366)
-- Name: waterApp_gwlocationsdata waterApp_gwlocationsdata_type_id_33def277_fk_type_of_well_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."waterApp_gwlocationsdata"
    ADD CONSTRAINT "waterApp_gwlocationsdata_type_id_33def277_fk_type_of_well_id" FOREIGN KEY (type_id) REFERENCES public.type_of_well(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2891 (class 2606 OID 44435)
-- Name: waterApp_historicaldata waterApp_historicaldata_type_id_e8f16a8c_fk_type_of_well_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."waterApp_historicaldata"
    ADD CONSTRAINT "waterApp_historicaldata_type_id_e8f16a8c_fk_type_of_well_id" FOREIGN KEY (type_id) REFERENCES public.type_of_well(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2021-10-21 13:55:16

--
-- PostgreSQL database dump complete
--

