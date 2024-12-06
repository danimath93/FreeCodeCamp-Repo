--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(40) NOT NULL,
    galaxy_id integer NOT NULL,
    age_milion_years integer,
    diameter numeric,
    galaxy_type character varying(40),
    description text
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
    name character varying(40) NOT NULL,
    moon_id integer NOT NULL,
    age_milion_years integer,
    planet_id integer,
    diameter numeric,
    weight numeric,
    dist_from_planet numeric
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(40) NOT NULL,
    planet_id integer NOT NULL,
    age_milion_years integer,
    diameter numeric,
    weight numeric,
    dist_from_hearth numeric,
    has_water boolean,
    star_id integer
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
-- Name: population; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.population (
    population_id integer NOT NULL,
    name character varying(40) NOT NULL,
    individual_count integer,
    thousand_year_age integer,
    moon_id integer,
    planet_id integer
);


ALTER TABLE public.population OWNER TO freecodecamp;

--
-- Name: population_population_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.population_population_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.population_population_id_seq OWNER TO freecodecamp;

--
-- Name: population_population_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.population_population_id_seq OWNED BY public.population.population_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(40) NOT NULL,
    star_id integer NOT NULL,
    is_living boolean,
    is_spherical boolean,
    age_milion_years integer,
    diameter numeric,
    dist_from_hearth numeric,
    galaxy_id integer
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
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: population population_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.population ALTER COLUMN population_id SET DEFAULT nextval('public.population_population_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('horus', 1, 140000, 100, 'brown', NULL);
INSERT INTO public.galaxy VALUES ('milky', 2, 200000, 100, 'white', NULL);
INSERT INTO public.galaxy VALUES ('anubi', 3, 100000, 100, 'black', NULL);
INSERT INTO public.galaxy VALUES ('iside', 4, 110000, 100, 'yellow', NULL);
INSERT INTO public.galaxy VALUES ('osiride', 5, 120000, 100, 'blue', NULL);
INSERT INTO public.galaxy VALUES ('seth', 6, 130000, 100, 'purple', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Hearth_moon', 1, NULL, 1, NULL, NULL, 999);
INSERT INTO public.moon VALUES ('Mars_moon1', 2, NULL, 4, NULL, NULL, 999);
INSERT INTO public.moon VALUES ('Mars_moon2', 3, NULL, 4, NULL, NULL, 999);
INSERT INTO public.moon VALUES ('Mars_moon3', 4, NULL, 4, NULL, NULL, 999);
INSERT INTO public.moon VALUES ('Mars_moon4', 5, NULL, 4, NULL, NULL, 999);
INSERT INTO public.moon VALUES ('Jupiter_moon1', 6, NULL, 5, NULL, NULL, 999);
INSERT INTO public.moon VALUES ('Jupiter_moon2', 7, NULL, 5, NULL, NULL, 999);
INSERT INTO public.moon VALUES ('Jupiter_moon3', 8, NULL, 5, NULL, NULL, 999);
INSERT INTO public.moon VALUES ('Eris_moon', 9, NULL, 9, NULL, NULL, 999);
INSERT INTO public.moon VALUES ('Pwdaz_moo1', 10, NULL, 12, NULL, NULL, 999);
INSERT INTO public.moon VALUES ('Pwdaz_moo2', 11, NULL, 12, NULL, NULL, 999);
INSERT INTO public.moon VALUES ('Pwdaz_moo3', 12, NULL, 12, NULL, NULL, 999);
INSERT INTO public.moon VALUES ('Pwdaz_moo4', 13, NULL, 12, NULL, NULL, 999);
INSERT INTO public.moon VALUES ('Pwdaz_moo5', 14, NULL, 12, NULL, NULL, 999);
INSERT INTO public.moon VALUES ('Pwdaz_moo6', 15, NULL, 12, NULL, NULL, 999);
INSERT INTO public.moon VALUES ('Pwdaz_moo7', 16, NULL, 12, NULL, NULL, 999);
INSERT INTO public.moon VALUES ('Pwdaz_moo8', 17, NULL, 12, NULL, NULL, 999);
INSERT INTO public.moon VALUES ('Pwdaz_moo9', 18, NULL, 12, NULL, NULL, 999);
INSERT INTO public.moon VALUES ('Pwdaz_moo10', 19, NULL, 12, NULL, NULL, 999);
INSERT INTO public.moon VALUES ('Pwdaz_moo11', 20, NULL, 12, NULL, NULL, 999);
INSERT INTO public.moon VALUES ('Daduz_moonXXX', 21, NULL, 11, NULL, NULL, 999);
INSERT INTO public.moon VALUES ('Daduz_moonXXY', 22, NULL, 11, NULL, NULL, 999);
INSERT INTO public.moon VALUES ('Daduz_moonXXZ', 23, NULL, 11, NULL, NULL, 999);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Hearth', 1, 5000, 2, 5, NULL, true, 4);
INSERT INTO public.planet VALUES ('Mercury', 2, 5000, 2, 5, NULL, false, 4);
INSERT INTO public.planet VALUES ('Venus', 3, 5000, 2, 5, NULL, false, 4);
INSERT INTO public.planet VALUES ('Mars', 4, 5000, 2, 5, NULL, false, 4);
INSERT INTO public.planet VALUES ('Jupiter', 5, 5000, 2, 5, NULL, false, 4);
INSERT INTO public.planet VALUES ('Eros', 7, 5000, 2, 5, NULL, false, 1);
INSERT INTO public.planet VALUES ('Neptune', 8, 5000, 2, 5, NULL, false, 3);
INSERT INTO public.planet VALUES ('Eris', 9, 5000, 2, 5, NULL, false, 1);
INSERT INTO public.planet VALUES ('Ceres', 10, 5000, 2, 5, NULL, false, 1);
INSERT INTO public.planet VALUES ('Daduz', 11, 5000, 2, 5, NULL, false, 5);
INSERT INTO public.planet VALUES ('Pwdaz', 12, 5000, 2, 5, NULL, false, 5);
INSERT INTO public.planet VALUES ('THE PLANET', 13, NULL, 2, 5, NULL, true, 6);


--
-- Data for Name: population; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.population VALUES (1, 'Hearthians', 10, 200, 1, 1);
INSERT INTO public.population VALUES (2, 'Martians', NULL, NULL, 2, 4);
INSERT INTO public.population VALUES (3, 'Superhumans', 0, 0, NULL, NULL);
INSERT INTO public.population VALUES (4, 'Others', 0, 0, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Lynx', 1, true, NULL, 10000, 5, NULL, 2);
INSERT INTO public.star VALUES ('Eridanus', 2, true, NULL, 10000, 5, NULL, 2);
INSERT INTO public.star VALUES ('Cassiopeia', 3, true, NULL, 10000, 5, NULL, 2);
INSERT INTO public.star VALUES ('Sun', 4, true, NULL, 10000, 5, NULL, 2);
INSERT INTO public.star VALUES ('Scorpion', 5, true, NULL, 10000, 5, NULL, 3);
INSERT INTO public.star VALUES ('Crux', 6, true, NULL, 10000, 5, NULL, 4);
INSERT INTO public.star VALUES ('Cancer', 7, true, NULL, 10000, 5, NULL, 4);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: population_population_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.population_population_id_seq', 4, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: population population_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.population
    ADD CONSTRAINT population_name_key UNIQUE (name);


--
-- Name: population population_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.population
    ADD CONSTRAINT population_pkey PRIMARY KEY (population_id);


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
-- Name: population population_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.population
    ADD CONSTRAINT population_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: population population_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.population
    ADD CONSTRAINT population_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

