--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(100) NOT NULL,
    diameter_km integer,
    composition text,
    orbital_period_days numeric(10,2),
    is_potentially_hazardous boolean,
    star_id integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_comet_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_comet_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_type character varying(30),
    distance_from_earth_million_ly numeric(9,3),
    diameter_ly integer,
    number_of_stars_billions numeric(8,2),
    has_supermassive_black_hole boolean
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
    name character varying(100) NOT NULL,
    radius_km integer,
    orbital_period_days numeric(8,2),
    is_spherical boolean,
    has_atmosphere boolean,
    planet_id integer
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
    name character varying(100) NOT NULL,
    planet_type character varying(30),
    mass_earth numeric(8,3),
    radius_km integer,
    orbital_period_days numeric(10,2),
    has_life boolean,
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_type character varying(30),
    mass_solar numeric(8,3),
    radius_solar numeric(8,3),
    surface_temperature_k integer,
    is_visible_to_naked_eye boolean,
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_comet_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Asterion', 510, 'Carbonaceous (C-type)', 420.50, false, 1);
INSERT INTO public.asteroid VALUES (2, 'Helios-12', 189, 'Silicaceous (S-type)', 190.30, true, 1);
INSERT INTO public.asteroid VALUES (3, 'Ironfang', 743, 'Metallic (M-type)', 2100.80, false, 2);
INSERT INTO public.asteroid VALUES (4, 'Pallas Minor', 325, 'Carbonaceous (C-type)', 1480.20, false, 2);
INSERT INTO public.asteroid VALUES (5, 'Crimson Shard', 119, 'Silicaceous (S-type)', 685.40, true, 2);
INSERT INTO public.asteroid VALUES (6, 'Orion-β', 956, 'Metallic (M-type)', 3240.00, false, 3);
INSERT INTO public.asteroid VALUES (7, 'Zephyr Rock', 287, 'Carbonaceous (C-type)', 1185.70, false, 3);
INSERT INTO public.asteroid VALUES (8, 'Nova Fragment', 95, 'Silicaceous (S-type)', 415.90, true, 3);
INSERT INTO public.asteroid VALUES (9, 'Ash Fragment', 42, 'Iron-Nickel', 96.20, false, 4);
INSERT INTO public.asteroid VALUES (10, 'Whirlpool-7', 683, 'Carbonaceous (C-type)', 2010.60, false, 5);
INSERT INTO public.asteroid VALUES (11, 'Scoria', 205, 'Silicaceous (S-type)', 620.10, true, 5);
INSERT INTO public.asteroid VALUES (12, 'Obsidian', 134, 'Metallic (M-type)', 480.80, false, 6);
INSERT INTO public.asteroid VALUES (13, 'Titan Rock', 889, 'Metallic (M-type)', 5120.40, false, 7);
INSERT INTO public.asteroid VALUES (14, 'Wolf''s Fang', 418, 'Silicaceous (S-type)', 1935.60, false, 7);
INSERT INTO public.asteroid VALUES (15, 'LMC-Delta', 273, 'Carbonaceous (C-type)', 840.20, false, 7);
INSERT INTO public.asteroid VALUES (16, 'Razor Pebble', 67, 'Iron-Nickel', 122.80, true, 7);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda Galaxy (M31)', 'Spiral', 2.500, 220000, 1000.00, true);
INSERT INTO public.galaxy VALUES (2, 'Milky Way Galaxy', 'Barred Spiral', 0.000, 100000, 250.00, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy (M33)', 'Spiral', 2.730, 60000, 40.00, false);
INSERT INTO public.galaxy VALUES (4, 'Sombrero Galaxy (M104)', 'Unbarred Spiral/Lenticular', 29.300, 50000, 100.00, true);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy (M51)', 'Grand Design Sprial', 23.000, 60000, 100.00, true);
INSERT INTO public.galaxy VALUES (6, 'Messier 87 (M87)', 'Giant Elliptical', 53.000, 130000, 1000.00, true);
INSERT INTO public.galaxy VALUES (7, 'Large Magellanic Cloud (LMC)', 'Magellanic Irregular', 0.160, 14000, 30.00, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Nyx', 1210, 48.60, true, false, 2);
INSERT INTO public.moon VALUES (2, 'Eos', 420, 11.40, false, false, 2);
INSERT INTO public.moon VALUES (3, 'Atlas', 2450, 14.80, true, true, 3);
INSERT INTO public.moon VALUES (4, 'Hyperion', 1710, 32.20, true, false, 3);
INSERT INTO public.moon VALUES (5, 'Selene', 980, 7.40, true, false, 3);
INSERT INTO public.moon VALUES (6, 'Draco', 520, 55.70, false, false, 3);
INSERT INTO public.moon VALUES (7, 'Vesper', 310, 94.10, false, false, 3);
INSERT INTO public.moon VALUES (8, 'Umbra', 1370, 21.50, true, true, 3);
INSERT INTO public.moon VALUES (9, 'Forge', 680, 3.80, true, false, 4);
INSERT INTO public.moon VALUES (10, 'Nimbus', 2210, 16.90, true, true, 5);
INSERT INTO public.moon VALUES (11, 'Tempest', 1640, 29.40, true, false, 5);
INSERT INTO public.moon VALUES (12, 'Echo', 710, 5.30, false, false, 5);
INSERT INTO public.moon VALUES (13, 'Aster', 390, 58.80, false, false, 5);
INSERT INTO public.moon VALUES (14, 'Halo', 1090, 10.70, true, false, 5);
INSERT INTO public.moon VALUES (15, 'Pelagia', 1830, 24.60, true, true, 6);
INSERT INTO public.moon VALUES (16, 'Coral', 590, 8.20, false, false, 6);
INSERT INTO public.moon VALUES (17, 'Cinderlet', 260, 1.90, false, false, 9);
INSERT INTO public.moon VALUES (18, 'Glacier', 1740, 12.80, true, true, 10);
INSERT INTO public.moon VALUES (19, 'Frost', 840, 5.60, true, false, 10);
INSERT INTO public.moon VALUES (20, 'Mist', 310, 30.40, false, false, 10);
INSERT INTO public.moon VALUES (21, 'Shard', 470, 18.20, false, false, 12);
INSERT INTO public.moon VALUES (22, 'Titanis', 2080, 42.10, true, true, 13);
INSERT INTO public.moon VALUES (23, 'Razor', 650, 9.70, false, false, 13);
INSERT INTO public.moon VALUES (24, 'Zephyr', 1320, 15.50, true, false, 14);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'V1-Alpha', 'Chthonian', 12.500, 14200, 1.20, false, 1);
INSERT INTO public.planet VALUES (2, 'V1-Beta', 'Super-Earth', 7.200, 11500, 850.00, false, 1);
INSERT INTO public.planet VALUES (3, 'Aeon', 'Super-Jupiter', 4200.000, 165000, 14600.00, false, 2);
INSERT INTO public.planet VALUES (4, 'Cinder', 'Iron Planet', 18.000, 13100, 450.00, false, 2);
INSERT INTO public.planet VALUES (5, 'B324-b', 'Gas Giant', 450.000, 78000, 2100.00, false, 3);
INSERT INTO public.planet VALUES (6, 'B324-c', 'Ocean World', 4.100, 9800, 5400.00, false, 3);
INSERT INTO public.planet VALUES (7, 'Ghost-1', 'Carbon Planet', 0.800, 5400, 0.40, false, 4);
INSERT INTO public.planet VALUES (8, 'Remnant-Prime', 'Pulsar Planet Equivalent', 3.200, 8900, 14.50, false, 4);
INSERT INTO public.planet VALUES (9, 'Dust-World', 'Scorched Rock', 2.100, 7600, 8.20, false, 5);
INSERT INTO public.planet VALUES (10, 'Ember', 'Ice Giant', 15.400, 22000, 120.00, false, 5);
INSERT INTO public.planet VALUES (11, 'Ashen-Alpha', 'Diamond Planet', 11.000, 12800, 0.15, false, 6);
INSERT INTO public.planet VALUES (12, 'Ashen-Beta', 'Rogue Gas Fragment', 85.000, 42000, 95.00, false, 6);
INSERT INTO public.planet VALUES (13, 'Tarantula-b', 'Hyper-Dense Rock', 25.000, 16300, 12000.00, false, 7);
INSERT INTO public.planet VALUES (14, 'Tarantula-c', 'Super-Neptune', 34.000, 31000, 48000.00, false, 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Hubble''s Variable No.1 (V1)', 'Cepheid Variable', 30.000, 150.000, 6150, false, 1);
INSERT INTO public.star VALUES (2, 'The Pistol Star', 'Luminous Blue Variable', 27.500, 308.000, 11800, false, 2);
INSERT INTO public.star VALUES (3, 'B324', 'Luminous Blue Variable', 40.000, 150.000, 25000, false, 3);
INSERT INTO public.star VALUES (4, 'SN 1939A', 'Type la Supernova', 1.400, NULL, 100000, false, 4);
INSERT INTO public.star VALUES (5, 'SN 2011dh', 'Type IIb Supernova', 13.000, 290.000, 6000, false, 5);
INSERT INTO public.star VALUES (6, 'SN 1919A', 'Supernova', 1.400, NULL, 100000, false, 6);
INSERT INTO public.star VALUES (7, 'R136a1', 'Wolf-Rayet Star', 291.000, 42.700, 46000, false, 7);


--
-- Name: asteroid_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_comet_id_seq', 16, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: asteroid asteroid_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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
