--
-- PostgreSQL database dump
--

-- Dumped from database version 16.8
-- Dumped by pg_dump version 16.2

-- Started on 2025-06-24 07:27:50

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
SET search_path = 'public';

--
-- TOC entry 8 (class 2615 OID 16853)
-- Name: radx_history; Type: SCHEMA; Schema: -; Owner: radx_admin
--

CREATE SCHEMA radx_history;


ALTER SCHEMA radx_history OWNER TO radx_admin;

--
-- TOC entry 5399 (class 0 OID 0)
-- Dependencies: 8
-- Name: SCHEMA radx_history; Type: COMMENT; Schema: -; Owner: radx_admin
--

COMMENT ON SCHEMA radx_history IS 'radx_history schema';


--
-- TOC entry 1506 (class 1247 OID 41201)
-- Name: variableinfotype; Type: TYPE; Schema: public; Owner: radx_admin
--

CREATE TYPE public.variableinfotype AS (
	id character varying,
	label character varying,
	description text,
	section character varying,
	cardinality character varying,
	datatype character varying,
	unit character varying,
	enumeration jsonb
);


ALTER TYPE public.variableinfotype OWNER TO radx_admin;

--
-- TOC entry 1509 (class 1247 OID 41204)
-- Name: variablemappingtype; Type: TYPE; Schema: public; Owner: radx_admin
--

CREATE TYPE public.variablemappingtype AS (
	id character varying,
	center character varying,
	program character varying,
	tier_2_variable_id character varying,
	label text,
	description text,
	section character varying,
	cardinality character varying,
	datatype character varying,
	unit character varying,
	provenance character varying,
	enumeration json,
	enumeration_mapping json,
	notes text,
	dataelements json,
	mapping jsonb
);


ALTER TYPE public.variablemappingtype OWNER TO radx_admin;

--
-- TOC entry 1512 (class 1247 OID 41207)
-- Name: variabletermstype; Type: TYPE; Schema: public; Owner: radx_admin
--

CREATE TYPE public.variabletermstype AS (
	id character varying,
	tier_1_variable_id character varying,
	identifier character varying,
	lookupurl character varying,
	label character varying,
	synonyms json,
	terms jsonb
);


ALTER TYPE public.variabletermstype OWNER TO radx_admin;

-- Install hstore extension
CREATE EXTENSION IF NOT EXISTS hstore;

--
-- TOC entry 486 (class 1255 OID 28416)
-- Name: after_operation_trigger_fnc(); Type: FUNCTION; Schema: public; Owner: radx_admin
--

