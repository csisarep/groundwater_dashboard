--
-- PostgreSQL database dump
--

-- Dumped from database version 11.12
-- Dumped by pg_dump version 11.12

-- Started on 2021-09-16 09:16:50

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
-- TOC entry 3025 (class 1262 OID 43911)
-- Name: groundwater; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE groundwater WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';


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
-- TOC entry 3026 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION ogr_fdw; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION ogr_fdw IS 'foreign-data wrapper for GIS data access';


--
-- TOC entry 1777 (class 1417 OID 44018)
-- Name: excel_server; Type: SERVER; Schema: -; Owner: postgres
--

CREATE SERVER excel_server FOREIGN DATA WRAPPER ogr_fdw OPTIONS (
    datasource E'C:\\projects\\GW_Monitoring.xlsx',
    format 'XLSX'
);


ALTER SERVER excel_server OWNER TO postgres;

--
-- TOC entry 1778 (class 1417 OID 44394)
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
-- TOC entry 3027 (class 0 OID 0)
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
-- TOC entry 3028 (class 0 OID 0)
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
-- TOC entry 3029 (class 0 OID 0)
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
-- TOC entry 3030 (class 0 OID 0)
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
-- TOC entry 3031 (class 0 OID 0)
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
-- TOC entry 3032 (class 0 OID 0)
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
-- TOC entry 3033 (class 0 OID 0)
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
-- TOC entry 3034 (class 0 OID 0)
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
-- TOC entry 3035 (class 0 OID 0)
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
-- TOC entry 219 (class 1259 OID 44263)
-- Name: graound_water_locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.graound_water_locations (
    id integer NOT NULL,
    well_number character varying(100),
    identifier character varying(100),
    place character varying(100),
    longitude double precision,
    latitude double precision,
    type_id integer NOT NULL
);


ALTER TABLE public.graound_water_locations OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 44261)
-- Name: graound_water_locations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.graound_water_locations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.graound_water_locations_id_seq OWNER TO postgres;

--
-- TOC entry 3036 (class 0 OID 0)
-- Dependencies: 218
-- Name: graound_water_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.graound_water_locations_id_seq OWNED BY public.graound_water_locations.id;


--
-- TOC entry 222 (class 1259 OID 44352)
-- Name: gw_monitoring_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gw_monitoring_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gw_monitoring_id_seq OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 44022)
-- Name: gw_monitoring; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gw_monitoring (
    start character varying,
    "end" character varying,
    today character varying,
    deviceid character varying,
    enumerator_name character varying,
    select_district character varying,
    geographic_location character varying,
    latitude double precision,
    longitude double precision,
    altitude double precision,
    location_precision double precision,
    well_type character varying,
    well_no_bd_dw character varying,
    well_no_bd_sw character varying,
    well_no_bk_dw character varying,
    well_no_bk_sw character varying,
    measurement_point_cm character varying,
    your_mp_is___measurement_point_cm__cm_above_ground__ character varying,
    photo_of_well__use_the_camera_to_take_a_clear_photo_of_the_well character varying,
    measurement_of_tape_at_measurement_point__mp___in_m_ double precision,
    measurement_of_wet_point_on_tape__in_m_ double precision,
    gw_level_from_mp double precision,
    mp_in_m double precision,
    gw_level double precision,
    the_water_level_is___gw_level__m_below_ground double precision,
    notes character varying,
    audio_notes__use_the_camera_s_microphone_to_record_any_notes character varying,
    version character varying,
    f_id integer,
    f_uuid character varying,
    submission_time character varying,
    validation_status character varying,
    f_notes character varying,
    status character varying,
    submitted_by character varying,
    tags character varying,
    index integer,
    id bigint DEFAULT nextval('public.gw_monitoring_id_seq'::regclass)
);


ALTER TABLE public.gw_monitoring OWNER TO postgres;

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
-- TOC entry 3037 (class 0 OID 0)
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
-- TOC entry 3038 (class 0 OID 0)
-- Dependencies: 223
-- Name: waterApp_gwlocationsdata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."waterApp_gwlocationsdata_id_seq" OWNED BY public."waterApp_gwlocationsdata".id;


--
-- TOC entry 2791 (class 2604 OID 44065)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- TOC entry 2792 (class 2604 OID 44075)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 2790 (class 2604 OID 44057)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- TOC entry 2793 (class 2604 OID 44083)
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- TOC entry 2794 (class 2604 OID 44093)
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- TOC entry 2795 (class 2604 OID 44101)
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 2796 (class 2604 OID 44161)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- TOC entry 2789 (class 2604 OID 44047)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- TOC entry 2788 (class 2604 OID 44036)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- TOC entry 2798 (class 2604 OID 44266)
-- Name: graound_water_locations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.graound_water_locations ALTER COLUMN id SET DEFAULT nextval('public.graound_water_locations_id_seq'::regclass);


--
-- TOC entry 2799 (class 2604 OID 44289)
-- Name: type_of_well id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_of_well ALTER COLUMN id SET DEFAULT nextval('public.type_of_well_id_seq'::regclass);


--
-- TOC entry 2800 (class 2604 OID 44363)
-- Name: waterApp_gwlocationsdata id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."waterApp_gwlocationsdata" ALTER COLUMN id SET DEFAULT nextval('public."waterApp_gwlocationsdata_id_seq"'::regclass);


--
-- TOC entry 3000 (class 0 OID 44062)
-- Dependencies: 206
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3002 (class 0 OID 44072)
-- Dependencies: 208
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2998 (class 0 OID 44054)
-- Dependencies: 204
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.auth_permission VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO public.auth_permission VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO public.auth_permission VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO public.auth_permission VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO public.auth_permission VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO public.auth_permission VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO public.auth_permission VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO public.auth_permission VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO public.auth_permission VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO public.auth_permission VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO public.auth_permission VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO public.auth_permission VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO public.auth_permission VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO public.auth_permission VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO public.auth_permission VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO public.auth_permission VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO public.auth_permission VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO public.auth_permission VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO public.auth_permission VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO public.auth_permission VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO public.auth_permission VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO public.auth_permission VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO public.auth_permission VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO public.auth_permission VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO public.auth_permission VALUES (25, 'Can add gw monitoring', 7, 'add_gwmonitoring');
INSERT INTO public.auth_permission VALUES (26, 'Can change gw monitoring', 7, 'change_gwmonitoring');
INSERT INTO public.auth_permission VALUES (27, 'Can delete gw monitoring', 7, 'delete_gwmonitoring');
INSERT INTO public.auth_permission VALUES (28, 'Can view gw monitoring', 7, 'view_gwmonitoring');
INSERT INTO public.auth_permission VALUES (29, 'Can add gw locations', 8, 'add_gwlocations');
INSERT INTO public.auth_permission VALUES (30, 'Can change gw locations', 8, 'change_gwlocations');
INSERT INTO public.auth_permission VALUES (31, 'Can delete gw locations', 8, 'delete_gwlocations');
INSERT INTO public.auth_permission VALUES (32, 'Can view gw locations', 8, 'view_gwlocations');
INSERT INTO public.auth_permission VALUES (33, 'Can add well type', 9, 'add_welltype');
INSERT INTO public.auth_permission VALUES (34, 'Can change well type', 9, 'change_welltype');
INSERT INTO public.auth_permission VALUES (35, 'Can delete well type', 9, 'delete_welltype');
INSERT INTO public.auth_permission VALUES (36, 'Can view well type', 9, 'view_welltype');
INSERT INTO public.auth_permission VALUES (37, 'Can add gw locations data', 10, 'add_gwlocationsdata');
INSERT INTO public.auth_permission VALUES (38, 'Can change gw locations data', 10, 'change_gwlocationsdata');
INSERT INTO public.auth_permission VALUES (39, 'Can delete gw locations data', 10, 'delete_gwlocationsdata');
INSERT INTO public.auth_permission VALUES (40, 'Can view gw locations data', 10, 'view_gwlocationsdata');
INSERT INTO public.auth_permission VALUES (41, 'Can add gw monitoring kobo', 11, 'add_gwmonitoringkobo');
INSERT INTO public.auth_permission VALUES (42, 'Can change gw monitoring kobo', 11, 'change_gwmonitoringkobo');
INSERT INTO public.auth_permission VALUES (43, 'Can delete gw monitoring kobo', 11, 'delete_gwmonitoringkobo');
INSERT INTO public.auth_permission VALUES (44, 'Can view gw monitoring kobo', 11, 'view_gwmonitoringkobo');


--
-- TOC entry 3004 (class 0 OID 44080)
-- Dependencies: 210
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3006 (class 0 OID 44090)
-- Dependencies: 212
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3008 (class 0 OID 44098)
-- Dependencies: 214
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3010 (class 0 OID 44158)
-- Dependencies: 216
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2996 (class 0 OID 44044)
-- Dependencies: 202
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.django_content_type VALUES (1, 'admin', 'logentry');
INSERT INTO public.django_content_type VALUES (2, 'auth', 'permission');
INSERT INTO public.django_content_type VALUES (3, 'auth', 'group');
INSERT INTO public.django_content_type VALUES (4, 'auth', 'user');
INSERT INTO public.django_content_type VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO public.django_content_type VALUES (6, 'sessions', 'session');
INSERT INTO public.django_content_type VALUES (7, 'waterApp', 'gwmonitoring');
INSERT INTO public.django_content_type VALUES (8, 'waterApp', 'gwlocations');
INSERT INTO public.django_content_type VALUES (9, 'waterApp', 'welltype');
INSERT INTO public.django_content_type VALUES (10, 'waterApp', 'gwlocationsdata');
INSERT INTO public.django_content_type VALUES (11, 'waterApp', 'gwmonitoringkobo');


--
-- TOC entry 2994 (class 0 OID 44033)
-- Dependencies: 200
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.django_migrations VALUES (1, 'contenttypes', '0001_initial', '2021-08-25 22:04:46.982112+05:45');
INSERT INTO public.django_migrations VALUES (2, 'auth', '0001_initial', '2021-08-25 22:04:47.049738+05:45');
INSERT INTO public.django_migrations VALUES (3, 'admin', '0001_initial', '2021-08-25 22:04:47.1234+05:45');
INSERT INTO public.django_migrations VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2021-08-25 22:04:47.137707+05:45');
INSERT INTO public.django_migrations VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2021-08-25 22:04:47.147607+05:45');
INSERT INTO public.django_migrations VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2021-08-25 22:04:47.161851+05:45');
INSERT INTO public.django_migrations VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2021-08-25 22:04:47.165727+05:45');
INSERT INTO public.django_migrations VALUES (8, 'auth', '0003_alter_user_email_max_length', '2021-08-25 22:04:47.175088+05:45');
INSERT INTO public.django_migrations VALUES (9, 'auth', '0004_alter_user_username_opts', '2021-08-25 22:04:47.179094+05:45');
INSERT INTO public.django_migrations VALUES (10, 'auth', '0005_alter_user_last_login_null', '2021-08-25 22:04:47.185103+05:45');
INSERT INTO public.django_migrations VALUES (11, 'auth', '0006_require_contenttypes_0002', '2021-08-25 22:04:47.189809+05:45');
INSERT INTO public.django_migrations VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2021-08-25 22:04:47.195262+05:45');
INSERT INTO public.django_migrations VALUES (13, 'auth', '0008_alter_user_username_max_length', '2021-08-25 22:04:47.208508+05:45');
INSERT INTO public.django_migrations VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2021-08-25 22:04:47.216704+05:45');
INSERT INTO public.django_migrations VALUES (15, 'auth', '0010_alter_group_name_max_length', '2021-08-25 22:04:47.224736+05:45');
INSERT INTO public.django_migrations VALUES (16, 'auth', '0011_update_proxy_permissions', '2021-08-25 22:04:47.228715+05:45');
INSERT INTO public.django_migrations VALUES (17, 'sessions', '0001_initial', '2021-08-25 22:04:47.242251+05:45');
INSERT INTO public.django_migrations VALUES (18, 'waterApp', '0001_initial', '2021-08-25 22:05:07.698136+05:45');
INSERT INTO public.django_migrations VALUES (19, 'waterApp', '0002_auto_20210825_2205', '2021-08-25 22:06:02.847035+05:45');
INSERT INTO public.django_migrations VALUES (20, 'waterApp', '0003_auto_20210825_2210', '2021-08-25 22:10:50.311291+05:45');
INSERT INTO public.django_migrations VALUES (21, 'waterApp', '0004_auto_20210825_2217', '2021-08-25 22:17:14.471284+05:45');
INSERT INTO public.django_migrations VALUES (22, 'waterApp', '0005_gwlocations', '2021-08-26 10:06:44.889194+05:45');
INSERT INTO public.django_migrations VALUES (24, 'waterApp', '0006_welltype', '2021-08-26 12:33:59.526109+05:45');
INSERT INTO public.django_migrations VALUES (25, 'waterApp', '0007_gwlocations_type', '2021-08-26 12:42:27.878019+05:45');
INSERT INTO public.django_migrations VALUES (26, 'waterApp', '0008_auto_20210911_1038', '2021-09-11 10:40:03.129676+05:45');
INSERT INTO public.django_migrations VALUES (27, 'waterApp', '0009_auto_20210911_1041', '2021-09-11 10:41:32.773215+05:45');
INSERT INTO public.django_migrations VALUES (28, 'waterApp', '0010_auto_20210911_1041', '2021-09-11 10:42:03.629623+05:45');
INSERT INTO public.django_migrations VALUES (29, 'waterApp', '0011_auto_20210911_1043', '2021-09-11 10:43:08.698564+05:45');
INSERT INTO public.django_migrations VALUES (30, 'waterApp', '0012_gwlocationsdata', '2021-09-11 12:05:10.32232+05:45');
INSERT INTO public.django_migrations VALUES (31, 'waterApp', '0013_gwlocationsdata_location', '2021-09-11 12:09:26.702071+05:45');
INSERT INTO public.django_migrations VALUES (32, 'waterApp', '0014_gwmonitoringkobo', '2021-09-14 13:23:35.228797+05:45');
INSERT INTO public.django_migrations VALUES (33, 'waterApp', '0015_auto_20210914_1323', '2021-09-14 13:23:51.786819+05:45');
INSERT INTO public.django_migrations VALUES (34, 'waterApp', '0016_auto_20210914_1328', '2021-09-14 13:28:27.794867+05:45');


--
-- TOC entry 3011 (class 0 OID 44189)
-- Dependencies: 217
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3013 (class 0 OID 44263)
-- Dependencies: 219
-- Data for Name: graound_water_locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.graound_water_locations VALUES (12, '12-045/46(B/K)12', 'BK12', 'Bahartha', NULL, NULL, 1);
INSERT INTO public.graound_water_locations VALUES (21, '1-045/46(BK)21', 'BK21', 'Balapur', 81.8035430099999985, 28.1474739400000011, 1);
INSERT INTO public.graound_water_locations VALUES (26, 'NISP-INV-STW/10', 'BK26', 'Banjaregaon', 81.5932600000000008, 28.0780700000000003, 1);
INSERT INTO public.graound_water_locations VALUES (3, '1-045/46(BK)3', 'BK3', 'Banktuwa', 81.6267086699999993, 28.2106815100000006, 1);
INSERT INTO public.graound_water_locations VALUES (7, '1-045/46(BK)7', 'BK7', 'Bhujai', 81.6321171600000071, 28.0906002900000011, 1);
INSERT INTO public.graound_water_locations VALUES (23, '23-045/46 (B/K) 23', 'BK23', 'Binauna', NULL, NULL, 1);
INSERT INTO public.graound_water_locations VALUES (8, '1-045/46(BK)8', 'BK8', 'Birta', 81.6603739899999965, 28.0507489800000016, 1);
INSERT INTO public.graound_water_locations VALUES (4, '1-045/46(BK)4', 'BK4', 'Channawa', 81.624591940000002, 28.1971510999999992, 1);
INSERT INTO public.graound_water_locations VALUES (17, '1-045/46(BK)17', 'BK17', 'D-gaon', 81.611090180000005, 28.1520781400000004, 1);
INSERT INTO public.graound_water_locations VALUES (19, '1-045/46(BK)19', 'BK19', 'Gaughat', 81.5558427499999965, 28.1035682000000016, 1);
INSERT INTO public.graound_water_locations VALUES (2, '1-045/46(BK)2', 'BK2', 'Jabdhawa', 81.6443024900000012, 28.2557331599999983, 1);
INSERT INTO public.graound_water_locations VALUES (11, '1-045/46(BK)11', 'BK11', 'Jaishpur', 81.6012498700000037, 28.0311612399999994, 1);
INSERT INTO public.graound_water_locations VALUES (25, 'NISP-INV-STW/8', 'BK25', 'Kajurakurda', 81.7981999999999942, 28.1430299999999995, 1);
INSERT INTO public.graound_water_locations VALUES (18, '1-045/46(BK)18', 'BK18', 'Kalhansgaon', 81.55200198, 28.1487182000000011, 1);
INSERT INTO public.graound_water_locations VALUES (22, '22-045/46(B/K)22', 'BK22', 'Kanchanpur', NULL, NULL, 1);
INSERT INTO public.graound_water_locations VALUES (10, '1-045/46(BK)10', 'BK10', 'Kharaicha', 81.7194694100000021, 27.9863612999999987, 1);
INSERT INTO public.graound_water_locations VALUES (20, '1-045/46(BK)20', 'BK20', 'Mahadevpuri', 81.7560577499999965, 28.2014526299999986, 1);
INSERT INTO public.graound_water_locations VALUES (15, '15-045/46(B/K)15', 'BK15', 'Majharatiya', NULL, NULL, 1);
INSERT INTO public.graound_water_locations VALUES (13, '13-045/46(B/K)13', 'BK13', 'Materiya', NULL, NULL, 1);
INSERT INTO public.graound_water_locations VALUES (14, '14-045/46(B/K)14', 'BK14', 'Narainapur', NULL, NULL, 1);
INSERT INTO public.graound_water_locations VALUES (24, 'NISP-STW/1', 'BK24', 'Office compound', 81.6450099999999992, 28.0812500000000007, 1);
INSERT INTO public.graound_water_locations VALUES (6, '1-045/46(BK)6', 'BK6', 'Piprahwa', 81.6598973800000039, 28.1392142700000001, 1);
INSERT INTO public.graound_water_locations VALUES (16, '1-045/46(BK)16', 'BK16', 'Rajgarhwa', 81.6964978099999968, 28.13000641, 1);
INSERT INTO public.graound_water_locations VALUES (27, 'NISP-INV-STW/11', 'BK27', 'Ramapurawa', 81.5955600000000061, 28.0827600000000004, 1);
INSERT INTO public.graound_water_locations VALUES (1, '1-045/46(BK)1', 'BK1', 'Rohini Khola', 81.5165999999999968, 28.1223099999999988, 1);
INSERT INTO public.graound_water_locations VALUES (9, '1-045/46(BK)9', 'BK9', 'Sikhanpurwa ', 81.6672846400000054, 28.0164133200000016, 1);
INSERT INTO public.graound_water_locations VALUES (5, '1-045/46(BK)5', 'BK5', 'Thapawa', 81.5838152500000007, 28.1932690599999987, 1);


--
-- TOC entry 2992 (class 0 OID 44022)
-- Dependencies: 198
-- Data for Name: gw_monitoring; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.gw_monitoring VALUES ('2021-08-09T17:12:58.729+05:45', '2021-08-09T17:15:02.743+05:45', '2021-08-09', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.0730454 81.5542845 77.85358932485494 4.551', 28.0730454000000016, 81.5542844999999943, 77.8535893248549371, 4.55100000000000016, 'Shallow well', NULL, 'S.No:  16   -  Well No: 16-045\46(B\D)16  - Location: Newlpur', NULL, NULL, '60', NULL, '1628508593867.jpg', 4, 1.89999999999999991, 2.10000000000000009, 0.599999999999999978, 1.5, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 200581245, '26e749d2-2f38-4772-b615-fcf239931503', '2021-08-10T06:24:40', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 1, 1);
INSERT INTO public.gw_monitoring VALUES ('2021-08-09T16:16:38.531+05:45', '2021-08-09T16:27:04.700+05:45', '2021-08-09', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.0731736 81.5542198 78.23443176682117 15.473', 28.0731736000000005, 81.5542197999999985, 78.2344317668211744, 15.4730000000000008, 'Shallow well', NULL, 'S.No:  15   -  Well No: 15-045\46(B\D)15  - Location: Bhurigaon', NULL, NULL, '55', NULL, '1628505644539.jpg', 3, 1.80000000000000004, 1.19999999999999996, 0.550000000000000044, 0.650000000000000022, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 200581230, '3d63db34-fc87-44de-ac4a-59513fc636ef', '2021-08-10T06:24:39', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 2, 2);
INSERT INTO public.gw_monitoring VALUES ('2021-08-09T15:05:41.743+05:45', '2021-08-09T15:12:02.316+05:45', '2021-08-09', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.0730752 81.5541683 99.01915621465078 13.653', 28.0730752000000017, 81.5541683000000006, 99.0191562146507778, 13.6530000000000005, 'Shallow well', NULL, 'S.No:  14   -  Well No: 14-045\46(B\D)14  - Location: Begnaha', NULL, NULL, '10', NULL, '1628501210461.jpg', 3, 2, 1, 0.100000000000000006, 0.900000000000000022, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 200581223, 'db2703a1-9850-4d6a-ad84-0f020ea5ad12', '2021-08-10T06:24:37', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 3, 3);
INSERT INTO public.gw_monitoring VALUES ('2021-08-08T13:39:32.921+05:45', '2021-08-08T13:41:02.805+05:45', '2021-08-08', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.1901003 81.4801999 95.96191099421911 4.803', 28.190100300000001, 81.4801999000000023, 95.9619109942191102, 4.80299999999999994, 'Shallow well', NULL, 'S.No:  11   -  Well No: 11-045\46(B\D)11  - Location: Baniyabhar', NULL, NULL, '75', NULL, '1628409355251.jpg', 4, 1.69999999999999996, 2.29999999999999982, 0.75, 1.55000000000000004, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 200581215, 'ff2f1bc5-a57c-4b60-87fb-7da30ad928b9', '2021-08-10T06:24:36', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 4, 4);
INSERT INTO public.gw_monitoring VALUES ('2021-08-08T13:36:24.771+05:45', '2021-08-08T13:37:47.367+05:45', '2021-08-08', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.1938307 81.4798692 99.8562533972747 4.803', 28.1938306999999995, 81.479869199999996, 99.8562533972746991, 4.80299999999999994, 'Shallow well', NULL, 'S.No:  10   -  Well No: 10-045\46(B\D)10  - Location: Padnaha', NULL, NULL, '60', NULL, '1628409147592.jpg', 4, 1.80000000000000004, 2.20000000000000018, 0.599999999999999978, 1.60000000000000009, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 200581210, '014d74bf-58d4-4e48-848a-da3e48c0617a', '2021-08-10T06:24:35', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 5, 5);
INSERT INTO public.gw_monitoring VALUES ('2021-08-08T13:33:27.412+05:45', '2021-08-08T13:34:29.675+05:45', '2021-08-08', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.1976928 81.4789118 103.65591418252136 4.803', 28.1976927999999987, 81.4789118000000059, 103.655914182521357, 4.80299999999999994, 'Shallow well', NULL, 'S.No:  7    -  Well No: 7-045\46(B\D)7  - Location: Megara Gadhi', NULL, NULL, '45', NULL, '1628408956893.jpg', 5, 2, 3, 0.450000000000000011, 2.54999999999999982, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 200581203, '1b7ca898-4b46-4829-8076-84f0d610ac0a', '2021-08-10T06:24:34', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 6, 6);
INSERT INTO public.gw_monitoring VALUES ('2021-08-08T13:26:25.465+05:45', '2021-08-08T13:28:11.518+05:45', '2021-08-08', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.2140378 81.4888619 108.71901051283 4.803', 28.2140377999999998, 81.4888619000000034, 108.719010512829996, 4.80299999999999994, 'Shallow well', NULL, 'S.No:  8    -  Well No: 8-045\46(B\D)8  - Location: Auri', NULL, NULL, '40', NULL, '1628408580213.jpg', 3, 1.5, 1.5, 0.400000000000000022, 1.10000000000000009, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 200581194, '8803eaf8-8962-4026-a200-d1bf974abbd5', '2021-08-10T06:24:33', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 7, 7);
INSERT INTO public.gw_monitoring VALUES ('2021-08-08T13:17:19.776+05:45', '2021-08-08T13:18:25.490+05:45', '2021-08-08', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.2376965 81.504949 115.70759715027975 4.854', 28.2376964999999984, 81.5049489999999963, 115.707597150279753, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  4    -  Well No: 4-045\46(B\D)4  - Location: Bangai', NULL, NULL, '32', NULL, '1628407986004.jpg', 4, 2.20000000000000018, 1.79999999999999982, 0.320000000000000007, 1.47999999999999998, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 200581187, 'e4300310-3bc1-418b-8627-34d8d9ada34e', '2021-08-10T06:24:32', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 8, 8);
INSERT INTO public.gw_monitoring VALUES ('2021-08-08T13:12:09.718+05:45', '2021-08-08T13:13:09.101+05:45', '2021-08-08', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.2259072 81.4953411 118.57153403694618 4.551', 28.2259072000000018, 81.4953411000000045, 118.571534036946176, 4.55100000000000016, 'Shallow well', NULL, 'S.No:  22   -  Well No: n.a.                            - Location: Belwa', NULL, NULL, '10', NULL, '1628407680342.jpg', 4, 2, 2, 0.100000000000000006, 1.89999999999999991, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 200581183, '85cc221d-8125-4784-a131-5974bdc9c682', '2021-08-10T06:24:30', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 9, 9);
INSERT INTO public.gw_monitoring VALUES ('2021-08-08T13:08:10.375+05:45', '2021-08-08T13:09:45.030+05:45', '2021-08-08', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.2214914 81.491992 112.19259305484597 4.551', 28.2214914000000014, 81.4919919999999962, 112.192593054845972, 4.55100000000000016, 'Shallow well', NULL, 'S.No:  21   -  Well No: na.a                            - Location: Belwa', NULL, NULL, '40', NULL, '1628407476433.jpg', 4, 2, 2, 0.400000000000000022, 1.60000000000000009, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 200581180, 'd7bab71d-17a4-4aa2-9ccb-5bd58e582ff0', '2021-08-10T06:24:29', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 10, 10);
INSERT INTO public.gw_monitoring VALUES ('2021-08-08T13:04:21.937+05:45', '2021-08-08T13:05:55.366+05:45', '2021-08-08', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.2172162 81.4894308 108.37573698392666 4.551', 28.2172161999999993, 81.4894307999999938, 108.375736983926657, 4.55100000000000016, 'Shallow well', NULL, 'S.No:  2    -  Well No: 2-045\46(B\D)2  - Location: Bakharikurd', NULL, NULL, '0', NULL, '1628407241510.jpg', 2, 1, 1, 0, 1, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 200581173, '33b658be-e77c-416b-9001-01ce848daa37', '2021-08-10T06:24:28', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 11, 11);
INSERT INTO public.gw_monitoring VALUES ('2021-08-04T13:37:33.086+05:45', '2021-08-04T13:38:42.478+05:45', '2021-08-04', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.2130177 81.3270243 89.87357367054865 4.551', 28.2130177000000018, 81.327024300000005, 89.8735736705486516, 4.55100000000000016, 'Shallow well', NULL, 'S.No:  13   -  Well No: 13-045\46(B\D)13  - Location: Madhubhan', NULL, NULL, '10', NULL, '1628063613389.jpg', 5, 2, 3, 0.100000000000000006, 2.89999999999999991, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 200581165, '3bb038db-37e3-4f8d-a364-1c45681a04dd', '2021-08-10T06:24:27', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 12, 12);
INSERT INTO public.gw_monitoring VALUES ('2021-08-04T13:31:43.463+05:45', '2021-08-04T13:32:37.281+05:45', '2021-08-04', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.2179781 81.3042395 95.37287826827239 4.854', 28.2179780999999998, 81.3042394999999942, 95.3728782682723875, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  12   -  Well No: 12-045\46(B\D)12  - Location: Taratal', NULL, NULL, '40', NULL, '1628063246929.jpg', 12, 2, 10, 0.400000000000000022, 9.59999999999999964, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 200581163, 'b9ea627e-9a78-4ec8-a4fe-597a7935cee1', '2021-08-10T06:24:26', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 13, 13);
INSERT INTO public.gw_monitoring VALUES ('2021-08-04T13:25:47.851+05:45', '2021-08-04T13:26:41.300+05:45', '2021-08-04', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.2194054 81.3116733 90.75116552619151 4.854', 28.2194053999999994, 81.3116732999999954, 90.7511655261915138, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  9    -  Well No: 9-045\46(B\D)9  - Location: Khairapur', NULL, NULL, '50', NULL, '1628062889965.jpg', 3, 2, 1, 0.5, 0.5, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 200581156, 'b4854c8d-01aa-44d2-87a5-e0a8369ab2d9', '2021-08-10T06:24:25', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 14, 14);
INSERT INTO public.gw_monitoring VALUES ('2021-08-04T13:11:19.579+05:45', '2021-08-04T13:12:26.612+05:45', '2021-08-04', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.1873754 81.3347824 87.12607686828471 4.803', 28.1873754000000005, 81.3347823999999946, 87.1260768682847129, 4.80299999999999994, 'Shallow well', NULL, 'S.No:  6    -  Well No: 6-045\46(B\D)6  - Location: Rain Nagar', NULL, NULL, '40', NULL, '1628062026752.jpg', 4, 1.60000000000000009, 2.39999999999999991, 0.400000000000000022, 2, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 200581151, '7529919e-23ad-4dcd-887e-de64d4807df0', '2021-08-10T06:24:24', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 15, 15);
INSERT INTO public.gw_monitoring VALUES ('2021-08-04T12:51:47.873+05:45', '2021-08-04T12:52:48.081+05:45', '2021-08-04', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.1897239 81.383618 85.65240648033817 4.803', 28.1897239000000006, 81.3836179999999985, 85.6524064803381719, 4.80299999999999994, 'Shallow well', NULL, 'S.No:  5    -  Well No: 5-045\46(B\D)5  - Location: Bhaisahi', NULL, NULL, '30', NULL, '1628060856292.jpg', 4, 1.5, 2.5, 0.299999999999999989, 2.20000000000000018, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 200581139, '1ecbabb6-a191-4667-a48d-b05cc15a7fed', '2021-08-10T06:24:23', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 16, 16);
INSERT INTO public.gw_monitoring VALUES ('2021-08-04T12:30:57.528+05:45', '2021-08-04T12:32:26.165+05:45', '2021-08-04', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.1880466 81.4799114 97.94417940144872 4.551', 28.1880465999999998, 81.479911400000006, 97.9441794014487215, 4.55100000000000016, 'Shallow well', NULL, 'S.No:  3    -  Well No: 3-045\46(B\D)3  - Location: Mainapokhar', NULL, NULL, '40', NULL, '1628059640374.jpg', 3, 1, 2, 0.400000000000000022, 1.60000000000000009, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 200581135, 'c026972e-00e8-4dcc-bbb8-de442bff2656', '2021-08-10T06:24:22', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 17, 17);
INSERT INTO public.gw_monitoring VALUES ('2021-08-04T12:18:20.833+05:45', '2021-08-04T12:22:42.510+05:45', '2021-08-04', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.1657641 81.5009533 80.40591800780668 4.803', 28.1657641000000005, 81.5009533000000062, 80.405918007806676, 4.80299999999999994, 'Shallow well', NULL, 'S.No:  20   -  Well No: NISP\INV\STW-6    - Location: Shoharawa', NULL, NULL, '70', NULL, '1628059050782.jpg', 6, 1.89999999999999991, 4.09999999999999964, 0.699999999999999956, 3.39999999999999991, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 200581125, 'a38bd8ea-f44a-4ded-9d3f-3a9f5a490cc4', '2021-08-10T06:24:21', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 18, 18);
INSERT INTO public.gw_monitoring VALUES ('2021-08-04T12:14:04.960+05:45', '2021-08-04T12:23:03.833+05:45', '2021-08-04', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.1607741 81.5015221 88.60528801911359 4.551', 28.1607741000000011, 81.5015221000000025, 88.605288019113587, 4.55100000000000016, 'Shallow well', NULL, 'S.No:  19   -  Well No: n.a.                             - Location: Bhawanipur', NULL, NULL, '30', NULL, '1628058623717.jpg', 7, 2, 5, 0.299999999999999989, 4.70000000000000018, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 200581123, 'd6897e37-3ade-4c1e-870a-c990c92cf11c', '2021-08-10T06:24:20', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 19, 19);
INSERT INTO public.gw_monitoring VALUES ('2021-08-04T12:08:39.817+05:45', '2021-08-04T12:10:52.137+05:45', '2021-08-04', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.1478396 81.4992551 83.27961892399249 4.854', 28.1478396000000011, 81.4992550999999992, 83.2796189239924871, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  18   -  Well No: NISP\INV\STW-5    - Location: Shoharawa', NULL, NULL, '40', NULL, '1628058339629.jpg', 5, 1, 4, 0.400000000000000022, 3.60000000000000009, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 200581118, '890f433b-5ccc-4d6c-8a8e-43bf7fe0b169', '2021-08-10T06:24:19', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 20, 20);
INSERT INTO public.gw_monitoring VALUES ('2021-07-31T13:46:07.779+05:45', '2021-07-31T13:46:59.416+05:45', '2021-07-31', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.1056238 81.4825759 92.7581376692274 4.551', 28.1056238, 81.4825759000000005, 92.7581376692273949, 4.55100000000000016, 'Deep well', 'S.No:  2   -  Well No: DTW-6            - Location: Tholodafe', NULL, NULL, NULL, '10', NULL, '1627718505898.jpg', 11, 2, 9, 0.100000000000000006, 8.90000000000000036, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 200581113, 'd33076d9-fd33-4013-8af3-79b325a8a230', '2021-08-10T06:24:18', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 21, 21);
INSERT INTO public.gw_monitoring VALUES ('2021-07-31T13:27:23.847+05:45', '2021-07-31T13:27:58.601+05:45', '2021-07-31', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.0883482 81.5027487 94.47740629910477 4.551', 28.0883481999999987, 81.5027486999999979, 94.4774062991047714, 4.55100000000000016, 'Deep well', 'S.No:  3   -  Well No: DTW-3             - Location: Shantipur', NULL, NULL, NULL, '20', NULL, '1627717370791.png', 13, 2, 11, 0.200000000000000011, 10.8000000000000007, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 200581109, 'caf135da-846e-4196-8607-a5dfba335db5', '2021-08-10T06:24:16', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 22, 22);
INSERT INTO public.gw_monitoring VALUES ('2021-07-31T13:11:08.331+05:45', '2021-07-31T13:12:34.804+05:45', '2021-07-31', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.0827807 81.5111925 88.7112428009961 4.551', 28.0827807000000007, 81.511192500000007, 88.7112428009961036, 4.55100000000000016, 'Deep well', 'S.No:  4   -  Well No: DTW-10              - Location: Shantipur', NULL, NULL, NULL, '24', NULL, '1627716443064.jpg', 12, 2, 10, 0.239999999999999991, 9.75999999999999979, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 200581103, 'c42642cd-10b7-49de-971b-6843077a9739', '2021-08-10T06:24:16', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 23, 23);
INSERT INTO public.gw_monitoring VALUES ('2021-07-31T12:57:14.471+05:45', '2021-07-31T12:59:37.095+05:45', '2021-07-31', 'collect:j4PTEWRBElBFPepF', 'Anita singh thakur', 'Bardiya', '28.0852868 81.5164307 82.02176208958439 4.854', 28.0852867999999987, 81.5164307000000008, 82.0217620895843851, 4.85400000000000009, 'Deep well', 'S.No:  1   -  Well No: DTW-9              - Location: Shantipur', NULL, NULL, NULL, '25', NULL, '1627715620226.jpg', 12, 1, 11, 0.25, 10.75, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 200581098, '48cd44f9-b497-4eed-a68b-45c6aecf380d', '2021-08-10T06:24:14', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 24, 24);
INSERT INTO public.gw_monitoring VALUES ('2021-08-08T18:31:37.346+05:45', '2021-08-08T18:33:26.540+05:45', '2021-08-08', '868190042176206', 'yogendra', 'Banke', '28.0512553 81.6024744 92.51546984788273 4.803', 28.0512553000000011, 81.6024744000000055, 92.5154698478827271, 4.80299999999999994, 'Deep well', NULL, NULL, 'S.No: 5 - Well No. EXPT-7   - Location: Parspur', NULL, '27', NULL, '1628426868582.jpg', 5, 2.04999999999999982, 2.95000000000000018, 0.270000000000000018, 2.68000000000000016, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 200171588, '7504d62e-663e-459e-87c2-0c852d994dc8', '2021-08-09T04:46:58', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 25, 25);
INSERT INTO public.gw_monitoring VALUES ('2021-08-08T16:48:26.386+05:45', '2021-08-08T16:50:02.896+05:45', '2021-08-08', '868190042176206', 'yogendra', 'Banke', '28.1873633 81.6301126 104.93348145863133 4.551', 28.1873633000000012, 81.6301126000000039, 104.933481458631334, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  4  -   Well No:  1-045/46(BK)4  Location:  Channawa', '65', NULL, '1628420673355.jpg', 3, 2.10000000000000009, 0.899999999999999911, 0.650000000000000022, 0.25, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 200171584, '49ea607a-9133-47d3-b9a0-085e9a8470d1', '2021-08-09T04:46:57', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 26, 26);
INSERT INTO public.gw_monitoring VALUES ('2021-08-08T15:32:06.629+05:45', '2021-08-08T15:36:10.834+05:45', '2021-08-08', '868190042176206', 'yogendra', 'Banke', '28.1920904 81.5748116 108.15496247199881 4.854', 28.1920904000000014, 81.5748116000000039, 108.154962471998815, 4.85400000000000009, 'Shallow well', NULL, NULL, NULL, 'S.No:  5  -   Well No:  1-045/46(BK)5  Location:  Thapawa', '29', NULL, '1628416182557.jpg', 5, 1.80000000000000004, 3.20000000000000018, 0.28999999999999998, 2.91000000000000014, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 200171572, '5344b24c-7e34-4806-b7f3-5ef69ac2ae2d', '2021-08-09T04:46:55', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 27, 27);
INSERT INTO public.gw_monitoring VALUES ('2021-08-08T14:30:39.771+05:45', '2021-08-08T14:32:06.440+05:45', '2021-08-08', '868190042176206', 'yogendra', 'Banke', '28.2065539 81.6306942 109.95506845582334 4.551', 28.2065538999999994, 81.6306941999999935, 109.955068455823337, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  3  -   Well No:  1-045/46(BK)3  Location:  Banktuwa', '40', NULL, '1628412395695.jpg', 8, 1.10000000000000009, 6.90000000000000036, 0.400000000000000022, 6.5, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 200171560, '2588d295-6c19-4612-8759-1d1551add5c4', '2021-08-09T04:46:53', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 28, 28);
INSERT INTO public.gw_monitoring VALUES ('2021-08-08T13:18:18.750+05:45', '2021-08-08T13:25:36.511+05:45', '2021-08-08', '868190042176206', 'yogendra', 'Banke', '28.1960206 81.7116576 126.3943080324836 4.854', 28.1960206000000007, 81.7116575999999952, 126.394308032483593, 4.85400000000000009, 'Shallow well', NULL, NULL, NULL, 'S.No:  1  -   Well No:  1-045/46(BK)1  Location:  Rohini Khola', '20', NULL, '1628408253004.jpg', 5, 2.85000000000000009, 2.14999999999999991, 0.200000000000000011, 1.94999999999999996, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 200171548, '792d18df-7830-4c79-a1ef-3e3868276e05', '2021-08-09T04:46:51', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 29, 29);
INSERT INTO public.gw_monitoring VALUES ('2021-08-07T15:35:48.538+05:45', '2021-08-07T15:37:57.197+05:45', '2021-08-07', '868190042176206', 'yogendra', 'Banke', '28.1223067 81.5166361 97.53579441475348 4.854', 28.1223066999999993, 81.5166360999999995, 97.5357944147534823, 4.85400000000000009, 'Deep well', NULL, NULL, 'S.No: 3  -  Well No:  SP-9    - Location:  Gaughat', NULL, '42', NULL, '1628329949073.jpg', 15, 2.75, 12.25, 0.419999999999999984, 11.8300000000000001, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 200171543, '118516af-5fd1-4846-9a3b-48cc0cfd82de', '2021-08-09T04:46:50', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 30, 30);
INSERT INTO public.gw_monitoring VALUES ('2021-08-07T15:06:53.312+05:45', '2021-08-07T15:10:59.036+05:45', '2021-08-07', '868190042176206', 'yogendra', 'Banke', '28.1132608 81.5173165 84.92499894578175 4.854', 28.1132607999999991, 81.5173165000000068, 84.924998945781752, 4.85400000000000009, 'Deep well', NULL, NULL, 'S.No: 4  -  Well No:  SP-13    - Location:  Gaughat', NULL, '49', NULL, '1628328326915.jpg', 10, 2.93000000000000016, 7.07000000000000028, 0.489999999999999991, 6.58000000000000007, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 200171540, '3e505ee8-3018-4f7e-b6ce-8d65a14a9bdb', '2021-08-09T04:46:48', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 31, 31);
INSERT INTO public.gw_monitoring VALUES ('2021-08-07T14:43:39.949+05:45', '2021-08-07T14:46:15.982+05:45', '2021-08-07', '868190042176206', 'yogendra', 'Banke', '28.1114538 81.5216498 81.78706569051101 4.803', 28.1114537999999996, 81.5216498000000058, 81.7870656905110138, 4.80299999999999994, 'Shallow well', NULL, NULL, NULL, 'S.No:  14  -  Well No:  1-045/46(BK)19  Location:  Gaughat', '23', NULL, '1628326843340.jpg', 6, 1.30000000000000004, 4.70000000000000018, 0.23000000000000001, 4.46999999999999975, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 200171535, '0912453d-bd65-4732-aa65-d026ffbc1df2', '2021-08-09T04:46:47', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 32, 32);
INSERT INTO public.gw_monitoring VALUES ('2021-08-07T14:14:31.564+05:45', '2021-08-07T14:19:00.314+05:45', '2021-08-07', '868190042176206', 'yogendra', 'Banke', '28.0960082 81.5211301 87.06208297150977 4.854', 28.0960082, 81.5211300999999935, 87.062082971509767, 4.85400000000000009, 'Deep well', NULL, NULL, 'S.No: 2  -  Well No:  SP-6    - Location:  L Gaon', NULL, '25', NULL, '1628325181270.jpg', 15, 3.14999999999999991, 11.8499999999999996, 0.25, 11.5999999999999996, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 200171527, 'd98394a1-f02a-4cad-b753-fec13d877dda', '2021-08-09T04:46:45', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 33, 33);
INSERT INTO public.gw_monitoring VALUES ('2021-08-07T12:55:50.405+05:45', '2021-08-07T13:01:07.994+05:45', '2021-08-07', '868190042176206', 'yogendra', 'Banke', '28.0818831 81.5466715 78.7136367903982 4.854', 28.0818830999999989, 81.5466715000000022, 78.7136367903981977, 4.85400000000000009, 'Deep well', NULL, NULL, 'S.No: 1  -  Well No:  SP-1    - Location:  K Gaon', NULL, '37', NULL, '1628320446539.jpg', 13, 1.57000000000000006, 11.4299999999999997, 0.369999999999999996, 11.0600000000000005, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 200171520, '84bd973e-4afc-4465-b6b9-daf5c8b9d54c', '2021-08-09T04:46:44', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 34, 34);
INSERT INTO public.gw_monitoring VALUES ('2021-08-01T14:36:43.734+05:45', '2021-08-01T14:40:10.671+05:45', '2021-08-01', '868190042176206', 'yogendra', 'Banke', '27.9833301 81.7132518 88.99722165254063 4.854', 27.9833300999999999, 81.7132517999999948, 88.997221652540631, 4.85400000000000009, 'Shallow well', NULL, NULL, NULL, 'S.No:  10  -  Well No:  1-045/46(BK)10  Location:  Kharaicha', '70', NULL, '1627808003181.jpg', 5, 2.20000000000000018, 2.79999999999999982, 0.699999999999999956, 2.10000000000000009, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 200171513, 'e09153b2-2425-4493-b6d3-d8031a7c67ab', '2021-08-09T04:46:42', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 35, 35);
INSERT INTO public.gw_monitoring VALUES ('2021-08-01T13:02:28.731+05:45', '2021-08-01T13:14:52.748+05:45', '2021-08-01', '868190042176206', 'yogendra', 'Banke', '28.0285244 81.6947762 89.73743745717223 4.551', 28.0285243999999985, 81.6947762000000068, 89.7374374571722342, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  22 -  Well No: n/a   Location:  Harbaldoli', '55', NULL, '1627802327211.jpg', 6, 1.39999999999999991, 4.59999999999999964, 0.550000000000000044, 4.04999999999999982, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 200171507, '5a5b584b-6571-4841-83d6-82f01deeba95', '2021-08-09T04:46:40', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 36, 36);
INSERT INTO public.gw_monitoring VALUES ('2021-08-01T12:18:07.083+05:45', '2021-08-01T12:21:03.635+05:45', '2021-08-01', '868190042176206', 'yogendra', 'Banke', '28.0493632 81.6616934 99.45600637836037 4.551', 28.0493631999999984, 81.6616934000000043, 99.4560063783603709, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  8  -   Well No:  1-045/46(BK)8  Location:  Birta', '36', NULL, '1627799657858.jpg', 6, 1.55000000000000004, 4.45000000000000018, 0.359999999999999987, 4.08999999999999986, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 200171499, '4ee1b884-e1e4-4570-8456-6be76cd9f6e4', '2021-08-09T04:46:38', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 37, 37);
INSERT INTO public.gw_monitoring VALUES ('2021-07-30T15:38:15.313+05:45', '2021-07-30T15:40:32.378+05:45', '2021-07-30', '868190042176206', 'yogendra', 'Banke', '28.146513 81.5519981 91.42542889937971 4.551', 28.1465129999999988, 81.5519981000000058, 91.4254288993797104, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  13  -  Well No:  1-045/46(BK)18  Location:  Kalhansgaon', '27', NULL, '1627638906305.jpg', 5, 2.89999999999999991, 2.10000000000000009, 0.270000000000000018, 1.83000000000000007, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 200171488, 'bb25aee4-8e0b-42f0-8616-35ecf0ea8fc1', '2021-08-09T04:46:36', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 38, 38);
INSERT INTO public.gw_monitoring VALUES ('2021-07-30T14:28:16.440+05:45', '2021-07-30T14:31:05.353+05:45', '2021-07-30', '868190042176206', 'yogendra', 'Banke', '28.1287279 81.5893933 94.89367019956954 4.551', 28.1287279000000012, 81.5893932999999976, 94.8936701995695415, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  12 -  Well No:  1-045/46(BK)17  Location:  D-gaon', '15', NULL, '1627634729439.jpg', 3, 2.39999999999999991, 0.600000000000000089, 0.149999999999999994, 0.450000000000000011, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 200171479, 'c22d26d0-a661-4240-97c4-da5b5fc0713e', '2021-08-09T04:46:35', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 39, 39);
INSERT INTO public.gw_monitoring VALUES ('2021-07-30T13:44:09.337+05:45', '2021-07-30T13:47:17.648+05:45', '2021-07-30', '868190042176206', 'yogendra', 'Banke', '28.1060573 81.5971598 98.80189738543883 4.551', 28.1060572999999998, 81.5971598, 98.8018973854388349, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  17  -  Well No:  NISP/INV/STW 8   Location:  Kajurakurda', '35', NULL, '1627632086440.jpg', 2.79999999999999982, 0.5, 2.29999999999999982, 0.349999999999999978, 1.94999999999999996, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 200171472, 'c1752dce-7a89-4765-a580-a1ba3f70f9c7', '2021-08-09T04:46:33', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 40, 40);
INSERT INTO public.gw_monitoring VALUES ('2021-07-30T12:48:54.450+05:45', '2021-07-30T12:50:53.372+05:45', '2021-07-30', '868190042176206', 'yogendra', 'Banke', '28.0830328 81.5956347 104.32663732348149 4.551', 28.0830328000000016, 81.5956347000000051, 104.326637323481492, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  19  -  Well No:  NISP/INV/STW 11  Location:  Ramapurwa', '40', NULL, '1627628719019.jpg', 4.54999999999999982, 0.5, 4.04999999999999982, 0.400000000000000022, 3.64999999999999991, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 200171465, '5a2e0764-dc8d-484e-8f09-2d7df9410b7a', '2021-08-09T04:46:31', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 41, 41);
INSERT INTO public.gw_monitoring VALUES ('2021-07-30T12:24:46.619+05:45', '2021-07-30T12:31:23.101+05:45', '2021-07-30', '868190042176206', 'yogendra', 'Banke', '28.0780775 81.5932978 89.70384837504258 4.551', 28.0780774999999991, 81.593297800000002, 89.7038483750425826, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  18  -  Well No:  NISP/INV/STW 10  Location:  Banjaregaon', '25', NULL, '1627627299915.jpg', 5, 2.7799999999999998, 2.2200000000000002, 0.25, 1.96999999999999997, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 200171460, '39e6238a-1345-477f-9b0e-3f704d6bb30b', '2021-08-09T04:46:30', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 42, 42);
INSERT INTO public.gw_monitoring VALUES ('2021-07-29T15:20:00.099+05:45', '2021-07-29T15:22:01.469+05:45', '2021-07-29', '868190042176206', 'yogendra', 'Banke', '28.0811704 81.6450556 88.65300726440996 4.854', 28.0811704000000013, 81.6450556000000063, 88.6530072644099647, 4.85400000000000009, 'Shallow well', NULL, NULL, NULL, 'S.No:  16  -  Well No:  NISP/STW 1       Location:  Office compound', '54', NULL, '1627551376616.jpg', 5, 3, 2, 0.540000000000000036, 1.45999999999999996, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 200171446, 'bf4fcc47-30d9-4ae6-acf6-474ce3760264', '2021-08-09T04:46:27', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 43, 43);
INSERT INTO public.gw_monitoring VALUES ('2021-07-29T14:59:20.064+05:45', '2021-07-29T15:01:24.028+05:45', '2021-07-29', '868190042176206', 'yogendra', 'Banke', '28.0928925 81.6478425 102.43208886697725 4.803', 28.0928925000000014, 81.6478424999999959, 102.432088866977253, 4.80299999999999994, 'Shallow well', NULL, NULL, NULL, 'S.No:  7  -   Well No:  1-045/46(BK)7  Location:  Bhujai', '15', NULL, '1627550129538.jpg', 2.35000000000000009, 0.5, 1.85000000000000009, 0.149999999999999994, 1.69999999999999996, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 200171434, 'c89b4f77-cc16-4d57-b877-3cce43244a28', '2021-08-09T04:46:25', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 44, 44);
INSERT INTO public.gw_monitoring VALUES ('2021-07-29T14:19:23.616+05:45', '2021-07-29T14:20:59.587+05:45', '2021-07-29', '868190042176206', 'yogendra', 'Banke', '28.1318064 81.658843 99.7581389738014 4.551', 28.1318063999999985, 81.6588430000000045, 99.7581389738013939, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  6  -   Well No:  1-045/46(BK)6  Location:  Piprahwa', '45', NULL, '1627547720179.jpg', 3, 2.37000000000000011, 0.629999999999999893, 0.450000000000000011, 0.179999999999999993, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 200171425, 'a0613626-740e-4f11-8e5b-a848142cc6e9', '2021-08-09T04:46:24', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 45, 45);
INSERT INTO public.gw_monitoring VALUES ('2021-07-28T15:47:46.466+05:45', '2021-07-28T15:52:45.410+05:45', '2021-07-28', '868190042176206', 'yogendra', 'Banke', '28.0150992 81.6543027 88.4639138786619 4.551', 28.0150992000000016, 81.6543027000000023, 88.4639138786618986, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  9  -   Well No:  1-045/46(BK)9  Location:  Sikhanpurwa', '60', NULL, '1627466742296.jpg', 5, 2.5, 2.5, 0.599999999999999978, 1.89999999999999991, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 200171418, '6ff574cc-1e43-4c79-a0e7-dbdbaac55f14', '2021-08-09T04:46:22', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 46, 46);
INSERT INTO public.gw_monitoring VALUES ('2021-07-28T15:06:51.867+05:45', '2021-07-28T15:12:18.650+05:45', '2021-07-28', '868190042176206', 'yogendra', 'Banke', '28.0020222 81.6523501 97.78657990575097 4.854', 28.002022199999999, 81.6523501000000067, 97.786579905750969, 4.85400000000000009, 'Shallow well', NULL, NULL, NULL, 'S.No:  21 -  Well No:  n/a  Location:  Baldipurwa', '40', NULL, '1627464186363.jpg', 6, 1.60000000000000009, 4.40000000000000036, 0.400000000000000022, 4, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 200171409, '4bb97974-074c-41cf-88ab-2751de600384', '2021-08-09T04:46:20', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 47, 47);
INSERT INTO public.gw_monitoring VALUES ('2021-07-28T14:08:49.685+05:45', '2021-07-28T14:10:39.927+05:45', '2021-07-28', '868190042176206', 'yogendra', 'Banke', '28.0242569 81.6002579 94.10043283194646 4.551', 28.024256900000001, 81.6002579000000026, 94.1004328319464634, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  11  -  Well No:  1-045/46(BK)11  Location:  Jaishpur', '50', NULL, '1627460709158.jpg', 5, 2.14999999999999991, 2.85000000000000009, 0.5, 2.35000000000000009, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 200171401, '4a77e0dd-3ecd-4ce0-b247-3ca52f85ce86', '2021-08-09T04:46:18', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 48, 48);
INSERT INTO public.gw_monitoring VALUES ('2021-07-28T13:16:52.178+05:45', '2021-07-28T13:19:06.649+05:45', '2021-07-28', '868190042176206', 'yogendra', 'Banke', '28.0507396 81.5861596 101.01187512783498 4.854', 28.0507396, 81.586159600000002, 101.011875127834983, 4.85400000000000009, 'Shallow well', NULL, NULL, NULL, 'S.No:  20  -  Well No:  n/a  Location:  Jaogagaun', '55', NULL, '1627457608807.jpg', 6, 2.25, 3.75, 0.550000000000000044, 3.20000000000000018, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 200171390, '4b5dda63-fae2-4db1-8522-31a5ae9dfea2', '2021-08-09T04:46:15', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 49, 49);
INSERT INTO public.gw_monitoring VALUES ('2021-06-09T13:58:40.632+05:45', '2021-07-12T14:51:19.593+05:45', '2021-06-09', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.3062454 81.3597585 93.08310155628344 4.854', 28.3062454000000017, 81.3597584999999981, 93.0831015562834381, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  10   -  Well No: 10-045\46(B\D)10  - Location: Padnaha', NULL, NULL, '60', NULL, '1623226557294.jpg', 5, 1.5, 3.5, 0.599999999999999978, 2.89999999999999991, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 192692988, 'ed4b7dbc-dde2-43e9-8caa-d5f94672182a', '2021-07-12T09:06:26', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 50, 50);
INSERT INTO public.gw_monitoring VALUES ('2021-07-12T12:26:15.763+05:45', '2021-07-12T12:42:59.081+05:45', '2021-07-12', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.0730452 81.5543577 97.94119223795981 4.854', 28.0730451999999993, 81.5543576999999971, 97.941192237959811, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  16   -  Well No: 16-045\46(B\D)16  - Location: Newlpur', NULL, NULL, '60', NULL, '1626072169376.jpg', 5, 1, 4, 0.599999999999999978, 3.39999999999999991, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 192692516, '0c558702-1bf7-4dc4-a12b-667c6c615a12', '2021-07-12T09:04:16', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 51, 51);
INSERT INTO public.gw_monitoring VALUES ('2021-07-11T15:26:44.188+05:45', '2021-07-11T15:41:17.243+05:45', '2021-07-11', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.0726545 81.555737 92.11743347701531 4.803', 28.0726544999999987, 81.5557369999999935, 92.1174334770153109, 4.80299999999999994, 'Shallow well', NULL, 'S.No:  14   -  Well No: 14-045\46(B\D)14  - Location: Begnaha', NULL, NULL, '10', NULL, '1625997334934.jpg', 3, 1.19999999999999996, 1.80000000000000004, 0.100000000000000006, 1.69999999999999996, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 192692510, '64e877ab-7664-4607-8c72-9fdf93ca5a42', '2021-07-12T09:04:14', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 52, 52);
INSERT INTO public.gw_monitoring VALUES ('2021-07-11T14:37:19.566+05:45', '2021-07-11T14:46:58.317+05:45', '2021-07-11', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.0732531 81.5542073 90.63927340848102 4.854', 28.0732530999999987, 81.5542073000000016, 90.6392734084810172, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  15   -  Well No: 15-045\46(B\D)15  - Location: Bhurigaon', NULL, NULL, '55', NULL, '1625994090700.jpg', 3, 1, 2, 0.550000000000000044, 1.44999999999999996, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 192692503, '71f32934-6514-4aed-93f1-b9fb45ebddc4', '2021-07-12T09:04:11', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 53, 53);
INSERT INTO public.gw_monitoring VALUES ('2021-07-10T14:53:19.939+05:45', '2021-07-10T14:54:20.887+05:45', '2021-07-10', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.1973809 81.4788891 97.80697117590267 4.551', 28.1973808999999989, 81.4788891000000035, 97.8069711759026745, 4.55100000000000016, 'Shallow well', NULL, 'S.No:  11   -  Well No: 11-045\46(B\D)11  - Location: Baniyabhar', NULL, NULL, '75', NULL, '1625908140328.jpg', 5, 1.60000000000000009, 3.39999999999999991, 0.75, 2.64999999999999991, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 192692494, 'f93cfaaa-5aaa-451a-9d83-9934f0df69b1', '2021-07-12T09:04:09', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 54, 54);
INSERT INTO public.gw_monitoring VALUES ('2021-07-10T14:48:24.943+05:45', '2021-07-10T14:49:42.938+05:45', '2021-07-10', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.2165732 81.4892173 112.27314095395266 4.803', 28.2165731999999991, 81.4892173000000071, 112.273140953952662, 4.80299999999999994, 'Shallow well', NULL, 'S.No:  10   -  Well No: 10-045\46(B\D)10  - Location: Padnaha', NULL, NULL, '60', NULL, '1625907866319.jpg', 5, 1.80000000000000004, 3.20000000000000018, 0.599999999999999978, 2.60000000000000009, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 192692481, '31c38762-69fe-4a96-9aaa-3f33dd4a6a11', '2021-07-12T09:04:06', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 55, 55);
INSERT INTO public.gw_monitoring VALUES ('2021-07-10T14:09:58.283+05:45', '2021-07-10T14:11:51.614+05:45', '2021-07-10', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.2462445 81.5133919 118.4567225956 4.551', 28.2462444999999995, 81.513391900000002, 118.456722595599999, 4.55100000000000016, 'Shallow well', NULL, 'S.No:  7    -  Well No: 7-045\46(B\D)7  - Location: Megara Gadhi', NULL, NULL, '45', NULL, '1625905591202.jpg', 7, 2, 5, 0.450000000000000011, 4.54999999999999982, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 192692473, '18c1f63a-dafe-47ec-b044-7f3abb42732a', '2021-07-12T09:04:04', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 56, 56);
INSERT INTO public.gw_monitoring VALUES ('2021-07-10T13:51:38.897+05:45', '2021-07-10T13:53:34.322+05:45', '2021-07-10', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.3008148 81.4351818 127.38841524473544 4.803', 28.3008148000000013, 81.4351817999999952, 127.388415244735441, 4.80299999999999994, 'Shallow well', NULL, 'S.No:  8    -  Well No: 8-045\46(B\D)8  - Location: Auri', NULL, NULL, '40', NULL, '1625904496421.jpg', 5, 2, 3, 0.400000000000000022, 2.60000000000000009, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 192692461, 'a2020ccb-6b2a-4378-91c4-52df5c6c91e2', '2021-07-12T09:04:01', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 57, 57);
INSERT INTO public.gw_monitoring VALUES ('2021-07-10T13:45:11.604+05:45', '2021-07-10T13:46:47.026+05:45', '2021-07-10', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.2897982 81.442027 108.34453365727408 4.854', 28.2897981999999999, 81.442026999999996, 108.344533657274084, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  4    -  Well No: 4-045\46(B\D)4  - Location: Bangai', NULL, NULL, '32', NULL, '1625904090400.jpg', 5, 1.60000000000000009, 3.39999999999999991, 0.320000000000000007, 3.08000000000000007, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 192692447, '1fed5435-6771-41fb-8e31-bed43094a0e0', '2021-07-12T09:03:58', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 58, 58);
INSERT INTO public.gw_monitoring VALUES ('2021-07-10T13:14:04.641+05:45', '2021-07-10T13:15:11.599+05:45', '2021-07-10', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.2433795 81.5760717 123.96791085269248 4.854', 28.2433794999999996, 81.5760717, 123.967910852692484, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  22   -  Well No: n.a.                            - Location: Belwa', NULL, NULL, '10', NULL, '1625902192604.jpg', 4, 1.69999999999999996, 2.29999999999999982, 0.100000000000000006, 2.20000000000000018, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 192692434, '1e619668-156e-49c3-a6ea-b9345e62c422', '2021-07-12T09:03:56', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 59, 59);
INSERT INTO public.gw_monitoring VALUES ('2021-07-10T13:06:58.539+05:45', '2021-07-10T13:08:37.376+05:45', '2021-07-10', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.2282736 81.5671628 108.88721752823841 4.551', 28.2282736000000014, 81.5671628000000055, 108.887217528238409, 4.55100000000000016, 'Shallow well', NULL, 'S.No:  21   -  Well No: na.a                            - Location: Belwa', NULL, NULL, '40', NULL, '1625901807842.jpg', 4, 1.80000000000000004, 2.20000000000000018, 0.400000000000000022, 1.80000000000000004, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 192692416, '99378f14-91ee-4823-a04a-e6c3dceb08de', '2021-07-12T09:03:53', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 60, 60);
INSERT INTO public.gw_monitoring VALUES ('2021-07-10T12:57:01.882+05:45', '2021-07-10T12:58:05.094+05:45', '2021-07-10', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.2364799 81.5477235 100.40017757010291 4.551', 28.2364798999999991, 81.5477235000000036, 100.400177570102912, 4.55100000000000016, 'Shallow well', NULL, 'S.No:  2    -  Well No: 2-045\46(B\D)2  - Location: Bakharikurd', NULL, NULL, '0', NULL, '1625901173313.jpg', 3, 1, 2, 0, 2, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 192692408, '6fdc74aa-f47c-4fd5-b8af-2207853ddd41', '2021-07-12T09:03:51', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 61, 61);
INSERT INTO public.gw_monitoring VALUES ('2021-07-08T14:56:58.340+05:45', '2021-07-08T14:59:36.603+05:45', '2021-07-08', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.2168546 81.3130813 98.63917636431935 4.854', 28.2168546000000013, 81.3130812999999932, 98.6391763643193542, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  13   -  Well No: 13-045\46(B\D)13  - Location: Madhubhan', NULL, NULL, '10', NULL, '1625735659703.jpg', 6, 1.69999999999999996, 4.29999999999999982, 0.100000000000000006, 4.20000000000000018, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 192692396, '7458fec1-f959-49d6-b19f-52d5cd1a6d92', '2021-07-12T09:03:50', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 62, 62);
INSERT INTO public.gw_monitoring VALUES ('2021-07-08T14:27:15.016+05:45', '2021-07-08T14:28:12.705+05:45', '2021-07-08', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.2462792 81.3065368 84.15604330109332 4.854', 28.2462792, 81.3065368000000035, 84.1560433010933195, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  12   -  Well No: 12-045\46(B\D)12  - Location: Taratal', NULL, NULL, '40', NULL, '1625733761419.jpg', 14, 1.69999999999999996, 12.3000000000000007, 0.400000000000000022, 11.9000000000000004, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 192692392, '05b986c2-5d5d-4497-8002-a38207a84322', '2021-07-12T09:03:48', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 63, 63);
INSERT INTO public.gw_monitoring VALUES ('2021-07-08T14:10:32.087+05:45', '2021-07-08T14:14:16.197+05:45', '2021-07-08', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.2462785 81.3065593 83.77972589092016 4.551', 28.246278499999999, 81.3065593000000035, 83.7797258909201616, 4.55100000000000016, 'Shallow well', NULL, 'S.No:  9    -  Well No: 9-045\46(B\D)9  - Location: Khairapur', NULL, NULL, '50', NULL, '1625732940092.jpg', 6, 1.80000000000000004, 4.20000000000000018, 0.5, 3.70000000000000018, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 192692384, '41e17279-5c8f-4ea3-afed-ae71bbb1ccad', '2021-07-12T09:03:46', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 64, 64);
INSERT INTO public.gw_monitoring VALUES ('2021-07-08T13:42:36.883+05:45', '2021-07-08T13:43:47.093+05:45', '2021-07-08', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.1691568 81.3378623 82.37976249806361 4.854', 28.1691567999999997, 81.3378622999999976, 82.379762498063613, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  6    -  Well No: 6-045\46(B\D)6  - Location: Rain Nagar', NULL, NULL, '40', NULL, '1625731108840.jpg', 8, 1.80000000000000004, 6.20000000000000018, 0.400000000000000022, 5.79999999999999982, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 192692376, '219e81b8-f145-48a6-ad20-200674d37e9b', '2021-07-12T09:03:44', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 65, 65);
INSERT INTO public.gw_monitoring VALUES ('2021-07-08T13:20:59.163+05:45', '2021-07-08T13:21:48.151+05:45', '2021-07-08', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.189708 81.3836147 79.90999113590765 4.803', 28.1897079999999995, 81.3836146999999954, 79.9099911359076458, 4.80299999999999994, 'Shallow well', NULL, 'S.No:  5    -  Well No: 5-045\46(B\D)5  - Location: Bhaisahi', NULL, NULL, '30', NULL, '1625729792668.jpg', 7, 1.60000000000000009, 5.40000000000000036, 0.299999999999999989, 5.09999999999999964, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 192692371, 'bbd5e656-01ba-4216-9f1f-ac3a659edd24', '2021-07-12T09:03:43', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 66, 66);
INSERT INTO public.gw_monitoring VALUES ('2021-07-08T13:00:17.511+05:45', '2021-07-08T13:01:34.285+05:45', '2021-07-08', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.1880089 81.4798633 90.77675645417352 4.854', 28.1880088999999998, 81.4798633000000052, 90.7767564541735226, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  3    -  Well No: 3-045\46(B\D)3  - Location: Mainapokhar', NULL, NULL, '40', NULL, '1625728578574.jpg', 6, 1.80000000000000004, 4.20000000000000018, 0.400000000000000022, 3.79999999999999982, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 192692365, '8fb7b001-b11a-41ec-8ad0-e70163ba47d9', '2021-07-12T09:03:41', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 67, 67);
INSERT INTO public.gw_monitoring VALUES ('2021-07-08T12:39:02.149+05:45', '2021-07-08T12:43:15.466+05:45', '2021-07-08', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.1658782 81.5010353 93.06979498311131 4.854', 28.1658782000000016, 81.5010352999999981, 93.0697949831113078, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  17   -  Well No: 17-045\46(B\D)17  - Location: Thakurdwaar', NULL, NULL, '0', NULL, '1625727475934.jpg', 7, 1.69999999999999996, 5.29999999999999982, 0, 5.29999999999999982, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 192692358, 'a54d5c83-4414-4b8c-bff3-e29c24cf49e1', '2021-07-12T09:03:39', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 68, 68);
INSERT INTO public.gw_monitoring VALUES ('2021-07-08T12:26:01.283+05:45', '2021-07-08T12:27:28.392+05:45', '2021-07-08', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.1462923 81.4793364 89.85069285994025 4.551', 28.1462922999999989, 81.479336399999994, 89.8506928599402528, 4.55100000000000016, 'Shallow well', NULL, 'S.No:  19   -  Well No: n.a.                             - Location: Bhawanipur', NULL, NULL, '30', NULL, '1625726534350.jpg', 8, 1.80000000000000004, 6.20000000000000018, 0.299999999999999989, 5.90000000000000036, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 192692350, 'ac1c4231-9c76-41ea-9640-f793ac5eb64b', '2021-07-12T09:03:37', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 69, 69);
INSERT INTO public.gw_monitoring VALUES ('2021-07-08T12:14:24.677+05:45', '2021-07-08T12:15:48.149+05:45', '2021-07-08', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.1486814 81.496827 85.64393435665194 4.803', 28.148681400000001, 81.4968269999999961, 85.6439343566519398, 4.80299999999999994, 'Shallow well', NULL, 'S.No:  18   -  Well No: NISP\INV\STW-5    - Location: Shoharawa', NULL, NULL, '40', NULL, '1625725830895.jpg', 7, 1.80000000000000004, 5.20000000000000018, 0.400000000000000022, 4.79999999999999982, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 192692348, '390cab26-287d-4339-a933-044bc71a5b1e', '2021-07-12T09:03:35', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 70, 70);
INSERT INTO public.gw_monitoring VALUES ('2021-07-06T14:06:33.422+05:45', '2021-07-06T14:08:11.413+05:45', '2021-07-06', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.1056001 81.4828041 86.68986379303561 4.854', 28.1056001000000002, 81.4828040999999956, 86.6898637930356131, 4.85400000000000009, 'Deep well', 'S.No:  2   -  Well No: DTW-6            - Location: Tholodafe', NULL, NULL, NULL, '10', NULL, '1625559756129.jpg', 12, 1.69999999999999996, 10.3000000000000007, 0.100000000000000006, 10.1999999999999993, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 192692341, 'f8d94791-9ba1-46b4-a508-6388d1ea1963', '2021-07-12T09:03:33', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 71, 71);
INSERT INTO public.gw_monitoring VALUES ('2021-07-06T13:46:35.350+05:45', '2021-07-06T13:48:28.324+05:45', '2021-07-06', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.0883557 81.5027002 86.34372548320997 4.854', 28.088355700000001, 81.5027002000000067, 86.3437254832099654, 4.85400000000000009, 'Deep well', 'S.No:  3   -  Well No: DTW-3             - Location: Shantipur', NULL, NULL, NULL, '20', NULL, '1625558564389.jpg', 14, 1.89999999999999991, 12.0999999999999996, 0.200000000000000011, 11.9000000000000004, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 192692331, '788524eb-a4ce-4587-b851-6b02d77aff16', '2021-07-12T09:03:31', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 72, 72);
INSERT INTO public.gw_monitoring VALUES ('2021-07-06T13:39:30.005+05:45', '2021-07-06T13:40:30.419+05:45', '2021-07-06', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.0828789 81.5111145 80.8468903454475 4.803', 28.0828789000000008, 81.511114500000005, 80.8468903454475054, 4.80299999999999994, 'Deep well', 'S.No:  4   -  Well No: DTW-10              - Location: Shantipur', NULL, NULL, NULL, '24', NULL, '1625558115140.jpg', 12, 1.80000000000000004, 10.1999999999999993, 0.239999999999999991, 9.96000000000000085, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 192692327, '1c87440f-6afd-41cf-aad4-88c0d932b8d0', '2021-07-12T09:03:29', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 73, 73);
INSERT INTO public.gw_monitoring VALUES ('2021-07-06T13:27:48.672+05:45', '2021-07-06T13:29:50.664+05:45', '2021-07-06', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.0852523 81.5163728 83.6368732261931 4.803', 28.0852523000000005, 81.5163727999999992, 83.6368732261931029, 4.80299999999999994, 'Deep well', 'S.No:  1   -  Well No: DTW-9              - Location: Shantipur', NULL, NULL, NULL, '25', NULL, '1625557467981.jpg', 14, 1.89999999999999991, 12.0999999999999996, 0.25, 11.8499999999999996, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 192692322, 'c507685e-09ec-482f-8ba6-4661e6389f1c', '2021-07-12T09:03:26', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 74, 74);
INSERT INTO public.gw_monitoring VALUES ('2021-06-29T16:50:55.949+05:45', '2021-06-29T17:00:18.333+05:45', '2021-06-29', '868190042176206', 'yogendra', 'Banke', '28.1317725 81.6588471 104.23475521295485 4.854', 28.1317725000000003, 81.6588471000000027, 104.234755212954852, 4.85400000000000009, 'Shallow well', NULL, NULL, NULL, 'S.No:  6  -   Well No:  1-045/46(BK)6  Location:  Piprahwa', '45', NULL, '1624965115128.jpg', 5, 4.28000000000000025, 0.719999999999999751, 0.450000000000000011, 0.270000000000000018, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 189660180, '761e9d96-309e-4537-849f-33ed710fa797', '2021-06-30T09:18:08', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 75, 75);
INSERT INTO public.gw_monitoring VALUES ('2021-06-29T15:42:05.613+05:45', '2021-06-29T15:48:53.063+05:45', '2021-06-29', '868190042176206', 'yogendra', 'Banke', '28.1873244 81.6301051 109.90054282328481 4.854', 28.1873244000000014, 81.6301050999999944, 109.900542823284809, 4.85400000000000009, 'Shallow well', NULL, NULL, NULL, 'S.No:  4  -   Well No:  1-045/46(BK)4  Location:  Channawa', '65', NULL, '1624960696199.jpg', 5, 3.85000000000000009, 1.14999999999999991, 0.650000000000000022, 0.5, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 189660170, '8ffdec0f-69f4-4df8-b43f-66d9bc9b0921', '2021-06-30T09:18:06', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 76, 76);
INSERT INTO public.gw_monitoring VALUES ('2021-06-29T14:35:59.723+05:45', '2021-06-29T14:49:42.264+05:45', '2021-06-29', '868190042176206', 'yogendra', 'Banke', '28.1920662 81.574819 92.80679415892979 4.803', 28.1920661999999993, 81.5748190000000051, 92.8067941589297902, 4.80299999999999994, 'Shallow well', NULL, NULL, NULL, 'S.No:  5  -   Well No:  1-045/46(BK)5  Location:  Thapawa', '29', NULL, '1624956765909.jpg', 5, 1.69999999999999996, 3.29999999999999982, 0.28999999999999998, 3.00999999999999979, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 189660163, '2f50f97a-d874-4bdd-aa6e-a341211a1f99', '2021-06-30T09:18:05', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 77, 77);
INSERT INTO public.gw_monitoring VALUES ('2021-06-29T13:47:10.206+05:45', '2021-06-29T14:13:31.593+05:45', '2021-06-29', '868190042176206', 'yogendra', 'Banke', '28.2065304 81.6307361 102.696006742006 4.803', 28.2065303999999983, 81.6307360999999929, 102.696006742006006, 4.80299999999999994, 'Shallow well', NULL, NULL, NULL, 'S.No:  3  -   Well No:  1-045/46(BK)3  Location:  Banktuwa', '40', NULL, '1624953833397.jpg', 10, 2.70000000000000018, 7.29999999999999982, 0.400000000000000022, 6.90000000000000036, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 189660156, 'f13073d1-a0a2-4dab-b40a-bd566e1474c2', '2021-06-30T09:18:03', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 78, 78);
INSERT INTO public.gw_monitoring VALUES ('2021-06-29T12:43:01.663+05:45', '2021-06-29T12:52:06.116+05:45', '2021-06-29', '868190042176206', 'yogendra', 'Banke', '28.1960406 81.7117094 115.2896097672967 4.854', 28.1960405999999999, 81.7117094000000037, 115.289609767296696, 4.85400000000000009, 'Shallow well', NULL, NULL, NULL, 'S.No:  1  -   Well No:  1-045/46(BK)1  Location:  Rohini Khola', '20', NULL, '1624949998314.jpg', 5, 2.52000000000000002, 2.47999999999999998, 0.200000000000000011, 2.2799999999999998, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 189660147, '6dbd88d3-c8a7-4fde-afc4-8234814092b7', '2021-06-30T09:18:01', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 79, 79);
INSERT INTO public.gw_monitoring VALUES ('2021-06-28T15:14:12.638+05:45', '2021-06-28T15:17:21.642+05:45', '2021-06-28', '868190042176206', 'yogendra', 'Banke', '28.1465206 81.5520268 99.46604775668895 4.551', 28.1465205999999988, 81.552026799999993, 99.4660477566889512, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  13  -  Well No:  1-045/46(BK)18  Location:  Kalhansgaon', '27', NULL, '1624872625248.jpg', 5, 2.20000000000000018, 2.79999999999999982, 0.270000000000000018, 2.5299999999999998, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 189660142, 'b888a97d-8c08-40bd-8adb-a88bbee340f4', '2021-06-30T09:18:00', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 80, 80);
INSERT INTO public.gw_monitoring VALUES ('2021-06-28T14:08:01.581+05:45', '2021-06-28T14:23:45.147+05:45', '2021-06-28', '868190042176206', 'yogendra', 'Banke', '28.1287189 81.589423 85.55599554696063 4.854', 28.1287188999999991, 81.5894229999999965, 85.5559955469606308, 4.85400000000000009, 'Shallow well', NULL, NULL, NULL, 'S.No:  12 -  Well No:  1-045/46(BK)17  Location:  D-gaon', '15', NULL, '1624868973205.jpg', 5, 2.33000000000000007, 2.66999999999999993, 0.149999999999999994, 2.52000000000000002, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 189660131, '04221ad7-68de-4b1e-ae5e-9fa9fb815658', '2021-06-30T09:17:58', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 81, 81);
INSERT INTO public.gw_monitoring VALUES ('2021-06-28T13:34:54.254+05:45', '2021-06-28T13:38:10.391+05:45', '2021-06-28', '868190042176206', 'yogendra', 'Banke', '28.1060674 81.5971464 94.00782713025974 4.854', 28.1060674000000006, 81.5971463999999997, 94.0078271302597415, 4.85400000000000009, 'Shallow well', NULL, NULL, NULL, 'S.No:  17  -  Well No:  NISP/INV/STW 8   Location:  Kajurakurda', '35', NULL, '1624866758955.jpg', 3.70000000000000018, 0.5, 3.20000000000000018, 0.349999999999999978, 2.85000000000000009, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 189660123, 'd9f0ed38-a9e7-4234-9084-ecc3a67bcfba', '2021-06-30T09:17:57', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 82, 82);
INSERT INTO public.gw_monitoring VALUES ('2021-06-28T12:51:55.938+05:45', '2021-06-28T12:59:11.788+05:45', '2021-06-28', '868190042176206', 'yogendra', 'Banke', '28.0830233 81.5956242 95.67942498117567 6.068', 28.0830233000000007, 81.5956242000000032, 95.6794249811756714, 6.06799999999999962, 'Shallow well', NULL, NULL, NULL, 'S.No:  19  -  Well No:  NISP/INV/STW 11  Location:  Ramapurwa', '40', NULL, '1624864405248.jpg', 4.59999999999999964, 0.5, 4.09999999999999964, 0.400000000000000022, 3.70000000000000018, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 189660118, '8095848e-9e34-4ad5-a8cb-f5aeee3b09ca', '2021-06-30T09:17:55', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 83, 83);
INSERT INTO public.gw_monitoring VALUES ('2021-06-28T12:27:40.157+05:45', '2021-06-28T12:29:25.603+05:45', '2021-06-28', '868190042176206', 'yogendra', 'Banke', '28.0780271 81.5932833 91.58089833272122 4.854', 28.0780270999999999, 81.593283299999996, 91.5808983327212189, 4.85400000000000009, 'Shallow well', NULL, NULL, NULL, 'S.No:  18  -  Well No:  NISP/INV/STW 10  Location:  Banjaregaon', '25', NULL, '1624862639604.jpg', 5, 2.43000000000000016, 2.56999999999999984, 0.25, 2.31999999999999984, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 189660113, '3ddbcabb-3793-47d5-8349-dbed7864e025', '2021-06-30T09:17:54', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 84, 84);
INSERT INTO public.gw_monitoring VALUES ('2021-06-27T16:17:29.015+05:45', '2021-06-27T16:27:23.823+05:45', '2021-06-27', '868190042176206', 'yogendra', 'Banke', '28.0818678 81.5466472 85.26613684146946 4.551', 28.0818678000000013, 81.5466471999999953, 85.2661368414694607, 4.55100000000000016, 'Deep well', NULL, NULL, 'S.No: 1  -  Well No:  SP-1    - Location:  K Gaon', NULL, '37', NULL, '1624790450887.jpg', 13, 1.75, 11.25, 0.369999999999999996, 10.8800000000000008, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 189660102, '329c992d-8dc7-42c1-889e-612c56a69299', '2021-06-30T09:17:52', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 85, 85);
INSERT INTO public.gw_monitoring VALUES ('2021-06-27T15:55:59.084+05:45', '2021-06-27T16:00:39.474+05:45', '2021-06-27', '868190042176206', 'yogendra', 'Banke', '28.0960614 81.5211525 92.26744743036947 4.854', 28.0960614, 81.5211524999999995, 92.2674474303694723, 4.85400000000000009, 'Deep well', NULL, NULL, 'S.No: 2  -  Well No:  SP-6    - Location:  L Gaon', NULL, '25', NULL, '1624788883067.jpg', 15, 3.04999999999999982, 11.9499999999999993, 0.25, 11.6999999999999993, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 189660090, 'e21b53c4-7633-4acf-aae5-659505bc3329', '2021-06-30T09:17:51', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 86, 86);
INSERT INTO public.gw_monitoring VALUES ('2021-06-27T15:18:05.671+05:45', '2021-06-27T15:21:41.905+05:45', '2021-06-27', '868190042176206', 'yogendra', 'Banke', '28.1222587 81.5165325 93.85865018509743 4.854', 28.1222586999999997, 81.5165324999999967, 93.8586501850974315, 4.85400000000000009, 'Deep well', NULL, NULL, 'S.No: 3  -  Well No:  SP-9    - Location:  Gaughat', NULL, '42', NULL, '1624786567090.jpg', 15, 2.89999999999999991, 12.0999999999999996, 0.419999999999999984, 11.6799999999999997, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 189660081, '0b048693-770c-4882-b02f-156aba80dcf3', '2021-06-30T09:17:49', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 87, 87);
INSERT INTO public.gw_monitoring VALUES ('2021-06-27T14:36:11.012+05:45', '2021-06-27T14:45:41.229+05:45', '2021-06-27', '868190042176206', 'yogendra', 'Banke', '28.1132491 81.5173495 86.4275587127074 4.551', 28.1132491000000009, 81.5173494999999946, 86.4275587127073948, 4.55100000000000016, 'Deep well', NULL, NULL, 'S.No: 4  -  Well No:  SP-13    - Location:  Gaughat', NULL, '49', NULL, '1624784377592.jpg', 11, 3.20000000000000018, 7.79999999999999982, 0.489999999999999991, 7.30999999999999961, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 189660075, 'bc62f988-137f-4c61-84b0-8e32aff2f1b1', '2021-06-30T09:17:48', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 88, 88);
INSERT INTO public.gw_monitoring VALUES ('2021-06-27T13:37:37.147+05:45', '2021-06-27T13:40:30.294+05:45', '2021-06-27', '868190042176206', 'yogendra', 'Banke', '28.1115143 81.5216446 86.90497318220324 4.551', 28.1115142999999996, 81.5216446000000019, 86.9049731822032356, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  14  -  Well No:  1-045/46(BK)19  Location:  Gaughat', '23', NULL, '1624780426014.jpg', 7, 1.35000000000000009, 5.65000000000000036, 0.23000000000000001, 5.41999999999999993, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 189660062, '8937cebf-d58d-4393-827a-0d0d4698489b', '2021-06-30T09:17:46', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 89, 89);
INSERT INTO public.gw_monitoring VALUES ('2021-06-27T11:56:55.813+05:45', '2021-06-27T12:01:56.775+05:45', '2021-06-27', '868190042176206', 'yogendra', 'Banke', '28.05074 81.5861809 90.63869055339899 4.551', 28.0507400000000011, 81.5861809000000022, 90.6386905533989875, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  20  -  Well No:  n/a  Location:  Jaogagaun', '55', NULL, '1624774582121.jpg', 8, 1.19999999999999996, 6.79999999999999982, 0.550000000000000044, 6.25, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 189660049, 'f5894c33-27de-4898-a8e2-f957f014ca57', '2021-06-30T09:17:45', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 90, 90);
INSERT INTO public.gw_monitoring VALUES ('2021-06-27T11:20:27.804+05:45', '2021-06-27T11:23:28.286+05:45', '2021-06-27', '868190042176206', 'yogendra', 'Banke', '28.0512338 81.6024418 103.20814738517352 4.854', 28.0512337999999986, 81.602441799999994, 103.208147385173518, 4.85400000000000009, 'Deep well', NULL, NULL, 'S.No: 5 - Well No. EXPT-7   - Location: Parspur', NULL, '27', NULL, '1624772265743.jpg', 6, 2.29999999999999982, 3.70000000000000018, 0.270000000000000018, 3.43000000000000016, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 189660038, '7765eba8-27ee-48c2-a591-24450c2e08b1', '2021-06-30T09:17:43', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 91, 91);
INSERT INTO public.gw_monitoring VALUES ('2021-06-25T13:58:58.347+05:45', '2021-06-25T14:01:49.539+05:45', '2021-06-25', '868190042176206', 'yogendra', 'Banke', '27.9833291 81.7133238 81.77689259407666 4.551', 27.9833290999999988, 81.7133237999999977, 81.7768925940766565, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  10  -  Well No:  1-045/46(BK)10  Location:  Kharaicha', '70', NULL, '1624608940989.jpg', 5, 2.31000000000000005, 2.68999999999999995, 0.699999999999999956, 1.98999999999999999, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 189660031, 'ca7d4159-672c-475a-8f3e-9d7ac51f36d6', '2021-06-30T09:17:42', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 92, 92);
INSERT INTO public.gw_monitoring VALUES ('2021-06-25T12:56:53.560+05:45', '2021-06-25T12:59:28.139+05:45', '2021-06-25', '868190042176206', 'yogendra', 'Banke', '28.0285301 81.6946952 84.90758921997094 4.551', 28.0285301000000011, 81.6946951999999982, 84.9075892199709443, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  22 -  Well No: n/a   Location:  Harbaldoli', '55', NULL, '1624605217075.jpg', 6, 1.19999999999999996, 4.79999999999999982, 0.550000000000000044, 4.25, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 189660019, '853a2751-2167-4b64-be93-f9971569ab07', '2021-06-30T09:17:39', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 93, 93);
INSERT INTO public.gw_monitoring VALUES ('2021-06-25T11:46:35.887+05:45', '2021-06-25T11:49:27.627+05:45', '2021-06-25', '868190042176206', 'yogendra', 'Banke', '28.0493766 81.6616486 81.25724309130749 4.854', 28.0493765999999987, 81.6616486000000066, 81.2572430913074868, 4.85400000000000009, 'Shallow well', NULL, NULL, NULL, 'S.No:  8  -   Well No:  1-045/46(BK)8  Location:  Birta', '36', NULL, '1624601034300.jpg', 7, 1.69999999999999996, 5.29999999999999982, 0.359999999999999987, 4.94000000000000039, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 189660009, 'cc272ae2-175d-49f5-baf0-b888c7ef8944', '2021-06-30T09:17:38', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 94, 94);
INSERT INTO public.gw_monitoring VALUES ('2021-06-23T14:36:07.821+05:45', '2021-06-23T14:39:54.928+05:45', '2021-06-23', '868190042176206', 'yogendra', 'Banke', '28.0812159 81.6450163 97.02639652859702 4.551', 28.0812159000000001, 81.6450162999999947, 97.0263965285970187, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  16  -  Well No:  NISP/STW 1       Location:  Office compound', '54', NULL, '1624438463315.jpg', 5, 2.70000000000000018, 2.29999999999999982, 0.540000000000000036, 1.76000000000000001, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 189659999, 'ad99a07e-3a14-4e50-93f6-8dd51c48d01a', '2021-06-30T09:17:36', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 95, 95);
INSERT INTO public.gw_monitoring VALUES ('2021-06-23T13:59:34.927+05:45', '2021-06-23T14:04:55.050+05:45', '2021-06-23', '868190042176206', 'yogendra', 'Banke', '28.0928993 81.6478289 102.18535161537388 4.803', 28.0928992999999991, 81.6478288999999933, 102.185351615373875, 4.80299999999999994, 'Shallow well', NULL, NULL, NULL, 'S.No:  7  -   Well No:  1-045/46(BK)7  Location:  Bhujai', '15', NULL, '1624436351262.jpg', 2.95000000000000018, 0.5, 2.45000000000000018, 0.149999999999999994, 2.29999999999999982, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 189659985, '015eeea1-35fe-4c10-b414-f7e9c86c2431', '2021-06-30T09:17:34', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 96, 96);
INSERT INTO public.gw_monitoring VALUES ('2021-06-22T15:23:51.234+05:45', '2021-06-22T15:25:59.337+05:45', '2021-06-22', '868190042176206', 'yogendra', 'Banke', '28.0019837 81.6524184 83.12032862387017 4.803', 28.0019837000000003, 81.652418400000002, 83.1203286238701651, 4.80299999999999994, 'Shallow well', NULL, NULL, NULL, 'S.No:  21 -  Well No:  n/a  Location:  Baldipurwa', '40', NULL, '1624354816388.jpg', 6, 1.39999999999999991, 4.59999999999999964, 0.400000000000000022, 4.20000000000000018, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 189659974, '9d70f790-c33d-4c5c-b1f4-112cf7833c61', '2021-06-30T09:17:33', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 97, 97);
INSERT INTO public.gw_monitoring VALUES ('2021-06-22T14:30:49.081+05:45', '2021-06-22T14:33:06.612+05:45', '2021-06-22', '868190042176206', 'yogendra', 'Banke', '28.0151419 81.6543268 73.21900264738026 4.984', 28.0151418999999997, 81.6543268000000069, 73.2190026473802646, 4.98399999999999999, 'Shallow well', NULL, NULL, NULL, 'S.No:  9  -   Well No:  1-045/46(BK)9  Location:  Sikhanpurwa', '60', NULL, '1624351649246.jpg', 5, 2.2200000000000002, 2.7799999999999998, 0.599999999999999978, 2.18000000000000016, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 189659969, '699ed4ed-74c5-4e8a-8c92-b34c7b13f140', '2021-06-30T09:17:31', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 98, 98);
INSERT INTO public.gw_monitoring VALUES ('2021-06-22T12:16:09.514+05:45', '2021-06-22T12:19:31.637+05:45', '2021-06-22', '868190042176206', 'yogendra', 'Banke', '28.0242235 81.6002958 97.83926275502972 4.551', 28.0242235000000015, 81.6002957999999978, 97.839262755029722, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  11  -  Well No:  1-045/46(BK)11  Location:  Jaishpur', '50', NULL, '1624343595132.jpg', 7, 1.19999999999999996, 5.79999999999999982, 0.5, 5.29999999999999982, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 189659957, 'cc7be037-61e5-41af-9332-a27e8112d1e7', '2021-06-30T09:17:29', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 99, 99);
INSERT INTO public.gw_monitoring VALUES ('2021-06-11T16:47:12.100+05:45', '2021-06-11T16:48:05.118+05:45', '2021-06-11', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.0731317 81.5541922 88.77808298150909 4.803', 28.0731317000000011, 81.5541922000000028, 88.7780829815090868, 4.80299999999999994, 'Shallow well', NULL, 'S.No:  16   -  Well No: 16-045\46(B\D)16  - Location: Newlpur', NULL, NULL, '60', NULL, '1623409371765.jpg', 6, 1.5, 4.5, 0.599999999999999978, 3.89999999999999991, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 184597287, 'f39fcce2-eb49-419d-b865-0cec7d957e19', '2021-06-12T08:14:53', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 100, 100);
INSERT INTO public.gw_monitoring VALUES ('2021-06-11T16:16:52.001+05:45', '2021-06-11T16:20:40.280+05:45', '2021-06-11', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.0731963 81.5542336 82.99851946835179 4.551', 28.0731962999999993, 81.5542336000000034, 82.9985194683517875, 4.55100000000000016, 'Shallow well', NULL, 'S.No:  15   -  Well No: 15-045\46(B\D)15  - Location: Bhurigaon', NULL, NULL, '55', NULL, '1623407655694.jpg', 4, 1.39999999999999991, 2.60000000000000009, 0.550000000000000044, 2.04999999999999982, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 184597284, '71e9c524-92fd-4ac1-8bca-90c1aca02491', '2021-06-12T08:14:52', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 101, 101);
INSERT INTO public.gw_monitoring VALUES ('2021-06-11T15:30:43.150+05:45', '2021-06-11T15:36:15.920+05:45', '2021-06-11', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.0731609 81.55413 78.93413194970529 4.854', 28.0731609000000013, 81.5541300000000007, 78.9341319497052893, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  14   -  Well No: 14-045\46(B\D)14  - Location: Begnaha', NULL, NULL, '10', NULL, '1623405048407.jpg', 4, 1.5, 2.5, 0.100000000000000006, 2.39999999999999991, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 184597281, '3d044017-0187-410d-a0eb-8957e499dbc8', '2021-06-12T08:14:50', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 102, 102);
INSERT INTO public.gw_monitoring VALUES ('2021-06-09T14:02:12.612+05:45', '2021-06-09T14:03:28.676+05:45', '2021-06-09', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.306207 81.3597747 97.58736990423863 4.854', 28.3062070000000006, 81.3597747000000027, 97.5873699042386278, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  11   -  Well No: 11-045\46(B\D)11  - Location: Baniyabhar', NULL, NULL, '75', NULL, '1623226698088.jpg', 6, 2, 4, 0.75, 3.25, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 184597277, '0d8f35ec-8c3b-4d11-ac1c-6712d5c35460', '2021-06-12T08:14:48', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 103, 103);
INSERT INTO public.gw_monitoring VALUES ('2021-06-09T13:57:43.942+05:45', '2021-06-09T13:58:36.520+05:45', '2021-06-09', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.3062446 81.3597735 102.69642601630953 4.551', 28.3062445999999994, 81.3597735000000029, 102.69642601630953, 4.55100000000000016, 'Shallow well', NULL, 'S.No:  7    -  Well No: 7-045\46(B\D)7  - Location: Megara Gadhi', NULL, NULL, '45', NULL, '1623226401751.jpg', 7, 1, 6, 0.450000000000000011, 5.54999999999999982, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 184597273, '0fbee7f3-655f-4cc7-baac-4f71c0f8b573', '2021-06-12T08:14:47', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 104, 104);
INSERT INTO public.gw_monitoring VALUES ('2021-06-09T13:24:38.281+05:45', '2021-06-09T13:26:50.642+05:45', '2021-06-09', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.3512265 81.4297433 134.99947791481347 4.854', 28.3512264999999992, 81.4297432999999984, 134.999477914813468, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  8    -  Well No: 8-045\46(B\D)8  - Location: Auri', NULL, NULL, '40', NULL, '1623224429070.jpg', 6, 1, 5, 0.400000000000000022, 4.59999999999999964, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 184597264, '2cd1b617-2037-4eb5-8fd0-1c3bdfe45b24', '2021-06-12T08:14:45', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 105, 105);
INSERT INTO public.gw_monitoring VALUES ('2021-06-09T13:07:18.256+05:45', '2021-06-09T13:08:48.760+05:45', '2021-06-09', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.2897996 81.4420531 106.68836321354627 4.854', 28.2897995999999985, 81.4420530999999954, 106.688363213546268, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  4    -  Well No: 4-045\46(B\D)4  - Location: Bangai', NULL, NULL, '32', NULL, '1623223399375.jpg', 5, 1.19999999999999996, 3.79999999999999982, 0.320000000000000007, 3.47999999999999998, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 184597262, 'e0856377-1750-4b50-81bd-adf17e7cd544', '2021-06-12T08:14:43', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 106, 106);
INSERT INTO public.gw_monitoring VALUES ('2021-06-09T12:36:00.520+05:45', '2021-06-09T12:37:46.238+05:45', '2021-06-09', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.2283599 81.5671117 92.64919927846016 4.854', 28.2283599000000009, 81.5671116999999981, 92.6491992784601592, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  22   -  Well No: n.a.                            - Location: Belwa', NULL, NULL, '10', NULL, '1623221536791.jpg', 8, 2.79999999999999982, 5.20000000000000018, 0.100000000000000006, 5.09999999999999964, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 184597259, '805b4297-9d03-4ba6-8ea7-34db66e76869', '2021-06-12T08:14:42', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 107, 107);
INSERT INTO public.gw_monitoring VALUES ('2021-06-09T12:24:36.043+05:45', '2021-06-09T12:26:05.302+05:45', '2021-06-09', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.2490923 81.5849372 107.94908762650178 4.803', 28.2490923000000009, 81.5849371999999988, 107.949087626501779, 4.80299999999999994, 'Shallow well', NULL, 'S.No:  21   -  Well No: na.a                            - Location: Belwa', NULL, NULL, '40', NULL, '1623220855711.jpg', 6, 1, 5, 0.400000000000000022, 4.59999999999999964, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 184597255, 'fe4370fe-b5fa-4a25-a875-be97c4101ed4', '2021-06-12T08:14:40', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 108, 108);
INSERT INTO public.gw_monitoring VALUES ('2021-06-09T12:05:56.983+05:45', '2021-06-09T12:07:02.515+05:45', '2021-06-09', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.2365263 81.5477659 97.19428848003315 4.803', 28.2365263000000013, 81.5477659000000017, 97.1942884800331512, 4.80299999999999994, 'Shallow well', NULL, 'S.No:  2    -  Well No: 2-045\46(B\D)2  - Location: Bakharikurd', NULL, NULL, '0', NULL, '1623219713564.jpg', 4, 1, 3, 0, 3, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 184597251, '19ac52e5-f1bf-4390-a09f-43006c57bb0d', '2021-06-12T08:14:39', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 109, 109);
INSERT INTO public.gw_monitoring VALUES ('2021-06-07T13:39:07.248+05:45', '2021-06-07T13:39:40.427+05:45', '2021-06-07', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.3287566 81.2715499 122.39451065462401 4.551', 28.3287565999999984, 81.2715498999999966, 122.394510654624014, 4.55100000000000016, 'Shallow well', NULL, 'S.No:  13   -  Well No: 13-045\46(B\D)13  - Location: Madhubhan', NULL, NULL, '10', NULL, '1623052474911.jpg', 5, 1, 4, 0.100000000000000006, 3.89999999999999991, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 184597249, '3be23429-5ca0-44b1-b2f1-f9147f5e5617', '2021-06-12T08:14:38', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 110, 110);
INSERT INTO public.gw_monitoring VALUES ('2021-06-07T13:27:00.719+05:45', '2021-06-07T13:28:29.034+05:45', '2021-06-07', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.2795966 81.2629383 91.36498346296538 4.803', 28.2795966000000014, 81.2629383000000018, 91.3649834629653839, 4.80299999999999994, 'Shallow well', NULL, 'S.No:  12   -  Well No: 12-045\46(B\D)12  - Location: Taratal', NULL, NULL, '40', NULL, '1623051764859.jpg', 14, 2, 12, 0.400000000000000022, 11.5999999999999996, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 184597248, '0aafb842-f02d-4924-9b3e-87560b16b626', '2021-06-12T08:14:37', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 111, 111);
INSERT INTO public.gw_monitoring VALUES ('2021-06-07T13:06:37.727+05:45', '2021-06-07T13:08:39.385+05:45', '2021-06-07', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.247492 81.3080601 113.68960467056324 4.854', 28.2474920000000012, 81.3080601000000058, 113.689604670563241, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  9    -  Well No: 9-045\46(B\D)9  - Location: Khairapur', NULL, NULL, '50', NULL, '1623050586201.jpg', 6, 2, 4, 0.5, 3.5, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 184597245, '900c0a40-b6b9-4b96-a7d9-ead055e268f3', '2021-06-12T08:14:35', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 112, 112);
INSERT INTO public.gw_monitoring VALUES ('2021-06-07T12:45:53.618+05:45', '2021-06-07T12:47:59.547+05:45', '2021-06-07', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.1691826 81.3378217 81.71405467671278 4.854', 28.1691825999999992, 81.3378217000000063, 81.7140546767127773, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  6    -  Well No: 6-045\46(B\D)6  - Location: Rain Nagar', NULL, NULL, '40', NULL, '1623049372236.jpg', 5, 1, 4, 0.400000000000000022, 3.60000000000000009, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 184597243, '7ad96f0e-191c-46b5-9156-730ddcae6c7e', '2021-06-12T08:14:33', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 113, 113);
INSERT INTO public.gw_monitoring VALUES ('2021-06-07T12:25:52.062+05:45', '2021-06-07T12:26:58.125+05:45', '2021-06-07', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.1896926 81.3836599 97.53402704542424 4.854', 28.1896926000000008, 81.3836598999999978, 97.5340270454242386, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  5    -  Well No: 5-045\46(B\D)5  - Location: Bhaisahi', NULL, NULL, '30', NULL, '1623048111393.jpg', 6, 1, 5, 0.299999999999999989, 4.70000000000000018, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 184597241, '672fd59c-1ed5-434e-b1de-4df0c1f1e29e', '2021-06-12T08:14:32', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 114, 114);
INSERT INTO public.gw_monitoring VALUES ('2021-06-07T12:08:22.586+05:45', '2021-06-07T12:09:17.591+05:45', '2021-06-07', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.1880287 81.47992 93.21758807496238 4.854', 28.1880287000000003, 81.479920000000007, 93.2175880749623786, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  3    -  Well No: 3-045\46(B\D)3  - Location: Mainapokhar', NULL, NULL, '40', NULL, '1623047049451.jpg', 5, 1, 4, 0.400000000000000022, 3.60000000000000009, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 184597238, '1125fe03-da18-4c05-8623-c4dd8d351d23', '2021-06-12T08:14:31', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 115, 115);
INSERT INTO public.gw_monitoring VALUES ('2021-06-07T11:53:35.883+05:45', '2021-06-07T11:54:52.993+05:45', '2021-06-07', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.165612 81.5008629 92.75949082181221 4.803', 28.1656119999999994, 81.5008629000000013, 92.7594908218122072, 4.80299999999999994, 'Shallow well', NULL, 'S.No:  20   -  Well No: NISP\INV\STW-6    - Location: Shoharawa', NULL, NULL, '70', NULL, '1623046176143.jpg', 7, 1.89999999999999991, 5.09999999999999964, 0.699999999999999956, 4.40000000000000036, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 184597237, 'a0092006-c1c9-49f6-997b-f3484b0d1b4e', '2021-06-12T08:14:30', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 116, 116);
INSERT INTO public.gw_monitoring VALUES ('2021-06-07T11:41:25.259+05:45', '2021-06-07T11:42:24.744+05:45', '2021-06-07', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.1463227 81.4792319 93.19272856470515 4.803', 28.1463226999999989, 81.479231900000002, 93.1927285647051491, 4.80299999999999994, 'Shallow well', NULL, 'S.No:  19   -  Well No: n.a.                             - Location: Bhawanipur', NULL, NULL, '30', NULL, '1623045434105.jpg', 8, 2, 6, 0.299999999999999989, 5.70000000000000018, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 184597234, '6ec81872-847f-4e08-956b-4fc81f63aa1c', '2021-06-12T08:14:29', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 117, 117);
INSERT INTO public.gw_monitoring VALUES ('2021-06-07T11:27:39.098+05:45', '2021-06-07T11:29:07.041+05:45', '2021-06-07', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.1487553 81.4969459 96.17835771416038 4.803', 28.1487553000000013, 81.4969459000000001, 96.1783577141603843, 4.80299999999999994, 'Shallow well', NULL, 'S.No:  18   -  Well No: NISP\INV\STW-5    - Location: Shoharawa', NULL, NULL, '40', NULL, '1623044638549.jpg', 6, 1, 5, 0.400000000000000022, 4.59999999999999964, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 184597227, 'b1df2c53-3bef-42c7-9ce2-c4db8fb75e23', '2021-06-12T08:14:27', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 118, 118);
INSERT INTO public.gw_monitoring VALUES ('2021-06-03T12:34:02.700+05:45', '2021-06-03T12:36:22.720+05:45', '2021-06-03', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.1054668 81.4827798 79.73053913925013 4.803', 28.1054667999999985, 81.482779800000003, 79.7305391392501264, 4.80299999999999994, 'Deep well', 'S.No:  2   -  Well No: DTW-6            - Location: Tholodafe', NULL, NULL, NULL, '10', NULL, '1622703048549.jpg', 12, 1.80000000000000004, 10.1999999999999993, 0.100000000000000006, 10.0999999999999996, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 184597223, 'eaa12929-2d9d-4dad-ac9b-ad825a68bb85', '2021-06-12T08:14:26', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 119, 119);
INSERT INTO public.gw_monitoring VALUES ('2021-06-03T12:14:46.552+05:45', '2021-06-03T12:17:53.492+05:45', '2021-06-03', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.0883383 81.5027308 91.82764724564169 4.854', 28.0883383000000002, 81.5027307999999948, 91.8276472456416855, 4.85400000000000009, 'Deep well', 'S.No:  3   -  Well No: DTW-3             - Location: Shantipur', NULL, NULL, NULL, '20', NULL, '1622701961712.jpg', 13, 1, 12, 0.200000000000000011, 11.8000000000000007, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 184597219, 'e19de67c-a10d-4b78-93c7-165d2024f070', '2021-06-12T08:14:25', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 120, 120);
INSERT INTO public.gw_monitoring VALUES ('2021-06-03T12:06:49.364+05:45', '2021-06-03T12:09:01.480+05:45', '2021-06-03', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.0828452 81.5111836 84.44654549989352 4.854', 28.0828452000000013, 81.5111835999999954, 84.4465454998935172, 4.85400000000000009, 'Deep well', 'S.No:  4   -  Well No: DTW-10              - Location: Shantipur', NULL, NULL, NULL, '24', NULL, '1622701393234.jpg', 11, 1, 10, 0.239999999999999991, 9.75999999999999979, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 184597217, 'ad49acd9-afd8-4e8b-8aa9-6069bb07d2b0', '2021-06-12T08:14:23', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 121, 121);
INSERT INTO public.gw_monitoring VALUES ('2021-06-03T11:58:47.040+05:45', '2021-06-03T12:01:52.371+05:45', '2021-06-03', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.0851481 81.5164416 86.74715379792804 4.854', 28.0851481000000014, 81.5164415999999932, 86.7471537979280356, 4.85400000000000009, 'Deep well', 'S.No:  1   -  Well No: DTW-9              - Location: Shantipur', NULL, NULL, NULL, '25', NULL, '1622700973022.jpg', 13, 1, 12, 0.25, 11.75, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 184597212, '8d9362b8-cc08-462a-aae3-e31075e11bae', '2021-06-12T08:14:21', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 122, 122);
INSERT INTO public.gw_monitoring VALUES ('2021-06-05T17:26:06.040+05:45', '2021-06-05T17:27:51.503+05:45', '2021-06-05', '868190042176206', 'yogendra', 'Banke', '28.1873063 81.6300652 106.36601218002876 4.854', 28.1873062999999995, 81.6300652000000042, 106.366012180028761, 4.85400000000000009, 'Shallow well', NULL, NULL, NULL, 'S.No:  4  -   Well No:  1-045/46(BK)4  Location:  Channawa', '65', NULL, '1622893341429.jpg', 5, 2.43999999999999995, 2.56000000000000005, 0.650000000000000022, 1.90999999999999992, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 182916417, '357049cd-acd6-4a73-99ac-41a61733a4b3', '2021-06-06T07:22:38', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 123, 123);
INSERT INTO public.gw_monitoring VALUES ('2021-06-05T16:30:13.292+05:45', '2021-06-05T16:32:12.902+05:45', '2021-06-05', '868190042176206', 'yogendra', 'Banke', '28.192112 81.5747878 90.66314017084501 4.803', 28.1921120000000016, 81.5747877999999957, 90.6631401708450113, 4.80299999999999994, 'Shallow well', NULL, NULL, NULL, 'S.No:  5  -   Well No:  1-045/46(BK)5  Location:  Thapawa', '29', NULL, '1622890009644.jpg', 5, 1.60000000000000009, 3.39999999999999991, 0.28999999999999998, 3.10999999999999988, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 182916410, '5ea6f9e7-2a23-4301-86ed-8c8f0cde9730', '2021-06-06T07:22:35', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 124, 124);
INSERT INTO public.gw_monitoring VALUES ('2021-06-05T15:29:33.198+05:45', '2021-06-05T15:41:58.486+05:45', '2021-06-05', '868190042176206', 'yogendra', 'Banke', '28.2064948 81.6307426 110.27958693388672 4.551', 28.2064948000000015, 81.6307426000000049, 110.279586933886719, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  3  -   Well No:  1-045/46(BK)3  Location:  Banktuwa', '40', NULL, '1622886979718.jpg', 9, 1.39999999999999991, 7.59999999999999964, 0.400000000000000022, 7.20000000000000018, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 182916392, '07b3067c-e9d4-4341-9aba-6004639e8ab0', '2021-06-06T07:22:31', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 125, 125);
INSERT INTO public.gw_monitoring VALUES ('2021-06-05T14:34:49.769+05:45', '2021-06-05T14:37:28.416+05:45', '2021-06-05', '868190042176206', 'yogendra', 'Banke', '28.1961552 81.7119906 96.80919197738407 15.17', 28.1961551999999998, 81.7119905999999929, 96.8091919773840743, 15.1699999999999999, 'Shallow well', NULL, NULL, NULL, 'S.No:  1  -   Well No:  1-045/46(BK)1  Location:  Rohini Khola', '20', NULL, '1622883124344.jpg', 5, 1.60000000000000009, 3.39999999999999991, 0.200000000000000011, 3.20000000000000018, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 182916383, '2d80b0b1-a9ad-4552-a1cb-f20a3dc7cf84', '2021-06-06T07:22:29', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 126, 126);
INSERT INTO public.gw_monitoring VALUES ('2021-06-05T13:31:59.439+05:45', '2021-06-05T13:34:47.029+05:45', '2021-06-05', '868190042176206', 'yogendra', 'Banke', '28.1317499 81.6588235 106.53494205818672 4.551', 28.1317498999999991, 81.6588234999999969, 106.534942058186715, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  6  -   Well No:  1-045/46(BK)6  Location:  Piprahwa', '45', NULL, '1622879300708.jpg', 5, 2.85000000000000009, 2.14999999999999991, 0.450000000000000011, 1.69999999999999996, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 182916379, '497f1bfd-5ea0-4274-8192-a6667a432985', '2021-06-06T07:22:27', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 127, 127);
INSERT INTO public.gw_monitoring VALUES ('2021-06-05T12:46:06.028+05:45', '2021-06-05T12:49:49.891+05:45', '2021-06-05', '868190042176206', 'yogendra', 'Banke', '28.0928325 81.6477812 103.08150843363556 4.854', 28.0928325000000001, 81.6477811999999972, 103.081508433635562, 4.85400000000000009, 'Shallow well', NULL, NULL, NULL, 'S.No:  7  -   Well No:  1-045/46(BK)7  Location:  Bhujai', '15', NULL, '1622876650718.jpg', 4.09999999999999964, 0.5, 3.59999999999999964, 0.149999999999999994, 3.45000000000000018, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 182916373, '8ee522ed-cc93-436b-b9a8-1b1a64f6da0b', '2021-06-06T07:22:25', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 128, 128);
INSERT INTO public.gw_monitoring VALUES ('2021-06-05T12:24:01.755+05:45', '2021-06-05T12:30:50.849+05:45', '2021-06-05', '868190042176206', 'yogendra', 'Banke', '28.0812217 81.6450477 88.47714876386338 4.803', 28.0812217000000004, 81.6450477000000063, 88.4771487638633829, 4.80299999999999994, 'Shallow well', NULL, NULL, NULL, 'S.No:  16  -  Well No:  NISP/STW 1       Location:  Office compound', '54', NULL, '1622875470989.jpg', 5, 1.44999999999999996, 3.54999999999999982, 0.540000000000000036, 3.00999999999999979, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 182916359, 'baf0a525-bb01-42c0-a0e1-6d01f85e7342', '2021-06-06T07:22:20', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 129, 129);
INSERT INTO public.gw_monitoring VALUES ('2021-06-03T17:17:28.401+05:45', '2021-06-03T17:23:13.450+05:45', '2021-06-03', '868190042176206', 'yogendra', 'Banke', '28.0818001 81.5465758 87.72579750251839 4.854', 28.0818000999999988, 81.5465757999999994, 87.7257975025183896, 4.85400000000000009, 'Deep well', NULL, NULL, 'S.No: 1  -  Well No:  SP-1    - Location:  K Gaon', NULL, '37', NULL, '1622720162434.jpg', 13, 1.87000000000000011, 11.129999999999999, 0.369999999999999996, 10.7599999999999998, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 182916343, '7e8ecfb1-b8b2-420e-a8cb-e21696814990', '2021-06-06T07:22:15', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 130, 130);
INSERT INTO public.gw_monitoring VALUES ('2021-06-03T16:05:34.719+05:45', '2021-06-03T16:14:18.703+05:45', '2021-06-03', '868190042176206', 'yogendra', 'Banke', '28.0960591 81.5211446 83.06716468452909 4.551', 28.0960591000000015, 81.5211445999999995, 83.0671646845290894, 4.55100000000000016, 'Deep well', NULL, NULL, 'S.No: 2  -  Well No:  SP-6    - Location:  L Gaon', NULL, '25', NULL, '1622716117638.jpg', 13, 1.60000000000000009, 11.4000000000000004, 0.25, 11.1500000000000004, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 182916332, '18edcc2e-fb1c-4806-ab44-a5bcb431b965', '2021-06-06T07:22:10', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 131, 131);
INSERT INTO public.gw_monitoring VALUES ('2021-06-03T15:15:42.159+05:45', '2021-06-03T15:18:47.867+05:45', '2021-06-03', '868190042176206', 'yogendra', 'Banke', '28.1224142 81.5165706 97.94866073939951 4.854', 28.1224142000000015, 81.5165705999999943, 97.9486607393995143, 4.85400000000000009, 'Deep well', NULL, NULL, 'S.No: 3  -  Well No:  SP-9    - Location:  Gaughat', NULL, '42', NULL, '1622712792670.jpg', 13, 1.55000000000000004, 11.4499999999999993, 0.419999999999999984, 11.0299999999999994, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 182916327, '32a9f8de-38f8-4e30-a8d5-4d2ba2d9343f', '2021-06-06T07:22:07', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 132, 132);
INSERT INTO public.gw_monitoring VALUES ('2021-06-03T14:34:38.581+05:45', '2021-06-03T14:39:53.772+05:45', '2021-06-03', '868190042176206', 'yogendra', 'Banke', '28.1132507 81.5173521 93.88311420385803 4.551', 28.1132506999999983, 81.5173520999999965, 93.8831142038580282, 4.55100000000000016, 'Deep well', NULL, NULL, 'S.No: 4  -  Well No:  SP-13    - Location:  Gaughat', NULL, '49', NULL, '1622710452006.jpg', 10, 2.25, 7.75, 0.489999999999999991, 7.25999999999999979, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 182916317, '908e7cb5-94c4-4401-a449-c672d6c31d78', '2021-06-06T07:22:02', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 133, 133);
INSERT INTO public.gw_monitoring VALUES ('2021-06-03T13:34:54.467+05:45', '2021-06-03T13:39:55.254+05:45', '2021-06-03', '868190042176206', 'yogendra', 'Banke', '28.111471 81.5216667 86.16032390753342 4.803', 28.1114710000000017, 81.5216666999999973, 86.1603239075334244, 4.80299999999999994, 'Shallow well', NULL, NULL, NULL, 'S.No:  14  -  Well No:  1-045/46(BK)19  Location:  Gaughat', '23', NULL, '1622706826397.jpg', 8, 2.10000000000000009, 5.90000000000000036, 0.23000000000000001, 5.66999999999999993, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 182916311, '3369ba99-d233-44fa-a1d4-dc99b7ce5d39', '2021-06-06T07:21:58', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 134, 134);
INSERT INTO public.gw_monitoring VALUES ('2021-06-02T14:10:09.467+05:45', '2021-06-02T14:22:02.768+05:45', '2021-06-02', '868190042176206', 'yogendra', 'Banke', '28.0507597 81.5861889 91.86447364992894 4.551', 28.0507597000000004, 81.5861888999999962, 91.8644736499289394, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  20  -  Well No:  n/a  Location:  Jaogagaun', '55', NULL, '1622622610177.jpg', 7, 0.849999999999999978, 6.15000000000000036, 0.550000000000000044, 5.59999999999999964, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 182214608, '38cbd2d2-7c61-4989-b8f4-b8862f384e7f', '2021-06-03T05:51:41', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 135, 135);
INSERT INTO public.gw_monitoring VALUES ('2021-06-02T13:18:21.765+05:45', '2021-06-02T13:21:34.208+05:45', '2021-06-02', '868190042176206', 'yogendra', 'Banke', '28.0513305 81.6024486 86.4348803475658 4.854', 28.0513304999999988, 81.6024486000000024, 86.4348803475657945, 4.85400000000000009, 'Deep well', NULL, NULL, 'S.No: 5 - Well No. EXPT-7   - Location: Parspur', NULL, '27', NULL, '1622619326158.jpg', 6, 1.30000000000000004, 4.70000000000000018, 0.270000000000000018, 4.42999999999999972, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 182214594, '8292b084-32ed-4dde-bb4c-94c1b67de97e', '2021-06-03T05:51:39', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 136, 136);
INSERT INTO public.gw_monitoring VALUES ('2021-05-31T16:17:38.805+05:45', '2021-05-31T16:23:55.183+05:45', '2021-05-31', '868190042176206', 'yogendra', 'Banke', '28.146539 81.5520658 116.39917487513846 69.023', 28.1465390000000006, 81.5520657999999941, 116.399174875138456, 69.0229999999999961, 'Shallow well', NULL, NULL, NULL, 'S.No:  13  -  Well No:  1-045/46(BK)18  Location:  Kalhansgaon', '27', NULL, '1622457511215.jpg', 6, 2, 4, 0.270000000000000018, 3.72999999999999998, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 182214589, 'fd874382-c006-4592-8aca-f0ab7d0768c2', '2021-06-03T05:51:37', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 137, 137);
INSERT INTO public.gw_monitoring VALUES ('2021-05-31T14:35:51.005+05:45', '2021-05-31T14:38:09.486+05:45', '2021-05-31', '868190042176206', 'yogendra', 'Banke', '28.1287363 81.5894038 86.38434223209704 4.854', 28.1287362999999999, 81.5894037999999995, 86.3843422320970404, 4.85400000000000009, 'Shallow well', NULL, NULL, NULL, 'S.No:  12 -  Well No:  1-045/46(BK)17  Location:  D-gaon', '15', NULL, '1622451158481.jpg', 6, 1.78000000000000003, 4.21999999999999975, 0.149999999999999994, 4.07000000000000028, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 182214579, '779b10a0-0daa-40ca-a416-268ba032807d', '2021-06-03T05:51:34', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 138, 138);
INSERT INTO public.gw_monitoring VALUES ('2021-05-31T13:52:59.200+05:45', '2021-05-31T13:55:22.503+05:45', '2021-05-31', '868190042176206', 'yogendra', 'Banke', '28.1060616 81.5971125 83.9424239534995 4.551', 28.1060616000000003, 81.5971124999999944, 83.9424239534994996, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  17  -  Well No:  NISP/INV/STW 8   Location:  Kajurakurda', '35', NULL, '1622448580701.jpg', 4.25, 0.5, 3.75, 0.349999999999999978, 3.39999999999999991, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 182214570, '55431806-8937-4ccb-8722-dedab18c4e37', '2021-06-03T05:51:31', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 139, 139);
INSERT INTO public.gw_monitoring VALUES ('2021-05-31T13:17:47.776+05:45', '2021-05-31T13:26:04.273+05:45', '2021-05-31', '868190042176206', 'yogendra', 'Banke', '28.0830268 81.5956128 85.93129539776979 4.854', 28.083026799999999, 81.5956127999999978, 85.9312953977697873, 4.85400000000000009, 'Shallow well', NULL, NULL, NULL, 'S.No:  19  -  Well No:  NISP/INV/STW 11  Location:  Ramapurwa', '40', NULL, '1622446813028.jpg', 5.25, 0.5, 4.75, 0.400000000000000022, 4.34999999999999964, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 182214559, 'c4b2ad09-c698-4a8d-abd6-f3672fa520b3', '2021-06-03T05:51:28', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 140, 140);
INSERT INTO public.gw_monitoring VALUES ('2021-05-31T12:56:28.344+05:45', '2021-05-31T12:59:45.570+05:45', '2021-05-31', '868190042176206', 'yogendra', 'Banke', '28.078065 81.5932423 99.70166537230462 4.803', 28.0780649999999987, 81.5932423, 99.7016653723046176, 4.80299999999999994, 'Shallow well', NULL, NULL, NULL, 'S.No:  18  -  Well No:  NISP/INV/STW 10  Location:  Banjaregaon', '25', NULL, '1622445242540.jpg', 5, 1.64999999999999991, 3.35000000000000009, 0.25, 3.10000000000000009, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 182214556, '68b216c8-85c5-490a-ae4a-db68b420499f', '2021-06-03T05:51:27', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 141, 141);
INSERT INTO public.gw_monitoring VALUES ('2021-05-30T15:21:36.070+05:45', '2021-05-30T15:24:05.955+05:45', '2021-05-30', '868190042176206', 'yogendra', 'Banke', '27.9833037 81.7134115 91.00598286154765 4.551', 27.9833037000000004, 81.7134115000000065, 91.0059828615476505, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  10  -  Well No:  1-045/46(BK)10  Location:  Kharaicha', '70', NULL, '1622367482581.jpg', 5, 1.37999999999999989, 3.62000000000000011, 0.699999999999999956, 2.91999999999999993, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 182214550, '20e7bf84-9fb9-4c47-bb3d-ca11984b3ca7', '2021-06-03T05:51:25', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 142, 142);
INSERT INTO public.gw_monitoring VALUES ('2021-05-30T14:12:51.673+05:45', '2021-05-30T14:15:23.368+05:45', '2021-05-30', '868190042176206', 'yogendra', 'Banke', '28.0285084 81.6947302 99.94750067742251 4.551', 28.0285083999999998, 81.6947301999999951, 99.9475006774225108, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  22 -  Well No: n/a   Location:  Harbaldoli', '55', NULL, '1622363385203.jpg', 6, 1.10000000000000009, 4.90000000000000036, 0.550000000000000044, 4.34999999999999964, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 182214543, '91f9e0be-8b76-43ee-9b08-d1102400ee04', '2021-06-03T05:51:22', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 143, 143);
INSERT INTO public.gw_monitoring VALUES ('2021-05-30T12:48:18.554+05:45', '2021-05-30T12:51:04.107+05:45', '2021-05-30', '868190042176206', 'yogendra', 'Banke', '28.049366 81.6617059 103.19010667812974 4.854', 28.0493659999999991, 81.6617059000000012, 103.190106678129737, 4.85400000000000009, 'Shallow well', NULL, NULL, NULL, 'S.No:  8  -   Well No:  1-045/46(BK)8  Location:  Birta', '36', NULL, '1622358309653.jpg', 8, 1.39999999999999991, 6.59999999999999964, 0.359999999999999987, 6.24000000000000021, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 182214534, '8195188b-1941-4b0e-b112-8b4a1ae0d9c7', '2021-06-03T05:51:19', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 144, 144);
INSERT INTO public.gw_monitoring VALUES ('2021-05-28T14:57:21.384+05:45', '2021-05-28T15:00:59.623+05:45', '2021-05-28', '868190042176206', 'yogendra', 'Banke', '28.0020503 81.6523608 77.31210202905177 4.854', 28.0020503000000005, 81.6523607999999967, 77.312102029051772, 4.85400000000000009, 'Shallow well', NULL, NULL, NULL, 'S.No:  21 -  Well No:  n/a  Location:  Baldipurwa', '40', NULL, '1622193267830.jpg', 7, 2, 5, 0.400000000000000022, 4.59999999999999964, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 180829545, '5a094ac7-dbd7-47d4-8c11-c5a4e2f944c7', '2021-05-28T15:09:41', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 145, 145);
INSERT INTO public.gw_monitoring VALUES ('2021-05-28T14:21:37.122+05:45', '2021-05-28T14:23:54.243+05:45', '2021-05-28', '868190042176206', 'yogendra', 'Banke', '28.0151196 81.6543402 89.1867064656052 4.551', 28.0151195999999985, 81.6543401999999929, 89.186706465605198, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  9  -   Well No:  1-045/46(BK)9  Location:  Sikhanpurwa', '60', NULL, '1622191096642.jpg', 5, 1.73999999999999999, 3.25999999999999979, 0.599999999999999978, 2.66000000000000014, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 180829539, '7e32bccd-1288-429d-902a-31d5e7dec893', '2021-05-28T15:09:38', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 146, 146);
INSERT INTO public.gw_monitoring VALUES ('2021-05-28T13:03:11.020+05:45', '2021-05-28T13:04:37.518+05:45', '2021-05-28', '868190042176206', 'yogendra', 'Banke', '28.0242824 81.6002927 83.85836656317899 4.854', 28.0242824000000006, 81.6002926999999971, 83.8583665631789898, 4.85400000000000009, 'Shallow well', NULL, NULL, NULL, 'S.No:  11  -  Well No:  1-045/46(BK)11  Location:  Jaishpur', '50', NULL, '1622186344196.jpg', 7, 1.5, 5.5, 0.5, 5, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 180829535, '77ed0866-663c-4438-96b1-e3a68e611c79', '2021-05-28T15:09:37', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 147, 147);
INSERT INTO public.gw_monitoring VALUES ('2021-05-12T15:13:12.847+05:45', '2021-05-12T15:20:10.792+05:45', '2021-05-12', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.3065034 81.3591938 82.84473526781777 4.803', 28.3065034000000004, 81.3591937999999999, 82.844735267817768, 4.80299999999999994, 'Shallow well', NULL, 'S.No:  11   -  Well No: 11-045\46(B\D)11  - Location: Baniyabhar', NULL, NULL, '75', NULL, '1620812035622.jpg', 6, 1.69999999999999996, 4.29999999999999982, 0.75, 3.54999999999999982, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 177670361, '8029e30e-2164-4f68-8889-3a1d170d2bdd', '2021-05-13T15:25:08', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 148, 148);
INSERT INTO public.gw_monitoring VALUES ('2021-05-12T15:09:58.152+05:45', '2021-05-12T15:10:54.400+05:45', '2021-05-12', 'collect:j4PTEWRBElBFPepF', 'Àñità', 'Bardiya', '28.3056538 81.3593227 98.33427251366963 4.551', 28.3056538000000018, 81.359322700000007, 98.3342725136696316, 4.55100000000000016, 'Shallow well', NULL, 'S.No:  10   -  Well No: 10-045\46(B\D)10  - Location: Padnaha', NULL, NULL, '60', NULL, '1620811545712.jpg', 5, 1, 4, 0.599999999999999978, 3.39999999999999991, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 177670357, '8d769eff-334a-44af-a184-14678a28543c', '2021-05-13T15:25:07', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 149, 149);
INSERT INTO public.gw_monitoring VALUES ('2021-05-12T15:06:23.519+05:45', '2021-05-12T15:08:32.942+05:45', '2021-05-12', 'collect:j4PTEWRBElBFPepF', 'Añita', 'Bardiya', '28.3061841 81.3597472 97.73312643004091 4.551', 28.3061840999999994, 81.359747200000001, 97.7331264300409117, 4.55100000000000016, 'Shallow well', NULL, 'S.No:  7    -  Well No: 7-045\46(B\D)7  - Location: Megara Gadhi', NULL, NULL, '45', NULL, '1620811403487.jpg', 6, 1, 5, 0.450000000000000011, 4.54999999999999982, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 177670353, 'c49fa4e8-560b-4dca-8ca1-9b9af460e67b', '2021-05-13T15:25:05', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 150, 150);
INSERT INTO public.gw_monitoring VALUES ('2021-05-12T14:19:08.408+05:45', '2021-05-12T14:19:58.932+05:45', '2021-05-12', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.351191 81.4297489 109.68273454813199 4.854', 28.351191, 81.429748900000007, 109.68273454813199, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  8    -  Well No: 8-045\46(B\D)8  - Location: Auri', NULL, NULL, '40', NULL, '1620808479685.jpg', 6, 1.80000000000000004, 4.20000000000000018, 0.400000000000000022, 3.79999999999999982, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 177670348, '5fc959a5-c7a2-4bac-9d90-4cd733272c30', '2021-05-13T15:25:04', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 151, 151);
INSERT INTO public.gw_monitoring VALUES ('2021-05-12T14:04:24.994+05:45', '2021-05-12T14:05:32.710+05:45', '2021-05-12', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.2897791 81.4420663 108.20380514467726 4.803', 28.2897791000000005, 81.4420662999999934, 108.203805144677261, 4.80299999999999994, 'Shallow well', NULL, 'S.No:  4    -  Well No: 4-045\46(B\D)4  - Location: Bangai', NULL, NULL, '32', NULL, '1620807624499.jpg', 5, 1, 4, 0.320000000000000007, 3.68000000000000016, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 177670344, '41e193e8-4d11-437a-ae7d-b8d0aea26b9f', '2021-05-13T15:25:03', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 152, 152);
INSERT INTO public.gw_monitoring VALUES ('2021-05-12T13:38:04.585+05:45', '2021-05-12T13:39:45.465+05:45', '2021-05-12', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.2272298 81.5711189 105.65349682577164 4.803', 28.2272297999999999, 81.5711189000000019, 105.65349682577164, 4.80299999999999994, 'Shallow well', NULL, 'S.No:  22   -  Well No: n.a.                            - Location: Belwa', NULL, NULL, '10', NULL, '1620806067828.jpg', 8, 1.5, 6.5, 0.100000000000000006, 6.40000000000000036, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 177670339, '448a05c0-49cc-48f8-99b3-7ce3e0ce6527', '2021-05-13T15:25:01', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 153, 153);
INSERT INTO public.gw_monitoring VALUES ('2021-05-12T13:26:03.945+05:45', '2021-05-12T13:27:44.997+05:45', '2021-05-12', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.2490759 81.5850066 105.65349682577164 4.854', 28.2490759000000011, 81.5850065999999998, 105.65349682577164, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  21   -  Well No: na.a                            - Location: Belwa', NULL, NULL, '40', NULL, '1620805356716.jpg', 8, 1.80000000000000004, 6.20000000000000018, 0.400000000000000022, 5.79999999999999982, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 177670335, '12d77940-20d1-47c2-b4cf-3732d5f50e84', '2021-05-13T15:25:00', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 154, 154);
INSERT INTO public.gw_monitoring VALUES ('2021-05-12T13:07:26.427+05:45', '2021-05-12T13:10:13.094+05:45', '2021-05-12', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.2363039 81.5474052 111.57403489786903 4.551', 28.2363038999999993, 81.5474052, 111.574034897869026, 4.55100000000000016, 'Shallow well', NULL, 'S.No:  2    -  Well No: 2-045\46(B\D)2  - Location: Bakharikurd', NULL, NULL, '0', NULL, '1620804299121.jpg', 4, 1.39999999999999991, 2.60000000000000009, 0, 2.60000000000000009, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 177670329, '9a351726-0160-4dad-9c1c-5a9849bb0941', '2021-05-13T15:24:58', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 155, 155);
INSERT INTO public.gw_monitoring VALUES ('2021-05-11T18:39:03.733+05:45', '2021-05-11T19:28:27.535+05:45', '2021-05-11', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.0726661 81.5550289 88.4754930469689 4.803', 28.0726660999999993, 81.5550288999999964, 88.4754930469688929, 4.80299999999999994, 'Shallow well', NULL, 'S.No:  16   -  Well No: 16-045\46(B\D)16  - Location: Newlpur', NULL, NULL, '60', NULL, '1620737960589.jpg', 6, 1, 5, 0.599999999999999978, 4.40000000000000036, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 177670323, '7eef515e-d2f1-440d-9d96-d8e5c79195d4', '2021-05-13T15:24:57', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 156, 156);
INSERT INTO public.gw_monitoring VALUES ('2021-05-11T17:44:18.542+05:45', '2021-05-11T19:29:06.214+05:45', '2021-05-11', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.0730391 81.5543626 77.4547242895659 4.551', 28.073039099999999, 81.5543626000000046, 77.4547242895659025, 4.55100000000000016, 'Shallow well', NULL, 'S.No:  14   -  Well No: 14-045\46(B\D)14  - Location: Begnaha', NULL, NULL, '10', NULL, '1620734402895.jpg', 4, 1, 3, 0.100000000000000006, 2.89999999999999991, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 177670317, '85f58de4-997b-4f6d-b22e-633c0f7f22c6', '2021-05-13T15:24:55', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 157, 157);
INSERT INTO public.gw_monitoring VALUES ('2021-05-11T17:28:55.113+05:45', '2021-05-11T19:29:24.838+05:45', '2021-05-11', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.0732362 81.5542298 87.91501058041705 4.854', 28.0732362000000002, 81.5542298000000017, 87.9150105804170465, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  15   -  Well No: 15-045\46(B\D)15  - Location: Bhurigaon', NULL, NULL, '55', NULL, '1620733520951.jpg', 5, 1.80000000000000004, 3.20000000000000018, 0.550000000000000044, 2.64999999999999991, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 177670314, 'bbde564b-93f8-4336-b568-f45578d1d7db', '2021-05-13T15:24:54', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 158, 158);
INSERT INTO public.gw_monitoring VALUES ('2021-05-03T14:40:30.377+05:45', '2021-05-03T14:42:28.742+05:45', '2021-05-03', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.3287711 81.2715109 104.56525114632025 4.854', 28.3287711000000009, 81.2715108999999956, 104.56525114632025, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  13   -  Well No: 13-045\46(B\D)13  - Location: Madhubhan', NULL, NULL, '10', NULL, '1620032236718.jpg', 5, 1, 4, 0.100000000000000006, 3.89999999999999991, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 177670309, '9a1e7f6e-765c-4092-83c0-f16d5de85369', '2021-05-13T15:24:51', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 159, 159);
INSERT INTO public.gw_monitoring VALUES ('2021-05-03T14:27:24.063+05:45', '2021-05-03T14:29:01.343+05:45', '2021-05-03', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.2797085 81.2629711 70.77046546934865 4.854', 28.2797085000000017, 81.2629711000000015, 70.7704654693486503, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  12   -  Well No: 12-045\46(B\D)12  - Location: Taratal', NULL, NULL, '40', NULL, '1620031407109.jpg', 14, 1.80000000000000004, 12.1999999999999993, 0.400000000000000022, 11.8000000000000007, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 177670303, 'e0b92ac9-77ed-48c0-a3a5-f7a3d89d06fc', '2021-05-13T15:24:49', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 160, 160);
INSERT INTO public.gw_monitoring VALUES ('2021-05-03T14:02:16.906+05:45', '2021-05-03T14:03:56.637+05:45', '2021-05-03', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.247389 81.307814 97.79387220569281 4.854', 28.2473889999999983, 81.3078139999999934, 97.7938722056928071, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  9    -  Well No: 9-045\46(B\D)9  - Location: Khairapur', NULL, NULL, '50', NULL, '1620029916937.jpg', 7, 1, 6, 0.5, 5.5, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 177670299, '31274c06-5f84-467c-a568-8235aa3d388a', '2021-05-13T15:24:47', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 161, 161);
INSERT INTO public.gw_monitoring VALUES ('2021-05-03T13:40:53.524+05:45', '2021-05-03T13:42:24.943+05:45', '2021-05-03', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.1691666 81.3378431 85.67579246810156 4.854', 28.1691666000000005, 81.3378431000000006, 85.6757924681015623, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  6    -  Well No: 6-045\46(B\D)6  - Location: Rain Nagar', NULL, NULL, '40', NULL, '1620028632885.jpg', 8, 1, 7, 0.400000000000000022, 6.59999999999999964, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 177670297, '0315864a-7a0c-47fd-8f94-25608afc81ff', '2021-05-13T15:24:45', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 162, 162);
INSERT INTO public.gw_monitoring VALUES ('2021-05-03T13:21:22.390+05:45', '2021-05-03T13:23:24.185+05:45', '2021-05-03', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.1896655 81.3835948 85.19132760630809 4.551', 28.1896655000000003, 81.3835947999999973, 85.1913276063080929, 4.55100000000000016, 'Shallow well', NULL, 'S.No:  5    -  Well No: 5-045\46(B\D)5  - Location: Bhaisahi', NULL, NULL, '30', NULL, '1620027481978.jpg', 7, 1.80000000000000004, 5.20000000000000018, 0.299999999999999989, 4.90000000000000036, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 177670296, 'b8d6a150-e2c6-45d6-abab-88a8c9b3b363', '2021-05-13T15:24:43', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 163, 163);
INSERT INTO public.gw_monitoring VALUES ('2021-05-03T13:03:00.451+05:45', '2021-05-03T13:04:30.710+05:45', '2021-05-03', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.1880204 81.4800895 90.26568924118823 4.854', 28.1880203999999992, 81.4800895000000054, 90.2656892411882268, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  3    -  Well No: 3-045\46(B\D)3  - Location: Mainapokhar', NULL, NULL, '40', NULL, '1620026360617.jpg', 6, 1, 5, 0.400000000000000022, 4.59999999999999964, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 177670293, '2848cae2-93ee-4cf0-80fa-feb4b2904450', '2021-05-13T15:24:42', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 164, 164);
INSERT INTO public.gw_monitoring VALUES ('2021-05-03T12:42:33.695+05:45', '2021-05-03T12:43:43.724+05:45', '2021-05-03', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.1655666 81.5009192 94.49468384052722 4.803', 28.1655665999999982, 81.5009191999999985, 94.494683840527216, 4.80299999999999994, 'Shallow well', NULL, 'S.No:  20   -  Well No: NISP\INV\STW-6    - Location: Shoharawa', NULL, NULL, '70', NULL, '1620025104879.jpg', 7, 1.69999999999999996, 5.29999999999999982, 0.699999999999999956, 4.59999999999999964, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 177670291, '108c63e6-5a8e-4bf2-ad04-73771ea5d97e', '2021-05-13T15:24:41', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 165, 165);
INSERT INTO public.gw_monitoring VALUES ('2021-05-03T12:28:16.751+05:45', '2021-05-03T12:30:35.563+05:45', '2021-05-03', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.1463616 81.4791081 92.15119572241383 4.803', 28.1463615999999988, 81.4791081000000048, 92.1511957224138314, 4.80299999999999994, 'Shallow well', NULL, 'S.No:  19   -  Well No: n.a.                             - Location: Bhawanipur', NULL, NULL, '30', NULL, '1620024272440.jpg', 8, 1.69999999999999996, 6.29999999999999982, 0.299999999999999989, 6, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 177670288, '10063cca-0c57-4f78-a3cc-cf937a6eaee5', '2021-05-13T15:24:39', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 166, 166);
INSERT INTO public.gw_monitoring VALUES ('2021-05-03T12:11:51.839+05:45', '2021-05-03T12:16:18.122+05:45', '2021-05-03', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.1486882 81.4968085 97.00529681083934 4.551', 28.1486881999999987, 81.4968085000000002, 97.0052968108393401, 4.55100000000000016, 'Shallow well', NULL, 'S.No:  18   -  Well No: NISP\INV\STW-5    - Location: Shoharawa', NULL, NULL, '40', NULL, '1620023468049.jpg', 7, 1.89999999999999991, 5.09999999999999964, 0.400000000000000022, 4.70000000000000018, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 177670286, 'a63a68d5-440a-4191-be3d-9f8ae23e991f', '2021-05-13T15:24:37', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 167, 167);
INSERT INTO public.gw_monitoring VALUES ('2021-05-02T11:31:54.863+05:45', '2021-05-02T11:33:15.792+05:45', '2021-05-02', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.1055615 81.4827864 85.0753903597881 4.854', 28.1055615000000003, 81.4827863999999948, 85.075390359788102, 4.85400000000000009, 'Deep well', 'S.No:  2   -  Well No: DTW-6            - Location: Tholodafe', NULL, NULL, NULL, '10', NULL, '1619934476289.jpg', 14, 1.5, 12.5, 0.100000000000000006, 12.4000000000000004, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 177670284, 'e0f1e360-31e5-4c30-94ff-488a2863a142', '2021-05-13T15:24:36', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 168, 168);
INSERT INTO public.gw_monitoring VALUES ('2021-05-02T11:13:34.731+05:45', '2021-05-02T11:16:15.125+05:45', '2021-05-02', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.0883799 81.5027349 91.75614843757998 4.803', 28.0883798999999996, 81.502734899999993, 91.7561484375799807, 4.80299999999999994, 'Deep well', 'S.No:  3   -  Well No: DTW-3             - Location: Shantipur', NULL, NULL, NULL, '20', NULL, '1619933459619.jpg', 16, 1.60000000000000009, 14.4000000000000004, 0.200000000000000011, 14.1999999999999993, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 177670281, 'ab4b0400-6379-4103-9c0c-5f578930f4e0', '2021-05-13T15:24:34', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 169, 169);
INSERT INTO public.gw_monitoring VALUES ('2021-05-02T11:05:48.249+05:45', '2021-05-02T11:07:29.628+05:45', '2021-05-02', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.0828898 81.5111103 72.26019646886688 4.854', 28.0828898000000002, 81.5111102999999986, 72.2601964688668801, 4.85400000000000009, 'Deep well', 'S.No:  4   -  Well No: DTW-10              - Location: Shantipur', NULL, NULL, NULL, '24', NULL, '1619932931580.jpg', 14, 1.80000000000000004, 12.1999999999999993, 0.239999999999999991, 11.9600000000000009, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 177670278, 'a9cd2c43-3e3d-482b-828e-0dd0e75ca3c2', '2021-05-13T15:24:33', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 170, 170);
INSERT INTO public.gw_monitoring VALUES ('2021-04-11T13:37:52.933+05:45', '2021-05-02T11:00:10.689+05:45', '2021-04-11', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.0852283 81.5164006 82.36269503406035 4.803', 28.0852283000000007, 81.5164005999999972, 82.3626950340603514, 4.80299999999999994, 'Deep well', 'S.No:  1   -  Well No: DTW-9              - Location: Shantipur', NULL, NULL, NULL, '25', NULL, '1619932491044.jpg', 12, 1.60000000000000009, 10.4000000000000004, 0.25, 10.1500000000000004, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 177670276, '8207d492-ede2-4072-9e78-733d1491326c', '2021-05-13T15:24:31', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 171, 171);
INSERT INTO public.gw_monitoring VALUES ('2021-05-04T16:36:51.592+05:45', '2021-05-04T16:39:55.992+05:45', '2021-05-04', '868190042176206', 'yogendra', 'Banke', '28.1873611 81.6300829 99.16882140019185 4.551', 28.1873611000000004, 81.630082900000005, 99.1688214001918453, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  4  -   Well No:  1-045/46(BK)4  Location:  Channawa', '65', NULL, '1620125652040.jpg', 5, 1.66999999999999993, 3.33000000000000007, 0.650000000000000022, 2.68000000000000016, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 175839565, 'cf5e1f7a-f22e-4c7c-82bc-b0ef4f99b2c1', '2021-05-04T14:08:52', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 172, 172);
INSERT INTO public.gw_monitoring VALUES ('2021-05-04T15:45:20.789+05:45', '2021-05-04T15:47:07.047+05:45', '2021-05-04', '868190042176206', 'yogendra', 'Banke', '28.192094 81.5747806 85.33743342011614 4.551', 28.1920940000000009, 81.5747805999999969, 85.3374334201161417, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  5  -   Well No:  1-045/46(BK)5  Location:  Thapawa', '29', NULL, '1620122502791.jpg', 5, 1.55000000000000004, 3.45000000000000018, 0.28999999999999998, 3.16000000000000014, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 175839542, 'a7d5566c-5878-4a02-851d-c55bed993330', '2021-05-04T14:08:47', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 173, 173);
INSERT INTO public.gw_monitoring VALUES ('2021-05-04T15:01:03.613+05:45', '2021-05-04T15:03:34.257+05:45', '2021-05-04', '868190042176206', 'yogendra', 'Banke', '28.206479 81.6307385 102.93040548102256 4.854', 28.2064790000000016, 81.6307385000000068, 102.930405481022561, 4.85400000000000009, 'Shallow well', NULL, NULL, NULL, 'S.No:  3  -   Well No:  1-045/46(BK)3  Location:  Banktuwa', '40', NULL, '1620119884660.jpg', 9, 1.25, 7.75, 0.400000000000000022, 7.34999999999999964, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 175839529, '2daa8768-0b37-445a-a4d0-e9bd3165d74e', '2021-05-04T14:08:44', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 174, 174);
INSERT INTO public.gw_monitoring VALUES ('2021-05-04T13:55:29.769+05:45', '2021-05-04T13:58:25.890+05:45', '2021-05-04', '868190042176206', 'yogendra', 'Banke', '28.1960893 81.7117338 114.67803958931864 4.551', 28.1960893000000006, 81.7117338000000046, 114.678039589318644, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  1  -   Well No:  1-045/46(BK)1  Location:  Rohini Khola', '20', NULL, '1620115971172.jpg', 5, 1.1399999999999999, 3.86000000000000032, 0.200000000000000011, 3.66000000000000014, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 175839507, 'b91b1a08-7e66-46a8-9b2c-ba63a2790a29', '2021-05-04T14:08:39', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 175, 175);
INSERT INTO public.gw_monitoring VALUES ('2021-05-04T12:48:18.914+05:45', '2021-05-04T12:51:03.156+05:45', '2021-05-04', '868190042176206', 'yogendra', 'Banke', '28.1317866 81.6587726 93.92316420348556 4.803', 28.1317866000000016, 81.658772600000006, 93.9231642034855554, 4.80299999999999994, 'Shallow well', NULL, NULL, NULL, 'S.No:  6  -   Well No:  1-045/46(BK)6  Location:  Piprahwa', '45', NULL, '1620111880246.jpg', 5, 1.95999999999999996, 3.04000000000000004, 0.450000000000000011, 2.58999999999999986, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 175839498, '51fdd0e7-30c7-4e99-8a59-ae3922ee48f9', '2021-05-04T14:08:36', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 176, 176);
INSERT INTO public.gw_monitoring VALUES ('2021-05-04T12:12:15.859+05:45', '2021-05-04T12:14:14.802+05:45', '2021-05-04', '868190042176206', 'yogendra', 'Banke', '28.0928844 81.6478464 94.60841958761327 4.551', 28.0928843999999991, 81.6478464000000059, 94.6084195876132696, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  7  -   Well No:  1-045/46(BK)7  Location:  Bhujai', '15', NULL, '1620109705859.jpg', 5.40000000000000036, 0.5, 4.90000000000000036, 0.149999999999999994, 4.75, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 175839482, 'a2c306e0-acd5-40f3-b239-c56985b5bf30', '2021-05-04T14:08:32', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 177, 177);
INSERT INTO public.gw_monitoring VALUES ('2021-05-04T11:53:37.677+05:45', '2021-05-04T11:57:57.654+05:45', '2021-05-04', '868190042176206', 'yogendra', 'Banke', '28.0812129 81.6451034 88.40708266797988 4.854', 28.0812129000000006, 81.6451033999999964, 88.4070826679798785, 4.85400000000000009, 'Shallow well', NULL, NULL, NULL, 'S.No:  16  -  Well No:  NISP/STW 1       Location:  Office compound', '54', NULL, '1620108720945.jpg', 6, 1.14999999999999991, 4.84999999999999964, 0.540000000000000036, 4.30999999999999961, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 175839467, '133c39dc-221d-4dde-9b55-1625ec2c6ebd', '2021-05-04T14:08:29', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 178, 178);
INSERT INTO public.gw_monitoring VALUES ('2021-04-30T16:25:32.671+05:45', '2021-04-30T16:29:14.404+05:45', '2021-04-30', '868190042176206', 'yogendra', 'Banke', '28.0817476 81.546588 109.66800213435707 4.854', 28.0817475999999999, 81.5465879999999999, 109.668002134357067, 4.85400000000000009, 'Deep well', NULL, NULL, 'S.No: 1  -  Well No:  SP-1    - Location:  K Gaon', NULL, '37', NULL, '1619779413679.jpg', 13, 1.5, 11.5, 0.369999999999999996, 11.1300000000000008, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 175310398, '30d4f4c9-1b94-4a96-976b-1a80f872c57c', '2021-05-02T06:12:36', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 179, 179);
INSERT INTO public.gw_monitoring VALUES ('2021-04-30T15:56:09.774+05:45', '2021-04-30T15:59:37.151+05:45', '2021-04-30', '868190042176206', 'yogendra', 'Banke', '28.096096 81.5211544 85.44713239862861 4.551', 28.0960959999999993, 81.5211544000000004, 85.4471323986286109, 4.55100000000000016, 'Deep well', NULL, NULL, 'S.No: 2  -  Well No:  SP-6    - Location:  L Gaon', NULL, '25', NULL, '1619777610024.jpg', 15, 3.45000000000000018, 11.5500000000000007, 0.25, 11.3000000000000007, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 175310394, '97a10b59-5d5c-4826-8c1d-147518bee8bb', '2021-05-02T06:12:35', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 180, 180);
INSERT INTO public.gw_monitoring VALUES ('2021-04-30T15:37:59.334+05:45', '2021-04-30T15:39:32.905+05:45', '2021-04-30', '868190042176206', 'yogendra', 'Banke', '28.1132901 81.5172898 83.52860872319646 4.551', 28.1132901000000004, 81.5172898000000004, 83.5286087231964558, 4.55100000000000016, 'Deep well', NULL, NULL, 'S.No: 4  -  Well No:  SP-13    - Location:  Gaughat', NULL, '49', NULL, '1619776443723.jpg', 15, 3.35000000000000009, 11.6500000000000004, 0.489999999999999991, 11.1600000000000001, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 175310392, '0c86d786-0756-47c9-882d-e54ebb93a189', '2021-05-02T06:12:33', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 181, 181);
INSERT INTO public.gw_monitoring VALUES ('2021-04-30T15:20:19.699+05:45', '2021-04-30T15:22:25.864+05:45', '2021-04-30', '868190042176206', 'yogendra', 'Banke', '28.1223559 81.5165505 83.68454144841976 4.551', 28.1223558999999987, 81.5165504999999939, 83.6845414484197647, 4.55100000000000016, 'Deep well', NULL, NULL, 'S.No: 3  -  Well No:  SP-9    - Location:  Gaughat', NULL, '42', NULL, '1619775410678.jpg', 13, 1.35000000000000009, 11.6500000000000004, 0.419999999999999984, 11.2300000000000004, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 175310387, '243d2ef2-4b13-4fcf-b345-79e784b9f8a7', '2021-05-02T06:12:31', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 182, 182);
INSERT INTO public.gw_monitoring VALUES ('2021-04-30T14:06:07.987+05:45', '2021-04-30T14:09:05.141+05:45', '2021-04-30', '868190042176206', 'yogendra', 'Banke', '28.1114846 81.521617 85.10593739864272 4.854', 28.1114846000000007, 81.5216170000000062, 85.1059373986427232, 4.85400000000000009, 'Shallow well', NULL, NULL, NULL, 'S.No:  14  -  Well No:  1-045/46(BK)19  Location:  Gaughat', '23', NULL, '1619770978905.jpg', 8, 1.94999999999999996, 6.04999999999999982, 0.23000000000000001, 5.82000000000000028, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 175310383, 'bc6bb72e-63f2-466a-8ac6-71e439393b20', '2021-05-02T06:12:29', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 183, 183);
INSERT INTO public.gw_monitoring VALUES ('2021-04-30T11:45:35.901+05:45', '2021-04-30T11:48:27.406+05:45', '2021-04-30', '868190042176206', 'yogendra', 'Banke', '28.0512932 81.6024374 91.96201722181954 4.803', 28.0512931999999999, 81.6024373999999995, 91.9620172218195364, 4.80299999999999994, 'Deep well', NULL, NULL, 'S.No: 5 - Well No. EXPT-7   - Location: Parspur', NULL, '27', NULL, '1619762533714.jpg', 7, 2.20000000000000018, 4.79999999999999982, 0.270000000000000018, 4.53000000000000025, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 175310376, 'c377bb64-5076-4939-a4d4-ddedb9fa8a79', '2021-05-02T06:12:26', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 184, 184);
INSERT INTO public.gw_monitoring VALUES ('2021-04-26T14:22:25.323+05:45', '2021-04-26T14:24:31.204+05:45', '2021-04-26', '868190042176206', 'yogendra', 'Banke', '28.146524 81.5519813 84.54793683203913 4.551', 28.1465239999999994, 81.5519812999999942, 84.5479368320391274, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  13  -  Well No:  1-045/46(BK)18  Location:  Kalhansgaon', '27', NULL, '1619426318271.jpg', 6, 1.69999999999999996, 4.29999999999999982, 0.270000000000000018, 4.03000000000000025, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 174064450, '98a4bd93-0c0d-4f37-a0ba-2399cbd91e1e', '2021-04-27T05:05:58', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 185, 185);
INSERT INTO public.gw_monitoring VALUES ('2021-04-26T13:41:33.870+05:45', '2021-04-26T13:43:24.372+05:45', '2021-04-26', '868190042176206', 'yogendra', 'Banke', '28.1287134 81.5893535 94.29315716249143 4.854', 28.1287133999999988, 81.5893535000000014, 94.2931571624914255, 4.85400000000000009, 'Shallow well', NULL, NULL, NULL, 'S.No:  12 -  Well No:  1-045/46(BK)17  Location:  D-gaon', '15', NULL, '1619423866535.jpg', 6, 1.75, 4.25, 0.149999999999999994, 4.09999999999999964, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 174064437, 'e19af711-fca4-477c-bcee-5fe9c2fe643c', '2021-04-27T05:05:56', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 186, 186);
INSERT INTO public.gw_monitoring VALUES ('2021-04-26T13:15:37.595+05:45', '2021-04-26T13:17:46.049+05:45', '2021-04-26', '868190042176206', 'yogendra', 'Banke', '28.1060556 81.5971341 90.17572515657702 4.803', 28.1060556000000012, 81.5971341000000052, 90.1757251565770162, 4.80299999999999994, 'Shallow well', NULL, NULL, NULL, 'S.No:  17  -  Well No:  NISP/INV/STW 8   Location:  Kajurakurda', '35', NULL, '1619422325402.jpg', 4.29999999999999982, 0.5, 3.79999999999999982, 0.349999999999999978, 3.45000000000000018, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 174064422, '7452a88f-6a2a-4b94-991d-662764dd41a3', '2021-04-27T05:05:52', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 187, 187);
INSERT INTO public.gw_monitoring VALUES ('2021-04-26T12:49:07.637+05:45', '2021-04-26T12:52:39.926+05:45', '2021-04-26', '868190042176206', 'yogendra', 'Banke', '28.083025 81.5955229 105.59481440471494 4.854', 28.0830249999999992, 81.595522900000006, 105.594814404714938, 4.85400000000000009, 'Shallow well', NULL, NULL, NULL, 'S.No:  19  -  Well No:  NISP/INV/STW 11  Location:  Ramapurwa', '40', NULL, '1619420814168.jpg', 5.20000000000000018, 0.5, 4.70000000000000018, 0.400000000000000022, 4.29999999999999982, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 174064413, '2e632d45-b0e8-4d47-984f-59b4e6040938', '2021-04-27T05:05:49', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 188, 188);
INSERT INTO public.gw_monitoring VALUES ('2021-04-26T12:23:13.427+05:45', '2021-04-26T12:25:33.515+05:45', '2021-04-26', '868190042176206', 'yogendra', 'Banke', '28.0780817 81.5932166 82.84832140103399 4.854', 28.0780816999999985, 81.5932166000000052, 82.848321401033985, 4.85400000000000009, 'Shallow well', NULL, NULL, NULL, 'S.No:  18  -  Well No:  NISP/INV/STW 10  Location:  Banjaregaon', '25', NULL, '1619419187062.jpg', 5, 1.66999999999999993, 3.33000000000000007, 0.25, 3.08000000000000007, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 174064402, '14fa30f3-574e-42f0-b55a-97d8b34434e0', '2021-04-27T05:05:47', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 189, 189);
INSERT INTO public.gw_monitoring VALUES ('2021-04-26T11:45:26.160+05:45', '2021-04-26T11:47:13.781+05:45', '2021-04-26', '868190042176206', 'yogendra', 'Banke', '28.050811 81.5861641 82.69485201608745 4.551', 28.0508109999999995, 81.5861641000000049, 82.6948520160874523, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  20  -  Well No:  n/a  Location:  Jaogagaun', '55', NULL, '1619416905211.jpg', 7, 1.05000000000000004, 5.95000000000000018, 0.550000000000000044, 5.40000000000000036, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 174064391, '2a1055b9-3b11-4b77-a2f6-355078ab4d20', '2021-04-27T05:05:43', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 190, 190);
INSERT INTO public.gw_monitoring VALUES ('2021-04-23T15:06:55.244+05:45', '2021-04-23T15:10:02.765+05:45', '2021-04-23', '868190042176206', 'yogendra', 'Banke', '28.0020628 81.6523544 84.81285054730857 4.551', 28.0020628000000009, 81.652354399999993, 84.812850547308571, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  21 -  Well No:  n/a  Location:  Baldipurwa', '40', NULL, '1619169838689.jpg', 7, 1.89999999999999991, 5.09999999999999964, 0.400000000000000022, 4.70000000000000018, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 174064383, 'a99a0b33-5e12-481f-927d-8188fe844c5a', '2021-04-27T05:05:41', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 191, 191);
INSERT INTO public.gw_monitoring VALUES ('2021-04-23T13:36:04.793+05:45', '2021-04-23T13:42:15.815+05:45', '2021-04-23', '868190042176206', 'yogendra', 'Banke', '28.0151007 81.6543121 89.52724814325752 4.854', 28.0151007000000014, 81.6543120999999985, 89.5272481432575233, 4.85400000000000009, 'Shallow well', NULL, NULL, NULL, 'S.No:  9  -   Well No:  1-045/46(BK)9  Location:  Sikhanpurwa', '60', NULL, '1619164594304.jpg', 5, 1.69999999999999996, 3.29999999999999982, 0.599999999999999978, 2.70000000000000018, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 174064377, '2a568c91-6ede-4e53-b496-214ed42ced0f', '2021-04-27T05:05:40', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 192, 192);
INSERT INTO public.gw_monitoring VALUES ('2021-04-23T12:31:17.918+05:45', '2021-04-23T12:34:47.798+05:45', '2021-04-23', '868190042176206', 'yogendra', 'Banke', '28.0242383 81.6002699 86.62625994039676 4.551', 28.0242383000000004, 81.6002699000000007, 86.6262599403967641, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  11  -  Well No:  1-045/46(BK)11  Location:  Jaishpur', '50', NULL, '1619160539905.jpg', 7, 1.45999999999999996, 5.54000000000000004, 0.5, 5.04000000000000004, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 174064371, 'b673997f-27eb-4544-85b2-4eb8c8028cd0', '2021-04-27T05:05:38', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 193, 193);
INSERT INTO public.gw_monitoring VALUES ('2021-04-22T14:17:34.339+05:45', '2021-04-22T14:20:36.615+05:45', '2021-04-22', '868190042176206', 'yogendra', 'Banke', '27.9833849 81.7132719 88.01714523602642 4.551', 27.9833849000000008, 81.7132718999999952, 88.0171452360264226, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  10  -  Well No:  1-045/46(BK)10  Location:  Kharaicha', '70', NULL, '1619080494796.jpg', 6, 2.16999999999999993, 3.83000000000000007, 0.699999999999999956, 3.12999999999999989, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 174064361, 'f74d431a-914e-40d4-862a-1d71e4c04f28', '2021-04-27T05:05:34', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 194, 194);
INSERT INTO public.gw_monitoring VALUES ('2021-04-22T13:32:08.367+05:45', '2021-04-22T13:34:29.048+05:45', '2021-04-22', '868190042176206', 'yogendra', 'Banke', '28.0285383 81.6947455 93.6523845583338 4.551', 28.028538300000001, 81.6947454999999962, 93.6523845583337931, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  22 -  Well No: n/a   Location:  Harbaldoli', '55', NULL, '1619077732047.jpg', 6, 1.05000000000000004, 4.95000000000000018, 0.550000000000000044, 4.40000000000000036, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 174064353, 'cfedd401-e261-4411-afe9-7cc3e7756b16', '2021-04-27T05:05:31', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 195, 195);
INSERT INTO public.gw_monitoring VALUES ('2021-04-22T12:19:25.626+05:45', '2021-04-22T12:23:02.507+05:45', '2021-04-22', '868190042176206', 'yogendra', 'Banke', '28.04937 81.6616595 96.96271786018812 4.854', 28.0493699999999997, 81.661659499999999, 96.9627178601881212, 4.85400000000000009, 'Shallow well', NULL, NULL, NULL, 'S.No:  8  -   Well No:  1-045/46(BK)8  Location:  Birta', '36', NULL, '1619073424944.jpg', 8, 1.19999999999999996, 6.79999999999999982, 0.359999999999999987, 6.44000000000000039, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 174064298, '8cd5e081-3ea4-4016-a565-acfb40ed6056', '2021-04-27T05:04:49', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 196, 196);
INSERT INTO public.gw_monitoring VALUES ('2021-04-07T15:56:41.581+05:45', '2021-04-07T15:59:42.187+05:45', '2021-04-07', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.071498 81.5555033 83.979209134853 4.854', 28.0714979999999983, 81.555503299999998, 83.9792091348529937, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  16   -  Well No: 16-045\46(B\D)16  - Location: Newlpur', NULL, NULL, '60', NULL, '1617790459317.jpg', 5, 1, 4, 0.599999999999999978, 3.39999999999999991, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 170890961, 'e72d3cec-2551-4fa3-98e4-633ba53b3ab6', '2021-04-11T07:46:27', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 197, 197);
INSERT INTO public.gw_monitoring VALUES ('2021-04-06T16:03:43.408+05:45', '2021-04-06T16:05:29.132+05:45', '2021-04-06', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.0730776 81.5542921 93.41935404156682 4.854', 28.0730776000000013, 81.5542920999999978, 93.4193540415668195, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  14   -  Well No: 14-045\46(B\D)14  - Location: Begnaha', NULL, NULL, '10', NULL, '1617704408680.jpg', 4, 1.5, 2.5, 0.100000000000000006, 2.39999999999999991, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 170890959, '284bf284-40fa-44fa-bd18-fd4eaf5bb48e', '2021-04-11T07:46:25', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 198, 198);
INSERT INTO public.gw_monitoring VALUES ('2021-04-06T15:53:12.080+05:45', '2021-04-06T16:03:23.401+05:45', '2021-04-06', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.0731597 81.5542048 89.54488569715397 4.803', 28.0731597000000015, 81.5542047999999937, 89.5448856971539726, 4.80299999999999994, 'Shallow well', NULL, 'S.No:  15   -  Well No: 15-045\46(B\D)15  - Location: Bhurigaon', NULL, NULL, '55', NULL, '1617704252975.jpg', 4, 1, 3, 0.550000000000000044, 2.45000000000000018, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 170890957, 'b4974615-614f-484a-b10f-08adcd0dead9', '2021-04-11T07:46:24', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 199, 199);
INSERT INTO public.gw_monitoring VALUES ('2021-04-04T15:42:07.475+05:45', '2021-04-04T15:44:46.198+05:45', '2021-04-04', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.3287679 81.2715464 121.20034075891353 4.551', 28.328767899999999, 81.2715464000000054, 121.200340758913526, 4.55100000000000016, 'Shallow well', NULL, 'S.No:  13   -  Well No: 13-045\46(B\D)13  - Location: Madhubhan', NULL, NULL, '10', NULL, '1617530369430.jpg', 5, 1.80000000000000004, 3.20000000000000018, 0.100000000000000006, 3.10000000000000009, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 170890954, '670252ea-1569-4025-bd3d-590f7374d53b', '2021-04-11T07:46:22', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 200, 200);
INSERT INTO public.gw_monitoring VALUES ('2021-04-04T15:27:52.180+05:45', '2021-04-04T15:30:34.330+05:45', '2021-04-04', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.2795566 81.2628796 101.39670729066788 4.803', 28.2795565999999994, 81.2628796000000051, 101.396707290667877, 4.80299999999999994, 'Shallow well', NULL, 'S.No:  12   -  Well No: 12-045\46(B\D)12  - Location: Taratal', NULL, NULL, '40', NULL, '1617529468798.jpg', 14, 2, 12, 0.400000000000000022, 11.5999999999999996, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 170890951, '507bfeb7-6eb9-47c0-9bd8-fc0179f58734', '2021-04-11T07:46:20', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 201, 201);
INSERT INTO public.gw_monitoring VALUES ('2021-04-04T15:09:36.078+05:45', '2021-04-04T15:12:02.959+05:45', '2021-04-04', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.2473471 81.3078664 104.48587272855438 4.803', 28.2473470999999989, 81.3078663999999947, 104.485872728554384, 4.80299999999999994, 'Shallow well', NULL, 'S.No:  9    -  Well No: 9-045\46(B\D)9  - Location: Khairapur', NULL, NULL, '50', NULL, '1617528411684.jpg', 7, 1.5, 5.5, 0.5, 5, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 170890946, '72c0491a-6ca5-4bb0-a615-84c2b2bd8ce1', '2021-04-11T07:46:17', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 202, 202);
INSERT INTO public.gw_monitoring VALUES ('2021-04-04T14:24:41.596+05:45', '2021-04-04T14:26:19.364+05:45', '2021-04-04', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.1691931 81.3378602 82.55503321299061 4.854', 28.1691931000000011, 81.3378601999999944, 82.5550332129906081, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  6    -  Well No: 6-045\46(B\D)6  - Location: Rain Nagar', NULL, NULL, '40', NULL, '1617525664441.jpg', 8, 1.5, 6.5, 0.400000000000000022, 6.09999999999999964, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 170890943, 'bd7efab9-2918-4626-9570-b5f1025d8943', '2021-04-11T07:46:15', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 203, 203);
INSERT INTO public.gw_monitoring VALUES ('2021-04-04T13:46:23.141+05:45', '2021-04-04T14:04:12.421+05:45', '2021-04-04', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.189743 81.3836249 83.74002506849011 4.854', 28.189743, 81.3836249000000009, 83.7400250684901124, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  5    -  Well No: 5-045\46(B\D)5  - Location: Bhaisahi', NULL, NULL, '30', NULL, '1617524345665.jpg', 6, 1, 5, 0.299999999999999989, 4.70000000000000018, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 170890941, '15dfb6e6-4724-45dc-8b8c-b1d35b372be2', '2021-04-11T07:46:12', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 204, 204);
INSERT INTO public.gw_monitoring VALUES ('2021-04-04T13:42:31.379+05:45', '2021-04-04T13:46:18.229+05:45', '2021-04-04', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.1880624 81.4799019 81.2009829044684 4.854', 28.1880623999999997, 81.4799019000000015, 81.2009829044684039, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  3    -  Well No: 3-045\46(B\D)3  - Location: Mainapokhar', NULL, NULL, '40', NULL, '1617523263847.jpg', 6, 1.19999999999999996, 4.79999999999999982, 0.400000000000000022, 4.40000000000000036, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 170890935, '8f9415e6-7cdd-49da-98fa-6c7c1b35c57b', '2021-04-11T07:46:11', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 205, 205);
INSERT INTO public.gw_monitoring VALUES ('2021-04-04T13:31:47.300+05:45', '2021-04-04T13:32:54.989+05:45', '2021-04-04', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.1656501 81.5008536 91.32159697499588 4.551', 28.1656501000000006, 81.5008535999999992, 91.3215969749958845, 4.55100000000000016, 'Shallow well', NULL, 'S.No:  17   -  Well No: 17-045\46(B\D)17  - Location: Thakurdwaar', NULL, NULL, '0', NULL, '1617522443840.jpg', 7, 1.89999999999999991, 5.09999999999999964, 0, 5.09999999999999964, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 170890933, 'e37eadc0-39b5-4a90-969d-b67cf3b0c072', '2021-04-11T07:46:09', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 206, 206);
INSERT INTO public.gw_monitoring VALUES ('2021-04-04T13:00:08.847+05:45', '2021-04-04T13:12:49.569+05:45', '2021-04-04', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.1463687 81.4791724 101.58299779638564 4.551', 28.1463687, 81.4791723999999959, 101.582997796385641, 4.55100000000000016, 'Shallow well', NULL, 'S.No:  19   -  Well No: n.a.                             - Location: Bhawanipur', NULL, NULL, '30', NULL, '1617521252392.jpg', 8, 1.80000000000000004, 6.20000000000000018, 0.299999999999999989, 5.90000000000000036, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 170890928, '9bc5e0ad-350b-4e0e-934c-053463cf539a', '2021-04-11T07:46:07', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 207, 207);
INSERT INTO public.gw_monitoring VALUES ('2021-04-04T12:57:00.386+05:45', '2021-04-04T12:59:58.373+05:45', '2021-04-04', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.1487395 81.4968819 80.50877891180384 4.854', 28.1487395000000014, 81.4968819000000053, 80.5087789118038444, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  18   -  Well No: NISP\INV\STW-5    - Location: Shoharawa', NULL, NULL, '40', NULL, '1617520483908.jpg', 6, 1, 5, 0.400000000000000022, 4.59999999999999964, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 170890923, '2106c058-8d72-45be-956a-9c53d90a8d88', '2021-04-11T07:46:05', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 208, 208);
INSERT INTO public.gw_monitoring VALUES ('2021-04-02T14:33:19.928+05:45', '2021-04-02T14:36:04.481+05:45', '2021-04-02', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.3061076 81.3596523 84.94281640751262 4.551', 28.3061076000000007, 81.3596522999999934, 84.9428164075126233, 4.55100000000000016, 'Shallow well', NULL, 'S.No:  11   -  Well No: 11-045\46(B\D)11  - Location: Baniyabhar', NULL, NULL, '75', NULL, '1617353380821.jpg', 6, 2, 4, 0.75, 3.25, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 170890919, '20afb2d0-85a1-4707-9fce-904c36b72d00', '2021-04-11T07:46:03', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 209, 209);
INSERT INTO public.gw_monitoring VALUES ('2021-04-02T14:23:33.495+05:45', '2021-04-02T14:33:16.169+05:45', '2021-04-02', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.3062642 81.3597118 89.7356624809828 4.551', 28.3062642000000011, 81.3597117999999995, 89.7356624809827963, 4.55100000000000016, 'Shallow well', NULL, 'S.No:  7    -  Well No: 7-045\46(B\D)7  - Location: Megara Gadhi', NULL, NULL, '45', NULL, '1617353269241.jpg', 6, 1.69999999999999996, 4.29999999999999982, 0.450000000000000011, 3.85000000000000009, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 170890915, '09312af2-da63-4681-b49f-e5576a7e601e', '2021-04-11T07:46:01', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 210, 210);
INSERT INTO public.gw_monitoring VALUES ('2021-04-02T14:21:04.650+05:45', '2021-04-02T14:23:30.384+05:45', '2021-04-02', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.3034656 81.3628923 93.84228750534798 4.551', 28.3034655999999991, 81.3628922999999986, 93.8422875053479828, 4.55100000000000016, 'Shallow well', NULL, 'S.No:  10   -  Well No: 10-045\46(B\D)10  - Location: Padnaha', NULL, NULL, '60', NULL, '1617352696314.jpg', 5, 1.19999999999999996, 3.79999999999999982, 0.599999999999999978, 3.20000000000000018, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 170890905, '1ef80958-2599-4928-b51a-6cd670d1ca45', '2021-04-11T07:45:58', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 211, 211);
INSERT INTO public.gw_monitoring VALUES ('2021-04-02T13:38:43.575+05:45', '2021-04-02T13:54:02.100+05:45', '2021-04-02', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.3512469 81.4297408 106.21650332250346 4.854', 28.3512468999999996, 81.4297408000000047, 106.216503322503456, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  8    -  Well No: 8-045\46(B\D)8  - Location: Auri', NULL, NULL, '40', NULL, '1617350893076.jpg', 5, 1, 4, 0.400000000000000022, 3.60000000000000009, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 170890903, '5dd170e4-bc8b-482f-a7e9-499463f86f84', '2021-04-11T07:45:57', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 212, 212);
INSERT INTO public.gw_monitoring VALUES ('2021-04-02T13:36:34.366+05:45', '2021-04-02T13:38:38.349+05:45', '2021-04-02', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.2898387 81.4420108 107.79121571638501 4.854', 28.2898387000000007, 81.4420108000000056, 107.791215716385011, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  4    -  Well No: 4-045\46(B\D)4  - Location: Bangai', NULL, NULL, '32', NULL, '1617350004052.jpg', 5, 1.69999999999999996, 3.29999999999999982, 0.320000000000000007, 2.97999999999999998, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 170890901, '29733185-b8d5-4eaf-8d2a-ab5e1004880f', '2021-04-11T07:45:54', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 213, 213);
INSERT INTO public.gw_monitoring VALUES ('2021-04-02T12:35:45.936+05:45', '2021-04-02T12:39:03.402+05:45', '2021-04-02', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.2364874 81.547728 87.96004384746297 4.551', 28.2364874000000015, 81.5477280000000064, 87.9600438474629698, 4.55100000000000016, 'Shallow well', NULL, 'S.No:  2    -  Well No: 2-045\46(B\D)2  - Location: Bakharikurd', NULL, NULL, '0', NULL, '1617346347895.jpg', 4, 1.69999999999999996, 2.29999999999999982, 0, 2.29999999999999982, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 170890896, 'b670ba3b-bbc8-4abd-8f44-dbe7cd167498', '2021-04-11T07:45:52', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 214, 214);
INSERT INTO public.gw_monitoring VALUES ('2021-04-02T12:18:24.811+05:45', '2021-04-02T12:38:26.775+05:45', '2021-04-02', 'collect:j4PTEWRBElBFPepF', 'anita', 'Bardiya', '28.2490794 81.5849847 104.17643321182874 4.854', 28.2490793999999994, 81.5849847000000068, 104.176433211828737, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  22   -  Well No: n.a.                            - Location: Belwa', NULL, NULL, '10', NULL, '1617345286882.jpg', 7, 1, 6, 0.100000000000000006, 5.90000000000000036, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 170890890, '9343a2d2-e7e2-4cbf-887b-9fc3d1cf2784', '2021-04-11T07:45:49', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 215, 215);
INSERT INTO public.gw_monitoring VALUES ('2021-04-02T12:06:53.991+05:45', '2021-04-02T12:18:21.464+05:45', '2021-04-02', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.2283231 81.5671834 99.89142916824524 4.803', 28.2283231000000008, 81.5671834000000047, 99.8914291682452387, 4.80299999999999994, 'Shallow well', NULL, 'S.No:  21   -  Well No: na.a                            - Location: Belwa', NULL, NULL, '40', NULL, '1617344682793.jpg', 8, 1.69999999999999996, 6.29999999999999982, 0.400000000000000022, 5.90000000000000036, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 170890884, '01c6c338-18b1-4205-bc3f-68305eddd3d2', '2021-04-11T07:45:47', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 216, 216);
INSERT INTO public.gw_monitoring VALUES ('2021-04-01T15:33:18.529+05:45', '2021-04-01T15:35:59.704+05:45', '2021-04-01', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.1056721 81.482622 97.9604413131479 4.551', 28.1056720999999996, 81.4826220000000063, 97.9604413131478964, 4.55100000000000016, 'Deep well', 'S.No:  2   -  Well No: DTW-6            - Location: Tholodafe', NULL, NULL, NULL, '10', NULL, '1617270632414.jpg', 13, 1, 12, 0.100000000000000006, 11.9000000000000004, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 170890872, 'ba837735-4524-425d-a66b-5c69f832326a', '2021-04-11T07:45:45', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 217, 217);
INSERT INTO public.gw_monitoring VALUES ('2021-04-01T15:12:08.259+05:45', '2021-04-01T15:18:26.081+05:45', '2021-04-01', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.0883862 81.5027232 100.62413342298225 4.551', 28.0883861999999986, 81.5027232000000055, 100.624133422982254, 4.55100000000000016, 'Deep well', 'S.No:  3   -  Well No: DTW-3             - Location: Shantipur', NULL, NULL, NULL, '20', NULL, '1617269550052.jpg', 14, 1.80000000000000004, 12.1999999999999993, 0.200000000000000011, 12, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 170890866, 'e4b9abb6-38d6-4863-9099-efe31a09c59e', '2021-04-11T07:45:41', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 218, 218);
INSERT INTO public.gw_monitoring VALUES ('2021-04-01T15:02:54.352+05:45', '2021-04-01T15:06:07.477+05:45', '2021-04-01', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.082907 81.5111801 99.5016497333836 4.803', 28.0829069999999987, 81.5111801000000042, 99.5016497333836014, 4.80299999999999994, 'Deep well', 'S.No:  4   -  Well No: DTW-10              - Location: Shantipur', NULL, NULL, NULL, '24', NULL, '1617268779291.jpg', 14, 3.79999999999999982, 10.1999999999999993, 0.239999999999999991, 9.96000000000000085, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 170890863, '3b7ce0e8-2614-452c-9943-97d6d57f8a71', '2021-04-11T07:45:38', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 219, 219);
INSERT INTO public.gw_monitoring VALUES ('2021-03-13T15:05:56.884+05:45', '2021-04-04T13:31:01.572+05:45', '2021-03-13', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.0852756 81.5164958 93.39883379549784 4.854', 28.0852755999999992, 81.5164958000000013, 93.3988337954978363, 4.85400000000000009, 'Deep well', 'S.No:  1   -  Well No: DTW-9              - Location: Shantipur', NULL, NULL, NULL, '25', NULL, '1617268305408.jpg', 15, 1, 14, 0.25, 13.75, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 170890856, 'affd8428-19d6-4d0d-9cdf-bd5f60680c28', '2021-04-11T07:45:34', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 220, 220);
INSERT INTO public.gw_monitoring VALUES ('2021-04-07T15:22:39.510+05:45', '2021-04-07T15:25:41.397+05:45', '2021-04-07', '868190042176206', 'yogendra', 'Banke', '28.0818634 81.5466079 82.31648677449924 4.854', 28.0818633999999996, 81.5466078999999979, 82.3164867744992392, 4.85400000000000009, 'Deep well', NULL, NULL, 'S.No: 1  -  Well No:  SP-1    - Location:  K Gaon', NULL, '37', NULL, '1617788339427.jpg', 15, 3.54999999999999982, 11.4499999999999993, 0.369999999999999996, 11.0800000000000001, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 170344300, '27897b72-6088-444b-8e63-8e8b01b0049f', '2021-04-08T07:24:55', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 221, 221);
INSERT INTO public.gw_monitoring VALUES ('2021-04-07T14:49:18.491+05:45', '2021-04-07T14:52:30.542+05:45', '2021-04-07', '868190042176206', 'yogendra', 'Banke', '28.0960803 81.5211436 83.4512369483592 4.551', 28.0960803000000006, 81.521143600000002, 83.4512369483591954, 4.55100000000000016, 'Deep well', NULL, NULL, 'S.No: 2  -  Well No:  SP-6    - Location:  L Gaon', NULL, '25', NULL, '1617786415562.jpg', 15, 3.54999999999999982, 11.4499999999999993, 0.25, 11.1999999999999993, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 170344291, '64893a29-2e3c-4172-beff-b5bec3ed25ef', '2021-04-08T07:24:52', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 222, 222);
INSERT INTO public.gw_monitoring VALUES ('2021-04-07T14:00:23.211+05:45', '2021-04-07T14:03:21.854+05:45', '2021-04-07', '868190042176206', 'yogendra', 'Banke', '28.1223001 81.5166134 85.04392023801582 4.551', 28.1223001000000004, 81.5166133999999971, 85.043920238015815, 4.55100000000000016, 'Deep well', NULL, NULL, 'S.No: 3  -  Well No:  SP-9    - Location:  Gaughat', NULL, '42', NULL, '1617783458596.jpg', 13, 1.44999999999999996, 11.5500000000000007, 0.419999999999999984, 11.1300000000000008, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 170344287, 'dfba8241-3268-4ad1-9580-e87ad46b6d98', '2021-04-08T07:24:51', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 223, 223);
INSERT INTO public.gw_monitoring VALUES ('2021-04-07T13:38:04.322+05:45', '2021-04-07T13:40:27.515+05:45', '2021-04-07', '868190042176206', 'yogendra', 'Banke', '28.1132041 81.5172749 84.55165311736327 4.854', 28.1132041000000008, 81.5172749000000039, 84.5516531173632728, 4.85400000000000009, 'Deep well', NULL, NULL, 'S.No: 4  -  Well No:  SP-13    - Location:  Gaughat', NULL, '49', NULL, '1617782074789.jpg', 15, 3.45000000000000018, 11.5500000000000007, 0.489999999999999991, 11.0600000000000005, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 170344281, 'b2bd4531-01f3-4c14-9bc0-94a246e5ba3e', '2021-04-08T07:24:49', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 224, 224);
INSERT INTO public.gw_monitoring VALUES ('2021-04-07T13:17:54.097+05:45', '2021-04-07T13:21:10.484+05:45', '2021-04-07', '868190042176206', 'yogendra', 'Banke', '28.1114016 81.521705 61.428869979187425 4.551', 28.1114016000000007, 81.5217049999999972, 61.4288699791874251, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  14  -  Well No:  1-045/46(BK)19  Location:  Gaughat', '23', NULL, '1617780878765.jpg', 7, 1.14999999999999991, 5.84999999999999964, 0.23000000000000001, 5.62000000000000011, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 170344273, '79c5a859-d011-461c-82b9-c1779143e483', '2021-04-08T07:24:46', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 225, 225);
INSERT INTO public.gw_monitoring VALUES ('2021-04-07T11:48:55.244+05:45', '2021-04-07T11:51:02.258+05:45', '2021-04-07', '868190042176206', 'yogendra', 'Banke', '28.0508057 81.5862265 87.09753899548474 4.803', 28.0508057000000015, 81.5862264999999951, 87.0975389954847401, 4.80299999999999994, 'Shallow well', NULL, NULL, NULL, 'S.No:  20  -  Well No:  n/a  Location:  Jaogagaun', '55', NULL, '1617775526622.jpg', 7, 1.5, 5.5, 0.550000000000000044, 4.95000000000000018, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 170344269, 'f33a5319-825d-4f8a-98cc-690a26cdff57', '2021-04-08T07:24:42', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 226, 226);
INSERT INTO public.gw_monitoring VALUES ('2021-04-07T11:17:12.230+05:45', '2021-04-07T11:19:40.150+05:45', '2021-04-07', '868190042176206', 'yogendra', 'Banke', '28.0513467 81.6024627 88.18992511762305 4.551', 28.0513466999999999, 81.6024627000000038, 88.1899251176230479, 4.55100000000000016, 'Deep well', NULL, NULL, 'S.No: 5 - Well No. EXPT-7   - Location: Parspur', NULL, '27', NULL, '1617773624169.jpg', 6, 1.39999999999999991, 4.59999999999999964, 0.270000000000000018, 4.33000000000000007, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 170344256, 'd314fe55-c3ef-4bee-b35c-0712849ded4b', '2021-04-08T07:24:38', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 227, 227);
INSERT INTO public.gw_monitoring VALUES ('2021-04-04T14:46:26.630+05:45', '2021-04-04T14:48:50.866+05:45', '2021-04-04', '868190042176206', 'yogendra', 'Banke', '28.0812185 81.645044 101.03061213006376 4.803', 28.0812184999999985, 81.6450439999999986, 101.030612130063759, 4.80299999999999994, 'Shallow well', NULL, NULL, NULL, 'S.No:  16  -  Well No:  NISP/STW 1       Location:  Office compound', '54', NULL, '1617526992787.jpg', 6, 1.55000000000000004, 4.45000000000000018, 0.540000000000000036, 3.91000000000000014, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 169613792, 'd26fe227-31e4-4cd9-a6d2-3fc5d9e8b042', '2021-04-04T16:33:00', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 228, 228);
INSERT INTO public.gw_monitoring VALUES ('2021-04-04T14:11:23.037+05:45', '2021-04-04T14:13:42.035+05:45', '2021-04-04', '868190042176206', 'yogendra', 'Banke', '28.0928489 81.6478628 94.33627246343464 4.854', 28.0928488999999999, 81.6478627999999986, 94.3362724634346392, 4.85400000000000009, 'Shallow well', NULL, NULL, NULL, 'S.No:  7  -   Well No:  1-045/46(BK)7  Location:  Bhujai', '15', NULL, '1617524875887.jpg', 4.95000000000000018, 0.5, 4.45000000000000018, 0.149999999999999994, 4.29999999999999982, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 169613791, '08ddfd6a-2ae5-4b53-82e2-aeb0c10451d6', '2021-04-04T16:32:58', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 229, 229);
INSERT INTO public.gw_monitoring VALUES ('2021-04-04T13:29:19.750+05:45', '2021-04-04T13:32:43.088+05:45', '2021-04-04', '868190042176206', 'yogendra', 'Banke', '28.1317973 81.6588377 98.44866010861558 4.803', 28.1317972999999988, 81.6588377000000065, 98.4486601086155844, 4.80299999999999994, 'Shallow well', NULL, NULL, NULL, 'S.No:  6  -   Well No:  1-045/46(BK)6  Location:  Piprahwa', '45', NULL, '1617522391168.jpg', 5, 2.25999999999999979, 2.74000000000000021, 0.450000000000000011, 2.29000000000000004, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 169613790, '78c61996-1109-47fa-b9b8-303d1d58dc0a', '2021-04-04T16:32:56', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 230, 230);
INSERT INTO public.gw_monitoring VALUES ('2021-04-03T14:47:20.667+05:45', '2021-04-03T14:49:51.687+05:45', '2021-04-03', '868190042176206', 'yogendra', 'Banke', '28.1465581 81.5519536 103.6786630334175 4.551', 28.1465581, 81.5519536000000045, 103.678663033417493, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  13  -  Well No:  1-045/46(BK)18  Location:  Kalhansgaon', '27', NULL, '1617440631374.jpg', 5, 1.08000000000000007, 3.91999999999999993, 0.270000000000000018, 3.64999999999999991, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 169613788, 'b6df7faa-c868-4768-b775-2d0a8cc55926', '2021-04-04T16:32:55', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 231, 231);
INSERT INTO public.gw_monitoring VALUES ('2021-04-03T13:49:01.362+05:45', '2021-04-03T13:51:00.184+05:45', '2021-04-03', '868190042176206', 'yogendra', 'Banke', '28.1287337 81.5893729 87.98446775075215 4.551', 28.1287337000000015, 81.5893729000000008, 87.9844677507521453, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  12 -  Well No:  1-045/46(BK)17  Location:  D-gaon', '15', NULL, '1617437127486.jpg', 5, 1.05000000000000004, 3.95000000000000018, 0.149999999999999994, 3.79999999999999982, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 169613783, '4d37c877-b2d6-43e3-b54d-b01799d4caac', '2021-04-04T16:32:52', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 232, 232);
INSERT INTO public.gw_monitoring VALUES ('2021-04-03T13:18:34.760+05:45', '2021-04-03T13:21:18.687+05:45', '2021-04-03', '868190042176206', 'yogendra', 'Banke', '28.1060287 81.5971035 84.74134994144606 4.551', 28.1060286999999995, 81.5971035000000029, 84.7413499414460603, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  17  -  Well No:  NISP/INV/STW 8   Location:  Kajurakurda', '35', NULL, '1617435324286.jpg', 4.09999999999999964, 0.5, 3.59999999999999964, 0.349999999999999978, 3.25, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 169613780, '9da267b1-6fb4-4b27-90ac-405b812315ea', '2021-04-04T16:32:51', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 233, 233);
INSERT INTO public.gw_monitoring VALUES ('2021-04-03T12:52:09.526+05:45', '2021-04-03T12:55:30.380+05:45', '2021-04-03', '868190042176206', 'yogendra', 'Banke', '28.0830206 81.5956341 76.27681261735586 4.803', 28.0830206000000011, 81.5956340999999981, 76.2768126173558585, 4.80299999999999994, 'Shallow well', NULL, NULL, NULL, 'S.No:  19  -  Well No:  NISP/INV/STW 11  Location:  Ramapurwa', '40', NULL, '1617433730849.jpg', 4.90000000000000036, 0.5, 4.40000000000000036, 0.400000000000000022, 4, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 169613776, '1c554694-8862-4fad-8f90-5d770bc5a307', '2021-04-04T16:32:50', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 234, 234);
INSERT INTO public.gw_monitoring VALUES ('2021-04-03T12:35:08.495+05:45', '2021-04-03T12:37:43.536+05:45', '2021-04-03', '868190042176206', 'yogendra', 'Banke', '28.078045 81.5932275 84.9956152614164 4.854', 28.0780449999999995, 81.5932274999999976, 84.995615261416404, 4.85400000000000009, 'Shallow well', NULL, NULL, NULL, 'S.No:  18  -  Well No:  NISP/INV/STW 10  Location:  Banjaregaon', '25', NULL, '1617432714589.jpg', 5, 1.91999999999999993, 3.08000000000000007, 0.25, 2.83000000000000007, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 169613773, 'a342460f-85a5-4e82-b54d-596e1f2c5fe4', '2021-04-04T16:32:48', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 235, 235);
INSERT INTO public.gw_monitoring VALUES ('2021-04-02T15:47:07.722+05:45', '2021-04-02T15:48:51.682+05:45', '2021-04-02', '868190042176206', 'yogendra', 'Banke', '28.1873992 81.6299874 104.63128751372183 4.551', 28.1873992000000015, 81.6299874000000045, 104.63128751372183, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  4  -   Well No:  1-045/46(BK)4  Location:  Channawa', '65', NULL, '1617357800714.jpg', 5, 2.06999999999999984, 2.93000000000000016, 0.650000000000000022, 2.2799999999999998, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 169613768, '3ad162bd-479e-4da8-bb99-3960936c1469', '2021-04-04T16:32:46', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 236, 236);
INSERT INTO public.gw_monitoring VALUES ('2021-04-02T14:51:43.540+05:45', '2021-04-02T14:53:40.342+05:45', '2021-04-02', '868190042176206', 'yogendra', 'Banke', '28.1920742 81.5747772 89.91490084008717 4.551', 28.1920742000000004, 81.5747771999999998, 89.9149008400871708, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  5  -   Well No:  1-045/46(BK)5  Location:  Thapawa', '29', NULL, '1617354488906.jpg', 5, 1.60000000000000009, 3.39999999999999991, 0.28999999999999998, 3.10999999999999988, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 169613764, 'fe157c24-33aa-4a7a-a2f3-feafbbdd7902', '2021-04-04T16:32:45', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 237, 237);
INSERT INTO public.gw_monitoring VALUES ('2021-04-02T14:09:31.376+05:45', '2021-04-02T14:11:28.772+05:45', '2021-04-02', '868190042176206', 'yogendra', 'Banke', '28.206532 81.6306905 107.15215606637075 4.803', 28.2065319999999993, 81.6306905, 107.15215606637075, 4.80299999999999994, 'Shallow well', NULL, NULL, NULL, 'S.No:  3  -   Well No:  1-045/46(BK)3  Location:  Banktuwa', '40', NULL, '1617351959302.jpg', 9, 1.75, 7.25, 0.400000000000000022, 6.84999999999999964, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 169613761, '35883564-653f-4447-9b4c-b7c91229cb16', '2021-04-04T16:32:43', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 238, 238);
INSERT INTO public.gw_monitoring VALUES ('2021-04-02T13:06:36.869+05:45', '2021-04-02T13:10:26.596+05:45', '2021-04-02', '868190042176206', 'yogendra', 'Banke', '28.1960804 81.7117424 127.62967228481328 4.854', 28.1960803999999996, 81.7117424000000057, 127.629672284813282, 4.85400000000000009, 'Shallow well', NULL, NULL, NULL, 'S.No:  1  -   Well No:  1-045/46(BK)1  Location:  Rohini Khola', '20', NULL, '1617348276175.jpg', 5, 1.34000000000000008, 3.66000000000000014, 0.200000000000000011, 3.45999999999999996, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 169613755, 'cb5c3ec1-c61b-4f59-9f6d-6912f22804cf', '2021-04-04T16:32:42', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 239, 239);
INSERT INTO public.gw_monitoring VALUES ('2021-04-01T15:21:54.298+05:45', '2021-04-01T15:25:40.542+05:45', '2021-04-01', '868190042176206', 'yogendra', 'Banke', '28.0493765 81.6617097 93.93173480873038 4.551', 28.049376500000001, 81.661709700000003, 93.9317348087303827, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  8  -   Well No:  1-045/46(BK)8  Location:  Birta', '36', NULL, '1617269975876.jpg', 8, 1.5, 6.5, 0.359999999999999987, 6.13999999999999968, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 169613751, '5a2cc654-ca97-4cb6-b934-2a45de65c5fe', '2021-04-04T16:32:40', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 240, 240);
INSERT INTO public.gw_monitoring VALUES ('2021-04-01T14:02:49.790+05:45', '2021-04-01T14:05:00.670+05:45', '2021-04-01', '868190042176206', 'yogendra', 'Banke', '27.98343 81.713307 73.34943673778383 4.551', 27.9834299999999985, 81.7133070000000004, 73.349436737783833, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  10  -  Well No:  1-045/46(BK)10  Location:  Kharaicha', '70', NULL, '1617265153311.jpg', 5, 1.22999999999999998, 3.77000000000000002, 0.699999999999999956, 3.06999999999999984, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 169613744, '447c40d0-a63a-40e8-a1d6-01ddef90dedc', '2021-04-04T16:32:38', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 241, 241);
INSERT INTO public.gw_monitoring VALUES ('2021-04-01T13:06:57.957+05:45', '2021-04-01T13:10:22.139+05:45', '2021-04-01', '868190042176206', 'yogendra', 'Banke', '28.0285641 81.6947339 83.35339274716405 4.854', 28.0285641000000005, 81.6947339000000028, 83.353392747164051, 4.85400000000000009, 'Shallow well', NULL, NULL, NULL, 'S.No:  22 -  Well No: n/a   Location:  Harbaldoli', '55', NULL, '1617261853194.jpg', 6, 1.14999999999999991, 4.84999999999999964, 0.550000000000000044, 4.29999999999999982, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 169613739, '003d32fb-5af3-4d51-947f-d1d5dd3bb5c7', '2021-04-04T16:32:36', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 242, 242);
INSERT INTO public.gw_monitoring VALUES ('2021-03-30T15:05:05.032+05:45', '2021-03-30T15:07:10.653+05:45', '2021-03-30', '868190042176206', 'yogendra', 'Banke', '28.002087 81.652334 74.79502092410074 4.803', 28.0020869999999995, 81.6523339999999962, 74.79502092410074, 4.80299999999999994, 'Shallow well', NULL, NULL, NULL, 'S.No:  21 -  Well No:  n/a  Location:  Baldipurwa', '40', NULL, '1617096098800.jpg', 7, 2.04999999999999982, 4.95000000000000018, 0.400000000000000022, 4.54999999999999982, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 169613733, 'f68a236a-ec33-4b8d-8692-302553e7d317', '2021-04-04T16:32:34', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 243, 243);
INSERT INTO public.gw_monitoring VALUES ('2021-03-30T13:59:03.933+05:45', '2021-03-30T14:01:46.760+05:45', '2021-03-30', '868190042176206', 'yogendra', 'Banke', '28.0150979 81.6543421 79.45554699138219 4.854', 28.0150979000000007, 81.6543420999999938, 79.4555469913821923, 4.85400000000000009, 'Shallow well', NULL, NULL, NULL, 'S.No:  9  -   Well No:  1-045/46(BK)9  Location:  Sikhanpurwa', '60', NULL, '1617092172271.jpg', 5, 1.80000000000000004, 3.20000000000000018, 0.599999999999999978, 2.60000000000000009, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 169613726, 'acf647fe-915b-40b8-aa06-87ae5dd65032', '2021-04-04T16:32:32', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 244, 244);
INSERT INTO public.gw_monitoring VALUES ('2021-03-30T12:42:35.848+05:45', '2021-03-30T12:45:20.479+05:45', '2021-03-30', '868190042176206', 'yogendra', 'Banke', '28.0243004 81.6002834 85.53872048691571 4.551', 28.0243004000000013, 81.600283399999995, 85.5387204869157074, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  11  -  Well No:  1-045/46(BK)11  Location:  Jaishpur', '50', NULL, '1617087570972.jpg', 7, 1.60000000000000009, 5.40000000000000036, 0.5, 4.90000000000000036, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 169613717, '83831036-da31-461e-8ea2-9b83a05aad70', '2021-04-04T16:32:28', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 245, 245);
INSERT INTO public.gw_monitoring VALUES ('2021-03-11T18:32:49.780+05:45', '2021-03-11T18:36:35.217+05:45', '2021-03-11', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.0731672 81.5542815 104.94542163409031 4.551', 28.0731672000000003, 81.5542815000000019, 104.945421634090309, 4.55100000000000016, 'Shallow well', NULL, 'S.No:  14   -  Well No: 14-045\46(B\D)14  - Location: Begnaha', NULL, NULL, '10', NULL, '1615467040141.jpg', 3, 0.800000000000000044, 2.20000000000000018, 0.100000000000000006, 2.10000000000000009, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 164393758, 'e56b26da-f627-4ee8-b942-b4af160530fd', '2021-03-12T06:47:57', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 246, 246);
INSERT INTO public.gw_monitoring VALUES ('2021-03-11T17:46:35.909+05:45', '2021-03-11T18:32:46.884+05:45', '2021-03-11', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.0731024 81.5542315 86.99709783240762 4.854', 28.0731023999999998, 81.5542315000000002, 86.9970978324076185, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  16   -  Well No: 16-045\46(B\D)16  - Location: Newlpur', NULL, NULL, '60', NULL, '1615464192244.jpg', 4, 0.5, 3.5, 0.599999999999999978, 2.89999999999999991, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 164393752, '00378575-1a08-4125-ac9d-03f7ed7fa488', '2021-03-12T06:47:56', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 247, 247);
INSERT INTO public.gw_monitoring VALUES ('2021-03-11T16:08:33.333+05:45', '2021-03-11T16:13:41.954+05:45', '2021-03-11', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.0714983 81.5555563 99.08029075331622 4.551', 28.0714982999999982, 81.5555563000000063, 99.0802907533162198, 4.55100000000000016, 'Shallow well', NULL, 'S.No:  15   -  Well No: 15-045\46(B\D)15  - Location: Bhurigaon', NULL, NULL, '55', NULL, '1615458312944.jpg', 3, 0.800000000000000044, 2.20000000000000018, 0.550000000000000044, 1.64999999999999991, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 164393744, '5c5ca2de-2d97-4ce7-bf46-eeec8a9cca72', '2021-03-12T06:47:54', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 248, 248);
INSERT INTO public.gw_monitoring VALUES ('2021-03-11T13:39:44.958+05:45', '2021-03-11T13:42:59.896+05:45', '2021-03-11', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.3350722 81.266166 111.60088699702597 4.803', 28.335072199999999, 81.2661659999999983, 111.600886997025967, 4.80299999999999994, 'Shallow well', NULL, 'S.No:  13   -  Well No: 13-045\46(B\D)13  - Location: Madhubhan', NULL, NULL, '10', NULL, '1615449415706.jpg', 4, 1, 3, 0.100000000000000006, 2.89999999999999991, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 164393732, '179e3700-ba5e-40e8-8c9f-9b25ad989c21', '2021-03-12T06:47:52', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 249, 249);
INSERT INTO public.gw_monitoring VALUES ('2021-03-11T13:20:39.499+05:45', '2021-03-11T13:21:32.850+05:45', '2021-03-11', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.2794958 81.2629023 107.03814142257802 4.854', 28.2794957999999994, 81.2629022999999933, 107.038141422578022, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  12   -  Well No: 12-045\46(B\D)12  - Location: Taratal', NULL, NULL, '40', NULL, '1615448182020.jpg', 12, 0.800000000000000044, 11.1999999999999993, 0.400000000000000022, 10.8000000000000007, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 164393722, 'fcaef614-2f88-4a2d-b6c9-0ec8e4574434', '2021-03-12T06:47:49', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 250, 250);
INSERT INTO public.gw_monitoring VALUES ('2021-03-11T13:00:09.616+05:45', '2021-03-11T13:01:39.413+05:45', '2021-03-11', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.2486034 81.3085296 90.5413812870741 4.803', 28.2486034000000004, 81.3085296, 90.5413812870741026, 4.80299999999999994, 'Shallow well', NULL, 'S.No:  9    -  Well No: 9-045\46(B\D)9  - Location: Khairapur', NULL, NULL, '50', NULL, '1615446963584.jpg', 6, 0.800000000000000044, 5.20000000000000018, 0.5, 4.70000000000000018, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 164393710, '0d104671-7ee8-46d1-bca8-e07ac061780d', '2021-03-12T06:47:47', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 251, 251);
INSERT INTO public.gw_monitoring VALUES ('2021-03-11T12:40:07.216+05:45', '2021-03-11T12:43:18.998+05:45', '2021-03-11', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.2384443 81.2889979 99.38020721660625 4.551', 28.2384443000000012, 81.2889978999999983, 99.3802072166062516, 4.55100000000000016, 'Shallow well', NULL, 'S.No:  23   -  Well No: n.a.                            - Location: Janaki Tool', NULL, NULL, '20', NULL, '1615445888787.jpg', 11, 1, 10, 0.200000000000000011, 9.80000000000000071, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 164393698, '516d4104-26c9-43b0-99c0-e25bb39ce021', '2021-03-12T06:47:44', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 252, 252);
INSERT INTO public.gw_monitoring VALUES ('2021-03-07T13:18:30.855+05:45', '2021-03-07T13:20:26.955+05:45', '2021-03-07', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.3062108 81.3598135 118.06436491626144 4.803', 28.3062107999999988, 81.3598135000000013, 118.064364916261439, 4.80299999999999994, 'Shallow well', NULL, 'S.No:  11   -  Well No: 11-045\46(B\D)11  - Location: Baniyabhar', NULL, NULL, '75', NULL, '1615102493359.jpg', 4, 0.400000000000000022, 3.60000000000000009, 0.75, 2.85000000000000009, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 164393688, 'b9d82c63-2afc-40cf-9c1e-d7726a3e7fca', '2021-03-12T06:47:42', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 253, 253);
INSERT INTO public.gw_monitoring VALUES ('2021-03-07T13:12:29.892+05:45', '2021-03-07T13:15:00.881+05:45', '2021-03-07', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.3056749 81.3593067 100.86351665322108 4.803', 28.3056748999999996, 81.3593067000000048, 100.863516653221083, 4.80299999999999994, 'Shallow well', NULL, 'S.No:  7    -  Well No: 7-045\46(B\D)7  - Location: Megara Gadhi', NULL, NULL, '45', NULL, '1615102181819.jpg', 5, 0.900000000000000022, 4.09999999999999964, 0.450000000000000011, 3.64999999999999991, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 164393677, '483b051a-6157-4786-a7fb-1f66bf23ed07', '2021-03-12T06:47:40', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 254, 254);
INSERT INTO public.gw_monitoring VALUES ('2021-03-07T12:59:18.296+05:45', '2021-03-07T13:01:01.508+05:45', '2021-03-07', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.3014031 81.336592 104.1813218362487 4.854', 28.3014031000000017, 81.336591999999996, 104.181321836248699, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  10   -  Well No: 10-045\46(B\D)10  - Location: Padnaha', NULL, NULL, '60', NULL, '1615101353973.jpg', 4, 0.800000000000000044, 3.20000000000000018, 0.599999999999999978, 2.60000000000000009, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 164393671, '5c208fa7-648d-46cf-88b6-046c3f577093', '2021-03-12T06:47:39', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 255, 255);
INSERT INTO public.gw_monitoring VALUES ('2021-03-07T12:26:57.504+05:45', '2021-03-07T12:27:50.603+05:45', '2021-03-07', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.3512284 81.4297636 119.67341249566695 4.854', 28.3512284000000001, 81.4297636000000011, 119.673412495666952, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  8    -  Well No: 8-045\46(B\D)8  - Location: Auri', NULL, NULL, '40', NULL, '1615099359014.jpg', 4, 0.800000000000000044, 3.20000000000000018, 0.400000000000000022, 2.79999999999999982, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 164393659, 'e26b1791-5750-4165-b739-327156eeeec0', '2021-03-12T06:47:37', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 256, 256);
INSERT INTO public.gw_monitoring VALUES ('2021-03-07T12:13:16.734+05:45', '2021-03-07T12:14:58.886+05:45', '2021-03-07', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.2898343 81.4420493 126.95142862473695 4.854', 28.289834299999999, 81.4420492999999937, 126.951428624736948, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  4    -  Well No: 4-045\46(B\D)4  - Location: Bangai', NULL, NULL, '32', NULL, '1615098580386.jpg', 4, 0.900000000000000022, 3.10000000000000009, 0.320000000000000007, 2.7799999999999998, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 164393648, '69a76a7d-e0fb-43ab-9ed1-25555e28e0e7', '2021-03-12T06:47:34', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 257, 257);
INSERT INTO public.gw_monitoring VALUES ('2021-03-07T11:22:09.562+05:45', '2021-03-07T11:23:25.240+05:45', '2021-03-07', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.2282382 81.5671037 115.9142519379145 4.854', 28.2282381999999998, 81.5671037000000041, 115.9142519379145, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  21   -  Well No: na.a                            - Location: Belwa', NULL, NULL, '40', NULL, '1615095487109.jpg', 7, 0.800000000000000044, 6.20000000000000018, 0.400000000000000022, 5.79999999999999982, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 164393639, '5b755e35-c141-4d71-9513-dc4acb50d070', '2021-03-12T06:47:32', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 258, 258);
INSERT INTO public.gw_monitoring VALUES ('2021-03-07T11:06:48.273+05:45', '2021-03-07T11:09:15.931+05:45', '2021-03-07', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.2491036 81.5849593 108.6977505978707 4.551', 28.2491036000000015, 81.5849592999999942, 108.697750597870694, 4.55100000000000016, 'Shallow well', NULL, 'S.No:  22   -  Well No: n.a.                            - Location: Belwa', NULL, NULL, '10', NULL, '1615094637536.jpg', 6, 0.800000000000000044, 5.20000000000000018, 0.100000000000000006, 5.09999999999999964, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 164393632, 'a28c0f4a-b995-4809-a2ca-1530cb38e584', '2021-03-12T06:47:31', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 259, 259);
INSERT INTO public.gw_monitoring VALUES ('2021-03-07T10:45:02.350+05:45', '2021-03-07T10:49:41.334+05:45', '2021-03-07', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.2363902 81.5476911 101.27054109400545 4.551', 28.2363901999999989, 81.5476910999999944, 101.270541094005452, 4.55100000000000016, 'Shallow well', NULL, 'S.No:  2    -  Well No: 2-045\46(B\D)2  - Location: Bakharikurd', NULL, NULL, '0', NULL, '1615093447993.jpg', 2.5, 0.400000000000000022, 2.10000000000000009, 0, 2.10000000000000009, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 164393625, '1d84dbef-cf7a-40d7-be75-340b038e4111', '2021-03-12T06:47:29', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 260, 260);
INSERT INTO public.gw_monitoring VALUES ('2021-03-02T14:01:15.169+05:45', '2021-03-02T14:04:17.909+05:45', '2021-03-02', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.1691837 81.3378857 96.73433746866007 4.854', 28.1691837000000014, 81.3378857000000011, 96.7343374686600725, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  6    -  Well No: 6-045\46(B\D)6  - Location: Rain Nagar', NULL, NULL, '40', NULL, '1614673144968.jpg', 8, 2, 6, 0.400000000000000022, 5.59999999999999964, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 164393616, '069703dd-c300-424d-82d2-c6bb02d2794a', '2021-03-12T06:47:26', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 261, 261);
INSERT INTO public.gw_monitoring VALUES ('2021-03-02T13:38:19.481+05:45', '2021-03-02T13:40:04.910+05:45', '2021-03-02', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.1897781 81.3836074 94.92469693880524 4.803', 28.1897781000000016, 81.3836074000000025, 94.9246969388052406, 4.80299999999999994, 'Shallow well', NULL, 'S.No:  5    -  Well No: 5-045\46(B\D)5  - Location: Bhaisahi', NULL, NULL, '30', NULL, '1614671694358.jpg', 6, 1, 5, 0.299999999999999989, 4.70000000000000018, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 164393604, '4c08ccf7-f2cc-4f34-ac85-e86b112fc723', '2021-03-12T06:47:23', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 262, 262);
INSERT INTO public.gw_monitoring VALUES ('2021-03-02T13:19:34.181+05:45', '2021-03-02T13:21:33.704+05:45', '2021-03-02', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.1880313 81.4798915 121.2782591623503 4.803', 28.1880312999999987, 81.4798914999999937, 121.278259162350295, 4.80299999999999994, 'Shallow well', NULL, 'S.No:  3    -  Well No: 3-045\46(B\D)3  - Location: Mainapokhar', NULL, NULL, '40', NULL, '1614670524082.jpg', 5, 0.599999999999999978, 4.40000000000000036, 0.400000000000000022, 4, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 164393598, '04af1946-e914-41b4-a14c-104e77c7b6bf', '2021-03-12T06:47:21', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 263, 263);
INSERT INTO public.gw_monitoring VALUES ('2021-03-02T13:08:18.910+05:45', '2021-03-02T13:11:33.806+05:45', '2021-03-02', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.1656437 81.5007906 102.14761240311637 4.854', 28.1656437000000004, 81.500790600000002, 102.147612403116369, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  18   -  Well No: NISP\INV\STW-5    - Location: Shoharawa', NULL, NULL, '40', NULL, '1614669926617.jpg', 5, 0.400000000000000022, 4.59999999999999964, 0.400000000000000022, 4.20000000000000018, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 164393588, '89a60051-9430-45cc-b1eb-28b48de454c1', '2021-03-12T06:47:19', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 264, 264);
INSERT INTO public.gw_monitoring VALUES ('2021-03-02T12:52:55.475+05:45', '2021-03-02T12:54:32.468+05:45', '2021-03-02', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.1464325 81.4790871 114.80654216916955 4.551', 28.1464324999999995, 81.479087100000001, 114.806542169169546, 4.55100000000000016, 'Shallow well', NULL, 'S.No:  19   -  Well No: n.a.                             - Location: Bhawanipur', NULL, NULL, '30', NULL, '1614668942100.jpg', 7, 1, 6, 0.299999999999999989, 5.70000000000000018, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 164393581, '7be08cae-d15c-480a-9525-3e079654e3d6', '2021-03-12T06:47:17', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 265, 265);
INSERT INTO public.gw_monitoring VALUES ('2021-03-02T12:35:54.394+05:45', '2021-03-02T12:40:52.693+05:45', '2021-03-02', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.1486586 81.4968512 114.17191698239404 4.551', 28.148658600000001, 81.4968511999999947, 114.171916982394038, 4.55100000000000016, 'Shallow well', NULL, 'S.No:  20   -  Well No: NISP\INV\STW-6    - Location: Shoharawa', NULL, NULL, '70', NULL, '1614668128299.jpg', 5, 0.5, 4.5, 0.699999999999999956, 3.79999999999999982, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 164393575, 'beda0d5f-48eb-4063-bc79-5a0f046d3e93', '2021-03-12T06:47:15', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 266, 266);
INSERT INTO public.gw_monitoring VALUES ('2021-02-28T12:29:05.176+05:45', '2021-02-28T12:31:17.208+05:45', '2021-02-28', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.1056335 81.4826266 101.64972244421142 4.551', 28.1056334999999997, 81.4826266000000032, 101.64972244421142, 4.55100000000000016, 'Deep well', 'S.No:  2   -  Well No: DTW-6            - Location: Tholodafe', NULL, NULL, NULL, '10', NULL, '1614494750699.jpg', 15, 4, 11, 0.100000000000000006, 10.9000000000000004, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 164393571, '0825acc1-2f63-4079-b7bc-fb96636bc80d', '2021-03-12T06:47:14', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 267, 267);
INSERT INTO public.gw_monitoring VALUES ('2021-02-28T12:06:46.409+05:45', '2021-02-28T12:09:19.328+05:45', '2021-02-28', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.0883672 81.5027316 93.64420265399683 4.854', 28.0883672000000004, 81.5027316000000042, 93.6442026539968282, 4.85400000000000009, 'Deep well', 'S.No:  3   -  Well No: DTW-3             - Location: Shantipur', NULL, NULL, NULL, '20', NULL, '1614493426131.jpg', 13, 1, 12, 0.200000000000000011, 11.8000000000000007, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 164393565, '46ac14b1-ecd2-4a42-8885-c5b6601052ae', '2021-03-12T06:47:12', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 268, 268);
INSERT INTO public.gw_monitoring VALUES ('2021-02-28T11:55:45.840+05:45', '2021-02-28T11:58:23.918+05:45', '2021-02-28', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.0828814 81.5111584 96.91293395289823 4.854', 28.0828814000000015, 81.5111583999999993, 96.9129339528982285, 4.85400000000000009, 'Deep well', 'S.No:  4   -  Well No: DTW-10              - Location: Shantipur', NULL, NULL, NULL, '24', NULL, '1614492776459.jpg', 14, 4, 10, 0.239999999999999991, 9.75999999999999979, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 164393558, '0af41510-5b72-4dc1-8d61-0856ac10225a', '2021-03-12T06:47:10', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 269, 269);
INSERT INTO public.gw_monitoring VALUES ('2021-02-25T21:27:34.810+05:45', '2021-02-28T11:45:59.522+05:45', '2021-02-25', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.0852203 81.5164757 101.26572693436447 4.854', 28.0852202999999996, 81.5164757000000009, 101.265726934364466, 4.85400000000000009, 'Deep well', 'S.No:  1   -  Well No: DTW-9              - Location: Shantipur', NULL, NULL, NULL, '25', NULL, '1614491891922.jpg', 13, 0.800000000000000044, 12.1999999999999993, 0.25, 11.9499999999999993, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 164393550, '898914bd-f8d7-4608-a8dc-a64983e3052f', '2021-03-12T06:47:08', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 270, 270);
INSERT INTO public.gw_monitoring VALUES ('2021-03-03T14:41:11.361+05:45', '2021-03-03T14:43:32.268+05:45', '2021-03-03', '868190042176206', 'yogendra', 'Banke', '27.9834125 81.7133541 89.83573954444914 4.803', 27.9834125, 81.7133541000000037, 89.8357395444491402, 4.80299999999999994, 'Shallow well', NULL, NULL, NULL, 'S.No:  10  -  Well No:  1-045/46(BK)10  Location:  Kharaicha', '70', NULL, '1614761855899.jpg', 5, 1.33000000000000007, 3.66999999999999993, 0.699999999999999956, 2.9700000000000002, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 162694966, '0885b2cb-e6da-4b4f-8b61-444a56e9504f', '2021-03-04T12:51:08', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 271, 271);
INSERT INTO public.gw_monitoring VALUES ('2021-03-03T13:44:04.183+05:45', '2021-03-03T13:46:38.352+05:45', '2021-03-03', '868190042176206', 'yogendra', 'Banke', '28.0285545 81.6946709 100.51913615300215 4.551', 28.0285544999999985, 81.6946709000000055, 100.519136153002151, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  22 -  Well No: n/a   Location:  Harbaldoli', '55', NULL, '1614758460244.jpg', 6, 1.30000000000000004, 4.70000000000000018, 0.550000000000000044, 4.15000000000000036, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 162694957, 'c4de330b-7b2e-4b1b-aad9-b627bbe7d8e5', '2021-03-04T12:51:06', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 272, 272);
INSERT INTO public.gw_monitoring VALUES ('2021-03-03T13:00:52.656+05:45', '2021-03-03T13:04:09.202+05:45', '2021-03-03', '868190042176206', 'yogendra', 'Banke', '28.0494204 81.6616308 95.60796911318198 4.551', 28.0494203999999989, 81.6616307999999975, 95.60796911318198, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  8  -   Well No:  1-045/46(BK)8  Location:  Birta', '36', NULL, '1614755908678.jpg', 8, 1.64999999999999991, 6.34999999999999964, 0.359999999999999987, 5.99000000000000021, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 162694950, 'f7680a77-df2f-4a80-839b-e7a35b26f801', '2021-03-04T12:51:04', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 273, 273);
INSERT INTO public.gw_monitoring VALUES ('2021-03-02T15:45:22.599+05:45', '2021-03-02T15:49:52.958+05:45', '2021-03-02', '868190042176206', 'yogendra', 'Banke', '28.0818033 81.5465529 103.48403618550809 4.803', 28.0818033000000007, 81.5465528999999947, 103.484036185508089, 4.80299999999999994, 'Deep well', NULL, NULL, 'S.No: 1  -  Well No:  SP-1    - Location:  K Gaon', NULL, '37', NULL, '1614679327643.jpg', 13, 1.64999999999999991, 11.3499999999999996, 0.369999999999999996, 10.9800000000000004, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 162694943, '524f51a2-0b43-4749-ade5-2a48e268170a', '2021-03-04T12:51:02', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 274, 274);
INSERT INTO public.gw_monitoring VALUES ('2021-03-02T15:13:35.163+05:45', '2021-03-02T15:18:29.438+05:45', '2021-03-02', '868190042176206', 'yogendra', 'Banke', '28.0959921 81.521179 94.74799728729445 4.854', 28.0959921000000001, 81.5211790000000036, 94.7479972872944529, 4.85400000000000009, 'Deep well', NULL, NULL, 'S.No: 2  -  Well No:  SP-6    - Location:  L Gaon', NULL, '25', NULL, '1614677524474.jpg', 15, 3.64999999999999991, 11.3499999999999996, 0.25, 11.0999999999999996, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 162694930, '17acbc37-8906-45f4-b68a-92df261ebfe8', '2021-03-04T12:50:59', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 275, 275);
INSERT INTO public.gw_monitoring VALUES ('2021-03-02T14:44:24.231+05:45', '2021-03-02T14:46:22.988+05:45', '2021-03-02', '868190042176206', 'yogendra', 'Banke', '28.1222988 81.5166218 98.51146259885857 4.551', 28.1222987999999994, 81.5166217999999958, 98.5114625988585715, 4.55100000000000016, 'Deep well', NULL, NULL, 'S.No: 3  -  Well No:  SP-9    - Location:  Gaughat', NULL, '42', NULL, '1614675646765.jpg', 13, 1.55000000000000004, 11.4499999999999993, 0.419999999999999984, 11.0299999999999994, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 162694888, 'e7f04c51-1993-4a70-8b3b-28ee886e1bb0', '2021-03-04T12:50:51', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 276, 276);
INSERT INTO public.gw_monitoring VALUES ('2021-03-02T14:23:02.589+05:45', '2021-03-02T14:25:15.327+05:45', '2021-03-02', '868190042176206', 'yogendra', 'Banke', '28.1132621 81.5173494 102.95116262915187 4.803', 28.1132621, 81.5173494000000005, 102.951162629151867, 4.80299999999999994, 'Deep well', NULL, NULL, 'S.No: 4  -  Well No:  SP-13    - Location:  Gaughat', NULL, '49', NULL, '1614674365777.jpg', 15, 3.60000000000000009, 11.4000000000000004, 0.489999999999999991, 10.9100000000000001, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 162694832, '7b28cf2e-8500-441f-91f5-4bede0476d9e', '2021-03-04T12:50:45', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 277, 277);
INSERT INTO public.gw_monitoring VALUES ('2021-03-02T13:42:31.582+05:45', '2021-03-02T13:46:14.769+05:45', '2021-03-02', '868190042176206', 'yogendra', 'Banke', '28.1114455 81.5216505 96.5277953917899 4.854', 28.1114454999999985, 81.5216505000000069, 96.5277953917898941, 4.85400000000000009, 'Shallow well', NULL, NULL, NULL, 'S.No:  14  -  Well No:  1-045/46(BK)19  Location:  Gaughat', '23', NULL, '1614672001093.jpg', 7, 1.5, 5.5, 0.23000000000000001, 5.26999999999999957, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 162694818, '70fc44d9-719f-46d4-b326-debfb45b2ca3', '2021-03-04T12:50:43', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 278, 278);
INSERT INTO public.gw_monitoring VALUES ('2021-03-02T12:15:46.015+05:45', '2021-03-02T12:18:56.853+05:45', '2021-03-02', '868190042176206', 'yogendra', 'Banke', '28.0513296 81.6024401 99.78216916808152 4.803', 28.051329599999999, 81.6024400999999955, 99.7821691680815235, 4.80299999999999994, 'Deep well', NULL, NULL, 'S.No: 5 - Well No. EXPT-7   - Location: Parspur', NULL, '27', NULL, '1614666789125.jpg', 6, 1.80000000000000004, 4.20000000000000018, 0.270000000000000018, 3.93000000000000016, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 162694808, '14e96b83-70e8-4abd-8674-53ba5b1de3a0', '2021-03-04T12:50:41', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 279, 279);
INSERT INTO public.gw_monitoring VALUES ('2021-03-01T14:14:20.998+05:45', '2021-03-01T14:16:44.146+05:45', '2021-03-01', '868190042176206', 'yogendra', 'Banke', '28.1465538 81.5519786 99.09388732335618 4.551', 28.1465537999999995, 81.5519785999999982, 99.093887323356185, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  13  -  Well No:  1-045/46(BK)18  Location:  Kalhansgaon', '27', NULL, '1614587453166.jpg', 5, 1.60000000000000009, 3.39999999999999991, 0.270000000000000018, 3.12999999999999989, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 162694790, 'fe2831f8-d185-481d-9dac-cbf9df12e58f', '2021-03-04T12:50:38', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 280, 280);
INSERT INTO public.gw_monitoring VALUES ('2021-03-01T13:18:49.461+05:45', '2021-03-01T13:21:36.726+05:45', '2021-03-01', '868190042176206', 'yogendra', 'Banke', '28.1060812 81.5971233 104.21288580035973 4.551', 28.1060811999999984, 81.5971233000000069, 104.212885800359729, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  17  -  Well No:  NISP/INV/STW 8   Location:  Kajurakurda', '35', NULL, '1614584132851.jpg', 3.89999999999999991, 0.5, 3.39999999999999991, 0.349999999999999978, 3.04999999999999982, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 162694774, '10b1b997-48f8-47fc-be5c-0f4e9da9a580', '2021-03-04T12:50:35', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 281, 281);
INSERT INTO public.gw_monitoring VALUES ('2021-03-01T12:47:52.572+05:45', '2021-03-01T12:54:34.300+05:45', '2021-03-01', '868190042176206', 'yogendra', 'Banke', '28.0830308 81.5956368 104.12210698051976 4.551', 28.0830307999999995, 81.5956367999999941, 104.12210698051976, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  19  -  Well No:  NISP/INV/STW 11  Location:  Ramapurwa', '40', NULL, '1614582496708.jpg', 4.79999999999999982, 0.5, 4.29999999999999982, 0.400000000000000022, 3.89999999999999991, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 162694755, '358abe7a-58d7-4144-b982-7ae7ab8c62e2', '2021-03-04T12:50:33', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 282, 282);
INSERT INTO public.gw_monitoring VALUES ('2021-02-28T15:43:30.994+05:45', '2021-02-28T15:45:26.357+05:45', '2021-02-28', '868190042176206', 'yogendra', 'Banke', '28.1873729 81.630073 120.06170870396069 4.854', 28.1873728999999997, 81.6300729999999959, 120.06170870396069, 4.85400000000000009, 'Shallow well', NULL, NULL, NULL, 'S.No:  4  -   Well No:  1-045/46(BK)4  Location:  Channawa', '65', NULL, '1614506390587.jpg', 5, 2.52000000000000002, 2.47999999999999998, 0.650000000000000022, 1.83000000000000007, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 162694737, '97db0cac-f167-4478-86a4-5a5392d83237', '2021-03-04T12:50:30', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 283, 283);
INSERT INTO public.gw_monitoring VALUES ('2021-02-28T14:50:29.625+05:45', '2021-02-28T14:51:58.270+05:45', '2021-02-28', '868190042176206', 'yogendra', 'Banke', '28.1921073 81.5747382 93.94653314024943 4.803', 28.1921073, 81.5747381999999988, 93.9465331402494286, 4.80299999999999994, 'Shallow well', NULL, NULL, NULL, 'S.No:  5  -   Well No:  1-045/46(BK)5  Location:  Thapawa', '29', NULL, '1614503190804.jpg', 5, 1.69999999999999996, 3.29999999999999982, 0.28999999999999998, 3.00999999999999979, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 162694716, 'cc068fc9-1aaf-4171-938b-5d9b93af6728', '2021-03-04T12:50:27', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 284, 284);
INSERT INTO public.gw_monitoring VALUES ('2021-02-28T14:06:31.815+05:45', '2021-02-28T14:08:53.492+05:45', '2021-02-28', '868190042176206', 'yogendra', 'Banke', '28.206544 81.6307359 111.39332472668187 4.803', 28.2065440000000009, 81.6307359000000048, 111.393324726681868, 4.80299999999999994, 'Shallow well', NULL, NULL, NULL, 'S.No:  3  -   Well No:  1-045/46(BK)3  Location:  Banktuwa', '40', NULL, '1614500556043.jpg', 9, 2.29999999999999982, 6.70000000000000018, 0.400000000000000022, 6.29999999999999982, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 162694698, '892d8890-7a40-4a94-afb0-820b2660a9d4', '2021-03-04T12:50:24', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 285, 285);
INSERT INTO public.gw_monitoring VALUES ('2021-02-28T12:54:13.428+05:45', '2021-02-28T13:04:17.218+05:45', '2021-02-28', '868190042176206', 'yogendra', 'Banke', '28.1961034 81.711776 118.65058920259087 4.854', 28.1961033999999984, 81.7117760000000004, 118.650589202590865, 4.85400000000000009, 'Shallow well', NULL, NULL, NULL, 'S.No:  1  -   Well No:  1-045/46(BK)1  Location:  Rohini Khola', '20', NULL, '1614496709854.jpg', 5, 1.5, 3.5, 0.200000000000000011, 3.29999999999999982, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 162694676, '0436eb1a-9c45-4c85-a0c7-2565fd385fd0', '2021-03-04T12:50:20', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 286, 286);
INSERT INTO public.gw_monitoring VALUES ('2021-02-25T14:23:28.430+05:45', '2021-02-25T14:26:49.740+05:45', '2021-02-25', '868190042176206', 'yogendra', 'Banke', '28.0812296 81.6450593 107.35515950953524 4.551', 28.0812296000000003, 81.6450592999999998, 107.355159509535241, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  16  -  Well No:  NISP/STW 1       Location:  Office compound', '54', NULL, '1614242437489.jpg', 6, 1.94999999999999996, 4.04999999999999982, 0.540000000000000036, 3.50999999999999979, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 161114836, '5e6112d2-fde6-4464-a3d7-b1b485fefc39', '2021-02-25T15:57:16', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 287, 287);
INSERT INTO public.gw_monitoring VALUES ('2021-02-25T13:49:46.963+05:45', '2021-02-25T13:54:32.044+05:45', '2021-02-25', '868190042176206', 'yogendra', 'Banke', '28.0928569 81.6478714 101.68621225168131 4.551', 28.092856900000001, 81.6478713999999997, 101.686212251681312, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  7  -   Well No:  1-045/46(BK)7  Location:  Bhujai', '15', NULL, '1614240509744.jpg', 4.34999999999999964, 0.5, 3.84999999999999964, 0.149999999999999994, 3.70000000000000018, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 161114824, '0182ee75-a0c0-4c6e-81b8-65a937efbdad', '2021-02-25T15:57:13', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 288, 288);
INSERT INTO public.gw_monitoring VALUES ('2021-02-25T13:09:36.874+05:45', '2021-02-25T13:12:36.197+05:45', '2021-02-25', '868190042176206', 'yogendra', 'Banke', '28.1318094 81.6588648 108.93264494159047 4.551', 28.1318094000000016, 81.6588648000000035, 108.932644941590468, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  6  -   Well No:  1-045/46(BK)6  Location:  Piprahwa', '45', NULL, '1614238004314.jpg', 5, 2.64999999999999991, 2.35000000000000009, 0.450000000000000011, 1.89999999999999991, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 161114807, '19279d16-bd12-4707-916c-c59b0abb8a3d', '2021-02-25T15:57:10', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 289, 289);
INSERT INTO public.gw_monitoring VALUES ('2021-02-24T11:26:20.243+05:45', '2021-02-24T11:34:42.675+05:45', '2021-02-24', '868190042176206', 'yogendra', 'Banke', '28.0507648 81.5861597 99.08832275188804 4.551', 28.0507647999999996, 81.5861596999999961, 99.0883227518880432, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  20  -  Well No:  n/a  Location:  Jaogagaun', '55', NULL, '1614145730877.jpg', 7, 1.85000000000000009, 5.15000000000000036, 0.550000000000000044, 4.59999999999999964, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 161114782, 'aecdc410-2edb-471c-85d6-432962a87d45', '2021-02-25T15:57:06', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 290, 290);
INSERT INTO public.gw_monitoring VALUES ('2021-02-22T15:27:59.191+05:45', '2021-02-22T15:29:47.502+05:45', '2021-02-22', '868190042176206', 'yogendra', 'Banke', '28.0151149 81.6542853 86.65167613637765 4.854', 28.0151149000000004, 81.654285299999998, 86.6516761363776453, 4.85400000000000009, 'Shallow well', NULL, NULL, NULL, 'S.No:  9  -   Well No:  1-045/46(BK)9  Location:  Sikhanpurwa', '60', NULL, '1613987053743.jpg', 5, 2.02000000000000002, 2.97999999999999998, 0.599999999999999978, 2.37999999999999989, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 160414084, 'e14b500e-598d-4818-825f-1330e06b0cf9', '2021-02-23T09:18:02', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 291, 291);
INSERT INTO public.gw_monitoring VALUES ('2021-02-22T15:03:07.522+05:45', '2021-02-22T15:05:12.227+05:45', '2021-02-22', '868190042176206', 'yogendra', 'Banke', '28.0020096 81.6522108 107.77393555615072 4.854', 28.0020096000000009, 81.652210800000006, 107.773935556150718, 4.85400000000000009, 'Shallow well', NULL, NULL, NULL, 'S.No:  21 -  Well No:  n/a  Location:  Baldipurwa', '40', NULL, '1613985577408.jpg', 6, 1.5, 4.5, 0.400000000000000022, 4.09999999999999964, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 160414070, '2a46792a-c435-4b65-85d2-edcf085d8ab5', '2021-02-23T09:17:59', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 292, 292);
INSERT INTO public.gw_monitoring VALUES ('2021-02-22T12:47:06.015+05:45', '2021-02-22T12:49:51.848+05:45', '2021-02-22', '868190042176206', 'yogendra', 'Banke', '28.0242741 81.6002787 89.81682168351188 4.854', 28.0242740999999995, 81.6002787000000041, 89.8168216835118756, 4.85400000000000009, 'Shallow well', NULL, NULL, NULL, 'S.No:  11  -  Well No:  1-045/46(BK)11  Location:  Jaishpur', '50', NULL, '1613977439284.jpg', 7, 1.82000000000000006, 5.17999999999999972, 0.5, 4.67999999999999972, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 160414054, '01c3e5be-5a37-4b50-913b-632f16fefbde', '2021-02-23T09:17:57', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 293, 293);
INSERT INTO public.gw_monitoring VALUES ('2021-02-20T11:44:31.275+05:45', '2021-02-20T11:47:26.099+05:45', '2021-02-20', '868190042176206', 'yogendra', 'Banke', '28.0780604 81.5932225 97.16194288745902 4.854', 28.0780603999999983, 81.593222499999996, 97.1619428874590199, 4.85400000000000009, 'Shallow well', NULL, NULL, NULL, 'S.No:  18  -  Well No:  NISP/INV/STW 10  Location:  Banjaregaon', '25', NULL, '1613800846895.jpg', 5, 2.31000000000000005, 2.68999999999999995, 0.25, 2.43999999999999995, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 160414045, 'fab84bb9-486c-4b86-8a05-09a3c974213f', '2021-02-23T09:17:54', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 294, 294);
INSERT INTO public.gw_monitoring VALUES ('2021-02-20T10:56:20.924+05:45', '2021-02-20T10:58:50.129+05:45', '2021-02-20', '868190042176206', 'yogendral', 'Banke', '28.1287297 81.5894124 88.46230121420037 4.854', 28.1287297000000009, 81.5894124000000005, 88.462301214200366, 4.85400000000000009, 'Shallow well', NULL, NULL, NULL, 'S.No:  12 -  Well No:  1-045/46(BK)17  Location:  D-gaon', '15', NULL, '1613797969427.jpg', 5, 1.78000000000000003, 3.21999999999999975, 0.149999999999999994, 3.06999999999999984, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 160414035, '0fc6bb99-d72b-41e3-b6ac-0e62ffd1858e', '2021-02-23T09:17:51', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 295, 295);
INSERT INTO public.gw_monitoring VALUES ('2021-02-09T18:35:19.747+05:45', '2021-02-09T18:41:19.705+05:45', '2021-02-09', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.073127 81.5541212 84.0 10.922', 28.0731269999999995, 81.5541211999999973, 84, 10.9220000000000006, 'Shallow well', NULL, 'S.No:  16   -  Well No: 16-045\46(B\D)16  - Location: Newlpur', NULL, NULL, '60', NULL, '1612875304486.jpg', 5, 1.69999999999999996, 3.29999999999999982, 0.599999999999999978, 2.70000000000000018, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 157559341, '2ef14e24-e296-4d83-bbb6-cec57dc9bb71', '2021-02-10T06:11:00', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 296, 296);
INSERT INTO public.gw_monitoring VALUES ('2021-02-09T17:32:49.231+05:45', '2021-02-09T17:42:09.671+05:45', '2021-02-09', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.0731098 81.5542463 88.0 7.585', 28.073109800000001, 81.5542463000000026, 88, 7.58499999999999996, 'Shallow well', NULL, 'S.No:  15   -  Well No: 15-045\46(B\D)15  - Location: Bhurigaon', NULL, NULL, '55', NULL, '1612871331348.jpg', 4, 1.89999999999999991, 2.10000000000000009, 0.550000000000000044, 1.55000000000000004, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 157559337, 'dae02f46-3143-4b04-8f48-4d70f1a45ec4', '2021-02-10T06:10:58', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 297, 297);
INSERT INTO public.gw_monitoring VALUES ('2021-02-09T17:05:56.451+05:45', '2021-02-09T17:10:01.263+05:45', '2021-02-09', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.0731407 81.5542272 82.0 4.854', 28.0731406999999997, 81.5542271999999997, 82, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  14   -  Well No: 14-045\46(B\D)14  - Location: Begnaha', NULL, NULL, '10', NULL, '1612869747964.jpg', 3, 1, 2, 0.100000000000000006, 1.89999999999999991, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 157559335, '8af47e1a-3e45-4ee5-a82d-cd7488fa45b6', '2021-02-10T06:10:57', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 298, 298);
INSERT INTO public.gw_monitoring VALUES ('2021-02-08T14:30:45.042+05:45', '2021-02-08T14:35:08.218+05:45', '2021-02-08', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.3065235 81.3591491 67.0 4.854', 28.3065235000000008, 81.3591490999999962, 67, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  11   -  Well No: 11-045\46(B\D)11  - Location: Baniyabhar', NULL, NULL, '75', NULL, '1612774022768.jpg', 5, 1.60000000000000009, 3.39999999999999991, 0.75, 2.64999999999999991, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 157559329, 'd36251f1-4359-467e-9a06-d5a56da8a1aa', '2021-02-10T06:10:56', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 299, 299);
INSERT INTO public.gw_monitoring VALUES ('2021-02-08T14:15:39.558+05:45', '2021-02-08T14:17:31.235+05:45', '2021-02-08', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.3056157 81.3593068 111.0 4.854', 28.3056157000000006, 81.3593067999999988, 111, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  7    -  Well No: 7-045\46(B\D)7  - Location: Megara Gadhi', NULL, NULL, '45', NULL, '1612773139957.jpg', 8, 4, 4, 0.450000000000000011, 3.54999999999999982, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 157559319, '8b5afa1a-17fe-40a4-bdc6-de82fb50faa5', '2021-02-10T06:10:54', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 300, 300);
INSERT INTO public.gw_monitoring VALUES ('2021-02-08T13:58:44.145+05:45', '2021-02-08T13:59:54.148+05:45', '2021-02-08', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.301372 81.3365896 98.0 4.854', 28.3013720000000006, 81.3365895999999964, 98, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  10   -  Well No: 10-045\46(B\D)10  - Location: Padnaha', NULL, NULL, '60', NULL, '1612772081456.jpg', 7, 4, 3, 0.599999999999999978, 2.39999999999999991, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 157559314, '618cf34f-9e0f-49c8-952d-0106e971bff7', '2021-02-10T06:10:51', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 301, 301);
INSERT INTO public.gw_monitoring VALUES ('2021-02-08T13:07:09.600+05:45', '2021-02-08T13:09:13.453+05:45', '2021-02-08', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.3512356 81.4297427 107.0 4.854', 28.351235599999999, 81.4297427000000056, 107, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  8    -  Well No: 8-045\46(B\D)8  - Location: Auri', NULL, NULL, '40', NULL, '1612768985268.jpg', 5, 2, 3, 0.400000000000000022, 2.60000000000000009, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 157559306, '76cb882a-4732-4311-9783-6a8c53ff76c4', '2021-02-10T06:10:50', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 302, 302);
INSERT INTO public.gw_monitoring VALUES ('2021-02-08T12:51:27.208+05:45', '2021-02-08T12:53:12.538+05:45', '2021-02-08', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.289843 81.4420836 100.0 6.674', 28.2898430000000012, 81.4420836000000037, 100, 6.67400000000000038, 'Shallow well', NULL, 'S.No:  4    -  Well No: 4-045\46(B\D)4  - Location: Bangai', NULL, NULL, '32', NULL, '1612768075664.jpg', 5, 2, 3, 0.320000000000000007, 2.68000000000000016, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 157559298, 'c50f3cc4-396b-4b6f-95d0-f7ce2bd75742', '2021-02-10T06:10:48', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 303, 303);
INSERT INTO public.gw_monitoring VALUES ('2021-02-08T11:45:37.310+05:45', '2021-02-08T11:47:07.624+05:45', '2021-02-08', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.2282732 81.5671712 103.0 4.854', 28.2282732000000003, 81.5671712000000042, 103, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  21   -  Well No: na.a                            - Location: Belwa', NULL, NULL, '40', NULL, '1612764079514.jpg', 10, 4, 6, 0.400000000000000022, 5.59999999999999964, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 157559289, 'e7a995ac-6339-4b57-a71f-05b32e3b8c12', '2021-02-10T06:10:46', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 304, 304);
INSERT INTO public.gw_monitoring VALUES ('2021-02-08T11:30:43.904+05:45', '2021-02-08T11:34:44.434+05:45', '2021-02-08', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.2490131 81.5848865 102.0 4.803', 28.2490130999999991, 81.5848864999999961, 102, 4.80299999999999994, 'Shallow well', NULL, 'S.No:  22   -  Well No: n.a.                            - Location: Belwa', NULL, NULL, '10', NULL, '1612763374524.jpg', 8, 3, 5, 0.100000000000000006, 4.90000000000000036, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 157559283, 'c4919601-b517-4160-8bb6-10c1b9f75409', '2021-02-10T06:10:44', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 305, 305);
INSERT INTO public.gw_monitoring VALUES ('2021-02-08T11:10:52.876+05:45', '2021-02-08T11:12:56.887+05:45', '2021-02-08', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.2364793 81.5477362 95.0 4.551', 28.2364792999999992, 81.5477362000000028, 95, 4.55100000000000016, 'Shallow well', NULL, 'S.No:  2    -  Well No: 2-045\46(B\D)2  - Location: Bakharikurd', NULL, NULL, '0', NULL, '1612762062629.jpg', 3, 1, 2, 0, 2, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 157559276, 'd092fa6a-f041-4815-a24d-890d8263c341', '2021-02-10T06:10:41', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 306, 306);
INSERT INTO public.gw_monitoring VALUES ('2021-02-08T10:46:25.222+05:45', '2021-02-08T10:50:05.481+05:45', '2021-02-08', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.1880467 81.479971 85.0 4.854', 28.188046700000001, 81.4799710000000061, 85, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  3    -  Well No: 3-045\46(B\D)3  - Location: Mainapokhar', NULL, NULL, '40', NULL, '1612760695507.jpg', 5, 1, 4, 0.400000000000000022, 3.60000000000000009, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 157559272, '0d26cfea-b811-47ac-ad9b-11f48d9c47c3', '2021-02-10T06:10:39', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 307, 307);
INSERT INTO public.gw_monitoring VALUES ('2021-02-03T14:17:09.693+05:45', '2021-02-03T14:21:02.412+05:45', '2021-02-03', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.2795711 81.2628225 103.0 4.854', 28.2795710999999983, 81.2628224999999986, 103, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  12   -  Well No: 12-045\46(B\D)12  - Location: Taratal', NULL, NULL, '40', NULL, '1612341187973.jpg', 13, 2, 11, 0.400000000000000022, 10.5999999999999996, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 157559270, '8af574c9-de97-4a2f-9767-23198acc38db', '2021-02-10T06:10:37', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 308, 308);
INSERT INTO public.gw_monitoring VALUES ('2021-02-03T13:56:52.282+05:45', '2021-02-03T13:57:45.673+05:45', '2021-02-03', 'collect:j4PTEWRBElBFPepF', 'Anita ', 'Bardiya', '28.3349604 81.2660784 104.0 6.068', 28.3349603999999999, 81.2660783999999978, 104, 6.06799999999999962, 'Shallow well', NULL, 'S.No:  13   -  Well No: 13-045\46(B\D)13  - Location: Madhubhan', NULL, NULL, '10', NULL, '1612339951017.jpg', 5, 2, 3, 0.100000000000000006, 2.89999999999999991, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 157559264, '82447c62-fabc-4979-a614-abd4a7cb8431', '2021-02-10T06:10:34', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 309, 309);
INSERT INTO public.gw_monitoring VALUES ('2021-02-03T13:23:59.058+05:45', '2021-02-03T13:32:24.998+05:45', '2021-02-03', 'collect:j4PTEWRBElBFPepF', 'Anita Singh thakur', 'Bardiya', '28.2504704 81.3107656 104.0 4.854', 28.2504704000000011, 81.3107655999999963, 104, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  9    -  Well No: 9-045\46(B\D)9  - Location: Khairapur', NULL, NULL, '50', NULL, '1612338429974.jpg', 7, 2, 5, 0.5, 4.5, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 157559249, '55db9eb2-4e3c-4dec-8f79-5bc5f3d634a1', '2021-02-10T06:10:31', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 310, 310);
INSERT INTO public.gw_monitoring VALUES ('2021-02-03T13:02:03.763+05:45', '2021-02-03T13:04:43.690+05:45', '2021-02-03', 'collect:j4PTEWRBElBFPepF', 'Anita Singh thakur', 'Bardiya', '28.2385395 81.2889351 104.0 4.803', 28.2385395000000017, 81.2889351000000033, 104, 4.80299999999999994, 'Shallow well', NULL, 'S.No:  23   -  Well No: n.a.                            - Location: Janaki Tool', NULL, NULL, '20', NULL, '1612336734992.jpg', 13, 3.60000000000000009, 9.40000000000000036, 0.200000000000000011, 9.19999999999999929, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 157559237, 'a3450619-54ec-4ae2-ace5-57c09dc78a85', '2021-02-10T06:10:27', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 311, 311);
INSERT INTO public.gw_monitoring VALUES ('2021-02-03T12:26:33.791+05:45', '2021-02-03T12:28:30.750+05:45', '2021-02-03', 'collect:j4PTEWRBElBFPepF', 'Anita Singh thakur', 'Bardiya', '28.1691594 81.3378798 89.0 4.803', 28.1691594000000016, 81.3378797999999961, 89, 4.80299999999999994, 'Shallow well', NULL, 'S.No:  6    -  Well No: 6-045\46(B\D)6  - Location: Rain Nagar', NULL, NULL, '40', NULL, '1612334598210.jpg', 9, 3, 6, 0.400000000000000022, 5.59999999999999964, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 157559233, 'e02788ce-5dd0-4bc2-a3fe-b0a4b025c596', '2021-02-10T06:10:25', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 312, 312);
INSERT INTO public.gw_monitoring VALUES ('2021-02-03T12:06:21.805+05:45', '2021-02-03T12:07:31.436+05:45', '2021-02-03', 'collect:j4PTEWRBElBFPepF', 'Anita Singh thakur', 'Bardiya', '28.189743 81.3836823 90.0 4.854', 28.189743, 81.3836823000000038, 90, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  5    -  Well No: 5-045\46(B\D)5  - Location: Bhaisahi', NULL, NULL, '30', NULL, '1612333340713.jpg', 5, 1, 4, 0.299999999999999989, 3.70000000000000018, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 157559226, '2ed7463b-a9a0-4b91-88e0-38a184636044', '2021-02-10T06:10:23', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 313, 313);
INSERT INTO public.gw_monitoring VALUES ('2021-02-03T11:42:29.444+05:45', '2021-02-03T11:45:06.494+05:45', '2021-02-03', 'collect:j4PTEWRBElBFPepF', 'Anita Singh thakur', 'Bardiya', '28.1656409 81.5008473 94.0 4.854', 28.1656408999999996, 81.5008473000000038, 94, 4.85400000000000009, 'Shallow well', NULL, 'S.No:  20   -  Well No: NISP\INV\STW-6    - Location: Shoharawa', NULL, NULL, '70', NULL, '1612331965716.jpg', 7, 2.20000000000000018, 4.79999999999999982, 0.699999999999999956, 4.09999999999999964, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 157559223, '44ca3ae2-cfe2-41a9-95d1-011397bf43fb', '2021-02-10T06:10:21', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 314, 314);
INSERT INTO public.gw_monitoring VALUES ('2021-02-03T11:14:24.172+05:45', '2021-02-03T11:27:05.568+05:45', '2021-02-03', 'collect:j4PTEWRBElBFPepF', 'Anita Singh thakur', 'Bardiya', '28.1464123 81.4790915 84.0 4.551', 28.1464123000000015, 81.4790914999999956, 84, 4.55100000000000016, 'Shallow well', NULL, 'S.No:  19   -  Well No: n.a.                             - Location: Bhawanipur', NULL, NULL, '30', NULL, '1612330897183.jpg', 8, 3, 5, 0.299999999999999989, 4.70000000000000018, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 157559215, '305a445c-edbd-4d82-9bcc-f24ae723b4c7', '2021-02-10T06:10:18', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 315, 315);
INSERT INTO public.gw_monitoring VALUES ('2021-02-03T10:59:32.984+05:45', '2021-02-03T11:03:57.565+05:45', '2021-02-03', 'collect:j4PTEWRBElBFPepF', 'Anita Singh thakur', 'Bardiya', '28.1486845 81.4968653 88.0 6.674', 28.1486845000000017, 81.4968652999999961, 88, 6.67400000000000038, 'Shallow well', NULL, 'S.No:  18   -  Well No: NISP\INV\STW-5    - Location: Shoharawa', NULL, NULL, '40', NULL, '1612329448850.jpg', 5, 1.19999999999999996, 3.79999999999999982, 0.400000000000000022, 3.39999999999999991, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 157559211, '838b2bdf-dea9-4a5c-9148-8cfd526fbbf8', '2021-02-10T06:10:15', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 316, 316);
INSERT INTO public.gw_monitoring VALUES ('2021-01-28T14:48:46.322+05:45', '2021-01-28T14:50:56.225+05:45', '2021-01-28', 'collect:j4PTEWRBElBFPepF', 'A', 'Bardiya', '28.0828531 81.5111708 89.0 4.551', 28.0828531000000012, 81.5111708000000021, 89, 4.55100000000000016, 'Deep well', 'S.No:  4   -  Well No: DTW-10              - Location: Shantipur', NULL, NULL, NULL, '24', NULL, '1611824700773.jpg', 13, 3.20000000000000018, 9.80000000000000071, 0.239999999999999991, 9.5600000000000005, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 157559206, 'b407f023-820a-4d8e-b01f-bbc5cb58f796', '2021-02-10T06:10:13', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 317, 317);
INSERT INTO public.gw_monitoring VALUES ('2021-01-28T14:05:33.695+05:45', '2021-01-28T14:09:13.404+05:45', '2021-01-28', 'collect:j4PTEWRBElBFPepF', 'A', 'Bardiya', '28.1055899 81.4825913 79.0 4.551', 28.1055898999999982, 81.4825912999999957, 79, 4.55100000000000016, 'Deep well', 'S.No:  2   -  Well No: DTW-6            - Location: Tholodafe', NULL, NULL, NULL, '10', NULL, '1611822147994.jpg', 15, 4.5, 10.5, 0.100000000000000006, 10.4000000000000004, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 157559204, '1c03d611-b033-4290-a8be-37617587d0b0', '2021-02-10T06:10:11', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 318, 318);
INSERT INTO public.gw_monitoring VALUES ('2021-01-28T13:12:41.854+05:45', '2021-01-28T13:40:20.585+05:45', '2021-01-28', 'collect:j4PTEWRBElBFPepF', 'A', 'Bardiya', '28.0883406 81.502631 89.0 4.854', 28.0883405999999987, 81.5026309999999938, 89, 4.85400000000000009, 'Deep well', 'S.No:  3   -  Well No: DTW-3             - Location: Shantipur', NULL, NULL, NULL, '20', NULL, '1611820457293.jpg', 13, 1.19999999999999996, 11.8000000000000007, 0.200000000000000011, 11.5999999999999996, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 157559200, '2cd5861c-850f-4867-ae5f-1b9dab58d5b1', '2021-02-10T06:10:08', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 319, 319);
INSERT INTO public.gw_monitoring VALUES ('2021-01-28T13:04:18.622+05:45', '2021-01-28T13:11:53.708+05:45', '2021-01-28', 'collect:j4PTEWRBElBFPepF', 'Anita', 'Bardiya', '28.085181 81.5163616 83.0 4.803', 28.0851809999999986, 81.5163615999999962, 83, 4.80299999999999994, 'Deep well', 'S.No:  1   -  Well No: DTW-9              - Location: Shantipur', NULL, NULL, NULL, '25', NULL, '1611818523243.jpg', 13, 1, 12, 0.25, 11.75, NULL, NULL, '1611818785404.amr', 'vrPtKVyay9YP5gTyKY9Nc5', 157559192, 'ee2b030e-7f70-43c3-8cba-3dff3b24860c', '2021-02-10T06:10:04', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 320, 320);
INSERT INTO public.gw_monitoring VALUES ('2021-02-05T15:45:38.136+05:45', '2021-02-05T15:47:18.492+05:45', '2021-02-05', '868190042176206', 'yogendra', 'Banke', '28.0818215 81.5466409 84.0 4.551', 28.0818215000000002, 81.5466408999999999, 84, 4.55100000000000016, 'Deep well', NULL, NULL, 'S.No: 1  -  Well No:  SP-1    - Location:  K Gaon', NULL, '37', NULL, '1612519301486.jpg', 15, 3.64999999999999991, 11.3499999999999996, 0.369999999999999996, 10.9800000000000004, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 156631554, '92c80f02-1c5d-4b39-8056-e683e2d131c6', '2021-02-05T13:48:22', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 321, 321);
INSERT INTO public.gw_monitoring VALUES ('2021-02-05T14:58:46.234+05:45', '2021-02-05T15:01:24.082+05:45', '2021-02-05', '868190042176206', 'yogendra', 'Banke', '28.0960436 81.5211363 84.0 4.551', 28.0960436000000016, 81.5211362999999949, 84, 4.55100000000000016, 'Deep well', NULL, NULL, 'S.No: 2  -  Well No:  SP-6    - Location:  L Gaon', NULL, '25', NULL, '1612516522154.jpg', 13, 1.80000000000000004, 11.1999999999999993, 0.25, 10.9499999999999993, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 156631548, '03062148-a626-4da3-a067-2608fc1e20c3', '2021-02-05T13:48:19', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 322, 322);
INSERT INTO public.gw_monitoring VALUES ('2021-02-05T13:59:52.598+05:45', '2021-02-05T14:02:21.984+05:45', '2021-02-05', '868190042176206', 'yogendra', 'Banke', '28.1223281 81.5165796 90.0 4.854', 28.1223281000000007, 81.5165796, 90, 4.85400000000000009, 'Deep well', NULL, NULL, 'S.No: 3  -  Well No:  SP-9    - Location:  Gaughat', NULL, '42', NULL, '1612512977707.jpg', 13, 1.75, 11.25, 0.419999999999999984, 10.8300000000000001, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 156631544, '7acf84a8-f8eb-4e45-b936-4b0ed0037df2', '2021-02-05T13:48:16', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 323, 323);
INSERT INTO public.gw_monitoring VALUES ('2021-02-05T13:21:19.539+05:45', '2021-02-05T13:23:25.912+05:45', '2021-02-05', '868190042176206', 'yogendra', 'Banke', '28.1132361 81.5173035 91.0 4.551', 28.1132361000000017, 81.517303499999997, 91, 4.55100000000000016, 'Deep well', NULL, NULL, 'S.No: 4  -  Well No:  SP-13    - Location:  Gaughat', NULL, '49', NULL, '1612510650097.jpg', 15, 3.70000000000000018, 11.3000000000000007, 0.489999999999999991, 10.8100000000000005, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 156631539, 'b49a7d80-672a-4e75-9615-ec340863fccf', '2021-02-05T13:48:13', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 324, 324);
INSERT INTO public.gw_monitoring VALUES ('2021-02-05T11:44:05.164+05:45', '2021-02-05T11:46:36.072+05:45', '2021-02-05', '868190042176206', 'yogendra', 'Banke', '28.0513081 81.6024541 86.0 4.551', 28.0513081, 81.6024541000000028, 86, 4.55100000000000016, 'Deep well', NULL, NULL, 'S.No: 5 - Well No. EXPT-7   - Location: Parspur', NULL, '27', NULL, '1612504844378.jpg', 5, 1.05000000000000004, 3.95000000000000018, 0.270000000000000018, 3.68000000000000016, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 156631536, '335c20a3-12b0-4f94-bfb1-f00bdcd42ea3', '2021-02-05T13:48:10', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 325, 325);
INSERT INTO public.gw_monitoring VALUES ('2021-02-03T11:59:21.711+05:45', '2021-02-03T12:01:06.978+05:45', '2021-02-03', '868190042176206', 'yogendra', 'Banke', '28.13181 81.6588146 97.0 4.854', 28.1318100000000015, 81.6588145999999995, 97, 4.85400000000000009, 'Shallow well', NULL, NULL, NULL, 'S.No:  6  -   Well No:  1-045/46(BK)6  Location:  Piprahwa', '45', NULL, '1612332924452.jpg', 5, 2.79999999999999982, 2.20000000000000018, 0.450000000000000011, 1.75, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 156291410, 'fe2260e1-1f44-401a-9b4e-46e3def816c0', '2021-02-04T01:25:55', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 326, 326);
INSERT INTO public.gw_monitoring VALUES ('2021-02-03T11:40:08.501+05:45', '2021-02-03T11:42:21.978+05:45', '2021-02-03', '868190042176206', 'yogendra', 'Banke', '28.0928582 81.6478693 99.0 4.551', 28.0928581999999984, 81.6478692999999964, 99, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  7  -   Well No:  1-045/46(BK)7  Location:  Bhujai', '15', NULL, '1612331787771.jpg', 4.15000000000000036, 0.5, 3.65000000000000036, 0.149999999999999994, 3.5, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 156291398, '8b461dc1-3e96-4646-ab60-610ef99b0b13', '2021-02-04T01:25:45', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 327, 327);
INSERT INTO public.gw_monitoring VALUES ('2021-02-03T11:06:22.430+05:45', '2021-02-03T11:08:11.690+05:45', '2021-02-03', '868190042176206', 'yogendra', 'Banke', '28.0812224 81.6450643 94.0 4.551', 28.0812224000000015, 81.6450643000000014, 94, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  16  -  Well No:  NISP/STW 1       Location:  Office compound', '54', NULL, '1612329756237.jpg', 6, 2.45000000000000018, 3.54999999999999982, 0.540000000000000036, 3.00999999999999979, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 156291393, '558b7bfb-ea47-47d6-b95a-63d3c3bef447', '2021-02-04T01:25:36', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 328, 328);
INSERT INTO public.gw_monitoring VALUES ('2021-02-01T14:45:42.308+05:45', '2021-02-01T14:47:56.576+05:45', '2021-02-01', '868190042176206', 'yogendra', 'Banke', '28.1960977 81.7117444 107.0 4.551', 28.1960976999999993, 81.7117444000000006, 107, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  1  -   Well No:  1-045/46(BK)1  Location:  Rohini Khola', '20', NULL, '1612170130662.jpg', 5, 1.85000000000000009, 3.14999999999999991, 0.200000000000000011, 2.95000000000000018, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 155657321, '1b19c494-20e3-4be4-a6c5-f3cacb6e05ef', '2021-02-01T12:25:36', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 329, 329);
INSERT INTO public.gw_monitoring VALUES ('2021-02-01T13:41:25.175+05:45', '2021-02-01T13:44:23.078+05:45', '2021-02-01', '868190042176206', 'yogendra', 'Banke', '28.1873921 81.6300983 105.0 4.551', 28.1873921000000003, 81.6300983000000002, 105, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  4  -   Well No:  1-045/46(BK)4  Location:  Channawa', '65', NULL, '1612166302897.jpg', 5, 2.64999999999999991, 2.35000000000000009, 0.650000000000000022, 1.69999999999999996, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 155657301, '7ed88c11-57d3-47a8-acc9-1a159d0540fa', '2021-02-01T12:25:33', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 330, 330);
INSERT INTO public.gw_monitoring VALUES ('2021-01-31T14:59:29.283+05:45', '2021-01-31T15:01:44.607+05:45', '2021-01-31', '868190042176206', 'yogendra', 'Banke', '28.0020439 81.6523786 69.0 4.551', 28.0020439000000003, 81.6523786000000058, 69, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  21 -  Well No:  n/a  Location:  Baldipurwa', '40', NULL, '1612084550212.jpg', 6, 1.69999999999999996, 4.29999999999999982, 0.400000000000000022, 3.89999999999999991, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 155491174, '704ab791-6660-4bc4-8b14-b491f8b14f0e', '2021-01-31T17:07:13', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 331, 331);
INSERT INTO public.gw_monitoring VALUES ('2021-01-31T14:26:15.165+05:45', '2021-01-31T14:28:54.973+05:45', '2021-01-31', '868190042176206', 'yogendra', 'Banke', '28.0151183 81.6543479 82.0 4.803', 28.015118300000001, 81.6543479000000048, 82, 4.80299999999999994, 'Shallow well', NULL, NULL, NULL, 'S.No:  9  -   Well No:  1-045/46(BK)9  Location:  Sikhanpurwa', '60', NULL, '1612082556646.jpg', 5, 2.25, 2.75, 0.599999999999999978, 2.14999999999999991, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 155491167, '3dc06eac-962f-460c-af06-77786716f57d', '2021-01-31T17:07:11', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 332, 332);
INSERT INTO public.gw_monitoring VALUES ('2021-01-31T13:18:27.391+05:45', '2021-01-31T13:20:39.564+05:45', '2021-01-31', '868190042176206', 'yogendra', 'Banke', '28.0242587 81.6002836 91.0 4.854', 28.0242587000000007, 81.6002835999999974, 91, 4.85400000000000009, 'Shallow well', NULL, NULL, NULL, 'S.No:  11  -  Well No:  1-045/46(BK)11  Location:  Jaishpur', '50', NULL, '1612078502521.jpg', 6, 1.35000000000000009, 4.65000000000000036, 0.5, 4.15000000000000036, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 155491166, '092eba2d-1e81-4d6c-819f-78c44538e578', '2021-01-31T17:07:09', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 333, 333);
INSERT INTO public.gw_monitoring VALUES ('2021-01-31T12:23:51.190+05:45', '2021-01-31T12:27:59.773+05:45', '2021-01-31', '868190042176206', 'yogendra', 'Banke', '28.0507443 81.5861794 89.0 4.854', 28.0507443000000016, 81.586179400000006, 89, 4.85400000000000009, 'Shallow well', NULL, NULL, NULL, 'S.No:  20  -  Well No:  n/a  Location:  Jaogagaun', '55', NULL, '1612075310313.jpg', 6, 1.14999999999999991, 4.84999999999999964, 0.550000000000000044, 4.29999999999999982, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 155491162, '49d74639-f3fe-42d5-82a1-f2366904f73d', '2021-01-31T17:07:06', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 334, 334);
INSERT INTO public.gw_monitoring VALUES ('2021-01-29T14:11:00.945+05:45', '2021-01-29T14:14:56.428+05:45', '2021-01-29', '868190042176206', 'yogendra', 'Banke', '27.9833039 81.7132923 84.0 4.551', 27.9833038999999992, 81.7132923000000062, 84, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  10  -  Well No:  1-045/46(BK)10  Location:  Kharaicha', '70', NULL, '1611908942690.jpg', 5, 1.55000000000000004, 3.45000000000000018, 0.699999999999999956, 2.75, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 155207089, '37685050-04bd-4fdb-89b4-56c7d4558e47', '2021-01-30T05:18:48', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 335, 335);
INSERT INTO public.gw_monitoring VALUES ('2021-01-29T13:23:03.267+05:45', '2021-01-29T13:26:35.044+05:45', '2021-01-29', '868190042176206', 'yogendra', 'Banke', '28.0285434 81.6946848 78.0 4.854', 28.0285434000000002, 81.6946848000000045, 78, 4.85400000000000009, 'Shallow well', NULL, NULL, NULL, 'S.No:  22 -  Well No: n/a   Location:  Harbaldoli', '55', NULL, '1611906048347.jpg', 6, 1.55000000000000004, 4.45000000000000018, 0.550000000000000044, 3.89999999999999991, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 155207084, 'adf3bcaa-884e-47f0-947d-7939a7a51aa2', '2021-01-30T05:18:46', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 336, 336);
INSERT INTO public.gw_monitoring VALUES ('2021-01-29T12:19:20.516+05:45', '2021-01-29T12:24:34.451+05:45', '2021-01-29', '868190042176206', 'yogendra', 'Banke', '28.0493274 81.6616258 95.0 4.551', 28.0493273999999992, 81.6616257999999959, 95, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  8  -   Well No:  1-045/46(BK)8  Location:  Birta', '36', NULL, '1611902315436.jpg', 8, 2.14999999999999991, 5.84999999999999964, 0.359999999999999987, 5.49000000000000021, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 155207081, 'cd44910a-c3dd-491d-9860-1ab460e959cd', '2021-01-30T05:18:42', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 337, 337);
INSERT INTO public.gw_monitoring VALUES ('2021-01-28T10:25:11.691+05:45', '2021-01-28T10:27:14.821+05:45', '2021-01-28', 'collect:j4PTEWRBElBFPepF', 'Subash', 'Bardiya', '28.0803241 81.64207 64.0 51.578', 28.0803240999999986, 81.6420700000000039, 64, 51.578000000000003, 'Shallow well', NULL, 'S.No:  1    -  Well No: 1-045\46(B\D)1  - Location: Bertani', NULL, NULL, '0', NULL, '1611808899881.jpg', 2, 0, 2, 0, 2, NULL, 'Test', '1611808927574.amr', 'vrPtKVyay9YP5gTyKY9Nc5', 154803695, '3e413851-8c87-4776-a65f-12f6f91837ff', '2021-01-28T04:42:24', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 338, 338);
INSERT INTO public.gw_monitoring VALUES ('2021-01-27T17:23:21.077+05:45', '2021-01-27T17:25:16.543+05:45', '2021-01-27', '868190042176206', 'yogendra', 'Banke', '28.2064949 81.6307264 101.0 4.803', 28.2064948999999991, 81.6307264000000004, 101, 4.80299999999999994, 'Shallow well', NULL, NULL, NULL, 'S.No:  3  -   Well No:  1-045/46(BK)3  Location:  Banktuwa', '40', NULL, '1611747569579.jpg', 8, 1.5, 6.5, 0.400000000000000022, 6.09999999999999964, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 154686825, '6903dbee-70e4-44e9-9744-53d2c3afae87', '2021-01-27T14:03:31', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 339, 339);
INSERT INTO public.gw_monitoring VALUES ('2021-01-27T16:38:03.623+05:45', '2021-01-27T16:42:35.239+05:45', '2021-01-27', '868190042176206', 'yogendra', 'Banke', '28.2576903 81.6361819 95.0 4.551', 28.2576903000000001, 81.6361818999999969, 95, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  2  -   Well No:  1-045/46(BK)2  Location:  Jabdhawa', '15', NULL, '1611744936863.jpg', 0, 0, 0, 0.149999999999999994, -0.149999999999999994, NULL, 'dimage', '1611745033117..amr', 'vrPtKVyay9YP5gTyKY9Nc5', 154686810, '5c2e3f58-bac1-41ba-9cde-94257008f73b', '2021-01-27T14:03:29', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 340, 340);
INSERT INTO public.gw_monitoring VALUES ('2021-01-27T15:20:24.313+05:45', '2021-01-27T15:23:22.238+05:45', '2021-01-27', '868190042176206', 'yogendra', 'Banke', '28.1920455 81.5747481 99.0 4.854', 28.192045499999999, 81.5747480999999937, 99, 4.85400000000000009, 'Shallow well', NULL, NULL, NULL, 'S.No:  5  -   Well No:  1-045/46(BK)5  Location:  Thapawa', '29', NULL, '1611740268198.jpg', 5, 1.75, 3.25, 0.28999999999999998, 2.95999999999999996, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 154686788, '7de5dec7-8c09-43a9-8db6-0ffba037ae37', '2021-01-27T14:03:25', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 341, 341);
INSERT INTO public.gw_monitoring VALUES ('2021-01-27T14:28:19.208+05:45', '2021-01-27T14:31:13.582+05:45', '2021-01-27', '868190042176206', 'yogendra', 'Banke', '28.1114479 81.5216935 79.0 4.551', 28.1114479000000017, 81.5216934999999978, 79, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  14  -  Well No:  1-045/46(BK)19  Location:  Gaughat', '23', NULL, '1611737128518.jpg', 7, 2.04999999999999982, 4.95000000000000018, 0.23000000000000001, 4.71999999999999975, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 154686775, '5b798b69-ade6-4cea-ba63-e326dcdba629', '2021-01-27T14:03:22', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 342, 342);
INSERT INTO public.gw_monitoring VALUES ('2021-01-27T13:55:37.370+05:45', '2021-01-27T13:57:58.367+05:45', '2021-01-27', '868190042176206', 'yogendra', 'Banke', '28.1465454 81.5519862 93.0 4.551', 28.1465454000000008, 81.5519862000000018, 93, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  13  -  Well No:  1-045/46(BK)18  Location:  Kalhansgaon', '27', NULL, '1611735142322.jpg', 5, 2.04999999999999982, 2.95000000000000018, 0.270000000000000018, 2.68000000000000016, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 154686763, '3028bfbd-9a35-46c9-bd70-c295cab10c17', '2021-01-27T14:03:20', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 343, 343);
INSERT INTO public.gw_monitoring VALUES ('2021-01-27T13:16:43.849+05:45', '2021-01-27T13:21:13.421+05:45', '2021-01-27', '868190042176206', 'yogendra', 'Banke', '28.1287151 81.5894281 88.0 4.551', 28.1287151000000009, 81.5894281000000063, 88, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  12 -  Well No:  1-045/46(BK)17  Location:  D-gaon', '15', NULL, '1611732909429.jpg', 5, 2.14999999999999991, 2.85000000000000009, 0.149999999999999994, 2.70000000000000018, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 154686742, 'b6d8a3f0-fd43-4c80-94bb-8525703c4f14', '2021-01-27T14:03:17', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 344, 344);
INSERT INTO public.gw_monitoring VALUES ('2021-01-27T12:51:30.554+05:45', '2021-01-27T12:54:10.007+05:45', '2021-01-27', '868190042176206', 'yogendra', 'Banke', '28.1060386 81.5971551 99.0 4.551', 28.1060386000000015, 81.5971550999999948, 99, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  17  -  Well No:  NISP/INV/STW 8   Location:  Kajurakurda', '35', NULL, '1611731301523.jpg', 3.75, 0.5, 3.25, 0.349999999999999978, 2.89999999999999991, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 154686727, '872a8ae8-10e0-4444-a6a7-de43bdf03fd7', '2021-01-27T14:03:15', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 345, 345);
INSERT INTO public.gw_monitoring VALUES ('2021-01-27T12:29:23.887+05:45', '2021-01-27T12:35:02.161+05:45', '2021-01-27', '868190042176206', 'yogendra', 'Banke', '28.0828437 81.5956795 92.0 4.551', 28.0828437000000015, 81.5956795000000028, 92, 4.55100000000000016, 'Shallow well', NULL, NULL, NULL, 'S.No:  19  -  Well No:  NISP/INV/STW 11  Location:  Ramapurwa', '40', NULL, '1611730134314.jpg', 4.59999999999999964, 0.5, 4.09999999999999964, 0.400000000000000022, 3.70000000000000018, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 154686716, '556838ae-c09c-44e3-98ff-8536332a6cc2', '2021-01-27T14:03:13', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 346, 346);
INSERT INTO public.gw_monitoring VALUES ('2021-01-27T12:06:36.679+05:45', '2021-01-27T19:47:05.926+05:45', '2021-01-27', '868190042176206', 'yogndra', 'Banke', '28.0780663 81.5933074 94.0 4.854', 28.0780662999999997, 81.5933074000000005, 94, 4.85400000000000009, 'Shallow well', NULL, NULL, NULL, 'S.No:  18  -  Well No:  NISP/INV/STW 10  Location:  Banjaregaon', '25', NULL, '1611728598226.jpg', 5, 2.54999999999999982, 2.45000000000000018, 0.25, 2.20000000000000018, NULL, NULL, NULL, 'vrPtKVyay9YP5gTyKY9Nc5', 154686710, 'e10a14b9-ad0d-442a-ba09-0768e294055c', '2021-01-27T14:03:12', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 347, 347);
INSERT INTO public.gw_monitoring VALUES ('2021-01-27T10:46:48.565+05:45', '2021-01-27T10:49:05.361+05:45', '2021-01-27', '868190042176206', 'Subash', 'Banke', '28.0804943 81.6419293 114.0 13.349', 28.0804943000000016, 81.641929300000001, 114, 13.3490000000000002, 'Shallow well', NULL, NULL, NULL, 'S.No:  1  -   Well No:  1-045/46(BK)1  Location:  Rohini Khola', '20', NULL, '1611723776280.jpg', 3.60000000000000009, 1.19999999999999996, 2.40000000000000036, 0.200000000000000011, 2.20000000000000018, NULL, 'Test', '1611723819300..amr', 'vrPtKVyay9YP5gTyKY9Nc5', 154559388, '236bc41e-a0c8-4b9a-898f-c51253640dae', '2021-01-27T05:04:17', NULL, '[]', 'submitted_via_web', 'gw_monitoring', NULL, 348, 348);


--
-- TOC entry 3019 (class 0 OID 44398)
-- Dependencies: 226
-- Data for Name: gw_monitoring_kobo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.gw_monitoring_kobo VALUES ('2021-09-08', 'Banke', 28.1876178999999993, 81.6301289999999966, 114.870553263334997, 4.85400000000000009, 'sw', 65, NULL, 0.699999999999999956, 0.650000000000000022, 0.0500000000000000028, 1, 'bk-sw-04');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-09-08', 'Banke', 28.1920220999999991, 81.5746575000000007, 99.7141043363480009, 4.55100000000000016, 'sw', 29, NULL, 0.5, 0.28999999999999998, 0.209999999999999992, 2, 'bk-sw-05_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-09-08', 'Banke', 28.2065531000000007, 81.6304497999999938, 107.865270103095995, 4.80299999999999994, 'sw', 40, NULL, 4.84999999999999964, 0.400000000000000022, 4.45000000000000018, 3, 'bk-sw-03');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-09-08', 'Banke', 28.1962343000000004, 81.7119337999999971, 103.907109904801004, 4.80299999999999994, 'sw', 20, NULL, 1.92999999999999994, 0.200000000000000011, 1.72999999999999998, 4, 'bk-sw-01');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-09-07', 'Banke', 28.0960503999999993, 81.5211613000000028, 86.6318971675136993, 4.85400000000000009, 'dt', 25, NULL, 10.0500000000000007, 0.25, 9.80000000000000071, 5, 'bk-dw-02');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-09-07', 'Banke', 28.1223546000000013, 81.5165784000000002, 73.2668540243953004, 4.85400000000000009, 'dt', 42, NULL, 10.3000000000000007, 0.419999999999999984, 9.88000000000000078, 6, 'bk-dw-03');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-09-07', 'Banke', 28.1132817000000017, 81.5173565000000053, 83.3428920621224023, 4.80299999999999994, 'dt', 49, NULL, 2.95000000000000018, 0.489999999999999991, 2.45999999999999996, 7, 'bk-dw-04_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-09-07', 'Banke', 28.1113637999999995, 81.5213918000000035, 90.5821169626233029, 4.85400000000000009, 'sw', 23, NULL, 1.30000000000000004, 0.23000000000000001, 1.07000000000000006, 8, 'bk-sw-19_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-09-07', 'Banke', 28.0818565000000007, 81.5465102000000002, 90.8576045407028943, 4.85400000000000009, 'dt', 37, NULL, 10, 0.369999999999999996, 9.63000000000000078, 9, 'bk-dw-01');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-09-07', 'Banke', 28.0513237999999987, 81.6024333999999953, 87.7574296356230974, 4.85400000000000009, 'dt', 27, NULL, 1.60000000000000009, 0.270000000000000018, 1.33000000000000007, 10, 'bk-dw-05');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-09-06', 'Banke', 27.9831338999999986, 81.7131458000000066, 80.0111521343051066, 4.55100000000000016, 'sw', 70, NULL, 1.41999999999999993, 0.699999999999999956, 0.719999999999999973, 11, 'bk-sw-10_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-09-06', 'Banke', 28.0285612999999998, 81.6947298000000046, 98.7346396154565014, 4.80299999999999994, 'sw', 55, NULL, 3.5, 0.550000000000000044, 2.95000000000000018, 12, 'bk-sw-30');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-09-06', 'Banke', 28.0493641999999994, 81.6616281999999956, 106.461031220321004, 4.98399999999999999, 'sw', 36, NULL, 3, 0.359999999999999987, 2.64000000000000012, 13, 'bk-sw-08_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-09-05', 'Banke', 28.1465552999999993, 81.5520084000000054, 89.9452362924772046, 4.80299999999999994, 'sw', 27, NULL, 0.849999999999999978, 0.270000000000000018, 0.57999999999999996, 14, 'bk-sw-18_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-09-05', 'Banke', 28.1287102000000004, 81.5893801999999937, 89.8854173393351061, 4.85400000000000009, 'sw', 15, NULL, 0.200000000000000011, 0.149999999999999994, 0.0500000000000000028, 15, 'bk-sw-17_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-09-05', 'Banke', 28.1060374000000017, 81.5971193999999969, 84.0191145031903943, 4.80299999999999994, 'sw', 35, NULL, 1.14999999999999991, 0.349999999999999978, 0.800000000000000044, 16, 'bk-sw-25_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-09-05', 'Banke', 28.0830400000000004, 81.5956417999999957, 96.9456997203340052, 4.80299999999999994, 'sw', 40, NULL, 2.39999999999999991, 0.400000000000000022, 2, 17, 'bk-sw-27');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-09-05', 'Banke', 28.0782336999999984, 81.5931891999999976, 97.6955231439736025, 4.55100000000000016, 'sw', 25, NULL, 0.849999999999999978, 0.25, 0.599999999999999978, 18, 'bk-sw-26');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-09-02', 'Banke', 28.0506907000000005, 81.5861033999999989, 86.387037506887097, 4.55100000000000016, 'sw', 55, NULL, 2.04999999999999982, 0.550000000000000044, 1.5, 19, 'bk-sw-28');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-09-01', 'Banke', 28.081233000000001, 81.6450482000000051, 92.0109990036855976, 4.55100000000000016, 'sw', 54, NULL, 1.69999999999999996, 0.540000000000000036, 1.15999999999999992, 20, 'bk-sw-24_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-09-01', 'Banke', 28.0928438000000007, 81.6478632999999974, 97.6330053403546003, 4.55100000000000016, 'sw', 15, NULL, 1, 0.149999999999999994, 0.849999999999999978, 21, 'bk-sw-07_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-09-01', 'Banke', 28.1317777000000007, 81.6588274000000069, 103.598624511976993, 4.55100000000000016, 'sw', 45, NULL, 0.619999999999999996, 0.450000000000000011, 0.170000000000000012, 22, 'bk-sw-06_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-08-31', 'Banke', 28.0150606000000018, 81.6542974000000044, 74.853042054006707, 4.55100000000000016, 'sw', 60, NULL, 0.800000000000000044, 0.599999999999999978, 0.200000000000000011, 23, 'bk-sw-09_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-08-31', 'Banke', 28.0020945999999995, 81.6523612999999955, 84.6796084329249936, 4.55100000000000016, 'sw', 40, NULL, 2.45000000000000018, 0.400000000000000022, 2.04999999999999982, 24, 'bk-sw-29');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-08-31', 'Banke', 28.024332600000001, 81.6002799000000039, 85.6616394736469005, 4.85400000000000009, 'sw', 50, NULL, 1.39999999999999991, 0.5, 0.900000000000000022, 25, 'bk-sw-11_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-08-09', 'Bardiya', 28.0730454000000016, 81.5542844999999943, 77.8535893248548945, 4.55100000000000016, 'sw', 60, NULL, 2.10000000000000009, 0.599999999999999978, 1.5, 26, 'bd-sw-16');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-08-09', 'Bardiya', 28.0731736000000005, 81.5542197999999985, 78.2344317668212028, 15.4730000000000008, 'sw', 55, NULL, 1.19999999999999996, 0.550000000000000044, 0.650000000000000022, 27, 'bd-sw-15');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-08-09', 'Bardiya', 28.0730752000000017, 81.5541683000000006, 99.0191562146508062, 13.6530000000000005, 'sw', 10, NULL, 1, 0.100000000000000006, 0.900000000000000022, 28, 'bd-sw-14');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-08-08', 'Bardiya', 28.190100300000001, 81.4801999000000023, 95.961910994219096, 4.80299999999999994, 'sw', 75, NULL, 2.29999999999999982, 0.75, 1.55000000000000004, 29, 'bd-sw-11');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-08-08', 'Bardiya', 28.1938306999999995, 81.479869199999996, 99.8562533972746991, 4.80299999999999994, 'sw', 60, NULL, 2.20000000000000018, 0.599999999999999978, 1.60000000000000009, 30, 'bd-sw-10');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-08-08', 'Bardiya', 28.1976927999999987, 81.4789118000000059, 103.655914182521002, 4.80299999999999994, 'sw', 45, NULL, 3, 0.450000000000000011, 2.54999999999999982, 31, 'bd-sw-07');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-08-08', 'Bardiya', 28.2140377999999998, 81.4888619000000034, 108.719010512829996, 4.80299999999999994, 'sw', 40, NULL, 1.5, 0.400000000000000022, 1.10000000000000009, 32, 'bd-sw-08');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-08-08', 'Bardiya', 28.2376964999999984, 81.5049489999999963, 115.707597150279994, 4.85400000000000009, 'sw', 32, NULL, 1.80000000000000004, 0.320000000000000007, 1.47999999999999998, 33, 'bd-sw-04');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-08-08', 'Bardiya', 28.2259072000000018, 81.4953411000000045, 118.571534036946005, 4.55100000000000016, 'sw', 10, NULL, 2, 0.100000000000000006, 1.89999999999999991, 34, 'bd-sw-22');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-08-08', 'Bardiya', 28.2214914000000014, 81.4919919999999962, 112.192593054846, 4.55100000000000016, 'sw', 40, NULL, 2, 0.400000000000000022, 1.60000000000000009, 35, 'bd-sw-21');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-08-08', 'Bardiya', 28.2172161999999993, 81.4894307999999938, 108.375736983926998, 4.55100000000000016, 'sw', 0, NULL, 1, 0, 1, 36, 'bd-sw-02');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-08-04', 'Bardiya', 28.2130177000000018, 81.327024300000005, 89.8735736705486943, 4.55100000000000016, 'sw', 10, NULL, 3, 0.100000000000000006, 2.89999999999999991, 37, 'bd-sw-13');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-08-04', 'Bardiya', 28.2179780999999998, 81.3042394999999942, 95.3728782682724017, 4.85400000000000009, 'sw', 40, NULL, 10, 0.400000000000000022, 9.59999999999999964, 38, 'bd-sw-12');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-08-04', 'Bardiya', 28.2194053999999994, 81.3116732999999954, 90.7511655261914996, 4.85400000000000009, 'sw', 50, NULL, 1, 0.5, 0.5, 39, 'bd-sw-09');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-08-04', 'Bardiya', 28.1873754000000005, 81.3347823999999946, 87.1260768682846987, 4.80299999999999994, 'sw', 40, NULL, 2.39999999999999991, 0.400000000000000022, 2, 40, 'bd-sw-06');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-08-04', 'Bardiya', 28.1897239000000006, 81.3836179999999985, 85.6524064803382004, 4.80299999999999994, 'sw', 30, NULL, 2.5, 0.299999999999999989, 2.20000000000000018, 41, 'bd-sw-05');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-08-04', 'Bardiya', 28.1880465999999998, 81.479911400000006, 97.9441794014486931, 4.55100000000000016, 'sw', 40, NULL, 2, 0.400000000000000022, 1.60000000000000009, 42, 'bd-sw-03');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-08-04', 'Bardiya', 28.1657641000000005, 81.5009533000000062, 80.4059180078067044, 4.80299999999999994, 'sw', 70, NULL, 4.09999999999999964, 0.699999999999999956, 3.39999999999999991, 43, 'bd-sw-20');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-08-04', 'Bardiya', 28.1607741000000011, 81.5015221000000025, 88.6052880191136012, 4.55100000000000016, 'sw', 30, NULL, 5, 0.299999999999999989, 4.70000000000000018, 44, 'bd-sw-19');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-08-04', 'Bardiya', 28.1478396000000011, 81.4992550999999992, 83.2796189239925013, 4.85400000000000009, 'sw', 40, NULL, 4, 0.400000000000000022, 3.60000000000000009, 45, 'bd-sw-18');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-07-31', 'Bardiya', 28.1056238, 81.4825759000000005, 92.7581376692273949, 4.55100000000000016, 'dt', 10, NULL, 9, 0.100000000000000006, 8.90000000000000036, 46, 'bd-dw-02');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-07-31', 'Bardiya', 28.0883481999999987, 81.5027486999999979, 94.4774062991047998, 4.55100000000000016, 'dt', 20, NULL, 11, 0.200000000000000011, 10.8000000000000007, 47, 'bd-dw-03');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-07-31', 'Bardiya', 28.0827807000000007, 81.511192500000007, 88.7112428009961036, 4.55100000000000016, 'dt', 24, NULL, 10, 0.239999999999999991, 9.75999999999999979, 48, 'bd-dw-04');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-07-31', 'Bardiya', 28.0852867999999987, 81.5164307000000008, 82.0217620895843993, 4.85400000000000009, 'dt', 25, NULL, 11, 0.25, 10.75, 49, 'bd-dw-01');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-08-08', 'Banke', 28.0512553000000011, 81.6024744000000055, 92.5154698478826987, 4.80299999999999994, 'dt', 27, NULL, 2.95000000000000018, 0.270000000000000018, 2.68000000000000016, 50, 'bk-dw-05');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-08-08', 'Banke', 28.1873633000000012, 81.6301126000000039, 104.933481458630993, 4.55100000000000016, 'sw', 65, NULL, 0.900000000000000022, 0.650000000000000022, 0.25, 51, 'bk-sw-04');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-08-08', 'Banke', 28.1920904000000014, 81.5748116000000039, 108.154962471998999, 4.85400000000000009, 'sw', 29, NULL, 3.20000000000000018, 0.28999999999999998, 2.91000000000000014, 52, 'bk-sw-05_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-08-08', 'Banke', 28.2065538999999994, 81.6306941999999935, 109.955068455822996, 4.55100000000000016, 'sw', 40, NULL, 6.90000000000000036, 0.400000000000000022, 6.5, 53, 'bk-sw-03');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-08-08', 'Banke', 28.1960206000000007, 81.7116575999999952, 126.394308032484005, 4.85400000000000009, 'sw', 20, NULL, 2.14999999999999991, 0.200000000000000011, 1.94999999999999996, 54, 'bk-sw-01');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-08-07', 'Banke', 28.1223066999999993, 81.5166360999999995, 97.5357944147534965, 4.85400000000000009, 'dt', 42, NULL, 12.25, 0.419999999999999984, 11.8300000000000001, 55, 'bk-dw-03');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-08-07', 'Banke', 28.1132607999999991, 81.5173165000000068, 84.9249989457817946, 4.85400000000000009, 'dt', 49, NULL, 7.07000000000000028, 0.489999999999999991, 6.58000000000000007, 56, 'bk-dw-04_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-08-07', 'Banke', 28.1114537999999996, 81.5216498000000058, 81.7870656905109996, 4.80299999999999994, 'sw', 23, NULL, 4.70000000000000018, 0.23000000000000001, 4.46999999999999975, 57, 'bk-sw-19_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-08-07', 'Banke', 28.0960082, 81.5211300999999935, 87.0620829715097955, 4.85400000000000009, 'dt', 25, NULL, 11.8499999999999996, 0.25, 11.5999999999999996, 58, 'bk-dw-02');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-08-07', 'Banke', 28.0818830999999989, 81.5466715000000022, 78.7136367903981977, 4.85400000000000009, 'dt', 37, NULL, 11.4299999999999997, 0.369999999999999996, 11.0600000000000005, 59, 'bk-dw-01');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-08-01', 'Banke', 27.9833300999999999, 81.7132517999999948, 88.9972216525406026, 4.85400000000000009, 'sw', 70, NULL, 2.79999999999999982, 0.699999999999999956, 2.10000000000000009, 60, 'bk-sw-10_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-08-01', 'Banke', 28.0285243999999985, 81.6947762000000068, 89.7374374571722058, 4.55100000000000016, 'sw', 55, NULL, 4.59999999999999964, 0.550000000000000044, 4.04999999999999982, 61, 'bk-sw-30');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-08-01', 'Banke', 28.0493631999999984, 81.6616934000000043, 99.4560063783603994, 4.55100000000000016, 'sw', 36, NULL, 4.45000000000000018, 0.359999999999999987, 4.08999999999999986, 62, 'bk-sw-08_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-07-30', 'Banke', 28.1465129999999988, 81.5519981000000058, 91.4254288993796962, 4.55100000000000016, 'sw', 27, NULL, 2.10000000000000009, 0.270000000000000018, 1.83000000000000007, 63, 'bk-sw-18_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-07-30', 'Banke', 28.1287279000000012, 81.5893932999999976, 94.8936701995694989, 4.55100000000000016, 'sw', 15, NULL, 0.599999999999999978, 0.149999999999999994, 0.450000000000000011, 64, 'bk-sw-17_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-07-30', 'Banke', 28.1060572999999998, 81.5971598, 98.8018973854388065, 4.55100000000000016, 'sw', 35, NULL, 2.29999999999999982, 0.349999999999999978, 1.94999999999999996, 65, 'bk-sw-25_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-07-30', 'Banke', 28.0830328000000016, 81.5956347000000051, 104.326637323482004, 4.55100000000000016, 'sw', 40, NULL, 4.04999999999999982, 0.400000000000000022, 3.64999999999999991, 66, 'bk-sw-27');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-07-30', 'Banke', 28.0780774999999991, 81.593297800000002, 89.7038483750425968, 4.55100000000000016, 'sw', 25, NULL, 2.2200000000000002, 0.25, 1.96999999999999997, 67, 'bk-sw-26');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-07-29', 'Banke', 28.0811704000000013, 81.6450556000000063, 88.6530072644099931, 4.85400000000000009, 'sw', 54, NULL, 2, 0.540000000000000036, 1.45999999999999996, 68, 'bk-sw-24_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-07-29', 'Banke', 28.0928925000000014, 81.6478424999999959, 102.432088866976997, 4.80299999999999994, 'sw', 15, NULL, 1.85000000000000009, 0.149999999999999994, 1.69999999999999996, 69, 'bk-sw-07_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-07-29', 'Banke', 28.1318063999999985, 81.6588430000000045, 99.7581389738013939, 4.55100000000000016, 'sw', 45, NULL, 0.630000000000000004, 0.450000000000000011, 0.179999999999999993, 70, 'bk-sw-06_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-07-28', 'Banke', 28.0150992000000016, 81.6543027000000023, 88.4639138786618986, 4.55100000000000016, 'sw', 60, NULL, 2.5, 0.599999999999999978, 1.89999999999999991, 71, 'bk-sw-09_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-07-28', 'Banke', 28.002022199999999, 81.6523501000000067, 97.7865799057509975, 4.85400000000000009, 'sw', 40, NULL, 4.40000000000000036, 0.400000000000000022, 4, 72, 'bk-sw-29');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-07-28', 'Banke', 28.024256900000001, 81.6002579000000026, 94.100432831946506, 4.55100000000000016, 'sw', 50, NULL, 2.85000000000000009, 0.5, 2.35000000000000009, 73, 'bk-sw-11_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-07-28', 'Banke', 28.0507396, 81.586159600000002, 101.011875127834998, 4.85400000000000009, 'sw', 55, NULL, 3.75, 0.550000000000000044, 3.20000000000000018, 74, 'bk-sw-28');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-09', 'Bardiya', 28.3062454000000017, 81.3597584999999981, 93.0831015562833954, 4.85400000000000009, 'sw', 60, NULL, 3.5, 0.599999999999999978, 2.89999999999999991, 75, 'bd-sw-10');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-07-12', 'Bardiya', 28.0730451999999993, 81.5543576999999971, 97.9411922379597968, 4.85400000000000009, 'sw', 60, NULL, 4, 0.599999999999999978, 3.39999999999999991, 76, 'bd-sw-16');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-07-11', 'Bardiya', 28.0726544999999987, 81.5557369999999935, 92.1174334770152967, 4.80299999999999994, 'sw', 10, NULL, 1.80000000000000004, 0.100000000000000006, 1.69999999999999996, 77, 'bd-sw-14');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-07-11', 'Bardiya', 28.0732530999999987, 81.5542073000000016, 90.639273408481003, 4.85400000000000009, 'sw', 55, NULL, 2, 0.550000000000000044, 1.44999999999999996, 78, 'bd-sw-15');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-07-10', 'Bardiya', 28.1973808999999989, 81.4788891000000035, 97.806971175902703, 4.55100000000000016, 'sw', 75, NULL, 3.39999999999999991, 0.75, 2.64999999999999991, 79, 'bd-sw-11');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-07-10', 'Bardiya', 28.2165731999999991, 81.4892173000000071, 112.273140953953003, 4.80299999999999994, 'sw', 60, NULL, 3.20000000000000018, 0.599999999999999978, 2.60000000000000009, 80, 'bd-sw-10');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-07-10', 'Bardiya', 28.2462444999999995, 81.513391900000002, 118.456722595599999, 4.55100000000000016, 'sw', 45, NULL, 5, 0.450000000000000011, 4.54999999999999982, 81, 'bd-sw-07');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-07-10', 'Bardiya', 28.3008148000000013, 81.4351817999999952, 127.388415244735, 4.80299999999999994, 'sw', 40, NULL, 3, 0.400000000000000022, 2.60000000000000009, 82, 'bd-sw-08');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-07-10', 'Bardiya', 28.2897981999999999, 81.442026999999996, 108.344533657273999, 4.85400000000000009, 'sw', 32, NULL, 3.39999999999999991, 0.320000000000000007, 3.08000000000000007, 83, 'bd-sw-04');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-07-10', 'Bardiya', 28.2433794999999996, 81.5760717, 123.967910852692995, 4.85400000000000009, 'sw', 10, NULL, 2.29999999999999982, 0.100000000000000006, 2.20000000000000018, 84, 'bd-sw-22');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-07-10', 'Bardiya', 28.2282736000000014, 81.5671628000000055, 108.887217528237997, 4.55100000000000016, 'sw', 40, NULL, 2.20000000000000018, 0.400000000000000022, 1.80000000000000004, 85, 'bd-sw-21');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-07-10', 'Bardiya', 28.2364798999999991, 81.5477235000000036, 100.400177570102997, 4.55100000000000016, 'sw', 0, NULL, 2, 0, 2, 86, 'bd-sw-02');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-07-08', 'Bardiya', 28.2168546000000013, 81.3130812999999932, 98.6391763643193968, 4.85400000000000009, 'sw', 10, NULL, 4.29999999999999982, 0.100000000000000006, 4.20000000000000018, 87, 'bd-sw-13');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-07-08', 'Bardiya', 28.2462792, 81.3065368000000035, 84.1560433010933053, 4.85400000000000009, 'sw', 40, NULL, 12.3000000000000007, 0.400000000000000022, 11.9000000000000004, 88, 'bd-sw-12');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-07-08', 'Bardiya', 28.246278499999999, 81.3065593000000035, 83.7797258909202043, 4.55100000000000016, 'sw', 50, NULL, 4.20000000000000018, 0.5, 3.70000000000000018, 89, 'bd-sw-09');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-07-08', 'Bardiya', 28.1691567999999997, 81.3378622999999976, 82.3797624980635987, 4.85400000000000009, 'sw', 40, NULL, 6.20000000000000018, 0.400000000000000022, 5.79999999999999982, 90, 'bd-sw-06');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-07-08', 'Bardiya', 28.1897079999999995, 81.3836146999999954, 79.9099911359076032, 4.80299999999999994, 'sw', 30, NULL, 5.40000000000000036, 0.299999999999999989, 5.09999999999999964, 91, 'bd-sw-05');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-07-08', 'Bardiya', 28.1880088999999998, 81.4798633000000052, 90.7767564541734941, 4.85400000000000009, 'sw', 40, NULL, 4.20000000000000018, 0.400000000000000022, 3.79999999999999982, 92, 'bd-sw-03');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-07-08', 'Bardiya', 28.1658782000000016, 81.5010352999999981, 93.0697949831112936, 4.85400000000000009, 'sw', 0, NULL, 5.29999999999999982, 0, 5.29999999999999982, 93, 'bd-sw-17');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-07-08', 'Bardiya', 28.1462922999999989, 81.479336399999994, 89.8506928599402954, 4.55100000000000016, 'sw', 30, NULL, 6.20000000000000018, 0.299999999999999989, 5.90000000000000036, 94, 'bd-sw-19');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-07-08', 'Bardiya', 28.148681400000001, 81.4968269999999961, 85.6439343566518971, 4.80299999999999994, 'sw', 40, NULL, 5.20000000000000018, 0.400000000000000022, 4.79999999999999982, 95, 'bd-sw-18');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-07-06', 'Bardiya', 28.1056001000000002, 81.4828040999999956, 86.6898637930355989, 4.85400000000000009, 'dt', 10, NULL, 10.3000000000000007, 0.100000000000000006, 10.1999999999999993, 96, 'bd-dw-02');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-07-06', 'Bardiya', 28.088355700000001, 81.5027002000000067, 86.3437254832099939, 4.85400000000000009, 'dt', 20, NULL, 12.0999999999999996, 0.200000000000000011, 11.9000000000000004, 97, 'bd-dw-03');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-07-06', 'Bardiya', 28.0828789000000008, 81.511114500000005, 80.8468903454475054, 4.80299999999999994, 'dt', 24, NULL, 10.1999999999999993, 0.239999999999999991, 9.96000000000000085, 98, 'bd-dw-04');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-07-06', 'Bardiya', 28.0852523000000005, 81.5163727999999992, 83.6368732261931029, 4.80299999999999994, 'dt', 25, NULL, 12.0999999999999996, 0.25, 11.8499999999999996, 99, 'bd-dw-01');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-29', 'Banke', 28.1317725000000003, 81.6588471000000027, 104.234755212954994, 4.85400000000000009, 'sw', 45, NULL, 0.719999999999999973, 0.450000000000000011, 0.270000000000000018, 100, 'bk-sw-06_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-29', 'Banke', 28.1873244000000014, 81.6301050999999944, 109.900542823284994, 4.85400000000000009, 'sw', 65, NULL, 1.14999999999999991, 0.650000000000000022, 0.5, 101, 'bk-sw-04');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-29', 'Banke', 28.1920661999999993, 81.5748190000000051, 92.8067941589298044, 4.80299999999999994, 'sw', 29, NULL, 3.29999999999999982, 0.28999999999999998, 3.00999999999999979, 102, 'bk-sw-05_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-29', 'Banke', 28.2065303999999983, 81.6307360999999929, 102.696006742006006, 4.80299999999999994, 'sw', 40, NULL, 7.29999999999999982, 0.400000000000000022, 6.90000000000000036, 103, 'bk-sw-03');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-29', 'Banke', 28.1960405999999999, 81.7117094000000037, 115.289609767296994, 4.85400000000000009, 'sw', 20, NULL, 2.47999999999999998, 0.200000000000000011, 2.2799999999999998, 104, 'bk-sw-01');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-28', 'Banke', 28.1465205999999988, 81.552026799999993, 99.4660477566889938, 4.55100000000000016, 'sw', 27, NULL, 2.79999999999999982, 0.270000000000000018, 2.5299999999999998, 105, 'bk-sw-18_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-28', 'Banke', 28.1287188999999991, 81.5894229999999965, 85.5559955469606024, 4.85400000000000009, 'sw', 15, NULL, 2.66999999999999993, 0.149999999999999994, 2.52000000000000002, 106, 'bk-sw-17_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-28', 'Banke', 28.1060674000000006, 81.5971463999999997, 94.0078271302596988, 4.85400000000000009, 'sw', 35, NULL, 3.20000000000000018, 0.349999999999999978, 2.85000000000000009, 107, 'bk-sw-25_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-28', 'Banke', 28.0830233000000007, 81.5956242000000032, 95.6794249811756998, 6.06799999999999962, 'sw', 40, NULL, 4.09999999999999964, 0.400000000000000022, 3.70000000000000018, 108, 'bk-sw-27');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-28', 'Banke', 28.0780270999999999, 81.593283299999996, 91.5808983327212047, 4.85400000000000009, 'sw', 25, NULL, 2.56999999999999984, 0.25, 2.31999999999999984, 109, 'bk-sw-26');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-27', 'Banke', 28.0818678000000013, 81.5466471999999953, 85.2661368414695033, 4.55100000000000016, 'dt', 37, NULL, 11.25, 0.369999999999999996, 10.8800000000000008, 110, 'bk-dw-01');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-27', 'Banke', 28.0960614, 81.5211524999999995, 92.2674474303695007, 4.85400000000000009, 'dt', 25, NULL, 11.9499999999999993, 0.25, 11.6999999999999993, 111, 'bk-dw-02');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-27', 'Banke', 28.1222586999999997, 81.5165324999999967, 93.8586501850974031, 4.85400000000000009, 'dt', 42, NULL, 12.0999999999999996, 0.419999999999999984, 11.6799999999999997, 112, 'bk-dw-03');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-27', 'Banke', 28.1132491000000009, 81.5173494999999946, 86.4275587127073948, 4.55100000000000016, 'dt', 49, NULL, 7.79999999999999982, 0.489999999999999991, 7.30999999999999961, 113, 'bk-dw-04_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-27', 'Banke', 28.1115142999999996, 81.5216446000000019, 86.904973182203193, 4.55100000000000016, 'sw', 23, NULL, 5.65000000000000036, 0.23000000000000001, 5.41999999999999993, 114, 'bk-sw-19_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-27', 'Banke', 28.0507400000000011, 81.5861809000000022, 90.6386905533990017, 4.55100000000000016, 'sw', 55, NULL, 6.79999999999999982, 0.550000000000000044, 6.25, 115, 'bk-sw-28');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-27', 'Banke', 28.0512337999999986, 81.602441799999994, 103.208147385174001, 4.85400000000000009, 'dt', 27, NULL, 3.70000000000000018, 0.270000000000000018, 3.43000000000000016, 116, 'bk-dw-05');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-25', 'Banke', 27.9833290999999988, 81.7133237999999977, 81.7768925940766991, 4.55100000000000016, 'sw', 70, NULL, 2.68999999999999995, 0.699999999999999956, 1.98999999999999999, 117, 'bk-sw-10_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-25', 'Banke', 28.0285301000000011, 81.6946951999999982, 84.9075892199709017, 4.55100000000000016, 'sw', 55, NULL, 4.79999999999999982, 0.550000000000000044, 4.25, 118, 'bk-sw-30');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-25', 'Banke', 28.0493765999999987, 81.6616486000000066, 81.257243091307501, 4.85400000000000009, 'sw', 36, NULL, 5.29999999999999982, 0.359999999999999987, 4.94000000000000039, 119, 'bk-sw-08_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-23', 'Banke', 28.0812159000000001, 81.6450162999999947, 97.0263965285970045, 4.55100000000000016, 'sw', 54, NULL, 2.29999999999999982, 0.540000000000000036, 1.76000000000000001, 120, 'bk-sw-24_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-23', 'Banke', 28.0928992999999991, 81.6478288999999933, 102.185351615374003, 4.80299999999999994, 'sw', 15, NULL, 2.45000000000000018, 0.149999999999999994, 2.29999999999999982, 121, 'bk-sw-07_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-22', 'Banke', 28.0019837000000003, 81.652418400000002, 83.1203286238701935, 4.80299999999999994, 'sw', 40, NULL, 4.59999999999999964, 0.400000000000000022, 4.20000000000000018, 122, 'bk-sw-29');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-22', 'Banke', 28.0151418999999997, 81.6543268000000069, 73.2190026473802931, 4.98399999999999999, 'sw', 60, NULL, 2.7799999999999998, 0.599999999999999978, 2.18000000000000016, 123, 'bk-sw-09_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-22', 'Banke', 28.0242235000000015, 81.6002957999999978, 97.8392627550296936, 4.55100000000000016, 'sw', 50, NULL, 5.79999999999999982, 0.5, 5.29999999999999982, 124, 'bk-sw-11_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-11', 'Bardiya', 28.0731317000000011, 81.5541922000000028, 88.778082981509101, 4.80299999999999994, 'sw', 60, NULL, 4.5, 0.599999999999999978, 3.89999999999999991, 125, 'bd-sw-16');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-11', 'Bardiya', 28.0731962999999993, 81.5542336000000034, 82.9985194683518017, 4.55100000000000016, 'sw', 55, NULL, 2.60000000000000009, 0.550000000000000044, 2.04999999999999982, 126, 'bd-sw-15');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-11', 'Bardiya', 28.0731609000000013, 81.5541300000000007, 78.9341319497053036, 4.85400000000000009, 'sw', 10, NULL, 2.5, 0.100000000000000006, 2.39999999999999991, 127, 'bd-sw-14');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-09', 'Bardiya', 28.3062070000000006, 81.3597747000000027, 97.5873699042385994, 4.85400000000000009, 'sw', 75, NULL, 4, 0.75, 3.25, 128, 'bd-sw-11');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-09', 'Bardiya', 28.3062445999999994, 81.3597735000000029, 102.696426016309999, 4.55100000000000016, 'sw', 45, NULL, 6, 0.450000000000000011, 5.54999999999999982, 129, 'bd-sw-07');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-09', 'Bardiya', 28.3512264999999992, 81.4297432999999984, 134.999477914814008, 4.85400000000000009, 'sw', 40, NULL, 5, 0.400000000000000022, 4.59999999999999964, 130, 'bd-sw-08');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-09', 'Bardiya', 28.2897995999999985, 81.4420530999999954, 106.688363213545998, 4.85400000000000009, 'sw', 32, NULL, 3.79999999999999982, 0.320000000000000007, 3.47999999999999998, 131, 'bd-sw-04');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-09', 'Bardiya', 28.2283599000000009, 81.5671116999999981, 92.6491992784602019, 4.85400000000000009, 'sw', 10, NULL, 5.20000000000000018, 0.100000000000000006, 5.09999999999999964, 132, 'bd-sw-22');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-09', 'Bardiya', 28.2490923000000009, 81.5849371999999988, 107.949087626502006, 4.80299999999999994, 'sw', 40, NULL, 5, 0.400000000000000022, 4.59999999999999964, 133, 'bd-sw-21');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-09', 'Bardiya', 28.2365263000000013, 81.5477659000000017, 97.1942884800331939, 4.80299999999999994, 'sw', 0, NULL, 3, 0, 3, 134, 'bd-sw-02');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-07', 'Bardiya', 28.3287565999999984, 81.2715498999999966, 122.394510654624, 4.55100000000000016, 'sw', 10, NULL, 4, 0.100000000000000006, 3.89999999999999991, 135, 'bd-sw-13');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-07', 'Bardiya', 28.2795966000000014, 81.2629383000000018, 91.3649834629653981, 4.80299999999999994, 'sw', 40, NULL, 12, 0.400000000000000022, 11.5999999999999996, 136, 'bd-sw-12');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-07', 'Bardiya', 28.2474920000000012, 81.3080601000000058, 113.689604670563, 4.85400000000000009, 'sw', 50, NULL, 4, 0.5, 3.5, 137, 'bd-sw-09');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-07', 'Bardiya', 28.1691825999999992, 81.3378217000000063, 81.7140546767128058, 4.85400000000000009, 'sw', 40, NULL, 4, 0.400000000000000022, 3.60000000000000009, 138, 'bd-sw-06');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-07', 'Bardiya', 28.1896926000000008, 81.3836598999999978, 97.534027045424196, 4.85400000000000009, 'sw', 30, NULL, 5, 0.299999999999999989, 4.70000000000000018, 139, 'bd-sw-05');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-07', 'Bardiya', 28.1880287000000003, 81.479920000000007, 93.2175880749624071, 4.85400000000000009, 'sw', 40, NULL, 4, 0.400000000000000022, 3.60000000000000009, 140, 'bd-sw-03');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-07', 'Bardiya', 28.1656119999999994, 81.5008629000000013, 92.759490821812193, 4.80299999999999994, 'sw', 70, NULL, 5.09999999999999964, 0.699999999999999956, 4.40000000000000036, 141, 'bd-sw-20');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-07', 'Bardiya', 28.1463226999999989, 81.479231900000002, 93.1927285647052059, 4.80299999999999994, 'sw', 30, NULL, 6, 0.299999999999999989, 5.70000000000000018, 142, 'bd-sw-19');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-07', 'Bardiya', 28.1487553000000013, 81.4969459000000001, 96.1783577141603985, 4.80299999999999994, 'sw', 40, NULL, 5, 0.400000000000000022, 4.59999999999999964, 143, 'bd-sw-18');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-03', 'Bardiya', 28.1054667999999985, 81.482779800000003, 79.7305391392500979, 4.80299999999999994, 'dt', 10, NULL, 10.1999999999999993, 0.100000000000000006, 10.0999999999999996, 144, 'bd-dw-02');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-03', 'Bardiya', 28.0883383000000002, 81.5027307999999948, 91.8276472456416997, 4.85400000000000009, 'dt', 20, NULL, 12, 0.200000000000000011, 11.8000000000000007, 145, 'bd-dw-03');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-03', 'Bardiya', 28.0828452000000013, 81.5111835999999954, 84.446545499893503, 4.85400000000000009, 'dt', 24, NULL, 10, 0.239999999999999991, 9.75999999999999979, 146, 'bd-dw-04');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-03', 'Bardiya', 28.0851481000000014, 81.5164415999999932, 86.747153797927993, 4.85400000000000009, 'dt', 25, NULL, 12, 0.25, 11.75, 147, 'bd-dw-01');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-05', 'Banke', 28.1873062999999995, 81.6300652000000042, 106.366012180029003, 4.85400000000000009, 'sw', 65, NULL, 2.56000000000000005, 0.650000000000000022, 1.90999999999999992, 148, 'bk-sw-04');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-05', 'Banke', 28.1921120000000016, 81.5747877999999957, 90.6631401708449971, 4.80299999999999994, 'sw', 29, NULL, 3.39999999999999991, 0.28999999999999998, 3.10999999999999988, 149, 'bk-sw-05_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-05', 'Banke', 28.2064948000000015, 81.6307426000000049, 110.279586933887003, 4.55100000000000016, 'sw', 40, NULL, 7.59999999999999964, 0.400000000000000022, 7.20000000000000018, 150, 'bk-sw-03');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-05', 'Banke', 28.1961551999999998, 81.7119905999999929, 96.8091919773841028, 15.1699999999999999, 'sw', 20, NULL, 3.39999999999999991, 0.200000000000000011, 3.20000000000000018, 151, 'bk-sw-01');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-05', 'Banke', 28.1317498999999991, 81.6588234999999969, 106.534942058186999, 4.55100000000000016, 'sw', 45, NULL, 2.14999999999999991, 0.450000000000000011, 1.69999999999999996, 152, 'bk-sw-06_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-05', 'Banke', 28.0928325000000001, 81.6477811999999972, 103.081508433636003, 4.85400000000000009, 'sw', 15, NULL, 3.60000000000000009, 0.149999999999999994, 3.45000000000000018, 153, 'bk-sw-07_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-05', 'Banke', 28.0812217000000004, 81.6450477000000063, 88.4771487638633971, 4.80299999999999994, 'sw', 54, NULL, 3.54999999999999982, 0.540000000000000036, 3.00999999999999979, 154, 'bk-sw-24_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-03', 'Banke', 28.0818000999999988, 81.5465757999999994, 87.7257975025184038, 4.85400000000000009, 'dt', 37, NULL, 11.1300000000000008, 0.369999999999999996, 10.7599999999999998, 155, 'bk-dw-01');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-03', 'Banke', 28.0960591000000015, 81.5211445999999995, 83.0671646845291036, 4.55100000000000016, 'dt', 25, NULL, 11.4000000000000004, 0.25, 11.1500000000000004, 156, 'bk-dw-02');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-03', 'Banke', 28.1224142000000015, 81.5165705999999943, 97.9486607393995001, 4.85400000000000009, 'dt', 42, NULL, 11.4499999999999993, 0.419999999999999984, 11.0299999999999994, 157, 'bk-dw-03');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-03', 'Banke', 28.1132506999999983, 81.5173520999999965, 93.8831142038579998, 4.55100000000000016, 'dt', 49, NULL, 7.75, 0.489999999999999991, 7.25999999999999979, 158, 'bk-dw-04_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-03', 'Banke', 28.1114710000000017, 81.5216666999999973, 86.160323907533396, 4.80299999999999994, 'sw', 23, NULL, 5.90000000000000036, 0.23000000000000001, 5.66999999999999993, 159, 'bk-sw-19_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-02', 'Banke', 28.0507597000000004, 81.5861888999999962, 91.8644736499288967, 4.55100000000000016, 'sw', 55, NULL, 6.15000000000000036, 0.550000000000000044, 5.59999999999999964, 160, 'bk-sw-28');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-06-02', 'Banke', 28.0513304999999988, 81.6024486000000024, 86.4348803475657945, 4.85400000000000009, 'dt', 27, NULL, 4.70000000000000018, 0.270000000000000018, 4.42999999999999972, 161, 'bk-dw-05');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-05-31', 'Banke', 28.1465390000000006, 81.5520657999999941, 116.399174875138996, 69.0229999999999961, 'sw', 27, NULL, 4, 0.270000000000000018, 3.72999999999999998, 162, 'bk-sw-18_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-05-31', 'Banke', 28.1287362999999999, 81.5894037999999995, 86.3843422320969978, 4.85400000000000009, 'sw', 15, NULL, 4.21999999999999975, 0.149999999999999994, 4.07000000000000028, 163, 'bk-sw-17_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-05-31', 'Banke', 28.1060616000000003, 81.5971124999999944, 83.9424239534994996, 4.55100000000000016, 'sw', 35, NULL, 3.75, 0.349999999999999978, 3.39999999999999991, 164, 'bk-sw-25_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-05-31', 'Banke', 28.083026799999999, 81.5956127999999978, 85.9312953977698015, 4.85400000000000009, 'sw', 40, NULL, 4.75, 0.400000000000000022, 4.34999999999999964, 165, 'bk-sw-27');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-05-31', 'Banke', 28.0780649999999987, 81.5932423, 99.7016653723046034, 4.80299999999999994, 'sw', 25, NULL, 3.35000000000000009, 0.25, 3.10000000000000009, 166, 'bk-sw-26');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-05-30', 'Banke', 27.9833037000000004, 81.7134115000000065, 91.0059828615475936, 4.55100000000000016, 'sw', 70, NULL, 3.62000000000000011, 0.699999999999999956, 2.91999999999999993, 167, 'bk-sw-10_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-05-30', 'Banke', 28.0285083999999998, 81.6947301999999951, 99.9475006774224966, 4.55100000000000016, 'sw', 55, NULL, 4.90000000000000036, 0.550000000000000044, 4.34999999999999964, 168, 'bk-sw-30');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-05-30', 'Banke', 28.0493659999999991, 81.6617059000000012, 103.190106678129993, 4.85400000000000009, 'sw', 36, NULL, 6.59999999999999964, 0.359999999999999987, 6.24000000000000021, 169, 'bk-sw-08_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-05-28', 'Banke', 28.0020503000000005, 81.6523607999999967, 77.3121020290518004, 4.85400000000000009, 'sw', 40, NULL, 5, 0.400000000000000022, 4.59999999999999964, 170, 'bk-sw-29');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-05-28', 'Banke', 28.0151195999999985, 81.6543401999999929, 89.186706465605198, 4.55100000000000016, 'sw', 60, NULL, 3.25999999999999979, 0.599999999999999978, 2.66000000000000014, 171, 'bk-sw-09_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-05-28', 'Banke', 28.0242824000000006, 81.6002926999999971, 83.8583665631790041, 4.85400000000000009, 'sw', 50, NULL, 5.5, 0.5, 5, 172, 'bk-sw-11_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-05-12', 'Bardiya', 28.3065034000000004, 81.3591937999999999, 82.8447352678177964, 4.80299999999999994, 'sw', 75, NULL, 4.29999999999999982, 0.75, 3.54999999999999982, 173, 'bd-sw-11');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-05-12', 'Bardiya', 28.3056538000000018, 81.359322700000007, 98.3342725136696032, 4.55100000000000016, 'sw', 60, NULL, 4, 0.599999999999999978, 3.39999999999999991, 174, 'bd-sw-10');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-05-12', 'Bardiya', 28.3061840999999994, 81.359747200000001, 97.7331264300408975, 4.55100000000000016, 'sw', 45, NULL, 5, 0.450000000000000011, 4.54999999999999982, 175, 'bd-sw-07');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-05-12', 'Bardiya', 28.351191, 81.429748900000007, 109.682734548132004, 4.85400000000000009, 'sw', 40, NULL, 4.20000000000000018, 0.400000000000000022, 3.79999999999999982, 176, 'bd-sw-08');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-05-12', 'Bardiya', 28.2897791000000005, 81.4420662999999934, 108.203805144677006, 4.80299999999999994, 'sw', 32, NULL, 4, 0.320000000000000007, 3.68000000000000016, 177, 'bd-sw-04');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-05-12', 'Bardiya', 28.2272297999999999, 81.5711189000000019, 105.653496825771995, 4.80299999999999994, 'sw', 10, NULL, 6.5, 0.100000000000000006, 6.40000000000000036, 178, 'bd-sw-22');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-05-12', 'Bardiya', 28.2490759000000011, 81.5850065999999998, 105.653496825771995, 4.85400000000000009, 'sw', 40, NULL, 6.20000000000000018, 0.400000000000000022, 5.79999999999999982, 179, 'bd-sw-21');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-05-12', 'Bardiya', 28.2363038999999993, 81.5474052, 111.574034897868998, 4.55100000000000016, 'sw', 0, NULL, 2.60000000000000009, 0, 2.60000000000000009, 180, 'bd-sw-02');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-05-11', 'Bardiya', 28.0726660999999993, 81.5550288999999964, 88.4754930469688929, 4.80299999999999994, 'sw', 60, NULL, 5, 0.599999999999999978, 4.40000000000000036, 181, 'bd-sw-16');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-05-11', 'Bardiya', 28.073039099999999, 81.5543626000000046, 77.4547242895659025, 4.55100000000000016, 'sw', 10, NULL, 3, 0.100000000000000006, 2.89999999999999991, 182, 'bd-sw-14');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-05-11', 'Bardiya', 28.0732362000000002, 81.5542298000000017, 87.9150105804170039, 4.85400000000000009, 'sw', 55, NULL, 3.20000000000000018, 0.550000000000000044, 2.64999999999999991, 183, 'bd-sw-15');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-05-03', 'Bardiya', 28.3287711000000009, 81.2715108999999956, 104.565251146319994, 4.85400000000000009, 'sw', 10, NULL, 4, 0.100000000000000006, 3.89999999999999991, 184, 'bd-sw-13');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-05-03', 'Bardiya', 28.2797085000000017, 81.2629711000000015, 70.770465469348693, 4.85400000000000009, 'sw', 40, NULL, 12.1999999999999993, 0.400000000000000022, 11.8000000000000007, 185, 'bd-sw-12');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-05-03', 'Bardiya', 28.2473889999999983, 81.3078139999999934, 97.7938722056927929, 4.85400000000000009, 'sw', 50, NULL, 6, 0.5, 5.5, 186, 'bd-sw-09');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-05-03', 'Bardiya', 28.1691666000000005, 81.3378431000000006, 85.675792468101605, 4.85400000000000009, 'sw', 40, NULL, 7, 0.400000000000000022, 6.59999999999999964, 187, 'bd-sw-06');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-05-03', 'Bardiya', 28.1896655000000003, 81.3835947999999973, 85.1913276063081071, 4.55100000000000016, 'sw', 30, NULL, 5.20000000000000018, 0.299999999999999989, 4.90000000000000036, 188, 'bd-sw-05');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-05-03', 'Bardiya', 28.1880203999999992, 81.4800895000000054, 90.2656892411881984, 4.85400000000000009, 'sw', 40, NULL, 5, 0.400000000000000022, 4.59999999999999964, 189, 'bd-sw-03');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-05-03', 'Bardiya', 28.1655665999999982, 81.5009191999999985, 94.4946838405272018, 4.80299999999999994, 'sw', 70, NULL, 5.29999999999999982, 0.699999999999999956, 4.59999999999999964, 190, 'bd-sw-20');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-05-03', 'Bardiya', 28.1463615999999988, 81.4791081000000048, 92.151195722413803, 4.80299999999999994, 'sw', 30, NULL, 6.29999999999999982, 0.299999999999999989, 6, 191, 'bd-sw-19');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-05-03', 'Bardiya', 28.1486881999999987, 81.4968085000000002, 97.0052968108392975, 4.55100000000000016, 'sw', 40, NULL, 5.09999999999999964, 0.400000000000000022, 4.70000000000000018, 192, 'bd-sw-18');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-05-02', 'Bardiya', 28.1055615000000003, 81.4827863999999948, 85.075390359788102, 4.85400000000000009, 'dt', 10, NULL, 12.5, 0.100000000000000006, 12.4000000000000004, 193, 'bd-dw-02');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-05-02', 'Bardiya', 28.0883798999999996, 81.502734899999993, 91.7561484375799949, 4.80299999999999994, 'dt', 20, NULL, 14.4000000000000004, 0.200000000000000011, 14.1999999999999993, 194, 'bd-dw-03');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-05-02', 'Bardiya', 28.0828898000000002, 81.5111102999999986, 72.2601964688668943, 4.85400000000000009, 'dt', 24, NULL, 12.1999999999999993, 0.239999999999999991, 11.9600000000000009, 195, 'bd-dw-04');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-11', 'Bardiya', 28.0852283000000007, 81.5164005999999972, 82.3626950340603941, 4.80299999999999994, 'dt', 25, NULL, 10.4000000000000004, 0.25, 10.1500000000000004, 196, 'bd-dw-01');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-05-04', 'Banke', 28.1873611000000004, 81.630082900000005, 99.1688214001918027, 4.55100000000000016, 'sw', 65, NULL, 3.33000000000000007, 0.650000000000000022, 2.68000000000000016, 197, 'bk-sw-04');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-05-04', 'Banke', 28.1920940000000009, 81.5747805999999969, 85.3374334201160991, 4.55100000000000016, 'sw', 29, NULL, 3.45000000000000018, 0.28999999999999998, 3.16000000000000014, 198, 'bk-sw-05_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-05-04', 'Banke', 28.2064790000000016, 81.6307385000000068, 102.930405481023001, 4.85400000000000009, 'sw', 40, NULL, 7.75, 0.400000000000000022, 7.34999999999999964, 199, 'bk-sw-03');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-05-04', 'Banke', 28.1960893000000006, 81.7117338000000046, 114.678039589318999, 4.55100000000000016, 'sw', 20, NULL, 3.85999999999999988, 0.200000000000000011, 3.66000000000000014, 200, 'bk-sw-01');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-05-04', 'Banke', 28.1317866000000016, 81.658772600000006, 93.923164203485598, 4.80299999999999994, 'sw', 45, NULL, 3.04000000000000004, 0.450000000000000011, 2.58999999999999986, 201, 'bk-sw-06_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-05-04', 'Banke', 28.0928843999999991, 81.6478464000000059, 94.6084195876132981, 4.55100000000000016, 'sw', 15, NULL, 4.90000000000000036, 0.149999999999999994, 4.75, 202, 'bk-sw-07_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-05-04', 'Banke', 28.0812129000000006, 81.6451033999999964, 88.4070826679799069, 4.85400000000000009, 'sw', 54, NULL, 4.84999999999999964, 0.540000000000000036, 4.30999999999999961, 203, 'bk-sw-24_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-30', 'Banke', 28.0817475999999999, 81.5465879999999999, 109.668002134356996, 4.85400000000000009, 'dt', 37, NULL, 11.5, 0.369999999999999996, 11.1300000000000008, 204, 'bk-dw-01');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-30', 'Banke', 28.0960959999999993, 81.5211544000000004, 85.4471323986285967, 4.55100000000000016, 'dt', 25, NULL, 11.5500000000000007, 0.25, 11.3000000000000007, 205, 'bk-dw-02');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-30', 'Banke', 28.1132901000000004, 81.5172898000000004, 83.5286087231964984, 4.55100000000000016, 'dt', 49, NULL, 11.6500000000000004, 0.489999999999999991, 11.1600000000000001, 206, 'bk-dw-04_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-30', 'Banke', 28.1223558999999987, 81.5165504999999939, 83.6845414484197931, 4.55100000000000016, 'dt', 42, NULL, 11.6500000000000004, 0.419999999999999984, 11.2300000000000004, 207, 'bk-dw-03');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-30', 'Banke', 28.1114846000000007, 81.5216170000000062, 85.1059373986426948, 4.85400000000000009, 'sw', 23, NULL, 6.04999999999999982, 0.23000000000000001, 5.82000000000000028, 208, 'bk-sw-19_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-30', 'Banke', 28.0512931999999999, 81.6024373999999995, 91.9620172218194938, 4.80299999999999994, 'dt', 27, NULL, 4.79999999999999982, 0.270000000000000018, 4.53000000000000025, 209, 'bk-dw-05');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-26', 'Banke', 28.1465239999999994, 81.5519812999999942, 84.5479368320390989, 4.55100000000000016, 'sw', 27, NULL, 4.29999999999999982, 0.270000000000000018, 4.03000000000000025, 210, 'bk-sw-18_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-26', 'Banke', 28.1287133999999988, 81.5893535000000014, 94.2931571624913971, 4.85400000000000009, 'sw', 15, NULL, 4.25, 0.149999999999999994, 4.09999999999999964, 211, 'bk-sw-17_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-26', 'Banke', 28.1060556000000012, 81.5971341000000052, 90.1757251565770019, 4.80299999999999994, 'sw', 35, NULL, 3.79999999999999982, 0.349999999999999978, 3.45000000000000018, 212, 'bk-sw-25_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-26', 'Banke', 28.0830249999999992, 81.595522900000006, 105.594814404714995, 4.85400000000000009, 'sw', 40, NULL, 4.70000000000000018, 0.400000000000000022, 4.29999999999999982, 213, 'bk-sw-27');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-26', 'Banke', 28.0780816999999985, 81.5932166000000052, 82.8483214010339992, 4.85400000000000009, 'sw', 25, NULL, 3.33000000000000007, 0.25, 3.08000000000000007, 214, 'bk-sw-26');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-26', 'Banke', 28.0508109999999995, 81.5861641000000049, 82.6948520160874949, 4.55100000000000016, 'sw', 55, NULL, 5.95000000000000018, 0.550000000000000044, 5.40000000000000036, 215, 'bk-sw-28');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-23', 'Banke', 28.0020628000000009, 81.652354399999993, 84.8128505473085994, 4.55100000000000016, 'sw', 40, NULL, 5.09999999999999964, 0.400000000000000022, 4.70000000000000018, 216, 'bk-sw-29');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-23', 'Banke', 28.0151007000000014, 81.6543120999999985, 89.5272481432574949, 4.85400000000000009, 'sw', 60, NULL, 3.29999999999999982, 0.599999999999999978, 2.70000000000000018, 217, 'bk-sw-09_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-23', 'Banke', 28.0242383000000004, 81.6002699000000007, 86.6262599403968068, 4.55100000000000016, 'sw', 50, NULL, 5.54000000000000004, 0.5, 5.04000000000000004, 218, 'bk-sw-11_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-22', 'Banke', 27.9833849000000008, 81.7132718999999952, 88.0171452360263942, 4.55100000000000016, 'sw', 70, NULL, 3.83000000000000007, 0.699999999999999956, 3.12999999999999989, 219, 'bk-sw-10_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-22', 'Banke', 28.028538300000001, 81.6947454999999962, 93.6523845583337931, 4.55100000000000016, 'sw', 55, NULL, 4.95000000000000018, 0.550000000000000044, 4.40000000000000036, 220, 'bk-sw-30');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-22', 'Banke', 28.0493699999999997, 81.661659499999999, 96.962717860188107, 4.85400000000000009, 'sw', 36, NULL, 6.79999999999999982, 0.359999999999999987, 6.44000000000000039, 221, 'bk-sw-08_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-07', 'Bardiya', 28.0714979999999983, 81.555503299999998, 83.9792091348529937, 4.85400000000000009, 'sw', 60, NULL, 4, 0.599999999999999978, 3.39999999999999991, 222, 'bd-sw-16');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-06', 'Bardiya', 28.0730776000000013, 81.5542920999999978, 93.4193540415668053, 4.85400000000000009, 'sw', 10, NULL, 2.5, 0.100000000000000006, 2.39999999999999991, 223, 'bd-sw-14');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-06', 'Bardiya', 28.0731597000000015, 81.5542047999999937, 89.544885697154001, 4.80299999999999994, 'sw', 55, NULL, 3, 0.550000000000000044, 2.45000000000000018, 224, 'bd-sw-15');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-04', 'Bardiya', 28.328767899999999, 81.2715464000000054, 121.200340758913995, 4.55100000000000016, 'sw', 10, NULL, 3.20000000000000018, 0.100000000000000006, 3.10000000000000009, 225, 'bd-sw-13');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-04', 'Bardiya', 28.2795565999999994, 81.2628796000000051, 101.396707290668004, 4.80299999999999994, 'sw', 40, NULL, 12, 0.400000000000000022, 11.5999999999999996, 226, 'bd-sw-12');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-04', 'Bardiya', 28.2473470999999989, 81.3078663999999947, 104.485872728554, 4.80299999999999994, 'sw', 50, NULL, 5.5, 0.5, 5, 227, 'bd-sw-09');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-04', 'Bardiya', 28.1691931000000011, 81.3378601999999944, 82.5550332129905939, 4.85400000000000009, 'sw', 40, NULL, 6.5, 0.400000000000000022, 6.09999999999999964, 228, 'bd-sw-06');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-04', 'Bardiya', 28.189743, 81.3836249000000009, 83.7400250684900982, 4.85400000000000009, 'sw', 30, NULL, 5, 0.299999999999999989, 4.70000000000000018, 229, 'bd-sw-05');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-04', 'Bardiya', 28.1880623999999997, 81.4799019000000015, 81.2009829044684039, 4.85400000000000009, 'sw', 40, NULL, 4.79999999999999982, 0.400000000000000022, 4.40000000000000036, 230, 'bd-sw-03');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-04', 'Bardiya', 28.1656501000000006, 81.5008535999999992, 91.3215969749958987, 4.55100000000000016, 'sw', 0, NULL, 5.09999999999999964, 0, 5.09999999999999964, 231, 'bd-sw-17');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-04', 'Bardiya', 28.1463687, 81.4791723999999959, 101.582997796385996, 4.55100000000000016, 'sw', 30, NULL, 6.20000000000000018, 0.299999999999999989, 5.90000000000000036, 232, 'bd-sw-19');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-04', 'Bardiya', 28.1487395000000014, 81.4968819000000053, 80.5087789118038017, 4.85400000000000009, 'sw', 40, NULL, 5, 0.400000000000000022, 4.59999999999999964, 233, 'bd-sw-18');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-02', 'Bardiya', 28.3061076000000007, 81.3596522999999934, 84.9428164075125949, 4.55100000000000016, 'sw', 75, NULL, 4, 0.75, 3.25, 234, 'bd-sw-11');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-02', 'Bardiya', 28.3062642000000011, 81.3597117999999995, 89.7356624809827963, 4.55100000000000016, 'sw', 45, NULL, 4.29999999999999982, 0.450000000000000011, 3.85000000000000009, 235, 'bd-sw-07');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-02', 'Bardiya', 28.3034655999999991, 81.3628922999999986, 93.842287505347997, 4.55100000000000016, 'sw', 60, NULL, 3.79999999999999982, 0.599999999999999978, 3.20000000000000018, 236, 'bd-sw-10');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-02', 'Bardiya', 28.3512468999999996, 81.4297408000000047, 106.216503322503996, 4.85400000000000009, 'sw', 40, NULL, 4, 0.400000000000000022, 3.60000000000000009, 237, 'bd-sw-08');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-02', 'Bardiya', 28.2898387000000007, 81.4420108000000056, 107.791215716384997, 4.85400000000000009, 'sw', 32, NULL, 3.29999999999999982, 0.320000000000000007, 2.97999999999999998, 238, 'bd-sw-04');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-02', 'Bardiya', 28.2364874000000015, 81.5477280000000064, 87.9600438474629982, 4.55100000000000016, 'sw', 0, NULL, 2.29999999999999982, 0, 2.29999999999999982, 239, 'bd-sw-02');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-02', 'Bardiya', 28.2490793999999994, 81.5849847000000068, 104.176433211829007, 4.85400000000000009, 'sw', 10, NULL, 6, 0.100000000000000006, 5.90000000000000036, 240, 'bd-sw-22');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-02', 'Bardiya', 28.2283231000000008, 81.5671834000000047, 99.891429168245196, 4.80299999999999994, 'sw', 40, NULL, 6.29999999999999982, 0.400000000000000022, 5.90000000000000036, 241, 'bd-sw-21');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-01', 'Bardiya', 28.1056720999999996, 81.4826220000000063, 97.9604413131478964, 4.55100000000000016, 'dt', 10, NULL, 12, 0.100000000000000006, 11.9000000000000004, 242, 'bd-dw-02');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-01', 'Bardiya', 28.0883861999999986, 81.5027232000000055, 100.624133422981998, 4.55100000000000016, 'dt', 20, NULL, 12.1999999999999993, 0.200000000000000011, 12, 243, 'bd-dw-03');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-01', 'Bardiya', 28.0829069999999987, 81.5111801000000042, 99.5016497333836014, 4.80299999999999994, 'dt', 24, NULL, 10.1999999999999993, 0.239999999999999991, 9.96000000000000085, 244, 'bd-dw-04');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-03-13', 'Bardiya', 28.0852755999999992, 81.5164958000000013, 93.3988337954977936, 4.85400000000000009, 'dt', 25, NULL, 14, 0.25, 13.75, 245, 'bd-dw-01');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-07', 'Banke', 28.0818633999999996, 81.5466078999999979, 82.3164867744991966, 4.85400000000000009, 'dt', 37, NULL, 11.4499999999999993, 0.369999999999999996, 11.0800000000000001, 246, 'bk-dw-01');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-07', 'Banke', 28.0960803000000006, 81.521143600000002, 83.4512369483591954, 4.55100000000000016, 'dt', 25, NULL, 11.4499999999999993, 0.25, 11.1999999999999993, 247, 'bk-dw-02');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-07', 'Banke', 28.1223001000000004, 81.5166133999999971, 85.0439202380158008, 4.55100000000000016, 'dt', 42, NULL, 11.5500000000000007, 0.419999999999999984, 11.1300000000000008, 248, 'bk-dw-03');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-07', 'Banke', 28.1132041000000008, 81.5172749000000039, 84.5516531173633012, 4.85400000000000009, 'dt', 49, NULL, 11.5500000000000007, 0.489999999999999991, 11.0600000000000005, 249, 'bk-dw-04_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-07', 'Banke', 28.1114016000000007, 81.5217049999999972, 61.4288699791873967, 4.55100000000000016, 'sw', 23, NULL, 5.84999999999999964, 0.23000000000000001, 5.62000000000000011, 250, 'bk-sw-19_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-07', 'Banke', 28.0508057000000015, 81.5862264999999951, 87.0975389954846975, 4.80299999999999994, 'sw', 55, NULL, 5.5, 0.550000000000000044, 4.95000000000000018, 251, 'bk-sw-28');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-07', 'Banke', 28.0513466999999999, 81.6024627000000038, 88.1899251176230052, 4.55100000000000016, 'dt', 27, NULL, 4.59999999999999964, 0.270000000000000018, 4.33000000000000007, 252, 'bk-dw-05');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-04', 'Banke', 28.0812184999999985, 81.6450439999999986, 101.030612130064, 4.80299999999999994, 'sw', 54, NULL, 4.45000000000000018, 0.540000000000000036, 3.91000000000000014, 253, 'bk-sw-24_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-04', 'Banke', 28.0928488999999999, 81.6478627999999986, 94.3362724634345966, 4.85400000000000009, 'sw', 15, NULL, 4.45000000000000018, 0.149999999999999994, 4.29999999999999982, 254, 'bk-sw-07_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-04', 'Banke', 28.1317972999999988, 81.6588377000000065, 98.4486601086155986, 4.80299999999999994, 'sw', 45, NULL, 2.74000000000000021, 0.450000000000000011, 2.29000000000000004, 255, 'bk-sw-06_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-03', 'Banke', 28.1465581, 81.5519536000000045, 103.678663033416996, 4.55100000000000016, 'sw', 27, NULL, 3.91999999999999993, 0.270000000000000018, 3.64999999999999991, 256, 'bk-sw-18_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-03', 'Banke', 28.1287337000000015, 81.5893729000000008, 87.9844677507521027, 4.55100000000000016, 'sw', 15, NULL, 3.95000000000000018, 0.149999999999999994, 3.79999999999999982, 257, 'bk-sw-17_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-03', 'Banke', 28.1060286999999995, 81.5971035000000029, 84.7413499414461029, 4.55100000000000016, 'sw', 35, NULL, 3.60000000000000009, 0.349999999999999978, 3.25, 258, 'bk-sw-25_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-03', 'Banke', 28.0830206000000011, 81.5956340999999981, 76.2768126173559011, 4.80299999999999994, 'sw', 40, NULL, 4.40000000000000036, 0.400000000000000022, 4, 259, 'bk-sw-27');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-03', 'Banke', 28.0780449999999995, 81.5932274999999976, 84.995615261416404, 4.85400000000000009, 'sw', 25, NULL, 3.08000000000000007, 0.25, 2.83000000000000007, 260, 'bk-sw-26');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-02', 'Banke', 28.1873992000000015, 81.6299874000000045, 104.631287513722, 4.55100000000000016, 'sw', 65, NULL, 2.93000000000000016, 0.650000000000000022, 2.2799999999999998, 261, 'bk-sw-04');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-02', 'Banke', 28.1920742000000004, 81.5747771999999998, 89.9149008400871992, 4.55100000000000016, 'sw', 29, NULL, 3.39999999999999991, 0.28999999999999998, 3.10999999999999988, 262, 'bk-sw-05_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-02', 'Banke', 28.2065319999999993, 81.6306905, 107.152156066371006, 4.80299999999999994, 'sw', 40, NULL, 7.25, 0.400000000000000022, 6.84999999999999964, 263, 'bk-sw-03');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-02', 'Banke', 28.1960803999999996, 81.7117424000000057, 127.629672284812997, 4.85400000000000009, 'sw', 20, NULL, 3.66000000000000014, 0.200000000000000011, 3.45999999999999996, 264, 'bk-sw-01');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-01', 'Banke', 28.049376500000001, 81.661709700000003, 93.9317348087303969, 4.55100000000000016, 'sw', 36, NULL, 6.5, 0.359999999999999987, 6.13999999999999968, 265, 'bk-sw-08_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-01', 'Banke', 27.9834299999999985, 81.7133070000000004, 73.3494367377838046, 4.55100000000000016, 'sw', 70, NULL, 3.77000000000000002, 0.699999999999999956, 3.06999999999999984, 266, 'bk-sw-10_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-04-01', 'Banke', 28.0285641000000005, 81.6947339000000028, 83.3533927471640936, 4.85400000000000009, 'sw', 55, NULL, 4.84999999999999964, 0.550000000000000044, 4.29999999999999982, 267, 'bk-sw-30');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-03-30', 'Banke', 28.0020869999999995, 81.6523339999999962, 74.7950209241006974, 4.80299999999999994, 'sw', 40, NULL, 4.95000000000000018, 0.400000000000000022, 4.54999999999999982, 268, 'bk-sw-29');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-03-30', 'Banke', 28.0150979000000007, 81.6543420999999938, 79.4555469913822066, 4.85400000000000009, 'sw', 60, NULL, 3.20000000000000018, 0.599999999999999978, 2.60000000000000009, 269, 'bk-sw-09_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-03-30', 'Banke', 28.0243004000000013, 81.600283399999995, 85.5387204869156932, 4.55100000000000016, 'sw', 50, NULL, 5.40000000000000036, 0.5, 4.90000000000000036, 270, 'bk-sw-11_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-03-11', 'Bardiya', 28.0731672000000003, 81.5542815000000019, 104.945421634089996, 4.55100000000000016, 'sw', 10, NULL, 2.20000000000000018, 0.100000000000000006, 2.10000000000000009, 271, 'bd-sw-14');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-03-11', 'Bardiya', 28.0731023999999998, 81.5542315000000002, 86.9970978324076043, 4.85400000000000009, 'sw', 60, NULL, 3.5, 0.599999999999999978, 2.89999999999999991, 272, 'bd-sw-16');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-03-11', 'Bardiya', 28.0714982999999982, 81.5555563000000063, 99.0802907533162056, 4.55100000000000016, 'sw', 55, NULL, 2.20000000000000018, 0.550000000000000044, 1.64999999999999991, 273, 'bd-sw-15');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-03-11', 'Bardiya', 28.335072199999999, 81.2661659999999983, 111.600886997025995, 4.80299999999999994, 'sw', 10, NULL, 3, 0.100000000000000006, 2.89999999999999991, 274, 'bd-sw-13');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-03-11', 'Bardiya', 28.2794957999999994, 81.2629022999999933, 107.038141422577993, 4.85400000000000009, 'sw', 40, NULL, 11.1999999999999993, 0.400000000000000022, 10.8000000000000007, 275, 'bd-sw-12');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-03-11', 'Bardiya', 28.2486034000000004, 81.3085296, 90.5413812870741026, 4.80299999999999994, 'sw', 50, NULL, 5.20000000000000018, 0.5, 4.70000000000000018, 276, 'bd-sw-09');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-03-11', 'Bardiya', 28.2384443000000012, 81.2889978999999983, 99.3802072166061947, 4.55100000000000016, 'sw', 20, NULL, 10, 0.200000000000000011, 9.80000000000000071, 277, 'bd-sw-23');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-03-07', 'Bardiya', 28.3062107999999988, 81.3598135000000013, 118.064364916260999, 4.80299999999999994, 'sw', 75, NULL, 3.60000000000000009, 0.75, 2.85000000000000009, 278, 'bd-sw-11');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-03-07', 'Bardiya', 28.3056748999999996, 81.3593067000000048, 100.863516653220998, 4.80299999999999994, 'sw', 45, NULL, 4.09999999999999964, 0.450000000000000011, 3.64999999999999991, 279, 'bd-sw-07');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-03-07', 'Bardiya', 28.3014031000000017, 81.336591999999996, 104.181321836248998, 4.85400000000000009, 'sw', 60, NULL, 3.20000000000000018, 0.599999999999999978, 2.60000000000000009, 280, 'bd-sw-10');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-03-07', 'Bardiya', 28.3512284000000001, 81.4297636000000011, 119.673412495666994, 4.85400000000000009, 'sw', 40, NULL, 3.20000000000000018, 0.400000000000000022, 2.79999999999999982, 281, 'bd-sw-08');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-03-07', 'Bardiya', 28.289834299999999, 81.4420492999999937, 126.951428624737005, 4.85400000000000009, 'sw', 32, NULL, 3.10000000000000009, 0.320000000000000007, 2.7799999999999998, 282, 'bd-sw-04');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-03-07', 'Bardiya', 28.2282381999999998, 81.5671037000000041, 115.914251937914997, 4.85400000000000009, 'sw', 40, NULL, 6.20000000000000018, 0.400000000000000022, 5.79999999999999982, 283, 'bd-sw-21');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-03-07', 'Bardiya', 28.2491036000000015, 81.5849592999999942, 108.697750597871007, 4.55100000000000016, 'sw', 10, NULL, 5.20000000000000018, 0.100000000000000006, 5.09999999999999964, 284, 'bd-sw-22');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-03-07', 'Bardiya', 28.2363901999999989, 81.5476910999999944, 101.270541094004997, 4.55100000000000016, 'sw', 0, NULL, 2.10000000000000009, 0, 2.10000000000000009, 285, 'bd-sw-02');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-03-02', 'Bardiya', 28.1691837000000014, 81.3378857000000011, 96.734337468660101, 4.85400000000000009, 'sw', 40, NULL, 6, 0.400000000000000022, 5.59999999999999964, 286, 'bd-sw-06');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-03-02', 'Bardiya', 28.1897781000000016, 81.3836074000000025, 94.924696938805198, 4.80299999999999994, 'sw', 30, NULL, 5, 0.299999999999999989, 4.70000000000000018, 287, 'bd-sw-05');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-03-02', 'Bardiya', 28.1880312999999987, 81.4798914999999937, 121.278259162349997, 4.80299999999999994, 'sw', 40, NULL, 4.40000000000000036, 0.400000000000000022, 4, 288, 'bd-sw-03');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-03-02', 'Bardiya', 28.1656437000000004, 81.500790600000002, 102.147612403116, 4.85400000000000009, 'sw', 40, NULL, 4.59999999999999964, 0.400000000000000022, 4.20000000000000018, 289, 'bd-sw-18');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-03-02', 'Bardiya', 28.1464324999999995, 81.479087100000001, 114.806542169170001, 4.55100000000000016, 'sw', 30, NULL, 6, 0.299999999999999989, 5.70000000000000018, 290, 'bd-sw-19');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-03-02', 'Bardiya', 28.148658600000001, 81.4968511999999947, 114.171916982393995, 4.55100000000000016, 'sw', 70, NULL, 4.5, 0.699999999999999956, 3.79999999999999982, 291, 'bd-sw-20');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-02-28', 'Bardiya', 28.1056334999999997, 81.4826266000000032, 101.649722444210994, 4.55100000000000016, 'dt', 10, NULL, 11, 0.100000000000000006, 10.9000000000000004, 292, 'bd-dw-02');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-02-28', 'Bardiya', 28.0883672000000004, 81.5027316000000042, 93.6442026539967998, 4.85400000000000009, 'dt', 20, NULL, 12, 0.200000000000000011, 11.8000000000000007, 293, 'bd-dw-03');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-02-28', 'Bardiya', 28.0828814000000015, 81.5111583999999993, 96.9129339528982001, 4.85400000000000009, 'dt', 24, NULL, 10, 0.239999999999999991, 9.75999999999999979, 294, 'bd-dw-04');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-02-25', 'Bardiya', 28.0852202999999996, 81.5164757000000009, 101.265726934363997, 4.85400000000000009, 'dt', 25, NULL, 12.1999999999999993, 0.25, 11.9499999999999993, 295, 'bd-dw-01');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-03-03', 'Banke', 27.9834125, 81.7133541000000037, 89.8357395444490976, 4.80299999999999994, 'sw', 70, NULL, 3.66999999999999993, 0.699999999999999956, 2.9700000000000002, 296, 'bk-sw-10_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-03-03', 'Banke', 28.0285544999999985, 81.6946709000000055, 100.519136153001995, 4.55100000000000016, 'sw', 55, NULL, 4.70000000000000018, 0.550000000000000044, 4.15000000000000036, 297, 'bk-sw-30');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-03-03', 'Banke', 28.0494203999999989, 81.6616307999999975, 95.6079691131819942, 4.55100000000000016, 'sw', 36, NULL, 6.34999999999999964, 0.359999999999999987, 5.99000000000000021, 298, 'bk-sw-08_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-03-02', 'Banke', 28.0818033000000007, 81.5465528999999947, 103.484036185508003, 4.80299999999999994, 'dt', 37, NULL, 11.3499999999999996, 0.369999999999999996, 10.9800000000000004, 299, 'bk-dw-01');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-03-02', 'Banke', 28.0959921000000001, 81.5211790000000036, 94.7479972872943961, 4.85400000000000009, 'dt', 25, NULL, 11.3499999999999996, 0.25, 11.0999999999999996, 300, 'bk-dw-02');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-03-02', 'Banke', 28.1222987999999994, 81.5166217999999958, 98.5114625988585999, 4.55100000000000016, 'dt', 42, NULL, 11.4499999999999993, 0.419999999999999984, 11.0299999999999994, 301, 'bk-dw-03');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-03-02', 'Banke', 28.1132621, 81.5173494000000005, 102.951162629151995, 4.80299999999999994, 'dt', 49, NULL, 11.4000000000000004, 0.489999999999999991, 10.9100000000000001, 302, 'bk-dw-04_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-03-02', 'Banke', 28.1114454999999985, 81.5216505000000069, 96.5277953917898941, 4.85400000000000009, 'sw', 23, NULL, 5.5, 0.23000000000000001, 5.26999999999999957, 303, 'bk-sw-19_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-03-02', 'Banke', 28.051329599999999, 81.6024400999999955, 99.7821691680814951, 4.80299999999999994, 'dt', 27, NULL, 4.20000000000000018, 0.270000000000000018, 3.93000000000000016, 304, 'bk-dw-05');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-03-01', 'Banke', 28.1465537999999995, 81.5519785999999982, 99.0938873233561992, 4.55100000000000016, 'sw', 27, NULL, 3.39999999999999991, 0.270000000000000018, 3.12999999999999989, 305, 'bk-sw-18_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-03-01', 'Banke', 28.1060811999999984, 81.5971233000000069, 104.212885800359999, 4.55100000000000016, 'sw', 35, NULL, 3.39999999999999991, 0.349999999999999978, 3.04999999999999982, 306, 'bk-sw-25_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-03-01', 'Banke', 28.0830307999999995, 81.5956367999999941, 104.122106980520002, 4.55100000000000016, 'sw', 40, NULL, 4.29999999999999982, 0.400000000000000022, 3.89999999999999991, 307, 'bk-sw-27');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-02-28', 'Banke', 28.1873728999999997, 81.6300729999999959, 120.061708703961003, 4.85400000000000009, 'sw', 65, NULL, 2.47999999999999998, 0.650000000000000022, 1.83000000000000007, 308, 'bk-sw-04');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-02-28', 'Banke', 28.1921073, 81.5747381999999988, 93.9465331402494002, 4.80299999999999994, 'sw', 29, NULL, 3.29999999999999982, 0.28999999999999998, 3.00999999999999979, 309, 'bk-sw-05_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-02-28', 'Banke', 28.2065440000000009, 81.6307359000000048, 111.393324726681996, 4.80299999999999994, 'sw', 40, NULL, 6.70000000000000018, 0.400000000000000022, 6.29999999999999982, 310, 'bk-sw-03');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-02-28', 'Banke', 28.1961033999999984, 81.7117760000000004, 118.650589202590993, 4.85400000000000009, 'sw', 20, NULL, 3.5, 0.200000000000000011, 3.29999999999999982, 311, 'bk-sw-01');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-02-25', 'Banke', 28.0812296000000003, 81.6450592999999998, 107.355159509535, 4.55100000000000016, 'sw', 54, NULL, 4.04999999999999982, 0.540000000000000036, 3.50999999999999979, 312, 'bk-sw-24_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-02-25', 'Banke', 28.092856900000001, 81.6478713999999997, 101.686212251680999, 4.55100000000000016, 'sw', 15, NULL, 3.85000000000000009, 0.149999999999999994, 3.70000000000000018, 313, 'bk-sw-07_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-02-25', 'Banke', 28.1318094000000016, 81.6588648000000035, 108.932644941590993, 4.55100000000000016, 'sw', 45, NULL, 2.35000000000000009, 0.450000000000000011, 1.89999999999999991, 314, 'bk-sw-06_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-02-24', 'Banke', 28.0507647999999996, 81.5861596999999961, 99.0883227518880005, 4.55100000000000016, 'sw', 55, NULL, 5.15000000000000036, 0.550000000000000044, 4.59999999999999964, 315, 'bk-sw-28');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-02-22', 'Banke', 28.0151149000000004, 81.654285299999998, 86.6516761363776027, 4.85400000000000009, 'sw', 60, NULL, 2.97999999999999998, 0.599999999999999978, 2.37999999999999989, 316, 'bk-sw-09_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-02-22', 'Banke', 28.0020096000000009, 81.652210800000006, 107.773935556151002, 4.85400000000000009, 'sw', 40, NULL, 4.5, 0.400000000000000022, 4.09999999999999964, 317, 'bk-sw-29');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-02-22', 'Banke', 28.0242740999999995, 81.6002787000000041, 89.816821683511904, 4.85400000000000009, 'sw', 50, NULL, 5.17999999999999972, 0.5, 4.67999999999999972, 318, 'bk-sw-11_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-02-20', 'Banke', 28.0780603999999983, 81.593222499999996, 97.1619428874590056, 4.85400000000000009, 'sw', 25, NULL, 2.68999999999999995, 0.25, 2.43999999999999995, 319, 'bk-sw-26');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-02-20', 'Banke', 28.1287297000000009, 81.5894124000000005, 88.4623012142003944, 4.85400000000000009, 'sw', 15, NULL, 3.2200000000000002, 0.149999999999999994, 3.06999999999999984, 320, 'bk-sw-17_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-02-09', 'Bardiya', 28.0731269999999995, 81.5541211999999973, 84, 10.9220000000000006, 'sw', 60, NULL, 3.29999999999999982, 0.599999999999999978, 2.70000000000000018, 321, 'bd-sw-16');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-02-09', 'Bardiya', 28.073109800000001, 81.5542463000000026, 88, 7.58499999999999996, 'sw', 55, NULL, 2.10000000000000009, 0.550000000000000044, 1.55000000000000004, 322, 'bd-sw-15');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-02-09', 'Bardiya', 28.0731406999999997, 81.5542271999999997, 82, 4.85400000000000009, 'sw', 10, NULL, 2, 0.100000000000000006, 1.89999999999999991, 323, 'bd-sw-14');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-02-08', 'Bardiya', 28.3065235000000008, 81.3591490999999962, 67, 4.85400000000000009, 'sw', 75, NULL, 3.39999999999999991, 0.75, 2.64999999999999991, 324, 'bd-sw-11');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-02-08', 'Bardiya', 28.3056157000000006, 81.3593067999999988, 111, 4.85400000000000009, 'sw', 45, NULL, 4, 0.450000000000000011, 3.54999999999999982, 325, 'bd-sw-07');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-02-08', 'Bardiya', 28.3013720000000006, 81.3365895999999964, 98, 4.85400000000000009, 'sw', 60, NULL, 3, 0.599999999999999978, 2.39999999999999991, 326, 'bd-sw-10');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-02-08', 'Bardiya', 28.351235599999999, 81.4297427000000056, 107, 4.85400000000000009, 'sw', 40, NULL, 3, 0.400000000000000022, 2.60000000000000009, 327, 'bd-sw-08');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-02-08', 'Bardiya', 28.2898430000000012, 81.4420836000000037, 100, 6.67400000000000038, 'sw', 32, NULL, 3, 0.320000000000000007, 2.68000000000000016, 328, 'bd-sw-04');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-02-08', 'Bardiya', 28.2282732000000003, 81.5671712000000042, 103, 4.85400000000000009, 'sw', 40, NULL, 6, 0.400000000000000022, 5.59999999999999964, 329, 'bd-sw-21');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-02-08', 'Bardiya', 28.2490130999999991, 81.5848864999999961, 102, 4.80299999999999994, 'sw', 10, NULL, 5, 0.100000000000000006, 4.90000000000000036, 330, 'bd-sw-22');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-02-08', 'Bardiya', 28.2364792999999992, 81.5477362000000028, 95, 4.55100000000000016, 'sw', 0, NULL, 2, 0, 2, 331, 'bd-sw-02');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-02-08', 'Bardiya', 28.188046700000001, 81.4799710000000061, 85, 4.85400000000000009, 'sw', 40, NULL, 4, 0.400000000000000022, 3.60000000000000009, 332, 'bd-sw-03');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-02-03', 'Bardiya', 28.2795710999999983, 81.2628224999999986, 103, 4.85400000000000009, 'sw', 40, NULL, 11, 0.400000000000000022, 10.5999999999999996, 333, 'bd-sw-12');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-02-03', 'Bardiya', 28.3349603999999999, 81.2660783999999978, 104, 6.06799999999999962, 'sw', 10, NULL, 3, 0.100000000000000006, 2.89999999999999991, 334, 'bd-sw-13');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-02-03', 'Bardiya', 28.2504704000000011, 81.3107655999999963, 104, 4.85400000000000009, 'sw', 50, NULL, 5, 0.5, 4.5, 335, 'bd-sw-09');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-02-03', 'Bardiya', 28.2385395000000017, 81.2889351000000033, 104, 4.80299999999999994, 'sw', 20, NULL, 9.40000000000000036, 0.200000000000000011, 9.19999999999999929, 336, 'bd-sw-23');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-02-03', 'Bardiya', 28.1691594000000016, 81.3378797999999961, 89, 4.80299999999999994, 'sw', 40, NULL, 6, 0.400000000000000022, 5.59999999999999964, 337, 'bd-sw-06');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-02-03', 'Bardiya', 28.189743, 81.3836823000000038, 90, 4.85400000000000009, 'sw', 30, NULL, 4, 0.299999999999999989, 3.70000000000000018, 338, 'bd-sw-05');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-02-03', 'Bardiya', 28.1656408999999996, 81.5008473000000038, 94, 4.85400000000000009, 'sw', 70, NULL, 4.79999999999999982, 0.699999999999999956, 4.09999999999999964, 339, 'bd-sw-20');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-02-03', 'Bardiya', 28.1464123000000015, 81.4790914999999956, 84, 4.55100000000000016, 'sw', 30, NULL, 5, 0.299999999999999989, 4.70000000000000018, 340, 'bd-sw-19');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-02-03', 'Bardiya', 28.1486845000000017, 81.4968652999999961, 88, 6.67400000000000038, 'sw', 40, NULL, 3.79999999999999982, 0.400000000000000022, 3.39999999999999991, 341, 'bd-sw-18');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-01-28', 'Bardiya', 28.0828531000000012, 81.5111708000000021, 89, 4.55100000000000016, 'dt', 24, NULL, 9.80000000000000071, 0.239999999999999991, 9.5600000000000005, 342, 'bd-dw-04');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-01-28', 'Bardiya', 28.1055898999999982, 81.4825912999999957, 79, 4.55100000000000016, 'dt', 10, NULL, 10.5, 0.100000000000000006, 10.4000000000000004, 343, 'bd-dw-02');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-01-28', 'Bardiya', 28.0883405999999987, 81.5026309999999938, 89, 4.85400000000000009, 'dt', 20, NULL, 11.8000000000000007, 0.200000000000000011, 11.5999999999999996, 344, 'bd-dw-03');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-01-28', 'Bardiya', 28.0851809999999986, 81.5163615999999962, 83, 4.80299999999999994, 'dt', 25, NULL, 12, 0.25, 11.75, 345, 'bd-dw-01');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-02-05', 'Banke', 28.0818215000000002, 81.5466408999999999, 84, 4.55100000000000016, 'dt', 37, NULL, 11.3499999999999996, 0.369999999999999996, 10.9800000000000004, 346, 'bk-dw-01');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-02-05', 'Banke', 28.0960436000000016, 81.5211362999999949, 84, 4.55100000000000016, 'dt', 25, NULL, 11.1999999999999993, 0.25, 10.9499999999999993, 347, 'bk-dw-02');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-02-05', 'Banke', 28.1223281000000007, 81.5165796, 90, 4.85400000000000009, 'dt', 42, NULL, 11.25, 0.419999999999999984, 10.8300000000000001, 348, 'bk-dw-03');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-02-05', 'Banke', 28.1132361000000017, 81.517303499999997, 91, 4.55100000000000016, 'dt', 49, NULL, 11.3000000000000007, 0.489999999999999991, 10.8100000000000005, 349, 'bk-dw-04_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-02-05', 'Banke', 28.0513081, 81.6024541000000028, 86, 4.55100000000000016, 'dt', 27, NULL, 3.95000000000000018, 0.270000000000000018, 3.68000000000000016, 350, 'bk-dw-05');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-02-03', 'Banke', 28.1318100000000015, 81.6588145999999995, 97, 4.85400000000000009, 'sw', 45, NULL, 2.20000000000000018, 0.450000000000000011, 1.75, 351, 'bk-sw-06_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-02-03', 'Banke', 28.0928581999999984, 81.6478692999999964, 99, 4.55100000000000016, 'sw', 15, NULL, 3.64999999999999991, 0.149999999999999994, 3.5, 352, 'bk-sw-07_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-02-03', 'Banke', 28.0812224000000015, 81.6450643000000014, 94, 4.55100000000000016, 'sw', 54, NULL, 3.54999999999999982, 0.540000000000000036, 3.00999999999999979, 353, 'bk-sw-24_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-02-01', 'Banke', 28.1960976999999993, 81.7117444000000006, 107, 4.55100000000000016, 'sw', 20, NULL, 3.14999999999999991, 0.200000000000000011, 2.95000000000000018, 354, 'bk-sw-01');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-02-01', 'Banke', 28.1873921000000003, 81.6300983000000002, 105, 4.55100000000000016, 'sw', 65, NULL, 2.35000000000000009, 0.650000000000000022, 1.69999999999999996, 355, 'bk-sw-04');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-01-31', 'Banke', 28.0020439000000003, 81.6523786000000058, 69, 4.55100000000000016, 'sw', 40, NULL, 4.29999999999999982, 0.400000000000000022, 3.89999999999999991, 356, 'bk-sw-29');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-01-31', 'Banke', 28.015118300000001, 81.6543479000000048, 82, 4.80299999999999994, 'sw', 60, NULL, 2.75, 0.599999999999999978, 2.14999999999999991, 357, 'bk-sw-09_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-01-31', 'Banke', 28.0242587000000007, 81.6002835999999974, 91, 4.85400000000000009, 'sw', 50, NULL, 4.65000000000000036, 0.5, 4.15000000000000036, 358, 'bk-sw-11_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-01-31', 'Banke', 28.0507443000000016, 81.586179400000006, 89, 4.85400000000000009, 'sw', 55, NULL, 4.84999999999999964, 0.550000000000000044, 4.29999999999999982, 359, 'bk-sw-28');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-01-29', 'Banke', 27.9833038999999992, 81.7132923000000062, 84, 4.55100000000000016, 'sw', 70, NULL, 3.45000000000000018, 0.699999999999999956, 2.75, 360, 'bk-sw-10_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-01-29', 'Banke', 28.0285434000000002, 81.6946848000000045, 78, 4.85400000000000009, 'sw', 55, NULL, 4.45000000000000018, 0.550000000000000044, 3.89999999999999991, 361, 'bk-sw-30');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-01-29', 'Banke', 28.0493273999999992, 81.6616257999999959, 95, 4.55100000000000016, 'sw', 36, NULL, 5.84999999999999964, 0.359999999999999987, 5.49000000000000021, 362, 'bk-sw-08_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-01-28', 'Bardiya', 28.0803240999999986, 81.6420700000000039, 64, 51.578000000000003, 'sw', 0, NULL, 2, 0, 2, 363, 'bd-sw-01');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-01-27', 'Banke', 28.2064948999999991, 81.6307264000000004, 101, 4.80299999999999994, 'sw', 40, NULL, 6.5, 0.400000000000000022, 6.09999999999999964, 364, 'bk-sw-03');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-01-27', 'Banke', 28.2576903000000001, 81.6361818999999969, 95, 4.55100000000000016, 'sw', 15, NULL, 0, 0.149999999999999994, -0.149999999999999994, 365, 'bk-sw-02');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-01-27', 'Banke', 28.192045499999999, 81.5747480999999937, 99, 4.85400000000000009, 'sw', 29, NULL, 3.25, 0.28999999999999998, 2.95999999999999996, 366, 'bk-sw-05_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-01-27', 'Banke', 28.1114479000000017, 81.5216934999999978, 79, 4.55100000000000016, 'sw', 23, NULL, 4.95000000000000018, 0.23000000000000001, 4.71999999999999975, 367, 'bk-sw-19_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-01-27', 'Banke', 28.1465454000000008, 81.5519862000000018, 93, 4.55100000000000016, 'sw', 27, NULL, 2.95000000000000018, 0.270000000000000018, 2.68000000000000016, 368, 'bk-sw-18_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-01-27', 'Banke', 28.1287151000000009, 81.5894281000000063, 88, 4.55100000000000016, 'sw', 15, NULL, 2.85000000000000009, 0.149999999999999994, 2.70000000000000018, 369, 'bk-sw-17_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-01-27', 'Banke', 28.1060386000000015, 81.5971550999999948, 99, 4.55100000000000016, 'sw', 35, NULL, 3.25, 0.349999999999999978, 2.89999999999999991, 370, 'bk-sw-25_1');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-01-27', 'Banke', 28.0828437000000015, 81.5956795000000028, 92, 4.55100000000000016, 'sw', 40, NULL, 4.09999999999999964, 0.400000000000000022, 3.70000000000000018, 371, 'bk-sw-27');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-01-27', 'Banke', 28.0780662999999997, 81.5933074000000005, 94, 4.85400000000000009, 'sw', 25, NULL, 2.45000000000000018, 0.25, 2.20000000000000018, 372, 'bk-sw-26');
INSERT INTO public.gw_monitoring_kobo VALUES ('2021-01-27', 'Banke', 28.0804943000000016, 81.641929300000001, 114, 13.3490000000000002, 'sw', 20, NULL, 2.39999999999999991, 0.200000000000000011, 2.20000000000000018, 373, 'bk-sw-01');


--
-- TOC entry 3015 (class 0 OID 44286)
-- Dependencies: 221
-- Data for Name: type_of_well; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.type_of_well VALUES (1, 'Shallow Tubewells');
INSERT INTO public.type_of_well VALUES (2, 'Deep Tubewells');


--
-- TOC entry 3018 (class 0 OID 44360)
-- Dependencies: 224
-- Data for Name: waterApp_gwlocationsdata; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."waterApp_gwlocationsdata" VALUES (1, '1-045/46(BK)1 ', 'bk-sw-01', 'Banke', 81.641929300000001, 28.0804943000000016, 1, 'Rohini Khola');
INSERT INTO public."waterApp_gwlocationsdata" VALUES (2, '1-045/46(BK)2 ', 'bk-sw-02', 'Banke', 81.6361818999999969, 28.2576903000000001, 1, 'Jabdhawa');
INSERT INTO public."waterApp_gwlocationsdata" VALUES (3, '1-045/46(BK)3 ', 'bk-sw-03', 'Banke', 81.6307264000000004, 28.2064948999999991, 1, 'Banktuwa');
INSERT INTO public."waterApp_gwlocationsdata" VALUES (4, '1-045/46(BK)4 ', 'bk-sw-04', 'Banke', 81.6300983000000002, 28.1873921000000003, 1, 'Channawa');
INSERT INTO public."waterApp_gwlocationsdata" VALUES (5, '1-045/46(BK)5 ', 'bk-sw-05_1', 'Banke', 81.5747480999999937, 28.192045499999999, 1, 'Thapawa');
INSERT INTO public."waterApp_gwlocationsdata" VALUES (6, '1-045/46(BK)6 ', 'bk-sw-06_1', 'Banke', 81.6588145999999995, 28.1318100000000015, 1, 'Piprahwa');
INSERT INTO public."waterApp_gwlocationsdata" VALUES (7, '1-045/46(BK)7 ', 'bk-sw-07_1', 'Banke', 81.6478692999999964, 28.0928581999999984, 1, 'Bhujai');
INSERT INTO public."waterApp_gwlocationsdata" VALUES (8, '1-045/46(BK)8 ', 'bk-sw-08_1', 'Banke', 81.6616257999999959, 28.0493273999999992, 1, 'Birta');
INSERT INTO public."waterApp_gwlocationsdata" VALUES (9, '1-045/46(BK)9 ', 'bk-sw-09_1', 'Banke', 81.6543479000000048, 28.015118300000001, 1, 'Sikhanpurwa');
INSERT INTO public."waterApp_gwlocationsdata" VALUES (10, '1-045/46(BK)10 ', 'bk-sw-10_1', 'Banke', 81.7132923000000062, 27.9833038999999992, 1, 'Kharaicha');
INSERT INTO public."waterApp_gwlocationsdata" VALUES (11, '1-045/46(BK)11 ', 'bk-sw-11_1', 'Banke', 81.6002835999999974, 28.0242587000000007, 1, 'Jaishpur');
INSERT INTO public."waterApp_gwlocationsdata" VALUES (12, '1-045/46(BK)17 ', 'bk-sw-17_1', 'Banke', 81.5894281000000063, 28.1287151000000009, 1, 'D-gaon');
INSERT INTO public."waterApp_gwlocationsdata" VALUES (13, '1-045/46(BK)18 ', 'bk-sw-18_1', 'Banke', 81.5519862000000018, 28.1465454000000008, 1, 'Kalhansgaon');
INSERT INTO public."waterApp_gwlocationsdata" VALUES (14, '1-045/46(BK)19 ', 'bk-sw-19_1', 'Banke', 81.5216934999999978, 28.1114479000000017, 1, 'Gaughat');
INSERT INTO public."waterApp_gwlocationsdata" VALUES (15, '1-045/46(BK)20 ', 'bk-sw-20_1', 'Banke', 81.7560577499999965, 28.2014526299999986, 1, 'Mahadevpuri');
INSERT INTO public."waterApp_gwlocationsdata" VALUES (16, 'NISP-STW/1 ', 'bk-sw-24_1', 'Banke', 81.6450643000000014, 28.0812224000000015, 1, 'Office compound');
INSERT INTO public."waterApp_gwlocationsdata" VALUES (17, 'NISP-INV-STW/8 ', 'bk-sw-25_1', 'Banke', 81.5971550999999948, 28.1060386000000015, 1, 'Kajurakurda');
INSERT INTO public."waterApp_gwlocationsdata" VALUES (18, 'NISP-INV-STW/10', 'bk-sw-26', 'Banke', 81.5933074000000005, 28.0780662999999997, 1, 'Banjaregaon');
INSERT INTO public."waterApp_gwlocationsdata" VALUES (19, 'NISP-INV-STW/11', 'bk-sw-27', 'Banke', 81.5956795000000028, 28.0828437000000015, 1, 'Ramapurwa');
INSERT INTO public."waterApp_gwlocationsdata" VALUES (20, 'n/a', 'bk-sw-28', 'Banke', 81.586179400000006, 28.0507443000000016, 1, 'Jaogagaun');
INSERT INTO public."waterApp_gwlocationsdata" VALUES (21, 'n/a', 'bk-sw-29', 'Banke', 81.6523786000000058, 28.0020439000000003, 1, 'Baldipurwa');
INSERT INTO public."waterApp_gwlocationsdata" VALUES (22, 'n/a', 'bk-sw-30', 'Banke', 81.6946848000000045, 28.0285434000000002, 1, 'Harbaldoli');
INSERT INTO public."waterApp_gwlocationsdata" VALUES (23, '1-045\46(B\D)1 ', 'bd-sw-01', 'Bardiya', 81.6420700000000039, 28.0803240999999986, 1, 'Bertani');
INSERT INTO public."waterApp_gwlocationsdata" VALUES (24, '2-045\46(B\D)2 ', 'bd-sw-02', 'Bardiya', 81.5477362000000028, 28.2364792999999992, 1, 'Bakharikurd');
INSERT INTO public."waterApp_gwlocationsdata" VALUES (25, '3-045\46(B\D)3 ', 'bd-sw-03', 'Bardiya', 81.4799710000000061, 28.188046700000001, 1, 'Mainapokhar');
INSERT INTO public."waterApp_gwlocationsdata" VALUES (26, '4-045\46(B\D)4 ', 'bd-sw-04', 'Bardiya', 81.4420836000000037, 28.2898430000000012, 1, 'Bangai');
INSERT INTO public."waterApp_gwlocationsdata" VALUES (27, '5-045\46(B\D)5 ', 'bd-sw-05', 'Bardiya', 81.3836823000000038, 28.189743, 1, 'Bhaisahi');
INSERT INTO public."waterApp_gwlocationsdata" VALUES (28, '6-045\46(B\D)6 ', 'bd-sw-06', 'Bardiya', 81.3378797999999961, 28.1691594000000016, 1, 'Rain Nagar');
INSERT INTO public."waterApp_gwlocationsdata" VALUES (29, '7-045\46(B\D)7 ', 'bd-sw-07', 'Bardiya', 81.3593067999999988, 28.3056157000000006, 1, 'Megara Gadhi');
INSERT INTO public."waterApp_gwlocationsdata" VALUES (30, '8-045\46(B\D)8 ', 'bd-sw-08', 'Bardiya', 81.4297427000000056, 28.351235599999999, 1, 'Auri');
INSERT INTO public."waterApp_gwlocationsdata" VALUES (31, '9-045\46(B\D)9 ', 'bd-sw-09', 'Bardiya', 81.3107655999999963, 28.2504704000000011, 1, 'Khairapur');
INSERT INTO public."waterApp_gwlocationsdata" VALUES (32, '10-045\46(B\D)10 ', 'bd-sw-10', 'Bardiya', 81.3365895999999964, 28.3013720000000006, 1, 'Padnaha');
INSERT INTO public."waterApp_gwlocationsdata" VALUES (33, '11-045\46(B\D)11 ', 'bd-sw-11', 'Bardiya', 81.3591490999999962, 28.3065235000000008, 1, 'Baniyabhar');
INSERT INTO public."waterApp_gwlocationsdata" VALUES (34, '12-045\46(B\D)12 ', 'bd-sw-12', 'Bardiya', 81.2628224999999986, 28.2795710999999983, 1, 'Taratal');
INSERT INTO public."waterApp_gwlocationsdata" VALUES (35, '13-045\46(B\D)13 ', 'bd-sw-13', 'Bardiya', 81.2660783999999978, 28.3349603999999999, 1, 'Madhubhan');
INSERT INTO public."waterApp_gwlocationsdata" VALUES (36, '14-045\46(B\D)14 ', 'bd-sw-14', 'Bardiya', 81.5542271999999997, 28.0731406999999997, 1, 'Begnaha');
INSERT INTO public."waterApp_gwlocationsdata" VALUES (37, '15-045\46(B\D)15 ', 'bd-sw-15', 'Bardiya', 81.5542463000000026, 28.073109800000001, 1, 'Bhurigaon');
INSERT INTO public."waterApp_gwlocationsdata" VALUES (38, '16-045\46(B\D)16 ', 'bd-sw-16', 'Bardiya', 81.5541211999999973, 28.0731269999999995, 1, 'Newlpur');
INSERT INTO public."waterApp_gwlocationsdata" VALUES (39, '17-045\46(B\D)17 ', 'bd-sw-17', 'Bardiya', NULL, NULL, 1, 'Thakurdwaar');
INSERT INTO public."waterApp_gwlocationsdata" VALUES (40, 'NISP\INV\STW-5 ', 'bd-sw-18', 'Bardiya', 81.4968652999999961, 28.1486845000000017, 1, 'Shoharawa');
INSERT INTO public."waterApp_gwlocationsdata" VALUES (41, 'n.a. ', 'bd-sw-19', 'Bardiya', 81.4790914999999956, 28.1464123000000015, 1, 'Bhawanipur');
INSERT INTO public."waterApp_gwlocationsdata" VALUES (42, 'NISP\INV\STW-6 ', 'bd-sw-20', 'Bardiya', 81.5008473000000038, 28.1656408999999996, 1, 'Shoharawa');
INSERT INTO public."waterApp_gwlocationsdata" VALUES (43, 'na.a ', 'bd-sw-21', 'Bardiya', 81.5671712000000042, 28.2282732000000003, 1, 'Belwa');
INSERT INTO public."waterApp_gwlocationsdata" VALUES (44, 'n.a. ', 'bd-sw-22', 'Bardiya', 81.5848864999999961, 28.2490130999999991, 1, 'Belwa');
INSERT INTO public."waterApp_gwlocationsdata" VALUES (45, 'n.a. ', 'bd-sw-23', 'Bardiya', 81.2889351000000033, 28.2385395000000017, 1, 'Janaki Tool');
INSERT INTO public."waterApp_gwlocationsdata" VALUES (46, 'SP-1', 'bk-dw-01', 'Banke', 81.5466408999999999, 28.0818215000000002, 2, 'K Gaon');
INSERT INTO public."waterApp_gwlocationsdata" VALUES (47, 'SP-6', 'bk-dw-02', 'Banke', 81.5211362999999949, 28.0960436000000016, 2, 'L Gaon');
INSERT INTO public."waterApp_gwlocationsdata" VALUES (48, 'SP-9', 'bk-dw-03', 'Banke', 81.5165796, 28.1223281000000007, 2, 'Gaughat');
INSERT INTO public."waterApp_gwlocationsdata" VALUES (49, 'SP-13', 'bk-dw-04_1', 'Banke', 81.517303499999997, 28.1132361000000017, 2, 'Gaughat');
INSERT INTO public."waterApp_gwlocationsdata" VALUES (50, 'bk-dw-05', 'bk-dw-05', 'Banke', 81.6024541000000028, 28.0513081, 2, 'Parspur');
INSERT INTO public."waterApp_gwlocationsdata" VALUES (51, 'n.a.', 'bd-dw-01', 'Bardiya', 81.5163615999999962, 28.0851809999999986, 2, 'Shantipur');
INSERT INTO public."waterApp_gwlocationsdata" VALUES (52, 'n.a.', 'bd-dw-03', 'Bardiya', 81.4825912999999957, 28.1055898999999982, 2, 'Tholodafe');
INSERT INTO public."waterApp_gwlocationsdata" VALUES (53, 'n.a.', 'bd-dw-02', 'Bardiya', 81.5026309999999938, 28.0883405999999987, 2, 'Shantipur');
INSERT INTO public."waterApp_gwlocationsdata" VALUES (54, 'n.a.', 'bd-dw-04', 'Bardiya', 81.5111708000000021, 28.0828531000000012, 2, 'Shantipur');


--
-- TOC entry 3039 (class 0 OID 0)
-- Dependencies: 205
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- TOC entry 3040 (class 0 OID 0)
-- Dependencies: 207
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 3041 (class 0 OID 0)
-- Dependencies: 203
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 44, true);


--
-- TOC entry 3042 (class 0 OID 0)
-- Dependencies: 211
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- TOC entry 3043 (class 0 OID 0)
-- Dependencies: 209
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, false);


--
-- TOC entry 3044 (class 0 OID 0)
-- Dependencies: 213
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 3045 (class 0 OID 0)
-- Dependencies: 215
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- TOC entry 3046 (class 0 OID 0)
-- Dependencies: 201
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 11, true);


--
-- TOC entry 3047 (class 0 OID 0)
-- Dependencies: 199
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 34, true);


--
-- TOC entry 3048 (class 0 OID 0)
-- Dependencies: 218
-- Name: graound_water_locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.graound_water_locations_id_seq', 1, false);


--
-- TOC entry 3049 (class 0 OID 0)
-- Dependencies: 222
-- Name: gw_monitoring_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gw_monitoring_id_seq', 1, false);


--
-- TOC entry 3050 (class 0 OID 0)
-- Dependencies: 220
-- Name: type_of_well_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.type_of_well_id_seq', 2, true);


--
-- TOC entry 3051 (class 0 OID 0)
-- Dependencies: 223
-- Name: waterApp_gwlocationsdata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."waterApp_gwlocationsdata_id_seq"', 1, false);


--
-- TOC entry 2814 (class 2606 OID 44187)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 2819 (class 2606 OID 44124)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 2822 (class 2606 OID 44077)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 44067)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2809 (class 2606 OID 44110)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 2811 (class 2606 OID 44059)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2830 (class 2606 OID 44095)
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2833 (class 2606 OID 44139)
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- TOC entry 2824 (class 2606 OID 44085)
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2836 (class 2606 OID 44103)
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2839 (class 2606 OID 44153)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- TOC entry 2827 (class 2606 OID 44181)
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 2842 (class 2606 OID 44167)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 2804 (class 2606 OID 44051)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 2806 (class 2606 OID 44049)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2802 (class 2606 OID 44041)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2846 (class 2606 OID 44196)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 2849 (class 2606 OID 44268)
-- Name: graound_water_locations graound_water_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.graound_water_locations
    ADD CONSTRAINT graound_water_locations_pkey PRIMARY KEY (id);


--
-- TOC entry 2857 (class 2606 OID 44415)
-- Name: gw_monitoring_kobo gw_monitoring_kobo_fid_885340d6_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gw_monitoring_kobo
    ADD CONSTRAINT gw_monitoring_kobo_fid_885340d6_pk PRIMARY KEY (fid);


--
-- TOC entry 2859 (class 2606 OID 44413)
-- Name: gw_monitoring_kobo gw_monitoring_kobo_fid_885340d6_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gw_monitoring_kobo
    ADD CONSTRAINT gw_monitoring_kobo_fid_885340d6_uniq UNIQUE (fid);


--
-- TOC entry 2852 (class 2606 OID 44291)
-- Name: type_of_well type_of_well_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_of_well
    ADD CONSTRAINT type_of_well_pkey PRIMARY KEY (id);


--
-- TOC entry 2854 (class 2606 OID 44365)
-- Name: waterApp_gwlocationsdata waterApp_gwlocationsdata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."waterApp_gwlocationsdata"
    ADD CONSTRAINT "waterApp_gwlocationsdata_pkey" PRIMARY KEY (id);


--
-- TOC entry 2812 (class 1259 OID 44188)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 2817 (class 1259 OID 44125)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 2820 (class 1259 OID 44126)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 2807 (class 1259 OID 44111)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 2828 (class 1259 OID 44141)
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- TOC entry 2831 (class 1259 OID 44140)
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- TOC entry 2834 (class 1259 OID 44155)
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 2837 (class 1259 OID 44154)
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 2825 (class 1259 OID 44182)
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 2840 (class 1259 OID 44178)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 2843 (class 1259 OID 44179)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 2844 (class 1259 OID 44198)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 2847 (class 1259 OID 44197)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 2850 (class 1259 OID 44293)
-- Name: graound_water_locations_type_id_abe56a01; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX graound_water_locations_type_id_abe56a01 ON public.graound_water_locations USING btree (type_id);


--
-- TOC entry 2855 (class 1259 OID 44371)
-- Name: waterApp_gwlocationsdata_type_id_33def277; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "waterApp_gwlocationsdata_type_id_33def277" ON public."waterApp_gwlocationsdata" USING btree (type_id);


--
-- TOC entry 2862 (class 2606 OID 44118)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2861 (class 2606 OID 44113)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2860 (class 2606 OID 44104)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2864 (class 2606 OID 44133)
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2863 (class 2606 OID 44128)
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2866 (class 2606 OID 44147)
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2865 (class 2606 OID 44142)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2867 (class 2606 OID 44168)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2868 (class 2606 OID 44173)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2869 (class 2606 OID 44294)
-- Name: graound_water_locations graound_water_locations_type_id_abe56a01_fk_type_of_well_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.graound_water_locations
    ADD CONSTRAINT graound_water_locations_type_id_abe56a01_fk_type_of_well_id FOREIGN KEY (type_id) REFERENCES public.type_of_well(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2870 (class 2606 OID 44366)
-- Name: waterApp_gwlocationsdata waterApp_gwlocationsdata_type_id_33def277_fk_type_of_well_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."waterApp_gwlocationsdata"
    ADD CONSTRAINT "waterApp_gwlocationsdata_type_id_33def277_fk_type_of_well_id" FOREIGN KEY (type_id) REFERENCES public.type_of_well(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2021-09-16 09:16:50

--
-- PostgreSQL database dump complete
--

