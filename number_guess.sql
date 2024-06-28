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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    score integer NOT NULL,
    user_id integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 22, 1);
INSERT INTO public.games VALUES (2, 13, 1);
INSERT INTO public.games VALUES (3, 33, 1);
INSERT INTO public.games VALUES (4, 3, 2);
INSERT INTO public.games VALUES (5, 18, 2);
INSERT INTO public.games VALUES (6, 16, 1);
INSERT INTO public.games VALUES (7, 99, 3);
INSERT INTO public.games VALUES (8, 45, 2);
INSERT INTO public.games VALUES (9, 1, 11);
INSERT INTO public.games VALUES (10, 10, 15);
INSERT INTO public.games VALUES (11, 216, 16);
INSERT INTO public.games VALUES (12, 497, 16);
INSERT INTO public.games VALUES (13, 450, 17);
INSERT INTO public.games VALUES (14, 403, 17);
INSERT INTO public.games VALUES (15, 707, 16);
INSERT INTO public.games VALUES (16, 170, 16);
INSERT INTO public.games VALUES (17, 862, 16);
INSERT INTO public.games VALUES (18, 397, 18);
INSERT INTO public.games VALUES (19, 73, 18);
INSERT INTO public.games VALUES (20, 796, 19);
INSERT INTO public.games VALUES (21, 824, 19);
INSERT INTO public.games VALUES (22, 753, 18);
INSERT INTO public.games VALUES (23, 150, 18);
INSERT INTO public.games VALUES (24, 877, 18);
INSERT INTO public.games VALUES (25, 18, 1);
INSERT INTO public.games VALUES (26, 86, 20);
INSERT INTO public.games VALUES (27, 685, 20);
INSERT INTO public.games VALUES (28, 867, 21);
INSERT INTO public.games VALUES (29, 337, 21);
INSERT INTO public.games VALUES (30, 689, 20);
INSERT INTO public.games VALUES (31, 450, 20);
INSERT INTO public.games VALUES (32, 137, 20);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'Name1');
INSERT INTO public.users VALUES (2, 'Name2');
INSERT INTO public.users VALUES (3, 'Name3');
INSERT INTO public.users VALUES (4, '');
INSERT INTO public.users VALUES (6, 'Evie');
INSERT INTO public.users VALUES (7, 'Eeeeef');
INSERT INTO public.users VALUES (8, 'hihihi');
INSERT INTO public.users VALUES (9, 'ppp');
INSERT INTO public.users VALUES (10, 'kjaflkd');
INSERT INTO public.users VALUES (11, 'wejwe');
INSERT INTO public.users VALUES (12, 'jfkldkd');
INSERT INTO public.users VALUES (13, 'yryryr');
INSERT INTO public.users VALUES (14, 'pqpqpqpq');
INSERT INTO public.users VALUES (15, 'yuyuyu');
INSERT INTO public.users VALUES (16, 'user_1719581279637');
INSERT INTO public.users VALUES (17, 'user_1719581279636');
INSERT INTO public.users VALUES (18, 'user_1719581366500');
INSERT INTO public.users VALUES (19, 'user_1719581366499');
INSERT INTO public.users VALUES (20, 'user_1719581631441');
INSERT INTO public.users VALUES (21, 'user_1719581631440');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 32, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 21, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

