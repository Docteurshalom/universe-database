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
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_types text,
    distance_from_earth bigint,
    number_of_stars bigint,
    has_life boolean,
    is_spherical boolean
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
    name character varying(30) NOT NULL,
    radius numeric(10,2),
    orbital_period numeric(10,2),
    planet_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    type text,
    mass numeric(4,1),
    orbital_period numeric(10,2),
    distance_from_star numeric(4,1),
    star_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    type text,
    mass numeric(5,3),
    temperature integer,
    luminosity integer,
    starsystem_id integer NOT NULL,
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
-- Name: starsystem; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.starsystem (
    starsystem_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type text,
    coordinates text,
    galaxy_id integer
);


ALTER TABLE public.starsystem OWNER TO freecodecamp;

--
-- Name: starsystem_starsystem_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.starsystem_starsystem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.starsystem_starsystem_id_seq OWNER TO freecodecamp;

--
-- Name: starsystem_starsystem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.starsystem_starsystem_id_seq OWNED BY public.starsystem.starsystem_id;


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: starsystem starsystem_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.starsystem ALTER COLUMN starsystem_id SET DEFAULT nextval('public.starsystem_starsystem_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 0, 250000000000, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2537000, 1000000000000, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 3000000, 40000000000, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Irregular', 163000, 30000000000, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 'Irregular', 200000, 10000000000, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'Spiral', 23000000, 100000000000, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (31, 'Luna', 1737.40, 27.00, 13);
INSERT INTO public.moon VALUES (32, 'Phobos', 11.30, 1.00, 14);
INSERT INTO public.moon VALUES (33, 'Deimos', 6.20, 30.00, 14);
INSERT INTO public.moon VALUES (34, 'Io', 1821.60, 2.00, 15);
INSERT INTO public.moon VALUES (35, 'Europa', 1560.80, 4.00, 15);
INSERT INTO public.moon VALUES (36, 'Ganymede', 2634.10, 7.00, 15);
INSERT INTO public.moon VALUES (37, 'Callisto', 2410.30, 17.00, 15);
INSERT INTO public.moon VALUES (38, 'Proxima Moon 1', 500.00, 12.00, 16);
INSERT INTO public.moon VALUES (39, 'Proxima Moon 2', 600.00, 20.00, 16);
INSERT INTO public.moon VALUES (40, 'M32 Moon 1', 800.00, 15.00, 17);
INSERT INTO public.moon VALUES (41, 'M32 Moon 2', 900.00, 22.00, 17);
INSERT INTO public.moon VALUES (42, 'M33 Moon 1', 700.00, 18.00, 18);
INSERT INTO public.moon VALUES (43, 'M33 Moon 2', 1100.00, 25.00, 18);
INSERT INTO public.moon VALUES (44, 'M31 Moon 1', 600.00, 30.00, 21);
INSERT INTO public.moon VALUES (45, 'M31 Moon 2', 500.00, 12.00, 21);
INSERT INTO public.moon VALUES (46, 'M31 Moon 3', 1500.00, 80.00, 22);
INSERT INTO public.moon VALUES (47, 'M31 Moon 4', 1300.00, 100.00, 22);
INSERT INTO public.moon VALUES (48, 'M32 Moon 3', 700.00, 50.00, 23);
INSERT INTO public.moon VALUES (49, 'M32 Moon 4', 800.00, 60.00, 23);
INSERT INTO public.moon VALUES (50, 'M33 Moon 3', 1800.00, 100.00, 24);
INSERT INTO public.moon VALUES (51, 'M33 Moon 4', 1900.00, 120.00, 24);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (13, 'Earth', 'Terrestrial', 1.0, 365.25, 1.0, 2);
INSERT INTO public.planet VALUES (14, 'Mars', 'Terrestrial', 0.1, 687.00, 1.5, 2);
INSERT INTO public.planet VALUES (15, 'Jupiter', 'Gas Giant', 318.0, 4333.00, 5.2, 2);
INSERT INTO public.planet VALUES (16, 'Proxima b', 'Terrestrial', 1.3, 11.20, 0.1, 3);
INSERT INTO public.planet VALUES (17, 'M32 Planet 1', 'Gas Giant', 100.0, 1200.00, 3.0, 4);
INSERT INTO public.planet VALUES (18, 'M33 Planet 1', 'Ice Giant', 15.0, 700.00, 30.0, 5);
INSERT INTO public.planet VALUES (19, 'Venus', 'Terrestrial', 0.8, 225.00, 0.7, 2);
INSERT INTO public.planet VALUES (20, 'Mercury', 'Terrestrial', 0.1, 88.00, 0.4, 2);
INSERT INTO public.planet VALUES (21, 'M31 Planet 1', 'Terrestrial', 2.0, 400.00, 1.2, 3);
INSERT INTO public.planet VALUES (22, 'M31 Planet 2', 'Gas Giant', 200.0, 1300.00, 5.5, 3);
INSERT INTO public.planet VALUES (23, 'M32 Planet 2', 'Ice Giant', 20.0, 900.00, 15.0, 4);
INSERT INTO public.planet VALUES (24, 'M33 Planet 2', 'Gas Giant', 300.0, 1400.00, 25.0, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Sun', 'G-Type Main-Sequence', 1.000, 5778, 1, 1, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 'G-Type Main-Sequence', 1.100, 5790, 2, 2, 1);
INSERT INTO public.star VALUES (4, 'Alpha Centauri B', 'K-Type Main-Sequence', 0.900, 5260, 1, 2, 1);
INSERT INTO public.star VALUES (5, 'Andromeda Star 1', 'Giant', 4.000, 4500, 100, 3, 2);
INSERT INTO public.star VALUES (6, 'M32 Star', 'Dwarf', 0.800, 3000, 0, 4, 2);
INSERT INTO public.star VALUES (7, 'M33 Star', 'Supergiant', 10.000, 20000, 10000, 5, 2);


--
-- Data for Name: starsystem; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.starsystem VALUES (1, 'Solar System', 'Single Star', 'Orion Arm', 1);
INSERT INTO public.starsystem VALUES (2, 'Alpha Centauri', 'Binary Star', 'Proxima Region', 1);
INSERT INTO public.starsystem VALUES (3, 'M31 System', 'Cluster', 'Andromeda Core', 2);
INSERT INTO public.starsystem VALUES (4, 'M32 System', 'Single Star', 'Outer Andromeda', 2);
INSERT INTO public.starsystem VALUES (5, 'M33 System', 'Cluster', 'Triangulum Core', 3);
INSERT INTO public.starsystem VALUES (6, 'LMC System', 'Cluster', 'LMC Region', 4);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 51, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 24, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: starsystem_starsystem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.starsystem_starsystem_id_seq', 6, true);


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
-- Name: starsystem starsystem_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.starsystem
    ADD CONSTRAINT starsystem_name_key UNIQUE (name);


--
-- Name: starsystem starsystem_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.starsystem
    ADD CONSTRAINT starsystem_pkey PRIMARY KEY (starsystem_id);


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
-- Name: star star_starsystem_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_starsystem_id_fkey FOREIGN KEY (starsystem_id) REFERENCES public.starsystem(starsystem_id);


--
-- Name: starsystem starsystem_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.starsystem
    ADD CONSTRAINT starsystem_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

