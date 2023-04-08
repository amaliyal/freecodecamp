--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_type character varying(50),
    description text,
    number_of_stars text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer,
    discovery_year integer,
    discoverer text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: observer; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.observer (
    observer_id integer NOT NULL,
    name character varying(50) NOT NULL,
    office_number integer NOT NULL,
    work_at_weekends boolean NOT NULL,
    phone numeric(11,0)
);


ALTER TABLE public.observer OWNER TO freecodecamp;

--
-- Name: observer_observer_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.observer_observer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.observer_observer_id_seq OWNER TO freecodecamp;

--
-- Name: observer_observer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.observer_observer_id_seq OWNED BY public.observer.observer_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    star_id integer,
    discovery_year integer,
    removal_year integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer,
    mean_distance_from_earth_in_au numeric(6,1),
    age_in_billion_years numeric(3,2),
    is_spherical boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: observer observer_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observer ALTER COLUMN observer_id SET DEFAULT nextval('public.observer_observer_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'the Milky Way', 'spiral', 'about 100,000 light-years across', '100-500 billion');
INSERT INTO public.galaxy VALUES (2, 'the Whirlpool Galaxy', 'spiral', '23.16 million light years', '100 billion');
INSERT INTO public.galaxy VALUES (3, 'the Andromeda Galaxy', '', '2.537 million light years away from Earth', '1 trillion');
INSERT INTO public.galaxy VALUES (4, 'the Backward Galaxy', 'unbarred spiral', '111 million light years away from Earth', '');
INSERT INTO public.galaxy VALUES (5, 'the Black Eye Galaxy', '', '24.01 million light years away from Earth', '100 billion');
INSERT INTO public.galaxy VALUES (6, 'the Cigar Galaxy', '', '11.42 million light years away from Earth', '30 billion');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Metis', 5, 1979, 'Synnott (Voyager 1)');
INSERT INTO public.moon VALUES (2, 'Adrastea', 5, 1979, 'Jewitt (Voyager 2)');
INSERT INTO public.moon VALUES (3, 'Amalthea', 5, 1892, 'Barnard');
INSERT INTO public.moon VALUES (4, 'Thebe', 5, 1979, 'Synnott (Voyager 1)');
INSERT INTO public.moon VALUES (5, 'Naiad', 8, 1989, 'Voyager Science Team');
INSERT INTO public.moon VALUES (6, 'Thalassa', 8, 1989, 'Voyager Science Team');
INSERT INTO public.moon VALUES (7, 'Despina', 8, 1989, 'Voyager Science Team');
INSERT INTO public.moon VALUES (8, 'Galatea', 8, 1989, 'Voyager Science Team');
INSERT INTO public.moon VALUES (9, 'Proteus', 8, 1989, 'Voyager Science Team');
INSERT INTO public.moon VALUES (10, 'Styx', 12, 2012, '');
INSERT INTO public.moon VALUES (11, 'Nix', 12, 2005, '');
INSERT INTO public.moon VALUES (12, 'Kerberos', 12, 2011, '');
INSERT INTO public.moon VALUES (13, 'Hydra', 12, 2005, '');
INSERT INTO public.moon VALUES (14, 'Pan', 6, 1990, 'Showalter');
INSERT INTO public.moon VALUES (15, 'Daphnis', 6, 2005, 'Cassini');
INSERT INTO public.moon VALUES (16, 'Atlas', 6, 1980, 'Voyager 1');
INSERT INTO public.moon VALUES (17, 'Prometheus', 6, 1980, 'Voyager 1');
INSERT INTO public.moon VALUES (18, 'Pandora', 6, 1980, 'Voyager 1');
INSERT INTO public.moon VALUES (19, 'Cordelia', 7, 1986, 'Terrile (Voyager 2)');
INSERT INTO public.moon VALUES (20, 'Ophelia', 7, 1986, 'Terrile (Voyager 2)');


--
-- Data for Name: observer; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.observer VALUES (1, 'Abby', 301, true, 7375678955);
INSERT INTO public.observer VALUES (2, 'Bob', 307, false, 7373454955);
INSERT INTO public.observer VALUES (3, 'Charlie', 311, false, 7379899452);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 1631, NULL);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 1962, NULL);
INSERT INTO public.planet VALUES (3, 'Earth', 1, NULL, NULL);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 1610, NULL);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 1610, NULL);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 1610, NULL);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 1781, NULL);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 1846, NULL);
INSERT INTO public.planet VALUES (9, 'Sun', NULL, NULL, 1543);
INSERT INTO public.planet VALUES (10, 'Moon', 1, NULL, 1543);
INSERT INTO public.planet VALUES (11, 'Eris', 1, 2005, 2006);
INSERT INTO public.planet VALUES (12, 'Pluto', 1, 1930, 2006);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (3, 'Sirius', 1, 8.6, 0.23, NULL);
INSERT INTO public.star VALUES (4, 'Antares', 1, 600.0, 0.01, NULL);
INSERT INTO public.star VALUES (5, 'Bellatrix', 1, 244.6, 0.02, NULL);
INSERT INTO public.star VALUES (6, 'Capella', 1, 42.9, 0.52, NULL);
INSERT INTO public.star VALUES (1, 'Sun', 1, 1.0, 4.60, true);
INSERT INTO public.star VALUES (2, 'Vega', 1, 25.0, 0.45, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: observer_observer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.observer_observer_id_seq', 4, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: observer observer_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observer
    ADD CONSTRAINT observer_name_key UNIQUE (name);


--
-- Name: observer observer_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observer
    ADD CONSTRAINT observer_pkey PRIMARY KEY (observer_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

