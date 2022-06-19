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
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    planet_types integer,
    galaxy_types integer,
    distance_from_earth_in_au numeric(10,2)
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
-- Name: layer; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.layer (
    layer_id integer NOT NULL,
    moon_id integer,
    name character varying(50),
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    planet_types integer,
    galaxy_types integer,
    distance_from_earth_in_au numeric(10,2),
    planet_id integer NOT NULL
);


ALTER TABLE public.layer OWNER TO freecodecamp;

--
-- Name: layer_layer_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.layer_layer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.layer_layer_id_seq OWNER TO freecodecamp;

--
-- Name: layer_layer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.layer_layer_id_seq OWNED BY public.layer.layer_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(50),
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    planet_types integer,
    galaxy_types integer,
    distance_from_earth_in_au numeric(10,2)
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
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    planet_types integer,
    galaxy_types integer,
    distance_from_earth_in_au numeric(10,2)
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
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    planet_types integer,
    galaxy_types integer,
    distance_from_earth_in_au numeric(10,2)
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
-- Name: layer layer_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.layer ALTER COLUMN layer_id SET DEFAULT nextval('public.layer_layer_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Andromena', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'a', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'b', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'c', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'd', NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- Data for Name: layer; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.layer VALUES (1, NULL, 'Andromenasher', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 19);
INSERT INTO public.layer VALUES (2, NULL, 'Mike Wash', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 19);
INSERT INTO public.layer VALUES (3, NULL, 'tdfdvdvfvd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 19);
INSERT INTO public.layer VALUES (4, NULL, 'essfdfvcb', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 19);
INSERT INTO public.layer VALUES (5, NULL, 'fcdf dfve', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 19);
INSERT INTO public.layer VALUES (6, NULL, 'erfsevd cdxfe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 19);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (19, 19, 'Andromenat', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (20, 19, 'Milky Wary', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (21, 19, 't', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (22, 19, 'eb', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (23, 19, 'e', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (24, 19, 'er', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (25, 19, 'Andromenaomt', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (26, 19, 'Milky Wash', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (27, 19, 'tdffvd', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (28, 19, 'escb', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (29, 19, 'fce', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (30, 19, 'erfe', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (31, 19, 'Andromenash', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (32, 19, 'Milk Wash', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (33, 19, 'tdfdvfvd', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (34, 19, 'esdfvcb', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (35, 19, 'fcdfve', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (36, 19, 'erfsedxfe', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (37, 19, 'Andromenasher', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (38, 19, 'Mike Wash', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (39, 19, 'tdfdvdvfvd', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (40, 19, 'essfdfvcb', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (41, 19, 'fcdf dfve', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (42, 19, 'erfsevd cdxfe', NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (19, 2, 'Andromena', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (20, 2, 'Milky Way', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (21, 2, 'a', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (22, 2, 'b', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (23, 2, 'c', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (24, 2, 'd', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (26, 2, 'Andromenat', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (27, 2, 'Milky Wary', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (28, 2, 't', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (29, 2, 'eb', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (30, 2, 'e', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (31, 2, 'er', NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 1, 'Andromena', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (3, 1, 'Milky Way', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (4, 1, 'a', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (5, 1, 'b', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (6, 1, 'c', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (7, 1, 'd', NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: layer_layer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.layer_layer_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 42, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 31, true);


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
-- Name: layer layer_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.layer
    ADD CONSTRAINT layer_name_key UNIQUE (name);


--
-- Name: layer layer_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.layer
    ADD CONSTRAINT layer_pkey PRIMARY KEY (layer_id);


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
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: layer layer_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.layer
    ADD CONSTRAINT layer_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: layer layer_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.layer
    ADD CONSTRAINT layer_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

