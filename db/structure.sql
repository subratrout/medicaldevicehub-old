--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: unaccent; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;


--
-- Name: EXTENSION unaccent; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: active_admin_comments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE active_admin_comments (
    id integer NOT NULL,
    namespace character varying(255),
    body text,
    resource_id character varying(255) NOT NULL,
    resource_type character varying(255) NOT NULL,
    author_id integer,
    author_type character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE active_admin_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE active_admin_comments_id_seq OWNED BY active_admin_comments.id;


--
-- Name: admin_users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE admin_users (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    username character varying(255)
);


--
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE admin_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE admin_users_id_seq OWNED BY admin_users.id;


--
-- Name: classifications; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE classifications (
    id integer NOT NULL,
    review_panel character varying(255),
    medical_speciality character varying(255),
    product_code character varying(255),
    device_generic_name character varying(255),
    device_class character varying(255),
    unclassified_reason_code character varying(255),
    gmp_exempt_flag character varying(255),
    third_party_review_eligible character varying(255),
    third_party_review_code character varying(255),
    regulation_number character varying(255),
    submission_type_id character varying(255),
    definition text,
    physical_state text,
    technical_method text,
    target_area text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: classifications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE classifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: classifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE classifications_id_seq OWNED BY classifications.id;


--
-- Name: device_reviews; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE device_reviews (
    id integer NOT NULL,
    content text,
    user_id integer,
    medicaldevice_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: device_reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE device_reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: device_reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE device_reviews_id_seq OWNED BY device_reviews.id;


--
-- Name: manufacturers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE manufacturers (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: manufacturers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE manufacturers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: manufacturers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE manufacturers_id_seq OWNED BY manufacturers.id;


--
-- Name: medicaldevices; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE medicaldevices (
    id integer NOT NULL,
    pmak_number text,
    applicant text,
    street1 text,
    street2 text,
    city text,
    state text,
    zip text,
    generic_name text,
    trade_name text,
    product_code text,
    advisory_committee text,
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    image text,
    manufacturer_id integer
);


--
-- Name: medicaldevices_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE medicaldevices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: medicaldevices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE medicaldevices_id_seq OWNED BY medicaldevices.id;


--
-- Name: pg_search_documents; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pg_search_documents (
    id integer NOT NULL,
    content text,
    searchable_id integer,
    searchable_type character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: pg_search_documents_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pg_search_documents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pg_search_documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pg_search_documents_id_seq OWNED BY pg_search_documents.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    username character varying(255)
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY active_admin_comments ALTER COLUMN id SET DEFAULT nextval('active_admin_comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY admin_users ALTER COLUMN id SET DEFAULT nextval('admin_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY classifications ALTER COLUMN id SET DEFAULT nextval('classifications_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY device_reviews ALTER COLUMN id SET DEFAULT nextval('device_reviews_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY manufacturers ALTER COLUMN id SET DEFAULT nextval('manufacturers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY medicaldevices ALTER COLUMN id SET DEFAULT nextval('medicaldevices_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pg_search_documents ALTER COLUMN id SET DEFAULT nextval('pg_search_documents_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: active_admin_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY active_admin_comments
    ADD CONSTRAINT active_admin_comments_pkey PRIMARY KEY (id);


--
-- Name: admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- Name: classifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY classifications
    ADD CONSTRAINT classifications_pkey PRIMARY KEY (id);


--
-- Name: device_reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY device_reviews
    ADD CONSTRAINT device_reviews_pkey PRIMARY KEY (id);


--
-- Name: manufacturers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY manufacturers
    ADD CONSTRAINT manufacturers_pkey PRIMARY KEY (id);


--
-- Name: medicaldevices_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY medicaldevices
    ADD CONSTRAINT medicaldevices_pkey PRIMARY KEY (id);


--
-- Name: pg_search_documents_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pg_search_documents
    ADD CONSTRAINT pg_search_documents_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: applicant; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX applicant ON medicaldevices USING gin (to_tsvector('english'::regconfig, applicant));


--
-- Name: description; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX description ON medicaldevices USING gin (to_tsvector('english'::regconfig, description));


--
-- Name: generic_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX generic_name ON medicaldevices USING gin (to_tsvector('english'::regconfig, generic_name));


--
-- Name: index_active_admin_comments_on_author_type_and_author_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_active_admin_comments_on_author_type_and_author_id ON active_admin_comments USING btree (author_type, author_id);


--
-- Name: index_active_admin_comments_on_namespace; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_active_admin_comments_on_namespace ON active_admin_comments USING btree (namespace);


--
-- Name: index_active_admin_comments_on_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_active_admin_comments_on_resource_type_and_resource_id ON active_admin_comments USING btree (resource_type, resource_id);


--
-- Name: index_admin_users_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_admin_users_on_email ON admin_users USING btree (email);


--
-- Name: index_admin_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_admin_users_on_reset_password_token ON admin_users USING btree (reset_password_token);


--
-- Name: index_classifications_on_device_generic_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_classifications_on_device_generic_name ON classifications USING btree (device_generic_name);


--
-- Name: index_classifications_on_medical_speciality; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_classifications_on_medical_speciality ON classifications USING btree (medical_speciality);


--
-- Name: index_classifications_on_product_code; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_classifications_on_product_code ON classifications USING btree (product_code);


--
-- Name: index_classifications_on_regulation_number; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_classifications_on_regulation_number ON classifications USING btree (regulation_number);


--
-- Name: index_classifications_on_third_party_review_code; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_classifications_on_third_party_review_code ON classifications USING btree (third_party_review_code);


--
-- Name: index_classifications_on_unclassified_reason_code; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_classifications_on_unclassified_reason_code ON classifications USING btree (unclassified_reason_code);


--
-- Name: index_device_reviews_on_content; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_device_reviews_on_content ON device_reviews USING btree (content);


--
-- Name: index_device_reviews_on_medicaldevice_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_device_reviews_on_medicaldevice_id ON device_reviews USING btree (medicaldevice_id);


--
-- Name: index_device_reviews_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_device_reviews_on_user_id ON device_reviews USING btree (user_id);


--
-- Name: index_manufacturers_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_manufacturers_on_email ON manufacturers USING btree (email);


--
-- Name: index_manufacturers_on_reset_password_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_manufacturers_on_reset_password_token ON manufacturers USING btree (reset_password_token);


--
-- Name: index_medicaldevices_on_manufacturer_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_medicaldevices_on_manufacturer_id ON medicaldevices USING btree (manufacturer_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: trade_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX trade_name ON medicaldevices USING gin (to_tsvector('english'::regconfig, trade_name));


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20130712055232');

INSERT INTO schema_migrations (version) VALUES ('20130713061454');

INSERT INTO schema_migrations (version) VALUES ('20130902014531');

INSERT INTO schema_migrations (version) VALUES ('20130907201613');

INSERT INTO schema_migrations (version) VALUES ('20130910223708');

INSERT INTO schema_migrations (version) VALUES ('20130927060017');

INSERT INTO schema_migrations (version) VALUES ('20130927082827');

INSERT INTO schema_migrations (version) VALUES ('20130927082849');

INSERT INTO schema_migrations (version) VALUES ('20130927090116');

INSERT INTO schema_migrations (version) VALUES ('20130927090123');

INSERT INTO schema_migrations (version) VALUES ('20130927103519');

INSERT INTO schema_migrations (version) VALUES ('20130927103525');

INSERT INTO schema_migrations (version) VALUES ('20131009234559');

INSERT INTO schema_migrations (version) VALUES ('20131010054053');

INSERT INTO schema_migrations (version) VALUES ('20131012164630');

INSERT INTO schema_migrations (version) VALUES ('20131013231443');

INSERT INTO schema_migrations (version) VALUES ('20131029060504');

INSERT INTO schema_migrations (version) VALUES ('20131106041514');

INSERT INTO schema_migrations (version) VALUES ('20140228002553');
