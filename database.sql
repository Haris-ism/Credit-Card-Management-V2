--
-- PostgreSQL database dump
--

-- Dumped from database version 14.9
-- Dumped by pg_dump version 14.10 (Homebrew)

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
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: credentials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.credentials (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    email text,
    password text
);


ALTER TABLE public.credentials OWNER TO postgres;

--
-- Name: credentials_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.credentials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.credentials_id_seq OWNER TO postgres;

--
-- Name: credentials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.credentials_id_seq OWNED BY public.credentials.id;


--
-- Name: credit_cards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.credit_cards (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    bank text,
    "limit" bigint,
    balance bigint,
    cc_number text,
    cvv text,
    creds_email text
);


ALTER TABLE public.credit_cards OWNER TO postgres;

--
-- Name: credit_cards_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.credit_cards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.credit_cards_id_seq OWNER TO postgres;

--
-- Name: credit_cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.credit_cards_id_seq OWNED BY public.credit_cards.id;


--
-- Name: item_lists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.item_lists (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    item text,
    price bigint
);


ALTER TABLE public.item_lists OWNER TO postgres;

--
-- Name: item_lists_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.item_lists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.item_lists_id_seq OWNER TO postgres;

--
-- Name: item_lists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.item_lists_id_seq OWNED BY public.item_lists.id;


--
-- Name: merchant_discounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.merchant_discounts (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    name text,
    type text,
    percentage bigint
);


ALTER TABLE public.merchant_discounts OWNER TO postgres;

--
-- Name: merchant_discounts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.merchant_discounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.merchant_discounts_id_seq OWNER TO postgres;

--
-- Name: merchant_discounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.merchant_discounts_id_seq OWNED BY public.merchant_discounts.id;


--
-- Name: merchant_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.merchant_items (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    item_name text,
    type text,
    price bigint,
    percentage bigint
);


ALTER TABLE public.merchant_items OWNER TO postgres;

--
-- Name: merchant_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.merchant_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.merchant_items_id_seq OWNER TO postgres;

--
-- Name: merchant_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.merchant_items_id_seq OWNED BY public.merchant_items.id;


--
-- Name: merchant_orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.merchant_orders (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    item_id bigint,
    name text,
    type text,
    discount text,
    price bigint,
    total_price bigint,
    quantity bigint,
    cc text
);


ALTER TABLE public.merchant_orders OWNER TO postgres;

--
-- Name: merchant_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.merchant_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.merchant_orders_id_seq OWNER TO postgres;

--
-- Name: merchant_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.merchant_orders_id_seq OWNED BY public.merchant_orders.id;


--
-- Name: merchant_vouchers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.merchant_vouchers (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    name text,
    type text,
    price bigint,
    code text,
    status text
);


ALTER TABLE public.merchant_vouchers OWNER TO postgres;

--
-- Name: merchant_vouchers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.merchant_vouchers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.merchant_vouchers_id_seq OWNER TO postgres;

--
-- Name: merchant_vouchers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.merchant_vouchers_id_seq OWNED BY public.merchant_vouchers.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    item_id bigint,
    name text,
    type text,
    discount text,
    price bigint,
    total_price bigint,
    quantity bigint,
    cc text,
    status text
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: credentials id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credentials ALTER COLUMN id SET DEFAULT nextval('public.credentials_id_seq'::regclass);


--
-- Name: credit_cards id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credit_cards ALTER COLUMN id SET DEFAULT nextval('public.credit_cards_id_seq'::regclass);


--
-- Name: item_lists id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_lists ALTER COLUMN id SET DEFAULT nextval('public.item_lists_id_seq'::regclass);


--
-- Name: merchant_discounts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.merchant_discounts ALTER COLUMN id SET DEFAULT nextval('public.merchant_discounts_id_seq'::regclass);


--
-- Name: merchant_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.merchant_items ALTER COLUMN id SET DEFAULT nextval('public.merchant_items_id_seq'::regclass);


--
-- Name: merchant_orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.merchant_orders ALTER COLUMN id SET DEFAULT nextval('public.merchant_orders_id_seq'::regclass);


