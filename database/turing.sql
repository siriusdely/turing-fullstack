--
-- PostgreSQL database dump
--

-- Dumped from database version 11.1
-- Dumped by pg_dump version 11.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: turing; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA turing;


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: adonis_schema; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.adonis_schema (
    id integer NOT NULL,
    name character varying(255),
    batch integer,
    migration_time timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: adonis_schema_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.adonis_schema_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: adonis_schema_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.adonis_schema_id_seq OWNED BY public.adonis_schema.id;


--
-- Name: tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tokens (
    id integer NOT NULL,
    user_id integer,
    token character varying(255) NOT NULL,
    type character varying(80) NOT NULL,
    is_revoked boolean DEFAULT false,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


--
-- Name: tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tokens_id_seq OWNED BY public.tokens.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(80) NOT NULL,
    email character varying(254) NOT NULL,
    password character varying(60) NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: attribute; Type: TABLE; Schema: turing; Owner: -
--

CREATE TABLE public.attribute (
    attribute_id bigint NOT NULL,
    name character varying(100) NOT NULL
);


--
-- Name: attribute_attribute_id_seq; Type: SEQUENCE; Schema: turing; Owner: -
--

CREATE SEQUENCE public.attribute_attribute_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: attribute_attribute_id_seq; Type: SEQUENCE OWNED BY; Schema: turing; Owner: -
--

ALTER SEQUENCE public.attribute_attribute_id_seq OWNED BY turing.attribute.attribute_id;


--
-- Name: attribute_value; Type: TABLE; Schema: turing; Owner: -
--

CREATE TABLE public.attribute_value (
    attribute_value_id bigint NOT NULL,
    attribute_id bigint NOT NULL,
    value character varying(100) NOT NULL
);


--
-- Name: attribute_value_attribute_value_id_seq; Type: SEQUENCE; Schema: turing; Owner: -
--

CREATE SEQUENCE public.attribute_value_attribute_value_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: attribute_value_attribute_value_id_seq; Type: SEQUENCE OWNED BY; Schema: turing; Owner: -
--

ALTER SEQUENCE public.attribute_value_attribute_value_id_seq OWNED BY turing.attribute_value.attribute_value_id;


--
-- Name: audit; Type: TABLE; Schema: turing; Owner: -
--

CREATE TABLE public.audit (
    audit_id bigint NOT NULL,
    order_id bigint NOT NULL,
    created_on timestamp with time zone NOT NULL,
    message text NOT NULL,
    code bigint NOT NULL
);


--
-- Name: audit_audit_id_seq; Type: SEQUENCE; Schema: turing; Owner: -
--

CREATE SEQUENCE public.audit_audit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: audit_audit_id_seq; Type: SEQUENCE OWNED BY; Schema: turing; Owner: -
--

ALTER SEQUENCE public.audit_audit_id_seq OWNED BY turing.audit.audit_id;


--
-- Name: category; Type: TABLE; Schema: turing; Owner: -
--

CREATE TABLE public.category (
    category_id bigint NOT NULL,
    department_id bigint NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(1000)
);


--
-- Name: category_category_id_seq; Type: SEQUENCE; Schema: turing; Owner: -
--

CREATE SEQUENCE public.category_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: category_category_id_seq; Type: SEQUENCE OWNED BY; Schema: turing; Owner: -
--

ALTER SEQUENCE public.category_category_id_seq OWNED BY turing.category.category_id;


--
-- Name: customer; Type: TABLE; Schema: turing; Owner: -
--

CREATE TABLE public.customer (
    customer_id bigint NOT NULL,
    name character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(50) NOT NULL,
    credit_card text,
    address_1 character varying(100),
    address_2 character varying(100),
    city character varying(100),
    region character varying(100),
    postal_code character varying(100),
    country character varying(100),
    shipping_region_id bigint DEFAULT '1'::bigint NOT NULL,
    day_phone character varying(100),
    eve_phone character varying(100),
    mob_phone character varying(100)
);


--
-- Name: customer_customer_id_seq; Type: SEQUENCE; Schema: turing; Owner: -
--

CREATE SEQUENCE public.customer_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: customer_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: turing; Owner: -
--

ALTER SEQUENCE public.customer_customer_id_seq OWNED BY turing.customer.customer_id;


--
-- Name: department; Type: TABLE; Schema: turing; Owner: -
--

CREATE TABLE public.department (
    department_id bigint NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(1000)
);


--
-- Name: department_department_id_seq; Type: SEQUENCE; Schema: turing; Owner: -
--

CREATE SEQUENCE public.department_department_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: department_department_id_seq; Type: SEQUENCE OWNED BY; Schema: turing; Owner: -
--

ALTER SEQUENCE public.department_department_id_seq OWNED BY turing.department.department_id;


--
-- Name: order_detail; Type: TABLE; Schema: turing; Owner: -
--

CREATE TABLE public.order_detail (
    item_id bigint NOT NULL,
    order_id bigint NOT NULL,
    product_id bigint NOT NULL,
    attributes character varying(1000) NOT NULL,
    product_name character varying(100) NOT NULL,
    quantity bigint NOT NULL,
    unit_cost numeric(10,2) NOT NULL
);


--
-- Name: order_detail_item_id_seq; Type: SEQUENCE; Schema: turing; Owner: -
--

CREATE SEQUENCE public.order_detail_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: order_detail_item_id_seq; Type: SEQUENCE OWNED BY; Schema: turing; Owner: -
--

ALTER SEQUENCE public.order_detail_item_id_seq OWNED BY turing.order_detail.item_id;


--
-- Name: orders; Type: TABLE; Schema: turing; Owner: -
--

CREATE TABLE public.orders (
    order_id bigint NOT NULL,
    total_amount numeric(10,2) DEFAULT 0.00 NOT NULL,
    created_on timestamp with time zone NOT NULL,
    shipped_on timestamp with time zone,
    status bigint DEFAULT '0'::bigint NOT NULL,
    comments character varying(255),
    customer_id bigint,
    auth_code character varying(50),
    reference character varying(50),
    shipping_id bigint,
    tax_id bigint
);


--
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: turing; Owner: -
--

CREATE SEQUENCE public.orders_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: turing; Owner: -
--

ALTER SEQUENCE public.orders_order_id_seq OWNED BY turing.orders.order_id;


--
-- Name: product; Type: TABLE; Schema: turing; Owner: -
--

CREATE TABLE public.product (
    product_id bigint NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(1000) NOT NULL,
    price numeric(10,2) NOT NULL,
    discounted_price numeric(10,2) DEFAULT 0.00 NOT NULL,
    image character varying(150),
    image_2 character varying(150),
    thumbnail character varying(150),
    display smallint DEFAULT '0'::smallint NOT NULL
);


--
-- Name: product_attribute; Type: TABLE; Schema: turing; Owner: -
--

CREATE TABLE public.product_attribute (
    product_id bigint NOT NULL,
    attribute_value_id bigint NOT NULL
);


--
-- Name: product_category; Type: TABLE; Schema: turing; Owner: -
--

CREATE TABLE public.product_category (
    product_id bigint NOT NULL,
    category_id bigint NOT NULL
);


--
-- Name: product_product_id_seq; Type: SEQUENCE; Schema: turing; Owner: -
--

CREATE SEQUENCE public.product_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: product_product_id_seq; Type: SEQUENCE OWNED BY; Schema: turing; Owner: -
--

ALTER SEQUENCE public.product_product_id_seq OWNED BY turing.product.product_id;


--
-- Name: review; Type: TABLE; Schema: turing; Owner: -
--

CREATE TABLE public.review (
    review_id bigint NOT NULL,
    customer_id bigint NOT NULL,
    product_id bigint NOT NULL,
    review text NOT NULL,
    rating smallint NOT NULL,
    created_on timestamp with time zone NOT NULL
);


--
-- Name: review_review_id_seq; Type: SEQUENCE; Schema: turing; Owner: -
--

CREATE SEQUENCE public.review_review_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: review_review_id_seq; Type: SEQUENCE OWNED BY; Schema: turing; Owner: -
--

ALTER SEQUENCE public.review_review_id_seq OWNED BY turing.review.review_id;


--
-- Name: shipping; Type: TABLE; Schema: turing; Owner: -
--

CREATE TABLE public.shipping (
    shipping_id bigint NOT NULL,
    shipping_type character varying(100) NOT NULL,
    shipping_cost numeric(10,2) NOT NULL,
    shipping_region_id bigint NOT NULL
);


--
-- Name: shipping_region; Type: TABLE; Schema: turing; Owner: -
--

CREATE TABLE public.shipping_region (
    shipping_region_id bigint NOT NULL,
    shipping_region character varying(100) NOT NULL
);


--
-- Name: shipping_region_shipping_region_id_seq; Type: SEQUENCE; Schema: turing; Owner: -
--

CREATE SEQUENCE public.shipping_region_shipping_region_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: shipping_region_shipping_region_id_seq; Type: SEQUENCE OWNED BY; Schema: turing; Owner: -
--

ALTER SEQUENCE public.shipping_region_shipping_region_id_seq OWNED BY turing.shipping_region.shipping_region_id;


--
-- Name: shipping_shipping_id_seq; Type: SEQUENCE; Schema: turing; Owner: -
--

CREATE SEQUENCE public.shipping_shipping_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: shipping_shipping_id_seq; Type: SEQUENCE OWNED BY; Schema: turing; Owner: -
--

ALTER SEQUENCE public.shipping_shipping_id_seq OWNED BY turing.shipping.shipping_id;


--
-- Name: shopping_cart; Type: TABLE; Schema: turing; Owner: -
--

CREATE TABLE public.shopping_cart (
    item_id bigint NOT NULL,
    cart_id character(32) NOT NULL,
    product_id bigint NOT NULL,
    attributes character varying(1000) NOT NULL,
    quantity bigint NOT NULL,
    buy_now boolean DEFAULT true NOT NULL,
    added_on timestamp with time zone NOT NULL
);


--
-- Name: shopping_cart_item_id_seq; Type: SEQUENCE; Schema: turing; Owner: -
--

CREATE SEQUENCE public.shopping_cart_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: shopping_cart_item_id_seq; Type: SEQUENCE OWNED BY; Schema: turing; Owner: -
--

ALTER SEQUENCE public.shopping_cart_item_id_seq OWNED BY turing.shopping_cart.item_id;


--
-- Name: tax; Type: TABLE; Schema: turing; Owner: -
--

CREATE TABLE public.tax (
    tax_id bigint NOT NULL,
    tax_type character varying(100) NOT NULL,
    tax_percentage numeric(10,2) NOT NULL
);


--
-- Name: tax_tax_id_seq; Type: SEQUENCE; Schema: turing; Owner: -
--

CREATE SEQUENCE public.tax_tax_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tax_tax_id_seq; Type: SEQUENCE OWNED BY; Schema: turing; Owner: -
--

ALTER SEQUENCE public.tax_tax_id_seq OWNED BY turing.tax.tax_id;


--
-- Name: adonis_schema id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.adonis_schema ALTER COLUMN id SET DEFAULT nextval('public.adonis_schema_id_seq'::regclass);


--
-- Name: tokens id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tokens ALTER COLUMN id SET DEFAULT nextval('public.tokens_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: attribute attribute_id; Type: DEFAULT; Schema: turing; Owner: -
--

ALTER TABLE ONLY public.attribute ALTER COLUMN attribute_id SET DEFAULT nextval('turing.attribute_attribute_id_seq'::regclass);


--
-- Name: attribute_value attribute_value_id; Type: DEFAULT; Schema: turing; Owner: -
--

ALTER TABLE ONLY public.attribute_value ALTER COLUMN attribute_value_id SET DEFAULT nextval('turing.attribute_value_attribute_value_id_seq'::regclass);


--
-- Name: audit audit_id; Type: DEFAULT; Schema: turing; Owner: -
--

ALTER TABLE ONLY public.audit ALTER COLUMN audit_id SET DEFAULT nextval('turing.audit_audit_id_seq'::regclass);


--
-- Name: category category_id; Type: DEFAULT; Schema: turing; Owner: -
--

ALTER TABLE ONLY public.category ALTER COLUMN category_id SET DEFAULT nextval('turing.category_category_id_seq'::regclass);


--
-- Name: customer customer_id; Type: DEFAULT; Schema: turing; Owner: -
--

ALTER TABLE ONLY public.customer ALTER COLUMN customer_id SET DEFAULT nextval('turing.customer_customer_id_seq'::regclass);


--
-- Name: department department_id; Type: DEFAULT; Schema: turing; Owner: -
--

ALTER TABLE ONLY public.department ALTER COLUMN department_id SET DEFAULT nextval('turing.department_department_id_seq'::regclass);


--
-- Name: order_detail item_id; Type: DEFAULT; Schema: turing; Owner: -
--

ALTER TABLE ONLY public.order_detail ALTER COLUMN item_id SET DEFAULT nextval('turing.order_detail_item_id_seq'::regclass);


--
-- Name: orders order_id; Type: DEFAULT; Schema: turing; Owner: -
--

ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('turing.orders_order_id_seq'::regclass);


--
-- Name: product product_id; Type: DEFAULT; Schema: turing; Owner: -
--

ALTER TABLE ONLY public.product ALTER COLUMN product_id SET DEFAULT nextval('turing.product_product_id_seq'::regclass);


--
-- Name: review review_id; Type: DEFAULT; Schema: turing; Owner: -
--

ALTER TABLE ONLY public.review ALTER COLUMN review_id SET DEFAULT nextval('turing.review_review_id_seq'::regclass);


--
-- Name: shipping shipping_id; Type: DEFAULT; Schema: turing; Owner: -
--

ALTER TABLE ONLY public.shipping ALTER COLUMN shipping_id SET DEFAULT nextval('turing.shipping_shipping_id_seq'::regclass);


--
-- Name: shipping_region shipping_region_id; Type: DEFAULT; Schema: turing; Owner: -
--

ALTER TABLE ONLY public.shipping_region ALTER COLUMN shipping_region_id SET DEFAULT nextval('turing.shipping_region_shipping_region_id_seq'::regclass);


--
-- Name: shopping_cart item_id; Type: DEFAULT; Schema: turing; Owner: -
--

ALTER TABLE ONLY public.shopping_cart ALTER COLUMN item_id SET DEFAULT nextval('turing.shopping_cart_item_id_seq'::regclass);


--
-- Name: tax tax_id; Type: DEFAULT; Schema: turing; Owner: -
--

ALTER TABLE ONLY public.tax ALTER COLUMN tax_id SET DEFAULT nextval('turing.tax_tax_id_seq'::regclass);


--
-- Data for Name: adonis_schema; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.adonis_schema (id, name, batch, migration_time) FROM stdin;
1	1503248427885_user	1	2019-02-14 18:26:20.021141+07
2	1503248427886_token	1	2019-02-14 18:26:20.036341+07
\.


--
-- Data for Name: tokens; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tokens (id, user_id, token, type, is_revoked, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, username, email, password, created_at, updated_at) FROM stdin;
1	mezie	mezie@example.com	$2a$10$MY56u7iQJgnsS3SmA9C5mehC8HF.m1tcFZe4EukX6wRz1HR/6GivC	2019-02-15 11:25:05+07	2019-02-15 11:25:05+07
12	sirius	sirius@example.com	$2a$10$DHPAD4494gZadLAR7n7SxeoUr9kopteu4BzTPmbfsGjb4Oz26qpHy	2019-02-17 07:01:12+07	2019-02-17 07:01:12+07
\.


--
-- Data for Name: attribute; Type: TABLE DATA; Schema: turing; Owner: -
--

COPY public.attribute (attribute_id, name) FROM stdin;
1	Size
2	Color
3	si
\.


--
-- Data for Name: attribute_value; Type: TABLE DATA; Schema: turing; Owner: -
--

COPY public.attribute_value (attribute_value_id, attribute_id, value) FROM stdin;
1	1	S
2	1	M
3	1	L
4	1	XL
5	1	XXL
6	2	White
7	2	Black
8	2	Red
9	2	Orange
10	2	Yellow
11	2	Green
12	2	Blue
13	2	Indigo
14	2	Purple
16	3	a   dfsdfsdfdsf
15	3	asfdasdfasfd hoohh
\.


--
-- Data for Name: audit; Type: TABLE DATA; Schema: turing; Owner: -
--

COPY public.audit (audit_id, order_id, created_on, message, code) FROM stdin;
\.


--
-- Data for Name: category; Type: TABLE DATA; Schema: turing; Owner: -
--

COPY public.category (category_id, department_id, name, description) FROM stdin;
1	1	French	The French have always had an eye for beauty. One look at the T-shirts below and you'll see that same appreciation has been applied abundantly to their postage stamps. Below are some of our most beautiful and colorful T-shirts, so browse away! And don't forget to go all the way to the bottom - you don't want to miss any of them!
2	1	Italian	The full and resplendent treasure chest of art, literature, music, and science that Italy has given the world is reflected splendidly in its postal stamps. If we could, we would dedicate hundreds of T-shirts to this amazing treasure of beautiful images, but for now we will have to live with what you see here. You don't have to be Italian to love these gorgeous T-shirts, just someone who appreciates the finer things in life!
3	1	Irish	It was Churchill who remarked that he thought the Irish most curious because they didn't want to be English. How right he was! But then, he was half-American, wasn't he? If you have an Irish genealogy you will want these T-shirts! If you suddenly turn Irish on St. Patrick's Day, you too will want these T-shirts! Take a look at some of the coolest T-shirts we have!
4	2	Animal	 Our ever-growing selection of beautiful animal T-shirts represents critters from everywhere, both wild and domestic. If you don't see the T-shirt with the animal you're looking for, tell us and we'll find it!
5	2	Flower	These unique and beautiful flower T-shirts are just the item for the gardener, flower arranger, florist, or general lover of things beautiful. Surprise the flower in your life with one of the beautiful botanical T-shirts or just get a few for yourself!
6	3	Christmas	 Because this is a unique Christmas T-shirt that you'll only wear a few times a year, it will probably last for decades (unless some grinch nabs it from you, of course). Far into the future, after you're gone, your grandkids will pull it out and argue over who gets to wear it. What great snapshots they'll make dressed in Grandpa or Grandma's incredibly tasteful and unique Christmas T-shirt! Yes, everyone will remember you forever and what a silly goof you were when you would wear only your Santa beard and cap so you wouldn't cover up your nifty T-shirt.
7	3	Valentine's	For the more timid, all you have to do is wear your heartfelt message to get it across. Buy one for you and your sweetie(s) today!
8	2	asdf	asdf\r\n
9	9	asdfasdf 2	asdfasdfasdf 2
10	6	hohohohoho	hohooohohohohh
\.


--
-- Data for Name: customer; Type: TABLE DATA; Schema: turing; Owner: -
--

COPY public.customer (customer_id, name, email, password, credit_card, address_1, address_2, city, region, postal_code, country, shipping_region_id, day_phone, eve_phone, mob_phone) FROM stdin;
\.


--
-- Data for Name: department; Type: TABLE DATA; Schema: turing; Owner: -
--

COPY public.department (department_id, name, description) FROM stdin;
1	Regional	Proud of your country? Wear a T-shirt with a national symbol stamp!
2	Nature	Find beautiful T-shirts with animals and flowers in our Nature department!
3	Seasonal	Each time of the year has a special flavor. Our seasonal T-shirts express traditional symbols using unique postal stamp pictures.
4	test department name	test department description
7	asdfasdf	asdfasdfasdf
8	asdfasdfasdfasdf	asdfasdfasdfasdfasdfasdf
9	test dpeart 2	test depart 2
10	test dpeart 3	test depart 3
11	test dpart 4	test depart 4
5	as asdfasdf	as asdfasfsdfdfd
6	as hohoho	as hohhohohooho
\.


--
-- Data for Name: order_detail; Type: TABLE DATA; Schema: turing; Owner: -
--

COPY public.order_detail (item_id, order_id, product_id, attributes, product_name, quantity, unit_cost) FROM stdin;
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: turing; Owner: -
--

COPY public.orders (order_id, total_amount, created_on, shipped_on, status, comments, customer_id, auth_code, reference, shipping_id, tax_id) FROM stdin;
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: turing; Owner: -
--

COPY public.product (product_id, name, description, price, discounted_price, image, image_2, thumbnail, display) FROM stdin;
1	Arc d'Triomphe	This beautiful and iconic T-shirt will no doubt lead you to your own triumph.	14.99	0.00	arc-d-triomphe.gif	arc-d-triomphe-2.gif	arc-d-triomphe-thumbnail.gif	0
2	Chartres Cathedral	"The Fur Merchants". Not all the beautiful stained glass in the great cathedrals depicts saints and angels! Lay aside your furs for the summer and wear this beautiful T-shirt!	16.95	15.95	chartres-cathedral.gif	chartres-cathedral-2.gif	chartres-cathedral-thumbnail.gif	2
3	Coat of Arms	There's good reason why the ship plays a prominent part on this shield!	14.50	0.00	coat-of-arms.gif	coat-of-arms-2.gif	coat-of-arms-thumbnail.gif	0
4	Gallic Cock	This fancy chicken is perhaps the most beloved of all French symbols. Unfortunately, there are only a few hundred left, so you'd better get your T-shirt now!	18.99	16.99	gallic-cock.gif	gallic-cock-2.gif	gallic-cock-thumbnail.gif	2
5	Marianne	She symbolizes the "Triumph of the Republic" and has been depicted many different ways in the history of France, as you will see below!	15.95	14.95	marianne.gif	marianne-2.gif	marianne-thumbnail.gif	2
6	Alsace	It was in this region of France that Gutenberg perfected his movable type. If he could only see what he started!	16.50	0.00	alsace.gif	alsace-2.gif	alsace-thumbnail.gif	0
7	Apocalypse Tapestry	One of the most famous tapestries of the Loire Valley, it dates from the 14th century. The T-shirt is of more recent vintage, however.	20.00	18.95	apocalypse-tapestry.gif	apocalypse-tapestry-2.gif	apocalypse-tapestry-thumbnail.gif	0
8	Centaur	There were never any lady centaurs, so these guys had to mate with nymphs and mares. No wonder they were often in such bad moods!	14.99	0.00	centaur.gif	centaur-2.gif	centaur-thumbnail.gif	0
9	Corsica	Borrowed from Spain, the "Moor's head" may have celebrated the Christians' victory over the Moslems in that country.	22.00	0.00	corsica.gif	corsica-2.gif	corsica-thumbnail.gif	0
10	Haute Couture	This stamp publicized the dress making industry. Use it to celebrate the T-shirt industry!	15.99	14.95	haute-couture.gif	haute-couture-2.gif	haute-couture-thumbnail.gif	3
11	Iris	Iris was the Goddess of the Rainbow, daughter of the Titans Thaumas and Electra. Are you up to this T-shirt?!	17.50	0.00	iris.gif	iris-2.gif	iris-thumbnail.gif	0
12	Lorraine	The largest American cemetery in France is located in Lorraine and most of the folks there still appreciate that fact.	16.95	0.00	lorraine.gif	lorraine-2.gif	lorraine-thumbnail.gif	0
13	Mercury	Besides being the messenger of the gods, did you know that Mercury was also the god of profit and commerce? This T-shirt is for business owners!	21.99	18.95	mercury.gif	mercury-2.gif	mercury-thumbnail.gif	2
14	County of Nice	Nice is so nice that it has been fought over for millennia, but now it all belongs to France.	12.95	0.00	county-of-nice.gif	county-of-nice-2.gif	county-of-nice-thumbnail.gif	0
15	Notre Dame	Commemorating the 800th anniversary of the famed cathedral.	18.50	16.99	notre-dame.gif	notre-dame-2.gif	notre-dame-thumbnail.gif	2
16	Paris Peace Conference	The resulting treaties allowed Italy, Romania, Hungary, Bulgaria, and Finland to reassume their responsibilities as sovereign states in international affairs and thus qualify for membership in the UN.	16.95	15.99	paris-peace-conference.gif	paris-peace-conference-2.gif	paris-peace-conference-thumbnail.gif	2
17	Sarah Bernhardt	The "Divine Sarah" said this about Americans: "You are younger than we as a race, you are perhaps barbaric, but what of it? You are still in the molding. Your spirit is superb. It is what helped us win the war." Perhaps we're still barbaric but we're still winning wars for them too!	14.99	0.00	sarah-bernhardt.gif	sarah-bernhardt-2.gif	sarah-bernhardt-thumbnail.gif	0
18	Hunt	A scene from "Les Tres Riches Heures," a medieval "book of hours" containing the text for each liturgical hour of the day. This scene is from a 14th century painting.	16.99	15.95	hunt.gif	hunt-2.gif	hunt-thumbnail.gif	2
19	Italia	The War had just ended when this stamp was designed, and even so, there was enough optimism to show the destroyed oak tree sprouting again from its stump! What a beautiful T-shirt!	22.00	18.99	italia.gif	italia-2.gif	italia-thumbnail.gif	2
20	Torch	The light goes on! Carry the torch with this T-shirt and be a beacon of hope for the world!	19.99	17.95	torch.gif	torch-2.gif	torch-thumbnail.gif	2
21	Espresso	The winged foot of Mercury speeds the Special Delivery mail to its destination. In a hurry? This T-shirt is for you!	16.95	0.00	espresso.gif	espresso-2.gif	espresso-thumbnail.gif	0
22	Galileo	This beautiful T-shirt does honor to one of Italy's (and the world's) most famous scientists. Show your appreciation for the education you've received!	14.99	0.00	galileo.gif	galileo-2.gif	galileo-thumbnail.gif	0
23	Italian Airmail	Thanks to modern Italian post, folks were able to reach out and touch each other. Or at least so implies this image. This is a very fast and friendly T-shirt--you'll make friends with it!	21.00	17.99	italian-airmail.gif	italian-airmail-2.gif	italian-airmail-thumbnail.gif	0
24	Mazzini	Giuseppe Mazzini is considered one of the patron saints of the "Risorgimiento." Wear this beautiful T-shirt to tell the world you agree!	20.50	18.95	mazzini.gif	mazzini-2.gif	mazzini-thumbnail.gif	2
25	Romulus & Remus	Back in 753 BC, so the story goes, Romulus founded the city of Rome (in competition with Remus, who founded a city on another hill). Their adopted mother is shown in this image. When did they suspect they were adopted?	17.99	16.95	romulus-remus.gif	romulus-remus-2.gif	romulus-remus-thumbnail.gif	2
26	Italy Maria	This beautiful image of the Virgin is from a work by Raphael, whose life and death it honors. It is one of our most popular T-shirts!	14.00	0.00	italy-maria.gif	italy-maria-2.gif	italy-maria-thumbnail.gif	0
27	Italy Jesus	This image of Jesus teaching the gospel was issued to commemorate the third centenary of the "propagation of the faith." Now you can do your part with this T-shirt!	16.95	0.00	italy-jesus.gif	italy-jesus-2.gif	italy-jesus-thumbnail.gif	0
28	St. Francis	Here St. Francis is receiving his vision. This dramatic and attractive stamp was issued on the 700th anniversary of that event.	22.00	18.99	st-francis.gif	st-francis-2.gif	st-francis-thumbnail.gif	2
29	Irish Coat of Arms	This was one of the first stamps of the new Irish Republic, and it makes a T-shirt you'll be proud to wear on St. Paddy's Day!	14.99	0.00	irish-coat-of-arms.gif	irish-coat-of-arms-2.gif	irish-coat-of-arms-thumbnail.gif	0
30	Easter Rebellion	The Easter Rebellion of 1916 was a defining moment in Irish history. Although only a few hundred participated and the British squashed it in a week, its leaders were executed, which galvanized the uncommitted.	19.00	16.95	easter-rebellion.gif	easter-rebellion-2.gif	easter-rebellion-thumbnail.gif	2
31	Guiness	Class! Who is this man and why is he important enough for his own T-shirt?!	15.00	0.00	guiness.gif	guiness-2.gif	guiness-thumbnail.gif	0
32	St. Patrick	This stamp commemorated the 1500th anniversary of the revered saint's death. Is there a more perfect St. Patrick's Day T-shirt?!	20.50	17.95	st-patrick.gif	st-patrick-2.gif	st-patrick-thumbnail.gif	0
33	St. Peter	This T-shirt commemorates the holy year of 1950.	16.00	14.95	st-peter.gif	st-peter-2.gif	st-peter-thumbnail.gif	2
34	Sword of Light	This was the very first Irish postage stamp, and what a beautiful and cool T-shirt it makes for the Irish person in your life!	14.99	0.00	sword-of-light.gif	sword-of-light-2.gif	sword-of-light-thumbnail.gif	0
35	Thomas Moore	One of the greatest if not the greatest of Irish poets and writers, Moore led a very interesting life, though plagued with tragedy in a somewhat typically Irish way. Remember "The Last Rose of Summer"?	15.95	14.99	thomas-moore.gif	thomas-moore-2.gif	thomas-moore-thumbnail.gif	2
36	Visit the Zoo	This WPA poster is a wonderful example of the art produced by the Works Projects Administration during the Depression years. Do you feel like you sometimes live or work in a zoo? Then this T-shirt is for you!	20.00	16.95	visit-the-zoo.gif	visit-the-zoo-2.gif	visit-the-zoo-thumbnail.gif	2
37	Sambar	This handsome Malayan Sambar was a pain in the neck to get to pose like this, and all so you could have this beautiful retro animal T-shirt!	19.00	17.99	sambar.gif	sambar-2.gif	sambar-thumbnail.gif	2
38	Buffalo	Of all the critters in our T-shirt zoo, this is one of our most popular. A classic animal T-shirt for an individual like yourself!	14.99	0.00	buffalo.gif	buffalo-2.gif	buffalo-thumbnail.gif	0
39	Mustache Monkey	This fellow is more than equipped to hang out with that tail of his, just like you'll be fit for hanging out with this great animal T-shirt!	20.00	17.95	mustache-monkey.gif	mustache-monkey-2.gif	mustache-monkey-thumbnail.gif	2
40	Colobus	Why is he called "Colobus," "the mutilated one"? He doesn't have a thumb, just four fingers! He is far from handicapped, however; his hands make him the great swinger he is. Speaking of swinging, that's what you'll do with this beautiful animal T-shirt!	17.00	15.99	colobus.gif	colobus-2.gif	colobus-thumbnail.gif	2
41	Canada Goose	Being on a major flyway for these guys, we know all about these majestic birds. They hang out in large numbers on a lake near our house and fly over constantly. Remember what Frankie Lane said? "I want to go where the wild goose goes!" And when you go, wear this cool Canada goose animal T-shirt.	15.99	0.00	canada-goose.gif	canada-goose-2.gif	canada-goose-thumbnail.gif	0
42	Congo Rhino	Among land mammals, this white rhino is surpassed in size only by the elephant. He has a big fan base too, working hard to make sure he sticks around. You'll be a fan of his, too, when people admire this unique and beautiful T-shirt on you!	20.00	18.99	congo-rhino.gif	congo-rhino-2.gif	congo-rhino-thumbnail.gif	2
43	Equatorial Rhino	There's a lot going on in this frame! A black rhino is checking out that python slithering off into the bush--or is he eyeing you? You can bet all eyes will be on you when you wear this T-shirt!	19.95	17.95	equatorial-rhino.gif	equatorial-rhino-2.gif	equatorial-rhino-thumbnail.gif	2
44	Ethiopian Rhino	Another white rhino is honored in this classic design that bespeaks the Africa of the early century. This pointillist and retro T-shirt will definitely turn heads!	16.00	0.00	ethiopian-rhino.gif	ethiopian-rhino-2.gif	ethiopian-rhino-thumbnail.gif	0
45	Dutch Sea Horse	I think this T-shirt is destined to be one of our most popular simply because it is one of our most beautiful!	12.50	0.00	dutch-sea-horse.gif	dutch-sea-horse-2.gif	dutch-sea-horse-thumbnail.gif	0
46	Dutch Swans	This stamp was designed in the middle of the Nazi occupation, as was the one above. Together they reflect a spirit of beauty that evil could not suppress. Both of these T-shirts will make it impossible to suppress your artistic soul, too!	21.00	18.99	dutch-swans.gif	dutch-swans-2.gif	dutch-swans-thumbnail.gif	2
47	Ethiopian Elephant	From the same series as the Ethiopian Rhino and the Ostriches, this stylish elephant T-shirt will mark you as a connoisseur of good taste!	18.99	16.95	ethiopian-elephant.gif	ethiopian-elephant-2.gif	ethiopian-elephant-thumbnail.gif	2
48	Laotian Elephant	This working guy is proud to have his own stamp, and now he has his own T-shirt!	21.00	18.99	laotian-elephant.gif	laotian-elephant-2.gif	laotian-elephant-thumbnail.gif	0
49	Liberian Elephant	And yet another Jumbo! You need nothing but a big heart to wear this T-shirt (or a big sense of style)!	22.00	17.50	liberian-elephant.gif	liberian-elephant-2.gif	liberian-elephant-thumbnail.gif	2
50	Somali Ostriches	Another in an old series of beautiful stamps from Ethiopia. These big birds pack quite a wallop, and so will you when you wear this uniquely retro T-shirt!	12.95	0.00	somali-ostriches.gif	somali-ostriches-2.gif	somali-ostriches-thumbnail.gif	0
51	Tankanyika Giraffe	The photographer had to stand on a step ladder for this handsome portrait, but his efforts paid off with an angle we seldom see of this lofty creature. This beautiful retro T-shirt would make him proud!	15.00	12.99	tankanyika-giraffe.gif	tankanyika-giraffe-2.gif	tankanyika-giraffe-thumbnail.gif	3
52	Ifni Fish	This beautiful stamp was issued to commemorate National Colonial Stamp Day (you can do that when you have a colony). When you wear this fancy fish T-shirt, your friends will think it's national T-shirt day!	14.00	0.00	ifni-fish.gif	ifni-fish-2.gif	ifni-fish-thumbnail.gif	0
53	Sea Gull	A beautiful stamp from a small enclave in southern Morocco that belonged to Spain until 1969 makes a beautiful bird T-shirt.	19.00	16.95	sea-gull.gif	sea-gull-2.gif	sea-gull-thumbnail.gif	2
54	King Salmon	You can fish them and eat them and now you can wear them with this classic animal T-shirt.	17.95	15.99	king-salmon.gif	king-salmon-2.gif	king-salmon-thumbnail.gif	2
55	Laos Bird	This fellow is also known as the "White Crested Laughing Thrush." What's he laughing at? Why, at the joy of being on your T-shirt!	12.00	0.00	laos-bird.gif	laos-bird-2.gif	laos-bird-thumbnail.gif	0
56	Mozambique Lion	The Portuguese were too busy to run this colony themselves so they gave the Mozambique Company a charter to do it. I think there must be some pretty curious history related to that (the charter only lasted for 50 years)! If you're a Leo, or know a Leo, you should seriously consider this T-shirt!	15.99	14.95	mozambique-lion.gif	mozambique-lion-2.gif	mozambique-lion-thumbnail.gif	2
57	Peru Llama	This image is nearly 100 years old! Little did this little llama realize that he was going to be made immortal on the Web and on this very unique animal T-shirt (actually, little did he know at all)!	21.50	17.99	peru-llama.gif	peru-llama-2.gif	peru-llama-thumbnail.gif	2
58	Romania Alsatian	If you know and love this breed, there's no reason in the world that you shouldn't buy this T-shirt right now!	15.95	0.00	romania-alsatian.gif	romania-alsatian-2.gif	romania-alsatian-thumbnail.gif	0
59	Somali Fish	This is our most popular fish T-shirt, hands down. It's a beauty, and if you wear this T-shirt, you'll be letting the world know you're a fine catch!	19.95	16.95	somali-fish.gif	somali-fish-2.gif	somali-fish-thumbnail.gif	2
60	Trout	This beautiful image will warm the heart of any fisherman! You must know one if you're not one yourself, so you must buy this T-shirt!	14.00	0.00	trout.gif	trout-2.gif	trout-thumbnail.gif	0
61	Baby Seal	Ahhhhhh! This little harp seal would really prefer not to be your coat! But he would like to be your T-shirt!	21.00	18.99	baby-seal.gif	baby-seal-2.gif	baby-seal-thumbnail.gif	2
62	Musk Ox	Some critters you just don't want to fool with, and if I were facing this fellow I'd politely give him the trail! That is, of course, unless I were wearing this T-shirt.	15.50	0.00	musk-ox.gif	musk-ox-2.gif	musk-ox-thumbnail.gif	0
63	Suvla Bay	 In 1915, Newfoundland sent its Newfoundland Regiment to Suvla Bay in Gallipoli to fight the Turks. This classic image does them honor. Have you ever heard of them? Share the news with this great T-shirt!	12.99	0.00	suvla-bay.gif	suvla-bay-2.gif	suvla-bay-thumbnail.gif	0
64	Caribou	There was a time when Newfoundland was a self-governing dominion of the British Empire, so it printed its own postage. The themes are as typically Canadian as can be, however, as shown by this "King of the Wilde" T-shirt!	21.00	19.95	caribou.gif	caribou-2.gif	caribou-thumbnail.gif	2
65	Afghan Flower	This beautiful image was issued to celebrate National Teachers Day. Perhaps you know a teacher who would love this T-shirt?	18.50	16.99	afghan-flower.gif	afghan-flower-2.gif	afghan-flower-thumbnail.gif	2
66	Albania Flower	Well, these crab apples started out as flowers, so that's close enough for us! They still make for a uniquely beautiful T-shirt.	16.00	14.95	albania-flower.gif	albania-flower-2.gif	albania-flower-thumbnail.gif	2
67	Austria Flower	Have you ever had nasturtiums on your salad? Try it--they're almost as good as having them on your T-shirt!	12.99	0.00	austria-flower.gif	austria-flower-2.gif	austria-flower-thumbnail.gif	0
68	Bulgarian Flower	For your interest (and to impress your friends), this beautiful stamp was issued to honor the George Dimitrov state printing works. You'll need to know this when you wear the T-shirt.	16.00	14.99	bulgarian-flower.gif	bulgarian-flower-2.gif	bulgarian-flower-thumbnail.gif	2
69	Colombia Flower	Celebrating the 75th anniversary of the Universal Postal Union, a date to mark on your calendar and on which to wear this T-shirt!	14.50	12.95	colombia-flower.gif	colombia-flower-2.gif	colombia-flower-thumbnail.gif	1
70	Congo Flower	The Congo is not at a loss for beautiful flowers, and we've picked a few of them for your T-shirts.	21.00	17.99	congo-flower.gif	congo-flower-2.gif	congo-flower-thumbnail.gif	2
71	Costa Rica Flower	This national flower of Costa Rica is one of our most beloved flower T-shirts (you can see one on Jill, above). You will surely stand out in this T-shirt!	12.99	0.00	costa-rica-flower.gif	costa-rica-flower.gif	costa-rica-flower-thumbnail.gif	0
72	Gabon Flower	The combretum, also known as "jungle weed," is used in China as a cure for opium addiction. Unfortunately, when you wear this T-shirt, others may become hopelessly addicted to you!	19.00	16.95	gabon-flower.gif	gabon-flower-2.gif	gabon-flower-thumbnail.gif	2
73	Ghana Flower	This is one of the first gingers to bloom in the spring--just like you when you wear this T-shirt!	21.00	18.99	ghana-flower.gif	ghana-flower-2.gif	ghana-flower-thumbnail.gif	2
74	Israel Flower	This plant is native to the rocky and sandy regions of the western United States, so when you come across one, it really stands out. And so will you when you put on this beautiful T-shirt!	19.50	17.50	israel-flower.gif	israel-flower-2.gif	israel-flower-thumbnail.gif	2
75	Poland Flower	A beautiful and sunny T-shirt for both spring and summer!	16.95	15.99	poland-flower.gif	poland-flower-2.gif	poland-flower-thumbnail.gif	2
76	Romania Flower	Also known as the spring pheasant's eye, this flower belongs on your T-shirt this summer to help you catch a few eyes.	12.95	0.00	romania-flower.gif	romania-flower-2.gif	romania-flower-thumbnail.gif	0
77	Russia Flower	Someone out there who can speak Russian needs to tell me what this plant is. I'll sell you the T-shirt for $10 if you can!	21.00	18.95	russia-flower.gif	russia-flower-2.gif	russia-flower-thumbnail.gif	0
78	San Marino Flower	"A white sport coat and a pink carnation, I'm all dressed up for the dance!" Well, how about a white T-shirt and a pink carnation?!	19.95	17.99	san-marino-flower.gif	san-marino-flower-2.gif	san-marino-flower-thumbnail.gif	2
79	Uruguay Flower	The Indian Queen Anahi was the ugliest woman ever seen. But instead of living a slave when captured by the Conquistadores, she immolated herself in a fire and was reborn the most beautiful of flowers: the ceibo, national flower of Uruguay. Of course, you won't need to burn to wear this T-shirt, but you may cause some pretty hot glances to be thrown your way!	17.99	16.99	uruguay-flower.gif	uruguay-flower-2.gif	uruguay-flower-thumbnail.gif	2
80	Snow Deer	Tarmo has produced some wonderful Christmas T-shirts for us, and we hope to have many more soon.	21.00	18.95	snow-deer.gif	snow-deer-2.gif	snow-deer-thumbnail.gif	2
81	Holly Cat	Few things make a cat happier at Christmas than a tree suddenly appearing in the house!	15.99	0.00	holly-cat.gif	holly-cat-2.gif	holly-cat-thumbnail.gif	0
82	Christmas Seal	Is this your grandmother? It could be, you know, and I'd bet she'd recognize the Christmas seal on this cool Christmas T-shirt.	19.99	17.99	christmas-seal.gif	christmas-seal-2.gif	christmas-seal-thumbnail.gif	2
83	Weather Vane	This weather vane dates from the 1830's and is still showing which way the wind blows! Trumpet your arrival with this unique Christmas T-shirt.	15.95	14.99	weather-vane.gif	weather-vane-2.gif	weather-vane-thumbnail.gif	2
84	Mistletoe	This well-known parasite and killer of trees was revered by the Druids, who would go out and gather it with great ceremony. Youths would go about with it to announce the new year. Eventually more engaging customs were attached to the strange plant, and we're here to see that they continue with these cool Christmas T-shirts.	19.00	17.99	mistletoe.gif	mistletoe-2.gif	mistletoe-thumbnail.gif	3
85	Altar Piece	This beautiful angel Christmas T-shirt is awaiting the opportunity to adorn your chest!	20.50	18.50	altar-piece.gif	altar-piece-2.gif	altar-piece-thumbnail.gif	2
86	The Three Wise Men	This is a classic rendition of one of the season	12.99	0.00	the-three-wise-men.gif	the-three-wise-men-2.gif	the-three-wise-men-thumbnail.gif	0
87	Christmas Tree	Can you get more warm and folksy than this classic Christmas T-shirt?	20.00	17.95	christmas-tree.gif	christmas-tree-2.gif	christmas-tree-thumbnail.gif	2
88	Madonna & Child	This exquisite image was painted by Filipino Lippi, a 15th century Italian artist. I think he would approve of it on a Going Postal Christmas T-shirt!	21.95	18.50	madonna-child.gif	madonna-child-2.gif	madonna-child-thumbnail.gif	0
89	The Virgin Mary	This stained glass window is found in Glasgow Cathedral, Scotland, and was created by Gabriel Loire of France, one of the most prolific of artists in this medium--and now you can have it on this wonderful Christmas T-shirt.	16.95	15.95	the-virgin-mary.gif	the-virgin-mary-2.gif	the-virgin-mary-thumbnail.gif	2
90	Adoration of the Kings	This design is from a miniature in the Evangelistary of Matilda in Nonantola Abbey, from the 12th century. As a Christmas T-shirt, it will cause you to be adored!	17.50	16.50	adoration-of-the-kings.gif	adoration-of-the-kings-2.gif	adoration-of-the-kings-thumbnail.gif	2
91	A Partridge in a Pear Tree	The original of this beautiful stamp is by Jamie Wyeth and is in the National Gallery of Art. The next best is on our beautiful Christmas T-shirt!	14.99	0.00	a-partridge-in-a-pear-tree.gif	a-partridge-in-a-pear-tree-2.gif	a-partridge-in-a-pear-tree-thumbnail.gif	0
92	St. Lucy	This is a tiny detail of a large work called "Mary, Queen of Heaven," done in 1480 by a Flemish master known only as "The Master of St. Lucy Legend." The original is in a Bruges church. The not-quite-original is on this cool Christmas T-shirt.	18.95	0.00	st-lucy.gif	st-lucy-2.gif	st-lucy-thumbnail.gif	0
93	St. Lucia	Saint Lucia's tradition is an important part of Swedish Christmas, and an important part of that are the candles. Next to the candles in importance is this popular Christmas T-shirt!	19.00	17.95	st-lucia.gif	st-lucia-2.gif	st-lucia-thumbnail.gif	2
94	Swede Santa	Santa as a child. You must know a child who would love this cool Christmas T-shirt!?	21.00	18.50	swede-santa.gif	swede-santa-2.gif	swede-santa-thumbnail.gif	2
95	Wreath	Hey! I've got an idea! Why not buy two of these cool Christmas T-shirts so you can wear one and tack the other one to your door?!	18.99	16.99	wreath.gif	wreath-2.gif	wreath-thumbnail.gif	2
96	Love	Here's a Valentine's day T-shirt that will let you say it all in just one easy glance--there's no mistake about it!	19.00	17.50	love.gif	love-2.gif	love-thumbnail.gif	2
97	Birds	Is your heart all aflutter? Show it with this T-shirt!	21.00	18.95	birds.gif	birds-2.gif	birds-thumbnail.gif	2
98	Kat Over New Moon	Love making you feel lighthearted?	14.99	0.00	kat-over-new-moon.gif	kat-over-new-moon-2.gif	kat-over-new-moon-thumbnail.gif	0
99	Thrilling Love	This girl's got her hockey hunk right where she wants him!	21.00	18.50	thrilling-love.gif	thrilling-love-2.gif	thrilling-love-thumbnail.gif	2
100	The Rapture of Psyche	Now we're getting a bit more serious!	18.95	16.99	the-rapture-of-psyche.gif	the-rapture-of-psyche-2.gif	the-rapture-of-psyche-thumbnail.gif	2
101	The Promise of Spring	With Valentine's Day come, can Spring be far behind?	21.00	19.50	the-promise-of-spring.gif	the-promise-of-spring-2.gif	the-promise-of-spring-thumbnail.gif	0
102	asdfasdf		10.05	0.00	\N	\N	\N	0
\.


--
-- Data for Name: product_attribute; Type: TABLE DATA; Schema: turing; Owner: -
--

COPY public.product_attribute (product_id, attribute_value_id) FROM stdin;
1	1
1	2
1	3
1	4
1	5
1	6
1	7
1	8
1	9
1	10
1	11
1	12
1	13
1	14
2	1
2	2
2	3
2	4
2	5
2	6
2	7
2	8
2	9
2	10
2	11
2	12
2	13
2	14
3	1
3	2
3	3
3	4
3	5
3	6
3	7
3	8
3	9
3	10
3	11
3	12
3	13
3	14
4	1
4	2
4	3
4	4
4	5
4	6
4	7
4	8
4	9
4	10
4	11
4	12
4	13
4	14
5	1
5	2
5	3
5	4
5	5
5	6
5	7
5	8
5	9
5	10
5	11
5	12
5	13
5	14
6	1
6	2
6	3
6	4
6	5
6	6
6	7
6	8
6	9
6	10
6	11
6	12
6	13
6	14
7	1
7	2
7	3
7	4
7	5
7	6
7	7
7	8
7	9
7	10
7	11
7	12
7	13
7	14
8	1
8	2
8	3
8	4
8	5
8	6
8	7
8	8
8	9
8	10
8	11
8	12
8	13
8	14
9	1
9	2
9	3
9	4
9	5
9	6
9	7
9	8
9	9
9	10
9	11
9	12
9	13
9	14
10	1
10	2
10	3
10	4
10	5
10	6
10	7
10	8
10	9
10	10
10	11
10	12
10	13
10	14
11	1
11	2
11	3
11	4
11	5
11	6
11	7
11	8
11	9
11	10
11	11
11	12
11	13
11	14
12	1
12	2
12	3
12	4
12	5
12	6
12	7
12	8
12	9
12	10
12	11
12	12
12	13
12	14
13	1
13	2
13	3
13	4
13	5
13	6
13	7
13	8
13	9
13	10
13	11
13	12
13	13
13	14
14	1
14	2
14	3
14	4
14	5
14	6
14	7
14	8
14	9
14	10
14	11
14	12
14	13
14	14
15	1
15	2
15	3
15	4
15	5
15	6
15	7
15	8
15	9
15	10
15	11
15	12
15	13
15	14
16	1
16	2
16	3
16	4
16	5
16	6
16	7
16	8
16	9
16	10
16	11
16	12
16	13
16	14
17	1
17	2
17	3
17	4
17	5
17	6
17	7
17	8
17	9
17	10
17	11
17	12
17	13
17	14
18	1
18	2
18	3
18	4
18	5
18	6
18	7
18	8
18	9
18	10
18	11
18	12
18	13
18	14
19	1
19	2
19	3
19	4
19	5
19	6
19	7
19	8
19	9
19	10
19	11
19	12
19	13
19	14
20	1
20	2
20	3
20	4
20	5
20	6
20	7
20	8
20	9
20	10
20	11
20	12
20	13
20	14
21	1
21	2
21	3
21	4
21	5
21	6
21	7
21	8
21	9
21	10
21	11
21	12
21	13
21	14
22	1
22	2
22	3
22	4
22	5
22	6
22	7
22	8
22	9
22	10
22	11
22	12
22	13
22	14
23	1
23	2
23	3
23	4
23	5
23	6
23	7
23	8
23	9
23	10
23	11
23	12
23	13
23	14
24	1
24	2
24	3
24	4
24	5
24	6
24	7
24	8
24	9
24	10
24	11
24	12
24	13
24	14
25	1
25	2
25	3
25	4
25	5
25	6
25	7
25	8
25	9
25	10
25	11
25	12
25	13
25	14
26	1
26	2
26	3
26	4
26	5
26	6
26	7
26	8
26	9
26	10
26	11
26	12
26	13
26	14
27	1
27	2
27	3
27	4
27	5
27	6
27	7
27	8
27	9
27	10
27	11
27	12
27	13
27	14
28	1
28	2
28	3
28	4
28	5
28	6
28	7
28	8
28	9
28	10
28	11
28	12
28	13
28	14
29	1
29	2
29	3
29	4
29	5
29	6
29	7
29	8
29	9
29	10
29	11
29	12
29	13
29	14
30	1
30	2
30	3
30	4
30	5
30	6
30	7
30	8
30	9
30	10
30	11
30	12
30	13
30	14
31	1
31	2
31	3
31	4
31	5
31	6
31	7
31	8
31	9
31	10
31	11
31	12
31	13
31	14
32	1
32	2
32	3
32	4
32	5
32	6
32	7
32	8
32	9
32	10
32	11
32	12
32	13
32	14
33	1
33	2
33	3
33	4
33	5
33	6
33	7
33	8
33	9
33	10
33	11
33	12
33	13
33	14
34	1
34	2
34	3
34	4
34	5
34	6
34	7
34	8
34	9
34	10
34	11
34	12
34	13
34	14
35	1
35	2
35	3
35	4
35	5
35	6
35	7
35	8
35	9
35	10
35	11
35	12
35	13
35	14
36	1
36	2
36	3
36	4
36	5
36	6
36	7
36	8
36	9
36	10
36	11
36	12
36	13
36	14
37	1
37	2
37	3
37	4
37	5
37	6
37	7
37	8
37	9
37	10
37	11
37	12
37	13
37	14
38	1
38	2
38	3
38	4
38	5
38	6
38	7
38	8
38	9
38	10
38	11
38	12
38	13
38	14
39	1
39	2
39	3
39	4
39	5
39	6
39	7
39	8
39	9
39	10
39	11
39	12
39	13
39	14
40	1
40	2
40	3
40	4
40	5
40	6
40	7
40	8
40	9
40	10
40	11
40	12
40	13
40	14
41	1
41	2
41	3
41	4
41	5
41	6
41	7
41	8
41	9
41	10
41	11
41	12
41	13
41	14
42	1
42	2
42	3
42	4
42	5
42	6
42	7
42	8
42	9
42	10
42	11
42	12
42	13
42	14
43	1
43	2
43	3
43	4
43	5
43	6
43	7
43	8
43	9
43	10
43	11
43	12
43	13
43	14
44	1
44	2
44	3
44	4
44	5
44	6
44	7
44	8
44	9
44	10
44	11
44	12
44	13
44	14
45	1
45	2
45	3
45	4
45	5
45	6
45	7
45	8
45	9
45	10
45	11
45	12
45	13
45	14
46	1
46	2
46	3
46	4
46	5
46	6
46	7
46	8
46	9
46	10
46	11
46	12
46	13
46	14
47	1
47	2
47	3
47	4
47	5
47	6
47	7
47	8
47	9
47	10
47	11
47	12
47	13
47	14
48	1
48	2
48	3
48	4
48	5
48	6
48	7
48	8
48	9
48	10
48	11
48	12
48	13
48	14
49	1
49	2
49	3
49	4
49	5
49	6
49	7
49	8
49	9
49	10
49	11
49	12
49	13
49	14
50	1
50	2
50	3
50	4
50	5
50	6
50	7
50	8
50	9
50	10
50	11
50	12
50	13
50	14
51	1
51	2
51	3
51	4
51	5
51	6
51	7
51	8
51	9
51	10
51	11
51	12
51	13
51	14
52	1
52	2
52	3
52	4
52	5
52	6
52	7
52	8
52	9
52	10
52	11
52	12
52	13
52	14
53	1
53	2
53	3
53	4
53	5
53	6
53	7
53	8
53	9
53	10
53	11
53	12
53	13
53	14
54	1
54	2
54	3
54	4
54	5
54	6
54	7
54	8
54	9
54	10
54	11
54	12
54	13
54	14
55	1
55	2
55	3
55	4
55	5
55	6
55	7
55	8
55	9
55	10
55	11
55	12
55	13
55	14
56	1
56	2
56	3
56	4
56	5
56	6
56	7
56	8
56	9
56	10
56	11
56	12
56	13
56	14
57	1
57	2
57	3
57	4
57	5
57	6
57	7
57	8
57	9
57	10
57	11
57	12
57	13
57	14
58	1
58	2
58	3
58	4
58	5
58	6
58	7
58	8
58	9
58	10
58	11
58	12
58	13
58	14
59	1
59	2
59	3
59	4
59	5
59	6
59	7
59	8
59	9
59	10
59	11
59	12
59	13
59	14
60	1
60	2
60	3
60	4
60	5
60	6
60	7
60	8
60	9
60	10
60	11
60	12
60	13
60	14
61	1
61	2
61	3
61	4
61	5
61	6
61	7
61	8
61	9
61	10
61	11
61	12
61	13
61	14
62	1
62	2
62	3
62	4
62	5
62	6
62	7
62	8
62	9
62	10
62	11
62	12
62	13
62	14
63	1
63	2
63	3
63	4
63	5
63	6
63	7
63	8
63	9
63	10
63	11
63	12
63	13
63	14
64	1
64	2
64	3
64	4
64	5
64	6
64	7
64	8
64	9
64	10
64	11
64	12
64	13
64	14
65	1
65	2
65	3
65	4
65	5
65	6
65	7
65	8
65	9
65	10
65	11
65	12
65	13
65	14
66	1
66	2
66	3
66	4
66	5
66	6
66	7
66	8
66	9
66	10
66	11
66	12
66	13
66	14
67	1
67	2
67	3
67	4
67	5
67	6
67	7
67	8
67	9
67	10
67	11
67	12
67	13
67	14
68	1
68	2
68	3
68	4
68	5
68	6
68	7
68	8
68	9
68	10
68	11
68	12
68	13
68	14
69	1
69	2
69	3
69	4
69	5
69	6
69	7
69	8
69	9
69	10
69	11
69	12
69	13
69	14
70	1
70	2
70	3
70	4
70	5
70	6
70	7
70	8
70	9
70	10
70	11
70	12
70	13
70	14
71	1
71	2
71	3
71	4
71	5
71	6
71	7
71	8
71	9
71	10
71	11
71	12
71	13
71	14
72	1
72	2
72	3
72	4
72	5
72	6
72	7
72	8
72	9
72	10
72	11
72	12
72	13
72	14
73	1
73	2
73	3
73	4
73	5
73	6
73	7
73	8
73	9
73	10
73	11
73	12
73	13
73	14
74	1
74	2
74	3
74	4
74	5
74	6
74	7
74	8
74	9
74	10
74	11
74	12
74	13
74	14
75	1
75	2
75	3
75	4
75	5
75	6
75	7
75	8
75	9
75	10
75	11
75	12
75	13
75	14
76	1
76	2
76	3
76	4
76	5
76	6
76	7
76	8
76	9
76	10
76	11
76	12
76	13
76	14
77	1
77	2
77	3
77	4
77	5
77	6
77	7
77	8
77	9
77	10
77	11
77	12
77	13
77	14
78	1
78	2
78	3
78	4
78	5
78	6
78	7
78	8
78	9
78	10
78	11
78	12
78	13
78	14
79	1
79	2
79	3
79	4
79	5
79	6
79	7
79	8
79	9
79	10
79	11
79	12
79	13
79	14
80	1
80	2
80	3
80	4
80	5
80	6
80	7
80	8
80	9
80	10
80	11
80	12
80	13
80	14
81	1
81	2
81	3
81	4
81	5
81	6
81	7
81	8
81	9
81	10
81	11
81	12
81	13
81	14
82	1
82	2
82	3
82	4
82	5
82	6
82	7
82	8
82	9
82	10
82	11
82	12
82	13
82	14
83	1
83	2
83	3
83	4
83	5
83	6
83	7
83	8
83	9
83	10
83	11
83	12
83	13
83	14
84	1
84	2
84	3
84	4
84	5
84	6
84	7
84	8
84	9
84	10
84	11
84	12
84	13
84	14
85	1
85	2
85	3
85	4
85	5
85	6
85	7
85	8
85	9
85	10
85	11
85	12
85	13
85	14
86	1
86	2
86	3
86	4
86	5
86	6
86	7
86	8
86	9
86	10
86	11
86	12
86	13
86	14
87	1
87	2
87	3
87	4
87	5
87	6
87	7
87	8
87	9
87	10
87	11
87	12
87	13
87	14
88	1
88	2
88	3
88	4
88	5
88	6
88	7
88	8
88	9
88	10
88	11
88	12
88	13
88	14
89	1
89	2
89	3
89	4
89	5
89	6
89	7
89	8
89	9
89	10
89	11
89	12
89	13
89	14
90	1
90	2
90	3
90	4
90	5
90	6
90	7
90	8
90	9
90	10
90	11
90	12
90	13
90	14
91	1
91	2
91	3
91	4
91	5
91	6
91	7
91	8
91	9
91	10
91	11
91	12
91	13
91	14
92	1
92	2
92	3
92	4
92	5
92	6
92	7
92	8
92	9
92	10
92	11
92	12
92	13
92	14
93	1
93	2
93	3
93	4
93	5
93	6
93	7
93	8
93	9
93	10
93	11
93	12
93	13
93	14
94	1
94	2
94	3
94	4
94	5
94	6
94	7
94	8
94	9
94	10
94	11
94	12
94	13
94	14
95	1
95	2
95	3
95	4
95	5
95	6
95	7
95	8
95	9
95	10
95	11
95	12
95	13
95	14
96	1
96	2
96	3
96	4
96	5
96	6
96	7
96	8
96	9
96	10
96	11
96	12
96	13
96	14
97	1
97	2
97	3
97	4
97	5
97	6
97	7
97	8
97	9
97	10
97	11
97	12
97	13
97	14
98	1
98	2
98	3
98	4
98	5
98	6
98	7
98	8
98	9
98	10
98	11
98	12
98	13
98	14
99	1
99	2
99	3
99	4
99	5
99	6
99	7
99	8
99	9
99	10
99	11
99	12
99	13
99	14
100	1
100	2
100	3
100	4
100	5
100	6
100	7
100	8
100	9
100	10
100	11
100	12
100	13
100	14
101	1
101	2
101	3
101	4
101	5
101	6
101	7
101	8
101	9
101	10
101	11
101	12
101	13
101	14
\.


--
-- Data for Name: product_category; Type: TABLE DATA; Schema: turing; Owner: -
--

COPY public.product_category (product_id, category_id) FROM stdin;
1	1
2	1
3	1
4	1
5	1
6	1
7	1
8	1
9	1
10	1
11	1
12	1
13	1
14	1
15	1
16	1
17	1
18	1
19	2
20	2
21	2
22	2
23	2
24	2
25	2
26	2
27	2
28	2
29	3
30	3
31	3
32	3
33	3
34	3
35	3
36	4
37	4
38	4
39	4
40	4
41	4
42	4
43	4
44	4
45	4
46	4
47	4
48	4
49	4
50	4
51	4
52	4
53	4
54	4
55	4
56	4
57	4
58	4
59	4
60	4
61	4
62	4
63	4
64	4
65	5
66	5
67	5
68	5
69	5
70	5
71	5
72	5
73	5
74	5
75	5
76	5
77	5
78	5
79	5
80	6
81	4
81	6
82	6
83	6
84	6
85	6
86	6
87	6
88	6
89	6
90	6
91	6
92	6
93	6
94	6
95	6
96	7
97	4
97	7
98	4
98	7
99	7
100	7
101	7
\.


--
-- Data for Name: review; Type: TABLE DATA; Schema: turing; Owner: -
--

COPY public.review (review_id, customer_id, product_id, review, rating, created_on) FROM stdin;
\.


--
-- Data for Name: shipping; Type: TABLE DATA; Schema: turing; Owner: -
--

COPY public.shipping (shipping_id, shipping_type, shipping_cost, shipping_region_id) FROM stdin;
1	Next Day Delivery ($20)	20.00	2
2	3-4 Days ($10)	10.00	2
3	7 Days ($5)	5.00	2
4	By air (7 days, $25)	25.00	3
5	By sea (28 days, $10)	10.00	3
6	By air (10 days, $35)	35.00	4
7	By sea (28 days, $30)	30.00	4
\.


--
-- Data for Name: shipping_region; Type: TABLE DATA; Schema: turing; Owner: -
--

COPY public.shipping_region (shipping_region_id, shipping_region) FROM stdin;
1	Please Select
2	US / Canada
3	Europe
4	Rest of World
\.


--
-- Data for Name: shopping_cart; Type: TABLE DATA; Schema: turing; Owner: -
--

COPY public.shopping_cart (item_id, cart_id, product_id, attributes, quantity, buy_now, added_on) FROM stdin;
\.


--
-- Data for Name: tax; Type: TABLE DATA; Schema: turing; Owner: -
--

COPY public.tax (tax_id, tax_type, tax_percentage) FROM stdin;
1	Sales Tax at 8.5%	8.50
2	No Tax	0.00
\.


--
-- Name: adonis_schema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.adonis_schema_id_seq', 2, true);


--
-- Name: tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tokens_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 12, true);


--
-- Name: attribute_attribute_id_seq; Type: SEQUENCE SET; Schema: turing; Owner: -
--

SELECT pg_catalog.setval('public.attribute_attribute_id_seq', 3, true);


--
-- Name: attribute_value_attribute_value_id_seq; Type: SEQUENCE SET; Schema: turing; Owner: -
--

SELECT pg_catalog.setval('public.attribute_value_attribute_value_id_seq', 16, true);


--
-- Name: audit_audit_id_seq; Type: SEQUENCE SET; Schema: turing; Owner: -
--

SELECT pg_catalog.setval('public.audit_audit_id_seq', 1, true);


--
-- Name: category_category_id_seq; Type: SEQUENCE SET; Schema: turing; Owner: -
--

SELECT pg_catalog.setval('public.category_category_id_seq', 10, true);


--
-- Name: customer_customer_id_seq; Type: SEQUENCE SET; Schema: turing; Owner: -
--

SELECT pg_catalog.setval('public.customer_customer_id_seq', 1, true);


--
-- Name: department_department_id_seq; Type: SEQUENCE SET; Schema: turing; Owner: -
--

SELECT pg_catalog.setval('public.department_department_id_seq', 11, true);


--
-- Name: order_detail_item_id_seq; Type: SEQUENCE SET; Schema: turing; Owner: -
--

SELECT pg_catalog.setval('public.order_detail_item_id_seq', 1, true);


--
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: turing; Owner: -
--

SELECT pg_catalog.setval('public.orders_order_id_seq', 1, true);


--
-- Name: product_product_id_seq; Type: SEQUENCE SET; Schema: turing; Owner: -
--

SELECT pg_catalog.setval('public.product_product_id_seq', 102, true);


--
-- Name: review_review_id_seq; Type: SEQUENCE SET; Schema: turing; Owner: -
--

SELECT pg_catalog.setval('public.review_review_id_seq', 1, true);


--
-- Name: shipping_region_shipping_region_id_seq; Type: SEQUENCE SET; Schema: turing; Owner: -
--

SELECT pg_catalog.setval('public.shipping_region_shipping_region_id_seq', 4, true);


--
-- Name: shipping_shipping_id_seq; Type: SEQUENCE SET; Schema: turing; Owner: -
--

SELECT pg_catalog.setval('public.shipping_shipping_id_seq', 7, true);


--
-- Name: shopping_cart_item_id_seq; Type: SEQUENCE SET; Schema: turing; Owner: -
--

SELECT pg_catalog.setval('public.shopping_cart_item_id_seq', 1, true);


--
-- Name: tax_tax_id_seq; Type: SEQUENCE SET; Schema: turing; Owner: -
--

SELECT pg_catalog.setval('public.tax_tax_id_seq', 2, true);


--
-- Name: adonis_schema adonis_schema_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.adonis_schema
    ADD CONSTRAINT adonis_schema_pkey PRIMARY KEY (id);


--
-- Name: tokens tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (id);


--
-- Name: tokens tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_token_unique UNIQUE (token);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_unique UNIQUE (username);


--
-- Name: attribute idx_44491_primary; Type: CONSTRAINT; Schema: turing; Owner: -
--

ALTER TABLE ONLY public.attribute
    ADD CONSTRAINT idx_44491_primary PRIMARY KEY (attribute_id);


--
-- Name: attribute_value idx_44497_primary; Type: CONSTRAINT; Schema: turing; Owner: -
--

ALTER TABLE ONLY public.attribute_value
    ADD CONSTRAINT idx_44497_primary PRIMARY KEY (attribute_value_id);


--
-- Name: audit idx_44503_primary; Type: CONSTRAINT; Schema: turing; Owner: -
--

ALTER TABLE ONLY public.audit
    ADD CONSTRAINT idx_44503_primary PRIMARY KEY (audit_id);


--
-- Name: category idx_44512_primary; Type: CONSTRAINT; Schema: turing; Owner: -
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT idx_44512_primary PRIMARY KEY (category_id);


--
-- Name: customer idx_44521_primary; Type: CONSTRAINT; Schema: turing; Owner: -
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT idx_44521_primary PRIMARY KEY (customer_id);


--
-- Name: department idx_44531_primary; Type: CONSTRAINT; Schema: turing; Owner: -
--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT idx_44531_primary PRIMARY KEY (department_id);


--
-- Name: orders idx_44540_primary; Type: CONSTRAINT; Schema: turing; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT idx_44540_primary PRIMARY KEY (order_id);


--
-- Name: order_detail idx_44548_primary; Type: CONSTRAINT; Schema: turing; Owner: -
--

ALTER TABLE ONLY public.order_detail
    ADD CONSTRAINT idx_44548_primary PRIMARY KEY (item_id);


--
-- Name: product idx_44557_primary; Type: CONSTRAINT; Schema: turing; Owner: -
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT idx_44557_primary PRIMARY KEY (product_id);


--
-- Name: product_attribute idx_44566_primary; Type: CONSTRAINT; Schema: turing; Owner: -
--

ALTER TABLE ONLY public.product_attribute
    ADD CONSTRAINT idx_44566_primary PRIMARY KEY (product_id, attribute_value_id);


--
-- Name: product_category idx_44569_primary; Type: CONSTRAINT; Schema: turing; Owner: -
--

ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT idx_44569_primary PRIMARY KEY (product_id, category_id);


--
-- Name: review idx_44574_primary; Type: CONSTRAINT; Schema: turing; Owner: -
--

ALTER TABLE ONLY public.review
    ADD CONSTRAINT idx_44574_primary PRIMARY KEY (review_id);


--
-- Name: shipping idx_44583_primary; Type: CONSTRAINT; Schema: turing; Owner: -
--

ALTER TABLE ONLY public.shipping
    ADD CONSTRAINT idx_44583_primary PRIMARY KEY (shipping_id);


--
-- Name: shipping_region idx_44589_primary; Type: CONSTRAINT; Schema: turing; Owner: -
--

ALTER TABLE ONLY public.shipping_region
    ADD CONSTRAINT idx_44589_primary PRIMARY KEY (shipping_region_id);


--
-- Name: shopping_cart idx_44595_primary; Type: CONSTRAINT; Schema: turing; Owner: -
--

ALTER TABLE ONLY public.shopping_cart
    ADD CONSTRAINT idx_44595_primary PRIMARY KEY (item_id);


--
-- Name: tax idx_44605_primary; Type: CONSTRAINT; Schema: turing; Owner: -
--

ALTER TABLE ONLY public.tax
    ADD CONSTRAINT idx_44605_primary PRIMARY KEY (tax_id);


--
-- Name: tokens_token_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tokens_token_index ON public.tokens USING btree (token);


--
-- Name: idx_44497_idx_attribute_value_attribute_id; Type: INDEX; Schema: turing; Owner: -
--

CREATE INDEX idx_44497_idx_attribute_value_attribute_id ON public.attribute_value USING btree (attribute_id);


--
-- Name: idx_44503_idx_audit_order_id; Type: INDEX; Schema: turing; Owner: -
--

CREATE INDEX idx_44503_idx_audit_order_id ON public.audit USING btree (order_id);


--
-- Name: idx_44512_idx_category_department_id; Type: INDEX; Schema: turing; Owner: -
--

CREATE INDEX idx_44512_idx_category_department_id ON public.category USING btree (department_id);


--
-- Name: idx_44521_idx_customer_email; Type: INDEX; Schema: turing; Owner: -
--

CREATE UNIQUE INDEX idx_44521_idx_customer_email ON public.customer USING btree (email);


--
-- Name: idx_44521_idx_customer_shipping_region_id; Type: INDEX; Schema: turing; Owner: -
--

CREATE INDEX idx_44521_idx_customer_shipping_region_id ON public.customer USING btree (shipping_region_id);


--
-- Name: idx_44540_idx_orders_customer_id; Type: INDEX; Schema: turing; Owner: -
--

CREATE INDEX idx_44540_idx_orders_customer_id ON public.orders USING btree (customer_id);


--
-- Name: idx_44540_idx_orders_shipping_id; Type: INDEX; Schema: turing; Owner: -
--

CREATE INDEX idx_44540_idx_orders_shipping_id ON public.orders USING btree (shipping_id);


--
-- Name: idx_44540_idx_orders_tax_id; Type: INDEX; Schema: turing; Owner: -
--

CREATE INDEX idx_44540_idx_orders_tax_id ON public.orders USING btree (tax_id);


--
-- Name: idx_44548_idx_order_detail_order_id; Type: INDEX; Schema: turing; Owner: -
--

CREATE INDEX idx_44548_idx_order_detail_order_id ON public.order_detail USING btree (order_id);


--
-- Name: idx_44557_idx_ft_product_name_description; Type: INDEX; Schema: turing; Owner: -
--

CREATE INDEX idx_44557_idx_ft_product_name_description ON public.product USING btree (name, description);


--
-- Name: idx_44574_idx_review_customer_id; Type: INDEX; Schema: turing; Owner: -
--

CREATE INDEX idx_44574_idx_review_customer_id ON public.review USING btree (customer_id);


--
-- Name: idx_44574_idx_review_product_id; Type: INDEX; Schema: turing; Owner: -
--

CREATE INDEX idx_44574_idx_review_product_id ON public.review USING btree (product_id);


--
-- Name: idx_44583_idx_shipping_shipping_region_id; Type: INDEX; Schema: turing; Owner: -
--

CREATE INDEX idx_44583_idx_shipping_shipping_region_id ON public.shipping USING btree (shipping_region_id);


--
-- Name: idx_44595_idx_shopping_cart_cart_id; Type: INDEX; Schema: turing; Owner: -
--

CREATE INDEX idx_44595_idx_shopping_cart_cart_id ON public.shopping_cart USING btree (cart_id);


--
-- Name: tokens tokens_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