CREATE FUNCTION public.after_operation_trigger_fnc() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
            DECLARE
                _operated_at timestamp := CURRENT_TIMESTAMP AT TIME ZONE 'UTC';
				_history_table_name text :=  'radx_history.' || TG_TABLE_NAME || '_history';
				_column_name text;
				_new_h hstore = hstore(new);
    			_old_h hstore = hstore(old);
				_created_by text;
				_modified_by text;	
				
            BEGIN		
				IF to_jsonb(NEW) ? 'created_by' THEN
					_created_by  := new."created_by";
				END IF;
				IF  (to_jsonb(NEW) ? 'uploaded_by') THEN
					_created_by  := new."uploaded_by";
				END IF;
				IF to_jsonb(NEW) ? 'modified_by' THEN 
					_modified_by := new."modified_by";
				END IF;
				IF to_jsonb(NEW) ? 'updated_by' THEN 
					_modified_by := new."updated_by";
				END IF;
				IF (TG_OP = 'DELETE') THEN
					FOREACH _column_name in array akeys(_old_h)
					LOOP
						IF _column_name Not in('id','modified_at','modified_by','updated_at','updated_by' ) and  _old_h->_column_name is NOT NULL THEN
							EXECUTE format( 'INSERT INTO %s (id, column_name, old_value, new_value, operation, operated_at, operated_by)
							VALUES (%s, %L, %L, null, ''D'', %L,  ''9999'');', _history_table_name, old.id, _column_name, _old_h->_column_name::TEXT, _operated_at);
						END IF;
					END LOOP;
					RETURN NULL;
				ELSIF (TG_OP = 'UPDATE') THEN
    				FOREACH _column_name in array akeys(_new_h)
					LOOP
        				IF _column_name Not in('id', 'modified_at','modified_by','updated_at','updated_by') and (_new_h->_column_name IS DISTINCT from _old_h->_column_name) then
            				EXECUTE format( 'INSERT INTO %s (id, column_name, old_value, new_value, operation, operated_at, operated_by)
							VALUES (%s, %L, %L, %L, ''U'', %L, %L);', _history_table_name, old.id, _column_name, _old_h->_column_name::TEXT, _new_h->_column_name::TEXT, _operated_at, _modified_by);
    					END IF;
    				END LOOP;
				END IF;
				RETURN NEW;
				
				EXCEPTION
    			WHEN NO_DATA_FOUND THEN 
      			RAISE NOTICE 'No data found';
    
   				WHEN OTHERS THEN
      			RAISE NOTICE '% %', SQLERRM, SQLSTATE;
			END;
$$;


ALTER FUNCTION public.after_operation_trigger_fnc() OWNER TO radx_admin;

--
-- TOC entry 465 (class 1255 OID 28415)
-- Name: before_operation_trigger_fnc(); Type: FUNCTION; Schema: public; Owner: radx_admin
--

CREATE FUNCTION public.before_operation_trigger_fnc() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
     
        BEGIN		
			IF (TG_OP = 'DELETE') THEN
				RETURN NULL;	
			ELSIF (TG_OP = 'UPDATE') THEN	
				IF to_jsonb(NEW) ? 'modified_at' THEN 
						NEW.modified_at := CURRENT_TIMESTAMP AT TIME ZONE 'UTC';
				END IF;
				IF to_jsonb(NEW) ? 'updated_at' THEN 
						NEW.updated_at := CURRENT_TIMESTAMP AT TIME ZONE 'UTC';
				END IF;
			ELSIF (TG_OP = 'INSERT' ) THEN
				IF to_jsonb(NEW) ? 'created_at' THEN
					NEW.created_at := CURRENT_TIMESTAMP AT TIME ZONE 'UTC';	
				END IF;
				IF  (to_jsonb(NEW) ? 'uploaded_at') THEN
					NEW.uploaded_at := CURRENT_TIMESTAMP AT TIME ZONE 'UTC'; 
				END IF;
			
			END IF;

			RETURN NEW;
				
  			EXCEPTION
    			WHEN NO_DATA_FOUND THEN 
      			RAISE NOTICE 'No data found';
    
   				WHEN OTHERS THEN
      			RAISE NOTICE '% %', SQLERRM, SQLSTATE;
 		
			END;
$$;


ALTER FUNCTION public.before_operation_trigger_fnc() OWNER TO radx_admin;

--
-- TOC entry 524 (class 1255 OID 61772)
-- Name: get_filename(text); Type: FUNCTION; Schema: public; Owner: radx_admin
--

CREATE FUNCTION public.get_filename(_path text) RETURNS text
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $$
begin
  _path := reverse(_path);
  _path := nullif((substring(_path, 0, strpos(_path, '/'))), '');
  return nullif(reverse(_path), '');
end;
$$;


ALTER FUNCTION public.get_filename(_path text) OWNER TO radx_admin;

--
-- TOC entry 513 (class 1255 OID 22067)
-- Name: ras_tracking_after_delete_trigger_fnc(); Type: FUNCTION; Schema: public; Owner: radx_admin
--

CREATE FUNCTION public.ras_tracking_after_delete_trigger_fnc() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
            DECLARE
                _delete_at timestamp := CURRENT_TIMESTAMP AT TIME ZONE 'UTC';
            BEGIN		
				IF (TG_OP = 'DELETE') THEN
					EXECUTE format( 'INSERT INTO radx_history.ras_tracking_history(id, authorization_code, correlation_id, session_id, access_token, refresh_token, id_token, passport, first_name, last_name, email, institution_name, expire_at, created_at, modified_at, deleted_at)
						VALUES (%s, %L, %L,  %L,  %L, %L,   %L, %L, %L, %L, %L, %L, %L, %L, %L, %L);',
						old.id, old.authorization_code, old.correlation_id, old.session_id, old.access_token, old.refresh_token, old.id_token, old.passport, old.first_name, old.last_name, old.email, old.institution_name, old.expire_at, old.created_at, old.modified_at, _delete_at);
				END IF;
				RETURN NEW;
				
				EXCEPTION
    			WHEN NO_DATA_FOUND THEN 
      			RAISE NOTICE 'No data found';
    
   				WHEN OTHERS THEN
      			RAISE NOTICE '% %', SQLERRM, SQLSTATE;
			END;
$$;


ALTER FUNCTION public.ras_tracking_after_delete_trigger_fnc() OWNER TO radx_admin;

--
-- TOC entry 518 (class 1255 OID 29429)
-- Name: sp_generate_hub_content_metrics(); Type: PROCEDURE; Schema: public; Owner: radx_admin
--

CREATE PROCEDURE public.sp_generate_hub_content_metrics()
    LANGUAGE plpgsql
    AS $$
 declare
 	_report_date date = Now()::DATE;
 	_report_id integer;
 begin
	IF  EXISTS (SELECT FROM metrics_report where report_date = _report_date) THEN 
		 select id into _report_id from metrics_report where report_date = _report_date;
	ELSE
		INSERT INTO  metrics_report (report_date, type_id) values(_report_date, 1) returning id into  _report_id;
	END IF;
	
	Delete from hub_content_metrics where report_id=_report_id;
	INSERT INTO hub_content_metrics(report_id, center, study_phs, study_title,study_status, study_create_date,study_has_data_file,
		total_file_count,data_file_count,total_file_size, orig_data_file_count, standardized_data_file_count, metadata_file_count,
		dictionary_file_count,	readme_file_count,	other_file_count )
	SELECT _report_id, d.center, d.study_phs, d.study_title, d.study_status, d.study_create_date,
			d.study_has_data_file,
            d.total_file_count,
            d.data_file_count,
            d.total_file_size,
            d.orig_data_file_count,
            d.standardized_data_file_count,
            d.metadata_file_count,
            d.dictionary_file_count,
            d.readme_file_count,
            d.other_file_count			
 	FROM view_current_hub_content d
	where study_status='Approved';
END;
$$;


ALTER PROCEDURE public.sp_generate_hub_content_metrics() OWNER TO radx_admin;

--
-- TOC entry 519 (class 1255 OID 22106)
-- Name: sp_parse_variables(); Type: PROCEDURE; Schema: public; Owner: radx_admin
--

CREATE PROCEDURE public.sp_parse_variables()
    LANGUAGE plpgsql
    AS $$
DECLARE
  _id_sq int;
begin
--select * from data_file_variable
--select * from view_data_file_variables --where is_tier_1
    truncate table data_file_variable;
	select setval('data_file_variable_id_seq', 100000) into _id_sq ;
	INSERT INTO data_file_variable (data_file_id, variable)
	select a.id, trim('�' FROM (trim(a.t))) from
        (SELECT id, UNNEST(STRING_TO_ARRAY(file_headers, ';')) as t
            FROM data_file where  is_current_version and file_category_id in (select id from lkup_data_file_category where category_group='data')
		 and (file_headers is not NULL and file_headers != 'Unable to determine file headers.')) a
            WHERE a.t is not NULL and length(trim('�' FROM (trim(a.t)))) > 0;
	--add new study_level_variables
	/*INSERT INTO public.study_level_variable(study_id, variable)
 	select study_id, variable from 
 	view_study_variables  where variable_id is null;
  --add new variables to variable table
  	INSERT INTO public.variable(study_level_variable_id) 
  	select id from study_level_variable where id not in (select study_level_variable_id from variable where study_level_variable_id is not null);
	*/
end; 
$$;


ALTER PROCEDURE public.sp_parse_variables() OWNER TO radx_admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 285 (class 1259 OID 16953)
-- Name: data_file; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.data_file (
    id integer NOT NULL,
    submission_id integer NOT NULL,
    source_file_name text,
    normalized_file_name text,
    version_no integer,
    is_current_version boolean,
    original_data_file_id integer,
    file_category_id integer,
    file_size bigint,
    variable_count integer,
    sample_size integer,
    file_headers text,
    pii_phi boolean,
    pii_phi_validation_result jsonb,
    status_id integer NOT NULL,
    s3_file_id integer,
    dictionary_file_id integer,
    metadata_file_id integer,
    comments text,
    cde_validation boolean,
    validation_result jsonb,
    acknowledged boolean,
    dict_validation boolean,
    meta_validation boolean,
    approval_date timestamp without time zone,
    reject_date timestamp without time zone,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by integer DEFAULT 9999 NOT NULL,
    modified_at timestamp without time zone,
    modified_by integer,
    has_variable boolean
);


ALTER TABLE public.data_file OWNER TO radx_admin;

--
-- TOC entry 293 (class 1259 OID 17069)
-- Name: data_file_download; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.data_file_download (
    id integer NOT NULL,
    data_file_id integer NOT NULL,
    download_by integer NOT NULL,
    download_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.data_file_download OWNER TO radx_admin;

--
-- TOC entry 292 (class 1259 OID 17068)
-- Name: data_file_download_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.data_file_download_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.data_file_download_id_seq OWNER TO radx_admin;

--
-- TOC entry 5408 (class 0 OID 0)
-- Dependencies: 292
-- Name: data_file_download_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.data_file_download_id_seq OWNED BY public.data_file_download.id;


--
-- TOC entry 284 (class 1259 OID 16952)
-- Name: data_file_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.data_file_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.data_file_id_seq OWNER TO radx_admin;

--
-- TOC entry 5410 (class 0 OID 0)
-- Dependencies: 284
-- Name: data_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.data_file_id_seq OWNED BY public.data_file.id;


--
-- TOC entry 328 (class 1259 OID 22088)
-- Name: data_file_variable; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.data_file_variable (
    id integer NOT NULL,
    data_file_id integer NOT NULL,
    variable character varying(1024)
);


ALTER TABLE public.data_file_variable OWNER TO radx_admin;

--
-- TOC entry 327 (class 1259 OID 22087)
-- Name: data_file_variable_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.data_file_variable_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.data_file_variable_id_seq OWNER TO radx_admin;

--
-- TOC entry 5413 (class 0 OID 0)
-- Dependencies: 327
-- Name: data_file_variable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.data_file_variable_id_seq OWNED BY public.data_file_variable.id;


--
-- TOC entry 283 (class 1259 OID 16921)
-- Name: data_submission; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.data_submission (
    id integer NOT NULL,
    study_id integer NOT NULL,
    submitter_user_id integer,
    description text,
    step_id integer NOT NULL,
    is_validated boolean DEFAULT false NOT NULL,
    status_id integer NOT NULL,
    date_submitted timestamp without time zone,
    date_approved timestamp without time zone,
    file_rejection_reason text,
    file_rejected_count integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by integer DEFAULT 9999 NOT NULL,
    modified_at timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.data_submission OWNER TO radx_admin;

--
-- TOC entry 282 (class 1259 OID 16920)
-- Name: data_submission_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.data_submission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.data_submission_id_seq OWNER TO radx_admin;

--
-- TOC entry 5416 (class 0 OID 0)
-- Dependencies: 282
-- Name: data_submission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.data_submission_id_seq OWNED BY public.data_submission.id;


--
-- TOC entry 313 (class 1259 OID 17282)
-- Name: datafile_harmonization_metrics; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.datafile_harmonization_metrics (
    id integer NOT NULL,
    report_id integer NOT NULL,
    orig_file_name character varying(1024),
    transform_file_name character varying(1024),
    study_phs character varying(10),
    center character varying(128),
    orig_variable_count integer,
    transform_variable_count integer,
    harmonizable_tier_1_variable_count integer,
    harmonized_tier_1_variable_count integer,
    orig_variables text,
    transform_variables text,
    harmonizable_tier_1_variables text,
    harmonized_tier_1_variables text
);


ALTER TABLE public.datafile_harmonization_metrics OWNER TO radx_admin;

--
-- TOC entry 312 (class 1259 OID 17281)
-- Name: datafile_harmonization_metrics_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.datafile_harmonization_metrics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.datafile_harmonization_metrics_id_seq OWNER TO radx_admin;

--
-- TOC entry 5419 (class 0 OID 0)
-- Dependencies: 312
-- Name: datafile_harmonization_metrics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.datafile_harmonization_metrics_id_seq OWNED BY public.datafile_harmonization_metrics.id;


--
-- TOC entry 252 (class 1259 OID 16623)
-- Name: entity_property; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.entity_property (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    entity_type_id integer NOT NULL,
    property_type_id integer NOT NULL,
    property_source_id integer NOT NULL,
    is_group_property boolean DEFAULT false,
    cardinality boolean DEFAULT false,
    code_list_id integer,
    is_hidden boolean
);


ALTER TABLE public.entity_property OWNER TO radx_admin;

--
-- TOC entry 254 (class 1259 OID 16654)
-- Name: entity_property_display_setting; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.entity_property_display_setting (
    id integer NOT NULL,
    entity_property_id integer NOT NULL,
    page text NOT NULL,
    display_section text,
    display_label text,
    display_order integer,
    is_facet boolean DEFAULT false,
    facet_order integer,
    group_property_id integer,
    group_order integer,
    is_sortable boolean DEFAULT false
);


ALTER TABLE public.entity_property_display_setting OWNER TO radx_admin;

--
-- TOC entry 253 (class 1259 OID 16653)
-- Name: entity_property_display_setting_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.entity_property_display_setting_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.entity_property_display_setting_id_seq OWNER TO radx_admin;

--
-- TOC entry 5423 (class 0 OID 0)
-- Dependencies: 253
-- Name: entity_property_display_setting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.entity_property_display_setting_id_seq OWNED BY public.entity_property_display_setting.id;


--
-- TOC entry 251 (class 1259 OID 16622)
-- Name: entity_property_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.entity_property_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.entity_property_id_seq OWNER TO radx_admin;

--
-- TOC entry 5424 (class 0 OID 0)
-- Dependencies: 251
-- Name: entity_property_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.entity_property_id_seq OWNED BY public.entity_property.id;


--
-- TOC entry 295 (class 1259 OID 17087)
-- Name: entity_property_mta_mapping; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.entity_property_mta_mapping (
    id integer NOT NULL,
    entity_property_id integer,
    pdf_field_name text,
    codelist_id integer,
    codelist_value_id integer,
    description text
);


ALTER TABLE public.entity_property_mta_mapping OWNER TO radx_admin;

--
-- TOC entry 294 (class 1259 OID 17086)
-- Name: entity_property_mta_mapping_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.entity_property_mta_mapping_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.entity_property_mta_mapping_id_seq OWNER TO radx_admin;

--
-- TOC entry 5426 (class 0 OID 0)
-- Dependencies: 294
-- Name: entity_property_mta_mapping_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.entity_property_mta_mapping_id_seq OWNED BY public.entity_property_mta_mapping.id;


--
-- TOC entry 303 (class 1259 OID 17178)
-- Name: event_link; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.event_link (
    id integer NOT NULL,
    event_id integer NOT NULL,
    link_label character varying(255) NOT NULL,
    link_url text NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by integer DEFAULT 9999 NOT NULL,
    modified_at timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.event_link OWNER TO radx_admin;

--
-- TOC entry 302 (class 1259 OID 17177)
-- Name: event_link_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.event_link_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.event_link_id_seq OWNER TO radx_admin;

--
-- TOC entry 5429 (class 0 OID 0)
-- Dependencies: 302
-- Name: event_link_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.event_link_id_seq OWNED BY public.event_link.id;


--
-- TOC entry 301 (class 1259 OID 17162)
-- Name: events; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.events (
    id integer NOT NULL,
    title character varying(1024) NOT NULL,
    slug character varying(50) NOT NULL,
    description text NOT NULL,
    event_type_id integer NOT NULL,
    registration_url text,
    event_date timestamp with time zone NOT NULL,
    expiration_date timestamp without time zone,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by integer DEFAULT 9999 NOT NULL,
    modified_at timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.events OWNER TO radx_admin;

--
-- TOC entry 300 (class 1259 OID 17161)
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.events_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.events_id_seq OWNER TO radx_admin;

--
-- TOC entry 5432 (class 0 OID 0)
-- Dependencies: 300
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;


--
-- TOC entry 398 (class 1259 OID 40537)
-- Name: funding; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.funding (
    id integer NOT NULL,
    slug character varying(50) NOT NULL,
    title character varying(1024) NOT NULL,
    description text,
    notice_number character varying(256),
    activity_code character varying(256),
    url character varying(1024),
    release_date date NOT NULL,
    expiration_date date,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by integer DEFAULT 9999 NOT NULL,
    modified_at timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.funding OWNER TO radx_admin;

--
-- TOC entry 397 (class 1259 OID 40536)
-- Name: funding_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.funding_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.funding_id_seq OWNER TO radx_admin;

--
-- TOC entry 5435 (class 0 OID 0)
-- Dependencies: 397
-- Name: funding_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.funding_id_seq OWNED BY public.funding.id;


--
-- TOC entry 330 (class 1259 OID 22320)
-- Name: hub_content_metrics; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.hub_content_metrics (
    id integer NOT NULL,
    report_id integer NOT NULL,
    center text,
    study_phs text,
    study_title text,
    study_status text,
    study_create_date timestamp without time zone,
    study_has_data_file boolean,
    total_file_size numeric,
    total_file_count integer,
    data_file_count integer,
    orig_data_file_count integer,
    standardized_data_file_count integer,
    metadata_file_count integer,
    dictionary_file_count integer,
    readme_file_count integer,
    other_file_count integer
);


ALTER TABLE public.hub_content_metrics OWNER TO radx_admin;

--
-- TOC entry 329 (class 1259 OID 22319)
-- Name: hub_content_metrics_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.hub_content_metrics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.hub_content_metrics_id_seq OWNER TO radx_admin;

--
-- TOC entry 5438 (class 0 OID 0)
-- Dependencies: 329
-- Name: hub_content_metrics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.hub_content_metrics_id_seq OWNED BY public.hub_content_metrics.id;


--
-- TOC entry 258 (class 1259 OID 16713)
-- Name: institution; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.institution (
    id integer NOT NULL,
    ror_id character varying(36),
    name character varying(256) NOT NULL,
    acronym character varying(50),
    alternate_name text,
    institution_type_id integer,
    is_for_profit boolean,
    country_id integer,
    state_id integer,
    province_region character varying(256),
    status_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by integer,
    modified_at timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.institution OWNER TO radx_admin;

--
-- TOC entry 257 (class 1259 OID 16712)
-- Name: institution_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.institution_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.institution_id_seq OWNER TO radx_admin;

--
-- TOC entry 5441 (class 0 OID 0)
-- Dependencies: 257
-- Name: institution_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.institution_id_seq OWNED BY public.institution.id;


--
-- TOC entry 270 (class 1259 OID 16827)
-- Name: jwt_token; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.jwt_token (
    id integer NOT NULL,
    user_id integer,
    sagemaker_user_profile_name character varying(36),
    created_at timestamp without time zone
);


ALTER TABLE public.jwt_token OWNER TO radx_admin;

--
-- TOC entry 269 (class 1259 OID 16826)
-- Name: jwt_token_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.jwt_token_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jwt_token_id_seq OWNER TO radx_admin;

--
-- TOC entry 5444 (class 0 OID 0)
-- Dependencies: 269
-- Name: jwt_token_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.jwt_token_id_seq OWNED BY public.jwt_token.id;


--
-- TOC entry 289 (class 1259 OID 17008)
-- Name: lkup_cde_codelist; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.lkup_cde_codelist (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text
);


ALTER TABLE public.lkup_cde_codelist OWNER TO radx_admin;

--
-- TOC entry 288 (class 1259 OID 17007)
-- Name: lkup_cde_codelist_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.lkup_cde_codelist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lkup_cde_codelist_id_seq OWNER TO radx_admin;

--
-- TOC entry 5447 (class 0 OID 0)
-- Dependencies: 288
-- Name: lkup_cde_codelist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.lkup_cde_codelist_id_seq OWNED BY public.lkup_cde_codelist.id;


--
-- TOC entry 291 (class 1259 OID 17017)
-- Name: lkup_cde_codelist_value; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.lkup_cde_codelist_value (
    id integer NOT NULL,
    cde_codelist_id integer,
    value integer NOT NULL,
    label text NOT NULL,
    description text,
    display_order integer
);


ALTER TABLE public.lkup_cde_codelist_value OWNER TO radx_admin;

--
-- TOC entry 290 (class 1259 OID 17016)
-- Name: lkup_cde_codelist_value_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.lkup_cde_codelist_value_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lkup_cde_codelist_value_id_seq OWNER TO radx_admin;

--
-- TOC entry 5450 (class 0 OID 0)
-- Dependencies: 290
-- Name: lkup_cde_codelist_value_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.lkup_cde_codelist_value_id_seq OWNED BY public.lkup_cde_codelist_value.id;


--
-- TOC entry 222 (class 1259 OID 16430)
-- Name: lkup_country; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.lkup_country (
    id integer NOT NULL,
    name character varying(256) NOT NULL,
    display_order integer NOT NULL
);


ALTER TABLE public.lkup_country OWNER TO radx_admin;

--
-- TOC entry 221 (class 1259 OID 16429)
-- Name: lkup_country_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.lkup_country_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lkup_country_id_seq OWNER TO radx_admin;

--
-- TOC entry 5453 (class 0 OID 0)
-- Dependencies: 221
-- Name: lkup_country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.lkup_country_id_seq OWNED BY public.lkup_country.id;


--
-- TOC entry 234 (class 1259 OID 16498)
-- Name: lkup_data_file_category; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.lkup_data_file_category (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    category_group text,
    display_order integer NOT NULL
);


ALTER TABLE public.lkup_data_file_category OWNER TO radx_admin;

--
-- TOC entry 233 (class 1259 OID 16497)
-- Name: lkup_data_file_category_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.lkup_data_file_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lkup_data_file_category_id_seq OWNER TO radx_admin;

--
-- TOC entry 5455 (class 0 OID 0)
-- Dependencies: 233
-- Name: lkup_data_file_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.lkup_data_file_category_id_seq OWNED BY public.lkup_data_file_category.id;


--
-- TOC entry 236 (class 1259 OID 16507)
-- Name: lkup_center; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.lkup_center (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text
);


ALTER TABLE public.lkup_center OWNER TO radx_admin;

--
-- TOC entry 235 (class 1259 OID 16506)
-- Name: lkup_center_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.lkup_center_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lkup_center_id_seq OWNER TO radx_admin;

--
-- TOC entry 5457 (class 0 OID 0)
-- Dependencies: 235
-- Name: lkup_center_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.lkup_center_id_seq OWNED BY public.lkup_center.id;


--
-- TOC entry 238 (class 1259 OID 16517)
-- Name: lkup_entity_type; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.lkup_entity_type (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text
);


ALTER TABLE public.lkup_entity_type OWNER TO radx_admin;

--
-- TOC entry 237 (class 1259 OID 16516)
-- Name: lkup_entity_type_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.lkup_entity_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lkup_entity_type_id_seq OWNER TO radx_admin;

--
-- TOC entry 5459 (class 0 OID 0)
-- Dependencies: 237
-- Name: lkup_entity_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.lkup_entity_type_id_seq OWNED BY public.lkup_entity_type.id;


--
-- TOC entry 297 (class 1259 OID 17111)
-- Name: lkup_event_type; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.lkup_event_type (
    id integer NOT NULL,
    name character varying(1024) NOT NULL
);


ALTER TABLE public.lkup_event_type OWNER TO radx_admin;

--
-- TOC entry 296 (class 1259 OID 17110)
-- Name: lkup_event_type_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.lkup_event_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lkup_event_type_id_seq OWNER TO radx_admin;

--
-- TOC entry 5461 (class 0 OID 0)
-- Dependencies: 296
-- Name: lkup_event_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.lkup_event_type_id_seq OWNED BY public.lkup_event_type.id;


--
-- TOC entry 240 (class 1259 OID 16526)
-- Name: lkup_file_type; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.lkup_file_type (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text
);


ALTER TABLE public.lkup_file_type OWNER TO radx_admin;

--
-- TOC entry 239 (class 1259 OID 16525)
-- Name: lkup_file_type_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.lkup_file_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lkup_file_type_id_seq OWNER TO radx_admin;

--
-- TOC entry 5464 (class 0 OID 0)
-- Dependencies: 239
-- Name: lkup_file_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.lkup_file_type_id_seq OWNED BY public.lkup_file_type.id;


--
-- TOC entry 224 (class 1259 OID 16437)
-- Name: lkup_institution_type; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.lkup_institution_type (
    id integer NOT NULL,
    name character varying(256) NOT NULL,
    display_order integer NOT NULL
);


ALTER TABLE public.lkup_institution_type OWNER TO radx_admin;

--
-- TOC entry 223 (class 1259 OID 16436)
-- Name: lkup_institution_type_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.lkup_institution_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lkup_institution_type_id_seq OWNER TO radx_admin;

--
-- TOC entry 5466 (class 0 OID 0)
-- Dependencies: 223
-- Name: lkup_institution_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.lkup_institution_type_id_seq OWNED BY public.lkup_institution_type.id;


--
-- TOC entry 309 (class 1259 OID 17259)
-- Name: lkup_metrics_report_type; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.lkup_metrics_report_type (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text
);


ALTER TABLE public.lkup_metrics_report_type OWNER TO radx_admin;

--
-- TOC entry 308 (class 1259 OID 17258)
-- Name: lkup_metrics_report_type_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.lkup_metrics_report_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lkup_metrics_report_type_id_seq OWNER TO radx_admin;

--
-- TOC entry 5468 (class 0 OID 0)
-- Dependencies: 308
-- Name: lkup_metrics_report_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.lkup_metrics_report_type_id_seq OWNED BY public.lkup_metrics_report_type.id;


--
-- TOC entry 299 (class 1259 OID 17120)
-- Name: lkup_news_type; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.lkup_news_type (
    id integer NOT NULL,
    name character varying(1024) NOT NULL
);


ALTER TABLE public.lkup_news_type OWNER TO radx_admin;

--
-- TOC entry 298 (class 1259 OID 17119)
-- Name: lkup_news_type_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.lkup_news_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lkup_news_type_id_seq OWNER TO radx_admin;

--
-- TOC entry 5471 (class 0 OID 0)
-- Dependencies: 298
-- Name: lkup_news_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.lkup_news_type_id_seq OWNED BY public.lkup_news_type.id;


--
-- TOC entry 230 (class 1259 OID 16475)
-- Name: lkup_property_codelist; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.lkup_property_codelist (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text
);


ALTER TABLE public.lkup_property_codelist OWNER TO radx_admin;

--
-- TOC entry 229 (class 1259 OID 16474)
-- Name: lkup_property_codelist_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.lkup_property_codelist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lkup_property_codelist_id_seq OWNER TO radx_admin;

--
-- TOC entry 5474 (class 0 OID 0)
-- Dependencies: 229
-- Name: lkup_property_codelist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.lkup_property_codelist_id_seq OWNED BY public.lkup_property_codelist.id;


--
-- TOC entry 232 (class 1259 OID 16484)
-- Name: lkup_property_codelist_value; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.lkup_property_codelist_value (
    id integer NOT NULL,
    property_codelist_id integer,
    value text NOT NULL,
    display_order integer
);


ALTER TABLE public.lkup_property_codelist_value OWNER TO radx_admin;

--
-- TOC entry 231 (class 1259 OID 16483)
-- Name: lkup_property_codelist_value_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.lkup_property_codelist_value_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lkup_property_codelist_value_id_seq OWNER TO radx_admin;

--
-- TOC entry 5476 (class 0 OID 0)
-- Dependencies: 231
-- Name: lkup_property_codelist_value_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.lkup_property_codelist_value_id_seq OWNED BY public.lkup_property_codelist_value.id;


--
-- TOC entry 244 (class 1259 OID 16544)
-- Name: lkup_property_source; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.lkup_property_source (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text
);


ALTER TABLE public.lkup_property_source OWNER TO radx_admin;

--
-- TOC entry 243 (class 1259 OID 16543)
-- Name: lkup_property_source_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.lkup_property_source_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lkup_property_source_id_seq OWNER TO radx_admin;

--
-- TOC entry 5478 (class 0 OID 0)
-- Dependencies: 243
-- Name: lkup_property_source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.lkup_property_source_id_seq OWNED BY public.lkup_property_source.id;


--
-- TOC entry 242 (class 1259 OID 16535)
-- Name: lkup_property_type; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.lkup_property_type (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text
);


ALTER TABLE public.lkup_property_type OWNER TO radx_admin;

--
-- TOC entry 241 (class 1259 OID 16534)
-- Name: lkup_property_type_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.lkup_property_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lkup_property_type_id_seq OWNER TO radx_admin;

--
-- TOC entry 5480 (class 0 OID 0)
-- Dependencies: 241
-- Name: lkup_property_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.lkup_property_type_id_seq OWNED BY public.lkup_property_type.id;


--
-- TOC entry 415 (class 1259 OID 46679)
-- Name: lkup_referrer; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.lkup_referrer (
    id integer NOT NULL,
    name character varying(256) NOT NULL,
    specify_prompt character varying(256),
    description character varying(255),
    display_order integer
);


ALTER TABLE public.lkup_referrer OWNER TO radx_admin;

--
-- TOC entry 414 (class 1259 OID 46678)
-- Name: lkup_referrer_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.lkup_referrer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lkup_referrer_id_seq OWNER TO radx_admin;

--
-- TOC entry 5482 (class 0 OID 0)
-- Dependencies: 414
-- Name: lkup_referrer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.lkup_referrer_id_seq OWNED BY public.lkup_referrer.id;


--
-- TOC entry 262 (class 1259 OID 16750)
-- Name: lkup_researcher_level; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.lkup_researcher_level (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    description character varying(255)
);


ALTER TABLE public.lkup_researcher_level OWNER TO radx_admin;

--
-- TOC entry 261 (class 1259 OID 16749)
-- Name: lkup_researcher_level_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.lkup_researcher_level_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lkup_researcher_level_id_seq OWNER TO radx_admin;

--
-- TOC entry 5485 (class 0 OID 0)
-- Dependencies: 261
-- Name: lkup_researcher_level_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.lkup_researcher_level_id_seq OWNED BY public.lkup_researcher_level.id;


--
-- TOC entry 315 (class 1259 OID 17296)
-- Name: lkup_resolution_type; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.lkup_resolution_type (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    description character varying(255),
    display_order integer
);


ALTER TABLE public.lkup_resolution_type OWNER TO radx_admin;

--
-- TOC entry 314 (class 1259 OID 17295)
-- Name: lkup_resolution_type_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.lkup_resolution_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lkup_resolution_type_id_seq OWNER TO radx_admin;

--
-- TOC entry 5487 (class 0 OID 0)
-- Dependencies: 314
-- Name: lkup_resolution_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.lkup_resolution_type_id_seq OWNED BY public.lkup_resolution_type.id;


--
-- TOC entry 260 (class 1259 OID 16743)
-- Name: lkup_role; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.lkup_role (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    description character varying(255)
);


ALTER TABLE public.lkup_role OWNER TO radx_admin;

--
-- TOC entry 259 (class 1259 OID 16742)
-- Name: lkup_role_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.lkup_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lkup_role_id_seq OWNER TO radx_admin;

--
-- TOC entry 5490 (class 0 OID 0)
-- Dependencies: 259
-- Name: lkup_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.lkup_role_id_seq OWNED BY public.lkup_role.id;


--
-- TOC entry 226 (class 1259 OID 16444)
-- Name: lkup_state; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.lkup_state (
    id integer NOT NULL,
    name character varying(256) NOT NULL,
    abbreviation character varying(2) NOT NULL,
    display_order integer NOT NULL
);


ALTER TABLE public.lkup_state OWNER TO radx_admin;

--
-- TOC entry 225 (class 1259 OID 16443)
-- Name: lkup_state_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.lkup_state_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lkup_state_id_seq OWNER TO radx_admin;

--
-- TOC entry 5492 (class 0 OID 0)
-- Dependencies: 225
-- Name: lkup_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.lkup_state_id_seq OWNED BY public.lkup_state.id;


--
-- TOC entry 228 (class 1259 OID 16466)
-- Name: lkup_status; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.lkup_status (
    id integer NOT NULL,
    name text NOT NULL,
    usage text,
    display_order integer,
    description text
);


ALTER TABLE public.lkup_status OWNER TO radx_admin;

--
-- TOC entry 227 (class 1259 OID 16465)
-- Name: lkup_status_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.lkup_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lkup_status_id_seq OWNER TO radx_admin;

--
-- TOC entry 5494 (class 0 OID 0)
-- Dependencies: 227
-- Name: lkup_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.lkup_status_id_seq OWNED BY public.lkup_status.id;


--
-- TOC entry 246 (class 1259 OID 16553)
-- Name: lkup_submission_step; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.lkup_submission_step (
    id integer NOT NULL,
    description character varying(255) NOT NULL
);


ALTER TABLE public.lkup_submission_step OWNER TO radx_admin;

--
-- TOC entry 245 (class 1259 OID 16552)
-- Name: lkup_submission_step_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.lkup_submission_step_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lkup_submission_step_id_seq OWNER TO radx_admin;

--
-- TOC entry 5496 (class 0 OID 0)
-- Dependencies: 245
-- Name: lkup_submission_step_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.lkup_submission_step_id_seq OWNED BY public.lkup_submission_step.id;


--
-- TOC entry 317 (class 1259 OID 17303)
-- Name: lkup_support_request_type; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.lkup_support_request_type (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    description character varying(255),
    display_order integer
);


ALTER TABLE public.lkup_support_request_type OWNER TO radx_admin;

--
-- TOC entry 316 (class 1259 OID 17302)
-- Name: lkup_support_request_type_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.lkup_support_request_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lkup_support_request_type_id_seq OWNER TO radx_admin;

--
-- TOC entry 5498 (class 0 OID 0)
-- Dependencies: 316
-- Name: lkup_support_request_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.lkup_support_request_type_id_seq OWNED BY public.lkup_support_request_type.id;


--
-- TOC entry 428 (class 1259 OID 58938)
-- Name: lkup_variable_category; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.lkup_variable_category (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    center_id integer,
    description text
);


ALTER TABLE public.lkup_variable_category OWNER TO radx_admin;

--
-- TOC entry 419 (class 1259 OID 46715)
-- Name: lkup_variable_datatype; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.lkup_variable_datatype (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text
);


ALTER TABLE public.lkup_variable_datatype OWNER TO radx_admin;

--
-- TOC entry 287 (class 1259 OID 16999)
-- Name: lkup_variable_type; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.lkup_variable_type (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text
);


ALTER TABLE public.lkup_variable_type OWNER TO radx_admin;

--
-- TOC entry 286 (class 1259 OID 16998)
-- Name: lkup_variable_type_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.lkup_variable_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lkup_variable_type_id_seq OWNER TO radx_admin;

--
-- TOC entry 5503 (class 0 OID 0)
-- Dependencies: 286
-- Name: lkup_variable_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.lkup_variable_type_id_seq OWNED BY public.lkup_variable_type.id;


--
-- TOC entry 277 (class 1259 OID 16875)
-- Name: lkup_workbench_interest; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.lkup_workbench_interest (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    description character varying(255)
);


ALTER TABLE public.lkup_workbench_interest OWNER TO radx_admin;

--
-- TOC entry 276 (class 1259 OID 16874)
-- Name: lkup_workbench_interest_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.lkup_workbench_interest_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lkup_workbench_interest_id_seq OWNER TO radx_admin;

--
-- TOC entry 5506 (class 0 OID 0)
-- Dependencies: 276
-- Name: lkup_workbench_interest_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.lkup_workbench_interest_id_seq OWNED BY public.lkup_workbench_interest.id;


--
-- TOC entry 311 (class 1259 OID 17268)
-- Name: metrics_report; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.metrics_report (
    id integer NOT NULL,
    report_date date NOT NULL,
    type_id integer NOT NULL,
    description text
);


ALTER TABLE public.metrics_report OWNER TO radx_admin;

--
-- TOC entry 310 (class 1259 OID 17267)
-- Name: metrics_report_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.metrics_report_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.metrics_report_id_seq OWNER TO radx_admin;

--
-- TOC entry 5509 (class 0 OID 0)
-- Dependencies: 310
-- Name: metrics_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.metrics_report_id_seq OWNED BY public.metrics_report.id;


--
-- TOC entry 305 (class 1259 OID 17226)
-- Name: news; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.news (
    id integer NOT NULL,
    slug character varying(50) NOT NULL,
    title character varying(1024) NOT NULL,
    description text NOT NULL,
    type_id integer NOT NULL,
    start_date date NOT NULL,
    expiration_date date,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by integer DEFAULT 9999 NOT NULL,
    modified_at timestamp without time zone,
    modified_by integer,
    archived boolean DEFAULT false NOT NULL
);


ALTER TABLE public.news OWNER TO radx_admin;

--
-- TOC entry 304 (class 1259 OID 17225)
-- Name: news_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.news_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.news_id_seq OWNER TO radx_admin;

--
-- TOC entry 5512 (class 0 OID 0)
-- Dependencies: 304
-- Name: news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.news_id_seq OWNED BY public.news.id;


--
-- TOC entry 307 (class 1259 OID 17242)
-- Name: news_link; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.news_link (
    id integer NOT NULL,
    news_id integer NOT NULL,
    link_label character varying(255),
    link_url text,
    display_order integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by integer DEFAULT 9999 NOT NULL,
    modified_at timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.news_link OWNER TO radx_admin;

--
-- TOC entry 306 (class 1259 OID 17241)
-- Name: news_link_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.news_link_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.news_link_id_seq OWNER TO radx_admin;

--
-- TOC entry 5515 (class 0 OID 0)
-- Dependencies: 306
-- Name: news_link_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.news_link_id_seq OWNED BY public.news_link.id;


--
-- TOC entry 400 (class 1259 OID 40548)
-- Name: newsletter; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.newsletter (
    id integer NOT NULL,
    title character varying(1024) NOT NULL,
    url text,
    release_date date NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by integer DEFAULT 9999 NOT NULL,
    modified_at timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.newsletter OWNER TO radx_admin;

--
-- TOC entry 399 (class 1259 OID 40547)
-- Name: newsletter_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.newsletter_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.newsletter_id_seq OWNER TO radx_admin;

--
-- TOC entry 5518 (class 0 OID 0)
-- Dependencies: 399
-- Name: newsletter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.newsletter_id_seq OWNED BY public.newsletter.id;


--
-- TOC entry 340 (class 1259 OID 22733)
-- Name: public_data; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.public_data (
    id integer NOT NULL,
    collection_id integer NOT NULL,
    file_name character varying(256) NOT NULL,
    file_size bigint,
    file_category character varying(256) NOT NULL,
    s3_file_id integer,
    description character varying(1024),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by integer DEFAULT 9999 NOT NULL,
    modified_at timestamp without time zone,
    modified_by integer,
    display_order integer
);


ALTER TABLE public.public_data OWNER TO radx_admin;

--
-- TOC entry 338 (class 1259 OID 22425)
-- Name: public_data_collection; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.public_data_collection (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(1024),
    display_order integer
);


ALTER TABLE public.public_data_collection OWNER TO radx_admin;

--
-- TOC entry 337 (class 1259 OID 22424)
-- Name: public_data_collection_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.public_data_collection_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.public_data_collection_id_seq OWNER TO radx_admin;

--
-- TOC entry 5522 (class 0 OID 0)
-- Dependencies: 337
-- Name: public_data_collection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.public_data_collection_id_seq OWNED BY public.public_data_collection.id;


--
-- TOC entry 339 (class 1259 OID 22732)
-- Name: public_data_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.public_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.public_data_id_seq OWNER TO radx_admin;

--
-- TOC entry 5524 (class 0 OID 0)
-- Dependencies: 339
-- Name: public_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.public_data_id_seq OWNED BY public.public_data.id;


--
-- TOC entry 268 (class 1259 OID 16802)
-- Name: ras_tracking; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.ras_tracking (
    id integer NOT NULL,
    authorization_code character varying(36),
    correlation_id character varying(39),
    session_id character varying(36),
    access_token character varying(1024),
    refresh_token character varying(1024),
    id_token character varying(1024),
    passport text,
    first_name text,
    last_name text,
    email text,
    institution_name text,
    expire_at timestamp without time zone,
    created_at timestamp without time zone,
    modified_at timestamp without time zone
);


ALTER TABLE public.ras_tracking OWNER TO radx_admin;

--
-- TOC entry 267 (class 1259 OID 16801)
-- Name: ras_tracking_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.ras_tracking_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ras_tracking_id_seq OWNER TO radx_admin;

--
-- TOC entry 5527 (class 0 OID 0)
-- Dependencies: 267
-- Name: ras_tracking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.ras_tracking_id_seq OWNED BY public.ras_tracking.id;


--
-- TOC entry 248 (class 1259 OID 16560)
-- Name: s3_file; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.s3_file (
    id integer NOT NULL,
    uuid character varying(36),
    s3_etag character varying(36),
    file_name character varying(255) NOT NULL,
    file_path character varying(255) NOT NULL,
    file_type_id integer,
    description text,
    checksum_hash character varying(1024),
    to_be_removed boolean DEFAULT false NOT NULL,
    uploaded_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    uploaded_by integer DEFAULT 9999 NOT NULL,
    updated_at timestamp without time zone,
    updated_by integer
);


ALTER TABLE public.s3_file OWNER TO radx_admin;

--
-- TOC entry 247 (class 1259 OID 16559)
-- Name: s3_file_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.s3_file_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.s3_file_id_seq OWNER TO radx_admin;

--
-- TOC entry 5530 (class 0 OID 0)
-- Dependencies: 247
-- Name: s3_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.s3_file_id_seq OWNED BY public.s3_file.id;


--
-- TOC entry 387 (class 1259 OID 29115)
-- Name: sas_data_file; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.sas_data_file (
    id integer NOT NULL,
    parent_data_file_id integer NOT NULL,
    source_file_name text,
    file_category_id integer,
    file_size bigint,
    status_id integer,
    s3_file_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by integer DEFAULT 9999 NOT NULL,
    modified_at timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.sas_data_file OWNER TO radx_admin;

--
-- TOC entry 386 (class 1259 OID 29114)
-- Name: sas_data_file_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.sas_data_file_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sas_data_file_id_seq OWNER TO radx_admin;

--
-- TOC entry 5533 (class 0 OID 0)
-- Dependencies: 386
-- Name: sas_data_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.sas_data_file_id_seq OWNED BY public.sas_data_file.id;


--
-- TOC entry 389 (class 1259 OID 29146)
-- Name: sas_file_download; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.sas_file_download (
    id integer NOT NULL,
    sas_file_id integer NOT NULL,
    download_by integer NOT NULL,
    download_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.sas_file_download OWNER TO radx_admin;

--
-- TOC entry 388 (class 1259 OID 29145)
-- Name: sas_file_download_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.sas_file_download_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sas_file_download_id_seq OWNER TO radx_admin;

--
-- TOC entry 5536 (class 0 OID 0)
-- Dependencies: 388
-- Name: sas_file_download_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.sas_file_download_id_seq OWNED BY public.sas_file_download.id;


--
-- TOC entry 402 (class 1259 OID 40559)
-- Name: search_log; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.search_log (
    id bigint NOT NULL,
    query text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.search_log OWNER TO radx_admin;

--
-- TOC entry 401 (class 1259 OID 40558)
-- Name: search_log_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.search_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_log_id_seq OWNER TO radx_admin;

--
-- TOC entry 5539 (class 0 OID 0)
-- Dependencies: 401
-- Name: search_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.search_log_id_seq OWNED BY public.search_log.id;


--
-- TOC entry 250 (class 1259 OID 16577)
-- Name: study; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.study (
    id integer NOT NULL,
    uuid character varying(36),
    private_key_url character varying(255),
    public_key_url character varying(255),
    file_name character varying(255),
    file_url character varying(255),
    center_id integer NOT NULL,
    center_admin_uuid character varying(36),
    status_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by integer DEFAULT 9999 NOT NULL,
    modified_at timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.study OWNER TO radx_admin;

--
-- TOC entry 321 (class 1259 OID 17359)
-- Name: study_harmonization_metrics; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.study_harmonization_metrics (
    id integer NOT NULL,
    report_id integer NOT NULL,
    study_phs character varying(10),
    center character varying(128),
    orig_transform_pairs_count integer,
    variable_count integer,
    harmonizable_tier_1_variable_count integer,
    harmonized_tier_1_variable_count integer,
    harmonizable_tier_1_variables text,
    harmonized_tier_1_variables text,
    variables text
);


ALTER TABLE public.study_harmonization_metrics OWNER TO radx_admin;

--
-- TOC entry 320 (class 1259 OID 17358)
-- Name: study_harmonization_metrics_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.study_harmonization_metrics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.study_harmonization_metrics_id_seq OWNER TO radx_admin;

--
-- TOC entry 5543 (class 0 OID 0)
-- Dependencies: 320
-- Name: study_harmonization_metrics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.study_harmonization_metrics_id_seq OWNED BY public.study_harmonization_metrics.id;


--
-- TOC entry 249 (class 1259 OID 16576)
-- Name: study_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.study_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.study_id_seq OWNER TO radx_admin;

--
-- TOC entry 5545 (class 0 OID 0)
-- Dependencies: 249
-- Name: study_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.study_id_seq OWNED BY public.study.id;


--
-- TOC entry 256 (class 1259 OID 16675)
-- Name: study_property_value; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.study_property_value (
    id integer NOT NULL,
    study_id integer NOT NULL,
    entity_property_id integer NOT NULL,
    property_value text,
    value_index integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by integer DEFAULT 9999,
    modified_at timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.study_property_value OWNER TO radx_admin;

--
-- TOC entry 255 (class 1259 OID 16674)
-- Name: study_property_value_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.study_property_value_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.study_property_value_id_seq OWNER TO radx_admin;

--
-- TOC entry 5548 (class 0 OID 0)
-- Dependencies: 255
-- Name: study_property_value_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.study_property_value_id_seq OWNED BY public.study_property_value.id;


--
-- TOC entry 319 (class 1259 OID 17310)
-- Name: support_request; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.support_request (
    id integer NOT NULL,
    requestor_user_id integer,
    full_name character varying(200),
    email character varying(255),
    request_title character varying(255),
    request_detail text NOT NULL,
    type_id integer NOT NULL,
    piority smallint,
    status_id integer NOT NULL,
    assignee_user_id integer,
    assignee_email character varying(255),
    assigned_at timestamp with time zone,
    resolved_at timestamp with time zone,
    resolution_type_id integer,
    tech_note text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by integer,
    update_at timestamp with time zone,
    updated_by integer,
    institution character varying(1024)
);


ALTER TABLE public.support_request OWNER TO radx_admin;

--
-- TOC entry 318 (class 1259 OID 17309)
-- Name: support_request_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.support_request_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.support_request_id_seq OWNER TO radx_admin;

--
-- TOC entry 5551 (class 0 OID 0)
-- Dependencies: 318
-- Name: support_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.support_request_id_seq OWNED BY public.support_request.id;


--
-- TOC entry 406 (class 1259 OID 41170)
-- Name: tier_1_variable; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.tier_1_variable (
    id integer NOT NULL,
    tier_1_variable_id character varying(256) NOT NULL,
    label text NOT NULL,
    description text,
    section character varying(256),
    cardinality character varying(50),
    datatype character varying(50),
    unit character varying(30),
    enumeration jsonb
);


ALTER TABLE public.tier_1_variable OWNER TO radx_admin;

--
-- TOC entry 405 (class 1259 OID 41169)
-- Name: tier_1_variable_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.tier_1_variable_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tier_1_variable_id_seq OWNER TO radx_admin;

--
-- TOC entry 5554 (class 0 OID 0)
-- Dependencies: 405
-- Name: tier_1_variable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.tier_1_variable_id_seq OWNED BY public.tier_1_variable.id;


--
-- TOC entry 437 (class 1259 OID 65307)
-- Name: tier_1_variable_mapping_json; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.tier_1_variable_mapping_json (
    id integer NOT NULL,
    tier_1_variable_id character varying(256) NOT NULL,
    center_id integer,
    program character varying(256) NOT NULL,
    data_elements jsonb
);


ALTER TABLE public.tier_1_variable_mapping_json OWNER TO radx_admin;

--
-- TOC entry 436 (class 1259 OID 65306)
-- Name: tier_1_variable_mapping_json_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.tier_1_variable_mapping_json_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tier_1_variable_mapping_json_id_seq OWNER TO radx_admin;

--
-- TOC entry 5557 (class 0 OID 0)
-- Dependencies: 436
-- Name: tier_1_variable_mapping_json_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.tier_1_variable_mapping_json_id_seq OWNED BY public.tier_1_variable_mapping_json.id;


--
-- TOC entry 404 (class 1259 OID 41152)
-- Name: tier_1_variable_terms; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.tier_1_variable_terms (
    id integer NOT NULL,
    tier_1_variable_id character varying(100) NOT NULL,
    identifier character varying(50),
    lookupurl character varying(256),
    label text,
    synonyms jsonb
);


ALTER TABLE public.tier_1_variable_terms OWNER TO radx_admin;

--
-- TOC entry 403 (class 1259 OID 41151)
-- Name: tier_1_variable_terms_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.tier_1_variable_terms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tier_1_variable_terms_id_seq OWNER TO radx_admin;

--
-- TOC entry 5560 (class 0 OID 0)
-- Dependencies: 403
-- Name: tier_1_variable_terms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.tier_1_variable_terms_id_seq OWNED BY public.tier_1_variable_terms.id;


--
-- TOC entry 412 (class 1259 OID 43523)
-- Name: user_file_upload; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.user_file_upload (
    id integer NOT NULL,
    study_id integer NOT NULL,
    file_name character varying(1024) NOT NULL,
    s3_file_id integer,
    upload_by integer NOT NULL,
    upload_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    download_by integer,
    download_at timestamp without time zone,
    delete_by integer,
    delete_at timestamp without time zone
);


ALTER TABLE public.user_file_upload OWNER TO radx_admin;

--
-- TOC entry 411 (class 1259 OID 43522)
-- Name: user_file_upload_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.user_file_upload_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_file_upload_id_seq OWNER TO radx_admin;

--
-- TOC entry 5563 (class 0 OID 0)
-- Dependencies: 411
-- Name: user_file_upload_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.user_file_upload_id_seq OWNED BY public.user_file_upload.id;


--
-- TOC entry 275 (class 1259 OID 16862)
-- Name: user_login; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.user_login (
    id integer NOT NULL,
    user_id integer NOT NULL,
    login_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.user_login OWNER TO radx_admin;

--
-- TOC entry 274 (class 1259 OID 16861)
-- Name: user_login_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.user_login_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_login_id_seq OWNER TO radx_admin;

--
-- TOC entry 5566 (class 0 OID 0)
-- Dependencies: 274
-- Name: user_login_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.user_login_id_seq OWNED BY public.user_login.id;


--
-- TOC entry 272 (class 1259 OID 16839)
-- Name: user_ras; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.user_ras (
    id integer NOT NULL,
    user_id integer NOT NULL,
    transaction_id character varying(255),
    phs character varying(255) NOT NULL,
    expiration_dt timestamp without time zone,
    passport text,
    create_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.user_ras OWNER TO radx_admin;

--
-- TOC entry 271 (class 1259 OID 16838)
-- Name: user_ras_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.user_ras_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_ras_id_seq OWNER TO radx_admin;

--
-- TOC entry 5569 (class 0 OID 0)
-- Dependencies: 271
-- Name: user_ras_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.user_ras_id_seq OWNED BY public.user_ras.id;


--
-- TOC entry 417 (class 1259 OID 46689)
-- Name: user_referrer; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.user_referrer (
    id integer NOT NULL,
    user_id integer NOT NULL,
    referrer_id integer,
    referrer_specify character varying(1024),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by integer,
    modified_at timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.user_referrer OWNER TO radx_admin;

--
-- TOC entry 416 (class 1259 OID 46688)
-- Name: user_referrer_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.user_referrer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_referrer_id_seq OWNER TO radx_admin;

--
-- TOC entry 5572 (class 0 OID 0)
-- Dependencies: 416
-- Name: user_referrer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.user_referrer_id_seq OWNED BY public.user_referrer.id;


--
-- TOC entry 266 (class 1259 OID 16784)
-- Name: user_role; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.user_role (
    id integer NOT NULL,
    user_id integer NOT NULL,
    role_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by integer,
    modified_at timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.user_role OWNER TO radx_admin;

--
-- TOC entry 265 (class 1259 OID 16783)
-- Name: user_role_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.user_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_role_id_seq OWNER TO radx_admin;

--
-- TOC entry 5575 (class 0 OID 0)
-- Dependencies: 265
-- Name: user_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.user_role_id_seq OWNED BY public.user_role.id;


--
-- TOC entry 426 (class 1259 OID 47335)
-- Name: user_workspace; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.user_workspace (
    id integer NOT NULL,
    user_id integer,
    userprofile_name character varying(256),
    workspace_name text,
    created_date date,
    modified_date date
);


ALTER TABLE public.user_workspace OWNER TO radx_admin;

--
-- TOC entry 425 (class 1259 OID 47334)
-- Name: user_workspace_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.user_workspace_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_workspace_id_seq OWNER TO radx_admin;

--
-- TOC entry 5578 (class 0 OID 0)
-- Dependencies: 425
-- Name: user_workspace_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.user_workspace_id_seq OWNED BY public.user_workspace.id;


--
-- TOC entry 264 (class 1259 OID 16758)
-- Name: users; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.users (
    id integer NOT NULL,
    uuid character varying(36),
    first_name character varying(50) NOT NULL,
    middle_initial character varying(1),
    last_name character varying(50) NOT NULL,
    email_address character varying(255) NOT NULL,
    orcid_id character varying(19),
    job_title character varying(256),
    institution_id integer,
    researcher_level_id integer,
    status_id integer NOT NULL,
    internal_user boolean DEFAULT false NOT NULL,
    accept_terms boolean,
    last_dua_date date,
    last_login_at timestamp without time zone,
    sftp_path character varying(128),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modified_at timestamp without time zone,
    center_id integer
);


ALTER TABLE public.users OWNER TO radx_admin;

--
-- TOC entry 263 (class 1259 OID 16757)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO radx_admin;

--
-- TOC entry 5581 (class 0 OID 0)
-- Dependencies: 263
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 435 (class 1259 OID 65288)
-- Name: variable_mapping; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.variable_mapping (
    id integer NOT NULL,
    variable_1_id integer NOT NULL,
    variable_2_id integer,
    variable_2_center_id integer,
    variable_2_program character varying(256),
    variable_2_name character varying(256) NOT NULL
);


ALTER TABLE public.variable_mapping OWNER TO radx_admin;

--
-- TOC entry 434 (class 1259 OID 65287)
-- Name: variable_mapping_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.variable_mapping_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.variable_mapping_id_seq OWNER TO radx_admin;

--
-- TOC entry 5584 (class 0 OID 0)
-- Dependencies: 434
-- Name: variable_mapping_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.variable_mapping_id_seq OWNED BY public.variable_mapping.id;


--
-- TOC entry 421 (class 1259 OID 46759)
-- Name: variable_permissible_values; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.variable_permissible_values (
    id integer NOT NULL,
    variable_id integer NOT NULL,
    value integer NOT NULL,
    label character varying(256) NOT NULL,
    map_to_id integer
);


ALTER TABLE public.variable_permissible_values OWNER TO radx_admin;

--
-- TOC entry 420 (class 1259 OID 46758)
-- Name: variable_permissible_values_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.variable_permissible_values_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.variable_permissible_values_id_seq OWNER TO radx_admin;

--
-- TOC entry 5587 (class 0 OID 0)
-- Dependencies: 420
-- Name: variable_permissible_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.variable_permissible_values_id_seq OWNED BY public.variable_permissible_values.id;


--
-- TOC entry 423 (class 1259 OID 46776)
-- Name: variable_property_value; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.variable_property_value (
    id integer NOT NULL,
    variable_id integer NOT NULL,
    entity_property_id integer NOT NULL,
    property_value text,
    value_index integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by integer DEFAULT 9999,
    modified_at timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.variable_property_value OWNER TO radx_admin;

--
-- TOC entry 422 (class 1259 OID 46775)
-- Name: variable_property_value_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.variable_property_value_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.variable_property_value_id_seq OWNER TO radx_admin;

--
-- TOC entry 5590 (class 0 OID 0)
-- Dependencies: 422
-- Name: variable_property_value_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.variable_property_value_id_seq OWNED BY public.variable_property_value.id;


--
-- TOC entry 430 (class 1259 OID 58952)
-- Name: variables; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.variables (
    id integer NOT NULL,
    category_id integer NOT NULL,
    center_id integer,
    study_id integer,
    name character varying(256) NOT NULL,
    label text,
    section text,
    datatype text
);


ALTER TABLE public.variables OWNER TO radx_admin;

--
-- TOC entry 429 (class 1259 OID 58951)
-- Name: variables_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.variables_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.variables_id_seq OWNER TO radx_admin;

--
-- TOC entry 5593 (class 0 OID 0)
-- Dependencies: 429
-- Name: variables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.variables_id_seq OWNED BY public.variables.id;


--
-- TOC entry 333 (class 1259 OID 22387)
-- Name: view_study; Type: VIEW; Schema: public; Owner: radx_user
--

CREATE VIEW public.view_study AS
 SELECT p.study_id,
    p.phs,
    p.title,
    p.description,
    p.center,
    p.studystartdate,
    p.studyenddate,
    p.is_multi_center,
    p.multi_center_sites,
    p.pi_name,
    p.estimated_participants,
    p.source,
    p.subject,
    p.types,
    p.institutes_supporting_study,
    p.data_general_types,
    p.acknowledgement_statement,
    p.data_species,
    p.disease_specific_group,
    p.disease_specific_related_conditions,
    p.general_research_group,
    p.grant_number,
    p.health_biomed_group,
    p."study_DOI",
    p.study_citation,
    p.has_data_files,
    p.actual_study_size,
    p.release_date,
    p.updated_at,
    p.study_version,
    p.study_population_focus,
    p.topics,
    p."study_website_URL",
    p."CT_URL",
    p."publication_URL",
    p."FOA_number",
    p."FOA_URL",
    p.estimated_participant_range,
    l.name AS status,
    s.created_at
   FROM ((public.study s
     JOIN public.lkup_status l ON ((s.status_id = l.id)))
     JOIN ( SELECT crosstab.study_id,
            crosstab.phs,
            crosstab.title,
            crosstab.description,
            crosstab.center,
            crosstab.studystartdate,
            crosstab.studyenddate,
            crosstab.is_multi_center,
            crosstab.multi_center_sites,
            crosstab.pi_name,
            crosstab.estimated_participants,
            crosstab.source,
            crosstab.subject,
            crosstab.types,
            crosstab.institutes_supporting_study,
            crosstab.data_general_types,
            crosstab.acknowledgement_statement,
            crosstab.data_species,
            crosstab.disease_specific_group,
            crosstab.disease_specific_related_conditions,
            crosstab.general_research_group,
            crosstab.grant_number,
            crosstab.health_biomed_group,
            crosstab."study_DOI",
            crosstab.study_citation,
            crosstab.has_data_files,
            crosstab.actual_study_size,
            crosstab.release_date,
            crosstab.updated_at,
            crosstab.study_version,
            crosstab.study_population_focus,
            crosstab.topics,
            crosstab."study_website_URL",
            crosstab."CT_URL",
            crosstab."publication_URL",
            crosstab."FOA_number",
            crosstab."FOA_URL",
            crosstab.estimated_participant_range
           FROM public.crosstab('select study_id, p.name, case p.cardinality when true then array_agg(v.property_value)::text else string_agg(v.property_value, '','') end as value
        from entity_property p left outer join study_property_value v  on v.entity_property_id = p.id and p.entity_type_id=1 and p.is_hidden = false
		group by study_id, p.id, p.name
        order by study_id, p.id'::text, '
	    values (''phs''),
		(''title''),
		(''description''),
		(''center''),
		(''studystartdate''),
		(''studyenddate''),
		(''is_multi_center''),
		(''multi_center_sites''),
		(''pi_name''),
		(''estimated_participants''),
		(''source''),
		(''subject''),
		(''types''),	
		(''institutes_supporting_study''),
		(''data_general_types''),
		(''acknowledgement_statement''),
		(''data_species''),
		(''disease_specific_group''),
		(''disease_specific_related_conditions''),
		(''general_research_group''),
		(''grant_number''),
		(''health_biomed_group''),
		(''study_DOI''),
		(''study_citation''),
		(''has_data_files''),
		(''actual_study_size''),
		(''release_date''),
		(''updated_at''),
		(''study_version''),
		(''study_population_focus''),
		(''topics''),
		(''study_website_URL''),
		(''CT_URL''),
		(''publication_URL''),
		(''FOA_number''),
		(''FOA_URL''),
		(''estimated_participant_range'')
	'::text) crosstab(study_id integer, phs text, title text, description text, center text, studystartdate text, studyenddate text, is_multi_center text, multi_center_sites text, pi_name text, estimated_participants text, source text, subject text, types text, institutes_supporting_study text, data_general_types text, acknowledgement_statement text, data_species text, disease_specific_group text, disease_specific_related_conditions text, general_research_group text, grant_number text, health_biomed_group text, "study_DOI" text, study_citation text, has_data_files text, actual_study_size text, release_date text, updated_at text, study_version text, study_population_focus text, topics text, "study_website_URL" text, "CT_URL" text, "publication_URL" text, "FOA_number" text, "FOA_URL" text, estimated_participant_range text)) p ON ((s.id = p.study_id)));


ALTER VIEW public.view_study OWNER TO radx_user;

--
-- TOC entry 385 (class 1259 OID 29109)
-- Name: view_current_data_file; Type: VIEW; Schema: public; Owner: radx_admin
--

CREATE VIEW public.view_current_data_file AS
 SELECT (row_number() OVER ())::integer AS id,
    t.study_id,
    t.phs,
    t.title AS study_name,
    s.id AS submission_id,
    k.name AS submission_status,
    d.id AS data_file_id,
    d.source_file_name,
    d.file_category_id,
    l.name AS file_type,
    l.category_group AS file_category_group,
    d.file_size,
    d.version_no,
    d.dictionary_file_id,
    d.metadata_file_id
   FROM (((((public.data_file d
     JOIN public.data_submission s ON ((d.submission_id = s.id)))
     JOIN public.view_study t ON ((s.study_id = t.study_id)))
     LEFT JOIN public.s3_file s3 ON ((d.s3_file_id = s3.id)))
     LEFT JOIN public.lkup_data_file_category l ON ((d.file_category_id = l.id)))
     LEFT JOIN public.lkup_status k ON ((s.status_id = k.id)))
  WHERE ((l.category_group = 'data'::text) AND d.is_current_version);


ALTER VIEW public.view_current_data_file OWNER TO radx_admin;

--
-- TOC entry 334 (class 1259 OID 22404)
-- Name: view_current_hub_content; Type: VIEW; Schema: public; Owner: radx_admin
--

CREATE VIEW public.view_current_hub_content AS
 SELECT id,
    center,
    study_phs,
    study_title,
    study_status,
    study_create_date,
    total_file_count,
    data_file_count,
    total_file_size,
    orig_data_file_count,
    standardized_data_file_count,
    metadata_file_count,
    dictionary_file_count,
    readme_file_count,
    other_file_count,
    (data_file_count > 0) AS study_has_data_file
   FROM ( SELECT s.study_id AS id,
            s.center,
            s.phs AS study_phs,
            s.title AS study_title,
            s.status AS study_status,
            s.created_at AS study_create_date,
            count(d.id) FILTER (WHERE (l.name IS NOT NULL)) AS total_file_count,
            count(d.id) FILTER (WHERE (l.category_group = 'data'::text)) AS data_file_count,
            (sum(d.file_size) FILTER (WHERE (l.name IS NOT NULL)) / (1048576)::numeric) AS total_file_size,
            count(d.id) FILTER (WHERE ((l.name)::text = ANY ((ARRAY['Tabular Data - Non-harmonized'::character varying, 'Image Data'::character varying, 'Sequence Data'::character varying])::text[]))) AS orig_data_file_count,
            count(d.id) FILTER (WHERE ((l.name)::text = 'Tabular Data - Harmonized'::text)) AS standardized_data_file_count,
            count(d.id) FILTER (WHERE (l.category_group = 'metadata'::text)) AS metadata_file_count,
            count(d.id) FILTER (WHERE (l.category_group = 'dictionary'::text)) AS dictionary_file_count,
            count(d.id) FILTER (WHERE ((l.name)::text = 'Read Me'::text)) AS readme_file_count,
            count(d.id) FILTER (WHERE (l.category_group = 'other'::text)) AS other_file_count
           FROM (((public.view_study s
             LEFT JOIN public.data_submission m ON ((m.study_id = s.study_id)))
             LEFT JOIN public.data_file d ON (((d.submission_id = m.id) AND d.is_current_version)))
             LEFT JOIN public.lkup_data_file_category l ON ((d.file_category_id = l.id)))
          WHERE (s.status = 'Approved'::text)
          GROUP BY s.study_id, s.center, s.phs, s.title, s.status, s.created_at, s.has_data_files
          ORDER BY s.study_id) a;


ALTER VIEW public.view_current_hub_content OWNER TO radx_admin;

--
-- TOC entry 336 (class 1259 OID 22419)
-- Name: view_current_hub_content_data; Type: VIEW; Schema: public; Owner: radx_admin
--

CREATE VIEW public.view_current_hub_content_data AS
 SELECT (row_number() OVER ())::integer AS id,
    CURRENT_DATE AS report_date,
    t.center,
    t.phs AS study_phs,
    t.title AS study_title,
    t.status AS study_status,
    (t.created_at)::date AS study_create_date,
    s.id AS submission_id,
    (s.created_at)::date AS submission_created_date,
    p.name AS submission_status,
    s3.file_name,
    k.name AS file_status,
    (d.created_at)::date AS file_create_date,
    d.file_size,
    NULL::text AS tier_1_cde,
    NULL::text AS non_tier_1_headers,
    l.name AS file_category,
    d.is_current_version,
    d.source_file_name,
    d.version_no
   FROM ((((((public.view_study t
     LEFT JOIN public.data_submission s ON ((s.study_id = t.study_id)))
     LEFT JOIN public.lkup_status p ON ((s.status_id = p.id)))
     LEFT JOIN public.data_file d ON ((d.submission_id = s.id)))
     LEFT JOIN public.s3_file s3 ON ((d.s3_file_id = s3.id)))
     LEFT JOIN public.lkup_data_file_category l ON ((d.file_category_id = l.id)))
     LEFT JOIN public.lkup_status k ON ((d.status_id = k.id)));


ALTER VIEW public.view_current_hub_content_data OWNER TO radx_admin;

--
-- TOC entry 432 (class 1259 OID 58982)
-- Name: view_data_file_variables; Type: VIEW; Schema: public; Owner: radx_admin
--

CREATE VIEW public.view_data_file_variables AS
 SELECT f.id AS file_id,
    v.variable,
    (l.id IS NOT NULL) AS is_tier_1,
    (l2.id IS NOT NULL) AS is_tier_2,
    s3.file_name,
    s.study_id,
    s.title AS study_name,
    s.phs AS study_phs,
    s.center AS study_program
   FROM (((((((public.data_file f
     JOIN public.s3_file s3 ON ((f.s3_file_id = s3.id)))
     JOIN public.data_file_variable v ON (((f.id = v.data_file_id) AND f.is_current_version)))
     JOIN public.data_submission m ON ((f.submission_id = m.id)))
     JOIN public.study y ON ((m.study_id = y.id)))
     JOIN public.view_study s ON ((m.study_id = s.study_id)))
     LEFT JOIN public.variables l ON ((((l.name)::text = (v.variable)::text) AND (l.category_id = 1))))
     LEFT JOIN public.variables l2 ON ((((l2.name)::text = (v.variable)::text) AND (l2.center_id = y.center_id))));


ALTER VIEW public.view_data_file_variables OWNER TO radx_admin;

--
-- TOC entry 410 (class 1259 OID 42312)
-- Name: view_study_all; Type: VIEW; Schema: public; Owner: radx_user
--

CREATE VIEW public.view_study_all AS
 SELECT p.study_id,
    p.phs,
    p.title,
    p.description,
    p."RAPIDS_link",
    p.center,
    p.studystartdate,
    p.studyenddate,
    p.is_multi_center,
    p.multi_center_sites,
    p.pi_name,
    p.pi_email,
    p.pi_assistant_name,
    p.pi_assistant_email,
    p.pi_institution,
    p.pi_sign_date,
    p.po_name,
    p.officer_sign_date,
    p.estimated_participants,
    p.public_access_data,
    p.source,
    p.subject,
    p.types,
    p.unrestricted_access,
    p.institutes_supporting_study,
    p.needs_institutional_certifications,
    p.data_general_types,
    p.data_genomic,
    p.data_genotype,
    p.data_sample_types,
    p.data_sequencing,
    p.user_agreement_accepted,
    p.data_policy_accepted,
    p.reject_comments,
    p.study_approved_date,
    p.acknowledgement_statement,
    p.aggregate_appropriate_for_general_use,
    p.awardee,
    p.consent_to_add_aggregate,
    p.consent_to_add_individual,
    p.controlled_access,
    p.controlled_access_data,
    p.data_access_points,
    p.data_analyses,
    p.data_array_data,
    p.data_from_repository_name,
    p.data_phenotype,
    p.data_sample_collection,
    p.data_sharing_info,
    p.data_species,
    p.data_storage_size,
    p.data_submission_date,
    p.data_submission_method,
    p.data_submission_timeline_details,
    p.data_target_delivery_date,
    p.data_target_release_date,
    p.disease_specific_group,
    p.disease_specific_related_conditions,
    p.eua,
    p.expected_data_format,
    p.general_research_group,
    p.geno_seq_platform_info,
    p.geno_seq_platform_url,
    p.geno_seq_platform_probes,
    p.geno_seq_platform_vendor,
    p.geno_seq_platform_description,
    p.geno_seq_platform_name_version,
    p.grant_number,
    p.has_era_account,
    p.has_ic,
    p.health_biomed_group,
    p.individual_appropriate_for_general_use,
    p.other_group_description,
    p.project_number,
    p."study_DOI",
    p.study_citation,
    p.has_data_files,
    p.actual_study_size,
    p.release_date,
    p.updated_at,
    p.study_version,
    p.study_population_focus,
    p.topics,
    p.types_other_specify,
    p.source_other_specify,
    p.data_general_types_other_specify,
    p.data_genomic_other_specify,
    p.data_phenotype_other_specify,
    p.data_sample_types_other_specify,
    p.data_genotype_other_specify,
    p.data_sequencing_other_specify,
    p.data_analyses_other_specify,
    p.data_array_data_other_specify,
    p.data_access_points_other,
    p.topics_other_specify,
    p."study_website_URL",
    p."CT_URL",
    p."publication_URL",
    p.access_type,
    p.data_access_type,
    p."FOA_number",
    p."FOA_URL",
    p.estimated_participant_range,
    p.data_use_limitations,
    l.name AS status,
    s.created_at
   FROM ((public.study s
     JOIN public.lkup_status l ON ((s.status_id = l.id)))
     JOIN ( SELECT crosstab.study_id,
            crosstab.phs,
            crosstab.title,
            crosstab.description,
            crosstab."RAPIDS_link",
            crosstab.center,
            crosstab.studystartdate,
            crosstab.studyenddate,
            crosstab.is_multi_center,
            crosstab.multi_center_sites,
            crosstab.pi_name,
            crosstab.pi_email,
            crosstab.pi_assistant_name,
            crosstab.pi_assistant_email,
            crosstab.pi_institution,
            crosstab.pi_sign_date,
            crosstab.po_name,
            crosstab.officer_sign_date,
            crosstab.estimated_participants,
            crosstab.public_access_data,
            crosstab.source,
            crosstab.subject,
            crosstab.types,
            crosstab.unrestricted_access,
            crosstab.institutes_supporting_study,
            crosstab.needs_institutional_certifications,
            crosstab.data_general_types,
            crosstab.data_genomic,
            crosstab.data_genotype,
            crosstab.data_sample_types,
            crosstab.data_sequencing,
            crosstab.user_agreement_accepted,
            crosstab.data_policy_accepted,
            crosstab.reject_comments,
            crosstab.study_approved_date,
            crosstab.acknowledgement_statement,
            crosstab.aggregate_appropriate_for_general_use,
            crosstab.awardee,
            crosstab.consent_to_add_aggregate,
            crosstab.consent_to_add_individual,
            crosstab.controlled_access,
            crosstab.controlled_access_data,
            crosstab.data_access_points,
            crosstab.data_analyses,
            crosstab.data_array_data,
            crosstab.data_from_repository_name,
            crosstab.data_phenotype,
            crosstab.data_sample_collection,
            crosstab.data_sharing_info,
            crosstab.data_species,
            crosstab.data_storage_size,
            crosstab.data_submission_date,
            crosstab.data_submission_method,
            crosstab.data_submission_timeline_details,
            crosstab.data_target_delivery_date,
            crosstab.data_target_release_date,
            crosstab.disease_specific_group,
            crosstab.disease_specific_related_conditions,
            crosstab.eua,
            crosstab.expected_data_format,
            crosstab.general_research_group,
            crosstab.geno_seq_platform_info,
            crosstab.geno_seq_platform_url,
            crosstab.geno_seq_platform_probes,
            crosstab.geno_seq_platform_vendor,
            crosstab.geno_seq_platform_description,
            crosstab.geno_seq_platform_name_version,
            crosstab.grant_number,
            crosstab.has_era_account,
            crosstab.has_ic,
            crosstab.health_biomed_group,
            crosstab.individual_appropriate_for_general_use,
            crosstab.other_group_description,
            crosstab.project_number,
            crosstab."study_DOI",
            crosstab.study_citation,
            crosstab.has_data_files,
            crosstab.actual_study_size,
            crosstab.release_date,
            crosstab.updated_at,
            crosstab.study_version,
            crosstab.study_population_focus,
            crosstab.topics,
            crosstab.types_other_specify,
            crosstab.source_other_specify,
            crosstab.data_general_types_other_specify,
            crosstab.data_genomic_other_specify,
            crosstab.data_phenotype_other_specify,
            crosstab.data_sample_types_other_specify,
            crosstab.data_genotype_other_specify,
            crosstab.data_sequencing_other_specify,
            crosstab.data_analyses_other_specify,
            crosstab.data_array_data_other_specify,
            crosstab.data_access_points_other,
            crosstab.topics_other_specify,
            crosstab."study_website_URL",
            crosstab."CT_URL",
            crosstab."publication_URL",
            crosstab.access_type,
            crosstab.data_access_type,
            crosstab."FOA_number",
            crosstab."FOA_URL",
            crosstab.estimated_participant_range,
            crosstab.data_use_limitations
           FROM public.crosstab('select study_id, p.name, case p.cardinality when true then array_agg(v.property_value)::text else string_agg(v.property_value, '','') end as value
        from entity_property p left outer join study_property_value v  on v.entity_property_id = p.id and p.entity_type_id=1
		group by study_id, p.id, p.name
        order by study_id, p.id'::text, '
	    values (''phs''),
		(''title''),
		(''description''),
		(''RAPIDS_link''),
		(''center''),
		(''studystartdate''),
		(''studyenddate''),
		(''is_multi_center''),
		(''multi_center_sites''),
		(''pi_name''),
		(''pi_email''),
		(''pi_assistant_name''),
		(''pi_assistant_email''),
		(''pi_institution''),
		(''pi_sign_date''),
		(''po_name''),
		(''officer_sign_date''),
		(''estimated_participants''),
		(''public_access_data''),
		(''source''),
		(''subject''),
		(''types''),	
		(''unrestricted_access''),
		(''institutes_supporting_study''),
		(''needs_institutional_certifications''),
		(''data_general_types''),
		(''data_genomic''),
		(''data_genotype''),
		(''data_sample_types''),
		(''data_sequencing''),
		(''user_agreement_accepted''),
		(''data_policy_accepted''),
		(''reject_comments''),
		(''study_approved_date''),
		(''acknowledgement_statement''),
		(''aggregate_appropriate_for_general_use''),
		(''awardee''),
		(''consent_to_add_aggregate''),
		(''consent_to_add_individual''),
		(''controlled_access''),
		(''controlled_access_data''),
		(''data_access_points''),
		(''data_analyses''),
		(''data_array_data''),
		(''data_from_repository_name''),
		(''data_phenotype''),
		(''data_sample_collection''),
		(''data_sharing_info''),
		(''data_species''),
		(''data_storage_size''),
		(''data_submission_date''),
		(''data_submission_method''),
		(''data_submission_timeline_details''),
		(''data_target_delivery_date''),
		(''data_target_release_date''),
		(''disease_specific_group''),
		(''disease_specific_related_conditions''),
		(''eua''),
		(''expected_data_format''),
		(''general_research_group''),
		(''geno_seq_platform_info''),
		(''geno_seq_platform_url''),
		(''geno_seq_platform_probes''),
		(''geno_seq_platform_vendor''),
		(''geno_seq_platform_description''),
		(''geno_seq_platform_name_version''),
		(''grant_number''),
		(''has_era_account''),
		(''has_ic''),
		(''health_biomed_group''),
		(''individual_appropriate_for_general_use''),
		(''other_group_description''),
		(''project_number''),
		(''study_DOI''),
		(''study_citation''),
		(''has_data_files''),
		(''actual_study_size''),
		(''release_date''),
		(''updated_at''),
		(''study_version''),
		(''study_population_focus''),
		(''topics''),
		(''types_other_specify''),
		(''source_other_specify''),
		(''data_general_types_other_specify''),
		(''data_genomic_other_specify''),
		(''data_phenotype_other_specify''),
		(''data_sample_types_other_specify''),
		(''data_genotype_other_specify''),
		(''data_sequencing_other_specify''),
		(''data_anlyses_other_specify''),
		(''data_array_data_other_specify''),
		(''data_access_points_other''),
		(''topics_other_specify''),
		(''study_website_URL''),
		(''CT_URL''),
		(''publication_URL''),
		(''access_type''),
		(''data_access_type''),
		(''FOA_number''),
		(''FOA_URL''),
		(''estimated_participant_range''),
		(''data_use_limitations'')
	'::text) crosstab(study_id integer, phs text, title text, description text, "RAPIDS_link" text, center text, studystartdate text, studyenddate text, is_multi_center text, multi_center_sites text, pi_name text, pi_email text, pi_assistant_name text, pi_assistant_email text, pi_institution text, pi_sign_date text, po_name text, officer_sign_date text, estimated_participants text, public_access_data text, source text, subject text, types text, unrestricted_access text, institutes_supporting_study text, needs_institutional_certifications text, data_general_types text, data_genomic text, data_genotype text, data_sample_types text, data_sequencing text, user_agreement_accepted text, data_policy_accepted text, reject_comments text, study_approved_date text, acknowledgement_statement text, aggregate_appropriate_for_general_use text, awardee text, consent_to_add_aggregate text, consent_to_add_individual text, controlled_access text, controlled_access_data text, data_access_points text, data_analyses text, data_array_data text, data_from_repository_name text, data_phenotype text, data_sample_collection text, data_sharing_info text, data_species text, data_storage_size text, data_submission_date text, data_submission_method text, data_submission_timeline_details text, data_target_delivery_date text, data_target_release_date text, disease_specific_group text, disease_specific_related_conditions text, eua text, expected_data_format text, general_research_group text, geno_seq_platform_info text, geno_seq_platform_url text, geno_seq_platform_probes text, geno_seq_platform_vendor text, geno_seq_platform_description text, geno_seq_platform_name_version text, grant_number text, has_era_account text, has_ic text, health_biomed_group text, individual_appropriate_for_general_use text, other_group_description text, project_number text, "study_DOI" text, study_citation text, has_data_files text, actual_study_size text, release_date text, updated_at text, study_version text, study_population_focus text, topics text, types_other_specify text, source_other_specify text, data_general_types_other_specify text, data_genomic_other_specify text, data_phenotype_other_specify text, data_sample_types_other_specify text, data_genotype_other_specify text, data_sequencing_other_specify text, data_analyses_other_specify text, data_array_data_other_specify text, data_access_points_other text, topics_other_specify text, "study_website_URL" text, "CT_URL" text, "publication_URL" text, access_type text, data_access_type text, "FOA_number" text, "FOA_URL" text, estimated_participant_range text, data_use_limitations text)) p ON ((s.id = p.study_id)));


ALTER VIEW public.view_study_all OWNER TO radx_user;

--
-- TOC entry 431 (class 1259 OID 58977)
-- Name: view_study_variables; Type: VIEW; Schema: public; Owner: radx_admin
--

CREATE VIEW public.view_study_variables AS
 SELECT DISTINCT y.id AS study_id,
    u.property_value AS study_phs,
    v.id AS variable_id,
    fv.variable,
    ((v.id IS NOT NULL) AND (v.category_id = 1)) AS is_tier1_variable,
    v.label AS variable_label,
    y.center_id,
    c.name AS variable_category,
    v.section,
    v.datatype
   FROM ((((((public.data_file f
     JOIN public.data_file_variable fv ON (((f.id = fv.data_file_id) AND f.is_current_version)))
     JOIN public.data_submission m ON ((f.submission_id = m.id)))
     JOIN public.study y ON ((m.study_id = y.id)))
     JOIN public.study_property_value u ON (((y.id = u.study_id) AND (u.entity_property_id = ( SELECT entity_property.id
           FROM public.entity_property
          WHERE ((entity_property.name)::text = 'phs'::text))))))
     LEFT JOIN public.variables v ON ((((fv.variable)::text = (v.name)::text) AND ((v.center_id IS NULL) OR (y.center_id = v.center_id)))))
     LEFT JOIN public.lkup_variable_category c ON ((v.category_id = c.id)));


ALTER VIEW public.view_study_variables OWNER TO radx_admin;

--
-- TOC entry 433 (class 1259 OID 65280)
-- Name: view_study_for_es; Type: VIEW; Schema: public; Owner: radx_admin
--

CREATE VIEW public.view_study_for_es AS
 SELECT s.study_id,
    s.phs,
    s.title,
    s.description,
    s.status,
    s.center,
    s.studystartdate,
    s.studyenddate,
    s.is_multi_center,
    s.multi_center_sites,
    s.pi_name,
    s.estimated_participants,
    s.estimated_participant_range,
    array_to_string((s.study_population_focus)::text[], '; '::text) AS study_population_focus,
    (s.study_population_focus)::text[] AS study_population_focus_array,
    array_to_string((s.topics)::text[], '; '::text) AS topics,
    (s.topics)::text[] AS topics_array,
    array_to_string((s.source)::text[], '; '::text) AS source,
    (s.source)::text[] AS source_array,
    array_to_string((s.subject)::text[], '; '::text) AS subject,
    (s.subject)::text[] AS subject_array,
    array_to_string((s.types)::text[], '; '::text) AS types,
    (s.types)::text[] AS types_array,
    array_to_string((s.institutes_supporting_study)::text[], '; '::text) AS institutes_supporting_study,
    (s.institutes_supporting_study)::text[] AS institutes_supporting_study_array,
    array_to_string((s.data_general_types)::text[], '; '::text) AS data_general_types,
    (s.data_general_types)::text[] AS data_general_types_array,
    array_to_string((v1.study_variables)::text[], '; '::text) AS study_variables,
    (v1.study_variables)::text[] AS study_variables_array,
    v2.study_variable_count,
    s.acknowledgement_statement,
    array_to_string((s.data_species)::text[], '; '::text) AS data_species,
    array_to_string((s.disease_specific_group)::text[], '; '::text) AS disease_specific_group,
    s.disease_specific_related_conditions,
    s.general_research_group,
    s.grant_number,
    s.health_biomed_group,
    s."study_DOI",
    s.study_citation,
    s.has_data_files,
    s.actual_study_size,
    s.release_date,
    s.updated_at,
    s.study_version,
    s."study_website_URL",
    s."CT_URL",
    s."publication_URL",
    s."FOA_number",
    s."FOA_URL",
    s.created_at
   FROM ((public.view_study s
     LEFT JOIN ( SELECT view_study_variables.study_id,
            (array_agg(view_study_variables.variable))::text AS study_variables
           FROM public.view_study_variables
          WHERE view_study_variables.is_tier1_variable
          GROUP BY view_study_variables.study_id) v1 ON ((s.study_id = v1.study_id)))
     LEFT JOIN ( SELECT view_study_variables.study_id,
            count(*) AS study_variable_count
           FROM public.view_study_variables
          GROUP BY view_study_variables.study_id) v2 ON ((s.study_id = v2.study_id)));


ALTER VIEW public.view_study_for_es OWNER TO radx_admin;

--
-- TOC entry 326 (class 1259 OID 22038)
-- Name: view_study_mta_import; Type: VIEW; Schema: public; Owner: radx_user
--

CREATE VIEW public.view_study_mta_import AS
 SELECT p.study_id,
    p.title,
    p.description,
    p.is_multi_center,
    p.multi_center_sites,
    p.pi_name,
    p.pi_email,
    p.pi_assistant_name,
    p.pi_assistant_email,
    p.pi_institution,
    p.pi_sign_date,
    p.po_name,
    p.officer_sign_date,
    p.estimated_participants,
    p.types,
    p.institutes_supporting_study,
    p.needs_institutional_certifications,
    p.data_general_types,
    p.data_genomic,
    p.data_genotype,
    p.data_sample_types,
    p.data_sequencing,
    p.acknowledgement_statement,
    p.aggregate_appropriate_for_general_use,
    p.consent_to_add_aggregate,
    p.consent_to_add_individual,
    p.data_access_points,
    p.data_analyses,
    p.data_array_data,
    p.data_from_repository_name,
    p.data_phenotype,
    p.data_sample_collection,
    p.data_sharing_info,
    p.data_species,
    p.data_storage_size,
    p.data_submission_date,
    p.data_submission_method,
    p.data_submission_timeline_details,
    p.data_target_delivery_date,
    p.data_target_release_date,
    p.disease_specific_group,
    p.disease_specific_related_conditions,
    p.general_research_group,
    p.geno_seq_platform_info,
    p.geno_seq_platform_url,
    p.geno_seq_platform_probes,
    p.geno_seq_platform_vendor,
    p.geno_seq_platform_description,
    p.geno_seq_platform_name_version,
    p.grant_number,
    p.has_era_account,
    p.has_ic,
    p.health_biomed_group,
    p.individual_appropriate_for_general_use,
    p.other_group_description,
    p.types_other_specify,
    p.data_general_types_other_specify,
    p.data_genomic_other_specify,
    p.data_phenotype_other_specify,
    p.data_sample_types_other_specify,
    p.data_genotype_other_specify,
    p.data_sequencing_other_specify,
    p.data_analyses_other_specify,
    p.data_array_data_other_specify,
    p.data_access_points_other,
    p.access_type,
    p.data_access_type,
    s.created_at,
    s.modified_at
   FROM (public.study s
     JOIN ( SELECT crosstab.study_id,
            crosstab.title,
            crosstab.description,
            crosstab.is_multi_center,
            crosstab.multi_center_sites,
            crosstab.pi_name,
            crosstab.pi_email,
            crosstab.pi_assistant_name,
            crosstab.pi_assistant_email,
            crosstab.pi_institution,
            crosstab.pi_sign_date,
            crosstab.po_name,
            crosstab.officer_sign_date,
            crosstab.estimated_participants,
            crosstab.types,
            crosstab.institutes_supporting_study,
            crosstab.needs_institutional_certifications,
            crosstab.data_general_types,
            crosstab.data_genomic,
            crosstab.data_genotype,
            crosstab.data_sample_types,
            crosstab.data_sequencing,
            crosstab.acknowledgement_statement,
            crosstab.aggregate_appropriate_for_general_use,
            crosstab.consent_to_add_aggregate,
            crosstab.consent_to_add_individual,
            crosstab.data_access_points,
            crosstab.data_analyses,
            crosstab.data_array_data,
            crosstab.data_from_repository_name,
            crosstab.data_phenotype,
            crosstab.data_sample_collection,
            crosstab.data_sharing_info,
            crosstab.data_species,
            crosstab.data_storage_size,
            crosstab.data_submission_date,
            crosstab.data_submission_method,
            crosstab.data_submission_timeline_details,
            crosstab.data_target_delivery_date,
            crosstab.data_target_release_date,
            crosstab.disease_specific_group,
            crosstab.disease_specific_related_conditions,
            crosstab.general_research_group,
            crosstab.geno_seq_platform_info,
            crosstab.geno_seq_platform_url,
            crosstab.geno_seq_platform_probes,
            crosstab.geno_seq_platform_vendor,
            crosstab.geno_seq_platform_description,
            crosstab.geno_seq_platform_name_version,
            crosstab.grant_number,
            crosstab.has_era_account,
            crosstab.has_ic,
            crosstab.health_biomed_group,
            crosstab.individual_appropriate_for_general_use,
            crosstab.other_group_description,
            crosstab.types_other_specify,
            crosstab.data_general_types_other_specify,
            crosstab.data_genomic_other_specify,
            crosstab.data_phenotype_other_specify,
            crosstab.data_sample_types_other_specify,
            crosstab.data_genotype_other_specify,
            crosstab.data_sequencing_other_specify,
            crosstab.data_analyses_other_specify,
            crosstab.data_array_data_other_specify,
            crosstab.data_access_points_other,
            crosstab.access_type,
            crosstab.data_access_type
           FROM public.crosstab('select study_id, p.name, case p.cardinality when true then array_agg(v.property_value)::text else string_agg(v.property_value, '','') end as value
        from entity_property p left outer join study_property_value v  on v.entity_property_id = p.id and p.entity_type_id=1 and p.property_source_id=1
		group by study_id, p.id, p.name
        order by study_id, p.id'::text, '
	    values 
		(''title''),
		(''description''),
		(''is_multi_center''),
		(''multi_center_sites''),
		(''pi_name''),
		(''pi_email''),
		(''pi_assistant_name''),
		(''pi_assistant_email''),
		(''pi_institution''),
		(''pi_sign_date''),
		(''po_name''),
		(''officer_sign_date''),
		(''estimated_participants''),
		(''types''),
		(''institutes_supporting_study''),
		(''needs_institutional_certifications''),
		(''data_general_types''),
		(''data_genomic''),
		(''data_genotype''),
		(''data_sample_types''),
		(''data_sequencing''),
		(''acknowledgement_statement''),
		(''aggregate_appropriate_for_general_use''),
		(''consent_to_add_aggregate''),
		(''consent_to_add_individual''),
		(''data_access_points''),
		(''data_analyses''),
		(''data_array_data''),
		(''data_from_repository_name''),
		(''data_phenotype''),
		(''data_sample_collection''),
		(''data_sharing_info''),
		(''data_species''),
		(''data_storage_size''),
		(''data_submission_date''),
		(''data_submission_method''),
		(''data_submission_timeline_details''),
		(''data_target_delivery_date''),
		(''data_target_release_date''),
		(''disease_specific_group''),
		(''disease_specific_related_conditions''),
		(''general_research_group''),
		(''geno_seq_platform_info''),
		(''geno_seq_platform_url''),
		(''geno_seq_platform_probes''),
		(''geno_seq_platform_vendor''),
		(''geno_seq_platform_description''),
		(''geno_seq_platform_name_version''),
		(''grant_number''),
		(''has_era_account''),
		(''has_ic''),
		(''health_biomed_group''),
		(''individual_appropriate_for_general_use''),
		(''other_group_description''),
		(''types_other_specify''),
		(''data_general_types_other_specify''),
		(''data_genomic_other_specify''),
		(''data_phenotype_other_specify''),
		(''data_sample_types_other_specify''),
		(''data_genotype_other_specify''),
		(''data_sequencing_other_specify''),
		(''data_analyses_other_specify''),
		(''data_array_data_other_specify''),
		(''data_access_points_other''),
		(''access_type''),
		(''data_access_type'')
	'::text) crosstab(study_id integer, title text, description text, is_multi_center text, multi_center_sites text, pi_name text, pi_email text, pi_assistant_name text, pi_assistant_email text, pi_institution text, pi_sign_date text, po_name text, officer_sign_date text, estimated_participants text, types text, institutes_supporting_study text, needs_institutional_certifications text, data_general_types text, data_genomic text, data_genotype text, data_sample_types text, data_sequencing text, acknowledgement_statement text, aggregate_appropriate_for_general_use text, consent_to_add_aggregate text, consent_to_add_individual text, data_access_points text, data_analyses text, data_array_data text, data_from_repository_name text, data_phenotype text, data_sample_collection text, data_sharing_info text, data_species text, data_storage_size text, data_submission_date text, data_submission_method text, data_submission_timeline_details text, data_target_delivery_date text, data_target_release_date text, disease_specific_group text, disease_specific_related_conditions text, general_research_group text, geno_seq_platform_info text, geno_seq_platform_url text, geno_seq_platform_probes text, geno_seq_platform_vendor text, geno_seq_platform_description text, geno_seq_platform_name_version text, grant_number text, has_era_account text, has_ic text, health_biomed_group text, individual_appropriate_for_general_use text, other_group_description text, types_other_specify text, data_general_types_other_specify text, data_genomic_other_specify text, data_phenotype_other_specify text, data_sample_types_other_specify text, data_genotype_other_specify text, data_sequencing_other_specify text, data_analyses_other_specify text, data_array_data_other_specify text, data_access_points_other text, access_type text, data_access_type text)) p ON ((s.id = p.study_id)));


ALTER VIEW public.view_study_mta_import OWNER TO radx_user;

--
-- TOC entry 325 (class 1259 OID 22023)
-- Name: view_study_property_value_display; Type: VIEW; Schema: public; Owner: radx_admin
--

CREATE VIEW public.view_study_property_value_display AS
 SELECT v.id AS study_property_value_id,
    v.study_id,
    v.entity_property_id,
    v.property_value,
    p.name AS entity_property_name,
    p.property_type_id,
    t.name AS entity_property_type,
    st.id AS entity_property_display_setting_id,
    st.page,
    st.display_section,
    st.display_label,
    st.display_order,
    st.is_facet,
    st.facet_order,
    st.is_sortable
   FROM (((public.study_property_value v
     JOIN public.entity_property p ON ((v.entity_property_id = p.id)))
     JOIN public.entity_property_display_setting st ON ((st.entity_property_id = p.id)))
     LEFT JOIN public.lkup_property_type t ON ((p.property_type_id = t.id)));


ALTER VIEW public.view_study_property_value_display OWNER TO radx_admin;

--
-- TOC entry 335 (class 1259 OID 22409)
-- Name: view_submission_activity; Type: VIEW; Schema: public; Owner: radx_admin
--

CREATE VIEW public.view_submission_activity AS
 SELECT (row_number() OVER ())::integer AS id,
    s.study_id,
    s.center,
    s.phs AS study_phs,
    s.title AS study_name,
    s.created_at AS study_initiated_date,
    (s.release_date)::date AS study_published_date,
    d.id AS data_submission_id,
    d.date_approved AS files_rejected_date,
    d.file_rejected_count,
    f.id AS data_file_id,
    f.created_at AS data_file_created_date,
    f.approval_date AS data_file_approval_date,
    f.reject_date AS data_file_reject_date
   FROM ((public.view_study s
     LEFT JOIN public.data_submission d ON ((d.study_id = s.study_id)))
     LEFT JOIN public.data_file f ON ((f.submission_id = d.id)))
  WHERE (s.center IS NOT NULL);


ALTER VIEW public.view_submission_activity OWNER TO radx_admin;

--
-- TOC entry 427 (class 1259 OID 54536)
-- Name: view_user_population; Type: VIEW; Schema: public; Owner: radx_admin
--

CREATE VIEW public.view_user_population AS
 SELECT u.id AS user_id,
    ((((u.first_name)::text || COALESCE((' '::text || upper((u.middle_initial)::text)), ''::text)) || ' '::text) || (u.last_name)::text) AS name,
    u.email_address,
    u.orcid_id,
    i.name AS institution_name,
    u.job_title,
    s.name AS user_status,
    v.name AS user_researcher_level,
    u.created_at,
    p.name AS user_institution_type,
    t.abbreviation AS user_state,
    c.name AS user_country,
    i.province_region,
    i.is_for_profit,
    u.internal_user,
    l.last_login_at,
    l.total_login,
    (d.last_download_at IS NOT NULL) AS has_downloaded_data,
    d.last_download_at,
    d.total_download,
    (wr.user_id IS NOT NULL) AS has_workbench,
    wr.workspace_count
   FROM (((((((((public.users u
     JOIN public.lkup_status s ON ((u.status_id = s.id)))
     JOIN public.institution i ON ((u.institution_id = i.id)))
     LEFT JOIN public.lkup_institution_type p ON ((i.institution_type_id = p.id)))
     LEFT JOIN public.lkup_state t ON ((i.state_id = t.id)))
     LEFT JOIN public.lkup_country c ON ((i.country_id = c.id)))
     LEFT JOIN public.lkup_researcher_level v ON ((u.researcher_level_id = v.id)))
     LEFT JOIN ( SELECT user_login.user_id,
            max(user_login.login_at) AS last_login_at,
            count(user_login.id) AS total_login
           FROM public.user_login
          GROUP BY user_login.user_id) l ON ((u.id = l.user_id)))
     LEFT JOIN ( SELECT data_file_download.download_by AS user_id,
            max(data_file_download.download_at) AS last_download_at,
            count(data_file_download.id) AS total_download
           FROM public.data_file_download
          GROUP BY data_file_download.download_by) d ON ((u.id = d.user_id)))
     LEFT JOIN ( SELECT t_1.user_id,
            count(w.id) AS workspace_count
           FROM (public.jwt_token t_1
             LEFT JOIN public.user_workspace w ON (((w.userprofile_name)::text = (t_1.sagemaker_user_profile_name)::text)))
          GROUP BY t_1.user_id) wr ON ((u.id = wr.user_id)))
  ORDER BY u.id;


ALTER VIEW public.view_user_population OWNER TO radx_admin;

--
-- TOC entry 396 (class 1259 OID 29939)
-- Name: view_user_role; Type: VIEW; Schema: public; Owner: radx_admin
--

CREATE VIEW public.view_user_role AS
 SELECT r.name,
    u.first_name,
    u.last_name,
    u.email_address,
    c.name AS center,
    u.internal_user
   FROM (((public.users u
     JOIN public.user_role ur ON ((ur.user_id = u.id)))
     JOIN public.lkup_role r ON ((ur.role_id = r.id)))
     LEFT JOIN public.lkup_center c ON ((u.center_id = c.id)))
  ORDER BY r.id;


ALTER VIEW public.view_user_role OWNER TO radx_admin;

--
-- TOC entry 424 (class 1259 OID 46796)
-- Name: view_variable_overview_display; Type: VIEW; Schema: public; Owner: radx_admin
--

CREATE VIEW public.view_variable_overview_display AS
 SELECT row_number() OVER () AS variable_property_value_id,
    v.variable_id,
    v.entity_property_id,
    v.property_value,
    p.name AS entity_property_name,
    p.property_type_id,
    t.name AS entity_property_type,
    st.id AS entity_property_display_setting_id,
    st.page,
    st.display_section,
    st.display_label,
    st.display_order,
    st.is_facet,
    st.facet_order,
    st.is_sortable
   FROM (((public.variable_property_value v
     JOIN public.entity_property p ON ((v.entity_property_id = p.id)))
     JOIN public.entity_property_display_setting st ON (((st.entity_property_id = p.id) AND (st.page = 'variable_overview'::text))))
     LEFT JOIN public.lkup_property_type t ON ((p.property_type_id = t.id)));


ALTER VIEW public.view_variable_overview_display OWNER TO radx_admin;

--
-- TOC entry 332 (class 1259 OID 22337)
-- Name: weekly_hub_content_data; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.weekly_hub_content_data (
    id integer NOT NULL,
    report_date date NOT NULL,
    center text,
    study_phs text,
    study_title text,
    study_status text,
    study_create_date timestamp without time zone,
    file_name text,
    file_status text,
    file_create_date timestamp without time zone,
    file_size numeric,
    tier_1_cde integer,
    non_tier_1_headers integer,
    file_category text,
    is_current_version boolean,
    source_file_name text,
    version_no integer
);


ALTER TABLE public.weekly_hub_content_data OWNER TO radx_admin;

--
-- TOC entry 331 (class 1259 OID 22336)
-- Name: weekly_hub_content_data_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.weekly_hub_content_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.weekly_hub_content_data_id_seq OWNER TO radx_admin;

--
-- TOC entry 5607 (class 0 OID 0)
-- Dependencies: 331
-- Name: weekly_hub_content_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.weekly_hub_content_data_id_seq OWNED BY public.weekly_hub_content_data.id;


--
-- TOC entry 279 (class 1259 OID 16883)
-- Name: workbench_request; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.workbench_request (
    id integer NOT NULL,
    requestor_user_id integer NOT NULL,
    analytics_software_request text,
    center_affiliated boolean,
    research_use_statement text,
    reason_of_request text,
    status_id integer,
    reject_reason text,
    response_date timestamp without time zone,
    license_effective_date date,
    license_expiration_date date,
    signature character varying(256),
    created_at timestamp without time zone,
    created_by integer,
    modified_at timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.workbench_request OWNER TO radx_admin;

--
-- TOC entry 278 (class 1259 OID 16882)
-- Name: workbench_request_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.workbench_request_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.workbench_request_id_seq OWNER TO radx_admin;

--
-- TOC entry 5610 (class 0 OID 0)
-- Dependencies: 278
-- Name: workbench_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.workbench_request_id_seq OWNED BY public.workbench_request.id;


--
-- TOC entry 281 (class 1259 OID 16902)
-- Name: workbench_request_interest; Type: TABLE; Schema: public; Owner: radx_admin
--

CREATE TABLE public.workbench_request_interest (
    id integer NOT NULL,
    workbench_request_id integer NOT NULL,
    workbench_interest_id integer NOT NULL,
    other_specify text,
    created_at timestamp without time zone,
    created_by integer,
    modified_at timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.workbench_request_interest OWNER TO radx_admin;

--
-- TOC entry 280 (class 1259 OID 16901)
-- Name: workbench_request_interest_id_seq; Type: SEQUENCE; Schema: public; Owner: radx_admin
--

CREATE SEQUENCE public.workbench_request_interest_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.workbench_request_interest_id_seq OWNER TO radx_admin;

--
-- TOC entry 5613 (class 0 OID 0)
-- Dependencies: 280
-- Name: workbench_request_interest_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: radx_admin
--

ALTER SEQUENCE public.workbench_request_interest_id_seq OWNED BY public.workbench_request_interest.id;


--
-- TOC entry 379 (class 1259 OID 28417)
-- Name: data_file_history; Type: TABLE; Schema: radx_history; Owner: radx_admin
--

CREATE TABLE radx_history.data_file_history (
    id integer NOT NULL,
    column_name character varying(256) NOT NULL,
    old_value text,
    new_value text,
    operation character(1) NOT NULL,
    operated_at timestamp without time zone NOT NULL,
    operated_by integer,
    CONSTRAINT operation_check CHECK (((operation)::text = ANY (ARRAY[('D'::character varying)::text, ('U'::character varying)::text])))
);


ALTER TABLE radx_history.data_file_history OWNER TO radx_admin;

--
-- TOC entry 382 (class 1259 OID 29081)
-- Name: data_submission_history; Type: TABLE; Schema: radx_history; Owner: radx_admin
--

CREATE TABLE radx_history.data_submission_history (
    id integer NOT NULL,
    column_name character varying(256) NOT NULL,
    old_value text,
    new_value text,
    operation character(1) NOT NULL,
    operated_at timestamp without time zone NOT NULL,
    operated_by integer,
    CONSTRAINT operation_check CHECK (((operation)::text = ANY (ARRAY[('D'::character varying)::text, ('U'::character varying)::text])))
);


ALTER TABLE radx_history.data_submission_history OWNER TO radx_admin;

--
-- TOC entry 390 (class 1259 OID 29201)
-- Name: institution_history; Type: TABLE; Schema: radx_history; Owner: radx_admin
--

CREATE TABLE radx_history.institution_history (
    id integer NOT NULL,
    column_name character varying(256) NOT NULL,
    old_value text,
    new_value text,
    operation character(1) NOT NULL,
    operated_at timestamp without time zone NOT NULL,
    operated_by integer,
    CONSTRAINT operation_check CHECK (((operation)::text = ANY (ARRAY[('D'::character varying)::text, ('U'::character varying)::text])))
);


ALTER TABLE radx_history.institution_history OWNER TO radx_admin;

--
-- TOC entry 273 (class 1259 OID 16854)
-- Name: ras_tracking_history; Type: TABLE; Schema: radx_history; Owner: radx_admin
--

CREATE TABLE radx_history.ras_tracking_history (
    id bigint NOT NULL,
    authorization_code character varying(36),
    correlation_id character varying(39),
    session_id character varying(36),
    access_token character varying(1024),
    refresh_token character varying(1024),
    id_token character varying(1024),
    passport text,
    first_name text,
    last_name text,
    email text,
    institution_name text,
    expire_at timestamp without time zone,
    created_at timestamp without time zone,
    modified_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE radx_history.ras_tracking_history OWNER TO radx_admin;

--
-- TOC entry 380 (class 1259 OID 29013)
-- Name: s3_file_history; Type: TABLE; Schema: radx_history; Owner: radx_admin
--

CREATE TABLE radx_history.s3_file_history (
    id integer NOT NULL,
    column_name character varying(256) NOT NULL,
    old_value text,
    new_value text,
    operation character(1) NOT NULL,
    operated_at timestamp without time zone NOT NULL,
    operated_by integer,
    CONSTRAINT operation_check CHECK (((operation)::text = ANY (ARRAY[('D'::character varying)::text, ('U'::character varying)::text])))
);


ALTER TABLE radx_history.s3_file_history OWNER TO radx_admin;

--
-- TOC entry 395 (class 1259 OID 29694)
-- Name: sas_data_file_history; Type: TABLE; Schema: radx_history; Owner: radx_admin
--

CREATE TABLE radx_history.sas_data_file_history (
    id integer NOT NULL,
    column_name character varying(256) NOT NULL,
    old_value text,
    new_value text,
    operation character(1) NOT NULL,
    operated_at timestamp without time zone NOT NULL,
    operated_by integer,
    CONSTRAINT operation_check CHECK (((operation)::text = ANY (ARRAY[('D'::character varying)::text, ('U'::character varying)::text])))
);


ALTER TABLE radx_history.sas_data_file_history OWNER TO radx_admin;

--
-- TOC entry 381 (class 1259 OID 29057)
-- Name: study_history; Type: TABLE; Schema: radx_history; Owner: radx_admin
--

CREATE TABLE radx_history.study_history (
    id integer NOT NULL,
    column_name character varying(256) NOT NULL,
    old_value text,
    new_value text,
    operation character(1) NOT NULL,
    operated_at timestamp without time zone NOT NULL,
    operated_by integer,
    CONSTRAINT operation_check CHECK (((operation)::text = ANY (ARRAY[('D'::character varying)::text, ('U'::character varying)::text])))
);


ALTER TABLE radx_history.study_history OWNER TO radx_admin;

--
-- TOC entry 383 (class 1259 OID 29088)
-- Name: study_property_value_history; Type: TABLE; Schema: radx_history; Owner: radx_admin
--

CREATE TABLE radx_history.study_property_value_history (
    id integer NOT NULL,
    column_name character varying(256) NOT NULL,
    old_value text,
    new_value text,
    operation character(1) NOT NULL,
    operated_at timestamp without time zone NOT NULL,
    operated_by integer,
    CONSTRAINT operation_check CHECK (((operation)::text = ANY (ARRAY[('D'::character varying)::text, ('U'::character varying)::text])))
);


ALTER TABLE radx_history.study_property_value_history OWNER TO radx_admin;

--
-- TOC entry 391 (class 1259 OID 29663)
-- Name: support_request_history; Type: TABLE; Schema: radx_history; Owner: radx_admin
--

CREATE TABLE radx_history.support_request_history (
    id integer NOT NULL,
    column_name character varying(256) NOT NULL,
    old_value text,
    new_value text,
    operation character(1) NOT NULL,
    operated_at timestamp without time zone NOT NULL,
    operated_by integer,
    CONSTRAINT operation_check CHECK (((operation)::text = ANY (ARRAY[('D'::character varying)::text, ('U'::character varying)::text])))
);


ALTER TABLE radx_history.support_request_history OWNER TO radx_admin;

--
-- TOC entry 413 (class 1259 OID 43557)
-- Name: user_file_upload_history; Type: TABLE; Schema: radx_history; Owner: radx_admin
--

CREATE TABLE radx_history.user_file_upload_history (
    id integer NOT NULL,
    column_name character varying(256) NOT NULL,
    old_value text,
    new_value text,
    operation character(1) NOT NULL,
    operated_at timestamp without time zone NOT NULL,
    operated_by integer,
    CONSTRAINT operation_check CHECK (((operation)::text = ANY (ARRAY[('D'::character varying)::text, ('U'::character varying)::text])))
);


ALTER TABLE radx_history.user_file_upload_history OWNER TO radx_admin;

--
-- TOC entry 418 (class 1259 OID 46708)
-- Name: user_referrer_history; Type: TABLE; Schema: radx_history; Owner: radx_admin
--

CREATE TABLE radx_history.user_referrer_history (
    id integer NOT NULL,
    column_name character varying(256) NOT NULL,
    old_value text,
    new_value text,
    operation character(1) NOT NULL,
    operated_at timestamp without time zone NOT NULL,
    operated_by integer,
    CONSTRAINT operation_check CHECK (((operation)::text = ANY (ARRAY[('D'::character varying)::text, ('U'::character varying)::text])))
);


ALTER TABLE radx_history.user_referrer_history OWNER TO radx_admin;

--
-- TOC entry 392 (class 1259 OID 29671)
-- Name: user_role_history; Type: TABLE; Schema: radx_history; Owner: radx_admin
--

CREATE TABLE radx_history.user_role_history (
    id integer NOT NULL,
    column_name character varying(256) NOT NULL,
    old_value text,
    new_value text,
    operation character(1) NOT NULL,
    operated_at timestamp without time zone NOT NULL,
    operated_by integer,
    CONSTRAINT operation_check CHECK (((operation)::text = ANY (ARRAY[('D'::character varying)::text, ('U'::character varying)::text])))
);


ALTER TABLE radx_history.user_role_history OWNER TO radx_admin;

--
-- TOC entry 384 (class 1259 OID 29095)
-- Name: users_history; Type: TABLE; Schema: radx_history; Owner: radx_admin
--

CREATE TABLE radx_history.users_history (
    id integer NOT NULL,
    column_name character varying(256) NOT NULL,
    old_value text,
    new_value text,
    operation character(1) NOT NULL,
    operated_at timestamp without time zone NOT NULL,
    operated_by integer,
    CONSTRAINT operation_check CHECK (((operation)::text = ANY (ARRAY[('D'::character varying)::text, ('U'::character varying)::text])))
);


ALTER TABLE radx_history.users_history OWNER TO radx_admin;

--
-- TOC entry 393 (class 1259 OID 29678)
-- Name: workbench_request_history; Type: TABLE; Schema: radx_history; Owner: radx_admin
--

CREATE TABLE radx_history.workbench_request_history (
    id integer NOT NULL,
    column_name character varying(256) NOT NULL,
    old_value text,
    new_value text,
    operation character(1) NOT NULL,
    operated_at timestamp without time zone NOT NULL,
    operated_by integer,
    CONSTRAINT operation_check CHECK (((operation)::text = ANY (ARRAY[('D'::character varying)::text, ('U'::character varying)::text])))
);


ALTER TABLE radx_history.workbench_request_history OWNER TO radx_admin;

--
-- TOC entry 394 (class 1259 OID 29685)
-- Name: workbench_request_interest_history; Type: TABLE; Schema: radx_history; Owner: radx_admin
--

CREATE TABLE radx_history.workbench_request_interest_history (
    id integer NOT NULL,
    column_name character varying(256) NOT NULL,
    old_value text,
    new_value text,
    operation character(1) NOT NULL,
    operated_at timestamp without time zone NOT NULL,
    operated_by integer,
    CONSTRAINT operation_check CHECK (((operation)::text = ANY (ARRAY[('D'::character varying)::text, ('U'::character varying)::text])))
);


ALTER TABLE radx_history.workbench_request_interest_history OWNER TO radx_admin;

--
-- TOC entry 4909 (class 2604 OID 16956)
-- Name: data_file id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.data_file ALTER COLUMN id SET DEFAULT nextval('public.data_file_id_seq'::regclass);


--
-- TOC entry 4915 (class 2604 OID 17072)
-- Name: data_file_download id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.data_file_download ALTER COLUMN id SET DEFAULT nextval('public.data_file_download_id_seq'::regclass);


--
-- TOC entry 4941 (class 2604 OID 22091)
-- Name: data_file_variable id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.data_file_variable ALTER COLUMN id SET DEFAULT nextval('public.data_file_variable_id_seq'::regclass);


--
-- TOC entry 4905 (class 2604 OID 16924)
-- Name: data_submission id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.data_submission ALTER COLUMN id SET DEFAULT nextval('public.data_submission_id_seq'::regclass);


--
-- TOC entry 4935 (class 2604 OID 17285)
-- Name: datafile_harmonization_metrics id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.datafile_harmonization_metrics ALTER COLUMN id SET DEFAULT nextval('public.datafile_harmonization_metrics_id_seq'::regclass);


--
-- TOC entry 4878 (class 2604 OID 16626)
-- Name: entity_property id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.entity_property ALTER COLUMN id SET DEFAULT nextval('public.entity_property_id_seq'::regclass);


--
-- TOC entry 4881 (class 2604 OID 16657)
-- Name: entity_property_display_setting id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.entity_property_display_setting ALTER COLUMN id SET DEFAULT nextval('public.entity_property_display_setting_id_seq'::regclass);


--
-- TOC entry 4917 (class 2604 OID 17090)
-- Name: entity_property_mta_mapping id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.entity_property_mta_mapping ALTER COLUMN id SET DEFAULT nextval('public.entity_property_mta_mapping_id_seq'::regclass);


--
-- TOC entry 4923 (class 2604 OID 17181)
-- Name: event_link id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.event_link ALTER COLUMN id SET DEFAULT nextval('public.event_link_id_seq'::regclass);


--
-- TOC entry 4920 (class 2604 OID 17165)
-- Name: events id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);


--
-- TOC entry 4953 (class 2604 OID 40540)
-- Name: funding id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.funding ALTER COLUMN id SET DEFAULT nextval('public.funding_id_seq'::regclass);


--
-- TOC entry 4942 (class 2604 OID 22323)
-- Name: hub_content_metrics id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.hub_content_metrics ALTER COLUMN id SET DEFAULT nextval('public.hub_content_metrics_id_seq'::regclass);


--
-- TOC entry 4887 (class 2604 OID 16716)
-- Name: institution id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.institution ALTER COLUMN id SET DEFAULT nextval('public.institution_id_seq'::regclass);


--
-- TOC entry 4897 (class 2604 OID 16830)
-- Name: jwt_token id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.jwt_token ALTER COLUMN id SET DEFAULT nextval('public.jwt_token_id_seq'::regclass);


--
-- TOC entry 4913 (class 2604 OID 17011)
-- Name: lkup_cde_codelist id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.lkup_cde_codelist ALTER COLUMN id SET DEFAULT nextval('public.lkup_cde_codelist_id_seq'::regclass);


--
-- TOC entry 4914 (class 2604 OID 17020)
-- Name: lkup_cde_codelist_value id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.lkup_cde_codelist_value ALTER COLUMN id SET DEFAULT nextval('public.lkup_cde_codelist_value_id_seq'::regclass);


--
-- TOC entry 4858 (class 2604 OID 16433)
-- Name: lkup_country id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.lkup_country ALTER COLUMN id SET DEFAULT nextval('public.lkup_country_id_seq'::regclass);


--
-- TOC entry 4864 (class 2604 OID 16501)
-- Name: lkup_data_file_category id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.lkup_data_file_category ALTER COLUMN id SET DEFAULT nextval('public.lkup_data_file_category_id_seq'::regclass);


--
-- TOC entry 4865 (class 2604 OID 16510)
-- Name: lkup_center id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.lkup_center ALTER COLUMN id SET DEFAULT nextval('public.lkup_center_id_seq'::regclass);


--
-- TOC entry 4866 (class 2604 OID 16520)
-- Name: lkup_entity_type id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.lkup_entity_type ALTER COLUMN id SET DEFAULT nextval('public.lkup_entity_type_id_seq'::regclass);


--
-- TOC entry 4918 (class 2604 OID 17114)
-- Name: lkup_event_type id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.lkup_event_type ALTER COLUMN id SET DEFAULT nextval('public.lkup_event_type_id_seq'::regclass);


--
-- TOC entry 4867 (class 2604 OID 16529)
-- Name: lkup_file_type id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.lkup_file_type ALTER COLUMN id SET DEFAULT nextval('public.lkup_file_type_id_seq'::regclass);


--
-- TOC entry 4859 (class 2604 OID 16440)
-- Name: lkup_institution_type id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.lkup_institution_type ALTER COLUMN id SET DEFAULT nextval('public.lkup_institution_type_id_seq'::regclass);


--
-- TOC entry 4933 (class 2604 OID 17262)
-- Name: lkup_metrics_report_type id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.lkup_metrics_report_type ALTER COLUMN id SET DEFAULT nextval('public.lkup_metrics_report_type_id_seq'::regclass);


--
-- TOC entry 4919 (class 2604 OID 17123)
-- Name: lkup_news_type id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.lkup_news_type ALTER COLUMN id SET DEFAULT nextval('public.lkup_news_type_id_seq'::regclass);


--
-- TOC entry 4862 (class 2604 OID 16478)
-- Name: lkup_property_codelist id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.lkup_property_codelist ALTER COLUMN id SET DEFAULT nextval('public.lkup_property_codelist_id_seq'::regclass);


--
-- TOC entry 4863 (class 2604 OID 16487)
-- Name: lkup_property_codelist_value id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.lkup_property_codelist_value ALTER COLUMN id SET DEFAULT nextval('public.lkup_property_codelist_value_id_seq'::regclass);


--
-- TOC entry 4869 (class 2604 OID 16547)
-- Name: lkup_property_source id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.lkup_property_source ALTER COLUMN id SET DEFAULT nextval('public.lkup_property_source_id_seq'::regclass);


--
-- TOC entry 4868 (class 2604 OID 16538)
-- Name: lkup_property_type id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.lkup_property_type ALTER COLUMN id SET DEFAULT nextval('public.lkup_property_type_id_seq'::regclass);


--
-- TOC entry 4965 (class 2604 OID 46682)
-- Name: lkup_referrer id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.lkup_referrer ALTER COLUMN id SET DEFAULT nextval('public.lkup_referrer_id_seq'::regclass);


--
-- TOC entry 4890 (class 2604 OID 16753)
-- Name: lkup_researcher_level id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.lkup_researcher_level ALTER COLUMN id SET DEFAULT nextval('public.lkup_researcher_level_id_seq'::regclass);


--
-- TOC entry 4936 (class 2604 OID 17299)
-- Name: lkup_resolution_type id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.lkup_resolution_type ALTER COLUMN id SET DEFAULT nextval('public.lkup_resolution_type_id_seq'::regclass);


--
-- TOC entry 4889 (class 2604 OID 16746)
-- Name: lkup_role id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.lkup_role ALTER COLUMN id SET DEFAULT nextval('public.lkup_role_id_seq'::regclass);


--
-- TOC entry 4860 (class 2604 OID 16447)
-- Name: lkup_state id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.lkup_state ALTER COLUMN id SET DEFAULT nextval('public.lkup_state_id_seq'::regclass);


--
-- TOC entry 4861 (class 2604 OID 16469)
-- Name: lkup_status id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.lkup_status ALTER COLUMN id SET DEFAULT nextval('public.lkup_status_id_seq'::regclass);


--
-- TOC entry 4870 (class 2604 OID 16556)
-- Name: lkup_submission_step id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.lkup_submission_step ALTER COLUMN id SET DEFAULT nextval('public.lkup_submission_step_id_seq'::regclass);


--
-- TOC entry 4937 (class 2604 OID 17306)
-- Name: lkup_support_request_type id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.lkup_support_request_type ALTER COLUMN id SET DEFAULT nextval('public.lkup_support_request_type_id_seq'::regclass);


--
-- TOC entry 4912 (class 2604 OID 17002)
-- Name: lkup_variable_type id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.lkup_variable_type ALTER COLUMN id SET DEFAULT nextval('public.lkup_variable_type_id_seq'::regclass);


--
-- TOC entry 4902 (class 2604 OID 16878)
-- Name: lkup_workbench_interest id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.lkup_workbench_interest ALTER COLUMN id SET DEFAULT nextval('public.lkup_workbench_interest_id_seq'::regclass);


--
-- TOC entry 4934 (class 2604 OID 17271)
-- Name: metrics_report id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.metrics_report ALTER COLUMN id SET DEFAULT nextval('public.metrics_report_id_seq'::regclass);


--
-- TOC entry 4926 (class 2604 OID 17229)
-- Name: news id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.news ALTER COLUMN id SET DEFAULT nextval('public.news_id_seq'::regclass);


--
-- TOC entry 4930 (class 2604 OID 17245)
-- Name: news_link id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.news_link ALTER COLUMN id SET DEFAULT nextval('public.news_link_id_seq'::regclass);


--
-- TOC entry 4956 (class 2604 OID 40551)
-- Name: newsletter id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.newsletter ALTER COLUMN id SET DEFAULT nextval('public.newsletter_id_seq'::regclass);


--
-- TOC entry 4945 (class 2604 OID 22736)
-- Name: public_data id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.public_data ALTER COLUMN id SET DEFAULT nextval('public.public_data_id_seq'::regclass);


--
-- TOC entry 4944 (class 2604 OID 22428)
-- Name: public_data_collection id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.public_data_collection ALTER COLUMN id SET DEFAULT nextval('public.public_data_collection_id_seq'::regclass);


--
-- TOC entry 4896 (class 2604 OID 16805)
-- Name: ras_tracking id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.ras_tracking ALTER COLUMN id SET DEFAULT nextval('public.ras_tracking_id_seq'::regclass);


--
-- TOC entry 4871 (class 2604 OID 16563)
-- Name: s3_file id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.s3_file ALTER COLUMN id SET DEFAULT nextval('public.s3_file_id_seq'::regclass);


--
-- TOC entry 4948 (class 2604 OID 29118)
-- Name: sas_data_file id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.sas_data_file ALTER COLUMN id SET DEFAULT nextval('public.sas_data_file_id_seq'::regclass);


--
-- TOC entry 4951 (class 2604 OID 29149)
-- Name: sas_file_download id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.sas_file_download ALTER COLUMN id SET DEFAULT nextval('public.sas_file_download_id_seq'::regclass);


--
-- TOC entry 4959 (class 2604 OID 40562)
-- Name: search_log id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.search_log ALTER COLUMN id SET DEFAULT nextval('public.search_log_id_seq'::regclass);


--
-- TOC entry 4875 (class 2604 OID 16580)
-- Name: study id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.study ALTER COLUMN id SET DEFAULT nextval('public.study_id_seq'::regclass);


--
-- TOC entry 4940 (class 2604 OID 17362)
-- Name: study_harmonization_metrics id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.study_harmonization_metrics ALTER COLUMN id SET DEFAULT nextval('public.study_harmonization_metrics_id_seq'::regclass);


--
-- TOC entry 4884 (class 2604 OID 16678)
-- Name: study_property_value id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.study_property_value ALTER COLUMN id SET DEFAULT nextval('public.study_property_value_id_seq'::regclass);


--
-- TOC entry 4938 (class 2604 OID 17313)
-- Name: support_request id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.support_request ALTER COLUMN id SET DEFAULT nextval('public.support_request_id_seq'::regclass);


--
-- TOC entry 4962 (class 2604 OID 41173)
-- Name: tier_1_variable id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.tier_1_variable ALTER COLUMN id SET DEFAULT nextval('public.tier_1_variable_id_seq'::regclass);


--
-- TOC entry 4975 (class 2604 OID 65310)
-- Name: tier_1_variable_mapping_json id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.tier_1_variable_mapping_json ALTER COLUMN id SET DEFAULT nextval('public.tier_1_variable_mapping_json_id_seq'::regclass);


--
-- TOC entry 4961 (class 2604 OID 41155)
-- Name: tier_1_variable_terms id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.tier_1_variable_terms ALTER COLUMN id SET DEFAULT nextval('public.tier_1_variable_terms_id_seq'::regclass);


--
-- TOC entry 4963 (class 2604 OID 43526)
-- Name: user_file_upload id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.user_file_upload ALTER COLUMN id SET DEFAULT nextval('public.user_file_upload_id_seq'::regclass);


--
-- TOC entry 4900 (class 2604 OID 16865)
-- Name: user_login id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.user_login ALTER COLUMN id SET DEFAULT nextval('public.user_login_id_seq'::regclass);


--
-- TOC entry 4898 (class 2604 OID 16842)
-- Name: user_ras id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.user_ras ALTER COLUMN id SET DEFAULT nextval('public.user_ras_id_seq'::regclass);


--
-- TOC entry 4966 (class 2604 OID 46692)
-- Name: user_referrer id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.user_referrer ALTER COLUMN id SET DEFAULT nextval('public.user_referrer_id_seq'::regclass);


--
-- TOC entry 4894 (class 2604 OID 16787)
-- Name: user_role id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.user_role ALTER COLUMN id SET DEFAULT nextval('public.user_role_id_seq'::regclass);


--
-- TOC entry 4972 (class 2604 OID 47338)
-- Name: user_workspace id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.user_workspace ALTER COLUMN id SET DEFAULT nextval('public.user_workspace_id_seq'::regclass);


--
-- TOC entry 4891 (class 2604 OID 16761)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4974 (class 2604 OID 65291)
-- Name: variable_mapping id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.variable_mapping ALTER COLUMN id SET DEFAULT nextval('public.variable_mapping_id_seq'::regclass);


--
-- TOC entry 4968 (class 2604 OID 46762)
-- Name: variable_permissible_values id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.variable_permissible_values ALTER COLUMN id SET DEFAULT nextval('public.variable_permissible_values_id_seq'::regclass);


--
-- TOC entry 4969 (class 2604 OID 46779)
-- Name: variable_property_value id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.variable_property_value ALTER COLUMN id SET DEFAULT nextval('public.variable_property_value_id_seq'::regclass);


--
-- TOC entry 4973 (class 2604 OID 58955)
-- Name: variables id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.variables ALTER COLUMN id SET DEFAULT nextval('public.variables_id_seq'::regclass);


--
-- TOC entry 4943 (class 2604 OID 22340)
-- Name: weekly_hub_content_data id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.weekly_hub_content_data ALTER COLUMN id SET DEFAULT nextval('public.weekly_hub_content_data_id_seq'::regclass);


--
-- TOC entry 4903 (class 2604 OID 16886)
-- Name: workbench_request id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.workbench_request ALTER COLUMN id SET DEFAULT nextval('public.workbench_request_id_seq'::regclass);


--
-- TOC entry 4904 (class 2604 OID 16905)
-- Name: workbench_request_interest id; Type: DEFAULT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.workbench_request_interest ALTER COLUMN id SET DEFAULT nextval('public.workbench_request_interest_id_seq'::regclass);


--
-- TOC entry 5063 (class 2606 OID 17075)
-- Name: data_file_download data_file_download_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.data_file_download
    ADD CONSTRAINT data_file_download_pkey PRIMARY KEY (id);


--
-- TOC entry 5055 (class 2606 OID 16962)
-- Name: data_file data_file_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.data_file
    ADD CONSTRAINT data_file_pkey PRIMARY KEY (id);


--
-- TOC entry 5093 (class 2606 OID 22095)
-- Name: data_file_variable data_file_variable_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.data_file_variable
    ADD CONSTRAINT data_file_variable_pkey PRIMARY KEY (id);


--
-- TOC entry 5053 (class 2606 OID 16931)
-- Name: data_submission data_submission_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.data_submission
    ADD CONSTRAINT data_submission_pkey PRIMARY KEY (id);


--
-- TOC entry 5083 (class 2606 OID 17289)
-- Name: datafile_harmonization_metrics datafile_harmonization_metrics_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.datafile_harmonization_metrics
    ADD CONSTRAINT datafile_harmonization_metrics_pkey PRIMARY KEY (id);


--
-- TOC entry 5023 (class 2606 OID 16663)
-- Name: entity_property_display_setting entity_property_display_setting_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.entity_property_display_setting
    ADD CONSTRAINT entity_property_display_setting_pkey PRIMARY KEY (id);


--
-- TOC entry 5065 (class 2606 OID 17094)
-- Name: entity_property_mta_mapping entity_property_mta_mapping_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.entity_property_mta_mapping
    ADD CONSTRAINT entity_property_mta_mapping_pkey PRIMARY KEY (id);


--
-- TOC entry 5021 (class 2606 OID 16632)
-- Name: entity_property entity_property_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.entity_property
    ADD CONSTRAINT entity_property_pkey PRIMARY KEY (id);


--
-- TOC entry 5073 (class 2606 OID 17187)
-- Name: event_link event_link_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.event_link
    ADD CONSTRAINT event_link_pkey PRIMARY KEY (id);


--
-- TOC entry 5071 (class 2606 OID 17171)
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- TOC entry 5107 (class 2606 OID 40546)
-- Name: funding funding_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.funding
    ADD CONSTRAINT funding_pkey PRIMARY KEY (id);


--
-- TOC entry 5095 (class 2606 OID 22327)
-- Name: hub_content_metrics hub_content_metrics_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.hub_content_metrics
    ADD CONSTRAINT hub_content_metrics_pkey PRIMARY KEY (id);


--
-- TOC entry 5027 (class 2606 OID 16721)
-- Name: institution institution_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.institution
    ADD CONSTRAINT institution_pkey PRIMARY KEY (id);


--
-- TOC entry 5039 (class 2606 OID 16832)
-- Name: jwt_token jwt_token_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.jwt_token
    ADD CONSTRAINT jwt_token_pkey PRIMARY KEY (id);


--
-- TOC entry 5059 (class 2606 OID 17015)
-- Name: lkup_cde_codelist lkup_cde_codelist_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.lkup_cde_codelist
    ADD CONSTRAINT lkup_cde_codelist_pkey PRIMARY KEY (id);


--
-- TOC entry 5061 (class 2606 OID 17024)
-- Name: lkup_cde_codelist_value lkup_cde_codelist_value_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.lkup_cde_codelist_value
    ADD CONSTRAINT lkup_cde_codelist_value_pkey PRIMARY KEY (id);


--
-- TOC entry 4991 (class 2606 OID 16435)
-- Name: lkup_country lkup_country_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.lkup_country
    ADD CONSTRAINT lkup_country_pkey PRIMARY KEY (id);


--
-- TOC entry 5003 (class 2606 OID 16505)
-- Name: lkup_data_file_category lkup_data_file_category_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.lkup_data_file_category
    ADD CONSTRAINT lkup_data_file_category_pkey PRIMARY KEY (id);


--
-- TOC entry 5005 (class 2606 OID 16514)
-- Name: lkup_center lkup_center_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.lkup_center
    ADD CONSTRAINT lkup_center_pkey PRIMARY KEY (id);


--
-- TOC entry 5007 (class 2606 OID 16524)
-- Name: lkup_entity_type lkup_entity_type_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.lkup_entity_type
    ADD CONSTRAINT lkup_entity_type_pkey PRIMARY KEY (id);


--
-- TOC entry 5067 (class 2606 OID 17118)
-- Name: lkup_event_type lkup_event_type_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.lkup_event_type
    ADD CONSTRAINT lkup_event_type_pkey PRIMARY KEY (id);


--
-- TOC entry 5009 (class 2606 OID 16533)
-- Name: lkup_file_type lkup_file_type_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.lkup_file_type
    ADD CONSTRAINT lkup_file_type_pkey PRIMARY KEY (id);


--
-- TOC entry 4993 (class 2606 OID 16442)
-- Name: lkup_institution_type lkup_institution_type_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.lkup_institution_type
    ADD CONSTRAINT lkup_institution_type_pkey PRIMARY KEY (id);


--
-- TOC entry 5079 (class 2606 OID 17266)
-- Name: lkup_metrics_report_type lkup_metrics_report_type_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.lkup_metrics_report_type
    ADD CONSTRAINT lkup_metrics_report_type_pkey PRIMARY KEY (id);


--
-- TOC entry 5069 (class 2606 OID 17127)
-- Name: lkup_news_type lkup_news_type_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.lkup_news_type
    ADD CONSTRAINT lkup_news_type_pkey PRIMARY KEY (id);


--
-- TOC entry 4999 (class 2606 OID 16482)
-- Name: lkup_property_codelist lkup_property_codelist_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.lkup_property_codelist
    ADD CONSTRAINT lkup_property_codelist_pkey PRIMARY KEY (id);


--
-- TOC entry 5001 (class 2606 OID 16491)
-- Name: lkup_property_codelist_value lkup_property_codelist_value_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.lkup_property_codelist_value
    ADD CONSTRAINT lkup_property_codelist_value_pkey PRIMARY KEY (id);


--
-- TOC entry 5013 (class 2606 OID 16551)
-- Name: lkup_property_source lkup_property_source_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.lkup_property_source
    ADD CONSTRAINT lkup_property_source_pkey PRIMARY KEY (id);


--
-- TOC entry 5011 (class 2606 OID 16542)
-- Name: lkup_property_type lkup_property_type_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.lkup_property_type
    ADD CONSTRAINT lkup_property_type_pkey PRIMARY KEY (id);


--
-- TOC entry 4995 (class 2606 OID 16449)
-- Name: lkup_state lkup_state_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.lkup_state
    ADD CONSTRAINT lkup_state_pkey PRIMARY KEY (id);


--
-- TOC entry 4997 (class 2606 OID 16473)
-- Name: lkup_status lkup_status_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.lkup_status
    ADD CONSTRAINT lkup_status_pkey PRIMARY KEY (id);


--
-- TOC entry 5015 (class 2606 OID 16558)
-- Name: lkup_submission_step lkup_submission_step_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.lkup_submission_step
    ADD CONSTRAINT lkup_submission_step_pkey PRIMARY KEY (id);


--
-- TOC entry 5131 (class 2606 OID 58944)
-- Name: lkup_variable_category lkup_variable_category_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.lkup_variable_category
    ADD CONSTRAINT lkup_variable_category_pkey PRIMARY KEY (id);


--
-- TOC entry 5123 (class 2606 OID 46721)
-- Name: lkup_variable_datatype lkup_variable_datatype_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.lkup_variable_datatype
    ADD CONSTRAINT lkup_variable_datatype_pkey PRIMARY KEY (id);


--
-- TOC entry 5057 (class 2606 OID 17006)
-- Name: lkup_variable_type lkup_variable_type_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.lkup_variable_type
    ADD CONSTRAINT lkup_variable_type_pkey PRIMARY KEY (id);


--
-- TOC entry 5081 (class 2606 OID 17275)
-- Name: metrics_report metrics_report_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.metrics_report
    ADD CONSTRAINT metrics_report_pkey PRIMARY KEY (id);


--
-- TOC entry 5077 (class 2606 OID 17251)
-- Name: news_link news_link_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.news_link
    ADD CONSTRAINT news_link_pkey PRIMARY KEY (id);


--
-- TOC entry 5075 (class 2606 OID 17235)
-- Name: news news_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);


--
-- TOC entry 5109 (class 2606 OID 40557)
-- Name: newsletter newsletter_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.newsletter
    ADD CONSTRAINT newsletter_pkey PRIMARY KEY (id);


--
-- TOC entry 5085 (class 2606 OID 17301)
-- Name: lkup_resolution_type pk_lkup_resolution_type; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.lkup_resolution_type
    ADD CONSTRAINT pk_lkup_resolution_type PRIMARY KEY (id);


--
-- TOC entry 5087 (class 2606 OID 17308)
-- Name: lkup_support_request_type pk_lkup_support_request_type; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.lkup_support_request_type
    ADD CONSTRAINT pk_lkup_support_request_type PRIMARY KEY (id);


--
-- TOC entry 5119 (class 2606 OID 46686)
-- Name: lkup_referrer pk_referrer; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.lkup_referrer
    ADD CONSTRAINT pk_referrer PRIMARY KEY (id);


--
-- TOC entry 5031 (class 2606 OID 16755)
-- Name: lkup_researcher_level pk_researcher_level; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.lkup_researcher_level
    ADD CONSTRAINT pk_researcher_level PRIMARY KEY (id);


--
-- TOC entry 5029 (class 2606 OID 16748)
-- Name: lkup_role pk_role; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.lkup_role
    ADD CONSTRAINT pk_role PRIMARY KEY (id);


--
-- TOC entry 5089 (class 2606 OID 17318)
-- Name: support_request pk_support_request; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.support_request
    ADD CONSTRAINT pk_support_request PRIMARY KEY (id);


--
-- TOC entry 5117 (class 2606 OID 43531)
-- Name: user_file_upload pk_user_file_upload_id; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.user_file_upload
    ADD CONSTRAINT pk_user_file_upload_id PRIMARY KEY (id);


--
-- TOC entry 5045 (class 2606 OID 16868)
-- Name: user_login pk_user_login_id; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.user_login
    ADD CONSTRAINT pk_user_login_id PRIMARY KEY (id);


--
-- TOC entry 5121 (class 2606 OID 46697)
-- Name: user_referrer pk_user_referrer_id; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.user_referrer
    ADD CONSTRAINT pk_user_referrer_id PRIMARY KEY (id);


--
-- TOC entry 5047 (class 2606 OID 16880)
-- Name: lkup_workbench_interest pk_workbench_interest; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.lkup_workbench_interest
    ADD CONSTRAINT pk_workbench_interest PRIMARY KEY (id);


--
-- TOC entry 5051 (class 2606 OID 16909)
-- Name: workbench_request_interest pk_workbench_request_interest; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.workbench_request_interest
    ADD CONSTRAINT pk_workbench_request_interest PRIMARY KEY (id);


--
-- TOC entry 5099 (class 2606 OID 22432)
-- Name: public_data_collection public_data_collection_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.public_data_collection
    ADD CONSTRAINT public_data_collection_pkey PRIMARY KEY (id);


--
-- TOC entry 5101 (class 2606 OID 22742)
-- Name: public_data public_data_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.public_data
    ADD CONSTRAINT public_data_pkey PRIMARY KEY (id);


--
-- TOC entry 5037 (class 2606 OID 16809)
-- Name: ras_tracking ras_tracking_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.ras_tracking
    ADD CONSTRAINT ras_tracking_pkey PRIMARY KEY (id);


--
-- TOC entry 5017 (class 2606 OID 16570)
-- Name: s3_file s3_file_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.s3_file
    ADD CONSTRAINT s3_file_pkey PRIMARY KEY (id);


--
-- TOC entry 5103 (class 2606 OID 29124)
-- Name: sas_data_file sas_data_file_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.sas_data_file
    ADD CONSTRAINT sas_data_file_pkey PRIMARY KEY (id);


--
-- TOC entry 5105 (class 2606 OID 29152)
-- Name: sas_file_download sas_file_download_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.sas_file_download
    ADD CONSTRAINT sas_file_download_pkey PRIMARY KEY (id);


--
-- TOC entry 5111 (class 2606 OID 40567)
-- Name: search_log search_log_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.search_log
    ADD CONSTRAINT search_log_pkey PRIMARY KEY (id);


--
-- TOC entry 5091 (class 2606 OID 17364)
-- Name: study_harmonization_metrics study_harmonization_metrics_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.study_harmonization_metrics
    ADD CONSTRAINT study_harmonization_metrics_pkey PRIMARY KEY (id);


--
-- TOC entry 5019 (class 2606 OID 16586)
-- Name: study study_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.study
    ADD CONSTRAINT study_pkey PRIMARY KEY (id);


--
-- TOC entry 5025 (class 2606 OID 16684)
-- Name: study_property_value study_property_value_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.study_property_value
    ADD CONSTRAINT study_property_value_pkey PRIMARY KEY (id);


--
-- TOC entry 5137 (class 2606 OID 65314)
-- Name: tier_1_variable_mapping_json tier_1_variable_mapping_json_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.tier_1_variable_mapping_json
    ADD CONSTRAINT tier_1_variable_mapping_json_pkey PRIMARY KEY (id);


--
-- TOC entry 5115 (class 2606 OID 41177)
-- Name: tier_1_variable tier_1_variable_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.tier_1_variable
    ADD CONSTRAINT tier_1_variable_pkey PRIMARY KEY (id);


--
-- TOC entry 5113 (class 2606 OID 41159)
-- Name: tier_1_variable_terms tier_1_variable_terms_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.tier_1_variable_terms
    ADD CONSTRAINT tier_1_variable_terms_pkey PRIMARY KEY (id);


--
-- TOC entry 5033 (class 2606 OID 16767)
-- Name: users user_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 5041 (class 2606 OID 16847)
-- Name: user_ras user_ras_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.user_ras
    ADD CONSTRAINT user_ras_pkey PRIMARY KEY (id);


--
-- TOC entry 5035 (class 2606 OID 16790)
-- Name: user_role user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT user_role_pkey PRIMARY KEY (id);


--
-- TOC entry 5129 (class 2606 OID 47342)
-- Name: user_workspace user_workspace_id; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.user_workspace
    ADD CONSTRAINT user_workspace_id PRIMARY KEY (id);


--
-- TOC entry 5135 (class 2606 OID 65295)
-- Name: variable_mapping variable_mapping_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.variable_mapping
    ADD CONSTRAINT variable_mapping_pkey PRIMARY KEY (id);


--
-- TOC entry 5125 (class 2606 OID 46764)
-- Name: variable_permissible_values variable_permissible_values_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.variable_permissible_values
    ADD CONSTRAINT variable_permissible_values_pkey PRIMARY KEY (id);


--
-- TOC entry 5127 (class 2606 OID 46785)
-- Name: variable_property_value variable_property_value_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.variable_property_value
    ADD CONSTRAINT variable_property_value_pkey PRIMARY KEY (id);


--
-- TOC entry 5133 (class 2606 OID 58959)
-- Name: variables variables_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.variables
    ADD CONSTRAINT variables_pkey PRIMARY KEY (id);


--
-- TOC entry 5097 (class 2606 OID 22344)
-- Name: weekly_hub_content_data weekly_hub_content_data_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.weekly_hub_content_data
    ADD CONSTRAINT weekly_hub_content_data_pkey PRIMARY KEY (id);


--
-- TOC entry 5049 (class 2606 OID 16890)
-- Name: workbench_request workbench_request_form_pkey; Type: CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.workbench_request
    ADD CONSTRAINT workbench_request_form_pkey PRIMARY KEY (id);


--
-- TOC entry 5043 (class 2606 OID 16860)
-- Name: ras_tracking_history ras_tracking_history_pkey; Type: CONSTRAINT; Schema: radx_history; Owner: radx_admin
--

ALTER TABLE ONLY radx_history.ras_tracking_history
    ADD CONSTRAINT ras_tracking_history_pkey PRIMARY KEY (id);


--
-- TOC entry 5231 (class 2620 OID 28424)
-- Name: data_file data_file_after_operation_trigger; Type: TRIGGER; Schema: public; Owner: radx_admin
--

CREATE TRIGGER data_file_after_operation_trigger AFTER DELETE OR UPDATE ON public.data_file FOR EACH ROW EXECUTE FUNCTION public.after_operation_trigger_fnc();


--
-- TOC entry 5230 (class 2620 OID 29087)
-- Name: data_submission data_submission_after_operation_trigger; Type: TRIGGER; Schema: public; Owner: radx_admin
--

CREATE TRIGGER data_submission_after_operation_trigger AFTER DELETE OR UPDATE ON public.data_submission FOR EACH ROW EXECUTE FUNCTION public.after_operation_trigger_fnc();


--
-- TOC entry 5224 (class 2620 OID 29207)
-- Name: institution institution_after_operation_trigger; Type: TRIGGER; Schema: public; Owner: radx_admin
--

CREATE TRIGGER institution_after_operation_trigger AFTER DELETE OR UPDATE ON public.institution FOR EACH ROW EXECUTE FUNCTION public.after_operation_trigger_fnc();


--
-- TOC entry 5227 (class 2620 OID 22068)
-- Name: ras_tracking ras_tracking_after_delete_trigger; Type: TRIGGER; Schema: public; Owner: radx_admin
--

CREATE TRIGGER ras_tracking_after_delete_trigger AFTER DELETE ON public.ras_tracking FOR EACH ROW EXECUTE FUNCTION public.ras_tracking_after_delete_trigger_fnc();


--
-- TOC entry 5221 (class 2620 OID 29020)
-- Name: s3_file s3_file_after_operation_trigger; Type: TRIGGER; Schema: public; Owner: radx_admin
--

CREATE TRIGGER s3_file_after_operation_trigger AFTER DELETE OR UPDATE ON public.s3_file FOR EACH ROW EXECUTE FUNCTION public.after_operation_trigger_fnc();


--
-- TOC entry 5233 (class 2620 OID 29700)
-- Name: sas_data_file sas_data_file_after_operation_trigger; Type: TRIGGER; Schema: public; Owner: radx_admin
--

CREATE TRIGGER sas_data_file_after_operation_trigger AFTER DELETE OR UPDATE ON public.sas_data_file FOR EACH ROW EXECUTE FUNCTION public.after_operation_trigger_fnc();


--
-- TOC entry 5222 (class 2620 OID 29064)
-- Name: study study_after_operation_trigger; Type: TRIGGER; Schema: public; Owner: radx_admin
--

CREATE TRIGGER study_after_operation_trigger AFTER DELETE OR UPDATE ON public.study FOR EACH ROW EXECUTE FUNCTION public.after_operation_trigger_fnc();


--
-- TOC entry 5223 (class 2620 OID 29094)
-- Name: study_property_value study_property_value_after_operation_trigger; Type: TRIGGER; Schema: public; Owner: radx_admin
--

CREATE TRIGGER study_property_value_after_operation_trigger AFTER DELETE OR UPDATE ON public.study_property_value FOR EACH ROW EXECUTE FUNCTION public.after_operation_trigger_fnc();


--
-- TOC entry 5232 (class 2620 OID 29669)
-- Name: support_request support_request_after_operation_trigger; Type: TRIGGER; Schema: public; Owner: radx_admin
--

CREATE TRIGGER support_request_after_operation_trigger AFTER DELETE OR UPDATE ON public.support_request FOR EACH ROW EXECUTE FUNCTION public.after_operation_trigger_fnc();


--
-- TOC entry 5234 (class 2620 OID 43563)
-- Name: user_file_upload user_file_upload_after_operation_trigger; Type: TRIGGER; Schema: public; Owner: radx_admin
--

CREATE TRIGGER user_file_upload_after_operation_trigger AFTER DELETE OR UPDATE ON public.user_file_upload FOR EACH ROW EXECUTE FUNCTION public.after_operation_trigger_fnc();


--
-- TOC entry 5235 (class 2620 OID 46714)
-- Name: user_referrer user_referrer_after_operation_trigger; Type: TRIGGER; Schema: public; Owner: radx_admin
--

CREATE TRIGGER user_referrer_after_operation_trigger AFTER DELETE OR UPDATE ON public.user_referrer FOR EACH ROW EXECUTE FUNCTION public.after_operation_trigger_fnc();


--
-- TOC entry 5226 (class 2620 OID 29677)
-- Name: user_role user_role_after_operation_trigger; Type: TRIGGER; Schema: public; Owner: radx_admin
--

CREATE TRIGGER user_role_after_operation_trigger AFTER DELETE OR UPDATE ON public.user_role FOR EACH ROW EXECUTE FUNCTION public.after_operation_trigger_fnc();


--
-- TOC entry 5225 (class 2620 OID 29101)
-- Name: users users_after_operation_trigger; Type: TRIGGER; Schema: public; Owner: radx_admin
--

CREATE TRIGGER users_after_operation_trigger AFTER DELETE OR UPDATE ON public.users FOR EACH ROW EXECUTE FUNCTION public.after_operation_trigger_fnc();


--
-- TOC entry 5228 (class 2620 OID 29684)
-- Name: workbench_request workbench_request_after_operation_trigger; Type: TRIGGER; Schema: public; Owner: radx_admin
--

CREATE TRIGGER workbench_request_after_operation_trigger AFTER DELETE OR UPDATE ON public.workbench_request FOR EACH ROW EXECUTE FUNCTION public.after_operation_trigger_fnc();


--
-- TOC entry 5229 (class 2620 OID 29691)
-- Name: workbench_request_interest workbench_request_interest_after_operation_trigger; Type: TRIGGER; Schema: public; Owner: radx_admin
--

CREATE TRIGGER workbench_request_interest_after_operation_trigger AFTER DELETE OR UPDATE ON public.workbench_request_interest FOR EACH ROW EXECUTE FUNCTION public.after_operation_trigger_fnc();


--
-- TOC entry 5178 (class 2606 OID 17025)
-- Name: lkup_cde_codelist_value fk_cde_codelist_value_codelist_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.lkup_cde_codelist_value
    ADD CONSTRAINT fk_cde_codelist_value_codelist_id FOREIGN KEY (cde_codelist_id) REFERENCES public.lkup_cde_codelist(id) NOT VALID;


--
-- TOC entry 5171 (class 2606 OID 16983)
-- Name: data_file fk_data_file_dictionary_file_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.data_file
    ADD CONSTRAINT fk_data_file_dictionary_file_id FOREIGN KEY (dictionary_file_id) REFERENCES public.data_file(id) NOT VALID;


--
-- TOC entry 5179 (class 2606 OID 17076)
-- Name: data_file_download fk_data_file_download_file_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.data_file_download
    ADD CONSTRAINT fk_data_file_download_file_id FOREIGN KEY (data_file_id) REFERENCES public.data_file(id) NOT VALID;


--
-- TOC entry 5180 (class 2606 OID 17081)
-- Name: data_file_download fk_data_file_download_user_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.data_file_download
    ADD CONSTRAINT fk_data_file_download_user_id FOREIGN KEY (download_by) REFERENCES public.users(id) NOT VALID;


--
-- TOC entry 5172 (class 2606 OID 16988)
-- Name: data_file fk_data_file_metadata_file_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.data_file
    ADD CONSTRAINT fk_data_file_metadata_file_id FOREIGN KEY (metadata_file_id) REFERENCES public.data_file(id) NOT VALID;


--
-- TOC entry 5173 (class 2606 OID 16993)
-- Name: data_file fk_data_file_original_data_file_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.data_file
    ADD CONSTRAINT fk_data_file_original_data_file_id FOREIGN KEY (original_data_file_id) REFERENCES public.data_file(id) NOT VALID;


--
-- TOC entry 5174 (class 2606 OID 16968)
-- Name: data_file fk_data_file_s3_file_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.data_file
    ADD CONSTRAINT fk_data_file_s3_file_id FOREIGN KEY (s3_file_id) REFERENCES public.s3_file(id) NOT VALID;


--
-- TOC entry 5175 (class 2606 OID 16973)
-- Name: data_file fk_data_file_status_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.data_file
    ADD CONSTRAINT fk_data_file_status_id FOREIGN KEY (status_id) REFERENCES public.lkup_status(id) NOT VALID;


--
-- TOC entry 5176 (class 2606 OID 16963)
-- Name: data_file fk_data_file_submission_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.data_file
    ADD CONSTRAINT fk_data_file_submission_id FOREIGN KEY (submission_id) REFERENCES public.data_submission(id) NOT VALID;


--
-- TOC entry 5177 (class 2606 OID 16978)
-- Name: data_file fk_data_file_type_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.data_file
    ADD CONSTRAINT fk_data_file_type_id FOREIGN KEY (file_category_id) REFERENCES public.lkup_data_file_category(id) NOT VALID;


--
-- TOC entry 5196 (class 2606 OID 22096)
-- Name: data_file_variable fk_data_file_variable_data_file_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.data_file_variable
    ADD CONSTRAINT fk_data_file_variable_data_file_id FOREIGN KEY (data_file_id) REFERENCES public.data_file(id) NOT VALID;


--
-- TOC entry 5167 (class 2606 OID 16942)
-- Name: data_submission fk_data_submission_status_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.data_submission
    ADD CONSTRAINT fk_data_submission_status_id FOREIGN KEY (status_id) REFERENCES public.lkup_status(id) NOT VALID;


--
-- TOC entry 5168 (class 2606 OID 16947)
-- Name: data_submission fk_data_submission_step_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.data_submission
    ADD CONSTRAINT fk_data_submission_step_id FOREIGN KEY (step_id) REFERENCES public.lkup_submission_step(id) NOT VALID;


--
-- TOC entry 5169 (class 2606 OID 16932)
-- Name: data_submission fk_data_submission_study_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.data_submission
    ADD CONSTRAINT fk_data_submission_study_id FOREIGN KEY (study_id) REFERENCES public.study(id) NOT VALID;


--
-- TOC entry 5170 (class 2606 OID 16937)
-- Name: data_submission fk_data_submission_submitter_user_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.data_submission
    ADD CONSTRAINT fk_data_submission_submitter_user_id FOREIGN KEY (submitter_user_id) REFERENCES public.users(id) NOT VALID;


--
-- TOC entry 5189 (class 2606 OID 17290)
-- Name: datafile_harmonization_metrics fk_datafile_harmonization_report_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.datafile_harmonization_metrics
    ADD CONSTRAINT fk_datafile_harmonization_report_id FOREIGN KEY (report_id) REFERENCES public.metrics_report(id) NOT VALID;


--
-- TOC entry 5146 (class 2606 OID 16669)
-- Name: entity_property_display_setting fk_display_setting_entity_group_propery_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.entity_property_display_setting
    ADD CONSTRAINT fk_display_setting_entity_group_propery_id FOREIGN KEY (group_property_id) REFERENCES public.entity_property(id) NOT VALID;


--
-- TOC entry 5147 (class 2606 OID 16664)
-- Name: entity_property_display_setting fk_display_setting_entity_propery_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.entity_property_display_setting
    ADD CONSTRAINT fk_display_setting_entity_propery_id FOREIGN KEY (entity_property_id) REFERENCES public.entity_property(id) NOT VALID;


--
-- TOC entry 5142 (class 2606 OID 16643)
-- Name: entity_property fk_entity_property_code_list_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.entity_property
    ADD CONSTRAINT fk_entity_property_code_list_id FOREIGN KEY (code_list_id) REFERENCES public.lkup_property_codelist(id) NOT VALID;


--
-- TOC entry 5143 (class 2606 OID 16638)
-- Name: entity_property fk_entity_property_entity_type_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.entity_property
    ADD CONSTRAINT fk_entity_property_entity_type_id FOREIGN KEY (entity_type_id) REFERENCES public.lkup_entity_type(id) NOT VALID;


--
-- TOC entry 5144 (class 2606 OID 16648)
-- Name: entity_property fk_entity_property_source_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.entity_property
    ADD CONSTRAINT fk_entity_property_source_id FOREIGN KEY (property_source_id) REFERENCES public.lkup_property_source(id) NOT VALID;


--
-- TOC entry 5145 (class 2606 OID 16633)
-- Name: entity_property fk_entity_property_type_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.entity_property
    ADD CONSTRAINT fk_entity_property_type_id FOREIGN KEY (property_type_id) REFERENCES public.lkup_property_type(id) NOT VALID;


--
-- TOC entry 5185 (class 2606 OID 17188)
-- Name: event_link fk_event_link_event_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.event_link
    ADD CONSTRAINT fk_event_link_event_id FOREIGN KEY (event_id) REFERENCES public.events(id) NOT VALID;


--
-- TOC entry 5184 (class 2606 OID 17172)
-- Name: events fk_event_type_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT fk_event_type_id FOREIGN KEY (event_type_id) REFERENCES public.lkup_event_type(id);


--
-- TOC entry 5197 (class 2606 OID 22328)
-- Name: hub_content_metrics fk_hub_content_metrics_report_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.hub_content_metrics
    ADD CONSTRAINT fk_hub_content_metrics_report_id FOREIGN KEY (report_id) REFERENCES public.metrics_report(id) NOT VALID;


--
-- TOC entry 5150 (class 2606 OID 16732)
-- Name: institution fk_institution_country_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.institution
    ADD CONSTRAINT fk_institution_country_id FOREIGN KEY (country_id) REFERENCES public.lkup_country(id) NOT VALID;


--
-- TOC entry 5151 (class 2606 OID 16737)
-- Name: institution fk_institution_state_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.institution
    ADD CONSTRAINT fk_institution_state_id FOREIGN KEY (state_id) REFERENCES public.lkup_state(id) NOT VALID;


--
-- TOC entry 5152 (class 2606 OID 16727)
-- Name: institution fk_institution_status_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.institution
    ADD CONSTRAINT fk_institution_status_id FOREIGN KEY (status_id) REFERENCES public.lkup_status(id) NOT VALID;


--
-- TOC entry 5153 (class 2606 OID 16722)
-- Name: institution fk_institution_type_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.institution
    ADD CONSTRAINT fk_institution_type_id FOREIGN KEY (institution_type_id) REFERENCES public.lkup_institution_type(id) NOT VALID;


--
-- TOC entry 5160 (class 2606 OID 16833)
-- Name: jwt_token fk_jwt_token_user_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.jwt_token
    ADD CONSTRAINT fk_jwt_token_user_id FOREIGN KEY (user_id) REFERENCES public.users(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 5188 (class 2606 OID 17276)
-- Name: metrics_report fk_metrics_report_weekly_type_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.metrics_report
    ADD CONSTRAINT fk_metrics_report_weekly_type_id FOREIGN KEY (type_id) REFERENCES public.lkup_metrics_report_type(id) NOT VALID;


--
-- TOC entry 5181 (class 2606 OID 17100)
-- Name: entity_property_mta_mapping fk_mta_mapping_codelist_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.entity_property_mta_mapping
    ADD CONSTRAINT fk_mta_mapping_codelist_id FOREIGN KEY (codelist_id) REFERENCES public.lkup_property_codelist(id) NOT VALID;


--
-- TOC entry 5182 (class 2606 OID 17105)
-- Name: entity_property_mta_mapping fk_mta_mapping_codelist_value_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.entity_property_mta_mapping
    ADD CONSTRAINT fk_mta_mapping_codelist_value_id FOREIGN KEY (codelist_value_id) REFERENCES public.lkup_property_codelist_value(id) NOT VALID;


--
-- TOC entry 5183 (class 2606 OID 17095)
-- Name: entity_property_mta_mapping fk_mta_mapping_entity_propery_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.entity_property_mta_mapping
    ADD CONSTRAINT fk_mta_mapping_entity_propery_id FOREIGN KEY (entity_property_id) REFERENCES public.entity_property(id) NOT VALID;


--
-- TOC entry 5187 (class 2606 OID 17252)
-- Name: news_link fk_news_link_news_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.news_link
    ADD CONSTRAINT fk_news_link_news_id FOREIGN KEY (news_id) REFERENCES public.news(id) NOT VALID;


--
-- TOC entry 5186 (class 2606 OID 17236)
-- Name: news fk_news_type_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT fk_news_type_id FOREIGN KEY (type_id) REFERENCES public.lkup_news_type(id) NOT VALID;


--
-- TOC entry 5138 (class 2606 OID 16492)
-- Name: lkup_property_codelist_value fk_property_codelist_value_codelist_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.lkup_property_codelist_value
    ADD CONSTRAINT fk_property_codelist_value_codelist_id FOREIGN KEY (property_codelist_id) REFERENCES public.lkup_property_codelist(id) NOT VALID;


--
-- TOC entry 5198 (class 2606 OID 22743)
-- Name: public_data fk_public_data_collection_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.public_data
    ADD CONSTRAINT fk_public_data_collection_id FOREIGN KEY (collection_id) REFERENCES public.public_data_collection(id) NOT VALID;


--
-- TOC entry 5199 (class 2606 OID 22748)
-- Name: public_data fk_public_data_s3_file_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.public_data
    ADD CONSTRAINT fk_public_data_s3_file_id FOREIGN KEY (s3_file_id) REFERENCES public.s3_file(id) NOT VALID;


--
-- TOC entry 5139 (class 2606 OID 16571)
-- Name: s3_file fk_s3_file_type_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.s3_file
    ADD CONSTRAINT fk_s3_file_type_id FOREIGN KEY (file_type_id) REFERENCES public.lkup_file_type(id) NOT VALID;


--
-- TOC entry 5200 (class 2606 OID 29140)
-- Name: sas_data_file fk_sas_data_file_category_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.sas_data_file
    ADD CONSTRAINT fk_sas_data_file_category_id FOREIGN KEY (file_category_id) REFERENCES public.lkup_data_file_category(id) NOT VALID;


--
-- TOC entry 5201 (class 2606 OID 29125)
-- Name: sas_data_file fk_sas_data_file_parent_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.sas_data_file
    ADD CONSTRAINT fk_sas_data_file_parent_id FOREIGN KEY (parent_data_file_id) REFERENCES public.data_file(id) NOT VALID;


--
-- TOC entry 5202 (class 2606 OID 29130)
-- Name: sas_data_file fk_sas_data_file_s3_file_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.sas_data_file
    ADD CONSTRAINT fk_sas_data_file_s3_file_id FOREIGN KEY (s3_file_id) REFERENCES public.s3_file(id) NOT VALID;


--
-- TOC entry 5203 (class 2606 OID 29135)
-- Name: sas_data_file fk_sas_data_file_status_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.sas_data_file
    ADD CONSTRAINT fk_sas_data_file_status_id FOREIGN KEY (status_id) REFERENCES public.lkup_status(id) NOT VALID;


--
-- TOC entry 5204 (class 2606 OID 29153)
-- Name: sas_file_download fk_sas_file_download_file_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.sas_file_download
    ADD CONSTRAINT fk_sas_file_download_file_id FOREIGN KEY (sas_file_id) REFERENCES public.sas_data_file(id) NOT VALID;


--
-- TOC entry 5205 (class 2606 OID 29158)
-- Name: sas_file_download fk_sas_file_download_user_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.sas_file_download
    ADD CONSTRAINT fk_sas_file_download_user_id FOREIGN KEY (download_by) REFERENCES public.users(id) NOT VALID;


--
-- TOC entry 5140 (class 2606 OID 16587)
-- Name: study fk_study_center_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.study
    ADD CONSTRAINT fk_study_center_id FOREIGN KEY (center_id) REFERENCES public.lkup_center(id) NOT VALID;


--
-- TOC entry 5195 (class 2606 OID 17365)
-- Name: study_harmonization_metrics fk_study_harmonization_report_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.study_harmonization_metrics
    ADD CONSTRAINT fk_study_harmonization_report_id FOREIGN KEY (report_id) REFERENCES public.metrics_report(id) NOT VALID;


--
-- TOC entry 5148 (class 2606 OID 16690)
-- Name: study_property_value fk_study_property_value_entity_property_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.study_property_value
    ADD CONSTRAINT fk_study_property_value_entity_property_id FOREIGN KEY (entity_property_id) REFERENCES public.entity_property(id) NOT VALID;


--
-- TOC entry 5149 (class 2606 OID 16685)
-- Name: study_property_value fk_study_property_value_study_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.study_property_value
    ADD CONSTRAINT fk_study_property_value_study_id FOREIGN KEY (study_id) REFERENCES public.study(id) NOT VALID;


--
-- TOC entry 5141 (class 2606 OID 16592)
-- Name: study fk_study_status_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.study
    ADD CONSTRAINT fk_study_status_id FOREIGN KEY (status_id) REFERENCES public.lkup_status(id) NOT VALID;


--
-- TOC entry 5190 (class 2606 OID 17324)
-- Name: support_request fk_support_request_assignee_user_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.support_request
    ADD CONSTRAINT fk_support_request_assignee_user_id FOREIGN KEY (assignee_user_id) REFERENCES public.users(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 5191 (class 2606 OID 17319)
-- Name: support_request fk_support_request_requestor_user_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.support_request
    ADD CONSTRAINT fk_support_request_requestor_user_id FOREIGN KEY (requestor_user_id) REFERENCES public.users(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 5192 (class 2606 OID 17339)
-- Name: support_request fk_support_request_resolution_type_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.support_request
    ADD CONSTRAINT fk_support_request_resolution_type_id FOREIGN KEY (resolution_type_id) REFERENCES public.lkup_resolution_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 5193 (class 2606 OID 17329)
-- Name: support_request fk_support_request_status_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.support_request
    ADD CONSTRAINT fk_support_request_status_id FOREIGN KEY (status_id) REFERENCES public.lkup_status(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 5194 (class 2606 OID 17334)
-- Name: support_request fk_support_request_type_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.support_request
    ADD CONSTRAINT fk_support_request_type_id FOREIGN KEY (type_id) REFERENCES public.lkup_support_request_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 5154 (class 2606 OID 22122)
-- Name: users fk_user_center_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_user_center_id FOREIGN KEY (center_id) REFERENCES public.lkup_center(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 5206 (class 2606 OID 43542)
-- Name: user_file_upload fk_user_file_upload_by; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.user_file_upload
    ADD CONSTRAINT fk_user_file_upload_by FOREIGN KEY (upload_by) REFERENCES public.users(id) NOT VALID;


--
-- TOC entry 5207 (class 2606 OID 43552)
-- Name: user_file_upload fk_user_file_upload_delete_by; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.user_file_upload
    ADD CONSTRAINT fk_user_file_upload_delete_by FOREIGN KEY (delete_by) REFERENCES public.users(id) NOT VALID;


--
-- TOC entry 5208 (class 2606 OID 43547)
-- Name: user_file_upload fk_user_file_upload_download_by; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.user_file_upload
    ADD CONSTRAINT fk_user_file_upload_download_by FOREIGN KEY (download_by) REFERENCES public.users(id) NOT VALID;


--
-- TOC entry 5209 (class 2606 OID 43537)
-- Name: user_file_upload fk_user_file_upload_s3_file_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.user_file_upload
    ADD CONSTRAINT fk_user_file_upload_s3_file_id FOREIGN KEY (s3_file_id) REFERENCES public.s3_file(id) NOT VALID;


--
-- TOC entry 5210 (class 2606 OID 43532)
-- Name: user_file_upload fk_user_file_upload_study_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.user_file_upload
    ADD CONSTRAINT fk_user_file_upload_study_id FOREIGN KEY (study_id) REFERENCES public.study(id) NOT VALID;


--
-- TOC entry 5155 (class 2606 OID 21312)
-- Name: users fk_user_institution_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_user_institution_id FOREIGN KEY (institution_id) REFERENCES public.institution(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 5162 (class 2606 OID 16869)
-- Name: user_login fk_user_login_user_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.user_login
    ADD CONSTRAINT fk_user_login_user_id FOREIGN KEY (user_id) REFERENCES public.users(id) NOT VALID;


--
-- TOC entry 5161 (class 2606 OID 16848)
-- Name: user_ras fk_user_ras_user_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.user_ras
    ADD CONSTRAINT fk_user_ras_user_id FOREIGN KEY (user_id) REFERENCES public.users(id) NOT VALID;


--
-- TOC entry 5211 (class 2606 OID 46703)
-- Name: user_referrer fk_user_referrer_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.user_referrer
    ADD CONSTRAINT fk_user_referrer_id FOREIGN KEY (referrer_id) REFERENCES public.lkup_referrer(id) NOT VALID;


--
-- TOC entry 5212 (class 2606 OID 46698)
-- Name: user_referrer fk_user_referrer_user_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.user_referrer
    ADD CONSTRAINT fk_user_referrer_user_id FOREIGN KEY (user_id) REFERENCES public.users(id) NOT VALID;


--
-- TOC entry 5156 (class 2606 OID 16778)
-- Name: users fk_user_researcher_level; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_user_researcher_level FOREIGN KEY (researcher_level_id) REFERENCES public.lkup_researcher_level(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 5158 (class 2606 OID 16796)
-- Name: user_role fk_user_role_role_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT fk_user_role_role_id FOREIGN KEY (role_id) REFERENCES public.lkup_role(id) NOT VALID;


--
-- TOC entry 5159 (class 2606 OID 16791)
-- Name: user_role fk_user_role_user_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT fk_user_role_user_id FOREIGN KEY (user_id) REFERENCES public.users(id) NOT VALID;


--
-- TOC entry 5157 (class 2606 OID 16773)
-- Name: users fk_user_status; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_user_status FOREIGN KEY (status_id) REFERENCES public.lkup_status(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 5214 (class 2606 OID 47343)
-- Name: user_workspace fk_user_workspace_user_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.user_workspace
    ADD CONSTRAINT fk_user_workspace_user_id FOREIGN KEY (user_id) REFERENCES public.users(id) NOT VALID;


--
-- TOC entry 5219 (class 2606 OID 65296)
-- Name: variable_mapping fk_variable_1_variable_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.variable_mapping
    ADD CONSTRAINT fk_variable_1_variable_id FOREIGN KEY (variable_1_id) REFERENCES public.variables(id) NOT VALID;


--
-- TOC entry 5220 (class 2606 OID 65301)
-- Name: variable_mapping fk_variable_2_variable_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.variable_mapping
    ADD CONSTRAINT fk_variable_2_variable_id FOREIGN KEY (variable_2_id) REFERENCES public.variables(id) NOT VALID;


--
-- TOC entry 5215 (class 2606 OID 58945)
-- Name: lkup_variable_category fk_variable_category_center_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.lkup_variable_category
    ADD CONSTRAINT fk_variable_category_center_id FOREIGN KEY (center_id) REFERENCES public.lkup_center(id) NOT VALID;


--
-- TOC entry 5216 (class 2606 OID 58960)
-- Name: variables fk_variable_category_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.variables
    ADD CONSTRAINT fk_variable_category_id FOREIGN KEY (category_id) REFERENCES public.lkup_variable_category(id) NOT VALID;


--
-- TOC entry 5217 (class 2606 OID 58970)
-- Name: variables fk_variable_center_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.variables
    ADD CONSTRAINT fk_variable_center_id FOREIGN KEY (center_id) REFERENCES public.lkup_center(id) NOT VALID;


--
-- TOC entry 5213 (class 2606 OID 46791)
-- Name: variable_property_value fk_variable_property_value_entity_property_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.variable_property_value
    ADD CONSTRAINT fk_variable_property_value_entity_property_id FOREIGN KEY (entity_property_id) REFERENCES public.entity_property(id) NOT VALID;


--
-- TOC entry 5218 (class 2606 OID 58965)
-- Name: variables fk_variable_study_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.variables
    ADD CONSTRAINT fk_variable_study_id FOREIGN KEY (study_id) REFERENCES public.study(id) NOT VALID;


--
-- TOC entry 5165 (class 2606 OID 16915)
-- Name: workbench_request_interest fk_workbench_request_interest_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.workbench_request_interest
    ADD CONSTRAINT fk_workbench_request_interest_id FOREIGN KEY (workbench_interest_id) REFERENCES public.lkup_workbench_interest(id) NOT VALID;


--
-- TOC entry 5166 (class 2606 OID 16910)
-- Name: workbench_request_interest fk_workbench_request_interest_request_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.workbench_request_interest
    ADD CONSTRAINT fk_workbench_request_interest_request_id FOREIGN KEY (workbench_request_id) REFERENCES public.workbench_request(id) NOT VALID;


--
-- TOC entry 5163 (class 2606 OID 16896)
-- Name: workbench_request fk_workbench_request_status_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.workbench_request
    ADD CONSTRAINT fk_workbench_request_status_id FOREIGN KEY (status_id) REFERENCES public.lkup_status(id) NOT VALID;


--
-- TOC entry 5164 (class 2606 OID 16891)
-- Name: workbench_request fk_workbench_requestor_user_id; Type: FK CONSTRAINT; Schema: public; Owner: radx_admin
--

ALTER TABLE ONLY public.workbench_request
    ADD CONSTRAINT fk_workbench_requestor_user_id FOREIGN KEY (requestor_user_id) REFERENCES public.users(id) NOT VALID;


--
-- TOC entry 5400 (class 0 OID 0)
-- Dependencies: 8
-- Name: SCHEMA radx_history; Type: ACL; Schema: -; Owner: radx_admin
--

GRANT ALL ON SCHEMA radx_history TO radx_user;


--
-- TOC entry 5401 (class 0 OID 0)
-- Dependencies: 486
-- Name: FUNCTION after_operation_trigger_fnc(); Type: ACL; Schema: public; Owner: radx_admin
--

REVOKE ALL ON FUNCTION public.after_operation_trigger_fnc() FROM PUBLIC;
GRANT ALL ON FUNCTION public.after_operation_trigger_fnc() TO radx_user;


--
-- TOC entry 5402 (class 0 OID 0)
-- Dependencies: 465
-- Name: FUNCTION before_operation_trigger_fnc(); Type: ACL; Schema: public; Owner: radx_admin
--

REVOKE ALL ON FUNCTION public.before_operation_trigger_fnc() FROM PUBLIC;
GRANT ALL ON FUNCTION public.before_operation_trigger_fnc() TO radx_user;


--
-- TOC entry 5403 (class 0 OID 0)
-- Dependencies: 513
-- Name: FUNCTION ras_tracking_after_delete_trigger_fnc(); Type: ACL; Schema: public; Owner: radx_admin
--

REVOKE ALL ON FUNCTION public.ras_tracking_after_delete_trigger_fnc() FROM PUBLIC;
GRANT ALL ON FUNCTION public.ras_tracking_after_delete_trigger_fnc() TO radx_user;


--
-- TOC entry 5404 (class 0 OID 0)
-- Dependencies: 518
-- Name: PROCEDURE sp_generate_hub_content_metrics(); Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON PROCEDURE public.sp_generate_hub_content_metrics() TO radx_user;


--
-- TOC entry 5405 (class 0 OID 0)
-- Dependencies: 519
-- Name: PROCEDURE sp_parse_variables(); Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON PROCEDURE public.sp_parse_variables() TO radx_user;


--
-- TOC entry 5406 (class 0 OID 0)
-- Dependencies: 285
-- Name: TABLE data_file; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.data_file TO radx_user;


--
-- TOC entry 5407 (class 0 OID 0)
-- Dependencies: 293
-- Name: TABLE data_file_download; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.data_file_download TO radx_user;


--
-- TOC entry 5409 (class 0 OID 0)
-- Dependencies: 292
-- Name: SEQUENCE data_file_download_id_seq; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON SEQUENCE public.data_file_download_id_seq TO radx_user;


--
-- TOC entry 5411 (class 0 OID 0)
-- Dependencies: 284
-- Name: SEQUENCE data_file_id_seq; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON SEQUENCE public.data_file_id_seq TO radx_user;


--
-- TOC entry 5412 (class 0 OID 0)
-- Dependencies: 328
-- Name: TABLE data_file_variable; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.data_file_variable TO radx_user;


--
-- TOC entry 5414 (class 0 OID 0)
-- Dependencies: 327
-- Name: SEQUENCE data_file_variable_id_seq; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON SEQUENCE public.data_file_variable_id_seq TO radx_user;


--
-- TOC entry 5415 (class 0 OID 0)
-- Dependencies: 283
-- Name: TABLE data_submission; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.data_submission TO radx_user;


--
-- TOC entry 5417 (class 0 OID 0)
-- Dependencies: 282
-- Name: SEQUENCE data_submission_id_seq; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON SEQUENCE public.data_submission_id_seq TO radx_user;


--
-- TOC entry 5418 (class 0 OID 0)
-- Dependencies: 313
-- Name: TABLE datafile_harmonization_metrics; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.datafile_harmonization_metrics TO radx_user;


--
-- TOC entry 5420 (class 0 OID 0)
-- Dependencies: 312
-- Name: SEQUENCE datafile_harmonization_metrics_id_seq; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON SEQUENCE public.datafile_harmonization_metrics_id_seq TO radx_user;


--
-- TOC entry 5421 (class 0 OID 0)
-- Dependencies: 252
-- Name: TABLE entity_property; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.entity_property TO radx_user;


--
-- TOC entry 5422 (class 0 OID 0)
-- Dependencies: 254
-- Name: TABLE entity_property_display_setting; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.entity_property_display_setting TO radx_user;


--
-- TOC entry 5425 (class 0 OID 0)
-- Dependencies: 295
-- Name: TABLE entity_property_mta_mapping; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.entity_property_mta_mapping TO radx_user;


--
-- TOC entry 5427 (class 0 OID 0)
-- Dependencies: 294
-- Name: SEQUENCE entity_property_mta_mapping_id_seq; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON SEQUENCE public.entity_property_mta_mapping_id_seq TO radx_user;


--
-- TOC entry 5428 (class 0 OID 0)
-- Dependencies: 303
-- Name: TABLE event_link; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.event_link TO radx_user;


--
-- TOC entry 5430 (class 0 OID 0)
-- Dependencies: 302
-- Name: SEQUENCE event_link_id_seq; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON SEQUENCE public.event_link_id_seq TO radx_user;


--
-- TOC entry 5431 (class 0 OID 0)
-- Dependencies: 301
-- Name: TABLE events; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.events TO radx_user;


--
-- TOC entry 5433 (class 0 OID 0)
-- Dependencies: 300
-- Name: SEQUENCE events_id_seq; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON SEQUENCE public.events_id_seq TO radx_user;


--
-- TOC entry 5434 (class 0 OID 0)
-- Dependencies: 398
-- Name: TABLE funding; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.funding TO radx_user;


--
-- TOC entry 5436 (class 0 OID 0)
-- Dependencies: 397
-- Name: SEQUENCE funding_id_seq; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON SEQUENCE public.funding_id_seq TO radx_user;


--
-- TOC entry 5437 (class 0 OID 0)
-- Dependencies: 330
-- Name: TABLE hub_content_metrics; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.hub_content_metrics TO radx_user;


--
-- TOC entry 5439 (class 0 OID 0)
-- Dependencies: 329
-- Name: SEQUENCE hub_content_metrics_id_seq; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON SEQUENCE public.hub_content_metrics_id_seq TO radx_user;


--
-- TOC entry 5440 (class 0 OID 0)
-- Dependencies: 258
-- Name: TABLE institution; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.institution TO radx_user;


--
-- TOC entry 5442 (class 0 OID 0)
-- Dependencies: 257
-- Name: SEQUENCE institution_id_seq; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT SELECT,USAGE ON SEQUENCE public.institution_id_seq TO radx_user;


--
-- TOC entry 5443 (class 0 OID 0)
-- Dependencies: 270
-- Name: TABLE jwt_token; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT SELECT,INSERT,UPDATE ON TABLE public.jwt_token TO iam_db_user_dev; --TODO: need to update the the iam user 
GRANT ALL ON TABLE public.jwt_token TO radx_user;


--
-- TOC entry 5445 (class 0 OID 0)
-- Dependencies: 269
-- Name: SEQUENCE jwt_token_id_seq; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON SEQUENCE public.jwt_token_id_seq TO radx_user;


--
-- TOC entry 5446 (class 0 OID 0)
-- Dependencies: 289
-- Name: TABLE lkup_cde_codelist; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.lkup_cde_codelist TO radx_user;


--
-- TOC entry 5448 (class 0 OID 0)
-- Dependencies: 288
-- Name: SEQUENCE lkup_cde_codelist_id_seq; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON SEQUENCE public.lkup_cde_codelist_id_seq TO radx_user;


--
-- TOC entry 5449 (class 0 OID 0)
-- Dependencies: 291
-- Name: TABLE lkup_cde_codelist_value; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.lkup_cde_codelist_value TO radx_user;


--
-- TOC entry 5451 (class 0 OID 0)
-- Dependencies: 290
-- Name: SEQUENCE lkup_cde_codelist_value_id_seq; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON SEQUENCE public.lkup_cde_codelist_value_id_seq TO radx_user;


--
-- TOC entry 5452 (class 0 OID 0)
-- Dependencies: 222
-- Name: TABLE lkup_country; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.lkup_country TO radx_user;


--
-- TOC entry 5454 (class 0 OID 0)
-- Dependencies: 234
-- Name: TABLE lkup_data_file_category; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.lkup_data_file_category TO radx_user;


--
-- TOC entry 5456 (class 0 OID 0)
-- Dependencies: 236
-- Name: TABLE lkup_center; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.lkup_center TO radx_user;


--
-- TOC entry 5458 (class 0 OID 0)
-- Dependencies: 238
-- Name: TABLE lkup_entity_type; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.lkup_entity_type TO radx_user;


--
-- TOC entry 5460 (class 0 OID 0)
-- Dependencies: 297
-- Name: TABLE lkup_event_type; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.lkup_event_type TO radx_user;


--
-- TOC entry 5462 (class 0 OID 0)
-- Dependencies: 296
-- Name: SEQUENCE lkup_event_type_id_seq; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON SEQUENCE public.lkup_event_type_id_seq TO radx_user;


--
-- TOC entry 5463 (class 0 OID 0)
-- Dependencies: 240
-- Name: TABLE lkup_file_type; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.lkup_file_type TO radx_user;


--
-- TOC entry 5465 (class 0 OID 0)
-- Dependencies: 224
-- Name: TABLE lkup_institution_type; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.lkup_institution_type TO radx_user;


--
-- TOC entry 5467 (class 0 OID 0)
-- Dependencies: 309
-- Name: TABLE lkup_metrics_report_type; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.lkup_metrics_report_type TO radx_user;


--
-- TOC entry 5469 (class 0 OID 0)
-- Dependencies: 308
-- Name: SEQUENCE lkup_metrics_report_type_id_seq; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON SEQUENCE public.lkup_metrics_report_type_id_seq TO radx_user;


--
-- TOC entry 5470 (class 0 OID 0)
-- Dependencies: 299
-- Name: TABLE lkup_news_type; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.lkup_news_type TO radx_user;


--
-- TOC entry 5472 (class 0 OID 0)
-- Dependencies: 298
-- Name: SEQUENCE lkup_news_type_id_seq; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON SEQUENCE public.lkup_news_type_id_seq TO radx_user;


--
-- TOC entry 5473 (class 0 OID 0)
-- Dependencies: 230
-- Name: TABLE lkup_property_codelist; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.lkup_property_codelist TO radx_user;


--
-- TOC entry 5475 (class 0 OID 0)
-- Dependencies: 232
-- Name: TABLE lkup_property_codelist_value; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.lkup_property_codelist_value TO radx_user;


--
-- TOC entry 5477 (class 0 OID 0)
-- Dependencies: 244
-- Name: TABLE lkup_property_source; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.lkup_property_source TO radx_user;


--
-- TOC entry 5479 (class 0 OID 0)
-- Dependencies: 242
-- Name: TABLE lkup_property_type; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.lkup_property_type TO radx_user;


--
-- TOC entry 5481 (class 0 OID 0)
-- Dependencies: 415
-- Name: TABLE lkup_referrer; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.lkup_referrer TO radx_user;


--
-- TOC entry 5483 (class 0 OID 0)
-- Dependencies: 414
-- Name: SEQUENCE lkup_referrer_id_seq; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON SEQUENCE public.lkup_referrer_id_seq TO radx_user;


--
-- TOC entry 5484 (class 0 OID 0)
-- Dependencies: 262
-- Name: TABLE lkup_researcher_level; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.lkup_researcher_level TO radx_user;


--
-- TOC entry 5486 (class 0 OID 0)
-- Dependencies: 315
-- Name: TABLE lkup_resolution_type; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.lkup_resolution_type TO radx_user;


--
-- TOC entry 5488 (class 0 OID 0)
-- Dependencies: 314
-- Name: SEQUENCE lkup_resolution_type_id_seq; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON SEQUENCE public.lkup_resolution_type_id_seq TO radx_user;


--
-- TOC entry 5489 (class 0 OID 0)
-- Dependencies: 260
-- Name: TABLE lkup_role; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.lkup_role TO radx_user;


--
-- TOC entry 5491 (class 0 OID 0)
-- Dependencies: 226
-- Name: TABLE lkup_state; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.lkup_state TO radx_user;


--
-- TOC entry 5493 (class 0 OID 0)
-- Dependencies: 228
-- Name: TABLE lkup_status; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.lkup_status TO radx_user;


--
-- TOC entry 5495 (class 0 OID 0)
-- Dependencies: 246
-- Name: TABLE lkup_submission_step; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.lkup_submission_step TO radx_user;


--
-- TOC entry 5497 (class 0 OID 0)
-- Dependencies: 317
-- Name: TABLE lkup_support_request_type; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.lkup_support_request_type TO radx_user;


--
-- TOC entry 5499 (class 0 OID 0)
-- Dependencies: 316
-- Name: SEQUENCE lkup_support_request_type_id_seq; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON SEQUENCE public.lkup_support_request_type_id_seq TO radx_user;


--
-- TOC entry 5500 (class 0 OID 0)
-- Dependencies: 428
-- Name: TABLE lkup_variable_category; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.lkup_variable_category TO radx_user;


--
-- TOC entry 5501 (class 0 OID 0)
-- Dependencies: 419
-- Name: TABLE lkup_variable_datatype; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.lkup_variable_datatype TO radx_user;


--
-- TOC entry 5502 (class 0 OID 0)
-- Dependencies: 287
-- Name: TABLE lkup_variable_type; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.lkup_variable_type TO radx_user;


--
-- TOC entry 5504 (class 0 OID 0)
-- Dependencies: 286
-- Name: SEQUENCE lkup_variable_type_id_seq; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON SEQUENCE public.lkup_variable_type_id_seq TO radx_user;


--
-- TOC entry 5505 (class 0 OID 0)
-- Dependencies: 277
-- Name: TABLE lkup_workbench_interest; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.lkup_workbench_interest TO radx_user;


--
-- TOC entry 5507 (class 0 OID 0)
-- Dependencies: 276
-- Name: SEQUENCE lkup_workbench_interest_id_seq; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON SEQUENCE public.lkup_workbench_interest_id_seq TO radx_user;


--
-- TOC entry 5508 (class 0 OID 0)
-- Dependencies: 311
-- Name: TABLE metrics_report; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.metrics_report TO radx_user;


--
-- TOC entry 5510 (class 0 OID 0)
-- Dependencies: 310
-- Name: SEQUENCE metrics_report_id_seq; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON SEQUENCE public.metrics_report_id_seq TO radx_user;


--
-- TOC entry 5511 (class 0 OID 0)
-- Dependencies: 305
-- Name: TABLE news; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.news TO radx_user;


--
-- TOC entry 5513 (class 0 OID 0)
-- Dependencies: 304
-- Name: SEQUENCE news_id_seq; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON SEQUENCE public.news_id_seq TO radx_user;


--
-- TOC entry 5514 (class 0 OID 0)
-- Dependencies: 307
-- Name: TABLE news_link; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.news_link TO radx_user;


--
-- TOC entry 5516 (class 0 OID 0)
-- Dependencies: 306
-- Name: SEQUENCE news_link_id_seq; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON SEQUENCE public.news_link_id_seq TO radx_user;


--
-- TOC entry 5517 (class 0 OID 0)
-- Dependencies: 400
-- Name: TABLE newsletter; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.newsletter TO radx_user;


--
-- TOC entry 5519 (class 0 OID 0)
-- Dependencies: 399
-- Name: SEQUENCE newsletter_id_seq; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON SEQUENCE public.newsletter_id_seq TO radx_user;


--
-- TOC entry 5520 (class 0 OID 0)
-- Dependencies: 340
-- Name: TABLE public_data; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.public_data TO radx_user;


--
-- TOC entry 5521 (class 0 OID 0)
-- Dependencies: 338
-- Name: TABLE public_data_collection; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.public_data_collection TO radx_user;


--
-- TOC entry 5523 (class 0 OID 0)
-- Dependencies: 337
-- Name: SEQUENCE public_data_collection_id_seq; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON SEQUENCE public.public_data_collection_id_seq TO radx_user;


--
-- TOC entry 5525 (class 0 OID 0)
-- Dependencies: 339
-- Name: SEQUENCE public_data_id_seq; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON SEQUENCE public.public_data_id_seq TO radx_user;


--
-- TOC entry 5526 (class 0 OID 0)
-- Dependencies: 268
-- Name: TABLE ras_tracking; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.ras_tracking TO radx_user;


--
-- TOC entry 5528 (class 0 OID 0)
-- Dependencies: 267
-- Name: SEQUENCE ras_tracking_id_seq; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT SELECT,USAGE ON SEQUENCE public.ras_tracking_id_seq TO radx_user;


--
-- TOC entry 5529 (class 0 OID 0)
-- Dependencies: 248
-- Name: TABLE s3_file; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.s3_file TO radx_user;


--
-- TOC entry 5531 (class 0 OID 0)
-- Dependencies: 247
-- Name: SEQUENCE s3_file_id_seq; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON SEQUENCE public.s3_file_id_seq TO radx_user;


--
-- TOC entry 5532 (class 0 OID 0)
-- Dependencies: 387
-- Name: TABLE sas_data_file; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.sas_data_file TO radx_user;


--
-- TOC entry 5534 (class 0 OID 0)
-- Dependencies: 386
-- Name: SEQUENCE sas_data_file_id_seq; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON SEQUENCE public.sas_data_file_id_seq TO radx_user;


--
-- TOC entry 5535 (class 0 OID 0)
-- Dependencies: 389
-- Name: TABLE sas_file_download; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.sas_file_download TO radx_user;


--
-- TOC entry 5537 (class 0 OID 0)
-- Dependencies: 388
-- Name: SEQUENCE sas_file_download_id_seq; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON SEQUENCE public.sas_file_download_id_seq TO radx_user;


--
-- TOC entry 5538 (class 0 OID 0)
-- Dependencies: 402
-- Name: TABLE search_log; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.search_log TO radx_user;


--
-- TOC entry 5540 (class 0 OID 0)
-- Dependencies: 401
-- Name: SEQUENCE search_log_id_seq; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON SEQUENCE public.search_log_id_seq TO radx_user;


--
-- TOC entry 5541 (class 0 OID 0)
-- Dependencies: 250
-- Name: TABLE study; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.study TO radx_user;


--
-- TOC entry 5542 (class 0 OID 0)
-- Dependencies: 321
-- Name: TABLE study_harmonization_metrics; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.study_harmonization_metrics TO radx_user;


--
-- TOC entry 5544 (class 0 OID 0)
-- Dependencies: 320
-- Name: SEQUENCE study_harmonization_metrics_id_seq; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON SEQUENCE public.study_harmonization_metrics_id_seq TO radx_user;


--
-- TOC entry 5546 (class 0 OID 0)
-- Dependencies: 249
-- Name: SEQUENCE study_id_seq; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON SEQUENCE public.study_id_seq TO radx_user;


--
-- TOC entry 5547 (class 0 OID 0)
-- Dependencies: 256
-- Name: TABLE study_property_value; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.study_property_value TO radx_user;


--
-- TOC entry 5549 (class 0 OID 0)
-- Dependencies: 255
-- Name: SEQUENCE study_property_value_id_seq; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT SELECT,USAGE ON SEQUENCE public.study_property_value_id_seq TO radx_user;


--
-- TOC entry 5550 (class 0 OID 0)
-- Dependencies: 319
-- Name: TABLE support_request; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.support_request TO radx_user;


--
-- TOC entry 5552 (class 0 OID 0)
-- Dependencies: 318
-- Name: SEQUENCE support_request_id_seq; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON SEQUENCE public.support_request_id_seq TO radx_user;


--
-- TOC entry 5553 (class 0 OID 0)
-- Dependencies: 406
-- Name: TABLE tier_1_variable; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.tier_1_variable TO radx_user;


--
-- TOC entry 5555 (class 0 OID 0)
-- Dependencies: 405
-- Name: SEQUENCE tier_1_variable_id_seq; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON SEQUENCE public.tier_1_variable_id_seq TO radx_user;


--
-- TOC entry 5556 (class 0 OID 0)
-- Dependencies: 437
-- Name: TABLE tier_1_variable_mapping_json; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.tier_1_variable_mapping_json TO radx_user;


--
-- TOC entry 5558 (class 0 OID 0)
-- Dependencies: 436
-- Name: SEQUENCE tier_1_variable_mapping_json_id_seq; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON SEQUENCE public.tier_1_variable_mapping_json_id_seq TO radx_user;


--
-- TOC entry 5559 (class 0 OID 0)
-- Dependencies: 404
-- Name: TABLE tier_1_variable_terms; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.tier_1_variable_terms TO radx_user;


--
-- TOC entry 5561 (class 0 OID 0)
-- Dependencies: 403
-- Name: SEQUENCE tier_1_variable_terms_id_seq; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON SEQUENCE public.tier_1_variable_terms_id_seq TO radx_user;


--
-- TOC entry 5562 (class 0 OID 0)
-- Dependencies: 412
-- Name: TABLE user_file_upload; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.user_file_upload TO radx_user;


--
-- TOC entry 5564 (class 0 OID 0)
-- Dependencies: 411
-- Name: SEQUENCE user_file_upload_id_seq; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON SEQUENCE public.user_file_upload_id_seq TO radx_user;


--
-- TOC entry 5565 (class 0 OID 0)
-- Dependencies: 275
-- Name: TABLE user_login; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.user_login TO radx_user;


--
-- TOC entry 5567 (class 0 OID 0)
-- Dependencies: 274
-- Name: SEQUENCE user_login_id_seq; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON SEQUENCE public.user_login_id_seq TO radx_user;


--
-- TOC entry 5568 (class 0 OID 0)
-- Dependencies: 272
-- Name: TABLE user_ras; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.user_ras TO radx_user;


--
-- TOC entry 5570 (class 0 OID 0)
-- Dependencies: 271
-- Name: SEQUENCE user_ras_id_seq; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON SEQUENCE public.user_ras_id_seq TO radx_user;


--
-- TOC entry 5571 (class 0 OID 0)
-- Dependencies: 417
-- Name: TABLE user_referrer; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.user_referrer TO radx_user;


--
-- TOC entry 5573 (class 0 OID 0)
-- Dependencies: 416
-- Name: SEQUENCE user_referrer_id_seq; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON SEQUENCE public.user_referrer_id_seq TO radx_user;


--
-- TOC entry 5574 (class 0 OID 0)
-- Dependencies: 266
-- Name: TABLE user_role; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.user_role TO radx_user;


--
-- TOC entry 5576 (class 0 OID 0)
-- Dependencies: 265
-- Name: SEQUENCE user_role_id_seq; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT SELECT,USAGE ON SEQUENCE public.user_role_id_seq TO radx_user;


--
-- TOC entry 5577 (class 0 OID 0)
-- Dependencies: 426
-- Name: TABLE user_workspace; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.user_workspace TO radx_user;


--
-- TOC entry 5579 (class 0 OID 0)
-- Dependencies: 425
-- Name: SEQUENCE user_workspace_id_seq; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON SEQUENCE public.user_workspace_id_seq TO radx_user;


--
-- TOC entry 5580 (class 0 OID 0)
-- Dependencies: 264
-- Name: TABLE users; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.users TO radx_user;


--
-- TOC entry 5582 (class 0 OID 0)
-- Dependencies: 263
-- Name: SEQUENCE users_id_seq; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON SEQUENCE public.users_id_seq TO radx_user;


--
-- TOC entry 5583 (class 0 OID 0)
-- Dependencies: 435
-- Name: TABLE variable_mapping; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.variable_mapping TO radx_user;


--
-- TOC entry 5585 (class 0 OID 0)
-- Dependencies: 434
-- Name: SEQUENCE variable_mapping_id_seq; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON SEQUENCE public.variable_mapping_id_seq TO radx_user;


--
-- TOC entry 5586 (class 0 OID 0)
-- Dependencies: 421
-- Name: TABLE variable_permissible_values; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.variable_permissible_values TO radx_user;


--
-- TOC entry 5588 (class 0 OID 0)
-- Dependencies: 420
-- Name: SEQUENCE variable_permissible_values_id_seq; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON SEQUENCE public.variable_permissible_values_id_seq TO radx_user;


--
-- TOC entry 5589 (class 0 OID 0)
-- Dependencies: 423
-- Name: TABLE variable_property_value; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.variable_property_value TO radx_user;


--
-- TOC entry 5591 (class 0 OID 0)
-- Dependencies: 422
-- Name: SEQUENCE variable_property_value_id_seq; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON SEQUENCE public.variable_property_value_id_seq TO radx_user;


--
-- TOC entry 5592 (class 0 OID 0)
-- Dependencies: 430
-- Name: TABLE variables; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.variables TO radx_user;


--
-- TOC entry 5594 (class 0 OID 0)
-- Dependencies: 429
-- Name: SEQUENCE variables_id_seq; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON SEQUENCE public.variables_id_seq TO radx_user;


--
-- TOC entry 5595 (class 0 OID 0)
-- Dependencies: 385
-- Name: TABLE view_current_data_file; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.view_current_data_file TO radx_user;


--
-- TOC entry 5596 (class 0 OID 0)
-- Dependencies: 334
-- Name: TABLE view_current_hub_content; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.view_current_hub_content TO radx_user;


--
-- TOC entry 5597 (class 0 OID 0)
-- Dependencies: 336
-- Name: TABLE view_current_hub_content_data; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.view_current_hub_content_data TO radx_user;


--
-- TOC entry 5598 (class 0 OID 0)
-- Dependencies: 432
-- Name: TABLE view_data_file_variables; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.view_data_file_variables TO radx_user;


--
-- TOC entry 5599 (class 0 OID 0)
-- Dependencies: 431
-- Name: TABLE view_study_variables; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.view_study_variables TO radx_user;


--
-- TOC entry 5600 (class 0 OID 0)
-- Dependencies: 433
-- Name: TABLE view_study_for_es; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.view_study_for_es TO radx_user;


--
-- TOC entry 5601 (class 0 OID 0)
-- Dependencies: 325
-- Name: TABLE view_study_property_value_display; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.view_study_property_value_display TO radx_user;


--
-- TOC entry 5602 (class 0 OID 0)
-- Dependencies: 335
-- Name: TABLE view_submission_activity; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.view_submission_activity TO radx_user;


--
-- TOC entry 5603 (class 0 OID 0)
-- Dependencies: 427
-- Name: TABLE view_user_population; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.view_user_population TO radx_user;


--
-- TOC entry 5604 (class 0 OID 0)
-- Dependencies: 396
-- Name: TABLE view_user_role; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.view_user_role TO radx_user;


--
-- TOC entry 5605 (class 0 OID 0)
-- Dependencies: 424
-- Name: TABLE view_variable_overview_display; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.view_variable_overview_display TO radx_user;


--
-- TOC entry 5606 (class 0 OID 0)
-- Dependencies: 332
-- Name: TABLE weekly_hub_content_data; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.weekly_hub_content_data TO radx_user;


--
-- TOC entry 5608 (class 0 OID 0)
-- Dependencies: 331
-- Name: SEQUENCE weekly_hub_content_data_id_seq; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON SEQUENCE public.weekly_hub_content_data_id_seq TO radx_user;


--
-- TOC entry 5609 (class 0 OID 0)
-- Dependencies: 279
-- Name: TABLE workbench_request; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.workbench_request TO radx_user;


--
-- TOC entry 5611 (class 0 OID 0)
-- Dependencies: 278
-- Name: SEQUENCE workbench_request_id_seq; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON SEQUENCE public.workbench_request_id_seq TO radx_user;


--
-- TOC entry 5612 (class 0 OID 0)
-- Dependencies: 281
-- Name: TABLE workbench_request_interest; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON TABLE public.workbench_request_interest TO radx_user;


--
-- TOC entry 5614 (class 0 OID 0)
-- Dependencies: 280
-- Name: SEQUENCE workbench_request_interest_id_seq; Type: ACL; Schema: public; Owner: radx_admin
--

GRANT ALL ON SEQUENCE public.workbench_request_interest_id_seq TO radx_user;


--
-- TOC entry 5615 (class 0 OID 0)
-- Dependencies: 379
-- Name: TABLE data_file_history; Type: ACL; Schema: radx_history; Owner: radx_admin
--

GRANT SELECT,INSERT ON TABLE radx_history.data_file_history TO radx_user;


--
-- TOC entry 5616 (class 0 OID 0)
-- Dependencies: 382
-- Name: TABLE data_submission_history; Type: ACL; Schema: radx_history; Owner: radx_admin
--

GRANT SELECT,INSERT ON TABLE radx_history.data_submission_history TO radx_user;


--
-- TOC entry 5617 (class 0 OID 0)
-- Dependencies: 390
-- Name: TABLE institution_history; Type: ACL; Schema: radx_history; Owner: radx_admin
--

GRANT SELECT,INSERT ON TABLE radx_history.institution_history TO radx_user;


--
-- TOC entry 5618 (class 0 OID 0)
-- Dependencies: 273
-- Name: TABLE ras_tracking_history; Type: ACL; Schema: radx_history; Owner: radx_admin
--

GRANT SELECT,INSERT,UPDATE ON TABLE radx_history.ras_tracking_history TO radx_user;


--
-- TOC entry 5619 (class 0 OID 0)
-- Dependencies: 380
-- Name: TABLE s3_file_history; Type: ACL; Schema: radx_history; Owner: radx_admin
--

GRANT SELECT,INSERT ON TABLE radx_history.s3_file_history TO radx_user;


--
-- TOC entry 5620 (class 0 OID 0)
-- Dependencies: 395
-- Name: TABLE sas_data_file_history; Type: ACL; Schema: radx_history; Owner: radx_admin
--

GRANT SELECT,INSERT ON TABLE radx_history.sas_data_file_history TO radx_user;


--
-- TOC entry 5621 (class 0 OID 0)
-- Dependencies: 381
-- Name: TABLE study_history; Type: ACL; Schema: radx_history; Owner: radx_admin
--

GRANT SELECT,INSERT ON TABLE radx_history.study_history TO radx_user;


--
-- TOC entry 5622 (class 0 OID 0)
-- Dependencies: 383
-- Name: TABLE study_property_value_history; Type: ACL; Schema: radx_history; Owner: radx_admin
--

GRANT SELECT,INSERT ON TABLE radx_history.study_property_value_history TO radx_user;


--
-- TOC entry 5623 (class 0 OID 0)
-- Dependencies: 391
-- Name: TABLE support_request_history; Type: ACL; Schema: radx_history; Owner: radx_admin
--

GRANT SELECT,INSERT ON TABLE radx_history.support_request_history TO radx_user;


--
-- TOC entry 5624 (class 0 OID 0)
-- Dependencies: 413
-- Name: TABLE user_file_upload_history; Type: ACL; Schema: radx_history; Owner: radx_admin
--

GRANT SELECT,INSERT ON TABLE radx_history.user_file_upload_history TO radx_user;


--
-- TOC entry 5625 (class 0 OID 0)
-- Dependencies: 418
-- Name: TABLE user_referrer_history; Type: ACL; Schema: radx_history; Owner: radx_admin
--

GRANT SELECT,INSERT ON TABLE radx_history.user_referrer_history TO radx_user;


--
-- TOC entry 5626 (class 0 OID 0)
-- Dependencies: 392
-- Name: TABLE user_role_history; Type: ACL; Schema: radx_history; Owner: radx_admin
--

GRANT SELECT,INSERT ON TABLE radx_history.user_role_history TO radx_user;


--
-- TOC entry 5627 (class 0 OID 0)
-- Dependencies: 384
-- Name: TABLE users_history; Type: ACL; Schema: radx_history; Owner: radx_admin
--

GRANT SELECT,INSERT ON TABLE radx_history.users_history TO radx_user;


--
-- TOC entry 5628 (class 0 OID 0)
-- Dependencies: 393
-- Name: TABLE workbench_request_history; Type: ACL; Schema: radx_history; Owner: radx_admin
--

GRANT SELECT,INSERT ON TABLE radx_history.workbench_request_history TO radx_user;


--
-- TOC entry 5629 (class 0 OID 0)
-- Dependencies: 394
-- Name: TABLE workbench_request_interest_history; Type: ACL; Schema: radx_history; Owner: radx_admin
--

GRANT SELECT,INSERT ON TABLE radx_history.workbench_request_interest_history TO radx_user;


--
-- TOC entry 2750 (class 826 OID 16822)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: radx_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE radx_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO radx_user;


--
-- TOC entry 2749 (class 826 OID 16823)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: radx_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE radx_admin IN SCHEMA public GRANT ALL ON TABLES TO radx_user;


-- Completed on 2025-06-24 07:28:04

--
-- PostgreSQL database dump complete
--