--
-- Name: merchant_vouchers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.merchant_vouchers ALTER COLUMN id SET DEFAULT nextval('public.merchant_vouchers_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Data for Name: credentials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.credentials (id, created_at, updated_at, deleted_at, email, password) FROM stdin;
1	2024-02-01 08:12:12.972967+00	2024-02-01 08:12:12.972967+00	\N	test1@admin.com	$2a$10$wyQB4gba9rI2rcF5f85dn.HHsY88FB88qqmMNKGjS7Zp3ctNajtcW
\.


--
-- Data for Name: credit_cards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.credit_cards (id, created_at, updated_at, deleted_at, bank, "limit", balance, cc_number, cvv, creds_email) FROM stdin;
1	2024-02-01 08:12:32.574811+00	2024-02-01 08:13:39.392286+00	\N	BCA	9999999	6000	1209918242	131	test1@admin.com
\.


--
-- Data for Name: item_lists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.item_lists (id, created_at, updated_at, deleted_at, item, price) FROM stdin;
\.


--
-- Data for Name: merchant_discounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.merchant_discounts (id, created_at, updated_at, deleted_at, name, type, percentage) FROM stdin;
1	2024-02-01 08:12:23.876667+00	2024-02-01 08:12:23.876667+00	\N	Voucher10%Off	voucher	10
\.


--
-- Data for Name: merchant_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.merchant_items (id, created_at, updated_at, deleted_at, item_name, type, price, percentage) FROM stdin;
1	2024-02-01 08:12:20.129253+00	2024-02-01 08:12:20.129253+00	\N	steam wallet 100k	voucher	110000	0
\.


--
-- Data for Name: merchant_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.merchant_orders (id, created_at, updated_at, deleted_at, item_id, name, type, discount, price, total_price, quantity, cc) FROM stdin;
1	2024-02-01 08:13:32.424982+00	2024-02-01 08:13:32.424982+00	\N	1	steam wallet 100k	voucher	Voucher10%Off	110000	198000	2	1209918242
2	2024-02-01 08:13:37.932971+00	2024-02-01 08:13:37.932971+00	\N	1	steam wallet 100k	voucher	Voucher10%Off	110000	198000	2	1209918242
3	2024-02-01 08:13:39.399945+00	2024-02-01 08:13:39.399945+00	\N	1	steam wallet 100k	voucher	Voucher10%Off	110000	198000	2	1209918242
\.


--
-- Data for Name: merchant_vouchers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.merchant_vouchers (id, created_at, updated_at, deleted_at, name, type, price, code, status) FROM stdin;
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, created_at, updated_at, deleted_at, item_id, name, type, discount, price, total_price, quantity, cc, status) FROM stdin;
1	2024-02-01 08:13:32.392798+00	2024-02-01 08:13:32.436449+00	\N	1	steam wallet 100k	voucher	Voucher10%Off	110000	198000	2	1209918242	success
2	2024-02-01 08:13:37.92095+00	2024-02-01 08:13:37.936847+00	\N	1	steam wallet 100k	voucher	Voucher10%Off	110000	198000	2	1209918242	success
3	2024-02-01 08:13:39.39336+00	2024-02-01 08:13:39.402593+00	\N	1	steam wallet 100k	voucher	Voucher10%Off	110000	198000	2	1209918242	success
\.


--
-- Name: credentials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.credentials_id_seq', 1, true);


--
-- Name: credit_cards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.credit_cards_id_seq', 1, true);


--
-- Name: item_lists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.item_lists_id_seq', 1, false);


--
-- Name: merchant_discounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.merchant_discounts_id_seq', 1, true);


--
-- Name: merchant_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.merchant_items_id_seq', 1, true);


--
-- Name: merchant_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.merchant_orders_id_seq', 3, true);


--
-- Name: merchant_vouchers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.merchant_vouchers_id_seq', 1, false);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 3, true);


--
-- Name: credentials credentials_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credentials
    ADD CONSTRAINT credentials_email_key UNIQUE (email);


--
-- Name: credentials credentials_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credentials
    ADD CONSTRAINT credentials_pkey PRIMARY KEY (id);


--
-- Name: credit_cards credit_cards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credit_cards
    ADD CONSTRAINT credit_cards_pkey PRIMARY KEY (id);


--
-- Name: item_lists item_lists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_lists
    ADD CONSTRAINT item_lists_pkey PRIMARY KEY (id);


--
-- Name: merchant_discounts merchant_discounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.merchant_discounts
    ADD CONSTRAINT merchant_discounts_pkey PRIMARY KEY (id);


--
-- Name: merchant_items merchant_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.merchant_items
    ADD CONSTRAINT merchant_items_pkey PRIMARY KEY (id);


--
-- Name: merchant_orders merchant_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.merchant_orders
    ADD CONSTRAINT merchant_orders_pkey PRIMARY KEY (id);


--
-- Name: merchant_vouchers merchant_vouchers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.merchant_vouchers
    ADD CONSTRAINT merchant_vouchers_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: idx_credentials_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_credentials_deleted_at ON public.credentials USING btree (deleted_at);


--
-- Name: idx_credit_cards_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_credit_cards_deleted_at ON public.credit_cards USING btree (deleted_at);


--
-- Name: idx_item_lists_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_item_lists_deleted_at ON public.item_lists USING btree (deleted_at);


--
-- Name: idx_merchant_discounts_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_merchant_discounts_deleted_at ON public.merchant_discounts USING btree (deleted_at);


--
-- Name: idx_merchant_items_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_merchant_items_deleted_at ON public.merchant_items USING btree (deleted_at);


--
-- Name: idx_merchant_orders_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_merchant_orders_deleted_at ON public.merchant_orders USING btree (deleted_at);


--
-- Name: idx_merchant_vouchers_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_merchant_vouchers_deleted_at ON public.merchant_vouchers USING btree (deleted_at);


--
-- Name: idx_orders_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_orders_deleted_at ON public.orders USING btree (deleted_at);


--
-- Name: credit_cards fk_credit_cards_credentials; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credit_cards
    ADD CONSTRAINT fk_credit_cards_credentials FOREIGN KEY (creds_email) REFERENCES public.credentials(email);


--
-- PostgreSQL database dump complete
--

