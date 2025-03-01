--
-- PostgreSQL database dump
--

-- Dumped from database version 17.3 (Debian 17.3-3.pgdg120+1)
-- Dumped by pg_dump version 17.3 (Debian 17.3-3.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: collections; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.collections (
    id bigint NOT NULL,
    name text
);


--
-- Name: skin_conditions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.skin_conditions (
    id bigint NOT NULL,
    condition text,
    price double precision,
    skin_id bigint,
    "timestamp" timestamp with time zone,
    stattrak boolean DEFAULT false
);


--
-- Name: skins; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.skins (
    id bigint NOT NULL,
    name text,
    min_float double precision,
    max_float double precision,
    collection_id bigint,
    quality text,
    stattrak_available boolean DEFAULT false,
    image_name text,
    last_of_rarity boolean DEFAULT false
);


--
-- Data for Name: collections; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.collections (id, name) FROM stdin;
1	2018 Inferno
2	2018 Nuke
3	2021 Dust 2
4	2021 Mirage
5	2021 Train
6	2021 Vertigo
7	Alpha
8	Ancient
9	Anubis
10	Assault
11	Aztec
12	Baggage
13	Bank
14	Cache
15	Canals
16	Chop Shop
17	Cobblestone
18	Control
19	Dust 2
20	Dust
21	Gods and Monsters
22	Havoc
23	Inferno
24	Italy
25	Lake
26	Militia
27	Mirage
28	Norse
29	Nuke
30	Office
31	Overpass
32	Rising Sun
33	Safehouse
34	St. Marc
35	Train
36	Vertigo
37	Chroma 2
38	Chroma 3
39	Chroma
40	Clutch
41	CS:GO
42	CS:GO   2
43	CS:GO   3
44	CS20
45	Danger Zone
46	Dreams & Nightmares
47	eSports 2013
48	eSports 2013 Winter
49	eSports 2014 Summer
50	Falchion
51	Fracture
52	Gamma 2
53	Gamma
54	Glove
55	Horizon
56	Huntsman
57	Kilowatt
58	Operation Bravo
59	Operation Breakout
60	Operation Broken Fang
61	Operation Hydra
62	Operation Phoenix
63	Operation Riptide
64	Operation Vanguard
65	Operation Wildfire
66	Prisma 2
67	Prisma
68	Recoil
69	Revolution
70	Revolver
71	Shadow
72	Shattered Web
73	Snakebite
74	Spectrum 2
75	Spectrum
76	Winter Offensive
77	Gallery
78	Graphic
79	2024 Overpass
80	Sport and Field
\.


--
-- Data for Name: skins; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.skins (id, name, min_float, max_float, collection_id, quality, stattrak_available, image_name, last_of_rarity) FROM stdin;
1	SG 553 | Integrale	0	1	1	classified_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sg556_cu_sg553_rally_light_large.904b6f70dc7c8fe107d2cdb5acbdd0be6f686a3f.png	t
2	Dual Berettas | Twin Turbo	0	1	1	classified_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_elite_cu_dual_elites_rally_light_large.5b3cf9c54a4e7927724560a210955a77887ecb2e.png	t
3	P250 | Vino Primo	0	1	1	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p250_gs_p250_checker_light_large.ed544cb647f7bf4e4ccc103a0b687b562d2fb297.png	f
4	AK-47 | Safety Net	0	0.6	1	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ak47_hy_mesh_safetyorange_light_large.f4ee68bc3bbd972ded65ec36b66259199b7fafb7.png	f
5	MP7 | Fade	0	0.25	1	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp7_aa_fade_mp7_light_large.ed53795666c445f3b00a4968062514b3bb5dd166.png	f
6	USP-S | Check Engine	0	0.6	1	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_usp_silencer_sp_mesh_safetyred_light_large.2236c5b787e251c103ddf44209b4b7731b3d9a43.png	f
7	SSG 08 | Hand Brake	0	1	1	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ssg08_gs_ssg08_checker_light_large.26b2d6ca1e703c0427c31fa43bb1bf9fca58690e.png	f
8	M4A4 | Converter	0	0.4	1	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_hy_red_hex_light_large.cd2153af94a302c0293620289716a29d9fbfbeca.png	f
9	Sawed-Off | Brake Light	0	0.08	1	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sawedoff_aa_vertigo_red_light_large.999797e68b2d5df290b2e5771b6c4bfb0de1ec8c.png	f
10	R8 Revolver | Nitro	0.06	0.8	1	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_revolver_so_orange_accents3_light_large.00867f70c109a7934345f92aae1be055b6a98abb.png	f
11	MAC-10 | Calf Skin	0	1	1	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mac10_gs_mac10_checker_light_large.15e4936899fbfca7c5980be83993e57aca446422.png	f
12	Glock-18 | High Beam	0	0.08	1	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_glock_aa_vertigo_blue_light_large.0f4a3ec87faf17bb8557aa3b57a99606ac24c44e.png	f
13	PP-Bizon | Candy Apple	0	0.3	1	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_bizon_so_red_light_large.0ee9cada135b87096b447521a05c0a2d437bf9ff.png	f
14	MP9 | Slide	0.06	0.8	1	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp9_hy_splatter3_light_large.e87822a5caeb6a7181e0e866612c755f78f66be1.png	f
15	MAG-7 | Rust Coat	0	1	1	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mag7_aq_steel_inferno_light_large.4313699bf1fb212a490703f11b20dab3479ebe9c.png	f
16	MP5-SD | Dirt Drop	0.06	0.8	1	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp5sd_sp_tape_short_rally_light_large.2fdb10eba1dbf17030a2c0867fc385fe0449b974.png	f
17	UMP-45 | Mudder	0.06	0.8	1	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ump45_hy_mottled_sand_light_large.14c5d59d597a00bdccaefe47a99de0e5b1f884d6.png	f
18	AUG | Sweeper	0	0.6	1	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_aug_sp_mesh_safetyblack_light_large.41766cdb86c7b662a4c6316b2864751c54940faf.png	f
19	M4A1-S | Control Panel	0	1	2	classified_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_silencer_gs_m4a1s_operator_light_large.1e257113e58841ad0613b4e268d51d239df69a0e.png	t
20	Tec-9 | Remote Control	0	1	2	classified_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_tec9_gs_tec9_envoy_light_large.068b8cb4ed0f4064624820bf2cf34ecc4c38d8b2.png	t
21	Glock-18 | Nuclear Garden	0	0.7	2	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_glock_am_nuclear_skulls_green_light_large.37c3765f928a0a002d283c0fa7f4f409f4fa9e82.png	f
22	MAG-7 | Core Breach	0	1	2	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mag7_hy_nuclear_hotorange_light_large.35367773b8501fa045ad8c58387c6f48fc848045.png	f
23	AUG | Random Access	0	0.5	2	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_aug_am_circuitboard_orange_light_large.da9f7304f48f9f02cdc452bf7761452f8fec6bc2.png	f
24	AWP | Acheron	0	0.8299999999999998	2	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_awp_hy_nuclear_skulls_redblue_light_large.601aa23f996c480640f439e05f204c5bd7fafa49.png	f
25	MP5-SD | Co-Processor	0	0.5	2	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp5sd_am_circuitboard_aqua_light_large.205e1ac1b5bfbbfa8f0449cc08b42daf3e4addd2.png	f
26	P250 | Exchanger	0	0.5	2	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p250_hy_ducts_blue_light_large.7e3036d2c146970842cfdd1e4b4529ee5480787c.png	f
27	P90 | Facility Negative	0	0.5	2	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p90_hy_blueprint_aqua_light_large.35f86b3da01a31539d5a592958c96356f63d1675.png	f
28	Galil AR | Cold Fusion	0	0.8299999999999998	2	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_galilar_hy_nuclear_skulls_aqua_light_large.7a9f8497a5e17485c2dcd09ec23da307bc3c06c3.png	f
29	M4A4 | Mainframe	0	0.5	2	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_am_circuitboard_silver_light_large.7a3b860966a77bcb8124a2c38cf4b0449fd542ba.png	f
30	Negev | Bulkhead	0	0.5	2	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_negev_hy_ducts_yellow_light_large.9d9335325a4a696ec6c2ef704ec1d4b3112c8c87.png	f
31	MP7 | Motherboard	0	0.5	2	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp7_am_circuitboard_green_light_large.0df678715d2256928d817c2e89575879f03ad68e.png	f
32	Five-SeveN | Coolant	0	0.5	2	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_fiveseven_hy_ducts_green_light_large.687c4ada7a094872eeb5b48cbff3ebac68a8d7ed.png	f
33	Nova | Mandrel	0	0.5	2	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_nova_hy_ducts_grey_light_large.5da9a312aedae8885ff2e4dec4387fe614ce4ee3.png	f
34	P250 | Facility Draft	0	0.5	2	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p250_hy_blueprint_red_light_large.aff5f9b0847413a1749e8636dfc9a92d1ed77f3e.png	f
35	PP-Bizon | Facility Sketch	0	0.5	2	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_bizon_hy_blueprint_white_light_large.5a8bb5711fec1758844f92beab8a1ecb054f91bd.png	f
36	UMP-45 | Facility Dark	0	0.5	2	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ump45_hy_blueprint_bluered_light_large.1f2e4c38f9f9e7e1d815aeb5af99c499c5ff4951.png	f
37	AK-47 | Gold Arabesque	0	0.7	3	covert_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ak47_gs_ak47_gold_arabesque_light_large.0d1b0b2bfcafe8d214837077367e7dd42394822e.png	t
38	UMP-45 | Fade	0	0.08	3	classified_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ump45_aa_fade_ump_light_large.8f6cd56e5075505e9cbda97e72ba49837a17b8f7.png	f
39	SSG 08 | Death Strike	0	0.8	3	classified_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ssg08_cu_ssg08_scorpion_light_large.4ef3abe29eb6c2f16a74dc404929e47ad05d297f.png	f
40	MAC-10 | Case Hardened	0	1	3	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mac10_aq_oiled_light_large.9d9de18ba0a4dc915e495c05b0d1419bd2cd7a02.png	f
41	M4A4 | Red DDPAT	0	0.5	3	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_hy_ddpat_urban_red_light_large.ecde1360b79a9d925495a523ee95eb9f4b4b17eb.png	f
42	USP-S | Orange Anolis	0	0.37	3	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_usp_silencer_am_lizard_red_light_large.8028fa8c551ef6e26b3fff892e8138b5294ad7fd.png	f
43	Nova | Quick Sand	0	0.5	3	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_nova_hy_torn_camo_paints_light_large.d53ec6ccfa639f7263876a96b019d3b3946af751.png	f
44	Galil AR | Amber Fade	0	0.4	3	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_galilar_aa_fade_metallic_light_large.6910731d5c0d857052afbba2d24416156a6a96ba.png	f
45	G3SG1 | New Roots	0	0.55	3	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_g3sg1_sp_moro_carving_lightblue_light_large.4d260ef80213690b0d967f94874fbed4c4a73484.png	f
46	P250 | Black & Tan	0	0.5	3	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p250_hy_desert_multicam_light_large.5e9064075a3dd4cec98f1fbb19372212ef94ec8d.png	f
47	MP9 | Old Roots	0	0.5	3	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp9_sp_moro_carving_yellow_light_large.c86dfd42974acb136ffd14f9b9a283fdb80ec135.png	f
48	M249 | Midnight Palm	0	0.5	3	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m249_sp_palm_night_light_large.8d8112a73e3c854dce2126fa766ae8a93532f1aa.png	f
49	AUG | Spalted Wood	0	0.48	3	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_aug_hy_dry_wood_light_large.e42f196cbcf1e4cf9bb0b382eb06b651a2aed038.png	f
50	Five-SeveN | Withered Vine	0	0.5	3	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_fiveseven_sp_moro_textile_purple_yellow_light_large.47cc81847e4fd47b359bf0cfea09910d03a32bd7.png	f
51	SG 553 | Bleached	0	0.5	3	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sg556_sp_desert_skulls_light_large.3ac80055b461251992cea8183d77a9e2c4662e9d.png	f
52	MP7 | Prey	0	0.48	3	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp7_sp_zebracam_red_light_large.d55be83c6281f9d9bf4125173dcea870cf9ca0b1.png	f
53	R8 Revolver | Desert Brush	0	0.6	3	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_revolver_hy_brush_camo_tan_light_large.4af5232b57afac32a9eb2f056cf6fdf968a94966.png	f
54	Sawed-Off | Parched	0	0.49000000000000005	3	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sawedoff_hy_desert_bloom_light_large.6222132707bdc3c9e20b8eada269c2620bfc5013.png	f
55	P90 | Desert DDPAT	0	0.5	3	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p90_hy_ddpat_desert_light_large.acbbe87329d4f77b28d2cc15ce2e89c5d50436a6.png	f
56	AWP | Desert Hydra	0	0.6	4	covert_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_awp_gs_awp_hydra_light_large.a69be92dd5f9eef4d88b9c640f3dbf15d8c8f78c.png	t
57	MP5-SD | Oxide Oasis	0	0.55	4	classified_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp5sd_gs_mp5_neon_flektarn_light_large.d76e6385501ee98562f3a5ce5fe08f7c68e10046.png	f
58	Desert Eagle | Fennec Fox	0	0.8	4	classified_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_deagle_gs_deagle_fennec_light_large.92dbda73edcc6eb6022f1f0248cb19063d7107aa.png	f
59	Glock-18 | Pink DDPAT	0.06	0.8	4	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_glock_hy_ddpat_pink_light_large.ddbb46e05e19607b8fa366cdb8efef39048e50e4.png	f
60	AUG | Sand Storm	0	0.5	4	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_aug_gs_aug_sand_storm_light_large.d5dd546bc762c78474aac4b7733af0e4e5f7f376.png	f
61	XM1014 | Elegant Vines	0	0.37	4	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_xm1014_am_moro_textile_bright_light_large.90d9c102cff5e50e56b5d4bdc9c967ab7ae7efd8.png	f
62	MP9 | Music Box	0	0.55	4	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp9_am_mirage_flowers_metalic_light_large.19bdfea08b854122c4e7e71852bddda9a59ed3cd.png	f
63	USP-S | Purple DDPAT	0	0.55	4	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_usp_silencer_am_ddpat_purple_light_large.993825dcdc1100cdaf92b119e82b2ba756a38bea.png	f
64	M249 | Humidor	0	0.5	4	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m249_sp_moro_carving_burnt_light_large.665c8aa42875f46a38e1fe38d3ee4ea7ea65b1bf.png	f
65	SG 553 | Desert Blossom	0	0.49000000000000005	4	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sg556_aa_desert_bloom_bright_light_large.082aa07ec9551391143d8b825ef9f1062ea54279.png	f
66	FAMAS | CaliCamo	0	0.6	4	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_famas_hy_varicamo_desert_light_large.b650a2a051a809d716d4298d2387729456a404ce.png	f
67	CZ75-Auto | Midnight Palm	0	0.5	4	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_cz75a_sp_palm_night_light_large.9fd0e13c6cfbb14efbdd81732ca52f64f337e8e7.png	f
68	P90 | Verdant Growth	0	0.4699999999999999	4	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p90_sp_moro_textile_green_vine_light_large.47d80a883c184629d2049f8a5e2046150b35e69e.png	f
69	Dual Berettas | Drift Wood	0	0.6	4	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_elite_sp_dry_wood_light_large.89fee2f97c3722747a19dcc269397d71fd7fddc1.png	f
70	MAC-10 | Sienna Damask	0	0.6	4	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mac10_sp_mirage_flowers_tan_light_large.661511b89c0776fc024cf6b8e10390fa93e7aad6.png	f
71	MAG-7 | Navy Sheen	0	0.55	4	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mag7_am_navy_shine_light_large.fd2f1241ce0bfa16bbbd8971f72846429cc874d0.png	f
72	PP-Bizon | Anolis	0	0.5	4	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_bizon_hy_lizard_skin_light_large.4731c7f1d21196c4971405a722c36911b1d23aae.png	f
73	P250 | Drought	0	0.44000000000000006	4	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p250_sp_desert_skulls_dawn_light_large.0ef79663a917620d2ab91078115200bf2747269a.png	f
74	SSG 08 | Prey	0	0.48	4	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ssg08_sp_zebracam_red_light_large.9aefb18daa0955b6ac9b0d098132425b7991fc6e.png	f
75	M4A4 | The Coalition	0	1	5	covert_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_gs_m4a4_coalition_light_large.313da3169bf32c427325ebc7f0aae1a0272e399a.png	t
76	Glock-18 | Gamma Doppler	0	0.5	5	covert_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_glock_am_gamma_doppler_phase4_glock_light_large.ed9c2de2ffe8852136002385cfcee149dd202575.png	t
77	USP-S | Whiteout	0.06	0.8	5	classified_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_usp_silencer_so_whiteout_riptide_light_large.87d3b82c83ef28ff06955915907d062376be31ac.png	f
78	FAMAS | Meltdown	0	0.4	5	classified_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_famas_am_nuclear_pattern4_famas_light_large.7e147f135728d6abd62f871088d69c1b2bd38076.png	f
79	MAC-10 | Propaganda	0	0.62	5	classified_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mac10_cu_mac10_propaganda_light_large.d8a065b191f3df86a7e2e25d4349790ed56e0593.png	f
80	CZ75-Auto | Syndicate	0	0.7	5	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_cz75a_gs_train_cz75_light_large.d0178b0f2c40cd44a38d5c0215a7152214cb1ce8.png	f
81	P2000 | Space Race	0	0.6	5	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_hkp2000_aa_spacerace_orange_light_large.611eae311e379d24b3014383c6270d45012099a0.png	f
82	MP5-SD | Autumn Twilly	0	0.58	5	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp5sd_hy_trainarchitect_light_large.9ba8cb9505f0b67e608050ce5aa307e32dabbe1e.png	f
83	AWP | POP AWP	0	0.44000000000000006	5	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_awp_hy_technowar_rwb_light_large.227b359d409d564be7675d8334cad89636e3bdda.png	f
84	Nova | Red Quartz	0	0.4	5	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_nova_am_crystallized_light_large.a5390c1d1d4b0a879d739917bc3d9f576feb01f2.png	f
85	Desert Eagle | Sputnik	0	0.5	5	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_deagle_sp_spacerace_blue_light_large.e93e99eadcae13e4ff2cbe9f958d720a34007a6d.png	f
86	M4A1-S | Fizzy POP	0	0.57	5	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_silencer_sp_technowar_red_light_large.8b95f916513ef9d3ceab3f8b87acd23779aeef0a.png	f
87	R8 Revolver | Blaze	0	0.08	5	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_revolver_aa_flames_light_large.190d9cb7b8aad31d105fe838664a7fd99ebf3535.png	f
88	SSG 08 | Spring Twilly	0	0.55	5	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ssg08_hy_trainarchitect_green_light_large.99e4e0cef18a0f37f5f26caf431dde80f39f14e1.png	f
89	UMP-45 | Full Stop	0	0.6	5	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ump45_hy_varicamo_red_light_large.30426fbdd212e0961d917ffa214e11431326ee02.png	f
90	AUG | Amber Fade	0	0.4	5	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_aug_aa_fade_metallic_light_large.a43dbbaa988dd53a72ee6e06701c7e0cb1a225e0.png	f
91	Tec-9 | Safety Net	0	0.6	5	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_tec9_hy_mesh_safetyorange_light_large.a2564044371c87bb1081753c71f6cfb93f0359c1.png	f
92	M4A1-S | Imminent Danger	0	0.8	6	covert_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_silencer_gs_m4a1_vertigo_light_large.a144750a6903c3bdd9808e740d274648ae26c71e.png	t
93	Five-SeveN | Fall Hazard	0.01	0.52	6	classified_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_fiveseven_cu_vertigo_fiveseven_light_large.8d09586ce7da49599697204b4b7fc32930b47836.png	f
94	SG 553 | Hazard Pay	0	0.48	6	classified_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sg556_cu_sg553_caution_light_large.48fe10aaedc4fbba77afd76c31a5ab86da42461b.png	f
95	Galil AR | CAUTION!	0	0.55	6	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_galilar_sp_galil_caution_light_large.f70544059dd7c3ff5709c8a1493643d1ef2a5dde.png	f
96	P250 | Digital Architect	0	0.49000000000000005	6	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p250_aa_vertigogeo_neon_light_large.e1e7730f0d6716a372cda4b973f71cdbb7a074cd.png	f
97	MAG-7 | Prism Terrace	0	0.37	6	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mag7_hy_geometric_steps_pearl_light_large.f31672cbe64c23d7d340199143758c8fc537ffb3.png	f
98	AK-47 | Green Laminate	0.02	0.4	6	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ak47_hy_ak47lam_green_light_large.ecbaf85e35ca08156cc305017d4dc4276a742a8f.png	f
99	Negev | Infrastructure	0	0.49000000000000005	6	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_negev_hy_vertigospray_light_large.1e6d69be2dc5ac7290ef815ae6a53bb2143103c3.png	f
100	Nova | Interlock	0	0.5	6	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_nova_hy_vertigoillusion_yellow_light_large.73fdfc85585fff74804a6f22179406a48ce74947.png	f
101	P90 | Schematic	0	0.5	6	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p90_hy_vertigogeo_light_large.321d8068761b4b89e1e9f5916ba2cfca5068e080.png	f
102	Glock-18 | Red Tire	0	0.55	6	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_glock_sp_tire_tread_red_light_large.bf06d5ba0f2b746eff6a66aa7020acd7a87eddc4.png	f
103	UMP-45 | Mechanism	0	0.49000000000000005	6	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ump45_aa_engine_performance_light_large.b4207d31aa53b7ed863535d77e9a7420f06c2681.png	f
104	SSG 08 | Carbon Fiber	0	0.12	6	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ssg08_am_carbon_fiber_light_large.90255a5b4940cc078005493430f0a73761b990e4.png	f
105	PP-Bizon | Breaker Box	0	0.44000000000000006	6	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_bizon_aa_wiring_light_large.5ec614e6c258dd17db3f7949292008a2f466f2db.png	f
106	CZ75-Auto | Framework	0	0.8	6	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_cz75a_hy_vertigoillusion_light_large.1e2ff66fbdd2d5aea56659a7ede1cc3fd570f00d.png	f
107	MAC-10 | Strats	0	0.6	6	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mac10_hy_vertigospray_blue_light_large.834dc852bd8c722d0dd30a05b3f72e6401cd987b.png	f
108	XM1014 | Blue Tire	0	0.55	6	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_xm1014_sp_tire_tread_blue_light_large.c6107f07580de4c0d1440aacabbd8b47b788a687.png	f
109	Dual Berettas | Oil Change	0	0.5	6	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_elite_sp_engine_dirty_light_large.0e7876df94dfe920abf273e75ea62e041100de4a.png	f
110	FAMAS | Faulty Wiring	0	0.5	6	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_famas_aa_wiring_yellow_light_large.c232a36fb8d6a691893132a0baf126d250d8d35e.png	f
111	FAMAS | Spitfire	0.06	0.8	7	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_famas_sp_spitfire_famas_bravo_light_large.ac455b0749733b0bdce019c0e0c74270d689eb95.png	t
112	SCAR-20 | Emerald	0	0.08	7	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_scar20_an_emerald_bravo_light_large.1fddac26d628445bdc9856e04b5e9c69f526120b.png	t
113	MAG-7 | Hazard	0.06	0.8	7	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mag7_sp_hazard_bravo_light_large.51f8430aea46a8f93e504fb9ea950cd772930d6d.png	f
114	AUG | Anodized Navy	0	0.08	7	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_aug_an_navy_bravo_light_large.8057388b1d777096c036f1b2d8ba9ce15103678d.png	f
115	PP-Bizon | Rust Coat	0	1	7	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_bizon_aq_steel_bravo_light_large.ace529ee6d0eefe9159eaf040b364ad853ccf893.png	f
116	Glock-18 | Sand Dune	0.06	0.8	7	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_glock_so_sand_bravo_light_large.b505115b9e7a3e6480697f0262d76c9518c65e50.png	f
117	Negev | Palm	0.06	0.8	7	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_negev_sp_palm_bravo_light_large.3271a8edfb42d163f18a957bc162ddf01f29d30a.png	f
118	SSG 08 | Mayan Dreams	0.06	0.8	7	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ssg08_hy_mayan_dreams_bravo_light_large.647a85eff07e6565e9e284968d9c11a1ec42da68.png	f
119	Sawed-Off | Mosaico	0.06	0.8	7	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sawedoff_hy_ali_tile_bravo_light_large.979b575c05b90ab9ae836ff28396737323818e1b.png	f
120	P250 | Facets	0.06	0.8	7	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p250_hy_crumple_dark_bravo_light_large.159ee3e3e5c507d869c9089978a8ed82897fcfa4.png	f
121	MP9 | Dry Season	0.06	0.8	7	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp9_sp_tape_dots_bravo_light_large.e6624212c506215295ff5bf1b4c9bd7523db3ab5.png	f
122	XM1014 | Jungle	0.06	0.8	7	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_xm1014_so_jungle_bravo_light_large.0b0998c1c247ffc870bbdbc4c53696cd8a974f30.png	f
123	MP7 | Groundwater	0.06	0.8	7	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp7_so_olive_bravo_light_large.fd49ae0c11fa44fb6110f4ec9d34651d4e6f9185.png	f
124	Tec-9 | Tornado	0.06	0.8	7	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_tec9_so_tornado_bravo_light_large.b9bcae80fa19a0a2a147484427733172c2189cb9.png	f
125	M249 | Jungle DDPAT	0.06	0.8	7	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m249_hy_ddpat_jungle_bravo_light_large.d93812236444afc67a0d994cd3f6faa421a57114.png	f
126	Five-SeveN | Anodized Gunmetal	0	0.08	7	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_fiveseven_an_gunmetal_bravo_light_large.6aaf03603a7ef748f5395af2a738f899f423522b.png	f
127	M4A1-S | Welcome to the Jungle	0	1	8	covert_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_silencer_cu_m4a1_snake_light_large.fcdef378938398a506d3e173e766322579867e74.png	t
128	AK-47 | Panthera onca	0	1	8	classified_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ak47_cu_ak_jaguar_light_large.92dd85d59d2615eab90bf86d7e4df6ee9e095132.png	f
129	P90 | Run and Hide	0	1	8	classified_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p90_cu_jaguar_p90_light_large.7d9fe21106b83cbf10ea8cc7f8b4f6aea72af268.png	f
130	MAC-10 | Gold Brick	0	0.7	8	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mac10_am_gold_brick_light_large.3583c29af715c4700176149b3866c35dcc78d61e.png	f
131	USP-S | Ancient Visions	0	0.45	8	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_usp_silencer_sp_ancient_bright_light_large.794efdc565345a758d9a6fd673db4a42e01d59c8.png	f
132	XM1014 | Ancient Lore	0	0.5	8	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_xm1014_am_ancient_warm_light_large.9a53c1b2db897b005c56b8f5e4a5b9f40730c85b.png	f
133	Galil AR | Dusk Ruins	0	0.6	8	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_galilar_hy_ruins_red_light_large.560982e001f4ba6ec42ad09f913e33c1fda8108f.png	f
134	AUG | Carved Jade	0	0.2	8	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_aug_am_jade_light_large.e7c37922ef1bc669b9bd16d5bee5d309d97aa0e2.png	f
135	Tec-9 | Blast From the Past	0	0.65	8	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_tec9_hy_ancient_tiles_peach_light_large.9ad93bd41f7436005b4fd4d4bbf6815e4dae39c9.png	f
136	FAMAS | Dark Water	0.1	0.26	8	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_famas_am_zebra_dark_light_large.52703268beafba0b11ccfe86f32a332cdf69f9ef.png	f
137	CZ75-Auto | Silver	0	0.08	8	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_cz75a_an_silver_light_large.d966656a4fc5b18b33ad34bcd8a5f8cc50b1f88e.png	f
138	P2000 | Panther Camo	0	0.5	8	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_hkp2000_am_black_panther_light_large.6b1ddf6071adab6685bff33fb5b586267ee0f907.png	f
139	MP7 | Tall Grass	0	0.65	8	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp7_hy_drywood_green_light_large.a2a57b124a5e8a3ad61912649f472f2b477bdad9.png	f
140	G3SG1 | Ancient Ritual	0	0.76	8	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_g3sg1_am_ancient_wine_light_large.dfea71dc9fa6d9ee7aa528f0086e216336057c7e.png	f
141	SSG 08 | Jungle Dashed	0.06	0.8	8	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ssg08_sp_tape_short_jungle_light_large.4623c92c91eaa0ef45e9c09d828bbeb926dcb1c6.png	f
142	R8 Revolver | Night	0.06	0.8	8	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_revolver_so_night_light_large.02c1852bc16e1c3bcdb2daa681fdfe043d31293b.png	f
143	SG 553 | Lush Ruins	0	0.7	8	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sg556_aa_ruins_green_light_large.47e5a2fdd296f5dbdcf3e14ec2a09be699bab8b8.png	f
144	Nova | Army Sheen	0	0.3	8	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_nova_am_army_shine_light_large.cbdf89414f6dd35c2de30d0cda9a6d84fbd32289.png	f
145	M4A4 | Eye of Horus	0	0.7	9	covert_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_gs_m4a4_ra_light_large.7531ec73ee20dac93f068342616599e4808fb850.png	t
146	P250 | Apep's Curse	0	1	9	classified_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p250_gs_p250_apep_light_large.39613b6ade6f204aaaed995e47d0a9fa42963b45.png	f
147	FAMAS | Waters of Nephthys	0	0.7	9	classified_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_famas_cu_famas_holo_ocean_light_large.e9efee74629f50aab0110ae3fc6a07aabac679e0.png	f
148	P90 | ScaraB Rush	0	1	9	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p90_cu_p90_scarab_of_wisdom_light_large.54f85e60f71185083323768b79e699da762e09e6.png	f
149	Nova | Sobek's Bite	0	1	9	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_nova_gs_nova_sobek_light_large.53046ae2482691e0c1ba90de50698f875294a737.png	f
150	AWP | Black Nile	0	0.75	9	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_awp_gs_awp_strone_light_large.f6a8a693f8bcdd89436549db6079bb5f102c9616.png	f
151	AK-47 | Steel Delta	0	0.73	9	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ak47_gs_ak47_strone_light_large.8434d6be7fa076ce41c86eb5ea00efe9383800c6.png	f
152	Tec-9 | Mummy's Rot	0	1	9	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_tec9_cu_tec9_mummy_light_large.b70be5ec031a0538fe3e7b42d0a21d1cebe869e1.png	f
153	MAG-7 | Copper Coated	0	1	9	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mag7_gs_mag7_goold_light_large.293c06a3f62ce9dfb177f79462fbb7b31bd5eb9f.png	f
154	M4A1-S | Mud-Spec	0	0.73	9	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_silencer_gs_m4a1s_milspec_light_large.abf3dbeb994944b3182cc60c50d3a729f47c1979.png	f
155	USP-S | Desert Tactical	0	1	9	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_usp_silencer_gs_usps_tactical_camo_light_large.ff54560941a8f50919ea6be8126490aff54ae810.png	f
156	MAC-10 | Echoing Sands	0.02	0.8	9	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mac10_cu_mac10_scarab_light_large.3dce90df4da34a30c0437a51e90fc77d08bbe2f3.png	f
157	SSG 08 | Azure Glyph	0.01	0.99	9	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ssg08_gs_ssg08_anubis_light_large.6e654fe6456fb019d4507f750d113f67ca0a879f.png	f
158	MP7 | Sunbaked	0	1	9	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp7_gs_mp7_strone_light_large.38c65124a7edf35fa2223c37e97c5ac803c24207.png	f
159	XM1014 | Hieroglyph	0	1	9	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_xm1014_cu_xm1014_pharaoh_light_large.dd51bfb65f740dd4145fb548ef9be0a353f82766.png	f
160	M249 | Submerged	0.02	0.8	9	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m249_cu_m249_scarab_light_large.6dc1dc25afc1a3a22fff064c85c8f2d3d88aeac7.png	f
161	R8 Revolver | Inlay	0	0.76	9	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_revolver_gs_revolver_acanthus_bronze_light_large.3d652732f4082f2af2acce48c2343d2fd73bdcae.png	f
162	AUG | Snake Pit	0	0.55	9	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_aug_hy_dune_trap_light_large.61e49e32c50c4a984fec89ec01defd789ae42376.png	f
163	Glock-18 | Fade	0	0.08	10	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_glock_aa_fade_light_large.61edcc69ff252d537a4dd14b016cbe826c26ae5b.png	t
164	MP9 | Bulldozer	0.06	0.8	10	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp9_so_yellow_light_large.dfa50bdf02bccb9002d09c891d41ba65b1ce2d9c.png	t
165	AUG | Hot Rod	0	0.08	10	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_aug_an_red_light_large.9adb894f02aff778fff9188a24eea1f0c8b66685.png	f
166	Negev | Anodized Navy	0	0.08	10	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_negev_an_navy_light_large.5dafc320a35bc04e03bbe0c4e4b1b293398d1bda.png	f
167	Five-SeveN | Candy Apple	0	0.3	10	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_fiveseven_so_red_light_large.29ae7b2264bd2a390ecf51a51293d2c2202fdea9.png	f
168	UMP-45 | Caramel	0.06	0.8	10	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ump45_so_caramel_light_large.4883dbae989e9c61805aa53ca5a02983f74657b9.png	f
169	SG 553 | Tornado	0.06	0.8	10	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sg556_so_tornado_light_large.32d15282560b205fb387cf876fc19da381951986.png	f
170	Tec-9 | Ossified	0	0.08	11	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_tec9_am_ossify_light_large.29b1e40ecb5781ee6f47b460d3372b5c6601d768.png	t
171	AK-47 | Jungle Spray	0.06	0.8	11	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ak47_sp_spray_jungle_light_large.af524ea61be29ab81dfb321277b98a211338de37.png	f
172	M4A4 | Jungle Tiger	0.06	0.8	11	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_hy_v_tiger_light_large.cdf3f8e434ea36842fa520cabec812eaba3f2fa5.png	f
173	SSG 08 | Lichen Dashed	0.06	0.8	11	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ssg08_sp_short_tape_light_large.f2f54766f72c881bc020b924be5ae026dcf065da.png	f
174	Nova | Forest Leaves	0.06	0.8	11	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_nova_sp_leaves_light_large.b75cb0c1b82c4c1a559f0b1de3113cf967029176.png	f
175	Five-SeveN | Jungle	0.06	0.8	11	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_fiveseven_so_jungle_light_large.d98e255283a8cfd09aacb25405a26e580e3d129f.png	f
176	AK-47 | Jet Set	0	1	12	classified_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ak47_cu_well_traveled_ak47_light_large.708a53ac473d7cd02037876a82b6b4c004bf9a31.png	t
177	AK-47 | First Class	0	1	12	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ak47_cu_green_leather_ak47_light_large.9622f0d289d98aa50238c0c956631b73bc3171ed.png	f
178	Desert Eagle | Pilot	0	1	12	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_deagle_aq_pilot_deagle_light_large.60b0e755ef14311a82f5f35928ad18dbb6ae2a86.png	f
179	Sawed-Off | First Class	0	0.5	12	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sawedoff_cu_green_leather_sawedoff_light_large.16c853410a5696858a4dc383f04c3d5e42b08631.png	f
180	USP-S | Business Class	0	1	12	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_usp_silencer_cu_luggage_usp-s_light_large.3adca3c85f5ae2b083489a1059e1254417ff73c8.png	f
181	XM1014 | Red Leather	0	0.56	12	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_xm1014_cu_leather_xm1014_light_large.4b2f6f7df7d03f0bfb271d1d06c948bb8cdcb0c0.png	f
182	P2000 | Coach Class	0	1	12	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_hkp2000_cu_luggage_p2000_light_large.6dfcea73af8a3cf42042fb75be69345cf5525347.png	f
183	P90 | Leather	0	1	12	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p90_cu_brown_leather_p90_light_large.6943b782f1c00dd933ca3ee3c19749ea2494899c.png	f
184	SG 553 | Traveler	0	1	12	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sg556_cu_luggage_sg553_light_large.374b9493843853afc913a1735b154fcbbdbb6f89.png	f
185	MAC-10 | Commuter	0	1	12	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mac10_cu_luggage_mac10_light_large.d05e658d3d11de252d21a82f6c26a7b6c47ac1df.png	f
186	SSG 08 | Sand Dune	0.06	0.8	12	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ssg08_so_sand_light_large.71cb57b99ee95a92310b4f55d7709bc5f5cc255e.png	f
187	G3SG1 | Contractor	0.06	0.8	12	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_g3sg1_so_pmc_light_large.563d94315a5a6f57039ccdf5b672bf65d608c819.png	f
188	MP9 | Green Plaid	0	0.58	12	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp9_hy_plaid2_light_large.05b87c77e5f3c91c317f92fad7078891f44a4538.png	f
189	MP7 | Olive Plaid	0	0.58	12	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp7_hy_plaid1_light_large.56b2f9cbc6d9a7aae3c1eca41151a2067a1427e8.png	f
190	CZ75-Auto | Green Plaid	0	0.58	12	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_cz75a_hy_plaid2_light_large.82e391ba61c092ece265e3bde16237ab5a510130.png	f
191	P250 | Franklin	0	0.4	13	classified_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p250_cu_money_light_large.a8632edd5846b8c9de09c711ada47f7decc739b7.png	t
192	AK-47 | Emerald Pinstripe	0	1	13	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ak47_cu_pinstripe_ak47_light_large.2123421a26fbe673eea7c0238c7441a83b97aa17.png	f
193	Galil AR | Tuxedo	0	0.8	13	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_galilar_so_orca_light_large.5db78708464e031c686ae2e730e997e01526a7ea.png	f
194	Desert Eagle | Meteorite	0	0.18	13	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_deagle_am_crystallized_dark_light_large.2d7d753a893ec3f0a470af9690aa64dcecd7146f.png	f
195	CZ75-Auto | Tuxedo	0	0.8	13	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_cz75a_so_orca_light_large.8490865eba36c09ccd75a9b1f93445ff2e9f2b8f.png	f
196	MAC-10 | Silver	0	0.08	13	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mac10_an_silver_light_large.3082e91b9fddbddc9b72da44382fe1def00fa5fa.png	f
197	UMP-45 | Carbon Fiber	0	0.12	13	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ump45_am_carbon_fiber_light_large.b250b860bbe6f7a689448cc47b6ac25427e3d848.png	f
198	G3SG1 | Green Apple	0	0.3	13	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_g3sg1_so_green_light_large.28c4e72757be64775c1111ac0e7142a147cacb9c.png	f
199	Nova | Caged Steel	0	0.2	13	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_nova_am_oval_hex_light_large.766118990b3726617ed6203e95abc71417dbd057.png	f
200	Glock-18 | Death Rattle	0.08	0.5	13	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_glock_hy_nerodia_light_large.540067f703bf7b020d8fedfcc6322523ab449d68.png	f
201	Tec-9 | Urban DDPAT	0.06	0.8	13	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_tec9_hy_ddpat_urb_light_large.bd44491d7de854c08e2951e14f9066afdb340dd6.png	f
202	MP7 | Forest DDPAT	0.06	0.8	13	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp7_hy_ddpat_light_large.0207fb5fe0a1e21cdda28e005f7960f2dc4728b9.png	f
203	R8 Revolver | Bone Mask	0.06	0.8	13	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_revolver_sp_tape_light_large.c8f9124ff70ca2a6e8867920cd39e4fb7308ac87.png	f
204	Sawed-Off | Forest DDPAT	0.06	0.8	13	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sawedoff_hy_ddpat_light_large.e3f476b768693a046994a90e2aca045d329e6957.png	f
205	Negev | Army Sheen	0	0.3	13	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_negev_am_army_shine_light_large.884085f4a13b786f0ac7234d616ff01a848f28d5.png	f
206	SG 553 | Army Sheen	0	0.3	13	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sg556_am_army_shine_light_large.a07a97d5fba73aeecfc5cc9364e0d43d47892373.png	f
207	Galil AR | Cerberus	0	0.9	14	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_galilar_cu_cerbrus_galil_light_large.761250f955c66cbb100400e2fc1459ce74320282.png	t
208	FAMAS | Styx	0	0.6	14	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_famas_am_nuclear_skulls2_famas_light_large.ec9774f3b2a03f5411321dba792b05f19096547c.png	t
209	Glock-18 | Reactor	0	1	14	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_glock_am_nuclear_pattern1_glock_light_large.01e91d2930e04d43215becb90447b2ebec1cb8d9.png	f
210	MAC-10 | Nuclear Garden	0	0.7	14	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mac10_am_nuclear_skulls3_mac10_light_large.467b325065522e5248247cf125bec257cdb66902.png	f
211	MP9 | Setting Sun	0	1	14	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp9_hy_nuclear_pattern2_mp9_light_large.d5f2b29c15286ea4c63cd60061d1073ec7e84087.png	f
212	Tec-9 | Toxic	0	0.7	14	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_tec9_hy_nuclear_skulls5_tec9_light_large.d83d7de4c10dbc5fae925a4cb531ca7a8deef3d1.png	f
213	XM1014 | Bone Machine	0	0.6	14	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_xm1014_am_nuclear_skulls1_xm1014_light_large.716e8296c07d3e6d5c9f5f20605c9608bbb78ca1.png	f
214	Five-SeveN | Hot Shot	0	1	14	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_fiveseven_so_grey_nuclear_orange_five_seven_light_large.1f99a49ba11741a36385ef0934d8066624d4d257.png	f
215	PP-Bizon | Chemical Green	0	0.9	14	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_bizon_so_grey_nuclear_green_bizon_light_large.072e25b1fa34f50da3850310424b8b96983cf684.png	f
216	SG 553 | Fallout Warning	0	0.8	14	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sg556_sp_nukestripe_maroon_sg553_light_large.95996aebdd6d4308d577f481e0c73250d2c82c74.png	f
217	P250 | Contamination	0	0.8299999999999998	14	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p250_hy_nuclear_skulls4_p250_light_large.83b7c2eeff0d6fd0e6d780be0815111d199a46d6.png	f
218	Negev | Nuclear Waste	0	0.4	14	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_negev_sp_nuclear_pattern3_negev_light_large.2d4cd96f9a94367d4c22991250eb9350437d8be6.png	f
219	AUG | Radiation Hazard	0	0.55	14	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_aug_sp_nukestripe_orange_aug_light_large.4309138bd5b9e518628d517a275747ec9c2207d3.png	f
220	AWP | The Prince	0	0.6	15	covert_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_awp_gs_awp_enamel_light_large.00ae78bca507d3358c7b821dc666e21123162069.png	t
221	MAG-7 | Cinquedea	0	1	15	classified_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mag7_gs_mag7_glass_light_large.beadef0a6bd24e7ba3ed051b2b092c27119ce075.png	f
222	MAC-10 | Red Filigree	0	0.5	15	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mac10_am_ren_red_light_large.985e0a9b70dc43f90bfb6e9ce28398565396d633.png	f
223	MP9 | Stained Glass	0	0.5	15	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp9_am_stained_glass_light_large.24d1cb9e7a99e9b0e5663a245d65b56c42f36a0b.png	f
224	Nova | Baroque Orange	0	0.5	15	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_nova_am_veneto2_light_large.51bfad5db3f49f28c0802f4696f6282e4781f4db.png	f
225	Dual Berettas | Emerald	0	0.08	15	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_elite_an_emerald_light_large.242c719bcbe22fa3eb64b7ba15f48989cc9200d8.png	f
226	P90 | Baroque Red	0	0.5	15	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p90_am_veneto_red_light_large.3bfb2641e0b8e40c0c797a44bb448ec06eabe6b8.png	f
227	SSG 08 | Orange Filigree	0	0.5	15	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ssg08_hy_ren_orange_light_large.0de8202f23f893173f722278aca762d294371ad8.png	f
228	G3SG1 | Violet Murano	0	0.5	15	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_g3sg1_am_murano_violet_light_large.7a4ee0fb0e265881283e9282f5d79e8cea2635c8.png	f
229	AK-47 | Baroque Purple	0	1	15	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ak47_hy_veneto_purple_light_large.4d9f7f4ed3034ce7d712c68640eb33f9f66f5daf.png	f
230	Tec-9 | Orange Murano	0	1	15	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_tec9_hy_murano_orange_light_large.cc6ae2c1c3aca79fe0f65be7f0f40f493eba55cf.png	f
231	SG 553 | Candy Apple	0	0.7	15	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sg556_so_red_sg553_light_large.aa8a1ed5302193cf02c2814a772517ec2aec8115.png	f
232	P250 | Dark Filigree	0	0.5	15	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p250_am_ren_dark_light_large.ce4d6a4807c1a3c78ed3853f0fb7900b181db0d3.png	f
233	R8 Revolver | Canal Spray	0.06	0.6	15	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_revolver_sp_spray_water_light_large.0f7d074b7c53419d9475b0eb68e7215d7f9dcc66.png	f
234	CZ75-Auto | Indigo	0.06	0.8	15	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_cz75a_so_indigo_and_grey_light_large.2d4d90e760b199522064e9635d1efdb11cdab34f.png	f
235	AUG | Navy Murano	0	1	15	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_aug_hy_murano_blue_light_large.b294cab668b3229243676838e2542b893b5dcbfa.png	f
236	Negev | Boroque Sand	0	1	15	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_negev_hy_veneto_tan_light_large.f8a6e484f7ebc5dbf1f52e0ef9b0c4d7c5054a0d.png	f
237	SCAR-20 | Stone Mosaico	0.06	0.5	15	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_scar20_hy_canals_tile_light_large.75a40e82efbdfa0691e32eb98301f1b441a00f46.png	f
238	M4A1-S | Hot Rod	0	0.08	16	classified_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_silencer_an_red_m4a1s_light_large.ec59e9b09e1e9f46af18dea65ee90e5bdfe9ebb1.png	t
239	Glock-18 | Twilight Galaxy	0	0.2	16	classified_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_glock_am_aqua_flecks_light_large.e7d41ce4dbf0cd29f1eb3daa5ce0bb753abd1903.png	t
240	Dual Berettas | Duelist	0	1	16	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_elite_gs_mother_of_pearl_elite_light_large.2023e44b16f064c32962b691bcdb5d45051744bc.png	f
241	SG 553 | Bulldozer	0.06	0.8	16	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sg556_so_yellow_light_large.afbe04152bdb3090623992005c23d3a997ae0ca3.png	f
242	P250 | Whiteout	0.06	0.8	16	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p250_so_whiteout_light_large.ffd6e614b63d3af24a04a9f7710b55210a7d0296.png	f
243	MAC-10 | Fade	0	0.08	16	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mac10_aa_fade_light_large.69bd70b0bb129a5c671945090f56322c37b6bcf2.png	f
244	Five-SeveN | Nitro	0.06	0.8	16	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_fiveseven_so_orange_accents_light_large.b5ab3af11de68b90ca8b18e359ac0338d1a2d7f4.png	f
245	CZ75-Auto | Emerald	0	0.08	16	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_cz75a_an_emerald_light_large.5c4734111477a884851cae6998871cbf7c870cc6.png	f
246	MP7 | Full Stop	0	0.6	16	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp7_hy_varicamo_red_light_large.7110895d0ad1626929f361598b7f201a5ef3701a.png	f
247	Desert Eagle | Night	0.06	0.8	16	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_deagle_so_night_light_large.64e315553578f3c8bd08c96622fc2c34d5a789ba.png	f
248	USP-S | Para Green	0	0.8	16	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_usp_silencer_so_khaki_green_light_large.546b3eb856bbf2aeece29e2852688ddae13531b7.png	f
249	Galil AR | Urban Rubble	0	0.5	16	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_galilar_hy_varicamo_urban_light_large.04b4d709f1a3de109c7173d5ef55181138b247e0.png	f
250	MAG-7 | Seabird	0	1	16	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mag7_so_aqua_light_large.fee69dfe94d0158d2e7d8d049accdb967b8a924a.png	f
251	M249 | Impact Drill	0	1	16	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m249_so_keycolors_light_large.bf0fe2b5d5b5c65358519ebaeeed6da72032bf4b.png	f
252	CZ75-Auto | Army Sheen	0	0.3	16	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_cz75a_am_army_shine_light_large.26736d48ea09a5284aeb1cf11292bc3e87a56251.png	f
253	SCAR-20 | Army Sheen	0	0.3	16	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_scar20_am_army_shine_light_large.2d2f8b7c0d1a6f9541956d1bef018261ddd80542.png	f
254	AWP | Dragon Lore	0	0.7	17	covert_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_awp_cu_medieval_dragon_awp_light_large.cb3b8168e59e96fd33efa9578206a2aaed036fc0.png	t
255	M4A1-S | Knight	0	0.1	17	classified_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_silencer_am_metals_light_large.1ef1155c712349b2aaee8172a3da7fb1e62e1362.png	f
256	Desert Eagle | Hand Cannon	0.01	0.7	17	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_deagle_aq_handcannon_light_large.e6e87ceb2337a423d225dc177342af3df4069585.png	f
257	CZ75-Auto | Chalice	0	0.1	17	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_cz75a_am_royal_light_large.f9f7bd8e5321fa0572adc2b77050608e5570cdaf.png	f
258	MP9 | Dark Age	0	0.22000000000000003	17	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp9_am_metal_inlay_light_large.a49681fb3a39bd378051dd22ff9f988fd831d41f.png	f
259	P2000 | Chainmail	0	0.22000000000000003	17	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_hkp2000_am_chainmail_light_large.26e8d5e01b6af8dc85be34cf16830ef6280166fd.png	f
260	USP-S | Royal Blue	0.06	0.8	17	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_usp_silencer_hy_indigo_usp_light_large.aa460050dc0fd2d87522a869cefbf5d5ab442f27.png	f
261	Nova | Green Apple	0	0.3	17	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_nova_so_green_light_large.f6b21316c800bb19022612e4b965f7d312e8e4f5.png	f
262	Sawed-Off | Rust Coat	0	0.8	17	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sawedoff_aq_steel_light_large.b363c0f1eef83ac7291f8b64d338dcdd82183502.png	f
263	MAG-7 | Silver	0	0.08	17	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mag7_an_silver_light_large.ffb14b93d930ff95920974edd78cf6b31b48fe43.png	f
264	MAC-10 | Indigo	0.06	0.8	17	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mac10_so_indigo_and_grey_light_large.9900a7e2bc4fc67df08d3aff103526f666f1ef70.png	f
265	P90 | Storm	0.06	0.8	17	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p90_so_stormfront_light_large.60d73691845ad5ad0e5d8a15b488807d9c25a57f.png	f
266	UMP-45 | Indigo	0.06	0.8	17	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ump45_so_indigo_and_grey_light_large.7a4685c334bf103f25ba1865dc0492315bf0ca5c.png	f
267	SCAR-20 | Storm	0.06	0.8	17	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_scar20_so_stormfront_light_large.3bebdbcd4ea2ae851cdd2a06d0663121d01ebd79.png	f
268	Dual Berettas | Briar	0	0.22000000000000003	17	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_elite_hy_vines_light_large.bb506f02418403c8a48f7829bdc065a71c3a77d0.png	f
269	AWP | Fade	0	0.08	18	covert_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_awp_aa_awp_fade_light_large.4e978e13c3396c1b1e32e993afb462ccac55d783.png	t
270	M4A1-S | Blue Phosphor	0	0.08	18	classified_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_silencer_am_m4a1s_bluesmoke_light_large.20c39cd69587cfed699f1e1ebb05f4dc735e06d6.png	f
271	USP-S | Target Acquired	0	0.5	18	classified_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_usp_silencer_am_intelligence_magenta_light_large.5d8fbbd462701928467530e6c7ff81b8c7be65a1.png	f
272	UMP-45 | Crime Scene	0	0.75	18	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ump45_cu_ump_crime_scene_light_large.db37d99efad4621d4b3232bfc0fa8d04b8a6b8e9.png	f
273	Five-SeveN | Berries And Cherries	0	0.1	18	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_fiveseven_aa_fade_red_blue_light_large.ad6d70f142cc5c31e577880088475e9f079a97a1.png	f
274	FAMAS | Prime Conspiracy	0	0.55	18	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_famas_am_numbers_magenta_light_large.c3b086e3407aeb1bca1fb497bc2aee6dc7602a4f.png	f
275	P2000 | Dispatch	0	0.65	18	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_hkp2000_am_numbers_red_blue_light_large.03b8794b01dd0aa5e28f1f52b1a8a2bc0ecf179c.png	f
276	M4A4 | Global Offensive	0	0.7	18	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_cu_csgo_camo_light_large.9e1a644f88ce7ab73f63d5b90070b9993fcb14ac.png	f
277	SSG 08 | Threat Detected	0	0.65	18	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ssg08_am_intelligence_orange_light_large.7a1af716b99e1ed517adfd53eddcf90bd4417632.png	f
278	SCAR-20 | Magna Carta	0	0.6	18	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_scar20_hy_authority_purple_light_large.6754afba66bb91862fb6fef583e1b1e399061518.png	f
279	MP5-SD | Nitro	0.06	0.8	18	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp5sd_so_orange_accents3_light_large.0a75359a9c3fb4cd3084067358141b875f285724.png	f
280	Dual Berettas | Switch Board	0	0.65	18	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_elite_hy_numbers_green_light_large.e970f5a91033a85fc8a380b1c621ea633afb258b.png	f
281	Desert Eagle | The Bronze	0	0.3	18	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_deagle_am_numbers_bronze_light_large.9860461c5a6ef52868d2dadd2b9dbd5c842b7bb0.png	f
282	MAG-7 | Carbon Fiber	0	0.12	18	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mag7_am_carbon_fiber_light_large.226aab440e6e6041b5b4b09f907695aa854bcce0.png	f
283	CZ75-Auto | Jungle Dashed	0.06	0.8	18	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_cz75a_sp_tape_short_jungle_light_large.501137d165eddaa23fc4d2a5eedf51fbcfe1bcb2.png	f
284	P250 | Forest Night	0.06	0.8	18	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p250_hy_forest_night_light_large.f2ebb923126bf523ac2052755207d8c9d4dfa668.png	f
285	AUG | Surveillance	0	0.6	18	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_aug_am_intelligence_grey_light_large.0da9eda4a07271263ffc58d032d52b8f0edeb78e.png	f
286	XM1014 | Charter	0	0.65	18	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_xm1014_am_authority_brown_light_large.37101767e4d0abbd0248f9ee6d6b73d8c2f0dbd6.png	f
287	MP9 | Army Sheen	0	0.3	18	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp9_am_army_shine_light_large.59520d9221e58bdc6b6946943cca0823b7460509.png	f
288	R8 Revolver | Amber Fade	0	0.4	19	classified_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_revolver_aa_fade_metallic_revolver_light_large.d56e81f58bb716ac6ca130bd41802bb8962dd0cf.png	t
289	P2000 | Amber Fade	0	0.4	19	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_hkp2000_aa_fade_metallic_light_large.8efd81c9cf483adb6bdf58508800f62d3fc72310.png	f
290	PP-Bizon | Brass	0	1	19	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_bizon_aq_brass_light_large.afcbbd3e31fd3600ddb45b4a0c48b6350ab761f9.png	f
291	M4A1-S | VariCamo	0	0.6	19	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_silencer_hy_varicamo_light_large.794803daec1d6d6cd2c47d8e8520d9f5f0b1fc1b.png	f
292	SG 553 | Damascus Steel	0	1	19	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sg556_aq_damascus_sg553_light_large.543355687f0396ad10ed2f2705bc242ce5fdfbc5.png	f
293	AK-47 | Safari Mesh	0.06	0.8	19	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ak47_sp_mesh_tan_light_large.0372a5d37f473b9cf5e2ee32d2f5d36247f24a3a.png	f
294	Five-SeveN | Orange Peel	0.06	0.8	19	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_fiveseven_sp_tape_orange_light_large.d784ec0c92136e9f3f33ca09444ff4fe6a1f5300.png	f
295	MAC-10 | Palm	0.06	0.8	19	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mac10_sp_palm_light_large.22a3296d079e27cb7bb291e15eff10c29aa89b3e.png	f
296	Sawed-Off | Snake Camo	0.06	0.8	19	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sawedoff_sp_snake_light_large.5e65a350f30aa592de234f631d5d2cd98838fb4e.png	f
297	Tec-9 | VariCamo	0	0.6	19	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_tec9_hy_varicamo_light_large.8a863390cd0fc243c3697c3d551139d3553fde03.png	f
298	P250 | Sand Dune	0.06	0.8	19	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p250_so_sand_light_large.c77b762093b4786e0c070317e6a2121c2e7b4c86.png	f
299	MP9 | Sand Dashed	0.06	0.8	19	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp9_sp_tape_short_sand_light_large.893d0bacf03750448cef4be1f649591b9622907e.png	f
300	G3SG1 | Desert Storm	0.06	0.8	19	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_g3sg1_hy_desert_light_large.4e5561884f1cd7f8d6965b9c7991f89a702b72b4.png	f
301	Nova | Predator	0.06	0.8	19	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_nova_sp_zebracam_light_large.4a13bdc4fa3b5cd7d89c8cc83700d3a13326a6c3.png	f
302	P90 | Sand Spray	0.06	0.8	19	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p90_sp_spray_sand_light_large.18ac7e644639b8756fa3984055a493c5d7fc8249.png	f
303	SCAR-20 | Sand Mesh	0.06	0.8	19	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_scar20_sp_mesh_sand_light_large.880aed82e5ba9c8c9d4a7ebb88e5a51491ce2d59.png	f
304	Desert Eagle | Blaze	0	0.08	20	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_deagle_aa_flames_light_large.dd140c3b359c16ccd8e918ca6ad0b2628151fe1c.png	t
305	Glock-18 | Brass	0	1	20	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_glock_aq_brass_light_large.c9fbb8483ca7b5859fafc3c8fe495b3d396205dd.png	t
306	P2000 | Scorpion	0	0.08	20	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_hkp2000_am_scorpion_p2000_light_large.86333a595bc6c6139a4e84734e6eb88cd33d3e14.png	t
307	AWP | Snake Camo	0.06	0.8	20	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_awp_sp_snake_light_large.c0b327d960af85c987bed944287935fb4b6a780a.png	f
308	Sawed-Off | Copper	0	1	20	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sawedoff_aq_copper_light_large.a2d3d9236120109adf8df1bc53b7d02250f6a50a.png	f
309	AUG | Copperhead	0.12	0.38	20	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_aug_hy_copperhead_light_large.166fd555b0075feb698783999d906c4529d2d631.png	f
310	SCAR-20 | Palm	0.06	0.8	20	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_scar20_sp_palm_light_large.ed935d932711961605c3b03b896560f4ebfe8861.png	f
311	AK-47 | Predator	0.06	0.8	20	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ak47_sp_zebracam_light_large.5f15c9e41b9ac135b87cdadb407c9872e31c1f29.png	f
312	M4A4 | Desert Storm	0.06	0.8	20	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_hy_desert_light_large.30d1e3dcc03baca8d4a3f222b3b851ad12c77799.png	f
313	AWP | Medusa	0	1	21	covert_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_awp_cu_medusa_awp_light_large.05c6f5c67a2fbf7d042637568ba2ab25e44bb08c.png	t
314	M4A4 | Poseidon	0	0.33	21	classified_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_cu_poseidon_light_large.3db5688a5b47bd5720e7384abf13c45231a3cc03.png	f
315	M4A1-S | Icarus Fell	0	0.1	21	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_silencer_hy_icarus_light_large.4af0a9b1122471816242601013d478ade6a0697b.png	f
316	G3SG1 | Chronos	0	0.4	21	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_g3sg1_cu_chronos_g3sg1_light_large.5db791048981cda0babe949ac443f09ba8aa9eb3.png	f
317	MP9 | Pandora's Box	0	0.3	21	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp9_aa_pandora_light_large.837ea28260252a1f654c272289007ae3c4c3e7ec.png	f
318	UMP-45 | Minotaur's Labyrinth	0	0.39	21	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ump45_cu_labyrinth_light_large.62c8aa10ca8ad146809a21031194e450190f8485.png	f
319	AWP | Sun in Leo	0	0.5	21	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_awp_hy_zodiac2_light_large.67da534322361569bd9637688b704b57232529fa.png	f
320	Tec-9 | Hades	0	1	21	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_tec9_hy_hades_light_large.9b5757d9034889f93b907b45dffe0a3802b2e4bc.png	f
321	M249 | Shipping Forecast	0	0.5	21	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m249_hy_zodiac3_light_large.299cb04c12c20280930562504161309fbb9c1e45.png	f
322	P2000 | Pathfinder	0	0.35	21	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_hkp2000_sp_labyrinth2_light_large.240b91eab5dc2e0f6806dfbd2fc5d33bdebe53bb.png	f
323	Dual Berettas | Moon in Libra	0	0.5	21	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_elite_hy_zodiac1_light_large.cedfe5166a361ccc3c32a28847addcdc66ad25d7.png	f
324	AUG | Daedalus	0	0.55	21	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_aug_sp_labyrinth3_light_large.86c4c77bbc59793e1bf632e1ef49101829a14773.png	f
325	Nova | Moon in Libra	0	0.5	21	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_nova_hy_zodiac1_light_large.b06536b160c1807d7aa4c8e906771d3c5c2f7c59.png	f
326	MP7 | Asterion	0	0.55	21	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp7_sp_labyrinth_light_large.05382e4a98099c6747e1a3d636b47bd617b8866a.png	f
327	AK-47 | X-Ray	0	1	22	covert_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ak47_cu_ak_xray_light_large.a16215bb471dac8cc257c13dbc03e24514a7f018.png	t
328	AWP | Silk Tiger	0	0.6	22	classified_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_awp_am_tigers_blue_light_large.4346995a5382cb8e6ba636335f3f4e94998a447f.png	f
329	MAC-10 | Hot Snakes	0	1	22	classified_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mac10_gs_mac10_snake_light_large.0b91f21def06a39df43e93f6cd25cf13e4edfd19.png	f
330	Galil AR | Phoenix Blacklight	0	0.7	22	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_galilar_sp_phoenix_tags_purple_light_large.6b71292ab21580860b1dd716c5ce956bc99132ec.png	f
331	Glock-18 | Franklin	0	0.4	22	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_glock_cu_money_glock_light_large.9866d8ea7d9b5c569377aef5fb19bbc74ea4058d.png	f
332	SG 553 | Hypnotic	0	0.08	22	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sg556_aa_vertigo_light_large.56c7e1c30b3239dbaab4ffef7905c48d77a35a50.png	f
333	P250 | Bengal Tiger	0.06	0.8	22	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p250_hy_p250_tiger_light_large.c9afe189e84a6df33578138afddab06252e2621b.png	f
334	Desert Eagle | Night Heist	0	0.65	22	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_deagle_am_heist_plans_purple_light_large.737fb624218d14185e259e9f0af20ae1626a0e0b.png	f
335	Negev | Phoenix Stencil	0	0.65	22	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_negev_hy_phoenix_tags_red_light_large.6d8ee0ad8e74ea1a6c6af60824445bd1450e34ac.png	f
336	P90 | Tiger Pit	0	0.5	22	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p90_am_tigers_brown_light_large.853f8f5151285d07fa9e03527bf14dc40347c25e.png	f
337	Nova | Rust Coat	0	0.8	22	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_nova_aq_steel_light_large.01de004c646bf108c25c61e88af29720164da476.png	f
338	R8 Revolver | Phoenix Marker	0	0.6	22	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_revolver_am_phoenix_tags_blue_light_large.c98c31a965c8c89fe1c7ee5c5774daebef5a5c27.png	f
339	MP7 | Vault Heist	0	0.6	22	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp7_am_heist_plans_yellow_light_large.5d416001244a233cd2e9feabc4046b5788c3b051.png	f
340	UMP-45 | Houndstooth	0	0.6	22	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ump45_hy_houndstooth_brown_light_large.f90a2f46ceb0de3a2de44d92004b3a42cfa95e75.png	f
341	M249 | Predator	0.06	0.8	22	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m249_sp_zebracam_light_large.d0d25a58f276d6a538eab874f1f4aa5724f37b6e.png	f
342	Tec-9 | Phoenix Chalk	0	0.8	22	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_tec9_hy_phoenix_tags_lilac_light_large.aea02b337e17a45482f1122047c756b9c8166249.png	f
343	Dual Berettas | Heist	0	0.7	22	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_elite_am_heist_plans_green_light_large.a4c7acda57bfceac6b4e25708bfd4881e9bed5e2.png	f
344	Sawed-Off | Clay Ambush	0	0.6	22	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sawedoff_hy_tigers_tan_light_large.6e52ecbb72de6bd0786141efefc3e7040989b6d7.png	f
345	PP-Bizon | Death Rattle	0.08	0.5	22	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_bizon_hy_nerodia_light_large.6bef659d5403a53618b7bf7f5448d537395114f9.png	f
346	Tec-9 | Brass	0	1	23	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_tec9_aq_brass_light_large.0e78665f494e390a064c8a838030b4458536d9ae.png	t
347	Dual Berettas | Anodized Navy	0	0.08	23	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_elite_an_navy_light_large.87999cce45a03f8e83c28db98874810a5c990c10.png	t
348	M4A4 | Tornado	0.06	0.8	23	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_so_tornado_light_large.5e852b0952af47cde9b8c60edf137f34b81fe812.png	f
349	P250 | Gunsmoke	0.06	0.8	23	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p250_hy_gelpen_light_large.214a92b3bec9ab81ad0c13276fa4ac552530f31f.png	f
350	Nova | Walnut	0.06	0.8	23	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_nova_cu_walnut_nova_light_large.38cd0f88162ed88eb81df71f5fb18139c3a36c77.png	f
351	MAG-7 | Sand Dune	0.06	0.8	23	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mag7_so_sand_light_large.9dfc46fd60aa92768b02d39371d5aac04b892ff8.png	f
352	AWP | Pit Viper	0.08	0.5	24	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_awp_hy_snakeskin_light_large.e6addbb49a7024f800a35c9e081402a2c8631028.png	t
353	Glock-18 | Candy Apple	0	0.3	24	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_glock_so_red_light_large.17b18a34a4d840905587e918a8500576e91b0cb9.png	f
354	MP7 | Anodized Navy	0	0.08	24	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp7_an_navy_light_large.7b705336c3ee472db933931597f0ab191217b3dc.png	f
355	Sawed-Off | Full Stop	0	0.6	24	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sawedoff_hy_varicamo_red_light_large.8db408c4317e19bfdf8adc6c3183327866423445.png	f
356	M4A1-S | Boreal Forest	0.06	0.8	24	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_silencer_hy_forest_boreal_light_large.1a7f334b65d1ff1a4ca0bb4a1b164d643169f982.png	f
357	P2000 | Granite Marbleized	0.06	0.8	24	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_hkp2000_hy_granite_light_large.30d6a68c522ae5dd0cf7a67e07eccb66cf50b04c.png	f
358	UMP-45 | Gunsmoke	0.06	0.8	24	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ump45_hy_gelpen_light_large.79d22fa00d44408a719b7a840aa4497eebca68fb.png	f
359	Dual Berettas | Stained	0	1	24	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_elite_aq_forced_light_large.c654256613e0893b16be27a7621ec469a63a9955.png	f
360	Nova | Candy Apple	0	0.3	24	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_nova_so_red_light_large.f19886d0d01e730fc1e050416a6642488526a94c.png	f
361	XM1014 | CaliCamo	0	0.6	24	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_xm1014_hy_varicamo_desert_light_large.8931cbff2aa329928977420d05616b306eb0a91f.png	f
362	Tec-9 | Groundwater	0.06	0.8	24	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_tec9_so_olive_light_large.6c35f2cb6ef0f893f02d70759c528fe4958adebc.png	f
363	FAMAS | Colony	0.06	0.8	24	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_famas_so_space_marine_light_large.bc0a11080c9b3b50c13ddbe4afa3f6f96311fec4.png	f
364	Nova | Sand Dune	0.06	0.8	24	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_nova_so_sand_light_large.33854508338eb4801380c7d7d328f2285ad3a746.png	f
365	AUG | Contractor	0.06	0.8	24	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_aug_so_pmc_light_large.e2a06ba5d6c412408d2447e162572817ee052bd3.png	f
366	PP-Bizon | Sand Dashed	0.06	0.8	24	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_bizon_sp_tape_short_sand_light_large.dcf913a3a4fcd421012482e8c1cb55d05d9828f9.png	f
367	Dual Berettas | Cobalt Quartz	0	0.4	25	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_elite_am_crystallized_blue_light_large.5756d02f9908e1c4d70e6f1d9dae53b3731fc0fd.png	t
368	USP-S | Night Ops	0	0.6	25	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_usp_silencer_hy_varicamo_night_light_large.df1cac3f27ea81237acbc9d56137f5e3ddf072d5.png	f
369	SG 553 | Anodized Navy	0	0.08	25	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sg556_an_navy_light_large.5c45c1c33100694fc010a39ba92e3afab1d7c5e7.png	f
370	P90 | Teardown	0	0.6	25	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p90_sp_mesh_hot_and_cold_light_large.b1e759ec76815883bf3e293215e3858eaa0763b1.png	f
371	AWP | Safari Mesh	0.06	0.8	25	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_awp_sp_mesh_tan_light_large.3608cbeb9bb163bfd2becb4ebcce2576b9ca78d9.png	f
372	FAMAS | Cyanospatter	0.06	0.8	25	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_famas_hy_reef_light_large.d3138f4491b5413241bf64a82e0545ddc4c9e80d.png	f
373	Desert Eagle | Mudder	0.06	0.8	25	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_deagle_hy_mottled_sand_light_large.615be084d4bc9db8c98451f13351cae1fa0ec69c.png	f
374	XM1014 | Blue Steel	0	1	25	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_xm1014_aq_blued_light_large.322850eb06df5352f302b6d4dffb1d2472dac596.png	f
375	PP-Bizon | Night Ops	0	0.6	25	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_bizon_hy_varicamo_night_light_large.f0593c24d14333e68c7eb0e916385270d5612b46.png	f
376	AUG | Storm	0.06	0.8	25	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_aug_so_stormfront_light_large.84dee43e41ff0fe95173b635e369b486848fe92f.png	f
377	XM1014 | Blue Spruce	0.06	0.8	25	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_xm1014_so_moss_light_large.5308796fa6ef2edaa45a6c6e73c59452fc265781.png	f
378	Galil AR | Sage Spray	0.06	0.8	25	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_galilar_sp_spray_desert_sage_light_large.34f1268c2cf12e7794538b7140456d3716d81142.png	f
379	P250 | Boreal Forest	0.06	0.8	25	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p250_hy_forest_boreal_light_large.d805b3c56f74420ea25e14db86e7cf8181d98134.png	f
380	SG 553 | Waves Perforated	0.06	0.8	25	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sg556_sp_tape_dots_waves_light_large.6225b7ae003cefaab7deca7ea517576991055bbd.png	f
381	G3SG1 | Jungle Dashed	0.06	0.8	25	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_g3sg1_sp_tape_short_jungle_light_large.02fd06db8f950789b6c4bff265df06439382c585.png	f
382	SCAR-20 | Splash Jam	0.06	0.8	26	classified_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_scar20_hy_hunter_blaze_pink_light_large.b7af5eed6be0c7d95ec01e2ed916841da005ccfc.png	t
383	M4A4 | Modern Hunter	0.06	0.8	26	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_hy_hunter_modern_light_large.9753bebcd2ed4bba8a432283f35c5d197912db9d.png	f
384	Nova | Modern Hunter	0.06	0.8	26	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_nova_hy_hunter_modern_light_large.47b91ea74e82f6e041bcf2d03c117be62ae25909.png	f
385	P250 | Modern Hunter	0.06	0.8	26	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p250_hy_hunter_modern_light_large.01e6755d9b42d1594837f60bad79e0f6295df8db.png	f
386	XM1014 | Blaze Orange	0.06	0.8	26	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_xm1014_hy_hunter_blaze_orange_light_large.def31710e14b573829a2138ffc7c3eadb3f49e5c.png	f
387	Nova | Blaze Orange	0.06	0.8	26	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_nova_hy_hunter_blaze_orange_light_large.3aa81203583739ae361787f625976dee6b7a1f25.png	f
388	PP-Bizon | Modern Hunter	0.06	0.8	26	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_bizon_hy_hunter_modern_light_large.04891176bf0284ba4f8002c2c32445cbde50a8c6.png	f
389	P2000 | Grassland Leaves	0.06	0.8	26	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_hkp2000_sp_leaves_grassland_light_large.a7885e449e09718b530a5f8e4b79a30931f104cb.png	f
390	XM1014 | Grassland	0.06	0.8	26	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_xm1014_so_grassland_light_large.412e08f5f190db15e6118e19c6ea0752bbaed180.png	f
391	MAC-10 | Tornado	0.06	0.8	26	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mac10_so_tornado_light_large.38973a9ca86e017389bed34a6b1c86a2b6585891.png	f
392	PP-Bizon | Forest Leaves	0.06	0.8	26	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_bizon_sp_leaves_light_large.ce2a773d74c050c18f99daaa39d4b670878abd99.png	f
393	MAG-7 | Bulldozer	0.06	0.8	27	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mag7_so_yellow_light_large.bb2e6280c1d92a574c93123d79d5724276db69f3.png	t
394	MP9 | Hot Rod	0	0.08	27	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp9_an_red_light_large.051bb03c037d5218c15c2b9f9797b21b5d0744a8.png	f
395	UMP-45 | Blaze	0	0.08	27	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ump45_aa_flames_light_large.03387f4a0a4ac6fe60437ec998e93de0b39e9b8b.png	f
396	MAC-10 | Amber Fade	0	0.4	27	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mac10_aa_fade_metallic_light_large.1af4a93ef5fee1f1510d364f54d1a730474860ef.png	f
397	Glock-18 | Groundwater	0.06	0.8	27	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_glock_so_olive_light_large.1af3a84683b1f123d0bc17319d14979bf7a12115.png	f
398	SSG 08 | Tropical Storm	0.06	0.8	27	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ssg08_sp_palm_shadow_light_large.fb24b5ed2a03a35a12f5ee7166bc458ab4ae77e7.png	f
399	MP7 | Orange Peel	0.06	0.8	27	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp7_sp_tape_orange_light_large.5870d3d214c5b4cd923d68c4a016b72596808db1.png	f
400	SG 553 | Gator Mesh	0	0.6	27	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sg556_sp_mesh_python_light_large.ee7a2353f499fc228f88aaa99bd7ac4d9fac1257.png	f
401	Negev | CaliCamo	0	0.6	27	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_negev_hy_varicamo_desert_light_large.169bd7cc986fe8b3411c2f8dc484dad4ee9fff71.png	f
402	Five-SeveN | Contractor	0.06	0.8	27	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_fiveseven_so_pmc_light_large.eb6a08d487f3423d956898bae7b84433b1f46d25.png	f
403	AUG | Colony	0.06	0.8	27	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_aug_so_space_marine_light_large.ee525f5aaf19c6d97af3b0378d3d3cac26476d80.png	f
404	G3SG1 | Safari Mesh	0.06	0.8	27	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_g3sg1_sp_mesh_tan_light_large.19acce2a10000a2c03f8f89dc39ff1af3e8ca195.png	f
405	P90 | Scorched	0.06	0.8	27	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p90_sp_dapple_light_large.6a715fc8b63ae569c2facb1607b5243c21a7280a.png	f
406	P250 | Bone Mask	0.06	0.8	27	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p250_sp_tape_light_large.8ece2047279c054325b0d2632559de145cef524a.png	f
407	Galil AR | Hunting Blind	0	0.6	27	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_galilar_sp_mesh_slashes_light_large.f3c1ef94e52aa6cfe3c3ba2890e0d5ac0764900a.png	f
408	AWP | Gungnir	0	0.6	28	covert_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_awp_gs_awp_gungnir_light_large.f80c285940f75cca58731d8ead6bd8be1c18e38b.png	t
409	Negev | Mjölnir	0	0.6	28	classified_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_negev_gs_negev_thor_light_large.5060a7a913b1716faf7e81e145d65e0b4081b20f.png	f
410	Desert Eagle | Emerald Jörmungandr	0	0.5	28	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_deagle_am_jorm_green_light_large.db1045fee0af23f28bb4affd164d07e3aadd42ec.png	f
411	P90 | Astral Jörmungandr	0	0.5	28	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p90_am_jorm_blue_light_large.4d15121e1a295202b46b7452b0a927c009cebb37.png	f
412	AUG | Flame Jörmungandr	0	0.5	28	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_aug_am_jorm_orange_light_large.1df28085a1bc10ff726b8a54f5c94cca1880fd19.png	f
413	XM1014 | Frost Borre	0	0.5	28	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_xm1014_am_knots_silver_light_large.73c743e4867ffc0525bc79c488dc90cc12ee53ac.png	f
414	MAC-10 | Copper Borre	0	0.5	28	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mac10_am_knots_brown_light_large.c968468f0f9fc526f7a12dd8a7f5ebd7fcc24819.png	f
415	SCAR-20 | Brass	0	1	28	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_scar20_aq_brass_light_large.4b497f1e4a42a5c645181a1534cc28320e3f6842.png	f
416	CZ75-Auto | Emerald Quartz	0	0.7	28	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_cz75a_am_crystallized_green_light_large.6ae192cbf47b2cb11ec47fcdcbad07a6a78fb3f7.png	f
417	M4A1-S | Moss Quartz	0	0.5	28	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_silencer_am_crystallized_dark_green_light_large.d9fbf93df4fb38d302a7dd8b2783ce738035a916.png	f
418	Dual Berettas | Pyre	0.06	0.55	28	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_elite_hy_gelpen_dark_light_large.064bcecab3cc87140e4a6e6f0f34cc3e00675d77.png	f
419	USP-S | Pathfinder	0	0.35	28	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_usp_silencer_sp_labyrinth2_light_large.62697e5210fe32fc1b5bc3d525b197d53508950d.png	f
420	MAG-7 | Chainmail	0	0.22000000000000003	28	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mag7_am_chainmail_light_large.e6d6e648f7b590f64af2805f59271a364f1b2283.png	f
421	SSG 08 | Red Stone	0.06	0.5	28	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ssg08_so_rune_stone_light_large.008cb3ddaf106a019bc45143d61bb2e520ca50f4.png	f
422	Galil AR | Tornado	0.06	0.8	28	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_galilar_so_tornado_light_large.afda126687661b7907d69932f66a45d3e7c85573.png	f
423	FAMAS | Night Borre	0	0.55	28	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_famas_sp_knots_blue_light_large.1a6a2c6fe90198a053410d364dd48441b51fb1a7.png	f
424	MP7 | Scorched	0.06	0.8	28	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp7_sp_dapple_light_large.d78eb500eb366b42a585762582f34009835dd946.png	f
425	SG 553 | Barricade	0	0.65	28	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sg556_sp_asgard_wall_light_large.4b11684f29f2153a5eaa7b3c162e7ed6665a045a.png	f
426	Tec-9 | Nuclear Threat	0.06	0.8	29	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_tec9_sp_nukestripe_green_tec9_light_large.0067333625bf11ffa93d705dde553b4b2bf6f82c.png	t
427	P250 | Nuclear Threat	0.06	0.8	29	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p250_sp_nukestripe_green_light_large.099ce352cdcf83040aad712968d066f260439c22.png	t
428	M4A4 | Radiation Hazard	0.06	0.8	29	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_sp_nukestripe_orange_light_large.deb3995ec0bd7021cf33ca089f1d889fb92aba94.png	f
429	XM1014 | Fallout Warning	0.06	0.8	29	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_xm1014_sp_nukestripe_maroon_light_large.8b6facf30ed6057509fcaf2c8a75a04c2629203a.png	f
430	P90 | Fallout Warning	0.06	0.8	29	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p90_sp_nukestripe_maroon_light_large.c3915e723b821c0d03fcaf506129b23f16bdff0f.png	f
431	UMP-45 | Fallout Warning	0.06	0.8	29	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ump45_sp_nukestripe_maroon_light_large.929675f44f0303f77fdd556348294178ecf23db1.png	f
432	MAG-7 | Irradiated Alert	0.06	0.8	29	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mag7_sp_nukestripe_brown_light_large.e1d7540ba5131a2e2cf36a8f7c6edc98d0cd431a.png	f
433	PP-Bizon | Irradiated Alert	0.06	0.8	29	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_bizon_sp_nukestripe_brown_light_large.993c1c6ed6bf4a239268651e4150bc4a615f2632.png	f
434	Sawed-Off | Irradiated Alert	0.06	0.8	29	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sawedoff_sp_nukestripe_brown_light_large.6a39be9be23998f45a37a5f71c6467dacb728a03.png	f
435	MP7 | Whiteout	0.06	0.8	30	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp7_so_whiteout_light_large.1f27273c189c19b42567bdd44ffc3e5be70ea3a4.png	t
436	P2000 | Silver	0	0.08	30	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_hkp2000_an_silver_light_large.84bfd2f0bdc7ab614d9cd7103b7d071606118166.png	t
437	M249 | Blizzard Marbleized	0.06	0.8	30	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m249_hy_blizzard_light_large.d247530ad94ee2a0c164116b89fd3f38a43dbf30.png	f
438	Galil AR | Winter Forest	0.06	0.8	30	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_galilar_hy_forest_winter_light_large.2a0bc5c784fc6782304eb3ef68e4f07c6c92d3bf.png	f
439	G3SG1 | Arctic Camo	0.06	0.8	30	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_g3sg1_hy_arctic_contrast_light_large.d1444467ee9975d1b4d5287a280e8684e7338493.png	f
440	FAMAS | Contrast Spray	0.06	0.8	30	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_famas_sp_spray_light_large.fe886d820746c0f4333c0e0ea6d308473e241c4b.png	f
441	M4A1-S | Master Piece	0	1	31	classified_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_silencer_cu_m4a1-s_silence_light_large.e48d06783e5c6c99b2f65d6c82891ce9739f0181.png	t
442	AWP | Pink DDPAT	0.06	0.8	31	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_awp_hy_ddpat_pink_light_large.a00bebead467a7106062058982a1f8651cf663bc.png	f
443	USP-S | Road Rash	0	1	31	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_usp_silencer_cu_usp_sandpapered_light_large.8de907fed2d0036e0c6c1f326c20915e846227a7.png	f
444	CZ75-Auto | Nitro	0.06	0.8	31	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_cz75a_so_orange_accents2_light_large.844bd6d01ce7c69486327ceb44b65b8c7cc49f2d.png	f
445	SSG 08 | Detour	0	0.43	31	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ssg08_hy_ssg08_marker_light_large.318454c8676dc6d72ad1b6e343e661d9831645fb.png	f
446	XM1014 | VariCamo Blue	0	0.5	31	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_xm1014_hy_varicamo_blue_light_large.6b99e2f4d5092295c86b872e2a08d7ea698fe5b6.png	f
447	Glock-18 | Night	0.06	0.8	31	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_glock_so_night_light_large.e56ea92b4b8c1914a7f5f4e789483313845a0b4a.png	f
448	Desert Eagle | Urban DDPAT	0.06	0.8	31	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_deagle_hy_ddpat_urb_light_large.06af0cb0e08490f1fba17acd1b9c98978745c213.png	f
449	P2000 | Grassland	0.06	0.8	31	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_hkp2000_so_grassland_light_large.c2c8cd99960f57e1e4eeb1261dfaf3006e672577.png	f
450	MP7 | Gunsmoke	0.06	0.8	31	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp7_hy_gelpen_light_large.e19dd688c21ae094ffc3649e80ee1c1f0959125a.png	f
451	MP9 | Storm	0.06	0.8	31	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp9_so_stormfront_light_large.7ba67d4546c43cb6dfb9e46eb68d23d5b57471ae.png	f
452	MAG-7 | Storm	0.06	0.8	31	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mag7_so_stormfront_light_large.40f72ef6782f32f64bd883923fedfe0d1512d582.png	f
453	Sawed-Off | Sage Spray	0.06	0.8	31	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sawedoff_sp_spray_desert_sage_light_large.e944ddb90e97199d1f274c481462a3a660b9fc5a.png	f
454	M249 | Contrast Spray	0.06	0.8	31	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m249_sp_spray_light_large.1954bdc0dc1e10eebeece7f34e2b9f8e51596d55.png	f
455	UMP-45 | Scorched	0.06	0.8	31	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ump45_sp_dapple_light_large.a25c92df26ac1c70c65741a07d9da8b0d0785022.png	f
456	AUG | Akihabara Accept	0	1	32	covert_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_aug_cu_anime_aug_light_large.f049075c645871ee67b0b47253f59c26143efc49.png	t
457	AK-47 | Hydroponic	0	0.8	32	classified_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ak47_am_bamboo_jungle_light_large.98cd023e9d2207ad765b600b281352cbc5009051.png	f
458	Five-SeveN | Neon Kimono	0	0.8	32	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_fiveseven_hy_kimono_diamonds_light_large.c82060a31b7e4b17c73eb76fd87c09037a3eba42.png	f
459	M4A4 | Daybreak	0	0.6	32	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_am_kimono_sunrise_light_large.f4c4233632fed7004ab4666aeaceab53233cddd6.png	f
460	Desert Eagle | Sunset Storm 弐	0	0.75	32	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_deagle_am_seastorm_shojo_light_large.7df4fe386dac18ae2a8c3e50df7dfb9165dece83.png	f
461	Desert Eagle | Sunset Storm 壱	0	0.75	32	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_deagle_am_seastorm_blood_light_large.1e92a7e19fde014e5a70832a93b440e0c036d596.png	f
462	Galil AR | Aqua Terrace	0	0.7	32	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_galilar_am_geometric_steps_light_large.fd64d3b26b97da3c03ab009e91d3f53c95e86cc0.png	f
463	MAG-7 | Counter Terrace	0	0.65	32	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mag7_hy_geometric_steps_green_light_large.542348e3effe63aae75b070cb1ca7d193e8356cf.png	f
464	Tec-9 | Terrace	0	1	32	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_tec9_hy_geometric_steps_yellow_light_large.4d50c678bf9eeb9f063a432aa9d5aec68e863f7d.png	f
465	Desert Eagle | Midnight Storm	0	0.75	32	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_deagle_am_seastorm_light_large.aef21efecda37237d24debe3f409f42954dadddd.png	f
466	P250 | Crimson Kimono	0	0.8	32	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p250_hy_kimono_diamonds_red_light_large.99ecb66f68d6bba4e17bc30cd72d5041e838371c.png	f
467	Tec-9 | Bamboo Forest	0	0.6	32	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_tec9_hy_bamboo_jungle_light_large.31268450fbb5b5c2221e6eaadbe7124cf85f3e1d.png	f
468	PP-Bizon | Bamboo Print	0	0.8	32	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_bizon_hy_bamboo_jungle_ink_light_large.0f9ee611e9b667e90923e9fc0da89430881ae7ae.png	f
469	P250 | Mint Kimono	0	0.8	32	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p250_sp_kimono_diamonds_light_large.f8b2d66cdc64e8860b36ac2d08060d04e5ec6ae4.png	f
470	G3SG1 | Orange Kimono	0	0.8	32	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_g3sg1_hy_kimono_diamonds_orange_light_large.bdab5d4f92f5733ed056bbe276761c377b5c3401.png	f
471	Sawed-Off | Bamboo Shadow	0	0.6	32	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sawedoff_hy_bamboo_jungle_black_light_large.8c345668f9d6ba961f72fd67c405a8ed2cfffd4c.png	f
472	M4A1-S | Nitro	0.06	0.8	33	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_silencer_so_orange_accents_light_large.625f58cdc5641f440ccf2fe866c3152b5803d1f2.png	t
473	SSG 08 | Acid Fade	0	0.03	33	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ssg08_aa_fade_grassland_light_large.82950af31c177d14983665459ddee77f63379f4d.png	f
474	Five-SeveN | Silver Quartz	0	0.4	33	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_fiveseven_am_crystallized_silver_light_large.1c5e2fb5a3541523f1ff3a28f4138d83eed3a67f.png	f
475	FAMAS | Teardown	0	0.6	33	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_famas_sp_mesh_hot_and_cold_light_large.c93a700bb3cf4d14241d3c837569b571685b0b29.png	f
476	USP-S | Forest Leaves	0.06	0.8	33	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_usp_silencer_sp_leaves_light_large.a71c8dc482fea4aaa1c6b5c115e370a7e134ddfd.png	f
477	MP9 | Orange Peel	0.06	0.8	33	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp9_sp_tape_orange_light_large.77854282ffc131b7bbe878c140b3c41bfb735242.png	f
478	AUG | Condemned	0.06	0.8	33	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_aug_sp_mesh_forest_fire_light_large.eabf7b69ca1447bee596cdbaf21b48cd7537dbce.png	f
479	G3SG1 | VariCamo	0	0.6	33	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_g3sg1_hy_varicamo_light_large.6c944e82080f68d87881cdab86852e9375af9bb9.png	f
480	Galil AR | VariCamo	0	0.6	33	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_galilar_hy_varicamo_light_large.4893edef6838528fadcc0a790a0ed132cdf2f1b9.png	f
481	M249 | Gator Mesh	0	0.6	33	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m249_sp_mesh_python_light_large.39f20f5499a7d68e8b90a9e064c993e9a803d721.png	f
482	SSG 08 | Blue Spruce	0.06	0.8	33	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ssg08_so_moss_light_large.74753da395e67d490101269838df28e1b6313a25.png	f
483	Dual Berettas | Contractor	0.06	0.8	33	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_elite_so_pmc_light_large.eb0b65f961c27f233d8846c80301666925712e93.png	f
484	SCAR-20 | Contractor	0.06	0.8	33	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_fiveseven_so_pmc_light_large.eb6a08d487f3423d956898bae7b84433b1f46d25.png	f
485	MP7 | Army Recon	0.06	0.8	33	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp7_sp_spray_army_light_large.e879b8808f8c967e4f08fde194d6d58f64dfdb2d.png	f
486	Tec-9 | Army Mesh	0	0.6	33	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_tec9_sp_mesh_army_light_large.b2404b6aa0c7e1584fe2691cfeba70d823aff562.png	f
487	AK-47 | Wild Lotus	0	1	34	covert_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ak47_cu_ak_island_floral_light_large.1303e76d0a77ab164a46a7aba5ab1dcaf1acee6b.png	t
488	MP9 | Wild Lily	0	0.7	34	classified_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp9_cu_mp9_island_floral_light_large.d8f6334a2905b146dd2107e592068bdb333f49cd.png	f
489	SSG 08 | Sea Calico	0	0.5	34	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ssg08_hy_flowers_stmarc_light_large.482eabb4a21633695ffaab7d63a77aee8b18a1ff.png	f
490	AUG | Midnight Lily	0	0.5	34	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_aug_am_bloom_blue_light_large.02cb11a89ee5a7f3d39fbec15757eba34691e526.png	f
491	Glock-18 | Synth Leaf	0	0.7	34	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_glock_hy_leaf_blue_light_large.1b017cc8d4594d924537f9928db4253ff628284c.png	f
492	FAMAS | Sundown	0	0.6	34	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_famas_sp_palm_sunset_light_large.924bca1ce6c9034d6963c81c59fa72a2a4b45a07.png	f
493	Five-SeveN | Crimson Blossom	0	0.5	34	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_fiveseven_hy_bud_red_light_large.d149fac98ea236499e2fa159b82420a8eedefad4.png	f
494	UMP-45 | Day Lily	0	0.55	34	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ump45_hy_bloom_red_light_large.c2f9856966873a344ab366cbf13a6fc6bf0081fc.png	f
495	MP7 | Teal Blossom	0	0.5	34	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp7_sp_bud_green_light_large.9b06527d579a047b676e49001fa16b39208f9149.png	f
496	M4A4 | Dark Blossom	0	0.5	34	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_sp_bud_blue_light_large.f31b88226c77480548a0c1e62581bea8f3946906.png	f
497	XM1014 | Banana Leaf	0	0.6	34	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_xm1014_hy_leaf_green_light_large.347a54ae0c8292ff6dc506dcf1702de2040a7459.png	f
498	P90 | Sunset Lily	0	0.5	34	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p90_sp_bloom_orange_light_large.e3e14184d5d31c9484b7697d7f38aafa3a479e20.png	f
499	Tec-9 | Rust Leaf	0	0.5	34	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_tec9_sp_leaf_orange_light_large.9dea950fd04f689507adcb2acb3ff2540f19dffe.png	f
500	MAC-10 | Surfwood	0	0.5	34	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mac10_sp_twigs_beach_light_large.82c99f7aa915b87043e167b42e25a5fbe2e8c1e2.png	f
501	M249 | Jungle	0.06	0.8	34	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m249_so_jungle_light_large.1e5297273a0d6f70737aec6bf8ce370de6b87fad.png	f
502	PP-Bizon | Seabird	0	0.5	34	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_bizon_so_aqua_stmarc_light_large.19036e4aeafdaeaa9c22cd0b86af514562c1761c.png	f
503	Sawed-Off | Jungle Thicket	0	0.5	34	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sawedoff_sp_palm_green_light_large.f8f95ff757a290d96692f78c0cc80c9cbcd7a0fe.png	f
504	MP5-SD | Bamboo Garden	0	0.55	34	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp5sd_hy_bamboo_stmarc_light_large.1d07511b139360d0e973f8c7e316dc1792a2b812.png	f
505	Tec-9 | Red Quartz	0	0.4	35	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_tec9_am_crystallized_light_large.787b7ae299c33a003515537d5335b38d589e2e9f.png	t
506	Desert Eagle | Urban Rubble	0	0.5	35	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_deagle_hy_varicamo_urban_light_large.a9791d0046206f88085f2d0850ec577c6f535a47.png	f
507	Sawed-Off | Amber Fade	0	0.4	35	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sawedoff_aa_fade_metallic_light_large.aa7418206953ed4b7707ddbc859bb1eb7bf6c9ab.png	f
508	M4A4 | Urban DDPAT	0.06	0.8	35	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_hy_ddpat_urb_light_large.7ced16120d54bcdc2faa66d215ae81041ab23bc4.png	f
509	MAC-10 | Candy Apple	0	0.3	35	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mac10_so_red_light_large.00ffdb3b77314dae95b0683242cba794dbe5dd03.png	f
510	MAG-7 | Metallic DDPAT	0	0.08	35	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mag7_am_urban_light_large.49c3b842a021265e8dd66f05ebe20fc76a6dfdba.png	f
511	P250 | Metallic DDPAT	0	0.08	35	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p250_am_urban_light_large.2f6ef478d97cb2887fc4106cf89768f6cccd8ed6.png	f
512	P90 | Ash Wood	0	0.45	35	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p90_sp_twigs_light_large.32f929b66cdf34997897a48260a53946e786a531.png	f
513	SCAR-20 | Carbon Fiber	0	0.12	35	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_scar20_am_carbon_fiber_light_large.1e2b9188a7cffb26c7a912995de329bd70d0d1d9.png	f
514	Five-SeveN | Forest Night	0.06	0.8	35	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_fiveseven_hy_forest_night_light_large.fc245886bed9e789350127f844afe63f34f64936.png	f
515	G3SG1 | Polar Camo	0.06	0.8	35	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_g3sg1_hy_arctic_contrast_light_large.d1444467ee9975d1b4d5287a280e8684e7338493.png	f
516	Dual Berettas | Colony	0.06	0.8	35	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_elite_so_space_marine_light_large.101c6b29315d37db050a4c7817a4c11517baa167.png	f
517	Nova | Polar Mesh	0.06	0.8	35	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_nova_sp_mesh_arctic_contrast_light_large.b85fc46665b05c2a0eea955a7946e644a7618944.png	f
518	PP-Bizon | Urban Dashed	0.06	0.8	35	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_bizon_sp_tape_short_urban_light_large.141f3b1f24bc6c964a78ca58b38c01ad773fbc12.png	f
519	UMP-45 | Urban DDPAT	0.06	0.8	35	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ump45_hy_ddpat_urb_light_large.2a86a32be1865ab7757d80bfbee44c80662ee4d9.png	f
520	Dual Berettas | Demolition	0.26	0.6	36	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_elite_so_tangerine_light_large.3fd8ec1b63079a11e24d78228ad989b51a30b0ca.png	t
521	AK-47 | Black Laminate	0.06	0.8	36	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ak47_hy_ak47lam_bw_light_large.c504cab278a4955e92255ee2022340be2d0982a4.png	f
522	P90 | Glacier Mesh	0.06	0.8	36	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p90_sp_mesh_glacier_light_large.742539900d5186f68defb5fac7e6a82771c302dd.png	f
523	PP-Bizon | Carbon Fiber	0	0.12	36	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_bizon_am_carbon_fiber_light_large.bc4fbdedf71b3b922a2596dac8df3c50306ecf51.png	f
524	MAC-10 | Urban DDPAT	0.06	0.8	36	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mac10_hy_ddpat_urb_light_large.0c29c0fcd256ee141fac956e954179504dfe0c74.png	f
525	XM1014 | Urban Perforated	0.06	0.8	36	consumer_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_xm1014_sp_tape_dots_urban_light_large.751c1e2059e1b9b8ef64b4cd94b22e35cccd0477.png	f
527	M4A1-S | Hyper Beast	0	1	37	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_silencer_cu_m4a1_hyper_beast_light_large.31850937661935a062d5f6faf5a1f02fdb90b861.png	t
529	MAC-10 | Neon Rider	0	0.45	37	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mac10_cu_mac10_neonrider_light_large.4ba82cf2ba2d9fdc694d707b563421bbcc20b174.png	t
531	Galil AR | Eco	0.1	0.85	37	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_galilar_cu_galil_eco_light_large.7f64e2d77423b3c4263a74caeda18383c2e487d5.png	f
533	Five-SeveN | Monkey Business	0.1	0.9	37	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_fiveseven_cu_fiveseven_banana_light_large.2d78a6614cb329ada893c8d028eb5c2b485f26f0.png	f
535	FAMAS | Djinn	0	1	37	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_famas_aq_famas_jinn_light_large.a0e1b8e2a572c5e3d6472181d4a0d6ce7f51139f.png	f
537	MAG-7 | Heat	0	1	37	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mag7_cu_mag7_redhot_light_large.76087a836e8c98fd10765a4b56dca946ba5acb4d.png	f
539	AWP | Worm God	0	0.45	37	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_awp_aq_awp_twine_light_large.f976c41b8f978d2b8d13734f14f6586982d859f1.png	f
541	CZ75-Auto | Pole Position	0	0.7	37	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_cz75a_cu_cz75_precision_light_large.a0d0ea9d92ff9c535cbdaa9c07a1a95a5181a82b.png	f
543	UMP-45 | Grand Prix	0.25	0.35	37	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ump45_am_ump_racer_light_large.6d935bf0d33ca90994b1dd9aec78a8938dcd94a2.png	f
545	AK-47 | Elite Build	0	1	37	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ak47_cu_ak47_mastery_light_large.4305c0ba4b02ce531fc08c275fa6a9d87da2cf7e.png	f
547	P250 | Valence	0	0.8	37	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p250_aq_p250_contour_light_large.faf5b305c68d8ea23814163b0a69dafa7318b818.png	f
549	Desert Eagle | Bronze Deco	0	0.4600000000000001	37	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_deagle_am_bronze_sparkle_light_large.42dc1d2bae9e586f75d6425f94a195014891533b.png	f
551	MP7 | Armor Core	0	0.5	37	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp7_aq_mp7_ultramodern_light_large.5351e1926e4a9599d149c4941a8603f4143ff999.png	f
553	Sawed-Off | Origami	0	0.55	37	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sawedoff_cu_sawedoff_origami_light_large.5f1b3cef6d518cda69daafddd9b2c240a29cf0cc.png	f
555	Negev | Man-o'-war	0.1	0.2	37	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_negev_am_negev_glory_light_large.11ebbe525e92bd0a56dd4d3a7795a31a01823ba7.png	f
557	M4A1-S | Chantico's Fire	0	0.99	38	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_silencer_cu_m4a1s_soultaker_light_large.4939d69bd691d421ca9c7d6558b46088c8ac5317.png	t
559	PP-Bizon | Judgement of Anubis	0	0.5	38	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_bizon_cu_bizon_curse_light_large.c19cf584d3e28db4914d1559cd387999457944d8.png	t
561	P250 | Asiimov	0.1	1	38	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p250_cu_p250_asiimov_light_large.7ccf465f7dc55d2d960465d404c10cbc8c442cee.png	f
563	UMP-45 | Primal Saber	0	0.77	38	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ump45_cu_ump45_primalsaber_light_large.67bef91a43734d654516f65c4288711b257d2049.png	f
565	AUG | Fleet Flock	0	1	38	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_aug_cu_aug_swallows_light_large.29e48baa4086b20e4a5f714b5f8cc6350de7c758.png	f
567	SSG 08 | Ghost Crusader	0	1	38	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ssg08_gs_ssg08_armacore_light_large.043342869c64e1a08107055a4e1b332ad9c763c0.png	f
569	Galil AR | Firefight	0	1	38	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_galilar_gs_galilar_incenerator_light_large.669901b842361b46108ced0a555f5575839d093e.png	f
571	XM1014 | Black Tie	0	0.75	38	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_xm1014_cu_xm1014_spectrum_light_large.6318ee51c405fb5e8a40aedfc3d98d530f789a5b.png	f
573	CZ75-Auto | Red Astor	0	1	38	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_cz75a_gs_cz75a_redastor_light_large.e00e688986c50877a103fe66d70fdf1fc13bbe8b.png	f
575	Tec-9 | Re-Entry	0	0.43	38	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_tec9_am_tec9_redblast_light_large.0f8de75737cc35ac1d14cf74924838da4d7ab849.png	f
577	SG 553 | Atlas	0	0.8100000000000002	38	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sg556_cu_sg553_atlas_light_large.536218f8160485fa927e19fa06fedae43d9c04e6.png	f
579	MP9 | Bioleak	0	0.5	38	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp9_am_mp9_bioleak_light_large.d9b0d0e9fea2104871e0510bd704bfa03cdd6056.png	f
581	P2000 | Oceanic	0	0.6	38	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_hkp2000_hy_p2000_oceani_light_large.8f64654c5964975c85201b1dbbdf7b8ffab768be.png	f
583	Dual Berettas | Ventilators	0	0.45	38	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_elite_gs_dualberettas_ventilators_light_large.45cb1ffd25de1ed5b90ba104b1f8e0a8eb2eb255.png	f
585	G3SG1 | Orange Crash	0	0.52	38	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_g3sg1_sp_g3sg1_militiaorange_light_large.215d54d5c86185e61d65694899bf029f6e070cab.png	f
587	M249 | Spectre	0	0.5	38	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m249_cu_m249_spectre_light_large.b0a23c44e56390b4bbdc2c389911f6cc2b42da3d.png	f
589	Sawed-Off | Fubar	0.4	1	38	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sawedoff_gs_sawedoff_fubar_light_large.0673d87171fccc0fc98e77806da7259e283283ea.png	f
591	Galil AR | Chatterbox	0.35	0.85	39	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_galilar_cu_galil_abrasion_light_large.8398e4836a0c26add3514a6af2262704d85fec07.png	t
593	AWP | Man-o'-war	0.1	0.2	39	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_awp_am_awp_glory_light_large.348eae0f5d4da8671886826648dd4197a9829090.png	t
595	AK-47 | Cartel	0	0.75	39	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ak47_aq_ak47_cartel_light_large.2e7be9f4c7bda304f2a7c374260d95affca93f0b.png	f
597	M4A4 | Ú¥ìþÄï (Dragon King)	0	0.75	39	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_cu_m4a4_ancestral_light_large.cbd9732689f42b7aec91bdb9166b1ee414974cb7.png	f
599	P250 | Muertos	0	0.6	39	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p250_cu_p250_mandala_light_large.0acb51464cd72643c6a1fefaf8736288eb5d02f7.png	f
601	Desert Eagle | Naga	0	1	39	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_deagle_aq_deagle_naga_light_large.b410ad835b1894a448676ae0590586298af2cb33.png	f
603	MAC-10 | Malachite	0	0.5	39	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mac10_am_mac10_malachite_light_large.65b0eff12e655fb94ec9de545348178f1a5d60e0.png	f
605	Dual Berettas | Urban Shock	0	0.4699999999999999	39	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_elite_cu_elites_urbanstorm_light_large.d33c9dd65434d8b9f4e7b5092fcc2e07a874e625.png	f
607	Sawed-Off | Serenity	0	0.5	39	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sawedoff_cu_sawedoff_deva_light_large.9ffde04f2f082dce492b2fa6e250f69f538a50b5.png	f
609	MP9 | Deadly Poison	0	1	39	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp9_cu_mp9_deadly_poison_light_large.0776976e709ec7b503dd7e47b8c962338615b5da.png	f
611	Glock-18 | Catacombs	0	0.5	39	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_glock_cu_glock_deathtoll_light_large.cfcc6a17037a33bbb524ca1856c07cf76dda449d.png	f
613	M249 | System Lock	0	0.8	39	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m249_cu_m249_sektor_light_large.c957e70c656024b2c062f7af2031a76cb3c83f1c.png	f
615	XM1014 | Quicksilver	0	0.5	39	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_xm1014_aq_xm1014_sigla_light_large.71c180cd3b8bdea7d0b119ab2b9d54792c51b3aa.png	f
617	SCAR-20 | Grotto	0	0.5	39	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_scar20_aq_scar20_leak_light_large.06b9231638ba347e91c671ecf2c1364754794893.png	f
619	M4A4 | Neo-Noir	0	0.9	40	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_cu_m4a4_neo_noir_light_large.b03bd6902c1d714af0bd4795dce8e653dd12dcc9.png	t
621	MP7 | Bloodsport	0	0.65	40	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp7_gs_mp7_bloodsport_light_large.ab5c304901ceb320482742b041815e7b5e3ccb95.png	t
623	USP-S | Cortex	0	1	40	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_usp_silencer_cu_usp_cut_light_large.573fc8c594667e378f3ed9890ce48bbb586e8de0.png	f
625	AWP | Mortis	0	0.64	40	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_awp_gs_awp_death_light_large.19bdee04e6a0b4a3b8f832fd8ea18fea1e558f2e.png	f
627	AUG | Stymphalian	0	0.63	40	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_aug_gs_aug_stymphalian_birds_light_large.0840c45db138a07275c2250a0881fe752f27c601.png	f
629	Glock-18 | Moonrise	0	0.65	40	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_glock_aa_glock_18_urban_moon_fever_light_large.a0227f81e44dba68abbe595d427d62f9f90da99d.png	f
631	MAG-7 | SWAG-7	0	0.9200000000000002	40	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mag7_aq_mag7_swag7_light_large.20341e396db88a5ecde84f8b803a500f4aec3b55.png	f
633	UMP-45 | Arctic Wolf	0	0.8	40	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ump45_cu_ump45_white_fang_light_large.f63a10d5ee18e3045adfdcf963b9067b3b0a6b48.png	f
635	Nova | Wild Six	0	0.8	40	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_nova_gs_nova_anchorite_light_large.419b869b5316b67a6ed673edafd088a9d16c066c.png	f
637	Negev | Lionfish	0	0.55	40	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_negev_sp_negev_lionfish_light_large.f8326a67617c5138ab8b6f6afc81375fbd091033.png	f
639	R8 Revolver | Grip	0	1	40	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_revolver_gs_revolver_tread_light_large.7c3bd1302f62853e5694aec2d70cf1c7140b3fc0.png	f
641	MP9 | Black Sand	0	1	40	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp9_cu_mp9_black_sand_light_large.37dce08f403ec73c1e16b3dc46068b22293e9514.png	f
643	P2000 | Urban Hazard	0	1	40	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_hkp2000_cu_p2000_urban_hazard_light_large.17657c4e9c3379f634c78e4d02ca9e9facbe9edb.png	f
645	PP-Bizon | Night Riot	0	0.8	40	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_bizon_cu_bizon_riot_light_large.2f0848b27a917287062306f49870cf9ec06bbbbe.png	f
647	SG 553 | Aloha	0	0.55	40	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sg556_sp_sg533_aloha_light_large.03aa863680ab2223924ae9cbe8b7662a84fb162c.png	f
649	Five-SeveN | Flame Test	0	0.65	40	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_fiveseven_gs_fiveseven_hot_rod_violet_light_large.66cb3d6336f4ea07a7f4ebbd3192c59f0afca3fc.png	f
651	XM1014 | Oxide Blaze	0	0.7	40	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_xm1014_cu_xm1014_oxide_blaze_light_large.691be80b706e1ea4faf9b5c9bec40b3611b1d440.png	f
653	AWP | Lightning Strike	0	0.08	41	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_awp_am_lightning_awp_light_large.3761894103ee0fec90af459928635933ba27e36d.png	t
655	AK-47 | Case Hardened	0	1	41	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ak47_aq_oiled_light_large.92c8d125e4e54758d37e946496030e9a18833b58.png	f
657	Desert Eagle | Hypnotic	0	0.08	41	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_deagle_aa_vertigo_light_large.85a16e4bfb8b1cc6393ca5d0c6d3a1e6e6023323.png	f
659	USP-S | Dark Water	0.1	0.26	41	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_usp_silencer_am_zebra_dark_light_large.add709b2eb683853f9508ddf9c22503d7efb9925.png	f
661	Glock-18 | Dragon Tattoo	0	0.08	41	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_glock_am_dragon_glock_light_large.e42a72a19a2239c992573b88179897af37c7f849.png	f
663	M4A1-S | Dark Water	0.1	0.26	41	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_silencer_am_zebra_dark_light_large.f484368a478f5e02d1b9d5e2816354fe705503f3.png	f
665	SG 553 | Ultraviolet	0.06	0.8	41	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sg556_so_purple_light_large.44483356b334466acb6e781057d8f96a73cb376f.png	f
667	AUG | Wings	0	0.14	41	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_aug_hy_feathers_aug_light_large.e1419b52a3ddd4bed5328f438ea5dea07b0ba248.png	f
669	MP7 | Skulls	0.1	0.26	41	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp7_hy_skulls_light_large.3e38912bdbea8a2b03b149e619f9f141e54facfd.png	f
671	SSG 08 | Blood in the Water	0.06	0.2	42	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ssg08_cu_shark_light_large.00812c20a896847013b0a2913a166f6ba220a258.png	t
673	USP-S | Serum	0	0.25	42	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_usp_silencer_am_electric_red_light_large.ef8005beba74458fabbe8f664e0b210b2ef3a007.png	f
675	P90 | Cold Blooded	0	0.08	42	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p90_am_slither_p90_light_large.583a90c66858cf0cc20253d2f4a0be1168eadbca.png	f
677	Five-SeveN | Case Hardened	0	1	42	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_fiveseven_aq_oiled_light_large.fdaa095453965b2be93f8aa90ae469d926fac4e7.png	f
679	MP9 | Hypnotic	0	0.08	42	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp9_aa_vertigo_light_large.41a7195e0a6ba44c2fc64d64bee0635444b0c569.png	f
681	Nova | Graphite	0	0.12	42	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_nova_am_crumple_light_large.e46bab0dc8f8fe10b83c18ed9f9d9945352781af.png	f
683	Dual Berettas | Hemoglobin	0	0.2	42	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_elite_am_ossify_red_light_large.9da21d3dc7b64952d853818075f524a9e4c1dfd3.png	f
685	SCAR-20 | Crimson Web	0.06	0.8	42	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_scar20_hy_webs_darker_light_large.8e06e878c22b82c6bb1045f26e1bbc1926faecf2.png	f
687	Tec-9 | Blue Titanium	0	0.04	42	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_tec9_am_fluted_tec9_light_large.bfb4506150a675b24d3178f457507db2903364d6.png	f
689	FAMAS | Hexane	0	0.4	42	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_famas_hy_bluehex_light_large.fe87763b33ea8963cf87e9b8fd7b9bfc9014d747.png	f
691	P250 | Hive	0	0.3	42	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p250_hy_redhex_light_large.099092ccf56439b922b51569ce87f2f908abcc19.png	f
693	M4A1-S | Blood Tiger	0	0.3	42	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_silencer_hy_redtiger_light_large.0b40a51b0020fa1781ddb7368e3b39c03263b2dd.png	f
695	CZ75-Auto | Victoria	0	0.75	43	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_cz75a_aq_etched_cz75_light_large.5fa7e4f56600efeaceb99a948c6fa5dc3648a3b9.png	t
697	P250 | Undertow	0	0.2	43	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p250_am_p250_beaded_paint_light_large.2ddd1d4b6dd6fa2082001802a60acfa9daba722d.png	f
699	CZ75-Auto | The Fuschia Is Now	0	0.4	43	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_cz75a_am_fuschia_light_large.9ca4218835426c791482a3d7cc3b00d00c958d40.png	f
701	Desert Eagle | Heirloom	0	0.8	43	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_deagle_aq_engraved_deagle_light_large.804a1a01a29bf80673b739f3eb220272a6838193.png	f
703	Five-SeveN | Copper Galaxy	0	0.2	43	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_fiveseven_am_copper_flecks_light_large.d2af814b76763880470bc7039d5569eb74b26978.png	f
705	Tec-9 | Titanium Bit	0	0.2	43	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_tec9_am_fluted_tec9_light_large.bfb4506150a675b24d3178f457507db2903364d6.png	f
707	CZ75-Auto | Tread Plate	0	0.2	43	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_cz75a_am_diamond_plate_light_large.ef425c82bae5d971bd5e1e9c54b9cd2f992e4e16.png	f
709	USP-S | Stainless	0	0.8	43	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_usp_silencer_aq_usp_stainless_light_large.3f6edb8ebd4138742504859e0d3e7c51a23c39db.png	f
711	Glock-18 | Blue Fissure	0.06	0.58	43	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_glock_hy_craquelure_light_large.8e97eb17a01e73c47a8987685d740b344aeb2cb8.png	f
713	CZ75-Auto | Crimson Web	0.06	0.8	43	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_cz75a_hy_webs_light_large.2093b43aefa82ee6713c472384ea283fdd44f023.png	f
715	Dual Berettas | Panther	0	0.58	43	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_elite_so_panther_light_large.019431b3fca18b027d07fe29d0ee7bf88df75576.png	f
717	P2000 | Red FragCam	0	0.7	43	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_hkp2000_hy_poly_camo_light_large.e4c6576e012974ba60e6dbc70fe5cd1cacc30011.png	f
719	AWP | Wildfire	0.01	0.7	44	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_awp_cu_awp_wildfire_light_large.61e36b12eb45a39836cdb5badb5a536737684861.png	t
721	FAMAS | Commemoration	0	0.5	44	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_famas_gs_famas_legacy_gold_light_large.34013884c12276d1c83ceb4ea9fb83428df02920.png	t
723	MP9 | Hydra	0	1	44	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp9_cu_mp9_hydra_light_large.b7763a811b3bc9d19d04502fba0edc6cbe355766.png	f
725	AUG | Death by Puppy	0	0.4	44	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_aug_am_aug_death_by_doggy_light_large.eb9b56273d30c50b93d2cb0a2e2843b525012878.png	f
727	P90 | Nostalgia	0	0.57	44	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p90_cu_p90_nostalgia_light_large.8d1cfe3582915ab9702b57e1376eb0d0ffab2331.png	f
729	MP5-SD | Agent	0	1	44	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp5sd_gs_mp5_fbi_light_large.98c397d31feb201fd3d754a2e0b1d1508d75b2b9.png	f
731	UMP-45 | Plastique	0	0.8	44	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ump45_cu_ump_bomb_light_large.48162f997295cb72c35acb2eafbef620b60a1659.png	f
733	Five-SeveN | Buddy	0	0.55	44	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_fiveseven_cu_fiveseven_gsg9_light_large.870dec48f951d3a6420bdb332f0acd25ee1254b1.png	f
735	P250 | Inferno	0	0.68	44	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p250_gs_p250_inferno_light_large.89b435cf4b1eab8a9fed8f7aa19228fe9421b4eb.png	f
737	M249 | Aztec	0	0.75	44	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m249_aq_m249_aztec_light_large.81173c5b61be806039e643a0c273e4dce33bd5ee.png	f
739	MAG-7 | Popdog	0	0.8	44	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mag7_gs_mag7_popdog_light_large.3c45fd23cd1947bb9b1747e36823980a44feaed4.png	f
741	Glock-18 | Sacrifice	0	1	44	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_glock_cu_glock_hero_light_large.7b0f5975c7e0ba3ce1694c4795520184fc56c367.png	f
743	FAMAS | Decommissioned	0	1	44	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_famas_cu_famas_nuke_tension_light_large.0cf9412e22f626e675b76506cf2f240a64a05b22.png	f
745	MAC-10 | Classic Crate	0	1	44	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mac10_gs_mac10_dust_crate_light_large.988816a75bc41f34cb18aff91ce6256299a9a52c.png	f
747	Tec-9 | Flash Out	0	0.7	44	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_tec9_cu_tec9_flash_light_large.977076b5fe7a2fdb9337de2a3ff7c4b867e9b674.png	f
749	Dual Berettas | Elite 1.6	0	0.7	44	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_elite_gs_dual_elites_classic_light_large.a899ad9f2e1bb8522fdeb022c99c64c2456826d1.png	f
751	SCAR-20 | Assault	0	0.62	44	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_scar20_cu_scar_assault_light_large.57aa89979dfaab334bb3e91c09f54269e98cf47a.png	f
753	AK-47 | Asiimov	0.05	0.7	45	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ak47_cu_ak47_asiimov_light_large.665fc3b83c8046398787a57d2ef7a9d938244820.png	t
755	AWP | Neo-Noir	0	0.5	45	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_awp_cu_awp_neonoir_light_large.c5dd57f8555d13c41f08024f27a9314074b698af.png	t
757	Desert Eagle | Mecha Industries	0	0.6	45	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_deagle_gs_deagle_mecha_light_large.e08c1fd8709f6b368956c41c68b17c15ff635635.png	f
759	MP5-SD | Phosphor	0	0.8	45	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp5sd_gs_mp5_festival_drip_light_large.c71af0a784e5ecd6e5d5f2f71961be155e283cde.png	f
761	UMP-45 | Momentum	0	0.5	45	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ump45_cu_ump_arrows_light_large.83f1e692bdafa92f29ce15aebb02502c9e70f276.png	f
763	MAC-10 | Pipe Down	0	0.9	45	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mac10_gs_mac10_exo_pipes_light_large.355aad3fa1602f8e682a5663f72b12feba0d4cf2.png	f
765	G3SG1 | Scavenger	0	0.65	45	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_g3sg1_gs_g3sg1_savage_light_large.e452574f580f51b1da6312c0f80a0dc07e073d8b.png	f
767	Galil AR | Signal	0	0.5	45	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_galilar_hy_galil_signal_red_light_large.d7c26f54fd72ec451094ea7791e921346e013197.png	f
769	P250 | Nevermore	0	0.4	45	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p250_aa_p250_gravediggers_light_large.df680e4648f5e08ec6e92ed36a5b9c05ae8bc5f4.png	f
771	USP-S | Flashback	0	0.5	45	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_usp_silencer_cu_usp_flashback_light_large.47e10129af33303bac557560400c33e4fe555680.png	f
773	M4A4 | Magnesium	0	1	45	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_gs_m4a4_chopper_ghost_light_large.374913da49233223de4ca1ff09a20cc2a7a94288.png	f
775	Tec-9 | Fubar	0.14	1	45	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_tec9_gs_tec9_fubar_light_large.00f64007983561f57c808b23e9260ebea6437bc7.png	f
777	Glock-18 | Oxide Blaze	0	0.85	45	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_glock_cu_glock18_corroden_light_large.68906a0523399b599555746b51db2ffac29c5db5.png	f
779	SG 553 | Danger Close	0.02	0.8	45	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sg556_gs_sg553_over_heated_light_large.aba3188360b2a87b8687d73af6c2e3034290402c.png	f
781	MP9 | Modest Threat	0	0.75	45	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp9_gs_mp9_colony01_light_large.f8d9792131b786025a960ddeda2eeb77f97c55e3.png	f
783	Sawed-Off | Black Sand	0	0.9	45	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sawedoff_cu_sawedoff_black_sand_light_large.7ed9ce5083489c0fdf92814f0ebf6945ec6f29d4.png	f
785	Nova | Wood Fired	0	0.75	45	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_nova_gs_nova_hunter_brute_light_large.8e2520f25098056ccd03b679859458fdc006c0a7.png	f
787	AK-47 | Nightwish	0	1	46	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ak47_cu_ak47_nightwish_light_large.0c4581be094e2bd732bec18ebdad2f71b1018af2.png	t
789	MP9 | Starlight Protector	0	0.8	46	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp9_gs_mp9_starlight_light_large.79d29560c71c4ba592824c1a1e3a8172cc7269be.png	t
791	FAMAS | Rapid Eye Movement	0	1	46	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_famas_gs_famas_rapid_eyes_light_large.8a166e6d36121b16dddc11b9aca94d5c541b0b56.png	f
793	MP7 | Abyssal Apparition	0	1	46	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp7_cu_mp7_fear_light_large.17f608ce70f44af09c1a92c541430804429ae2d6.png	f
795	Dual Berettas | Melondrama	0	1	46	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_elite_cu_elites_beware_light_large.3a4517010e237136f9cca5c593beedd94a2a0a15.png	f
797	M4A1-S | Night Terror	0	0.7	46	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_silencer_gs_m4a1s_insomnia_light_large.265e6eb866d751caf4bbe7f8c8b62e400c5f0175.png	f
799	USP-S | Ticket to Hell	0	0.76	46	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_usp_silencer_cu_usp_to_hell_light_large.13912fa139f2055f7e3044a234ad111bbbce548f.png	f
801	G3SG1 | Dream Glade	0	1	46	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_g3sg1_cu_g3sg1_glade_light_large.93e176857183136f472c81b75331929d7b51d3ad.png	f
803	PP-Bizon | Space Cat	0	0.67	46	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_bizon_cu_bizon_spacecat_light_large.c2c9bbf949c4bdf2ce3173cd2447559177716dd3.png	f
805	XM1014 | Zombie Offensive	0	0.5	46	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_xm1014_am_xm_zombie_offensive_light_large.0e15d69fbf9b3d93b14f54f85fa84bcb45c8f49e.png	f
807	Five-SeveN | Scrawl	0	1	46	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_fiveseven_cu_fiveseven_alpha_omega_light_large.698d00d53621c1b2358655aaff4f729bc0ed6300.png	f
809	MAC-10 | Ensnared	0	0.9	46	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mac10_cu_mac10_pixie_light_large.26950e30ef7e74e69920d67965c409b8b88902c8.png	f
811	MP5-SD | Necro Jr.	0	1	46	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp5sd_gs_mp5_kid_necronomicon_light_large.87443871e29948cd2cea24c01bd241b3623e91dd.png	f
813	P2000 | Lifted Spirits	0	1	46	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_hkp2000_cu_p2k_flying_dream_light_large.db13d5d635e72a5c6d5ab742a6fa3a1ec4129405.png	f
815	Sawed-Off | Spirit Board	0	1	46	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sawedoff_cu_sawedoff_ouija_light_large.79ee13876374fa1fd2f04bea84124c265fb55407.png	f
817	MAG-7 | Foresight	0	0.7	46	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mag7_cu_mag7_predictor_light_large.431734cae141d06a20fa3615d38e3b15c708602a.png	f
819	SCAR-20 | Poultrygeist	0	0.57	46	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_scar20_sp_scar_chickenfight_light_large.b32fde27f0f45456b4c1e5f049be6f44bc8649b7.png	f
821	P90 | Death by Kitty	0.08	0.32	47	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p90_cu_catskulls_p90_light_large.0ff2c5c53a691e28de02cd7b40e395d53d8c6826.png	t
823	AWP | BOOM	0.06	0.28	47	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_awp_hy_blam_simple_light_large.ed114947481e0366b2cde092a8ddac4d7250775b.png	f
825	AK-47 | Red Laminate	0.06	0.8	47	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ak47_hy_ak47lam_light_large.199620e808579639264cf753d0650721b4bc1f37.png	f
827	Sawed-Off | Orange DDPAT	0.06	0.8	47	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sawedoff_hy_ddpat_orange_light_large.04fe163870ad65e17d8e4dd9403180ed3c5a218d.png	f
829	Galil AR | Orange DDPAT	0.06	0.8	47	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_galilar_hy_ddpat_orange_light_large.8499a023e61f6d3f7d03012521422bedaedd6c2b.png	f
831	P250 | Splash	0.06	0.18	47	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p250_sp_splash_p250_light_large.9270d8d14c39aef83407ea50e51f0eb89c17263d.png	f
833	M4A4 | Faded Zebra	0.06	0.8	47	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_sp_zebracam_bw_light_large.de08ef2a6d7524e682118cef5d12124c5156dfa8.png	f
835	MAG-7 | Memento	0.02	0.18	47	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mag7_hy_icosahedron_light_large.f7ea8cca0b48a0463d0877af9c94e7f54d0f1d79.png	f
837	FAMAS | Doomkitty	0.08	0.22000000000000003	47	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_famas_hy_doomkitty_light_large.c9dd7b8fb1a44d5691684aae406d360433550468.png	f
839	M4A4 | X-Ray	0	0.3	48	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_cu_xray_m4_light_large.e929bb3998df4902c2bd6f6fbb775cec071558ba.png	t
841	Desert Eagle | Cobalt Disruption	0	0.2	48	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_deagle_am_ddpatdense_peacock_light_large.a486db3160bcdcf6bc5a1d8179c450b02f620151.png	f
843	AWP | Electric Hive	0	0.4	48	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_awp_hy_hive_light_large.2189958e2afa2c69cfcdd807124c279a0e645625.png	f
845	FAMAS | Afterimage	0.02	0.4	48	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_famas_cu_broken_path_famas_light_large.5d45539735d838ffefd26467a8c767b71807c785.png	f
847	AK-47 | Blue Laminate	0.02	0.4	48	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ak47_hy_ak47lam_blue_light_large.9f8ec5103efa5b7a0b3919a13b4de78e1bd612a0.png	f
849	P90 | Blind Spot	0	0.5	48	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p90_hy_modspots_light_large.a702b8feaf0e2568e60efb2ab722819b0521ea4b.png	f
851	Five-SeveN | Nightshade	0	0.5	48	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_fiveseven_hy_flowers_light_large.4f94edf6ac032c15fedafa6ba1f2425a4ca8bded.png	f
853	Galil AR | Blue Titanium	0	0.04	48	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_galilar_an_titanium30v_light_large.4264e8ec1cedb3bce31a89c934c630bd56d480c1.png	f
855	G3SG1 | Azure Zebra	0	0.28	48	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_g3sg1_sp_zebracam_blue_light_large.42199f9c4c0bd1ff9f569d6e7348c5cedf4630f5.png	f
857	Nova | Ghost Camo	0	0.4	48	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_nova_sp_camo_wood_blue_light_large.d63e06a38ef396a945defd7c1ad9da9ba79fe60d.png	f
859	PP-Bizon | Water Sigil	0	0.5	48	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_bizon_hy_water_crest_light_large.c4d0aad9cb87870f84f3709ff3b8ecc9fe489d89.png	f
861	P250 | Steel Disruption	0	0.2	48	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p250_am_ddpatdense_silver_light_large.36220b384099ed61c2b9ba64af899b892e4a4c58.png	f
863	AK-47 | Jaguar	0	1	49	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ak47_cu_panther_ak47_light_large.6b7c82083b5fbb71631ad7961ac1543d1fc2a5cd.png	t
865	M4A4 | Bullet Rain	0.02	0.4600000000000001	49	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_cu_bullet_rain_m4a1_light_large.4b359387b8abcdb0ae92134ba0f2106c405d9222.png	t
867	Nova | Bloomstick	0.06	0.8	49	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_nova_cu_spring_nova_light_large.0be95a01dd54b579186464d0533c5195ffb14a8f.png	f
869	AWP | Corticera	0.06	0.3	49	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_awp_cu_favela_awp_light_large.4329c047ea1899f3846a1a81539ba2a27665a54e.png	f
871	AUG | Bengal Tiger	0.06	0.8	49	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_aug_hy_tiger_light_large.d2fe957d3903dc5779403ed1c95947e18fa7e6fd.png	f
873	P2000 | Corticera	0.06	0.3	49	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_hkp2000_cu_favela_p2000_light_large.cc40db4d5048c7ddcfb52642d954e91400e59290.png	f
875	Desert Eagle | Crimson Web	0.06	0.8	49	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_deagle_hy_webs_darker_light_large.7b9cb19bac52ebe7c49e3abdfb0c400ea252fef8.png	f
877	PP-Bizon | Blue Streak	0.06	0.8	49	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_bizon_hy_splatter_light_large.7a7417d95485ceb2148bdd3d228219307082ea8a.png	f
879	MP7 | Ocean Foam	0	0.08	49	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp7_am_ossify_blue_light_large.b2c077afc23ddb48381629155713816dbf09fb84.png	f
881	Glock-18 | Steel Disruption	0	0.2	49	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_glock_am_ddpatdense_silver_light_large.4d83c0a0b958bb15f694c7047996ece59f4be05a.png	f
883	P90 | Virus	0.06	0.8	49	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p90_hy_zombie_light_large.7f66b30e6902ae7722b7951fd7446ae7e9b3880e.png	f
885	MAC-10 | Ultraviolet	0.06	0.8	49	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mac10_so_purple_light_large.c4e2252fe50aab42b6dcd871f33786f68e6261ea.png	f
887	Negev | Bratatat	0	1	49	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_negev_cu_bratatat_negev_light_large.b7589c335fb7066d53b1897e000f031d316641e6.png	f
889	USP-S | Blood Tiger	0	0.3	49	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_usp_silencer_hy_redtiger_light_large.5d778f6030de49296f349081781d84ef215a9b90.png	f
891	CZ75-Auto | Hexane	0	0.4	49	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_cz75a_hy_bluehex_light_large.032e4b0999830a45d7439d07faef66b8299a105f.png	f
893	SSG 08 | Dark Water	0.1	0.26	49	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ssg08_am_zebra_dark_light_large.5636371696eee32d9a3e588ff3b42f6b33776d99.png	f
895	XM1014 | Red Python	0.08	0.5	49	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_xm1014_hy_snakeskin_red_light_large.d019a25e10fe53f2edf2958fb322c59621abc4de.png	f
897	AK-47 | Aquamarine Revenge	0	1	50	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ak47_cu_ak47_courage_alt_light_large.27e4e7d38dc2ce36ffe86bd6ec65d6f525751eaa.png	t
899	AWP | Hyper Beast	0	1	50	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_awp_cu_awp_hyper_beast_light_large.55efa5e3094af71ca6a56b6eac96cb022f7ecd8b.png	t
901	SG 553 | Cyrex	0	1	50	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sg556_cu_sg553_cyrex_light_large.ef2fb1e4d88e8eb7c0efe12e231a773ca1792a4d.png	f
903	CZ75-Auto | Yellow Jacket	0	1	50	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_cz75a_cu_cz75a_chastizer_light_large.d3234c712c3c068adbbfd5718c468c778f2351dd.png	f
905	MP7 | Nemesis	0	0.32	50	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp7_cu_mp7_nemsis_light_large.72074e71a27827f41dc5d6f511d2f003c1b60d8a.png	f
907	Negev | Loudmouth	0.14	0.65	50	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_negev_cu_negev_annihilator_light_large.421039357ccbbcb9ba1456caa1ed2ae4829b5495.png	f
909	M4A4 | Evil Daimyo	0	0.52	50	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_cu_m4a4_evil_daimyo_light_large.c208ba252c0d8902caa973a634cbfa945508a716.png	f
911	P2000 | Handgun	0	1	50	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_hkp2000_aq_p2000_boom_light_large.39f01b0b86b795bea56300432fecfbf93415ee58.png	f
913	MP9 | Ruby Poison Dart	0	0.5	50	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp9_am_mp9_nitrogen_light_large.3a0b5a7cd31a7cfd5f0d90b9a0a1dbfcdb642cca.png	f
915	FAMAS | Neural Net	0	0.6	50	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_famas_am_famas_dots_light_large.dc6f19278bac52ea06b8e3576fa324624f2f82b4.png	f
917	Galil AR | Rocket Pop	0	1	50	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_galilar_cu_galilar_particles_light_large.8732f64d53dbc9b0c732641655d4f99124d8cacc.png	f
919	USP-S | Torque	0	0.4600000000000001	50	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_usp_silencer_cu_usp_progressiv_light_large.91cde781cd0c8502bbbb66f37cc7f1baf2a10c05.png	f
921	Glock-18 | Bunsen Burner	0	0.8	50	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_glock_aq_glock18_flames_blue_light_large.5fed23d5a32793c25914eeb99b45f1a2b0cb9d6c.png	f
923	P90 | Elite Build	0	1	50	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p90_cu_p90_mastery_light_large.f58ff489c92ffa8c6e4c42814bad01c352df0ab6.png	f
925	Nova | Ranger	0	1	50	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_nova_cu_nova_ranger_light_large.e3e9d3d47d5707092223a268ef59adb53ce76278.png	f
927	UMP-45 | Riot	0	0.7	50	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ump45_cu_ump45_uproar_light_large.04cd84320c4370bced14a3989b0e141cff67ec88.png	f
929	Desert Eagle | Printstream	0	0.8	51	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_deagle_cu_deag_printstream_light_large.b468e56607da39fb2c88e493456290fd5db174c8.png	t
931	AK-47 | Legion of Anubis	0	0.7	51	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ak47_cu_ak47_anubis_light_large.77994b9d6a2f3020c0c5aa8c9c7f70357d460bff.png	t
933	M4A4 | Tooth Fairy	0	0.73	51	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_cu_m4a4_queenfairy_light_large.e5fb022145442cf85ba485d8c3cfd4f6391938e0.png	f
935	Glock-18 | Vogue	0	0.75	51	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_glock_cu_glock_eyecontact_light_large.fb7988d1d3d9ff159f81d3c0d9a2eacb976e2842.png	f
937	XM1014 | Entombed	0	0.5	51	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_xm1014_cu_xm1014_amulet_blue_light_large.1375467de64fba676253ac771bc9ce8f83b6a8f7.png	f
939	MAG-7 | Monster Call	0	1	51	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mag7_cu_mag7_monster_call_light_large.8bd66022cda47ab85f73e765dc35526e6a2ce7f0.png	f
941	MAC-10 | Allure	0	1	51	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mac10_cu_mac10_isoonna_light_large.004a4ddf7e9318cfbe98448b1c3b888fd4aff8dd.png	f
943	Tec-9 | Brother	0	1	51	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_tec9_gs_tec9_guerilla_light_large.796534c0914361eec796eccd5558930096f75f96.png	f
945	MP5-SD | Kitbash	0	0.8	51	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp5sd_gs_mp5sd_wasteland_legacy_light_large.95ba928dc2c910eb819194227aa9196fdf6d9eea.png	f
947	Galil AR | Connexion	0	0.8	51	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_galilar_gs_galil_phoenix_light_large.62909a6e708a56e8679b9aa9225ba438b1539511.png	f
949	P2000 | Gnarled	0	1	51	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_hkp2000_aq_p2000_lost_world_light_large.1d8b2a14b2b5b787ba450205bb3f133678dbe682.png	f
951	SSG 08 | Mainframe 001	0	1	51	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ssg08_cu_ssg08_mainframe_light_large.7d7d861da80bfecbe5141f19fbd32b95fb4496cf.png	f
953	P90 | Freight	0	1	51	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p90_gs_p90_container_light_large.ee8d779318fc1367b1c63bbfa202d6261a0171c1.png	f
955	PP-Bizon | Runic	0	1	51	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_bizon_gs_bizon_hellraider_light_large.c7aa487268b1e88b2e7fb1ff3c8c2eeeb24d4500.png	f
957	Negev | Ultralight	0	0.79	51	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_negev_cu_negev_ultralight_light_large.f47680cfcd5c2eb1594fd5ae51ed9caf1bb6d9cd.png	f
959	SG 553 | Ol' Rusty	0	0.7	51	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sg556_gs_sg553_rusty_light_large.c5dd8204f44be6e68069633eb261b66641444ff6.png	f
961	P250 | Cassette	0	0.6	51	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p250_cu_p250_cassette_light_large.8e62f8c18421bceb377e95aa6a806b5767fcf731.png	f
963	AK-47 | Neon Revolution	0	0.8	52	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ak47_cu_ak47_anarchy_light_large.6e98f0c6fcb81aaeca03c56eed68962f50c9ef94.png	t
965	FAMAS | Roll Cage	0	1	52	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_famas_gs_famas_rally_light_large.538baee44eb772de95029e4267ea9c41101bbc94.png	t
967	Tec-9 | Fuel Injector	0	1	52	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_tec9_gs_tec9_supercharged_light_large.e3ebc20f10eae02790fe95703b6099acca1d1809.png	f
969	MP9 | Airlock	0	1	52	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp9_cu_mp9_narcis_light_large.c63eaf3fab8c65ec3ab22da8205cbe3c51366d7a.png	f
971	AUG | Syd Mead	0	0.8	52	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_aug_gs_aug_syd_mead_light_large.333597e0555639f5d77541c363a9bb38d95055f3.png	f
973	Desert Eagle | Directive	0.06	1	52	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_deagle_aq_desert_eagle_constable_light_large.fb2f2673dd3997a21bff9129e0d2e294c03095e8.png	f
975	SCAR-20 | Powercore	0	1	52	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_scar20_gs_scar20_powercore_light_large.74bcd65b1a4a52dd397ede5aa59b860ca4c38939.png	f
977	Glock-18 | Weasel	0	1	52	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_glock_cu_glock18_weasel_light_large.e02e6e5196ebdee47c595799ff011dd645147505.png	f
979	SG 553 | Triarch	0	1	52	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sg556_cu_sg556_triarch_light_large.3ea74bea530adda100d25911372ca313ea99453a.png	f
981	MAG-7 | Petroglyph	0	0.44000000000000006	52	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mag7_cu_mag7_tribal_light_large.c226728af447f07808ea5954eb9a24528092d972.png	f
983	Negev | Dazzle	0.1	0.65	52	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_negev_hy_negev_dazzle_light_large.3558ece2a70252dcaa8ea9e324539ae1a4fc1bc0.png	f
985	CZ75-Auto | Imprint	0	1	52	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_cz75a_gs_cz75_tread_light_large.8c276db730bb33477aaa52f7a23825f295e14364.png	f
987	P90 | Grim	0	0.8	52	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p90_cu_p90_grimm_light_large.59514d7b54f637f314329bb3fef1c7ffd1b153ba.png	f
989	Five-SeveN | Scumbria	0	1	52	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_fiveseven_aq_five_seven_scumbria_light_large.bc05fc6435b84525a0ab140bc72e032a98dab710.png	f
991	XM1014 | Slipstream	0	0.5	52	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_xm1014_hy_xm1014_fractal_blue_light_large.e9720fb7b5928db8bcf79d62850af5bf475b9ec5.png	f
993	UMP-45 | Briefing	0	1	52	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ump45_cu_ump45_metritera_light_large.46ac4388a9651c555ec6849358b85f60a87c328d.png	f
995	G3SG1 | Ventilator	0	0.45	52	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_g3sg1_gs_g3sg1_ventilator_light_large.5cd3643d4d9cd0599e25a1302e788611bd9a0023.png	f
997	M4A1-S | Mecha Industries	0	0.8	53	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_silencer_gs_m4a1_mecha_industries_light_large.2973cf5ca9d1592d6652bf14ac89bcd8593d4f0a.png	t
999	Glock-18 | Wasteland Rebel	0	0.54	53	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_glock_cu_glock_wasteland_rebel_light_large.284899ab35e5a29c6edb64b2af194cee19a0ed89.png	t
1001	M4A4 | Desolate Space	0	1	53	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_cu_m4a4_desolate_space_light_large.1fcbd5e124ae7c54cf12e6f76c431e6671a73845.png	f
1003	P2000 | Imperial Dragon	0	0.63	53	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_hkp2000_gs_p2000_imperial_dragon_light_large.cc82bc6353a0e8ce963f6b0b600905d4dc37bf4a.png	f
1005	SCAR-20 | Bloodsport	0	0.45	53	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_scar20_gs_scar20_bloodsport_light_large.dd99feccb31d2ec296bcd620abd885e6fe50d44e.png	f
1007	R8 Revolver | Reboot	0	1	53	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_revolver_cu_r8_cybersport_light_large.d5eb827f99a401915b8377eda7b81a0bc9cae4bf.png	f
1009	AWP | Phobos	0	0.4	53	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_awp_gs_awp_phobos_light_large.fca961cc99c704f09c44e6e82378434ef0e22087.png	f
1011	Sawed-Off | Limelight	0	1	53	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sawedoff_cu_sawed_off_lime_light_large.87fbbe1597ea04a51b56f3b0f7c3fc6a5ff6553c.png	f
1013	AUG | Aristocrat	0	0.66	53	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_aug_gs_aug_aristocrat_light_large.4004dbb20c03d1a210ff9a98968ddb251bdfddc6.png	f
1015	P90 | Chopper	0	0.6	53	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p90_gs_p90_full_throttle_light_large.70ef68d70617eb318e2df05e09f780448a1baf0d.png	f
1017	Five-SeveN | Violent Daimyo	0	0.7	53	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_fiveseven_cu_five_seven_daimyo_light_large.d394398cae1977546887145dcf6a4892d2ed29aa.png	f
1019	PP-Bizon | Harvester	0	1	53	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_bizon_gs_pp_bizon_harvester_light_large.654d26d43d7e4583a0ede5e0ea6bb697858698dc.png	f
1021	P250 | Iron Clad	0.05	0.8	53	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p250_gs_p250_metal_panels_light_large.a104ce12e50fa24711708782e5d7b23e1bcb7d1b.png	f
1023	Tec-9 | Ice Cap	0	0.5	53	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_tec9_am_tec_9_sea_salt_light_large.726f78fd872aa2ccfcab9a051b4b79c314d50a4e.png	f
1025	MAC-10 | Carnivore	0	1	53	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mac10_aq_mac_10_alien_camo_light_large.10568510ec37ec8515546e5ac03455391bb9ec2d.png	f
1027	SG 553 | Aerial	0	0.6	53	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sg556_cu_sg553_aerial_light_large.a123874095a96a92aaacd0f64a4fef54fa455e82.png	f
1029	Nova | Exo	0	0.5	53	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_nova_aq_nova_sci_fi_light_large.9cf268816cad5bdbe33bd4d1ddce1eb81f905164.png	f
1031	M4A4 | Buzz Kill	0	0.7	54	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_gs_m4a4_sector_light_large.43ec111ef558f74c49e31621d455f93ba414714e.png	t
1033	SSG 08 | Dragonfire	0	0.5	54	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ssg08_cu_ssg08_dragonfire_scope_light_large.482858c9d088454b42e53f02d927a8203c69dfc2.png	t
1035	FAMAS | Mecha Industries	0	0.5	54	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_famas_gs_famas_mecha_light_large.c26d3fccc156fe26ba3325ed73b29092b3e18093.png	f
1037	P90 | Shallow Grave	0	0.75	54	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p90_gs_p90_shallow_grave_light_large.948019f5ffb76bcc24cfede19c992ffb34e3ecaf.png	f
1039	Sawed-Off | Wasteland Princess	0	0.7	54	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sawedoff_cu_wp_sawedoff_light_large.5c3f71cb929e5d2922b25c7644d0ff1981d92fa0.png	f
1041	USP-S | Cyrex	0	0.55	54	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_usp_silencer_cu_usp_cyrex_light_large.caef5e9fa7e19c3a4fd6f135d7ae122459b348d0.png	f
1043	Dual Berettas | Royal Consorts	0	1	54	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_elite_gs_dual_berettas_golden_venice_light_large.23d73db6cf2b2a7af26414d26373171dd3be06b1.png	f
1045	M4A1-S | Flashback	0	1	54	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_silencer_cu_m4a1_flashback_light_large.5e6c2d582d33006425b61dc0e0e8c28ecda9f853.png	f
1047	G3SG1 | Stinger	0	0.7	54	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_g3sg1_gs_g3sg1_viper_yellow_light_large.5a77c59b8c295d2e10f27b8372a146e973ddfb25.png	f
1049	Nova | Gila	0	0.3	54	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_nova_am_nova_sand_light_large.0dcb0fc065477e01afda8ecbc83208551a5f2e97.png	f
1051	Glock-18 | Ironwork	0	1	54	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_glock_aq_glock_dark-fall_light_large.ac35c22bc50660c89ecfe7654ee93bb9f00bd6f4.png	f
1053	P2000 | Turf	0	1	54	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_hkp2000_gs_p2000-sport_light_large.96ad9b76130cea95ec2f1bc61ee428e6a998a398.png	f
1055	Galil AR | Black Sand	0	1	54	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_galilar_cu_galil_ar-camo_light_large.63272b54e93d40433f8ceec41efec2004d51941d.png	f
1057	MP7 | Cirrus	0	0.75	54	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp7_gs_final_pooldeadv2_light_large.30ea2c8c934b49fa0a5e2b8c50ec880c10e2f295.png	f
1059	CZ75-Auto | Polymer	0	0.5	54	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_cz75a_am_czv2_mf_light_large.e99dde293e56f61d77908b8326d2a89155389783.png	f
1061	MAG-7 | Sonar	0	0.45	54	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mag7_am_mag7_malform_light_large.8a87c99550a4f609e7357bb4f63facf86279afca.png	f
1063	MP9 | Sand Scale	0	0.45	54	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp9_aa_hide-mp9_light_large.77be0c0ed8276383c6a2d42842df3108bbdd173b.png	f
1065	AK-47 | Neon Rider	0	0.8	55	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ak47_cu_ak_neon_rider_light_large.9209192b514c4ec98146b4747dec8ce407a977c8.png	t
1067	Desert Eagle | Code Red	0	1	55	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_deagle_gs_deagle_aggressor_light_large.51ffb87f03ae0d3c467d4412f3c246067748e61d.png	t
1069	M4A1-S | Nightmare	0	1	55	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_silencer_cu_m4a1s_nightmare_light_large.68e892eb4dedad809205a5fd06f175297d1be1cb.png	f
1071	FAMAS | Eye of Athena	0	0.7	55	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_famas_cu_famas_owl_orange_light_large.7cb3a86d36317530964f40d66b755789de7ca88a.png	f
1073	Sawed-Off | Devourer	0	0.8	55	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sawedoff_cu_sawedoff_devourer_light_large.d8365e13320f20eb532a2d5109e1fc35562bc376.png	f
1075	AWP | PAW	0	0.5	55	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_awp_am_awp_pawpaw_light_large.0ff115c31307cc3122536c44a9aef7e64277dc19.png	f
1077	Nova | Toy Soldier	0	1	55	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_nova_cu_nova_toy_soldier_light_large.e35320d18405b77fb9dd5e495fe4f625b8ab6c82.png	f
1079	CZ75-Auto | Eco	0	1	55	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_cz75a_cu_cz75_eco_light_large.19aa7b914ac71968e73ac48b112b9f4c8116c767.png	f
1081	MP7 | Powercore	0	0.8	55	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp7_gs_powercore_mp7_light_large.cff12134204aef1ddc67e142088a2b7cec911960.png	f
1083	G3SG1 | High Seas	0	0.7	55	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_g3sg1_gs_g3sg1_buccaneer_light_large.68c69e9856fd43f17a4165d1f27116496657fd00.png	f
1085	P90 | Traction	0	1	55	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p90_gs_p90_tread_light_large.0acb87de3db60e1c07aa159fd5b8238b11bb8f8f.png	f
1087	Tec-9 | Snek-9	0	1	55	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_tec9_cu_tec9_snake_light_large.9065015e55daa4190b97a8bc033925ed0aeb1abd.png	f
1089	Glock-18 | Warhawk	0	1	55	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_glock_gs_glock_thunder_dust_light_large.0e26afdd95bac17ce01c6e097ca0b97db3cffee4.png	f
1091	MP9 | Capillary	0	0.7	55	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp9_cu_mp9_vein_light_large.d0189b21fba4603ff88d407d6af0e63093f22ba7.png	f
1093	AUG | Amber Slipstream	0	0.55	55	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_aug_hy_aug_torn_orange_light_large.53b51a022d38ea39eff5ffbed92551dc741e17c3.png	f
1095	Dual Berettas | Shred	0	0.5	55	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_elite_sp_elites_winter_raider_light_large.eddc2e91d0081e57588b745589209094a6b3e9b6.png	f
1097	R8 Revolver | Survivalist	0	0.7	55	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_revolver_cu_r8_survivalist_light_large.cda482f11a63c89c574211b8d5ea9a60703e3cd2.png	f
1099	AK-47 | Vulcan	0	0.9	56	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ak47_cu_ak47_rubber_light_large.5836c38d3037a5a1f90ffdc8c9d0b94367ca8efd.png	t
1101	M4A4 | Desert-Strike	0	0.7	56	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_cu_titanstorm_light_large.a161ff6ea23af2d9bbdc0a757f5163fa1ad87a30.png	t
1103	M4A1-S | Atomic Alloy	0	0.9	56	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_silencer_am_m4a1-s_alloy_orange_light_large.82bd272d0256f17eb86029a8d1411c4e5bf2bc9c.png	f
1105	SCAR-20 | Cyrex	0	0.5	56	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_scar20_cu_scar_cyrex_light_large.ee4da13e2d74d0fd1fdbaa8f2ca49eb1c7f0acca.png	f
1107	USP-S | Caiman	0	0.4	56	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_usp_silencer_cu_kaiman_light_large.8ed168478e306bd382a90afb1b71ad9f7551b342.png	f
1109	USP-S | Orion	0	0.5	56	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_usp_silencer_cu_usp_spitfire_light_large.883b877a8a57c9dd1128f2550ddd694d959f3150.png	f
1111	XM1014 | Heaven Guard	0.03	0.5	56	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_xm1014_cu_xm1014_heaven_guard_light_large.c7f3f8815f9caa92daa5ffe4390880c1606f4a81.png	f
1113	AUG | Torque	0	0.5	56	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_aug_cu_aug_progressiv_light_large.f712baf9253bd357c71a1525dac51e30298c9535.png	f
1115	MAC-10 | Tatter	0	0.5	56	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mac10_cu_korupt_light_large.e1efdcab099278a147fe2f07405214218e74e705.png	f
1117	PP-Bizon | Antique	0	0.5	56	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_bizon_cu_bizon_antique_light_large.06467175511976dae4219e9cb2fc8ab20df0e653.png	f
1119	MAC-10 | Curse	0	0.5	56	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mac10_cu_mac10_decay_light_large.eaddf6ddfa5975248fc134ccfc523ab11bf97070.png	f
1121	CZ75-Auto | Poison Dart	0	0.7	56	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_cz75a_am_nitrogen_light_large.ea1d17f7e0ba9fa71126a46b3ba99bf258dffe25.png	f
1123	Tec-9 | Isaac	0	1	56	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_tec9_cu_tec9_asiimov_light_large.9a4fb9bbf6f01209b8fd3effeda1eecfc1e5a9a3.png	f
1125	P90 | Desert Warfare	0	0.5	56	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p90_cu_p90_scorpius_light_large.8f1bc2f6afc4e7f9ffb7a451252461f5a1df07ad.png	f
1127	Dual Berettas | Retribution	0	0.45	56	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_elite_cu_retribution_light_large.8527b45e34039b45dea9d304bb5892a1d0de5268.png	f
1129	Galil AR | Kami	0	0.6	56	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_galilar_hy_galil_kami_light_large.f1783721b5318ea51bcb7890bf9cd0084afcd3e3.png	f
1131	CZ75-Auto | Twist	0	1	56	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_cz75a_am_gyrate_light_large.90f97369a79695a7fdcb633a9c9a9e56f29a05d5.png	f
1133	P90 | Module	0	0.35	56	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p90_an_royalbleed_light_large.58dfb4851908d78c31e205477793a620923737db.png	f
1135	P2000 | Pulse	0	0.6	56	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_hkp2000_cu_p2000_pulse_light_large.a79fcfcd59202495573abfddc1e7627be62b4e1c.png	f
1137	SSG 08 | Slashed	0.15	0.8	56	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ssg08_cu_ssg08_immortal_light_large.294156dbab19f645942fe9cbafed88165aa70044.png	f
1139	AK-47 | Inheritance	0	0.8	57	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ak47_gs_ak47_professional_light_large.d09d623d0a725c63e8a3905f66bba41ba2ed59e8.png	t
1141	AWP | Chrome Cannon	0	1	57	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_awp_cu_awp_chroma_pink_light_large.afc69cbf51b04e24149744b6ee1d998cc18d3002.png	t
1143	M4A1-S | Black Lotus	0	0.7	57	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_usp_silencer_cu_usp_black_lotus_light_large.d40de54b67e255871a2a31a15e871e8d185049ea.png	f
1145	USP-S | Jawbreaker	0	1	57	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_usp_silencer_cu_usp_printstream_light_large.9f5bcd4f94db3d965b3b2e7c3aace470e9466380.png	f
1147	Zeus x27 | Olympus	0	0.67	57	classified_bg	t	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpooru2LhVfyfbdYgJW5Mm4kIWZqPD7N4Tdn2xZ_It12-iSp4r00AGw-xFtZ	f
1149	M4A4 | Etch Lord	0	1	57	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_cu_m4a1_howling_light_large.c64a9fc9fa04b5d10d4b1e200135e59285c8a77c.png	f
1151	MP7 | Just Smile	0	1	57	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp7_gs_mp7_bloodsport_light_large.ab5c304901ceb320482742b041815e7b5e3ccb95.png	f
1153	Glock-18 | Block-18	0	0.67	57	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_glock_cu_glock_wasteland_rebel_light_large.284899ab35e5a29c6edb64b2af194cee19a0ed89.png	f
1155	Five-SeveN | Hybrid	0	1	57	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_fiveseven_cu_five_seven_angry_light_large.54986e86178e0462d34fe78b6b726292813541f5.png	f
1157	Sawed-Off | Analog Input	0	0.62	57	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sawedoff_cu_sawedoff_octopump_light_large.761df5911efc6a96061c7b34e41a2ff6ec61e58b.png	f
1159	MAC-10 | Light Box	0	1	57	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mac10_cu_mac10_toybox_light_large.0eaa520b37c7d53ed3ef541e59d2303714c7e21d.png	f
1161	SSG 08 | Dezastre	0	1	57	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_elite_gs_dual_elites_dezastre_light_large.9b7aa9accd1e31a202b0f2ab66d0cf8d3039ee7d.png	f
1163	Tec-9 | Slag	0	0.9	57	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_tec9_gs_tec9_decimator_light_large.11236163667e1dd46c3d869d844e384a23544513.png	f
1165	UMP-45 | Motorized	0	0.8	57	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp7_gs_mp7_bloodsport_light_large.ab5c304901ceb320482742b041815e7b5e3ccb95.png	f
1167	XM1014 | Irezumi	0	0.8	57	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_xm1014_aq_xm1014_punk_light_large.8c6eb5bcf234179713a52b1a5e22c64c21c52007.png	f
1169	Dual Berettas | Hideout	0	0.7	57	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_elite_cu_elites_beware_light_large.3a4517010e237136f9cca5c593beedd94a2a0a15.png	f
1171	Nova | Dark Sigil	0	0.7	57	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_nova_cu_nova_hyperbeast_light_large.ec64e1aa22dc78fa692a2269a99669842b91cc6f.png	f
1173	AK-47 | Fire Serpent	0.06	0.76	58	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ak47_cu_fireserpent_ak47_bravo_light_large.9390e7fd091ea8a0434fd2143e0acf0d5d1bbc97.png	t
1175	Desert Eagle | Golden Koi	0	0.12	58	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_deagle_am_scales_bravo_light_large.6cba46695e74a8bee932ea90cea24e146cbef5e7.png	t
1177	P90 | Emerald Dragon	0.06	0.52	58	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p90_cu_dragon_p90_bravo_light_large.200ef513ae29ae7651ad3f31e68b5b186279572f.png	f
1179	AWP | Graphite	0	0.12	58	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_awp_am_crumple_bravo_light_large.5f59de227d280f3c3b39fae7e49ac143338ca5b2.png	f
1181	P2000 | Ocean Foam	0	0.12	58	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_hkp2000_am_ossify_blue_p2000_bravo_light_large.91f225635f7e4a986b51e09bba106ca6a4bf7dbb.png	f
1183	USP-S | Overgrowth	0.06	0.8	58	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_usp_silencer_hy_siege_bravo_light_large.517b89e78bfe8bad7ca1aab7edf1d02a56b2da26.png	f
1185	M4A4 | Zirka	0.06	0.42000000000000004	58	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_sp_star_bravo_light_large.d4a56abe885a1a03ea173a6aaeb4f10bcec6a0c2.png	f
1187	MAC-10 | Graven	0.06	0.8	58	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mac10_aq_etched_mac10_bravo_light_large.ec4cf2f7748ac5318292630c8c7e3c2d016723e3.png	f
1189	M4A1-S | Bright Water	0.1	0.22000000000000003	58	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_silencer_hy_ocean_bravo_light_large.7a942449926153575269af174733edc7bed5faeb.png	f
1191	Dual Berettas | Black Limba	0.06	0.8	58	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_elite_cu_season_elites_bravo_light_large.03b5f4afcbffb80f73ce009da240f4aa1455c15f.png	f
1193	Galil AR | Shattered	0.06	0.8	58	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_galilar_hy_crumple_bravo_light_large.fcf25827c0ef88bac7e5b0567ecd5a7dbee01791.png	f
1195	Nova | Tempest	0.06	0.22000000000000003	58	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_scar20_gs_scar20_bloodsport_light_large.dd99feccb31d2ec296bcd620abd885e6fe50d44e.png	f
1197	UMP-45 | Bone Pile	0.06	0.34	58	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ump45_sp_skull_diagram_bravo_light_large.f3bf563f6e0274f55377e4fe0422905586a3d19b.png	f
1199	SG 553 | Wave Spray	0.06	0.8	58	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sg556_sp_spray_waves_bravo_light_large.5d4e0e3977bf9f1fa8dd1576b5576b429546f98d.png	f
1201	G3SG1 | Demeter	0.06	0.8	58	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_g3sg1_hy_bluepolygon_bravo_light_large.6638623a4979512bb048fa22f9ec06a5c1172c7e.png	f
1203	M4A1-S | Cyrex	0	0.5	59	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_silencer_cu_m4a1s_cyrex_light_large.144b4053eb73b4a47f8128ebb0e808d8e28f5b9c.png	t
1205	P90 | Asiimov	0	0.9200000000000002	59	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_awp_cu_awp_asimov_light_large.32d9045f8a2bcd13ca18390cc9fd82026e7195ab.png	t
1207	Glock-18 | Water Elemental	0	0.7	59	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_glock_cu_glock-liquescent_light_large.151e954ed4aef28ccc55d0ca4b43a7d9644f36ac.png	f
1209	Five-SeveN | Fowl Play	0	1	59	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_fiveseven_aq_57_feathers_light_large.aa942f28d5fd868643b54ba0c317703d8b615754.png	f
1211	Desert Eagle | Conspiracy	0	0.3	59	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_deagle_cu_deagle_aureus_light_large.7fa76057cb05f2cab829be448f120ae540715d0e.png	f
1213	CZ75-Auto | Tigris	0	1	59	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_cz75a_cu_c75a-tiger_light_large.b754b5a73c8f2b207942eb046efdbd4cade04513.png	f
1215	PP-Bizon | Osiris	0	0.5	59	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_bizon_cu_bizon-osiris_light_large.269e03e1ad598b76adb884704c4f48d725beb5fc.png	f
1217	Nova | Koi	0	0.3	59	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_nova_cu_nova_koi_light_large.28c3fe03f736b48dee10e1e88e77ac02132dcba6.png	f
1219	P250 | Supernova	0	0.4	59	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p250_cu_bittersweet_light_large.83cd48968d79412e0cf2233b8e18602ff2790ad4.png	f
1221	SSG 08 | Abyss	0	1	59	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ssg08_aq_leviathan_light_large.0d0ce425b5374642d0d1fbfd0c0ec634eb8570fb.png	f
1223	P2000 | Ivory	0	1	59	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_hkp2000_cu_p2000_ivory_light_large.2a47b14b59ce796956958ce13cb60617148f7711.png	f
1225	UMP-45 | Labyrinth	0	0.4	59	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ump45_hy_lines_orange_light_large.d004ea389236e6fa5da2f0555ab5b3723bdf36d1.png	f
1227	MP7 | Urban Hazard	0	0.5	59	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp7_cu_mp7-commander_light_large.260d3f2765c83f75eadac5abd6ef4187ea2c2089.png	f
1229	Negev | Desert-Strike	0	0.5	59	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_negev_cu_negev_titanstorm_light_large.eb7badc75ecbb1b4cdf35bfb53088731bbe11cb0.png	f
1231	M4A1-S | Printstream	0	0.8	60	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_silencer_cu_m4a1s_printstream_light_large.99e340c2eed00b54eef5320fd63e009fcede6cae.png	t
1233	Glock-18 | Neo-Noir	0	1	60	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_glock_cu_glock_noir_light_large.c93d0cbfa767d1f822a53ebfca0d57f532088c48.png	t
1235	Five-SeveN | Fairy Tale	0.02	0.9	60	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_fiveseven_cu_five_seven_diary_light_large.e09a26df236581e02db30cdbb9c55adb2a4d2292.png	f
1237	M4A4 | Cyber Security	0	0.9800000000000001	60	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_cu_m4a4_cyberpunk_light_large.8ed70290de88498fcfdc0c89f23ba2ad60bd13a5.png	f
1239	USP-S | Monster Mashup	0	0.7	60	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_usp_silencer_cu_usp_krokos_light_large.ef94a997db4a990e55bc44d4b07b25f0f420e59e.png	f
1241	AWP | Exoskeleton	0	1	60	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_awp_gs_awp_exoskeleton_light_large.7b7a8af63a8c06beacea7494a41adcda5d5afdd8.png	f
1243	Dual Berettas | Dezastre	0	1	60	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_elite_gs_dual_elites_dezastre_light_large.9b7aa9accd1e31a202b0f2ab66d0cf8d3039ee7d.png	f
1245	UMP-45 | Gold Bismuth	0	0.7	60	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ump45_gs_ump_gold_bismuth_light_large.c09fa5b0617d1c486737c9beb39f79bec31621dc.png	f
1247	SSG 08 | Parallax	0	1	60	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ssg08_cu_ssg08_chromatic_light_large.66f506ebe947b68afa1d3a6cbbdd8916b054f84a.png	f
1249	Nova | Clear Polymer	0	1	60	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_nova_cu_nova_polymer_light_large.a45b7ef66f8e62eecf26687892e5c4a76966d7f6.png	f
1251	Galil AR | Vandal	0	1	60	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_galilar_gs_galil_vandal_light_large.5144c3d7d0d1789bc5a25d3a62f15ccd876c9855.png	f
1253	MP5-SD | Condition Zero	0	1	60	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp5sd_gs_mp5_conditionzero_light_large.4ed0ebd4f909faf2e09b5e18ec08e0a093719f63.png	f
1255	G3SG1 | Digital Mesh	0	0.8	60	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_g3sg1_gs_g3sg1_disrupt_light_large.393db5c1a143ad7fc9e3c42a7d17ca860ce490ab.png	f
1257	P250 | Contaminant	0	0.7	60	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p250_cu_p250_infect_light_large.235d9f1d0efc7fe74748085ecd87540a03a4551d.png	f
1259	CZ75-Auto | Vendetta	0	1	60	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_cz75a_gs_cz75_vendetta_light_large.0c3e295e82d8131b10e8daa2a1568e578fe01541.png	f
1261	M249 | Deep Relief	0	1	60	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m249_cu_m249_deep_relief_light_large.227a01518f45cbb6a43981e36b76f60785f9085b.png	f
1263	P90 | Cocoa Rampage	0	0.6	60	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p90_hy_p90_dino_rampage_light_large.2231742f05375d3370f5f8fbc7fd3f3f623af688.png	f
1265	AWP | Oni Taiji	0	0.5	61	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_awp_cu_awp_hannya_light_large.dc87e0f1aeeabe6c1c840f2a9e756ea261ef9d81.png	t
1267	Five-SeveN | Hyper Beast	0	1	61	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_fiveseven_cu_fiveseven_hyperbeast_light_large.d2ef18b57b0b821624e42830ee4c47e241ed4476.png	t
1269	M4A4 | Hellfire	0	0.5	61	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_cu_m4a4_hellfire_light_large.d3675840da1d60e19ba26fc11539e9351a0ec892.png	f
1271	Galil AR | Sugar Rush	0	0.55	61	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_galilar_cu_galil_candychaos_light_large.70c1dba6c2de996ec666a260b604c760e01bb20d.png	f
1273	Dual Berettas | Cobra Strike	0	0.6	61	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_elite_gs_dualberettas_cobra_light_large.0c2576234d95cb12089d9fdad47d1f7eed7f56c8.png	f
1275	AK-47 | Orbit Mk01	0	0.55	61	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ak47_gs_ak_colony01_red_light_large.b688da7615b6e76fa34f775e200914dc44d5336c.png	f
1277	P90 | Death Grip	0	1	61	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p90_hy_p90_barebones_blue_light_large.c908d6fc6d53cb2f4168a64b9a32e4b6b5479fc8.png	f
1279	P2000 | Woodsman	0	0.8	61	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_hkp2000_cu_p2000_hunter_light_large.57f4ea5be4f9bece6a3b71521a370d9afb4abb1f.png	f
1281	P250 | Red Rock	0	1	61	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p250_cu_p250_axiom_light_large.a9b34e0a93dbaa8fa60dfdb080827b919938d9f6.png	f
1283	SSG 08 | Death's Head	0	0.51	61	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ssg08_cu_ssg08_deathshead_light_large.78676bc5fce74af519abdccae4d119727c392faf.png	f
1285	USP-S | Blueprint	0	0.86	61	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_usp_silencer_cu_usps_blueprint_light_large.e4195098bb3a105e6545d32c4d72888f673bd761.png	f
1287	M4A1-S | Briefing	0	0.8	61	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_silencer_cu_m4a1s_metritera_light_large.ec9c5f86d6788402519be7bd51b849355fbf93ee.png	f
1289	Tec-9 | Cut Out	0	1	61	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_tec9_aq_tec9_chalk_pattern_light_large.e0425d0a56ca5a2240b71495a5ef2bc4af0e9331.png	f
1291	MAC-10 | Aloha	0	0.65	61	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mac10_am_mac10_aloha_light_large.bde81a20851cfd9f788d66745f69a288e57ea319.png	f
1293	FAMAS | Macabre	0	0.6	61	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_famas_sp_famas_macabre_light_large.7582150e24a69922b814d6b56004327e2219890d.png	f
1295	MAG-7 | Hard Water	0	0.45	61	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mag7_am_mag7_caustic_light_large.133bbfa9f3cf8220f8eb5556d4d54a766cf1c9e0.png	f
1297	UMP-45 | Metal Flowers	0	0.7	61	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ump45_aq_ump45_flameflower_light_large.9c5aedb21ad6461f0761375c53b50f030fa0e10c.png	f
1299	AWP | Asiimov	0.18	1	62	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_awp_cu_awp_asimov_light_large.32d9045f8a2bcd13ca18390cc9fd82026e7195ab.png	t
1301	AUG | Chameleon	0	0.5	62	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_aug_cu_aug_chameleonaire_light_large.ad1d2f62d1481931d8e23e0ab0fbd4e7a61135f7.png	t
1303	AK-47 | Redline	0.1	0.7	62	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ak47_cu_ak47_cobra_light_large.7494bfdf4855fd4e6a2dbd983ed0a243c80ef830.png	f
1305	Nova | Antique	0	0.3	62	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_nova_cu_nova_antique_light_large.3391e20bf69d1a630ab0551fd0c2fa196d028e44.png	f
1307	P90 | Trigon	0.08	0.75	62	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p90_cu_p90_trigon_light_large.9f93f859fe1d03dfced62e52c4cab39ae2f8a9f3.png	f
1309	MAC-10 | Heat	0	1	62	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mac10_cu_mac10_redhot_light_large.d5e1e0b433e3340266635970ca45cbbf810216f2.png	f
1311	USP-S | Guardian	0	0.38	62	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_usp_silencer_cu_usp_elegant_light_large.416f607cc5faeb52be0f22e1b98450391f452ac2.png	f
1313	FAMAS | Sergeant	0.1	1	62	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_famas_an_famas_sgt_light_large.5a9241d41a3c35a3fbb20aebcd22253a6a85f72f.png	f
1315	SG 553 | Pulse	0.1	0.6	62	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sg556_cu_sg553_pulse_light_large.d564900d05df0ee1da737cde6144eb55fa36684f.png	f
1317	Tec-9 | Sandstorm	0.1	0.7	62	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_tec9_cu_tec9_sandstorm_light_large.e38b0daacb3aa5d8f692a5ee05ad4bc0885808cd.png	f
1319	UMP-45 | Corporal	0.05	0.75	62	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ump45_cu_ump_corporal_light_large.ae233b4fabc9ff5fef6d25a87175ce5ad8f2ee6e.png	f
1321	Negev | Terrain	0	0.45	62	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_negev_sp_negev_turq_terrain_light_large.9c6c678b0e6bc949c0688f3e1cf39ca73e0a44ae.png	f
1323	MAG-7 | Heaven Guard	0	0.4	62	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mag7_cu_mag7_heaven_light_large.ea002eaa1f984e278f59a934ca9016f038d06120.png	f
1325	Desert Eagle | Ocean Drive	0	1	63	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_deagle_cu_deagle_kitch_light_large.0df9b5246d27786b413642f5fc959f37d8892c3a.png	t
1327	AK-47 | Leet Museo	0	0.65	63	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ak47_gs_ak47_abstract_light_large.c0eca2ab0cee2c60491b9b64358f72ae4398e78a.png	t
1329	Glock-18 | Snack Attack	0	1	63	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_glock_cu_glock_snackattack_light_large.145d863714fb0fd6f766ef28f3639c0efded5018.png	f
1331	MAC-10 | Toybox	0	1	63	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mac10_cu_mac10_toybox_light_large.0eaa520b37c7d53ed3ef541e59d2303714c7e21d.png	f
1333	SSG 08 | Turbo Peek	0	0.6	63	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ssg08_cu_ssg_overtake_light_large.62261051818eb21f13e782cd49a33970360b4581.png	f
1335	M4A4 | Spider Lily	0	1	63	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_gs_m4_flowers_light_large.9953864326ad495e32b855ac45d96367b149be90.png	f
1337	MP9 | Mount Fuji	0	0.55	63	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp9_aa_mp9_fuji_pink_light_large.5c7bf05ff05d82c34b6d71a3aa97537e55cec97e.png	f
1339	FAMAS | ZX Spectron	0	1	63	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_famas_cu_famas_spectron_light_large.5212ab188ec7d54b55d4280c3b508b11b1f567ed.png	f
1341	Five-SeveN | Boost Protocol	0	0.41	63	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_fiveseven_gs_five_seven_efusion_light_large.78c44b69ab40456b90279ad0252463e9de816e78.png	f
1343	MAG-7 | BI83 Spectrum	0	0.6	63	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mag7_gs_mag7_bismuth_light_large.f5df59b5024b23a1ca187985b7650e337adda4b4.png	f
1345	USP-S | Black Lotus	0	0.9	63	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_usp_silencer_cu_usp_black_lotus_light_large.d40de54b67e255871a2a31a15e871e8d185049ea.png	f
1347	XM1014 | Watchdog	0	1	63	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_xm1014_gs_xm1014_watchdog_light_large.5443196414c00a57b26d9af50d4a75a35dd8dbd8.png	f
1349	Dual Berettas | Tread	0	1	63	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_elite_gs_dual_berettas_tread_light_large.c48f5d783dd8f91dabffcd64cd2d95690b309ce5.png	f
1351	PP-Bizon | Lumen	0	0.77	63	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_bizon_gs_bizon_flasher_light_large.a200d5213d5fe9f2e74b5ca5b9ce8eeb7eee4d5f.png	f
1353	AUG | Plague	0	0.76	63	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_aug_gs_aug_plague_light_large.d7c01b0e4e2bc1e890cf3965874fad8a1bb27a17.png	f
1355	G3SG1 | Keeping Tabs	0	0.7	63	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_g3sg1_cu_g3sg1_tacticalmap_light_large.c1340d04161c17f48cf0091a52f649c1e9bd8d41.png	f
1357	MP7 | Guerrilla	0	1	63	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp7_cu_mp7_khaki_light_large.c9fb92fece0f425328e2c5c8c536302ed2dbcf99.png	f
1359	AK-47 | Wasteland Rebel	0.05	0.7	64	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ak47_cu_tribute_ak47_light_large.f0ccfeea8a432a82cf4fb7f0411a724dbb43459a.png	t
1361	P2000 | Fire Elemental	0	0.6	64	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_hkp2000_cu_p2000_fire_elemental_light_large.1e57d4d9f1c51e613c1923377aa55fab4b0ab1bc.png	t
1363	XM1014 | Tranquility	0	0.5	64	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_xm1014_cu_xm1014_caritas_light_large.060e6378f5b5ab6fc53a2db451f3d68b8033f304.png	f
1365	P250 | Cartel	0	0.75	64	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p250_aq_p250_cartel_light_large.d63ea117934ac8f9a40afe027fa4a1438dbb1777.png	f
1367	SCAR-20 | Cardiac	0	1	64	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_scar20_cu_scar20_intervention_light_large.96d9a26cca617207208a836d424d676bcb2ce3b9.png	f
1369	M4A1-S | Basilisk	0	0.68	64	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_silencer_aq_m4a1s_basilisk_light_large.18370d6557500376e137c7f6b07c7ed46c9dccf2.png	f
1371	M4A4 | Griffin	0	0.8	64	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_cu_m4a4_griffin_light_large.255bd83fd343ea8e8d84a1d5c94959d0b26cafae.png	f
1373	Sawed-Off | Highwayman	0	1	64	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sawedoff_aq_sawedoff_blackgold_light_large.4a8c3a27c780c2a5ec3e4b6686498dce439d5a73.png	f
1375	Glock-18 | Grinder	0.02	0.25	64	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_glock_aq_glock_coiled_light_large.d4dcbf0d27479b95a4ad43c36f3b3f3dc87bbd84.png	f
1377	MAG-7 | Firestarter	0.06	0.49000000000000005	64	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mag7_sp_mag7_firebitten_light_large.640af2edb52a7f170620e175ddaa5f5cf763325b.png	f
1379	UMP-45 | Delusion	0.06	0.35	64	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ump45_sp_ump45_d-visions_light_large.33ae7e9e8bf24ee97f4f3d3ee113e51782a756fa.png	f
1381	Five-SeveN | Urban Hazard	0	0.25	64	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_fiveseven_cu_fiveseven_urban_hazard_light_large.456966d23faf1034c51b8130b7a70294af087026.png	f
1383	MP9 | Dart	0	0.4600000000000001	64	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp9_cu_mp9_chevron_light_large.698ab583537e3ed4b7661d3fcf75be62f0cdfab9.png	f
1385	G3SG1 | Murky	0	0.25	64	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_g3sg1_am_g3sg1_murky_light_large.bc4e8d0e70d2952576d5c9653da71f21bc02b810.png	f
1387	AK-47 | Fuel Injector	0	1	65	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ak47_gs_ak47_supercharged_light_large.8a0d53e84b7049366a3e3dbb25d29f473d76dceb.png	t
1389	M4A4 | The Battlestar	0	0.64	65	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_gs_m4a4_pioneer_light_large.2dcc4c93ad184179e34b9359090d7398718d36e4.png	t
1391	Desert Eagle | Kumicho Dragon	0	0.76	65	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_deagle_aq_deserteagle_kumichodragon_light_large.19874e9a20cfac49efbe1f1557b995e453633ffe.png	f
1393	AWP | Elite Build	0	1	65	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p90_cu_p90_mastery_light_large.f58ff489c92ffa8c6e4c42814bad01c352df0ab6.png	f
1395	Nova | Hyper Beast	0	0.6	65	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_nova_cu_nova_hyperbeast_light_large.ec64e1aa22dc78fa692a2269a99669842b91cc6f.png	f
1397	Glock-18 | Royal Legion	0	1	65	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_glock_gs_glock18_award_light_large.198c0dc5630970b1f3bbcb307a1318745ca006e7.png	f
1399	FAMAS | Valence	0	0.8	65	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_famas_aq_famas_contour_light_large.65d515ab34a6f50c8a5296b562a81da42663b819.png	f
1401	Five-SeveN | Triumvirate	0	0.61	65	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_fiveseven_cu_fiveseven_augmented_light_large.eb79857bc2e4b80f4edf61a0c5a72fbae80f3a20.png	f
1403	MAG-7 | Praetorian	0	0.45	65	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mag7_gs_mag7_praetorian_light_large.55d96fbd30315911a2397ef950887e8fda43a3ec.png	f
1405	MP7 | Impire	0	0.4	65	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp7_sp_mp7_impire_light_large.aee431bcc2114fbc9f5cf46ca9735c86ddb450ba.png	f
1407	USP-S | Lead Conduit	0	1	65	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_usp_silencer_gs_usp_voltage_light_large.11e40b4d4fc09043d4fa513f3913ca65ffcfbb41.png	f
1409	Dual Berettas | Cartel	0	1	65	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_elite_aq_dualberettas_cartel_light_large.52ed24116db8a7254a366ea9f4f49b3ceff9eed3.png	f
1411	PP-Bizon | Photic Zone	0	1	65	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_bizon_cu_bizon_citizen_light_large.c33a99fe761fc52535224e73d2af91b92ac77637.png	f
1413	Tec-9 | Jambiya	0	1	65	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_tec9_gs_tec9_jambiya_light_large.d1f42521bb774564f80a512c3990e768179cf111.png	f
1415	SSG 08 | Necropos	0	1	65	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ssg08_cu_ssg08_necropos_light_large.cd2f32aa0349edcad3aefae80b509fc5962a2b30.png	f
1417	MAC-10 | Lapis Gator	0	0.5	65	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mac10_am_mac10_electricity_light_large.88207515fce5ebad84df16d60ff2203a5d4a2702.png	f
1419	M4A1-S | Player Two	0	0.8400000000000001	66	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_silencer_cu_m4a1s_csgo2048_light_large.6531225ca224416df4dc6aa12c6ecea582b1e110.png	t
1421	Glock-18 | Bullet Queen	0	1	66	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_glock_cu_glock18_warmaiden_light_large.d99a6fdb4c1469d164182a74edba8de055726aa5.png	t
1423	MAC-10 | Disco Tech	0	1	66	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mac10_cu_mac10_nacre_light_large.80fa2f0691e37e6e2a2755b8a7f6ccd6bfa83f3b.png	f
1425	AK-47 | Phantom Disruptor	0	0.65	66	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ak47_cu_ak-47_phantom_disruptor_light_large.c14fcebe17a4c1a509edc597b33dcb9b5dcda32b.png	f
1427	MAG-7 | Justice	0	1	66	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mag7_gs_mag7_justice_light_large.fcdc73ab779ab093ee7d90d91c1e3c369bbc8d65.png	f
1429	SSG 08 | Fever Dream	0	0.72	66	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ssg08_cu_ssg08_fever_dream_light_large.cec554a86204344d6476b9071158fd02963a1aac.png	f
1431	P2000 | Acid Etched	0	1	66	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_hkp2000_aq_p2000_acid_clover_light_large.9b6c7f2c0bd30dc66570c41101129e1a624ab7b8.png	f
1433	SG 553 | Darkwing	0	1	66	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sg556_cu_sg553_darkwing_light_large.f9c302279afebdd221344fa59f738f9317dc4122.png	f
1435	SCAR-20 | Enforcer	0	1	66	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_scar20_gs_scar20_enforcer_light_large.20eba3a5a84f35019ceb7faae45a0b4246a72998.png	f
1437	Sawed-Off | Apocalypto	0	1	66	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sawedoff_cu_sawedoff_apocalypto_light_large.fc0f69fec04cf4d6955ef4aa6629d083aa554af6.png	f
1439	AWP | Capillary	0.05	0.7	66	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_awp_cu_awp_vein_light_large.8665dc4b4231298e9bbcab7aad3abbbf22e3edd8.png	f
1441	Desert Eagle | Blue Ply	0	1	66	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_deagle_cu_deagle_replica_light_large.900a30787dd7f4f32435cc55e56dc345d780baae.png	f
1443	CZ75-Auto | Distressed	0	1	66	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_cz75a_cu_cz75_cerakote_light_large.2f8286a9ca2313c23c6d9ad8d1c94650ef856c37.png	f
1445	MP5-SD | Desert Strike	0	1	66	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp5sd_cu_mp5_desert_strike_light_large.44958e2a47446043d6c929d5f4b4e3bea10f41c9.png	f
1447	Negev | Prototype	0	0.7	66	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_negev_cu_negev_prototype_light_large.d1e542d85756bfc96bb32e6d2f8b548fbb26b2ad.png	f
1449	R8 Revolver | Bone Forged	0	0.6	66	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_revolver_gs_r8_leviathan_light_large.656b77eecd4ef8f55f11866cce3da2778d6cc7d5.png	f
1451	AUG | Tom Cat	0	0.8	66	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_aug_gs_aug_thunderstorm_light_large.127ba1a9f7c7eef6b701bf01ad50b3b146f9b951.png	f
1453	M4A4 | The Emperor	0	0.8	67	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_gs_m4a4_emperor_light_large.61be48559b0a5d57e04108f876f5cf755ec8acc8.png	t
1455	Five-SeveN | Angry Mob	0	0.7	67	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_fiveseven_cu_five_seven_angry_light_large.54986e86178e0462d34fe78b6b726292813541f5.png	t
1457	AUG | Momentum	0.05	1	67	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_aug_cu_aug_momentum_light_large.1f36037cec707a957785625f04b3740bb5286d16.png	f
1459	XM1014 | Incinegator	0.14	0.65	67	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_xm1014_cu_xm1014_incinerator_light_large.7649f64bbfea49d6f0d951320e0bdd98d6bee088.png	f
1461	R8 Revolver | Skull Crusher	0.25	0.8	67	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_revolver_cu_revolver_oppressor_light_large.59414a184bcf3310d43528701292ba4f68ba55a0.png	f
1463	AWP | Atheris	0	1	67	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_awp_cu_awp_viper_light_large.2de75408a7c595312d58203f53c73a3a18faa4a3.png	f
1465	Desert Eagle | Light Rail	0	0.9	67	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_deagle_gs_deagle_exo_light_large.8bdc93f1b45efba187748065deff967eef8f2f2d.png	f
1467	Tec-9 | Bamboozle	0	0.8	67	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_tec9_cu_tec9_bamboo_light_large.24d8986c41f344d8c1e9167a935c7b904757f85e.png	f
1469	MP5-SD | Gauss	0	1	67	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp5sd_gs_mp5sd_astromatic_light_large.d7acba118f13e4b7b0d9146dddd32cf71da9210d.png	f
1471	UMP-45 | Moonrise	0	0.4	67	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ump45_aa_ump45_moonrise_sunset_light_large.63cf279a66d95757f4fefe498b89480966887083.png	f
1473	AK-47 | Uncharted	0	0.75	67	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ak47_cu_ak47_aztec_light_large.368d90ba7bc01aa56489792a8962df5343238c5c.png	f
1475	MAC-10 | Whitefish	0	1	67	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mac10_gs_mac10_fish_bait_light_large.31a855282029b915748b21c11521b5f111b05e67.png	f
1477	Galil AR | Akoben	0	0.75	67	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_galilar_sp_galil_akoben_light_large.35a9e7a0fa943ac20d1b145d36bf3d4ccf33cc84.png	f
1479	P250 | Verdigris	0	0.7	67	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p250_aq_p250_verdigris_light_large.379d19af038211ca3bf7d20c4c75726e9be36856.png	f
1481	P90 | Off World	0	0.75	67	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p90_cu_p90_offworld_light_large.45f1db5b8b435574f46fffe77960d8ef29519eca.png	f
1483	FAMAS | Crypsis	0	0.55	67	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_famas_sp_famas_ghost_insects_light_large.727c7db3f6df4aae8b692f6966dba460acafb07f.png	f
1485	MP7 | Mischief	0.1	1	67	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp7_cu_mp7_racketeer_light_large.ba5b3641b7b309cdd16d9f54fc2bc2331e738929.png	f
1487	USP-S | Printstream	0	0.85	68	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_usp_silencer_cu_usp_printstream_light_large.9f5bcd4f94db3d965b3b2e7c3aace470e9466380.png	t
1489	AWP | Chromatic Aberration	0	0.7	68	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_awp_cu_awp_chroma_pink_light_large.afc69cbf51b04e24149744b6ee1d998cc18d3002.png	t
1491	AK-47 | Ice Coaled	0	0.77	68	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ak47_cu_ak47_cogthings_light_large.9b4678a70c315e5d60a203436b7a95cd4c5dcc89.png	f
1493	Sawed-Off | Kiss♥Love	0	1	68	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sawedoff_cu_sawedoff_kisslove_light_large.55dc07f073e8c5ce65f21e4fb5957625db7ba266.png	f
1495	P250 | Visions	0	0.7	68	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p250_gs_p250_visions_light_large.a47ba6d191d3c734c3248667fb341a0e3f0c423e.png	f
1497	Dual Berettas | Flora Carnivora	0	1	68	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_elite_cu_dual_elites_evil_flora_light_large.3afd7e8e7cf008e4b38a206b79adae3b9d0d7757.png	f
1499	R8 Revolver | Crazy 8	0	1	68	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_revolver_gs_revolver_purple_elite_light_large.12a25ff5490bc9199a7ef870677455e42b9d8847.png	f
1501	SG 553 | Dragon Tech	0	0.7	68	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sg556_cu_sg553_cyber_dragon_light_large.563b70babc5251fe5df218140582cd0aa576701e.png	f
1503	P90 | Vent Rush	0	0.7	68	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p90_gs_p90_tangled_light_large.d1c6b11dc6876f1cf546281df8b8fac68a037518.png	f
1505	M249 | Downtown	0	0.65	68	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m249_cu_m249_downvote_light_large.9d51d5d89b1df07b160580b5b929f66f06bb8310.png	f
1507	M4A4 | Poly Mag	0	1	68	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_cu_m4a4_elite_tactical_light_large.015fd86aa32f4f0331aa1b7dc2571d89dbf38671.png	f
1509	FAMAS | Meow 36	0	1	68	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_famas_gs_famas_corp_meow_light_large.7e27ced9616b1a4808cad37e8c0c653b9c866f07.png	f
1511	Glock-18 | Winterized	0	1	68	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_glock_gs_glock_elite_camo_light_large.00d135c0b32cabd8b48692d11794c830a9a4de5c.png	f
1513	Negev | Drop Me	0	1	68	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_negev_cu_negev_clear_sky_light_large.fc6f06d0f44e71207660f44b9b56021ce42a7e46.png	f
1515	MAC-10 | Monkeyflage	0	1	68	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mac10_cu_mac10_monkeyflage_light_large.8f24ab7b33719d43a7d4e0886cb3f79d506e7068.png	f
1517	UMP-45 | Roadblock	0	1	68	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ump45_gs_ump_roadblock_light_large.d6b1372a575db666a8a7f039a39c05597d6cb60b.png	f
1519	Galil AR | Destroyer	0	0.7	68	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_galilar_cu_galil_destroyer_light_large.00308096b32ca8c6252ed241878ca1ec5e743c36.png	f
1521	M4A4 | Temukau	0	0.8	69	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_cu_m4a4_temukau_light_large.a41eb80c70cbbee5d84e53b5cd1eaa10954c938d.png	t
1523	AK-47 | Head Shot	0	1	69	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ak47_cu_ak_head_shot_holo_light_large.85be84ba7c07917493b8e8a66c9d95c928ebe8b6.png	t
1525	UMP-45 | Wild Child	0	1	69	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ump45_cu_ump_clutch_kick_light_large.b57e43c07b433517b1c3bdaa1e52ce44878af481.png	f
1527	P2000 | Wicked Sick	0	1	69	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_hkp2000_cu_p2000_decline_light_large.7f57145674a5e41b3b8e7fe70be4ffbb57ec6f84.png	f
1529	AWP | Duality	0	0.8	69	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_awp_gs_awp_limbo_snake_light_large.60984ce1e5c1a4ac10e83444a9b7e7f78dd98b1e.png	f
1531	M4A1-S | Emphorosaur-S	0	0.8	69	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_silencer_cu_m4a1s_feeding_frenzy_light_large.e1cb803e0e10ae4457e42d34ec8515b1500f4762.png	f
1533	R8 Revolver | Banana Cannon	0	1	69	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_revolver_gs_r8_banana_light_large.50f0b729a36a405d48b41d58463234dbbd15b9cf.png	f
1535	Glock-18 | Umbral Rabbit	0	0.75	69	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_glock_cu_glock_moon_rabbit_light_large.9063b9745250446c657632eb13a6325f51d101f2.png	f
1537	P90 | Neoqueen	0	0.6	69	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p90_gs_p90_neoqueen_light_large.fa2a81f8c7906b2683b5eb4b562edd2529ad2cf0.png	f
1539	MAC-10 | Sakkaku	0.21000000000000002	0.79	69	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mac10_cu_mac10_sakkaku_light_large.b590689d0ca099e8a759dd0a86da0710a58bca42.png	f
1541	SG 553 | Cyberforce	0	0.9	69	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sg556_cu_sg553_cyberforce_light_large.63aa4e611195d801eb706ac65d38df68f98e2b76.png	f
1543	MP5-SD | Liquidation	0	1	69	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp5sd_cu_mp5sd_quick_liquidation_light_large.2b446c710928debe38469e33b3b9030bd218c0e3.png	f
1545	MAG-7 | Insomnia	0	1	69	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mag7_cu_mag7_insomnia_light_large.0d971fb17ca0bb1df7baed6a1caa902c56c1ea5b.png	f
1547	MP9 | Featherweight	0	1	69	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp9_cu_mp9_superlight_light_large.81ad837f4c889f250fa03b227ef74555614de55d.png	f
1549	P250 | Re.built	0	0.9	69	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p250_cu_p250_rebuilt_light_large.69d4fcb9a8151d09818d1c26cf4c7b03d046b5a1.png	f
1551	Tec-9 | Rebel	0	1	69	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_tec9_cu_tec9_freedom_light_large.bb79585222a88d4dd3b154915c5527cac7e507d1.png	f
1553	SCAR-20 | Fragments	0	0.78	69	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_scar20_gs_scar_fragments_black_light_large.d6bde287b06ba2380ba07621a0b06c36b13c4025.png	f
1555	M4A4 | Royal Paladin	0	0.8	70	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_gs_m4a4_royal_squire_light_large.f802ec3cf9c1c6837d841384f6d112367340880b.png	t
1557	R8 Revolver | Fade	0	0.4	70	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_revolver_aa_fade_revolver_light_large.af77aee9f82936e7510b89e7f0c1bbf6bfaaff45.png	t
1559	AK-47 | Point Disarray	0	0.67	70	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ak47_cu_ak47_point_disarray_light_large.ba0f6ccdcb917aa2bde2ef0312c57d763a61d341.png	f
1561	P90 | Shapewood	0	1	70	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p90_cu_p90_shapewood_light_large.e7744840c89b1b83be82d2f64beb5a6719c47bd3.png	f
1563	G3SG1 | The Executioner	0.14	0.85	70	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_g3sg1_cu_g3sg1_executioner_light_large.36071be17a266f28d8631b0fd73a9be6767ce399.png	f
1565	Negev | Power Loader	0	1	70	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_negev_cu_negev_impact_light_large.3315f6272c9bb790f96731643232008b4b8c7296.png	f
1567	Tec-9 | Avalanche	0	1	70	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_tec9_cu_tec9_avalanche_light_large.eb6726a24084bf5f3c8c8c70cd8ea37425a708e3.png	f
1569	Five-SeveN | Retrobution	0	1	70	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_fiveseven_cu_fiveseven_retrobution_light_large.7ef4b20b8c9aed4d6461861c9d93b81630f6ac71.png	f
1571	PP-Bizon | Fuel Rod	0	1	70	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_bizon_cu_bizon_noxious_light_large.dc3af57fa024448b24e4ddb8838a0a339cee46ce.png	f
1573	XM1014 | Teclu Burner	0	0.65	70	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_xm1014_aq_xm1014_hot_rod_light_large.f664b036e9b4ec638574f17a9b7ea0905e8c57e0.png	f
1575	SG 553 | Tiger Moth	0	1	70	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sg556_gs_sg553_tiger_moth_light_large.18de0e5e029741a67330038e646fab1596fcfe88.png	f
1577	R8 Revolver | Crimson Web	0.06	0.8	70	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_revolver_hy_webs_light_large.2a0bbba44388502060a910b5a18f5b64b5be0b3d.png	f
1579	Desert Eagle | Corinthian	0	0.44000000000000006	70	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_deagle_aq_deagle_corinthian_light_large.1a694892a1953a131775451d0542508b4b3d9e77.png	f
1581	AUG | Ricochet	0	0.8	70	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_aug_am_aug_jumble_light_large.d86901a42f239ddc39cd645d2a17281881fe37d5.png	f
1583	Sawed-Off | Yorick	0	1	70	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sawedoff_gs_sawedoff_necromancer_light_large.8cead257afdfaf5b852a61d2358aa3fb84def860.png	f
1585	P2000 | Imperial	0	0.2	70	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_hkp2000_am_p2000_imperial_red_light_large.c47e207307725ed1f9e8cf6d1478dbfd3523c7a7.png	f
1587	SCAR-20 | Outbreak	0	0.5	70	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_scar20_hy_scar20_jungler_light_large.4f6402fac5ca041aae7db17b214e5cfd55149c44.png	f
1589	M4A1-S | Golden Coil	0	1	71	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_silencer_gs_m4a1s_snakebite_gold_light_large.574ace77e1044dbf3a387f200b2867332e974f70.png	t
1591	USP-S | Kill Confirmed	0	1	71	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_usp_silencer_cu_usp_kill_confirmed_light_large.a3a7b8f19c9fb931b18c1edd7dd21d44e2c3c2e0.png	t
1593	AK-47 | Frontside Misty	0.02	0.8699999999999999	71	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ak47_cu_ak47_winter_sport_light_large.785a08aecd996dcffc6f38373fdc73697e601a6a.png	f
1595	G3SG1 | Flux	0	0.9	71	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_g3sg1_gs_g3sg1_flux_purple_light_large.6ed40e104625c9607e7df5ee60373a19d3dae634.png	f
1597	SSG 08 | Big Iron	0	0.64	71	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ssg08_cu_ssg08_technicality_light_large.1a057a14ca191ce12629e06217cbe86097444b03.png	f
1599	Galil AR | Stone Cold	0	0.9	71	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_galilar_gs_galil_nightwing_light_large.bc71fb0b9102f22348f39015b7de5affd60829e0.png	f
1601	P250 | Wingshot	0	0.9	71	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p250_hy_p250_crackshot_light_large.538a33bb8d7af894f965257c39f699168e125cdd.png	f
1603	M249 | Nebula Crusader	0	1	71	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m249_gs_m249_nebula_crusader_light_large.60f60c9e8203575e3e3f5574db51132e2b2fe7c7.png	f
1605	MP7 | Special Delivery	0	0.62	71	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp7_cu_mp7_classified_light_large.231ba61751c2976258bf96b3d1db5ae6ecb03b95.png	f
1607	Dual Berettas | Dualing Dragons	0	1	71	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_elite_cu_dualberretta_dragons_light_large.2742674cbf237d1ba5fb6ed9f0d90e00a03570f9.png	f
1609	XM1014 | Scumbria	0	1	71	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_xm1014_aq_xm1014_scumbria_light_large.b8e79b3c4391784151d789edde360dbaaef7fd1f.png	f
1611	Glock-18 | Wraiths	0	0.8	71	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_glock_gs_glock18_wrathys_light_large.8cf4aba20d193a1646b378a3d04a6fee3f66724c.png	f
1613	SCAR-20 | Green Marine	0	0.8	71	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_scar20_gs_scar20_peacemaker03_light_large.061f9ac2ff0a040f6fcc296c451c09fe2e198f83.png	f
1615	MAG-7 | Cobalt Core	0	0.5	71	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mag7_cu_mag7_myrcene_light_large.7cd0ed89db7accc44d3289f9f1529e0a75f4643e.png	f
1617	FAMAS | Survivor Z	0	0.6	71	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_famas_cu_famas_lenta_light_large.7ab508a407e56ab541dae127ef5fc64f09f6ae08.png	f
1619	MAC-10 | Rangeen	0	0.5	71	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mac10_cu_mac10_alekhya_duo_light_large.7173900a6b75cee250a55197483cba3c0204b955.png	f
1621	AWP | Containment Breach	0	1	72	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_awp_cu_awp_virus_light_large.00307f818d425d94cb8e4eeda1e27699f713fb45.png	t
1623	MAC-10 | Stalker	0	1	72	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mac10_gs_mac10_stalker_light_large.cb4d7a60a69978f1575526f979be8e1e1538a673.png	t
1625	SSG 08 | Bloodshot	0.14	0.6	72	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ssg08_cu_ssg08_tickler_light_large.b6a73afa62f8983211740a1570410df4864f45f6.png	f
1627	Tec-9 | Decimator	0	0.75	72	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_tec9_gs_tec9_decimator_light_large.11236163667e1dd46c3d869d844e384a23544513.png	f
1629	SG 553 | Colony IV	0	1	72	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sg556_cu_sg553_reactor_light_large.af5c07d2528198641adf32cf3498aa7d2823b048.png	f
1631	AK-47 | Rat Rod	0	1	72	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ak47_gs_ak47_nibbler_light_large.1c402d395b628aa5667239eec44640d7f603d754.png	f
1633	P2000 | Obsidian	0	1	72	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_hkp2000_cu_p2000_obsidian_light_large.0a6ad31fe8f70401ffdd377c289309d0256282c6.png	f
1635	PP-Bizon | Embargo	0	1	72	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_bizon_cu_bizon_road_warrior_light_large.92dd3aa0346010a6e3a625d01ae4f965195a05d2.png	f
1637	AUG | Arctic Wolf	0	0.7	72	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_aug_cu_aug_whitefang_light_large.051b21da4e56c64ad78ee8a67a0e9e237a4e01b1.png	f
1639	MP7 | Neon Ply	0	1	72	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp7_cu_mp7_replica_light_large.f56c050cb5147918efb6872ce61fda358a684cf5.png	f
1641	Dual Berettas | Balance	0	1	72	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_elite_gs_dual_elites_rose_light_large.8df8980203b198879875be44656361ccbb41791e.png	f
1643	R8 Revolver | Memento	0	0.8	72	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_revolver_gs_r8_memento_light_large.8ca600a94c72b5a3b33bb826a1a588f7e48d5e78.png	f
1645	G3SG1 | Black Sand	0	0.8	72	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_g3sg1_cu_g3sg1_blacksand_light_large.8a9b364779493ae19a87eb4e73aa47f4432d3f41.png	f
1647	M249 | Warbird	0.05	0.65	72	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m249_gs_m249_warbird_veteran_light_large.29a2ee22222b037e6825fb0c230aa799718e4115.png	f
1649	Nova | Plume	0	0.8	72	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_nova_cu_nova_featherswing_light_large.49e81792746dc7844ff18c45fb23030cd8b66d59.png	f
1651	SCAR-20 | Torn	0	0.45	72	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_scar20_sp_scar20_striker_dust_light_large.0842dbdf0fe714c92f634b376e15c2f8c21b6d56.png	f
1653	MP5-SD | Acid Wash	0	0.68	72	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp5sd_gs_mp5_etch_light_large.a86867a43e3607c1826b6d106870bf69642687b0.png	f
1655	USP-S | The Traitor	0	1	73	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_usp_silencer_gs_usps_hangedman_light_large.a01890fdeb8335437df7af6641a7b4f6e2fcca34.png	t
1657	M4A4 | In Living Color	0	0.79	73	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_cu_m4a4_love_light_large.5f7f6a3085aedc1a878dd10881144e7898a2db3d.png	t
1659	Galil AR | Chromatic Aberration	0	1	73	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_galilar_cu_galil_chroma_pink_light_large.e29cb838de1fc6318d36ed2d7263b7fcef10a4d8.png	f
1661	MP9 | Food Chain	0	1	73	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp9_cu_mp9_food_chain_light_large.5895f4cc864387a61a3783470037e6ed1953f7df.png	f
1663	XM1014 | XOXO	0	0.9	73	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_xm1014_aq_xm1014_punk_light_large.8c6eb5bcf234179713a52b1a5e22c64c21c52007.png	f
1665	AK-47 | Slate	0	1	73	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ak47_gs_ak47_professional_light_large.d09d623d0a725c63e8a3905f66bba41ba2ed59e8.png	f
1667	Desert Eagle | Trigger Discipline	0	0.97	73	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_deagle_cu_deag_trigger_discipline_light_large.9d8615945f079e3f7ea84c572fd34408fee6341c.png	f
1669	P250 | Cyber Shell	0	0.85	73	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p250_gs_p250_cybershell_light_large.9f0408cde898dd81609541a8e68ff1ffe81320fd.png	f
1671	MAC-10 | Button Masher	0	1	73	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mac10_cu_mac10_portable_light_large.d4e97127a92ecba12884e5af083aa84685486b39.png	f
1673	Negev | dev_texture	0	0.65	73	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_negev_cu_negev_devtexture_light_large.a0c6f2fcbac9d473d7b9d0452773843c284683e3.png	f
1675	Glock-18 | Clear Polymer	0	1	73	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_glock_gs_glock_polymer_light_large.9a56b15b2deea5847b0820c5ad982c1796cc8e0c.png	f
1677	CZ75-Auto | Circaetus	0	0.9	73	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_cz75a_cu_cz75_whirlwind_light_large.86609770746655c350bb7b087a8c0f1f1b55d01f.png	f
1679	R8 Revolver | Junk Yard	0	1	73	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_revolver_gs_r8_rustking_light_large.5245178cf84e1bf8d77eb7a3ec19d108a70131d3.png	f
1681	SG 553 | Heavy Metal	0	1	73	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sg556_gs_sg553_deathmetal_light_large.c41041d1a69838d3b66f21032254066eaea8fe41.png	f
1683	M249 | O.S.I.P.R.	0	0.7	73	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m249_gs_m249_combine_light_large.6f8724ef896506ede0925a425da05969f19aafdc.png	f
1685	Nova | Windblown	0	0.5	73	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_nova_sp_nova_wind_dispersal_light_large.9156d5a206e0e4b47f814bee9b6b54ac0a16b159.png	f
1687	UMP-45 | Oscillator	0	0.5	73	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ump45_am_ump45_electrowave_light_large.98b6a5211b19bfeecb69d08cc7ebe6584cff353f.png	f
1689	AK-47 | The Empress	0	1	74	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ak47_gs_ak47_empress_light_large.f81d0b07dca381635c89f74bcdb6b64a6da6e81c.png	t
1691	P250 | See Ya Later	0	0.7	74	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p250_cu_p250_cybercroc_light_large.396de1d53797f8875d242d1eb33d5b81dce2bb8e.png	t
1693	PP-Bizon | High Roller	0	1	74	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_bizon_cu_bizon_all_in_light_large.d31ae97fe448b550cfe06d617daa3575c77e8c2a.png	f
1695	M4A1-S | Leaded Glass	0	0.7	74	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_silencer_gs_m4a1_shatter_light_large.f4d487cbf956eb13a505b8926c8f0f63cb3604b3.png	f
1697	R8 Revolver | Llama Cannon	0.03	0.7	74	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_revolver_gs_r8_llamacannon_light_large.ae4ce84764b4892a2ea2d3f9f0afc57023f7bdc8.png	f
1699	UMP-45 | Exposure	0	0.55	74	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ump45_cu_ump45_x-ray_machine_light_large.a4563e015fd33d1874cc220458db2754a15dd08a.png	f
1701	SG 553 | Phantom	0	0.6	74	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sg556_gs_sg553_phantom_light_large.51fc477c1024614f6f52080d3b7200408c9d2881.png	f
1703	XM1014 | Ziggy	0	0.72	74	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_xm1014_aq_xm1014_ziggy_anarchy_light_large.7042642ba5043be6e1cb82d6bb9a05678402dea1.png	f
1705	MP9 | Goo	0	0.6	74	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp9_cu_mp9_goo_light_large.3cab8ecb356ee5f2549c1b148f5961fdf5d9cd76.png	f
1707	CZ75-Auto | Tacticat	0	0.7	74	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_cz75a_gs_cz75_tacticat_light_large.ed9ba2f6cb8fd5e2a2b6cfb1b9a0ba4c87c93ec3.png	f
1709	Glock-18 | Off World	0	1	74	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_glock_cu_glock_indigo_light_large.3786c7c3be7d03ee053050af2f7a8427782742e1.png	f
1710	Tec-9 | Cracked Opal	0	1	74	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_tec9_cu_tec9_cracked_opal_light_large.d6e9cc1c31550faeac9c55341be170abf07245b7.png	f
1712	AUG | Triqua	0	1	74	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_aug_cu_aug_orange_triangle_light_large.793eb05ec841c2664b8482565e5d080c731d6ecd.png	f
1714	G3SG1 | Hunter	0	1	74	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_g3sg1_gs_g3sg1_cetme_redux_light_large.18ad1afdb32fca22879dcdd22e579c5afaef6ad8.png	f
1716	Sawed-Off | Morris	0	1	74	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sawedoff_aq_sawed-off_flower_light_large.0d98b08ce8023d49dac2f76b10ef2f3cd7a33350.png	f
1718	MAC-10 | Oceanic	0	0.6	74	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mac10_am_mac10_oceani_light_large.25e5d3d5e249e11fe32971fa7bcdc0e5a1c777bd.png	f
1720	SCAR-20 | Jungle Slipstream	0	0.5	74	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_scar20_hy_scar20_jungle_slipstream_light_large.d49f99ac854c1a25fc46bde5dd32f438bdd587f1.png	f
1722	AK-47 | Bloodsport	0	0.45	75	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ak47_gs_ak47_bloodsport_light_large.40f076f6b92e08acc37860923533aa9768795b2b.png	t
1724	USP-S | Neo-Noir	0	0.7	75	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_usp_silencer_cu_usps_noir_light_large.ed0f4245c1b9031c6d410300ce6de1f1efb75481.png	t
1726	M4A1-S | Decimator	0	0.85	75	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_silencer_gs_m4a1_decimator_light_large.5af82e99273fcc0a4ad35b2971b63787ee989d6a.png	f
1728	AWP | Fever Dream	0	0.55	75	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_awp_cu_awp_psychopath_light_large.11e54a670b779e1757cce18ea252d70eb35c6a75.png	f
1730	CZ75-Auto | Xiangliu	0	0.56	75	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_cz75a_gs_cz_snakes_purple_light_large.a06599fab1d73352fd970fc0356c215c50ca7e9a.png	f
1732	Galil AR | Crimson Tsunami	0	0.55	75	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_galilar_sp_galil_wave_light_large.0a4761ebb660428a77a622885054e1c44cf03959.png	f
1734	M249 | Emerald Poison Dart	0	0.45	75	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m249_sp_m249_frog_original_light_large.7331eb3d676ebdf8df71adb58b43aea63660f785.png	f
1736	XM1014 | Seasons	0	0.5	75	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_xm1014_aq_xm_leaf_fade_light_large.f753b1b710a8023e299d1918ca150b42483ca1cd.png	f
1738	UMP-45 | Scaffold	0	1	75	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ump45_gs_ump_abyss_light_large.55910298a6be9b071156ef176a31d26007d92d0f.png	f
1740	MAC-10 | Last Dive	0	0.52	75	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mac10_aa_mac10_the_last_dive_light_large.d0039a83384acbe26f9337c8a83e81f6410b7dc9.png	f
1742	Desert Eagle | Oxide Blaze	0	0.5	75	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_deagle_cu_desert_eagle_corroden_light_large.5fde2cc1c9b82b0e9823445c7fb2be334bc286af.png	f
1744	Sawed-Off | Zander	0.05	1	75	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sawedoff_aq_sawedoff_zander2_light_large.514f7c6c606296838f56020877d7762c594dc4bd.png	f
1746	P250 | Ripple	0	0.5	75	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p250_am_p250_sputnik_light_large.38766530975aaa4006dda7a24533ac1b05a6b6a8.png	f
1748	Five-SeveN | Capillary	0	0.7	75	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_fiveseven_cu_fiveseven_vein_light_large.464ec691b3c3c9c828aa1a8d4e2b076daa4b7a4f.png	f
1750	MP7 | Akoben	0	0.7	75	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp7_sp_mp7_tribal_yellow_light_large.1c05d27487feb5d82e8165721942ea3a67e6ba33.png	f
1752	PP-Bizon | Jungle Slipstream	0	0.5	75	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_bizon_hy_bizon_torn_green_light_large.1aa076ede6a2511bf676ffb1c5a3eafca71c58a6.png	f
1754	SCAR-20 | Blueprint	0	0.75	75	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_scar20_cu_blueprint_scar_light_large.9a71e8191c2b2081f5fd3884f57f919663b26ee5.png	f
1756	M4A4 | Asiimov	0.18	1	76	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_cu_m4_asimov_light_large.af03179f3d43ff55b0c3d114c537eac77abdb6cf.png	t
1758	Sawed-Off | The Kraken	0	0.4	76	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sawedoff_cu_sawedoff_octopump_light_large.761df5911efc6a96061c7b34e41a2ff6ec61e58b.png	t
1760	AWP | Redline	0.1	0.4	76	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_awp_cu_awp_cobra_light_large.cf20ce6ac1151b4a30d8a84081ec4373cbfad4a4.png	f
1762	M4A1-S | Guardian	0	0.5	76	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_silencer_cu_m4a1-s_elegant_light_large.1acbb0060648091ac532de68cfd720b7ad980564.png	f
1764	P250 | Mehndi	0	1	76	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p250_cu_p250_refined_light_large.9da38bc561b6576555b1700e9e10ddbc52994c67.png	f
1766	Dual Berettas | Marina	0.05	0.5	76	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_elite_hy_marina_sunrise_light_large.bcdf31f5af4a5b9bef2bb0d5336715a3a0407b92.png	f
1768	MP9 | Rose Iron	0	0.3	76	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp9_am_thorny_rose_mp9_light_large.a187f13404eba96de622f4c94e85078fb18d8d7c.png	f
1770	FAMAS | Pulse	0	0.4	76	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_famas_cu_famas_pulse_light_large.fad5dfcd7b0ccfe655c7c3903d091140904959ec.png	f
1772	Nova | Rising Skull	0	0.5	76	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_nova_cu_skull_nova_light_large.558d42424adda8cc3383b05d5388f75837b07efa.png	f
1774	Galil AR | Sandstorm	0.1	0.6	76	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_galilar_cu_sandstorm_light_large.008937727e75bf840d2b511d3d8493a12b5ed2ac.png	f
1776	PP-Bizon | Cobalt Halftone	0.05	0.45	76	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_bizon_am_turqoise_halftone_light_large.e34dc4bab2f1da66b04bd2d3cadb51339ce81f4d.png	f
1778	Five-SeveN | Kami	0	0.3	76	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_fiveseven_hy_kami_light_large.ce4939fe41b30c6143f487879a57e4f5f227e811.png	f
1780	M249 | Magma	0	0.7	76	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m249_aq_obsidian_light_large.c8a38c9354c2f4531f0802eaa49caa9878bbf9ed.png	f
1781	M4A1-S | Vaporwave	0	0.6	77	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_silencer_cu_m4a1s_feeding_frenzy_light_large.e1cb803e0e10ae4457e42d34ec8515b1500f4762.png	t
1782	Glock-18 | Gold Toof	0	0.73	77	covert_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_glock_am_nuclear_pattern1_glock_light_large.01e91d2930e04d43215becb90447b2ebec1cb8d9.png	t
1783	AK-47 | The Outsiders	0	0.9	77	classified_bg	t	https://s3.eu-west-3.amazonaws.com/skinsnipe.com/img/csgo/skins/ak_47_the_outsiders.png	f
1784	P250 | Epicenter	0	0.8	77	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p250_cu_p250_cybercroc_light_large.396de1d53797f8875d242d1eb33d5b81dce2bb8e.png	f
1785	UMP-45 | Neo-Noir	0	1	77	classified_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_usp_silencer_cu_usps_noir_light_large.ed0f4245c1b9031c6d410300ce6de1f1efb75481.png	f
1786	M4A4 | Turbine	0	0.85	77	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_cu_m4a1_howling_light_large.c64a9fc9fa04b5d10d4b1e200135e59285c8a77c.png	f
1787	Dual Berettas | Hydro Strike	0	0.8	77	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_elite_cu_elites_beware_light_large.3a4517010e237136f9cca5c593beedd94a2a0a15.png	f
1788	SSG 08 | Rapid Transit	0	0.75	77	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ssg08_cu_ssg08_dragonfire_scope_light_large.482858c9d088454b42e53f02d927a8203c69dfc2.png	f
1789	P90 | Randy Rush	0	0.75	77	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p90_gs_p90_tangled_light_large.d1c6b11dc6876f1cf546281df8b8fac68a037518.png	f
1790	MAC-10 | Saibā Oni	0	0.66	77	restricted_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mac10_gs_mac10_stalker_light_large.cb4d7a60a69978f1575526f979be8e1e1538a673.png	f
1791	Desert Eagle | Calligraffiti	0	1	77	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_deagle_cu_deagle_kitch_light_large.0df9b5246d27786b413642f5fc959f37d8892c3a.png	f
1792	USP-S | 27	0	1	77	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_usp_silencer_cu_usp_printstream_light_large.9f5bcd4f94db3d965b3b2e7c3aace470e9466380.png	f
1793	AUG | Luxe Trim	0	0.9	77	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_aug_cu_aug_chameleonaire_light_large.ad1d2f62d1481931d8e23e0ab0fbd4e7a61135f7.png	f
1794	M249 | Hypnosis	0	1	77	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m249_cu_m249_downvote_light_large.9d51d5d89b1df07b160580b5b929f66f06bb8310.png	f
1795	R8 Revolver | Tango	0	0.85	77	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_revolver_aa_fade_revolver_light_large.af77aee9f82936e7510b89e7f0c1bbf6bfaaff45.png	f
1796	MP5-SD | Statics	0	1	77	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp5sd_gs_mp5_festival_drip_light_large.c71af0a784e5ecd6e5d5f2f71961be155e283cde.png	f
1797	SCAR-20 | Trail Blazer	0	0.7	77	milspec_bg	t	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_scar20_gs_scar20_bloodsport_light_large.dd99feccb31d2ec296bcd620abd885e6fe50d44e.png	f
1798	AWP | CMYK	0	0.8	78	covert_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_cu_m4a1_howling_light_large.c64a9fc9fa04b5d10d4b1e200135e59285c8a77c.png	t
1799	Desert Eagle | Starcade	0	0.75	78	classified_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_deagle_cu_deagle_kitch_light_large.0df9b5246d27786b413642f5fc959f37d8892c3a.png	f
1800	AUG | Lil' Pig	0	0.8	78	classified_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_aug_cu_aug_chameleonaire_light_large.ad1d2f62d1481931d8e23e0ab0fbd4e7a61135f7.png	f
1801	M4A4 | Polysoup	0	0.64	78	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_cu_m4a4_elite_tactical_light_large.015fd86aa32f4f0331aa1b7dc2571d89dbf38671.png	f
1802	CZ75-Auto | Slalom	0	0.57	78	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_cz75a_aq_etched_cz75_light_large.5fa7e4f56600efeaceb99a948c6fa5dc3648a3b9.png	f
1803	P90 | Attack Vector	0	0.55	78	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p90_cu_p90-asiimov_light_large.0ca7f7fc032c98c5cc506ccde92b33e5836a8a88.png	f
1804	AK-47 | Crossfade	0	0.5	78	milspec_bg	f	https://s3.eu-west-3.amazonaws.com/skinsnipe.com/img/csgo/skins/ak_47_crossfade.png	f
1805	SG 553 | Berry Gel Coat	0	0.8	78	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sg556_cu_sg553_reactor_light_large.af5c07d2528198641adf32cf3498aa7d2823b048.png	f
1806	XM1014 | Halftone Shift	0	0.6	78	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_xm1014_aq_xm1014_punk_light_large.8c6eb5bcf234179713a52b1a5e22c64c21c52007.png	f
1807	SCAR-20 | Wild Berry	0	0.65	78	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_scar20_gs_scar20_bloodsport_light_large.dd99feccb31d2ec296bcd620abd885e6fe50d44e.png	f
1808	MP7 | Astrolabe	0	1	78	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp7_gs_mp7_bloodsport_light_large.ab5c304901ceb320482742b041815e7b5e3ccb95.png	f
1809	FAMAS | Halftone Wash	0	0.5	78	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_famas_gs_famas_legacy_gold_light_large.34013884c12276d1c83ceb4ea9fb83428df02920.png	f
1810	Galil AR | NV	0	0.47	78	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_galilar_cu_galil_abrasion_light_large.8398e4836a0c26add3514a6af2262704d85fec07.png	f
1811	P2000 | Coral Halftone	0	0.52	78	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_hkp2000_cu_p2000_fire_elemental_light_large.1e57d4d9f1c51e613c1923377aa55fab4b0ab1bc.png	f
1812	M249 | Spectrogram	0	0.5	78	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m249_cu_m249_downvote_light_large.9d51d5d89b1df07b160580b5b929f66f06bb8310.png	f
1813	SSG 08 | Halftone Whorl	0	0.5	78	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ssg08_cu_ssg08_dragonfire_scope_light_large.482858c9d088454b42e53f02d927a8203c69dfc2.png	f
1814	AK-47 | B the Monster	0	0.8	79	covert_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ak47_cu_ak47_mastery_light_large.4305c0ba4b02ce531fc08c275fa6a9d87da2cf7e.png	t
1815	AWP | Crakow!	0	1	79	classified_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_awp_cu_awp_chroma_pink_light_large.afc69cbf51b04e24149744b6ee1d998cc18d3002.png	f
1816	Zeus x27 | Dragon Snore	0	0.8	79	classified_bg	f	https://s3.eu-west-3.amazonaws.com/skinsnipe.com/img/csgo/skins/zeus_x27_dragon_snore.png	f
1817	AUG | Eye of Zapems	0	0.85	79	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_aug_cu_aug_chameleonaire_light_large.ad1d2f62d1481931d8e23e0ab0fbd4e7a61135f7.png	f
1818	Dual Berettas | Sweet Little Angels	0	0.82	79	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_elite_cu_elites_beware_light_large.3a4517010e237136f9cca5c593beedd94a2a0a15.png	f
1819	XM1014 | Monster Melt	0	0.75	79	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_xm1014_aq_xm1014_punk_light_large.8c6eb5bcf234179713a52b1a5e22c64c21c52007.png	f
1820	MAC-10 | Pipsqueak	0	0.9	79	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mac10_gs_mac10_stalker_light_large.cb4d7a60a69978f1575526f979be8e1e1538a673.png	f
1821	Nova | Wurst Hölle	0	1	79	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_nova_cu_nova_hyperbeast_light_large.ec64e1aa22dc78fa692a2269a99669842b91cc6f.png	f
1822	Galil AR | Metallic Squeezer	0	0.6	79	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_galilar_cu_galil_abrasion_light_large.8398e4836a0c26add3514a6af2262704d85fec07.png	f
1823	Glock-18 | Teal Graf	0	0.5	79	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_glock_hy_leaf_blue_light_large.1b017cc8d4594d924537f9928db4253ff628284c.png	f
1824	Desert Eagle | Tilted	0	0.75	79	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_deagle_cu_deagle_kitch_light_large.0df9b5246d27786b413642f5fc959f37d8892c3a.png	f
1825	M4A1-S | Wash me plz	0	0.58	79	industrial_bg	f	https://s3.eu-west-3.amazonaws.com/skinsnipe.com/img/csgo/skins/m4a1_s_wash_me_plz.png	f
1826	Negev | Wall Bang	0	1	79	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_negev_gs_negev_thor_light_large.5060a7a913b1716faf7e81e145d65e0b4081b20f.png	f
1827	P90 | Wash me	0	0.5	79	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p90_cu_p90-asiimov_light_large.0ca7f7fc032c98c5cc506ccde92b33e5836a8a88.png	f
1828	Five-SeveN | Midnight Paintover	0	0.5	79	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_fiveseven_cu_five_seven_angry_light_large.54986e86178e0462d34fe78b6b726292813541f5.png	f
1829	MP5-SD | Neon Squeezer	0.2	0.9	79	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp5sd_gs_mp5_festival_drip_light_large.c71af0a784e5ecd6e5d5f2f71961be155e283cde.png	f
1830	M4A1-S | Fade	0	0.08	80	covert_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_awp_aa_awp_fade_light_large.4e978e13c3396c1b1e32e993afb462ccac55d783.png	t
1831	Glock-18 | AXIA	0	0.7	80	classified_bg	f	https://s3.eu-west-3.amazonaws.com/skinsnipe.com/img/csgo/skins/glock_18_axia.png	f
1832	Galil AR | Rainbow Spoon	0	0.55	80	classified_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_galilar_cu_galil_abrasion_light_large.8398e4836a0c26add3514a6af2262704d85fec07.png	f
1833	MP9 | Arctic Tri-Tone	0	0.6	80	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp9_gs_mp9_starlight_light_large.79d29560c71c4ba592824c1a1e3a8172cc7269be.png	f
1834	Five-SeveN | Heat Treated	0	1	80	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_fiveseven_cu_five_seven_angry_light_large.54986e86178e0462d34fe78b6b726292813541f5.png	f
1835	UMP-45 | Crimson Foil	0	0.68	80	restricted_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/weapons/base_weapons/weapon_knife_karambit.8b491b581a4b9c7b5298071425f2b29a39a2a12f.png	f
1836	USP-S | Alpine Camo	0	0.68	80	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_usp_silencer_cu_usp_printstream_light_large.9f5bcd4f94db3d965b3b2e7c3aace470e9466380.png	f
1837	SSG 08 | Zeno	0	0.7	80	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ssg08_cu_ssg08_dragonfire_scope_light_large.482858c9d088454b42e53f02d927a8203c69dfc2.png	f
1838	Nova | Yorkshire	0	1	80	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_nova_cu_nova_hyperbeast_light_large.ec64e1aa22dc78fa692a2269a99669842b91cc6f.png	f
1839	P250 | Small Game	0	0.7	80	milspec_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p250_hy_forest_night_light_large.f2ebb923126bf523ac2052755207d8c9d4dfa668.png	f
1840	AK-47 | Olive Polycam	0	0.5	80	industrial_bg	f	https://s3.eu-west-3.amazonaws.com/skinsnipe.com/img/csgo/skins/ak_47_olive_polycam.png	f
1841	FAMAS | Half Sleeve	0	1	80	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_famas_gs_famas_legacy_gold_light_large.34013884c12276d1c83ceb4ea9fb83428df02920.png	f
1842	Tec-9 | Tiger Stencil	0	0.6	80	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_tec9_gs_tec9_decimator_light_large.11236163667e1dd46c3d869d844e384a23544513.png	f
1843	MAG-7 | Wildwood	0	0.7	80	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mag7_gs_mag7_justice_light_large.fcdc73ab779ab093ee7d90d91c1e3c369bbc8d65.png	f
1844	PP-Bizon | Cold Cell	0	0.4	80	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_bizon_cu_bizon_curse_light_large.c19cf584d3e28db4914d1559cd387999457944d8.png	f
1845	MP5-SD | Savannah Halftone	0.25	0.75	80	industrial_bg	f	https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp5sd_gs_mp5_festival_drip_light_large.c71af0a784e5ecd6e5d5f2f71961be155e283cde.png	f
\.


--
-- Data for Name: skin_conditions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.skin_conditions (id, condition, price, skin_id, "timestamp", stattrak) FROM stdin;
1	Factory New	62.11	1	2025-02-20 23:40:28.58872+00	f
2	Minimal Wear	21.91	1	2025-02-20 23:40:28.611722+00	f
3	Field-Tested	8.43	1	2025-02-20 23:40:28.59372+00	f
4	Well-Worn	3.78	1	2025-02-20 23:40:28.61972+00	f
5	Battle-Scarred	3.92	1	2025-02-20 23:40:28.585721+00	f
6	Factory New	6.67	2	2025-02-20 23:40:07.105955+00	f
7	Minimal Wear	4.13	2	2025-02-20 23:40:07.122953+00	f
8	Field-Tested	2.24	2	2025-02-20 23:40:07.115955+00	f
9	Well-Worn	1.94	2	2025-02-20 23:40:07.131956+00	f
10	Battle-Scarred	1.96	2	2025-02-20 23:40:07.097954+00	f
11	Factory New	7.25	3	2025-02-20 23:40:24.224259+00	f
12	Minimal Wear	3.54	3	2025-02-20 23:40:24.234258+00	f
13	Field-Tested	1.48	3	2025-02-20 23:40:24.230258+00	f
14	Well-Worn	1	3	2025-02-20 23:40:24.23801+00	f
15	Battle-Scarred	0.8	3	2025-02-20 23:40:24.217258+00	f
16	Factory New	6.22	4	2025-02-20 23:40:01.13774+00	f
17	Minimal Wear	4.37	4	2025-02-20 23:40:01.149379+00	f
18	Field-Tested	2.94	4	2025-02-20 23:40:01.14174+00	f
19	Well-Worn	4.55	4	2025-02-20 23:40:01.153372+00	f
20	Battle-Scarred	3.04	4	2025-02-20 23:40:01.134739+00	f
21	Factory New	5.73	5	2025-02-20 23:40:19.025094+00	f
22	Minimal Wear	3.31	5	2025-02-20 23:40:19.035094+00	f
23	Field-Tested	3.3	5	2025-02-20 23:40:19.031094+00	f
24	Factory New	1.33	6	2025-02-20 23:40:52.637243+00	f
25	Minimal Wear	0.93	6	2025-02-20 23:40:52.652244+00	f
26	Field-Tested	0.63	6	2025-02-20 23:40:52.644243+00	f
27	Well-Worn	1.05	6	2025-02-20 23:40:52.665244+00	f
28	Battle-Scarred	0.54	6	2025-02-20 23:40:52.630245+00	f
29	Factory New	0.8	7	2025-02-20 23:40:29.3917+00	f
30	Minimal Wear	0.52	7	2025-02-20 23:40:29.4097+00	f
31	Field-Tested	0.34	7	2025-02-20 23:40:29.401701+00	f
32	Well-Worn	0.29	7	2025-02-20 23:40:29.4147+00	f
33	Battle-Scarred	0.26	7	2025-02-20 23:40:29.384702+00	f
34	Factory New	1.14	8	2025-02-20 23:40:15.783959+00	f
35	Minimal Wear	0.69	8	2025-02-20 23:40:15.791959+00	f
36	Field-Tested	0.49	8	2025-02-20 23:40:15.787959+00	f
37	Well-Worn	1.48	8	2025-02-20 23:40:15.797959+00	f
38	Factory New	0.58	9	2025-02-20 23:40:30.145752+00	f
39	Minimal Wear	0.65	9	2025-02-20 23:40:30.152783+00	f
40	Factory New	0.23	10	2025-02-20 23:40:27.130248+00	f
41	Minimal Wear	0.11	10	2025-02-20 23:40:27.141758+00	f
42	Field-Tested	0.07	10	2025-02-20 23:40:27.135763+00	f
43	Well-Worn	0.06	10	2025-02-20 23:40:27.147942+00	f
44	Battle-Scarred	0.05	10	2025-02-20 23:40:27.125248+00	f
45	Factory New	0.16	11	2025-02-20 23:40:16.759417+00	f
46	Minimal Wear	0.1	11	2025-02-20 23:40:16.769418+00	f
47	Field-Tested	0.08	11	2025-02-20 23:40:16.766418+00	f
48	Well-Worn	0.06	11	2025-02-20 23:40:16.774416+00	f
49	Battle-Scarred	0.06	11	2025-02-20 23:40:16.756417+00	f
50	Factory New	0.13	12	2025-02-20 23:40:12.712472+00	f
51	Minimal Wear	0.19	12	2025-02-20 23:40:12.719052+00	f
52	Factory New	0.11	13	2025-02-20 23:40:25.426395+00	f
53	Minimal Wear	0.09	13	2025-02-20 23:40:25.436395+00	f
54	Field-Tested	0.1	13	2025-02-20 23:40:25.432395+00	f
55	Factory New	0.1	14	2025-02-20 23:40:21.020338+00	f
56	Minimal Wear	0.03	14	2025-02-20 23:40:21.040842+00	f
57	Field-Tested	0.02	14	2025-02-20 23:40:21.025851+00	f
58	Well-Worn	0.02	14	2025-02-20 23:40:21.046874+00	f
59	Battle-Scarred	0.02	14	2025-02-20 23:40:21.001323+00	f
60	Factory New	0.05	15	2025-02-20 23:40:18.196123+00	f
61	Minimal Wear	0.02	15	2025-02-20 23:40:18.205121+00	f
62	Field-Tested	0.02	15	2025-02-20 23:40:18.200122+00	f
63	Well-Worn	0.02	15	2025-02-20 23:40:18.209122+00	f
64	Battle-Scarred	0.02	15	2025-02-20 23:40:18.191122+00	f
65	Factory New	0.07	16	2025-02-20 23:40:18.584001+00	f
66	Minimal Wear	0.02	16	2025-02-20 23:40:18.592+00	f
67	Field-Tested	0.02	16	2025-02-20 23:40:18.587999+00	f
68	Well-Worn	0.02	16	2025-02-20 23:40:18.597+00	f
69	Battle-Scarred	0.02	16	2025-02-20 23:40:18.575658+00	f
70	Factory New	0.07	17	2025-02-20 23:40:51.999459+00	f
71	Minimal Wear	0.02	17	2025-02-20 23:40:52.01946+00	f
72	Field-Tested	0.02	17	2025-02-20 23:40:52.008458+00	f
73	Well-Worn	0.02	17	2025-02-20 23:40:52.02646+00	f
74	Battle-Scarred	0.02	17	2025-02-20 23:40:51.990458+00	f
75	Factory New	0.04	18	2025-02-20 23:40:02.249837+00	f
76	Minimal Wear	0.02	18	2025-02-20 23:40:02.26584+00	f
77	Field-Tested	0.02	18	2025-02-20 23:40:02.253838+00	f
78	Well-Worn	0.06	18	2025-02-20 23:40:02.270837+00	f
79	Battle-Scarred	0.02	18	2025-02-20 23:40:02.241838+00	f
80	Factory New	34.9	19	2025-02-20 23:40:15.068489+00	f
81	Minimal Wear	9.29	19	2025-02-20 23:40:15.085488+00	f
82	Field-Tested	6.54	19	2025-02-20 23:40:15.081487+00	f
83	Well-Worn	5.88	19	2025-02-20 23:40:15.089488+00	f
84	Battle-Scarred	7.37	19	2025-02-20 23:40:15.061952+00	f
85	Factory New	5.67	20	2025-02-20 23:40:49.965602+00	f
86	Minimal Wear	3.98	20	2025-02-20 23:40:49.979604+00	f
87	Field-Tested	1.78	20	2025-02-20 23:40:49.974602+00	f
88	Well-Worn	1.73	20	2025-02-20 23:40:49.984602+00	f
89	Battle-Scarred	1.67	20	2025-02-20 23:40:49.959602+00	f
90	Factory New	4.63	21	2025-02-20 23:40:12.883097+00	f
91	Minimal Wear	2.8	21	2025-02-20 23:40:12.918095+00	f
92	Field-Tested	1.58	21	2025-02-20 23:40:12.900095+00	f
93	Well-Worn	3.7	21	2025-02-20 23:40:12.932725+00	f
94	Battle-Scarred	1.94	21	2025-02-20 23:40:12.871094+00	f
95	Factory New	5.33	22	2025-02-20 23:40:17.824526+00	f
96	Minimal Wear	1.71	22	2025-02-20 23:40:17.833525+00	f
97	Field-Tested	1.07	22	2025-02-20 23:40:17.829527+00	f
98	Well-Worn	0.72	22	2025-02-20 23:40:17.837526+00	f
99	Battle-Scarred	0.74	22	2025-02-20 23:40:17.819526+00	f
100	Factory New	3.68	23	2025-02-20 23:40:01.927697+00	f
101	Minimal Wear	1.79	23	2025-02-20 23:40:01.938246+00	f
102	Field-Tested	1.15	23	2025-02-20 23:40:01.932697+00	f
103	Well-Worn	0.92	23	2025-02-20 23:40:01.944245+00	f
104	Battle-Scarred	0.84	23	2025-02-20 23:40:01.921699+00	f
105	Factory New	2.02	24	2025-02-20 23:40:02.55928+00	f
106	Minimal Wear	1.03	24	2025-02-20 23:40:02.577932+00	f
107	Field-Tested	0.53	24	2025-02-20 23:40:02.565284+00	f
108	Well-Worn	2.37	24	2025-02-20 23:40:02.582931+00	f
109	Battle-Scarred	0.41	24	2025-02-20 23:40:02.546282+00	f
110	Factory New	0.42	25	2025-02-20 23:40:18.515657+00	f
111	Minimal Wear	0.31	25	2025-02-20 23:40:18.524658+00	f
112	Field-Tested	0.15	25	2025-02-20 23:40:18.519659+00	f
113	Well-Worn	0.2	25	2025-02-20 23:40:18.529657+00	f
114	Battle-Scarred	0.49	25	2025-02-20 23:40:18.510657+00	f
115	Factory New	0.49	26	2025-02-20 23:40:23.67559+00	f
116	Minimal Wear	0.3	26	2025-02-20 23:40:23.685768+00	f
117	Field-Tested	0.19	26	2025-02-20 23:40:23.680589+00	f
118	Well-Worn	0.13	26	2025-02-20 23:40:23.688768+00	f
119	Battle-Scarred	0.15	26	2025-02-20 23:40:23.671589+00	f
120	Factory New	0.5	27	2025-02-20 23:40:24.651307+00	f
121	Minimal Wear	0.3	27	2025-02-20 23:40:24.658307+00	f
122	Field-Tested	0.17	27	2025-02-20 23:40:24.655307+00	f
123	Well-Worn	0.18	27	2025-02-20 23:40:24.664307+00	f
124	Battle-Scarred	0.15	27	2025-02-20 23:40:24.645711+00	f
125	Factory New	0.31	28	2025-02-20 23:40:11.35584+00	f
126	Minimal Wear	0.1	28	2025-02-20 23:40:11.373839+00	f
127	Field-Tested	0.06	28	2025-02-20 23:40:11.36384+00	f
128	Well-Worn	0.53	28	2025-02-20 23:40:11.381839+00	f
129	Battle-Scarred	0.06	28	2025-02-20 23:40:11.348839+00	f
130	Factory New	0.12	29	2025-02-20 23:40:16.215252+00	f
131	Minimal Wear	0.08	29	2025-02-20 23:40:16.231536+00	f
132	Field-Tested	0.06	29	2025-02-20 23:40:16.220796+00	f
133	Well-Worn	0.06	29	2025-02-20 23:40:16.238532+00	f
134	Battle-Scarred	0.08	29	2025-02-20 23:40:16.201549+00	f
135	Factory New	0.12	30	2025-02-20 23:40:21.237377+00	f
136	Minimal Wear	0.08	30	2025-02-20 23:40:21.24902+00	f
137	Field-Tested	0.06	30	2025-02-20 23:40:21.242018+00	f
138	Well-Worn	0.06	30	2025-02-20 23:40:21.253018+00	f
139	Battle-Scarred	0.06	30	2025-02-20 23:40:21.232377+00	f
140	Factory New	0.12	31	2025-02-20 23:40:19.303635+00	f
141	Minimal Wear	0.08	31	2025-02-20 23:40:19.312638+00	f
142	Field-Tested	0.05	31	2025-02-20 23:40:19.307636+00	f
143	Well-Worn	0.07	31	2025-02-20 23:40:19.317636+00	f
144	Battle-Scarred	0.07	31	2025-02-20 23:40:19.298747+00	f
145	Factory New	0.05	32	2025-02-20 23:40:09.206528+00	f
146	Minimal Wear	0.02	32	2025-02-20 23:40:09.219528+00	f
147	Field-Tested	0.03	32	2025-02-20 23:40:09.21353+00	f
148	Well-Worn	0.03	32	2025-02-20 23:40:09.229535+00	f
149	Battle-Scarred	0.02	32	2025-02-20 23:40:09.199598+00	f
150	Factory New	0.04	33	2025-02-20 23:40:21.916064+00	f
151	Minimal Wear	0.02	33	2025-02-20 23:40:21.924282+00	f
152	Field-Tested	0.02	33	2025-02-20 23:40:21.919063+00	f
153	Well-Worn	0.02	33	2025-02-20 23:40:21.930281+00	f
154	Battle-Scarred	0.02	33	2025-02-20 23:40:21.911064+00	f
155	Factory New	0.04	34	2025-02-20 23:40:23.701768+00	f
156	Minimal Wear	0.02	34	2025-02-20 23:40:23.709768+00	f
157	Field-Tested	0.02	34	2025-02-20 23:40:23.705768+00	f
158	Well-Worn	0.02	34	2025-02-20 23:40:23.716768+00	f
159	Battle-Scarred	0.05	34	2025-02-20 23:40:23.697767+00	f
160	Factory New	0.03	35	2025-02-20 23:40:25.552031+00	f
161	Minimal Wear	0.02	35	2025-02-20 23:40:25.560031+00	f
162	Field-Tested	0.02	35	2025-02-20 23:40:25.556031+00	f
163	Well-Worn	0.02	35	2025-02-20 23:40:25.565032+00	f
164	Battle-Scarred	0.02	35	2025-02-20 23:40:25.549033+00	f
165	Factory New	0.04	36	2025-02-20 23:40:51.582834+00	f
166	Minimal Wear	0.02	36	2025-02-20 23:40:51.590407+00	f
167	Field-Tested	0.02	36	2025-02-20 23:40:51.587408+00	f
168	Well-Worn	0.02	36	2025-02-20 23:40:51.596409+00	f
169	Battle-Scarred	0.02	36	2025-02-20 23:40:51.576833+00	f
170	Factory New	3104.56	37	2025-02-20 23:40:00.216144+00	f
171	Minimal Wear	2492.73	37	2025-02-20 23:40:00.230957+00	f
172	Field-Tested	2143.6	37	2025-02-20 23:40:00.222143+00	f
173	Well-Worn	2501.06	37	2025-02-20 23:40:00.237124+00	f
174	Battle-Scarred	1625.51	37	2025-02-20 23:40:00.211144+00	f
175	Factory New	487.89	38	2025-02-20 23:40:51.601407+00	f
176	Minimal Wear	\N	38	\N	f
177	Factory New	693.07	39	2025-02-20 23:40:29.021908+00	f
178	Minimal Wear	\N	39	\N	f
179	Field-Tested	343.58	39	2025-02-20 23:40:29.025908+00	f
180	Well-Worn	369.6	39	2025-02-20 23:40:29.030908+00	f
181	Battle-Scarred	\N	39	\N	f
182	Factory New	77.63	40	2025-02-20 23:40:16.820283+00	f
183	Minimal Wear	76.58	40	2025-02-20 23:40:16.83028+00	f
184	Field-Tested	74.28	40	2025-02-20 23:40:16.82528+00	f
185	Well-Worn	70.31	40	2025-02-20 23:40:16.83428+00	f
186	Battle-Scarred	75.4	40	2025-02-20 23:40:16.81728+00	f
187	Factory New	78.33	41	2025-02-20 23:40:16.370448+00	f
188	Minimal Wear	93.68	41	2025-02-20 23:40:16.379449+00	f
189	Field-Tested	89.44	41	2025-02-20 23:40:16.373447+00	f
190	Well-Worn	\N	41	\N	f
191	Battle-Scarred	\N	41	\N	f
192	Factory New	78.02	42	2025-02-20 23:40:53.359958+00	f
193	Minimal Wear	76.89	42	2025-02-20 23:40:53.380513+00	f
194	Field-Tested	78.34	42	2025-02-20 23:40:53.370512+00	f
195	Factory New	21	43	2025-02-20 23:40:22.116437+00	f
196	Minimal Wear	22.92	43	2025-02-20 23:40:22.123437+00	f
197	Field-Tested	20.53	43	2025-02-20 23:40:22.119437+00	f
198	Well-Worn	\N	43	\N	f
199	Battle-Scarred	27.27	43	2025-02-15 18:56:26.849551+00	f
200	Factory New	22.98	44	2025-02-20 23:40:11.138336+00	f
201	Minimal Wear	22.94	44	2025-02-20 23:40:11.149416+00	f
202	Field-Tested	22.82	44	2025-02-20 23:40:11.142423+00	f
203	Well-Worn	178.41	44	2025-02-15 19:04:17.922401+00	f
204	Factory New	21.63	45	2025-02-20 23:40:10.85853+00	f
205	Minimal Wear	18.95	45	2025-02-20 23:40:10.86553+00	f
206	Field-Tested	28.26	45	2025-02-15 19:04:40.093939+00	f
207	Well-Worn	30.6	45	2025-02-20 23:40:10.86953+00	f
208	Battle-Scarred	41.24	45	2025-02-20 23:40:10.854014+00	f
209	Factory New	21.36	46	2025-02-20 23:40:23.35964+00	f
210	Minimal Wear	27.2	46	2025-02-20 23:40:23.370641+00	f
211	Field-Tested	23.66	46	2025-02-20 23:40:23.365641+00	f
212	Well-Worn	37.51	46	2025-02-20 23:40:23.374641+00	f
213	Battle-Scarred	\N	46	\N	f
214	Factory New	4.6	47	2025-02-20 23:40:20.546562+00	f
215	Minimal Wear	4.59	47	2025-02-20 23:40:20.574886+00	f
216	Field-Tested	4.6	47	2025-02-20 23:40:20.55856+00	f
217	Well-Worn	6.94	47	2025-02-20 23:40:20.585882+00	f
218	Battle-Scarred	8.6	47	2025-02-20 23:40:20.539561+00	f
219	Factory New	4.63	48	2025-02-20 23:40:14.17572+00	f
220	Minimal Wear	4.39	48	2025-02-20 23:40:14.198724+00	f
221	Field-Tested	4.37	48	2025-02-20 23:40:14.19272+00	f
222	Well-Worn	4.55	48	2025-02-20 23:40:14.209721+00	f
223	Battle-Scarred	\N	48	\N	f
224	Factory New	4.54	49	2025-02-20 23:40:02.035376+00	f
225	Minimal Wear	4.54	49	2025-02-20 23:40:02.046994+00	f
226	Field-Tested	4.49	49	2025-02-20 23:40:02.040996+00	f
227	Well-Worn	5.92	49	2025-02-20 23:40:02.050999+00	f
228	Battle-Scarred	\N	49	\N	f
229	Factory New	4.54	50	2025-02-20 23:40:09.971036+00	f
230	Minimal Wear	4.22	50	2025-02-20 23:40:09.991033+00	f
231	Field-Tested	4.72	50	2025-02-20 23:40:09.982032+00	f
232	Well-Worn	16.52	50	2025-02-20 23:40:10.001556+00	f
233	Battle-Scarred	5.41	50	2025-02-15 19:05:03.059262+00	f
234	Factory New	0.7	51	2025-02-20 23:40:28.240575+00	f
235	Minimal Wear	0.69	51	2025-02-20 23:40:28.267574+00	f
236	Field-Tested	0.67	51	2025-02-20 23:40:28.255577+00	f
237	Well-Worn	1.32	51	2025-02-20 23:40:28.276575+00	f
238	Battle-Scarred	0.93	51	2025-02-20 23:40:28.233575+00	f
239	Factory New	0.71	52	2025-02-20 23:40:19.420479+00	f
240	Minimal Wear	0.7	52	2025-02-20 23:40:19.43148+00	f
241	Field-Tested	0.75	52	2025-02-20 23:40:19.42448+00	f
242	Well-Worn	0.75	52	2025-02-20 23:40:19.43548+00	f
243	Battle-Scarred	3.69	52	2025-02-20 23:40:19.416481+00	f
244	Factory New	0.73	53	2025-02-20 23:40:26.709515+00	f
245	Minimal Wear	0.7	53	2025-02-20 23:40:26.720513+00	f
246	Field-Tested	0.67	53	2025-02-20 23:40:26.716513+00	f
247	Well-Worn	0.79	53	2025-02-20 23:40:26.735512+00	f
248	Battle-Scarred	0.77	53	2025-02-20 23:40:26.696798+00	f
249	Factory New	0.71	54	2025-02-20 23:40:30.98834+00	f
250	Minimal Wear	0.69	54	2025-02-20 23:40:31.006761+00	f
251	Field-Tested	0.68	54	2025-02-20 23:40:30.997761+00	f
252	Well-Worn	0.72	54	2025-02-20 23:40:31.016512+00	f
253	Battle-Scarred	1.69	54	2025-02-20 23:40:30.980341+00	f
254	Factory New	0.73	55	2025-02-20 23:40:24.550036+00	f
255	Minimal Wear	0.78	55	2025-02-20 23:40:24.558037+00	f
256	Field-Tested	0.72	55	2025-02-20 23:40:24.554037+00	f
257	Well-Worn	0.69	55	2025-02-20 23:40:24.562037+00	f
258	Battle-Scarred	1.72	55	2025-02-20 23:40:24.545038+00	f
259	Factory New	2450.52	56	2025-02-20 23:40:03.140302+00	f
260	Minimal Wear	2200.14	56	2025-02-20 23:40:03.165268+00	f
261	Field-Tested	1716.92	56	2025-02-20 23:40:03.149303+00	f
262	Well-Worn	1588.76	56	2025-02-20 23:40:03.175231+00	f
263	Battle-Scarred	1351.25	56	2025-02-20 23:40:03.127303+00	f
264	Factory New	387.45	57	2025-02-20 23:40:18.739829+00	f
265	Minimal Wear	340.03	57	2025-02-20 23:40:18.757829+00	f
266	Field-Tested	308.33	57	2025-02-20 23:40:18.745831+00	f
267	Well-Worn	\N	57	\N	f
268	Battle-Scarred	473.08	57	2025-02-20 23:40:18.736829+00	f
269	Factory New	388.74	58	2025-02-20 23:40:04.949191+00	f
270	Minimal Wear	359.96	58	2025-02-20 23:40:04.956192+00	f
271	Field-Tested	426.95	58	2025-02-20 23:40:04.952191+00	f
272	Well-Worn	\N	58	\N	f
273	Battle-Scarred	\N	58	\N	f
274	Factory New	73.15	59	2025-02-20 23:40:13.134308+00	f
275	Minimal Wear	60.02	59	2025-02-20 23:40:13.16555+00	f
276	Field-Tested	59.07	59	2025-02-20 23:40:13.150014+00	f
277	Well-Worn	61.8	59	2025-02-20 23:40:13.173601+00	f
278	Battle-Scarred	59.07	59	2025-02-20 23:40:13.086306+00	f
279	Factory New	70.28	60	2025-02-20 23:40:01.981859+00	f
280	Minimal Wear	62.26	60	2025-02-20 23:40:01.995859+00	f
281	Field-Tested	58.77	60	2025-02-20 23:40:01.99086+00	f
282	Well-Worn	90.05	60	2025-02-20 23:40:02.001859+00	f
283	Battle-Scarred	\N	60	\N	f
284	Factory New	70.12	61	2025-02-20 23:40:54.349548+00	f
285	Minimal Wear	72.12	61	2025-02-20 23:40:54.365546+00	f
286	Field-Tested	87.34	61	2025-02-20 23:40:54.356547+00	f
287	Factory New	19.31	62	2025-02-20 23:40:20.508439+00	f
288	Minimal Wear	18.28	62	2025-02-20 23:40:20.530564+00	f
289	Field-Tested	15.44	62	2025-02-20 23:40:20.516508+00	f
290	Well-Worn	\N	62	\N	f
291	Battle-Scarred	20.27	62	2025-02-15 18:57:35.18569+00	f
292	Factory New	20.25	63	2025-02-20 23:40:53.577054+00	f
293	Minimal Wear	22.63	63	2025-02-20 23:40:53.594054+00	f
294	Field-Tested	18.96	63	2025-02-20 23:40:53.582054+00	f
295	Well-Worn	23.39	63	2025-02-20 23:40:53.598715+00	f
296	Battle-Scarred	38.07	63	2025-02-20 23:40:53.572055+00	f
297	Factory New	17.98	64	2025-02-20 23:40:13.878304+00	f
298	Minimal Wear	15.63	64	2025-02-20 23:40:13.891302+00	f
299	Field-Tested	18.48	64	2025-02-20 23:40:13.882302+00	f
300	Well-Worn	22.28	64	2025-02-15 19:02:29.631089+00	f
301	Battle-Scarred	19.94	64	2025-02-15 19:02:30.134809+00	f
302	Factory New	17.7	65	2025-02-20 23:40:28.469524+00	f
303	Minimal Wear	15.82	65	2025-02-20 23:40:28.476524+00	f
304	Field-Tested	15.49	65	2025-02-20 23:40:28.472524+00	f
305	Well-Worn	\N	65	\N	f
306	Battle-Scarred	19.8	65	2025-02-20 23:40:28.465524+00	f
307	Factory New	4.13	66	2025-02-20 23:40:07.22471+00	f
308	Minimal Wear	3.85	66	2025-02-20 23:40:07.24071+00	f
309	Field-Tested	3.64	66	2025-02-20 23:40:07.233711+00	f
310	Well-Worn	3.71	66	2025-02-20 23:40:07.253392+00	f
311	Battle-Scarred	4.4	66	2025-02-20 23:40:07.219709+00	f
312	Factory New	3.55	67	2025-02-20 23:40:04.306627+00	f
313	Minimal Wear	3.66	67	2025-02-20 23:40:04.316626+00	f
314	Field-Tested	3.64	67	2025-02-20 23:40:04.311629+00	f
315	Well-Worn	3.74	67	2025-02-20 23:40:04.320626+00	f
316	Battle-Scarred	\N	67	\N	f
317	Factory New	3.68	68	2025-02-20 23:40:25.247241+00	f
318	Minimal Wear	3.58	68	2025-02-20 23:40:25.255241+00	f
319	Field-Tested	3.76	68	2025-02-20 23:40:25.25124+00	f
320	Well-Worn	4.19	68	2025-02-20 23:40:25.259241+00	f
321	Battle-Scarred	\N	68	\N	f
322	Factory New	3.77	69	2025-02-20 23:40:06.027973+00	f
323	Minimal Wear	3.89	69	2025-02-20 23:40:06.054968+00	f
324	Field-Tested	3.58	69	2025-02-20 23:40:06.045968+00	f
325	Well-Worn	4.3	69	2025-02-20 23:40:06.067484+00	f
326	Battle-Scarred	4.44	69	2025-02-20 23:40:06.009448+00	f
327	Factory New	0.57	70	2025-02-20 23:40:17.449889+00	f
328	Minimal Wear	0.55	70	2025-02-20 23:40:17.457761+00	f
329	Field-Tested	0.53	70	2025-02-20 23:40:17.45389+00	f
330	Well-Worn	1.69	70	2025-02-20 23:40:17.463761+00	f
331	Battle-Scarred	0.65	70	2025-02-20 23:40:17.44689+00	f
332	Factory New	0.57	71	2025-02-20 23:40:18.089628+00	f
333	Minimal Wear	0.53	71	2025-02-20 23:40:18.098629+00	f
334	Field-Tested	0.54	71	2025-02-20 23:40:18.095629+00	f
335	Well-Worn	0.63	71	2025-02-20 23:40:18.103629+00	f
336	Battle-Scarred	0.58	71	2025-02-20 23:40:18.084923+00	f
337	Factory New	0.58	72	2025-02-20 23:40:25.313309+00	f
338	Minimal Wear	0.56	72	2025-02-20 23:40:25.321821+00	f
339	Field-Tested	0.54	72	2025-02-20 23:40:25.31782+00	f
340	Well-Worn	0.54	72	2025-02-15 23:05:35.078061+00	f
341	Battle-Scarred	0.55	72	2025-02-20 23:40:25.308309+00	f
342	Factory New	0.6	73	2025-02-20 23:40:23.626637+00	f
343	Minimal Wear	0.56	73	2025-02-20 23:40:23.636637+00	f
344	Field-Tested	0.55	73	2025-02-20 23:40:23.631637+00	f
345	Well-Worn	0.55	73	2025-02-20 23:40:23.641589+00	f
346	Factory New	0.56	74	2025-02-20 23:40:29.613182+00	f
347	Minimal Wear	0.54	74	2025-02-20 23:40:29.630184+00	f
348	Field-Tested	0.53	74	2025-02-20 23:40:29.620183+00	f
349	Well-Worn	0.54	74	2025-02-20 23:40:29.64011+00	f
350	Battle-Scarred	0.58	74	2025-02-20 23:40:29.604888+00	f
351	Factory New	292.4	75	2025-02-20 23:40:16.476679+00	f
352	Minimal Wear	86.66	75	2025-02-20 23:40:16.485725+00	f
353	Field-Tested	32.04	75	2025-02-20 23:40:16.481725+00	f
354	Well-Worn	16.27	75	2025-02-20 23:40:16.489724+00	f
355	Battle-Scarred	13.77	75	2025-02-20 23:40:16.472689+00	f
356	Factory New	79.78	76	2025-02-20 23:40:12.568153+00	f
357	Minimal Wear	67.62	76	2025-02-20 23:40:12.60747+00	f
358	Field-Tested	61.36	76	2025-02-20 23:40:12.588881+00	f
359	Well-Worn	68.54	76	2025-02-20 23:40:12.614469+00	f
360	Battle-Scarred	77.99	76	2025-02-20 23:40:12.555152+00	f
361	Factory New	243.42	77	2025-02-20 23:40:53.920406+00	f
362	Minimal Wear	54.7	77	2025-02-20 23:40:53.940406+00	f
363	Field-Tested	35.35	77	2025-02-20 23:40:53.933407+00	f
364	Well-Worn	30.99	77	2025-02-20 23:40:53.952407+00	f
365	Battle-Scarred	31.58	77	2025-02-20 23:40:53.913407+00	f
366	Factory New	41.87	78	2025-02-20 23:40:08.060001+00	f
367	Minimal Wear	36.78	78	2025-02-20 23:40:08.126+00	f
368	Field-Tested	35.29	78	2025-02-20 23:40:08.082001+00	f
369	Well-Worn	55.48	78	2025-02-20 23:40:08.131996+00	f
370	Factory New	43.61	79	2025-02-20 23:40:17.349889+00	f
371	Minimal Wear	35.15	79	2025-02-20 23:40:17.357889+00	f
372	Field-Tested	44.36	79	2025-02-20 23:40:17.353889+00	f
373	Well-Worn	40.34	79	2025-02-20 23:40:17.36289+00	f
374	Battle-Scarred	45	79	2025-02-20 23:40:17.345891+00	f
375	Factory New	9.61	80	2025-02-20 23:40:04.463398+00	f
376	Minimal Wear	5.8	80	2025-02-20 23:40:04.473596+00	f
377	Field-Tested	4.36	80	2025-02-20 23:40:04.469596+00	f
378	Well-Worn	11.08	80	2025-02-20 23:40:04.478598+00	f
379	Battle-Scarred	4.32	80	2025-02-20 23:40:04.459398+00	f
380	Factory New	8.02	81	2025-02-20 23:40:23.146082+00	f
381	Minimal Wear	6.16	81	2025-02-20 23:40:23.159561+00	f
382	Field-Tested	4.74	81	2025-02-20 23:40:23.153562+00	f
383	Well-Worn	4.31	81	2025-02-20 23:40:23.166561+00	f
384	Battle-Scarred	5.88	81	2025-02-20 23:40:23.140083+00	f
385	Factory New	8.69	82	2025-02-20 23:40:18.468657+00	f
386	Minimal Wear	7.23	82	2025-02-20 23:40:18.475657+00	f
387	Field-Tested	4.44	82	2025-02-20 23:40:18.472658+00	f
388	Well-Worn	4.94	82	2025-02-20 23:40:18.481658+00	f
389	Battle-Scarred	5.02	82	2025-02-20 23:40:18.463657+00	f
390	Factory New	8.75	83	2025-02-20 23:40:03.766781+00	f
391	Minimal Wear	6.55	83	2025-02-20 23:40:03.775783+00	f
392	Field-Tested	5.27	83	2025-02-20 23:40:03.771782+00	f
393	Well-Worn	6.72	83	2025-02-20 23:40:03.781784+00	f
394	Factory New	8.83	84	2025-02-20 23:40:22.163485+00	f
395	Minimal Wear	6.06	84	2025-02-20 23:40:22.171485+00	f
396	Field-Tested	4.4	84	2025-02-20 23:40:22.167486+00	f
397	Well-Worn	7.56	84	2025-02-15 23:05:33.559577+00	f
398	Factory New	2.16	85	2025-02-20 23:40:05.433611+00	f
399	Minimal Wear	1.66	85	2025-02-20 23:40:05.442445+00	f
400	Field-Tested	1.63	85	2025-02-20 23:40:05.438446+00	f
401	Well-Worn	2.67	85	2025-02-20 23:40:05.449445+00	f
402	Battle-Scarred	1.58	85	2025-02-20 23:40:05.424441+00	f
403	Factory New	2.7	86	2025-02-20 23:40:15.225552+00	f
404	Minimal Wear	1.87	86	2025-02-20 23:40:15.236553+00	f
405	Field-Tested	1.18	86	2025-02-20 23:40:15.232552+00	f
406	Well-Worn	2.94	86	2025-02-20 23:40:15.239553+00	f
407	Battle-Scarred	1.42	86	2025-02-20 23:40:15.221552+00	f
408	Factory New	1.66	87	2025-02-20 23:40:26.483572+00	f
409	Minimal Wear	3.16	87	2025-02-20 23:40:26.491572+00	f
410	Factory New	1.72	88	2025-02-20 23:40:29.820959+00	f
411	Minimal Wear	1.48	88	2025-02-20 23:40:29.838095+00	f
412	Field-Tested	1.25	88	2025-02-20 23:40:29.83096+00	f
413	Well-Worn	1.6	88	2025-02-20 23:40:29.846413+00	f
414	Battle-Scarred	1.61	88	2025-02-20 23:40:29.813961+00	f
415	Factory New	1.45	89	2025-02-20 23:40:51.630407+00	f
416	Minimal Wear	1.07	89	2025-02-20 23:40:51.639411+00	f
417	Field-Tested	1.11	89	2025-02-20 23:40:51.635408+00	f
418	Well-Worn	4.98	89	2025-02-20 23:40:51.644407+00	f
419	Battle-Scarred	1.35	89	2025-02-20 23:40:51.625407+00	f
420	Factory New	1.38	90	2025-02-20 23:40:01.386076+00	f
421	Minimal Wear	1.31	90	2025-02-20 23:40:01.395966+00	f
422	Field-Tested	1.23	90	2025-02-20 23:40:01.390076+00	f
423	Well-Worn	4.95	90	2025-02-20 23:40:01.400964+00	f
424	Factory New	2.25	91	2025-02-20 23:40:50.053638+00	f
425	Minimal Wear	1.46	91	2025-02-20 23:40:50.072632+00	f
426	Field-Tested	1.4	91	2025-02-20 23:40:50.059632+00	f
427	Well-Worn	1.77	91	2025-02-20 23:40:50.088633+00	f
428	Battle-Scarred	1.79	91	2025-02-20 23:40:50.033444+00	f
429	Factory New	1736.41	92	2025-02-20 23:40:15.391302+00	f
430	Minimal Wear	1313.69	92	2025-02-20 23:40:15.401302+00	f
431	Field-Tested	784.03	92	2025-02-20 23:40:15.397302+00	f
432	Well-Worn	\N	92	\N	f
433	Battle-Scarred	740.84	92	2025-02-20 23:40:15.386302+00	f
434	Factory New	285.18	93	2025-02-20 23:40:09.31138+00	f
435	Minimal Wear	210.28	93	2025-02-20 23:40:09.321144+00	f
436	Field-Tested	\N	93	\N	f
437	Well-Worn	\N	93	\N	f
438	Battle-Scarred	\N	93	\N	f
439	Factory New	258.72	94	2025-02-20 23:40:28.550927+00	f
440	Minimal Wear	\N	94	\N	f
441	Field-Tested	192.12	94	2025-02-20 23:40:28.554927+00	f
442	Well-Worn	\N	94	\N	f
443	Battle-Scarred	\N	94	\N	f
444	Factory New	85.75	95	2025-02-20 23:40:11.204416+00	f
445	Minimal Wear	73.46	95	2025-02-15 23:05:29.046463+00	f
446	Field-Tested	68.4	95	2025-02-20 23:40:11.209416+00	f
447	Well-Worn	87.53	95	2025-02-20 23:40:11.215416+00	f
448	Battle-Scarred	\N	95	\N	f
449	Factory New	50.33	96	2025-02-20 23:40:23.610637+00	f
450	Minimal Wear	52.29	96	2025-02-20 23:40:23.616638+00	f
451	Field-Tested	\N	96	\N	f
452	Well-Worn	67.27	96	2025-02-20 23:40:23.621637+00	f
453	Battle-Scarred	\N	96	\N	f
454	Factory New	48.65	97	2025-02-20 23:40:18.171461+00	f
455	Minimal Wear	54.49	97	2025-02-20 23:40:18.185122+00	f
456	Field-Tested	52.64	97	2025-02-15 23:05:31.905895+00	f
457	Factory New	30.22	98	2025-02-20 23:40:00.242305+00	f
458	Minimal Wear	22.55	98	2025-02-20 23:40:00.25667+00	f
459	Field-Tested	20.23	98	2025-02-20 23:40:00.250713+00	f
460	Well-Worn	37.57	98	2025-02-20 23:40:00.266185+00	f
461	Factory New	15.39	99	2025-02-20 23:40:21.326835+00	f
462	Minimal Wear	18.55	99	2025-02-20 23:40:21.335836+00	f
463	Field-Tested	20.36	99	2025-02-20 23:40:21.331835+00	f
464	Well-Worn	17.3	99	2025-02-15 18:56:53.351821+00	f
465	Battle-Scarred	20.99	99	2025-02-15 18:56:53.887253+00	f
466	Factory New	15.47	100	2025-02-20 23:40:21.880552+00	f
467	Minimal Wear	17.29	100	2025-02-20 23:40:21.889063+00	f
468	Field-Tested	14.88	100	2025-02-20 23:40:21.885063+00	f
469	Well-Worn	21.79	100	2025-02-20 23:40:21.893065+00	f
470	Battle-Scarred	\N	100	\N	f
471	Factory New	21.18	101	2025-02-20 23:40:24.988517+00	f
472	Minimal Wear	15.84	101	2025-02-20 23:40:24.998516+00	f
473	Field-Tested	20.22	101	2025-02-20 23:40:24.992516+00	f
474	Well-Worn	\N	101	\N	f
475	Battle-Scarred	\N	101	\N	f
476	Factory New	5.02	102	2025-02-20 23:40:13.256385+00	f
477	Minimal Wear	5.34	102	2025-02-20 23:40:13.267386+00	f
478	Field-Tested	5.8	102	2025-02-20 23:40:13.261387+00	f
479	Well-Worn	7.82	102	2025-02-20 23:40:13.271386+00	f
480	Battle-Scarred	6.9	102	2025-02-15 23:05:29.698705+00	f
481	Factory New	15.04	103	2025-02-20 23:40:51.808589+00	f
482	Minimal Wear	4.41	103	2025-02-20 23:40:51.831591+00	f
483	Field-Tested	4.56	103	2025-02-20 23:40:51.817591+00	f
484	Well-Worn	4.53	103	2025-02-20 23:40:51.838589+00	f
485	Battle-Scarred	6.09	103	2025-02-20 23:40:51.801591+00	f
486	Factory New	4.92	104	2025-02-20 23:40:29.000908+00	f
487	Minimal Wear	5.76	104	2025-02-20 23:40:29.005909+00	f
488	Factory New	11.86	105	2025-02-20 23:40:25.419396+00	f
489	Minimal Wear	4.4	105	2025-02-15 23:05:35.134513+00	f
490	Field-Tested	4.9	105	2025-02-20 23:40:25.422396+00	f
491	Well-Worn	5.17	105	2025-02-15 18:53:15.576321+00	f
492	Factory New	1.27	106	2025-02-20 23:40:04.17473+00	f
493	Minimal Wear	0.81	106	2025-02-20 23:40:04.185731+00	f
494	Field-Tested	0.63	106	2025-02-20 23:40:04.17973+00	f
495	Well-Worn	13.02	106	2025-02-20 23:40:04.188731+00	f
496	Battle-Scarred	0.75	106	2025-02-20 23:40:04.170729+00	f
497	Factory New	1.36	107	2025-02-20 23:40:17.503992+00	f
498	Minimal Wear	0.93	107	2025-02-20 23:40:17.513992+00	f
499	Field-Tested	0.77	107	2025-02-20 23:40:17.508992+00	f
500	Well-Worn	1.04	107	2025-02-20 23:40:17.516991+00	f
501	Battle-Scarred	1.33	107	2025-02-20 23:40:17.499992+00	f
502	Factory New	3.93	108	2025-02-20 23:40:54.18844+00	f
503	Minimal Wear	1.18	108	2025-02-20 23:40:54.204441+00	f
504	Field-Tested	44.36	108	2025-02-20 23:40:54.19744+00	f
505	Well-Worn	7.27	108	2025-02-20 23:40:54.214443+00	f
506	Battle-Scarred	9.52	108	2025-02-20 23:40:54.178439+00	f
507	Factory New	0.95	109	2025-02-20 23:40:06.641647+00	f
508	Minimal Wear	0.8	109	2025-02-20 23:40:06.658647+00	f
509	Field-Tested	0.68	109	2025-02-20 23:40:06.650648+00	f
510	Well-Worn	4.33	109	2025-02-20 23:40:06.671649+00	f
511	Battle-Scarred	1.34	109	2025-02-20 23:40:06.633646+00	f
512	Factory New	1.33	110	2025-02-20 23:40:07.679331+00	f
513	Minimal Wear	1.13	110	2025-02-20 23:40:07.69633+00	f
514	Field-Tested	1.06	110	2025-02-20 23:40:07.686331+00	f
515	Well-Worn	3.68	110	2025-02-20 23:40:07.70133+00	f
516	Battle-Scarred	6.59	110	2025-02-20 23:40:07.66933+00	f
517	Factory New	260.53	111	2025-02-20 23:40:08.536356+00	f
518	Minimal Wear	59.15	111	2025-02-20 23:40:08.554351+00	f
519	Field-Tested	24.95	111	2025-02-20 23:40:08.549351+00	f
520	Well-Worn	\N	111	\N	f
521	Battle-Scarred	14.03	111	2025-02-20 23:40:08.531351+00	f
522	Factory New	24.17	112	2025-02-20 23:40:27.444679+00	f
523	Minimal Wear	\N	112	\N	f
524	Factory New	\N	113	\N	f
525	Minimal Wear	23.12	113	2025-02-20 23:40:17.924983+00	f
526	Field-Tested	34.37	113	2025-02-20 23:40:17.919983+00	f
527	Well-Worn	\N	113	\N	f
528	Battle-Scarred	24.23	113	2025-02-20 23:40:17.915984+00	f
529	Factory New	26.46	114	2025-02-20 23:40:01.4488+00	f
530	Minimal Wear	72.97	114	2025-02-20 23:40:01.452593+00	f
531	Factory New	40.61	115	2025-02-15 18:52:49.765517+00	f
532	Minimal Wear	19.75	115	2025-02-15 18:52:49.540946+00	f
533	Field-Tested	16.29	115	2025-02-20 23:40:26.129663+00	f
534	Well-Worn	17.38	115	2025-02-20 23:40:26.134662+00	f
535	Battle-Scarred	15.95	115	2025-02-20 23:40:26.115662+00	f
536	Factory New	147	116	2025-02-15 19:03:03.554115+00	f
537	Minimal Wear	27.78	116	2025-02-20 23:40:13.337385+00	f
538	Field-Tested	6.12	116	2025-02-20 23:40:13.333386+00	f
539	Well-Worn	13.64	116	2025-02-15 19:03:03.131034+00	f
540	Battle-Scarred	8.34	116	2025-02-20 23:40:13.329387+00	f
541	Factory New	55.03	117	2025-02-20 23:40:21.418976+00	f
542	Minimal Wear	7.45	117	2025-02-20 23:40:21.425976+00	f
543	Field-Tested	5.19	117	2025-02-20 23:40:21.421976+00	f
544	Well-Worn	14.12	117	2025-02-20 23:40:21.431985+00	f
545	Battle-Scarred	\N	117	\N	f
546	Factory New	47.49	118	2025-02-15 18:43:03.23971+00	f
547	Minimal Wear	8.88	118	2025-02-20 23:40:29.484918+00	f
548	Field-Tested	5.96	118	2025-02-20 23:40:29.480262+00	f
549	Well-Worn	8.9	118	2025-02-15 23:05:36.858535+00	f
550	Battle-Scarred	5.68	118	2025-02-15 18:43:03.381273+00	f
551	Factory New	\N	119	\N	f
552	Minimal Wear	6.52	119	2025-02-20 23:40:30.792183+00	f
553	Field-Tested	5.27	119	2025-02-20 23:40:30.784359+00	f
554	Well-Worn	100.26	119	2025-02-20 23:40:30.799182+00	f
555	Battle-Scarred	5.53	119	2025-02-20 23:40:30.772491+00	f
556	Factory New	24.3	120	2025-02-20 23:40:23.692767+00	f
557	Minimal Wear	15.84	120	2025-02-15 23:05:34.208848+00	f
558	Field-Tested	5.07	120	2025-02-15 18:54:59.05471+00	f
559	Well-Worn	\N	120	\N	f
560	Battle-Scarred	7.99	120	2025-02-15 18:54:59.166302+00	f
561	Factory New	\N	121	\N	f
562	Minimal Wear	5.22	121	2025-02-20 23:40:19.974114+00	f
563	Field-Tested	3.78	121	2025-02-20 23:40:19.960115+00	f
564	Well-Worn	5.95	121	2025-02-20 23:40:19.980267+00	f
565	Battle-Scarred	5.52	121	2025-02-20 23:40:19.955131+00	f
566	Factory New	78.95	122	2025-02-20 23:40:54.596332+00	f
567	Minimal Wear	7.69	122	2025-02-20 23:40:54.601332+00	f
568	Field-Tested	6.57	122	2025-02-15 23:05:46.116857+00	f
569	Well-Worn	11.27	122	2025-02-20 23:40:54.606331+00	f
570	Battle-Scarred	\N	122	\N	f
571	Factory New	48.26	123	2025-02-15 18:58:26.024382+00	f
572	Minimal Wear	7.45	123	2025-02-20 23:40:19.187608+00	f
573	Field-Tested	3.9	123	2025-02-20 23:40:19.183608+00	f
574	Well-Worn	7.25	123	2025-02-15 23:05:32.389786+00	f
575	Battle-Scarred	6.99	123	2025-02-15 18:58:26.146681+00	f
576	Factory New	101.22	124	2025-02-15 18:05:43.258926+00	f
577	Minimal Wear	8.47	124	2025-02-20 23:40:50.726928+00	f
578	Field-Tested	4.09	124	2025-02-20 23:40:50.716245+00	f
579	Well-Worn	22.02	124	2025-02-20 23:40:50.755716+00	f
580	Battle-Scarred	5.12	124	2025-02-20 23:40:50.697676+00	f
581	Factory New	29.43	125	2025-02-20 23:40:14.07817+00	f
582	Minimal Wear	5.09	125	2025-02-20 23:40:14.106187+00	f
583	Field-Tested	2.96	125	2025-02-20 23:40:14.092561+00	f
584	Well-Worn	5.92	125	2025-02-20 23:40:14.121784+00	f
585	Battle-Scarred	3.7	125	2025-02-20 23:40:14.072991+00	f
586	Factory New	9.32	126	2025-02-20 23:40:08.920009+00	f
587	Minimal Wear	13.54	126	2025-02-20 23:40:08.934011+00	f
588	Factory New	2354.58	127	2025-02-20 23:40:15.714344+00	f
589	Minimal Wear	1759.1	127	2025-02-20 23:40:15.722344+00	f
590	Field-Tested	1079.43	127	2025-02-20 23:40:15.718343+00	f
591	Well-Worn	686.55	127	2025-02-20 23:40:15.726343+00	f
592	Battle-Scarred	619.02	127	2025-02-20 23:40:15.708343+00	f
593	Factory New	338.18	128	2025-02-20 23:40:00.933132+00	f
594	Minimal Wear	260.54	128	2025-02-20 23:40:00.948758+00	f
595	Field-Tested	203.21	128	2025-02-20 23:40:00.939025+00	f
596	Well-Worn	180.59	128	2025-02-20 23:40:00.954534+00	f
597	Battle-Scarred	251.58	128	2025-02-15 23:05:25.291701+00	f
598	Factory New	257.39	129	2025-02-20 23:40:24.928543+00	f
599	Minimal Wear	384.38	129	2025-02-20 23:40:24.936542+00	f
600	Field-Tested	212.89	129	2025-02-20 23:40:24.93254+00	f
601	Well-Worn	\N	129	\N	f
602	Battle-Scarred	147.85	129	2025-02-20 23:40:24.923541+00	f
603	Factory New	60.41	130	2025-02-20 23:40:16.986838+00	f
604	Minimal Wear	53.99	130	2025-02-20 23:40:16.996838+00	f
605	Field-Tested	41.35	130	2025-02-20 23:40:16.991839+00	f
606	Well-Worn	\N	130	\N	f
607	Battle-Scarred	57.9	130	2025-02-20 23:40:16.982839+00	f
608	Factory New	53.58	131	2025-02-20 23:40:52.477603+00	f
609	Minimal Wear	73.78	131	2025-02-20 23:40:52.48667+00	f
610	Field-Tested	46.2	131	2025-02-20 23:40:52.48268+00	f
611	Well-Worn	56.93	131	2025-02-20 23:40:52.49167+00	f
612	Factory New	47.5	132	2025-02-20 23:40:53.961406+00	f
613	Minimal Wear	50.83	132	2025-02-20 23:40:53.981406+00	f
614	Field-Tested	41.25	132	2025-02-20 23:40:53.971407+00	f
615	Well-Worn	69.79	132	2025-02-20 23:40:53.99125+00	f
616	Battle-Scarred	\N	132	\N	f
617	Factory New	19.11	133	2025-02-20 23:40:11.46821+00	f
618	Minimal Wear	17.28	133	2025-02-20 23:40:11.478213+00	f
619	Field-Tested	16.64	133	2025-02-20 23:40:11.473209+00	f
620	Well-Worn	23	133	2025-02-15 19:04:10.936025+00	f
621	Battle-Scarred	18.76	133	2025-02-20 23:40:11.46221+00	f
622	Factory New	14.16	134	2025-02-20 23:40:01.52837+00	f
623	Minimal Wear	15.42	134	2025-02-20 23:40:01.537424+00	f
624	Field-Tested	20	134	2025-02-20 23:40:01.532347+00	f
625	Factory New	14.33	135	2025-02-20 23:40:49.439425+00	f
626	Minimal Wear	15.31	135	2025-02-20 23:40:49.449425+00	f
627	Field-Tested	15.03	135	2025-02-20 23:40:49.444426+00	f
628	Well-Worn	17.83	135	2025-02-15 18:06:12.565177+00	f
629	Battle-Scarred	24.04	135	2025-02-15 18:06:13.01262+00	f
630	Minimal Wear	13.14	136	2025-02-20 23:40:07.466087+00	f
631	Field-Tested	16.08	136	2025-02-20 23:40:07.451087+00	f
632	Factory New	3.05	137	2025-02-20 23:40:04.428519+00	f
633	Minimal Wear	10.33	137	2025-02-20 23:40:04.43352+00	f
634	Factory New	3.45	138	2025-02-20 23:40:22.936723+00	f
635	Minimal Wear	3.6	138	2025-02-20 23:40:22.950883+00	f
636	Field-Tested	3.44	138	2025-02-20 23:40:22.942864+00	f
637	Well-Worn	13.02	138	2025-02-20 23:40:22.957519+00	f
638	Battle-Scarred	16.52	138	2025-02-20 23:40:22.925666+00	f
639	Factory New	3.29	139	2025-02-20 23:40:19.526071+00	f
640	Minimal Wear	3.15	139	2025-02-20 23:40:19.536071+00	f
641	Field-Tested	3.26	139	2025-02-20 23:40:19.531071+00	f
642	Well-Worn	\N	139	\N	f
643	Battle-Scarred	5.07	139	2025-02-20 23:40:19.522072+00	f
644	Factory New	4.35	140	2025-02-20 23:40:10.017928+00	f
645	Minimal Wear	3.38	140	2025-02-20 23:40:10.034925+00	f
646	Field-Tested	3.35	140	2025-02-20 23:40:10.025926+00	f
647	Well-Worn	3.64	140	2025-02-20 23:40:10.041743+00	f
648	Battle-Scarred	3.56	140	2025-02-20 23:40:10.009407+00	f
649	Factory New	63.98	141	2025-02-20 23:40:29.423699+00	f
650	Minimal Wear	0.6	141	2025-02-20 23:40:29.4327+00	f
651	Field-Tested	0.53	141	2025-02-20 23:40:29.4297+00	f
652	Well-Worn	0.59	141	2025-02-20 23:40:29.43726+00	f
653	Battle-Scarred	7.42	141	2025-02-20 23:40:29.418699+00	f
654	Factory New	8.59	142	2025-02-20 23:40:27.09824+00	f
655	Minimal Wear	0.65	142	2025-02-20 23:40:27.108247+00	f
656	Field-Tested	0.59	142	2025-02-20 23:40:27.104247+00	f
657	Well-Worn	0.57	142	2025-02-20 23:40:27.116248+00	f
658	Battle-Scarred	0.65	142	2025-02-20 23:40:27.084727+00	f
659	Factory New	0.7	143	2025-02-20 23:40:28.629722+00	f
660	Minimal Wear	0.85	143	2025-02-20 23:40:28.638593+00	f
661	Field-Tested	0.6	143	2025-02-20 23:40:28.633719+00	f
662	Well-Worn	5.09	143	2025-02-20 23:40:28.645592+00	f
663	Battle-Scarred	0.75	143	2025-02-20 23:40:28.624721+00	f
664	Factory New	0.77	144	2025-02-20 23:40:21.617761+00	f
665	Minimal Wear	0.66	144	2025-02-20 23:40:21.62576+00	f
666	Field-Tested	0.78	144	2025-02-20 23:40:21.62176+00	f
667	Factory New	564.67	145	2025-02-20 23:40:15.981798+00	f
668	Minimal Wear	369.24	145	2025-02-20 23:40:15.990798+00	f
669	Field-Tested	218.81	145	2025-02-20 23:40:15.986798+00	f
670	Well-Worn	177.41	145	2025-02-20 23:40:15.995798+00	f
671	Battle-Scarred	152.15	145	2025-02-20 23:40:15.976798+00	f
672	Factory New	75.83	146	2025-02-20 23:40:23.298609+00	f
673	Minimal Wear	48.6	146	2025-02-20 23:40:23.30961+00	f
674	Field-Tested	27.31	146	2025-02-20 23:40:23.303609+00	f
675	Well-Worn	22.29	146	2025-02-20 23:40:23.315611+00	f
676	Battle-Scarred	21.97	146	2025-02-20 23:40:23.293611+00	f
677	Factory New	103.92	147	2025-02-20 23:40:08.778287+00	f
678	Minimal Wear	72.43	147	2025-02-20 23:40:08.788288+00	f
679	Field-Tested	35.94	147	2025-02-20 23:40:08.784287+00	f
680	Well-Worn	37.49	147	2025-02-20 23:40:08.799295+00	f
681	Battle-Scarred	29.55	147	2025-02-20 23:40:08.769288+00	f
682	Factory New	10.05	148	2025-02-20 23:40:24.966+00	f
683	Minimal Wear	6.8	148	2025-02-20 23:40:24.975516+00	f
684	Field-Tested	4.24	148	2025-02-20 23:40:24.969999+00	f
685	Well-Worn	3.74	148	2025-02-20 23:40:24.984517+00	f
686	Battle-Scarred	3.75	148	2025-02-20 23:40:24.962001+00	f
687	Factory New	11.98	149	2025-02-20 23:40:22.238801+00	f
688	Minimal Wear	7.05	149	2025-02-20 23:40:22.2498+00	f
689	Field-Tested	4.02	149	2025-02-20 23:40:22.245802+00	f
690	Well-Worn	3.42	149	2025-02-20 23:40:22.2538+00	f
691	Battle-Scarred	3.16	149	2025-02-20 23:40:22.232905+00	f
692	Factory New	6.53	150	2025-02-20 23:40:02.715634+00	f
693	Minimal Wear	3.99	150	2025-02-20 23:40:02.736636+00	f
694	Field-Tested	2.95	150	2025-02-20 23:40:02.720634+00	f
695	Well-Worn	5.19	150	2025-02-20 23:40:02.741635+00	f
696	Battle-Scarred	3.95	150	2025-02-20 23:40:02.703634+00	f
697	Factory New	3.23	151	2025-02-20 23:40:01.18931+00	f
698	Minimal Wear	2.19	151	2025-02-20 23:40:01.20131+00	f
699	Field-Tested	1.72	151	2025-02-20 23:40:01.195311+00	f
700	Well-Worn	2.07	151	2025-02-20 23:40:01.20531+00	f
701	Battle-Scarred	1.86	151	2025-02-20 23:40:01.185309+00	f
702	Factory New	2.15	152	2025-02-20 23:40:49.764775+00	f
703	Minimal Wear	1.09	152	2025-02-20 23:40:49.773774+00	f
704	Field-Tested	0.56	152	2025-02-20 23:40:49.768774+00	f
705	Well-Worn	0.47	152	2025-02-20 23:40:49.778775+00	f
706	Battle-Scarred	0.4	152	2025-02-20 23:40:49.757774+00	f
707	Factory New	1.78	153	2025-02-20 23:40:17.803538+00	f
708	Minimal Wear	1	153	2025-02-20 23:40:17.812527+00	f
709	Field-Tested	0.56	153	2025-02-20 23:40:17.807525+00	f
710	Well-Worn	0.47	153	2025-02-20 23:40:17.816526+00	f
711	Battle-Scarred	0.59	153	2025-02-20 23:40:17.799526+00	f
712	Factory New	1.18	154	2025-02-20 23:40:15.503525+00	f
713	Minimal Wear	0.34	154	2025-02-20 23:40:15.512525+00	f
714	Field-Tested	0.21	154	2025-02-20 23:40:15.507525+00	f
715	Well-Worn	0.54	154	2025-02-20 23:40:15.518526+00	f
716	Battle-Scarred	0.45	154	2025-02-20 23:40:15.499524+00	f
717	Factory New	0.65	155	2025-02-20 23:40:52.803547+00	f
718	Minimal Wear	0.32	155	2025-02-20 23:40:52.822548+00	f
719	Field-Tested	0.16	155	2025-02-20 23:40:52.814548+00	f
720	Well-Worn	0.16	155	2025-02-20 23:40:52.831548+00	f
721	Battle-Scarred	0.14	155	2025-02-20 23:40:52.796548+00	f
722	Factory New	0.48	156	2025-02-20 23:40:16.937408+00	f
723	Minimal Wear	0.3	156	2025-02-20 23:40:16.947406+00	f
724	Field-Tested	0.15	156	2025-02-20 23:40:16.942409+00	f
725	Well-Worn	0.32	156	2025-02-20 23:40:16.951407+00	f
726	Battle-Scarred	0.16	156	2025-02-20 23:40:16.933408+00	f
727	Factory New	0.54	157	2025-02-20 23:40:28.908304+00	f
728	Minimal Wear	0.3	157	2025-02-20 23:40:28.917304+00	f
729	Field-Tested	0.15	157	2025-02-20 23:40:28.913304+00	f
730	Well-Worn	0.16	157	2025-02-20 23:40:28.921305+00	f
731	Battle-Scarred	0.14	157	2025-02-20 23:40:28.903751+00	f
732	Factory New	0.13	158	2025-02-20 23:40:19.503401+00	f
733	Minimal Wear	0.05	158	2025-02-20 23:40:19.513072+00	f
734	Field-Tested	0.04	158	2025-02-20 23:40:19.50707+00	f
735	Well-Worn	0.04	158	2025-02-20 23:40:19.51707+00	f
736	Battle-Scarred	0.04	158	2025-02-20 23:40:19.499401+00	f
737	Factory New	0.15	159	2025-02-20 23:40:54.528299+00	f
738	Minimal Wear	0.05	159	2025-02-20 23:40:54.537297+00	f
739	Field-Tested	0.04	159	2025-02-20 23:40:54.533299+00	f
740	Well-Worn	0.04	159	2025-02-20 23:40:54.544334+00	f
741	Battle-Scarred	0.04	159	2025-02-20 23:40:54.523298+00	f
742	Factory New	0.12	160	2025-02-20 23:40:14.575395+00	f
743	Minimal Wear	0.05	160	2025-02-20 23:40:14.589396+00	f
744	Field-Tested	0.04	160	2025-02-20 23:40:14.582395+00	f
745	Well-Worn	0.08	160	2025-02-20 23:40:14.598376+00	f
746	Battle-Scarred	0.06	160	2025-02-20 23:40:14.552266+00	f
747	Factory New	0.12	161	2025-02-20 23:40:26.871566+00	f
748	Minimal Wear	0.06	161	2025-02-20 23:40:26.889563+00	f
749	Field-Tested	0.04	161	2025-02-20 23:40:26.884565+00	f
750	Well-Worn	0.08	161	2025-02-20 23:40:26.907563+00	f
751	Battle-Scarred	0.04	161	2025-02-20 23:40:26.86006+00	f
752	Factory New	0.11	162	2025-02-20 23:40:02.012862+00	f
753	Minimal Wear	0.06	162	2025-02-20 23:40:02.023376+00	f
754	Field-Tested	0.04	162	2025-02-20 23:40:02.018858+00	f
755	Well-Worn	0.09	162	2025-02-20 23:40:02.029376+00	f
756	Battle-Scarred	0.04	162	2025-02-20 23:40:02.007859+00	f
757	Factory New	1478.37	163	2025-02-20 23:40:12.505306+00	f
758	Minimal Wear	2069.71	163	2025-02-20 23:40:12.513306+00	f
759	Factory New	\N	164	\N	f
760	Minimal Wear	257.02	164	2025-02-20 23:40:19.774548+00	f
761	Field-Tested	101.31	164	2025-02-20 23:40:19.769544+00	f
762	Well-Worn	\N	164	\N	f
763	Battle-Scarred	89.56	164	2025-02-20 23:40:19.765542+00	f
764	Factory New	505.27	165	2025-02-20 23:40:01.735873+00	f
765	Minimal Wear	443.52	165	2025-02-20 23:40:01.739872+00	f
766	Factory New	357.78	166	2025-02-20 23:40:21.167377+00	f
767	Minimal Wear	\N	166	\N	f
768	Factory New	95.79	167	2025-02-20 23:40:09.029559+00	f
769	Minimal Wear	109.99	167	2025-02-20 23:40:09.057559+00	f
770	Field-Tested	117.36	167	2025-02-20 23:40:09.039566+00	f
771	Factory New	59.13	168	2025-02-20 23:40:51.402615+00	f
772	Minimal Wear	11.76	168	2025-02-20 23:40:51.425999+00	f
773	Field-Tested	9.91	168	2025-02-20 23:40:51.413991+00	f
774	Well-Worn	13.69	168	2025-02-20 23:40:51.435999+00	f
775	Battle-Scarred	17.27	168	2025-02-20 23:40:51.391252+00	f
776	Factory New	62.46	169	2025-02-20 23:40:28.751208+00	f
777	Minimal Wear	12.96	169	2025-02-20 23:40:28.762211+00	f
778	Field-Tested	9.87	169	2025-02-20 23:40:28.757207+00	f
779	Well-Worn	15.75	169	2025-02-15 18:46:28.938587+00	f
780	Battle-Scarred	11.42	169	2025-02-20 23:40:28.744209+00	f
781	Factory New	2.44	170	2025-02-20 23:40:49.819774+00	f
782	Minimal Wear	8.11	170	2025-02-15 23:05:44.812688+00	f
783	Factory New	143.68	171	2025-02-20 23:40:00.511591+00	f
784	Minimal Wear	13.72	171	2025-02-20 23:40:00.520589+00	f
785	Field-Tested	5.11	171	2025-02-20 23:40:00.515589+00	f
786	Well-Worn	11.55	171	2025-02-20 23:40:00.524589+00	f
787	Battle-Scarred	6.07	171	2025-02-20 23:40:00.50559+00	f
788	Factory New	91.58	172	2025-02-20 23:40:16.121803+00	f
789	Minimal Wear	15.44	172	2025-02-20 23:40:16.135319+00	f
790	Field-Tested	10.22	172	2025-02-20 23:40:16.125803+00	f
791	Well-Worn	27.32	172	2025-02-20 23:40:16.139318+00	f
792	Battle-Scarred	14.2	172	2025-02-20 23:40:16.116803+00	f
793	Factory New	68.5	173	2025-02-15 18:43:04.659646+00	f
794	Minimal Wear	7.08	173	2025-02-20 23:40:29.454261+00	f
795	Field-Tested	1.92	173	2025-02-20 23:40:29.44826+00	f
796	Well-Worn	2.84	173	2025-02-15 23:05:36.84001+00	f
797	Battle-Scarred	1.97	173	2025-02-20 23:40:29.442262+00	f
798	Factory New	35	174	2025-02-15 18:56:33.589817+00	f
799	Minimal Wear	4.78	174	2025-02-20 23:40:21.795886+00	f
800	Field-Tested	2.13	174	2025-02-20 23:40:21.790885+00	f
801	Well-Worn	7.9	174	2025-02-20 23:40:21.799885+00	f
802	Battle-Scarred	1.92	174	2025-02-20 23:40:21.786885+00	f
803	Factory New	\N	175	\N	f
804	Minimal Wear	5.92	175	2025-02-20 23:40:09.50803+00	f
805	Field-Tested	2.99	175	2025-02-20 23:40:09.503472+00	f
806	Well-Worn	4.56	175	2025-02-20 23:40:09.51303+00	f
807	Battle-Scarred	3.26	175	2025-02-20 23:40:09.499962+00	f
808	Factory New	941.78	176	2025-02-20 23:40:00.481589+00	f
809	Minimal Wear	423.54	176	2025-02-20 23:40:00.492589+00	f
810	Field-Tested	321.93	176	2025-02-20 23:40:00.48859+00	f
811	Well-Worn	331	176	2025-02-20 23:40:00.499589+00	f
812	Battle-Scarred	327.88	176	2025-02-20 23:40:00.475553+00	f
813	Factory New	159.74	177	2025-02-20 23:39:59.959079+00	f
814	Minimal Wear	115.1	177	2025-02-20 23:39:59.969079+00	f
815	Field-Tested	99	177	2025-02-20 23:39:59.965078+00	f
816	Well-Worn	86.94	177	2025-02-20 23:40:00.021059+00	f
817	Battle-Scarred	91.56	177	2025-02-20 23:39:59.954383+00	f
818	Factory New	158.23	178	2025-02-20 23:40:05.333407+00	f
819	Minimal Wear	96.1	178	2025-02-20 23:40:05.359524+00	f
820	Field-Tested	81.32	178	2025-02-20 23:40:05.342407+00	f
821	Well-Worn	82.42	178	2025-02-20 23:40:05.370039+00	f
822	Battle-Scarred	105.27	178	2025-02-15 23:05:27.357596+00	f
823	Factory New	55.08	179	2025-02-20 23:40:30.317055+00	f
824	Minimal Wear	45.69	179	2025-02-20 23:40:30.328118+00	f
825	Field-Tested	\N	179	\N	f
826	Well-Worn	\N	179	\N	f
827	Battle-Scarred	44.22	179	2025-02-15 23:05:37.095567+00	f
828	Factory New	58.85	180	2025-02-20 23:40:52.559704+00	f
829	Minimal Wear	47.98	180	2025-02-20 23:40:52.577698+00	f
830	Field-Tested	69.3	180	2025-02-20 23:40:52.569699+00	f
831	Well-Worn	41.43	180	2025-02-15 23:05:45.497138+00	f
832	Battle-Scarred	61.06	180	2025-02-20 23:40:52.554185+00	f
833	Factory New	85.28	181	2025-02-20 23:40:54.749538+00	f
834	Minimal Wear	49.9	181	2025-02-20 23:40:54.765648+00	f
835	Field-Tested	77.16	181	2025-02-20 23:40:54.758645+00	f
836	Well-Worn	\N	181	\N	f
837	Battle-Scarred	\N	181	\N	f
838	Factory New	24.03	182	2025-02-15 23:05:33.732195+00	f
839	Minimal Wear	28.84	182	2025-02-20 23:40:22.498013+00	f
840	Field-Tested	10.47	182	2025-02-20 23:40:22.492012+00	f
841	Well-Worn	10.72	182	2025-02-15 23:05:33.73923+00	f
842	Battle-Scarred	12.64	182	2025-02-20 23:40:22.488013+00	f
843	Factory New	20.71	183	2025-02-20 23:40:24.739565+00	f
844	Minimal Wear	11.23	183	2025-02-20 23:40:24.752371+00	f
845	Field-Tested	9.55	183	2025-02-20 23:40:24.746249+00	f
846	Well-Worn	9.73	183	2025-02-20 23:40:24.756251+00	f
847	Battle-Scarred	9.88	183	2025-02-20 23:40:24.735565+00	f
848	Factory New	21.94	184	2025-02-20 23:40:28.770015+00	f
849	Minimal Wear	13.78	184	2025-02-20 23:40:28.778016+00	f
850	Field-Tested	8.71	184	2025-02-20 23:40:28.774016+00	f
851	Well-Worn	11.16	184	2025-02-20 23:40:28.782015+00	f
852	Battle-Scarred	10.56	184	2025-02-15 23:05:36.577868+00	f
853	Factory New	30.44	185	2025-02-15 19:00:24.231893+00	f
854	Minimal Wear	21.06	185	2025-02-20 23:40:16.859875+00	f
855	Field-Tested	10.35	185	2025-02-15 19:00:24.09826+00	f
856	Well-Worn	12.22	185	2025-02-20 23:40:16.866875+00	f
857	Battle-Scarred	11.15	185	2025-02-15 19:00:24.361211+00	f
858	Factory New	100.33	186	2025-02-20 23:40:29.735122+00	f
859	Minimal Wear	10.32	186	2025-02-20 23:40:29.756279+00	f
860	Field-Tested	5.03	186	2025-02-20 23:40:29.744674+00	f
861	Well-Worn	6.09	186	2025-02-15 18:42:59.184127+00	f
862	Battle-Scarred	\N	186	\N	f
863	Factory New	11.99	187	2025-02-20 23:40:10.137612+00	f
864	Minimal Wear	3.59	187	2025-02-20 23:40:10.142612+00	f
865	Field-Tested	3.15	187	2025-02-15 23:05:28.754483+00	f
866	Well-Worn	20.91	187	2025-02-20 23:40:10.148612+00	f
867	Battle-Scarred	6.47	187	2025-02-15 19:04:47.850054+00	f
868	Factory New	5.7	188	2025-02-20 23:40:20.211017+00	f
869	Minimal Wear	4.1	188	2025-02-20 23:40:20.232017+00	f
870	Field-Tested	3.05	188	2025-02-20 23:40:20.217015+00	f
871	Well-Worn	\N	188	\N	f
872	Battle-Scarred	6.53	188	2025-02-20 23:40:20.179018+00	f
873	Factory New	8.88	189	2025-02-20 23:40:19.370636+00	f
874	Minimal Wear	5.63	189	2025-02-20 23:40:19.38166+00	f
875	Field-Tested	3.7	189	2025-02-20 23:40:19.374636+00	f
876	Well-Worn	69.35	189	2025-02-20 23:40:19.38666+00	f
877	Battle-Scarred	8.37	189	2025-02-20 23:40:19.366636+00	f
878	Factory New	6.94	190	2025-02-15 19:08:29.248194+00	f
879	Minimal Wear	5.48	190	2025-02-20 23:40:04.202626+00	f
880	Field-Tested	4.37	190	2025-02-20 23:40:04.199627+00	f
881	Well-Worn	21.94	190	2025-02-20 23:40:04.208626+00	f
882	Battle-Scarred	11.58	190	2025-02-20 23:40:04.192729+00	f
883	Factory New	1.54	191	2025-02-20 23:40:23.749768+00	f
884	Minimal Wear	1.1	191	2025-02-20 23:40:23.758768+00	f
885	Field-Tested	0.91	191	2025-02-20 23:40:23.754768+00	f
886	Well-Worn	2.12	191	2025-02-20 23:40:23.765767+00	f
887	Factory New	9.14	192	2025-02-20 23:39:59.910385+00	f
888	Minimal Wear	5.1	192	2025-02-20 23:39:59.919383+00	f
889	Field-Tested	3.47	192	2025-02-20 23:39:59.915385+00	f
890	Well-Worn	3.11	192	2025-02-20 23:39:59.924387+00	f
891	Battle-Scarred	2.89	192	2025-02-20 23:39:59.902383+00	f
892	Factory New	1.55	193	2025-02-20 23:40:12.129099+00	f
893	Minimal Wear	0.87	193	2025-02-20 23:40:12.137611+00	f
894	Field-Tested	0.53	193	2025-02-20 23:40:12.132619+00	f
895	Well-Worn	0.53	193	2025-02-20 23:40:12.141391+00	f
896	Battle-Scarred	0.47	193	2025-02-20 23:40:12.123184+00	f
897	Factory New	1.18	194	2025-02-20 23:40:05.125825+00	f
898	Minimal Wear	1.05	194	2025-02-20 23:40:05.136826+00	f
899	Field-Tested	0.86	194	2025-02-20 23:40:05.132826+00	f
900	Factory New	1.16	195	2025-02-20 23:40:04.567596+00	f
901	Minimal Wear	0.8	195	2025-02-20 23:40:04.578523+00	f
902	Field-Tested	0.57	195	2025-02-20 23:40:04.571595+00	f
903	Well-Worn	0.47	195	2025-02-20 23:40:04.582521+00	f
904	Battle-Scarred	0.39	195	2025-02-20 23:40:04.564597+00	f
905	Factory New	0.16	196	2025-02-20 23:40:17.46776+00	f
906	Minimal Wear	0.14	196	2025-02-20 23:40:17.470761+00	f
907	Factory New	0.14	197	2025-02-20 23:40:51.442999+00	f
908	Minimal Wear	0.17	197	2025-02-20 23:40:51.454035+00	f
909	Factory New	0.16	198	2025-02-20 23:40:10.490401+00	f
910	Minimal Wear	0.09	198	2025-02-20 23:40:10.512471+00	f
911	Field-Tested	0.1	198	2025-02-20 23:40:10.503472+00	f
912	Factory New	0.14	199	2025-02-20 23:40:21.681499+00	f
913	Minimal Wear	0.11	199	2025-02-20 23:40:21.6905+00	f
914	Field-Tested	0.11	199	2025-02-20 23:40:21.686501+00	f
915	Minimal Wear	0.11	200	2025-02-20 23:40:12.470306+00	f
916	Field-Tested	0.08	200	2025-02-20 23:40:12.462316+00	f
917	Well-Worn	0.1	200	2025-02-20 23:40:12.480308+00	f
918	Battle-Scarred	0.08	200	2025-02-20 23:40:12.451307+00	f
919	Factory New	0.2	201	2025-02-20 23:40:50.861025+00	f
920	Minimal Wear	0.03	201	2025-02-20 23:40:50.899297+00	f
921	Field-Tested	0.02	201	2025-02-20 23:40:50.882027+00	f
922	Well-Worn	0.03	201	2025-02-20 23:40:50.929329+00	f
923	Battle-Scarred	0.02	201	2025-02-20 23:40:50.835331+00	f
924	Factory New	0.07	202	2025-02-20 23:40:19.044096+00	f
925	Minimal Wear	0.03	202	2025-02-20 23:40:19.093095+00	f
926	Field-Tested	0.02	202	2025-02-20 23:40:19.049095+00	f
927	Well-Worn	0.03	202	2025-02-20 23:40:19.106104+00	f
928	Battle-Scarred	0.03	202	2025-02-20 23:40:19.039094+00	f
929	Factory New	0.15	203	2025-02-20 23:40:26.536678+00	f
930	Minimal Wear	0.03	203	2025-02-20 23:40:26.550227+00	f
931	Field-Tested	0.02	203	2025-02-20 23:40:26.541678+00	f
932	Well-Worn	0.02	203	2025-02-20 23:40:26.555227+00	f
933	Battle-Scarred	0.02	203	2025-02-20 23:40:26.530678+00	f
934	Factory New	0.05	204	2025-02-20 23:40:30.360769+00	f
935	Minimal Wear	0.04	204	2025-02-20 23:40:30.372091+00	f
936	Field-Tested	0.02	204	2025-02-20 23:40:30.367576+00	f
937	Well-Worn	0.02	204	2025-02-20 23:40:30.378177+00	f
938	Battle-Scarred	0.02	204	2025-02-20 23:40:30.355027+00	f
939	Factory New	0.04	205	2025-02-20 23:40:21.172377+00	f
940	Minimal Wear	0.02	205	2025-02-20 23:40:21.181377+00	f
941	Field-Tested	0.02	205	2025-02-20 23:40:21.176378+00	f
942	Factory New	0.03	206	2025-02-20 23:40:28.066273+00	f
943	Minimal Wear	0.02	206	2025-02-20 23:40:28.081667+00	f
944	Field-Tested	0.02	206	2025-02-20 23:40:28.073666+00	f
945	Factory New	62.8	207	2025-02-20 23:40:11.232033+00	f
946	Minimal Wear	49.49	207	2025-02-20 23:40:11.25503+00	f
947	Field-Tested	22.17	207	2025-02-20 23:40:11.24103+00	f
948	Well-Worn	20.32	207	2025-02-20 23:40:11.26603+00	f
949	Battle-Scarred	16.83	207	2025-02-20 23:40:11.220029+00	f
950	Factory New	14.23	208	2025-02-20 23:40:08.585352+00	f
951	Minimal Wear	7.03	208	2025-02-20 23:40:08.602203+00	f
952	Field-Tested	4.13	208	2025-02-20 23:40:08.589202+00	f
953	Well-Worn	7.69	208	2025-02-20 23:40:08.608204+00	f
954	Battle-Scarred	5.31	208	2025-02-20 23:40:08.570351+00	f
955	Factory New	11.84	209	2025-02-20 23:40:13.233329+00	f
956	Minimal Wear	9.19	209	2025-02-20 23:40:13.243353+00	f
957	Field-Tested	6.42	209	2025-02-20 23:40:13.238324+00	f
958	Well-Worn	7.4	209	2025-02-20 23:40:13.249385+00	f
959	Battle-Scarred	8.37	209	2025-02-20 23:40:13.221326+00	f
960	Factory New	14.48	210	2025-02-20 23:40:17.237338+00	f
961	Minimal Wear	8.48	210	2025-02-20 23:40:17.247337+00	f
962	Field-Tested	7.87	210	2025-02-20 23:40:17.241337+00	f
963	Well-Worn	9.19	210	2025-02-20 23:40:17.252008+00	f
964	Battle-Scarred	7.19	210	2025-02-20 23:40:17.232337+00	f
965	Factory New	14.8	211	2025-02-20 23:40:20.931237+00	f
966	Minimal Wear	11.79	211	2025-02-20 23:40:20.959238+00	f
967	Field-Tested	7.39	211	2025-02-20 23:40:20.948237+00	f
968	Well-Worn	8.5	211	2025-02-20 23:40:20.97824+00	f
969	Battle-Scarred	7.37	211	2025-02-20 23:40:20.920237+00	f
970	Factory New	10.97	212	2025-02-20 23:40:50.784338+00	f
971	Minimal Wear	9.16	212	2025-02-20 23:40:50.807339+00	f
972	Field-Tested	8.28	212	2025-02-20 23:40:50.792338+00	f
973	Well-Worn	9.56	212	2025-02-20 23:40:50.82613+00	f
974	Battle-Scarred	8.79	212	2025-02-20 23:40:50.773339+00	f
975	Factory New	8.34	213	2025-02-20 23:40:54.228439+00	f
976	Minimal Wear	6.24	213	2025-02-20 23:40:54.24944+00	f
977	Field-Tested	7.49	213	2025-02-20 23:40:54.24044+00	f
978	Well-Worn	6.38	213	2025-02-20 23:40:54.255441+00	f
979	Battle-Scarred	9.85	213	2025-02-20 23:40:54.220441+00	f
980	Factory New	20.74	214	2025-02-20 23:40:09.435961+00	f
981	Minimal Wear	5.5	214	2025-02-20 23:40:09.445964+00	f
982	Field-Tested	2.79	214	2025-02-20 23:40:09.439961+00	f
983	Well-Worn	2.57	214	2025-02-20 23:40:09.449962+00	f
984	Battle-Scarred	2.45	214	2025-02-20 23:40:09.431962+00	f
985	Factory New	7.37	215	2025-02-20 23:40:25.452183+00	f
986	Minimal Wear	2.45	215	2025-02-20 23:40:25.460183+00	f
987	Field-Tested	2.8	215	2025-02-20 23:40:25.456182+00	f
988	Well-Worn	2.55	215	2025-02-20 23:40:25.464184+00	f
989	Battle-Scarred	2.59	215	2025-02-20 23:40:25.449186+00	f
990	Factory New	3.62	216	2025-02-20 23:40:28.506911+00	f
991	Minimal Wear	3.09	216	2025-02-20 23:40:28.518927+00	f
992	Field-Tested	2.95	216	2025-02-20 23:40:28.514927+00	f
993	Well-Worn	13.02	216	2025-02-20 23:40:28.522927+00	f
994	Battle-Scarred	3.08	216	2025-02-20 23:40:28.503912+00	f
995	Factory New	3.45	217	2025-02-20 23:40:23.508983+00	f
996	Minimal Wear	3.28	217	2025-02-20 23:40:23.519979+00	f
997	Field-Tested	2.75	217	2025-02-20 23:40:23.515981+00	f
998	Well-Worn	3.12	217	2025-02-20 23:40:23.523979+00	f
999	Battle-Scarred	2.49	217	2025-02-20 23:40:23.503981+00	f
1000	Factory New	2.91	218	2025-02-20 23:40:21.399976+00	f
1001	Minimal Wear	2.61	218	2025-02-20 23:40:21.408976+00	f
1002	Field-Tested	2.57	218	2025-02-20 23:40:21.404976+00	f
1003	Well-Worn	7.13	218	2025-02-20 23:40:21.414977+00	f
1004	Factory New	3.44	219	2025-02-20 23:40:01.899349+00	f
1005	Minimal Wear	3.11	219	2025-02-20 23:40:01.908698+00	f
1006	Field-Tested	2.11	219	2025-02-20 23:40:01.904698+00	f
1007	Well-Worn	4.02	219	2025-02-20 23:40:01.915698+00	f
1008	Battle-Scarred	2.25	219	2025-02-15 23:05:25.920016+00	f
1009	Factory New	3531.2	220	2025-02-20 23:40:03.962808+00	f
1010	Minimal Wear	2643.6	220	2025-02-20 23:40:03.971808+00	f
1011	Field-Tested	2145.04	220	2025-02-20 23:40:03.967809+00	f
1012	Well-Worn	2010.57	220	2025-02-20 23:40:03.976588+00	f
1013	Battle-Scarred	2500.37	220	2025-02-20 23:40:03.957809+00	f
1014	Factory New	650.48	221	2025-02-20 23:40:17.760526+00	f
1015	Minimal Wear	\N	221	\N	f
1016	Field-Tested	486.32	221	2025-02-20 23:40:17.766525+00	f
1017	Well-Worn	994.56	221	2025-02-20 23:40:17.770525+00	f
1018	Battle-Scarred	\N	221	\N	f
1019	Factory New	107.19	222	2025-02-20 23:40:17.39289+00	f
1020	Minimal Wear	98.47	222	2025-02-20 23:40:17.406889+00	f
1021	Field-Tested	82.03	222	2025-02-20 23:40:17.39989+00	f
1022	Well-Worn	\N	222	\N	f
1023	Battle-Scarred	\N	222	\N	f
1024	Factory New	120.32	223	2025-02-20 23:40:21.052872+00	f
1025	Minimal Wear	119.82	223	2025-02-20 23:40:21.068872+00	f
1026	Field-Tested	96.84	223	2025-02-20 23:40:21.059872+00	f
1027	Well-Worn	149.54	223	2025-02-20 23:40:21.076879+00	f
1028	Battle-Scarred	\N	223	\N	f
1029	Factory New	108.67	224	2025-02-20 23:40:21.630761+00	f
1030	Minimal Wear	210.53	224	2025-02-20 23:40:21.6405+00	f
1031	Field-Tested	90.13	224	2025-02-20 23:40:21.636505+00	f
1032	Well-Worn	\N	224	\N	f
1033	Battle-Scarred	\N	224	\N	f
1034	Factory New	36.65	225	2025-02-20 23:40:06.214947+00	f
1035	Minimal Wear	44.36	225	2025-02-20 23:40:06.21946+00	f
1036	Factory New	40.66	226	2025-02-20 23:40:24.418388+00	f
1037	Minimal Wear	32.24	226	2025-02-20 23:40:24.426386+00	f
1038	Field-Tested	31.04	226	2025-02-20 23:40:24.422387+00	f
1039	Well-Worn	\N	226	\N	f
1040	Battle-Scarred	63.16	226	2025-02-15 23:05:34.629154+00	f
1041	Factory New	36.7	227	2025-02-20 23:40:29.53392+00	f
1042	Minimal Wear	34.52	227	2025-02-20 23:40:29.549919+00	f
1043	Field-Tested	35.79	227	2025-02-20 23:40:29.54092+00	f
1044	Well-Worn	\N	227	\N	f
1045	Battle-Scarred	38.36	227	2025-02-15 18:43:02.039834+00	f
1046	Factory New	36.45	228	2025-02-20 23:40:11.101646+00	f
1047	Minimal Wear	33.52	228	2025-02-20 23:40:11.112338+00	f
1048	Field-Tested	58.85	228	2025-02-20 23:40:11.106646+00	f
1049	Well-Worn	\N	228	\N	f
1050	Battle-Scarred	\N	228	\N	f
1051	Factory New	16.33	229	2025-02-20 23:39:59.730179+00	f
1052	Minimal Wear	7.98	229	2025-02-20 23:39:59.740204+00	f
1053	Field-Tested	7.25	229	2025-02-20 23:39:59.735859+00	f
1054	Well-Worn	7.24	229	2025-02-20 23:39:59.747201+00	f
1055	Battle-Scarred	9.9	229	2025-02-20 23:39:59.723628+00	f
1056	Factory New	9.66	230	2025-02-20 23:40:49.800774+00	f
1057	Minimal Wear	11.58	230	2025-02-20 23:40:49.809776+00	f
1058	Field-Tested	6.95	230	2025-02-20 23:40:49.804773+00	f
1059	Well-Worn	7.31	230	2025-02-20 23:40:49.814774+00	f
1060	Battle-Scarred	8.23	230	2025-02-20 23:40:49.796775+00	f
1061	Factory New	8.23	231	2025-02-20 23:40:28.313574+00	f
1062	Minimal Wear	7.64	231	2025-02-20 23:40:28.321238+00	f
1063	Field-Tested	6.98	231	2025-02-20 23:40:28.317573+00	f
1064	Well-Worn	8.03	231	2025-02-20 23:40:28.326239+00	f
1065	Battle-Scarred	8.42	231	2025-02-20 23:40:28.308574+00	f
1066	Factory New	9.38	232	2025-02-20 23:40:23.590886+00	f
1067	Minimal Wear	7.28	232	2025-02-20 23:40:23.600888+00	f
1068	Field-Tested	8.24	232	2025-02-20 23:40:23.596886+00	f
1069	Well-Worn	9.1	232	2025-02-20 23:40:23.604888+00	f
1070	Battle-Scarred	9.78	232	2025-02-15 18:55:01.254792+00	f
1071	Factory New	7.4	233	2025-02-20 23:40:26.572742+00	f
1072	Minimal Wear	2.03	233	2025-02-20 23:40:26.585742+00	f
1073	Field-Tested	2.06	233	2025-02-20 23:40:26.580746+00	f
1074	Well-Worn	24.85	233	2025-02-20 23:40:26.590741+00	f
1075	Battle-Scarred	2.52	233	2025-02-20 23:40:26.559227+00	f
1076	Factory New	5.56	234	2025-02-20 23:40:04.263628+00	f
1077	Minimal Wear	3.16	234	2025-02-20 23:40:04.270626+00	f
1078	Field-Tested	2.08	234	2025-02-20 23:40:04.267627+00	f
1079	Well-Worn	2.27	234	2025-02-20 23:40:04.274627+00	f
1080	Battle-Scarred	1.76	234	2025-02-20 23:40:04.257626+00	f
1081	Factory New	4.84	235	2025-02-20 23:40:01.835768+00	f
1082	Minimal Wear	1.83	235	2025-02-20 23:40:01.845381+00	f
1083	Field-Tested	1.63	235	2025-02-20 23:40:01.839365+00	f
1084	Well-Worn	1.36	235	2025-02-20 23:40:01.849366+00	f
1085	Battle-Scarred	1.69	235	2025-02-20 23:40:01.831255+00	f
1086	Factory New	5.23	236	2025-02-20 23:40:21.189378+00	f
1087	Minimal Wear	2.09	236	2025-02-20 23:40:21.200377+00	f
1088	Field-Tested	1.68	236	2025-02-20 23:40:21.196378+00	f
1089	Well-Worn	1.3	236	2025-02-20 23:40:21.205377+00	f
1090	Battle-Scarred	1.48	236	2025-02-20 23:40:21.185378+00	f
1091	Factory New	7.81	237	2025-02-20 23:40:27.71539+00	f
1092	Minimal Wear	3.7	237	2025-02-20 23:40:27.724391+00	f
1093	Field-Tested	1.76	237	2025-02-20 23:40:27.71939+00	f
1094	Well-Worn	1.38	237	2025-02-20 23:40:27.729391+00	f
1095	Battle-Scarred	1.58	237	2025-02-20 23:40:27.711392+00	f
1096	Factory New	1018.31	238	2025-02-20 23:40:15.311707+00	f
1097	Minimal Wear	1229	238	2025-02-20 23:40:15.316706+00	f
1098	Factory New	204.35	239	2025-02-20 23:40:13.44571+00	f
1099	Minimal Wear	182.1	239	2025-02-20 23:40:13.45974+00	f
1100	Field-Tested	167.06	239	2025-02-20 23:40:13.454737+00	f
1101	Factory New	177.41	240	2025-02-20 23:40:06.146654+00	f
1102	Minimal Wear	186.83	240	2025-02-20 23:40:06.166168+00	f
1103	Field-Tested	170.41	240	2025-02-20 23:40:06.158168+00	f
1104	Well-Worn	186.97	240	2025-02-20 23:40:06.171168+00	f
1105	Battle-Scarred	323.37	240	2025-02-20 23:40:06.138021+00	f
1106	Factory New	182.58	241	2025-02-20 23:40:28.286575+00	f
1107	Minimal Wear	181.06	241	2025-02-20 23:40:28.304574+00	f
1108	Field-Tested	356.84	241	2025-02-20 23:40:28.297574+00	f
1109	Well-Worn	\N	241	\N	f
1110	Battle-Scarred	\N	241	\N	f
1111	Factory New	155.24	242	2025-02-20 23:40:24.27201+00	f
1112	Minimal Wear	43.85	242	2025-02-20 23:40:24.281007+00	f
1113	Field-Tested	38.47	242	2025-02-20 23:40:24.275008+00	f
1114	Well-Worn	42.11	242	2025-02-15 23:05:34.552967+00	f
1115	Battle-Scarred	18114440.74	242	2025-02-20 23:40:24.267007+00	f
1116	Factory New	39.48	243	2025-02-20 23:40:16.977923+00	f
1117	Minimal Wear	53.16	243	2025-02-15 23:05:31.298902+00	f
1118	Factory New	46.26	244	2025-02-20 23:40:09.720015+00	f
1119	Minimal Wear	39.75	244	2025-02-20 23:40:09.735502+00	f
1120	Field-Tested	55.43	244	2025-02-20 23:40:09.729029+00	f
1121	Well-Worn	60.34	244	2025-02-15 19:05:08.017447+00	f
1122	Battle-Scarred	40.96	244	2025-02-20 23:40:09.711017+00	f
1123	Factory New	39.21	245	2025-02-20 23:40:04.14273+00	f
1124	Minimal Wear	39.9	245	2025-02-20 23:40:04.147729+00	f
1125	Factory New	40.66	246	2025-02-20 23:40:19.119095+00	f
1126	Minimal Wear	42.66	246	2025-02-20 23:40:19.174243+00	f
1127	Field-Tested	38.31	246	2025-02-20 23:40:19.139096+00	f
1128	Well-Worn	\N	246	\N	f
1129	Battle-Scarred	\N	246	\N	f
1130	Factory New	81.91	247	2025-02-20 23:40:05.223896+00	f
1131	Minimal Wear	17.89	247	2025-02-20 23:40:05.233894+00	f
1132	Field-Tested	14.4	247	2025-02-20 23:40:05.229894+00	f
1133	Well-Worn	18.71	247	2025-02-20 23:40:05.238894+00	f
1134	Battle-Scarred	17.83	247	2025-02-20 23:40:05.218893+00	f
1135	Factory New	26.39	248	2025-02-20 23:40:53.488358+00	f
1136	Minimal Wear	14	248	2025-02-20 23:40:53.500861+00	f
1137	Field-Tested	16.19	248	2025-02-20 23:40:53.494777+00	f
1138	Well-Worn	18.45	248	2025-02-20 23:40:53.506958+00	f
1139	Battle-Scarred	14.8	248	2025-02-20 23:40:53.48136+00	f
1140	Factory New	25.76	249	2025-02-20 23:40:12.147391+00	f
1141	Minimal Wear	15.5	249	2025-02-20 23:40:12.154391+00	f
1142	Field-Tested	17.52	249	2025-02-20 23:40:12.15039+00	f
1143	Well-Worn	29.32	249	2025-02-20 23:40:12.158391+00	f
1144	Battle-Scarred	16.1	249	2025-02-15 19:03:47.577485+00	f
1145	Factory New	5.16	250	2025-02-20 23:40:18.26164+00	f
1146	Minimal Wear	2.62	250	2025-02-20 23:40:18.290639+00	f
1147	Field-Tested	2.49	250	2025-02-20 23:40:18.274639+00	f
1148	Well-Worn	25.37	250	2025-02-20 23:40:18.300639+00	f
1149	Battle-Scarred	2.36	250	2025-02-20 23:40:18.257639+00	f
1150	Factory New	6.19	251	2025-02-20 23:40:13.934302+00	f
1151	Minimal Wear	3.06	251	2025-02-20 23:40:13.953829+00	f
1152	Field-Tested	2.33	251	2025-02-20 23:40:13.94683+00	f
1153	Well-Worn	2.86	251	2025-02-20 23:40:13.976829+00	f
1154	Battle-Scarred	2.14	251	2025-02-20 23:40:13.930303+00	f
1155	Factory New	4.69	252	2025-02-20 23:40:04.030585+00	f
1156	Minimal Wear	2.22	252	2025-02-20 23:40:04.038585+00	f
1157	Field-Tested	3.14	252	2025-02-20 23:40:04.034585+00	f
1158	Factory New	4.78	253	2025-02-20 23:40:27.258455+00	f
1159	Minimal Wear	2.95	253	2025-02-20 23:40:27.269455+00	f
1160	Field-Tested	2.51	253	2025-02-20 23:40:27.265455+00	f
1161	Factory New	12196.42	254	2025-02-20 23:40:03.195163+00	f
1162	Minimal Wear	9461.33	254	2025-02-20 23:40:03.221504+00	f
1163	Field-Tested	7066.32	254	2025-02-20 23:40:03.20983+00	f
1164	Well-Worn	25338.3	254	2025-02-20 23:40:03.236687+00	f
1165	Battle-Scarred	5216.08	254	2025-02-20 23:40:03.186215+00	f
1166	Factory New	3726.85	255	2025-02-20 23:40:15.405301+00	f
1167	Minimal Wear	\N	255	\N	f
1168	Factory New	475.96	256	2025-02-20 23:40:04.972192+00	f
1169	Minimal Wear	453.13	256	2025-02-20 23:40:04.983191+00	f
1170	Field-Tested	449.95	256	2025-02-20 23:40:04.978194+00	f
1171	Well-Worn	\N	256	\N	f
1172	Battle-Scarred	\N	256	\N	f
1173	Factory New	572.3	257	2025-02-20 23:40:04.042585+00	f
1174	Minimal Wear	\N	257	\N	f
1175	Factory New	137.25	258	2025-02-20 23:40:19.814548+00	f
1176	Minimal Wear	145.85	258	2025-02-20 23:40:19.826545+00	f
1177	Field-Tested	\N	258	\N	f
1178	Factory New	123.19	259	2025-02-20 23:40:22.4795+00	f
1179	Minimal Wear	122.05	259	2025-02-20 23:40:22.484022+00	f
1180	Field-Tested	\N	259	\N	f
1181	Factory New	74.28	260	2025-02-20 23:40:53.65387+00	f
1182	Minimal Wear	19.39	260	2025-02-20 23:40:53.670931+00	f
1183	Field-Tested	17.15	260	2025-02-20 23:40:53.65987+00	f
1184	Well-Worn	19.44	260	2025-02-20 23:40:53.677824+00	f
1185	Battle-Scarred	18.43	260	2025-02-20 23:40:53.642849+00	f
1186	Factory New	20.28	261	2025-02-20 23:40:21.844553+00	f
1187	Minimal Wear	17.71	261	2025-02-20 23:40:21.852551+00	f
1188	Field-Tested	21.66	261	2025-02-20 23:40:21.848554+00	f
1189	Factory New	18.57	262	2025-02-20 23:40:31.03025+00	f
1190	Minimal Wear	17.16	262	2025-02-20 23:40:31.037967+00	f
1191	Field-Tested	17.1	262	2025-02-20 23:40:31.033968+00	f
1192	Well-Worn	17.64	262	2025-02-20 23:40:31.040967+00	f
1193	Battle-Scarred	16.72	262	2025-02-20 23:40:31.023512+00	f
1194	Factory New	18.56	263	2025-02-20 23:40:18.309638+00	f
1195	Minimal Wear	29.4	263	2025-02-20 23:40:18.317639+00	f
1196	Factory New	29.55	264	2025-02-20 23:40:17.073349+00	f
1197	Minimal Wear	6.24	264	2025-02-20 23:40:17.082931+00	f
1198	Field-Tested	3.31	264	2025-02-20 23:40:17.078932+00	f
1199	Well-Worn	3.43	264	2025-02-20 23:40:17.086931+00	f
1200	Battle-Scarred	3.45	264	2025-02-20 23:40:17.069352+00	f
1201	Factory New	15.36	265	2025-02-20 23:40:25.083441+00	f
1202	Minimal Wear	3.68	265	2025-02-20 23:40:25.093222+00	f
1203	Field-Tested	4	265	2025-02-20 23:40:25.088223+00	f
1204	Well-Worn	3.62	265	2025-02-20 23:40:25.099222+00	f
1205	Battle-Scarred	3.67	265	2025-02-20 23:40:25.078443+00	f
1206	Factory New	14.62	266	2025-02-20 23:40:51.724269+00	f
1207	Minimal Wear	3.72	266	2025-02-20 23:40:51.734267+00	f
1208	Field-Tested	3.32	266	2025-02-20 23:40:51.729269+00	f
1209	Well-Worn	3.43	266	2025-02-20 23:40:51.739781+00	f
1210	Battle-Scarred	3.76	266	2025-02-20 23:40:51.718259+00	f
1211	Factory New	12.07	267	2025-02-15 18:50:50.194323+00	f
1212	Minimal Wear	3.68	267	2025-02-20 23:40:27.74039+00	f
1213	Field-Tested	2.92	267	2025-02-20 23:40:27.73739+00	f
1214	Well-Worn	3.6	267	2025-02-20 23:40:27.748904+00	f
1215	Battle-Scarred	3.66	267	2025-02-20 23:40:27.73339+00	f
1216	Factory New	5.23	268	2025-02-20 23:40:05.70171+00	f
1217	Minimal Wear	4.18	268	2025-02-20 23:40:05.71171+00	f
1218	Field-Tested	4.35	268	2025-02-20 23:40:05.706709+00	f
1219	Factory New	940.63	269	2025-02-20 23:40:03.417664+00	f
1220	Minimal Wear	1010.85	269	2025-02-20 23:40:03.422663+00	f
1221	Factory New	608.48	270	2025-02-20 23:40:14.844499+00	f
1222	Minimal Wear	666.4	270	2025-02-20 23:40:14.855463+00	f
1223	Factory New	195.42	271	2025-02-20 23:40:53.759951+00	f
1224	Minimal Wear	153.25	271	2025-02-20 23:40:53.790023+00	f
1225	Field-Tested	147.79	271	2025-02-20 23:40:53.778035+00	f
1226	Well-Worn	175.79	271	2025-02-20 23:40:53.797064+00	f
1227	Battle-Scarred	\N	271	\N	f
1228	Factory New	105.85	272	2025-02-20 23:40:51.489548+00	f
1229	Minimal Wear	92.83	272	2025-02-20 23:40:51.498623+00	f
1230	Field-Tested	89.83	272	2025-02-20 23:40:51.493621+00	f
1231	Well-Worn	133.77	272	2025-02-15 23:05:45.081351+00	f
1232	Battle-Scarred	93.87	272	2025-02-20 23:40:51.486548+00	f
1233	Factory New	91.89	273	2025-02-20 23:40:08.941013+00	f
1234	Minimal Wear	126.96	273	2025-02-20 23:40:08.94801+00	f
1235	Factory New	117.36	274	2025-02-20 23:40:08.315133+00	f
1236	Minimal Wear	102.05	274	2025-02-20 23:40:08.335172+00	f
1237	Field-Tested	171.57	274	2025-02-20 23:40:08.321175+00	f
1238	Well-Worn	98.47	274	2025-02-20 23:40:08.347172+00	f
1239	Battle-Scarred	108.7	274	2025-02-20 23:40:08.299571+00	f
1240	Factory New	27.54	275	2025-02-20 23:40:22.55971+00	f
1241	Minimal Wear	25.67	275	2025-02-20 23:40:22.571031+00	f
1242	Field-Tested	25.2	275	2025-02-20 23:40:22.566031+00	f
1243	Well-Worn	30.53	275	2025-02-20 23:40:22.574031+00	f
1244	Battle-Scarred	29.63	275	2025-02-20 23:40:22.555286+00	f
1245	Factory New	30.32	276	2025-02-20 23:40:16.020799+00	f
1246	Minimal Wear	26.79	276	2025-02-20 23:40:16.030799+00	f
1247	Field-Tested	26.68	276	2025-02-20 23:40:16.024798+00	f
1248	Well-Worn	26.45	276	2025-02-20 23:40:16.034799+00	f
1249	Battle-Scarred	30.45	276	2025-02-20 23:40:16.016798+00	f
1250	Factory New	27.71	277	2025-02-20 23:40:29.864832+00	f
1251	Minimal Wear	26.12	277	2025-02-20 23:40:29.873367+00	f
1252	Field-Tested	25.87	277	2025-02-20 23:40:29.868832+00	f
1253	Well-Worn	27.95	277	2025-02-20 23:40:29.878855+00	f
1254	Battle-Scarred	26.3	277	2025-02-20 23:40:29.854831+00	f
1255	Factory New	27.16	278	2025-02-20 23:40:27.570569+00	f
1256	Minimal Wear	26.12	278	2025-02-20 23:40:27.57857+00	f
1257	Field-Tested	25.24	278	2025-02-20 23:40:27.573569+00	f
1258	Well-Worn	51.05	278	2025-02-20 23:40:27.582569+00	f
1259	Battle-Scarred	30.42	278	2025-02-20 23:40:27.565569+00	f
1260	Factory New	7.77	279	2025-02-20 23:40:18.71583+00	f
1261	Minimal Wear	5.79	279	2025-02-20 23:40:18.72783+00	f
1262	Field-Tested	5.8	279	2025-02-20 23:40:18.72083+00	f
1263	Well-Worn	6.03	279	2025-02-20 23:40:18.73283+00	f
1264	Battle-Scarred	5.83	279	2025-02-20 23:40:18.70983+00	f
1265	Factory New	5.51	280	2025-02-20 23:40:07.017857+00	f
1266	Minimal Wear	5.5	280	2025-02-20 23:40:07.037861+00	f
1267	Field-Tested	5.36	280	2025-02-20 23:40:07.025858+00	f
1268	Well-Worn	6.33	280	2025-02-20 23:40:07.045857+00	f
1269	Battle-Scarred	5.52	280	2025-02-20 23:40:07.008857+00	f
1270	Factory New	5.47	281	2025-02-20 23:40:05.514459+00	f
1271	Minimal Wear	5.47	281	2025-02-20 23:40:05.526458+00	f
1272	Field-Tested	5.36	281	2025-02-20 23:40:05.518458+00	f
1273	Factory New	5.39	282	2025-02-20 23:40:17.739525+00	f
1274	Minimal Wear	5.56	282	2025-02-20 23:40:17.744529+00	f
1275	Factory New	1.97	283	2025-02-20 23:40:04.287626+00	f
1276	Minimal Wear	0.79	283	2025-02-20 23:40:04.297627+00	f
1277	Field-Tested	0.77	283	2025-02-20 23:40:04.291626+00	f
1278	Well-Worn	0.72	283	2025-02-20 23:40:04.300627+00	f
1279	Battle-Scarred	0.74	283	2025-02-20 23:40:04.282626+00	f
1280	Factory New	1.79	284	2025-02-20 23:40:23.727769+00	f
1281	Minimal Wear	0.8	284	2025-02-20 23:40:23.737767+00	f
1282	Field-Tested	0.73	284	2025-02-20 23:40:23.733767+00	f
1283	Well-Worn	0.76	284	2025-02-20 23:40:23.741768+00	f
1284	Battle-Scarred	0.73	284	2025-02-20 23:40:23.720767+00	f
1285	Factory New	0.86	285	2025-02-20 23:40:02.154097+00	f
1286	Minimal Wear	0.86	285	2025-02-20 23:40:02.19456+00	f
1287	Field-Tested	0.76	285	2025-02-20 23:40:02.171721+00	f
1288	Well-Worn	0.79	285	2025-02-20 23:40:02.209082+00	f
1289	Battle-Scarred	0.73	285	2025-02-20 23:40:02.142583+00	f
1290	Factory New	0.86	286	2025-02-20 23:40:54.314936+00	f
1291	Minimal Wear	0.83	286	2025-02-20 23:40:54.329937+00	f
1292	Field-Tested	0.76	286	2025-02-20 23:40:54.321934+00	f
1293	Well-Worn	0.76	286	2025-02-20 23:40:54.337935+00	f
1294	Battle-Scarred	0.76	286	2025-02-20 23:40:54.305935+00	f
1295	Factory New	0.9	287	2025-02-20 23:40:19.664695+00	f
1296	Minimal Wear	0.8	287	2025-02-20 23:40:19.673698+00	f
1297	Field-Tested	0.78	287	2025-02-20 23:40:19.667693+00	f
1298	Factory New	0.73	288	2025-02-20 23:40:26.404897+00	f
1299	Minimal Wear	0.72	288	2025-02-20 23:40:26.427013+00	f
1300	Field-Tested	0.57	288	2025-02-20 23:40:26.420497+00	f
1301	Well-Worn	3.7	288	2025-02-20 23:40:26.43501+00	f
1302	Factory New	7.83	289	2025-02-20 23:40:22.462501+00	f
1303	Minimal Wear	4.64	289	2025-02-20 23:40:22.470498+00	f
1304	Field-Tested	3.5	289	2025-02-20 23:40:22.4675+00	f
1305	Well-Worn	6.31	289	2025-02-20 23:40:22.4755+00	f
1306	Factory New	1.67	290	2025-02-20 23:40:25.400394+00	f
1307	Minimal Wear	0.93	290	2025-02-20 23:40:25.409396+00	f
1308	Field-Tested	0.59	290	2025-02-20 23:40:25.405396+00	f
1309	Well-Worn	0.51	290	2025-02-20 23:40:25.414396+00	f
1310	Battle-Scarred	0.43	290	2025-02-20 23:40:25.396397+00	f
1311	Factory New	1.17	291	2025-02-20 23:40:15.670343+00	f
1312	Minimal Wear	1.02	291	2025-02-20 23:40:15.679345+00	f
1313	Field-Tested	0.71	291	2025-02-20 23:40:15.674343+00	f
1314	Well-Worn	0.56	291	2025-02-20 23:40:15.683343+00	f
1315	Battle-Scarred	0.5	291	2025-02-20 23:40:15.667343+00	f
1316	Factory New	1.26	292	2025-02-20 23:40:28.403239+00	f
1317	Minimal Wear	0.97	292	2025-02-20 23:40:28.41224+00	f
1318	Field-Tested	0.55	292	2025-02-20 23:40:28.407238+00	f
1319	Well-Worn	0.57	292	2025-02-20 23:40:28.416239+00	f
1320	Battle-Scarred	0.48	292	2025-02-20 23:40:28.399239+00	f
1321	Factory New	2.14	293	2025-02-20 23:40:01.11474+00	f
1322	Minimal Wear	0.16	293	2025-02-20 23:40:01.12374+00	f
1323	Field-Tested	0.09	293	2025-02-20 23:40:01.118741+00	f
1324	Well-Worn	0.09	293	2025-02-20 23:40:01.12974+00	f
1325	Battle-Scarred	0.09	293	2025-02-20 23:40:01.10774+00	f
1326	Factory New	0.31	294	2025-02-20 23:40:09.755577+00	f
1327	Minimal Wear	0.11	294	2025-02-20 23:40:09.772621+00	f
1328	Field-Tested	0.06	294	2025-02-20 23:40:09.764577+00	f
1329	Well-Worn	0.07	294	2025-02-20 23:40:09.780619+00	f
1330	Battle-Scarred	0.06	294	2025-02-20 23:40:09.747578+00	f
1331	Factory New	0.24	295	2025-02-20 23:40:17.28189+00	f
1332	Minimal Wear	0.11	295	2025-02-20 23:40:17.290889+00	f
1333	Field-Tested	0.06	295	2025-02-20 23:40:17.286889+00	f
1334	Well-Worn	0.07	295	2025-02-20 23:40:17.296889+00	f
1335	Battle-Scarred	0.06	295	2025-02-20 23:40:17.276009+00	f
1336	Factory New	0.2	296	2025-02-20 23:40:31.123759+00	f
1337	Minimal Wear	0.1	296	2025-02-20 23:40:31.138967+00	f
1338	Field-Tested	0.05	296	2025-02-20 23:40:31.13256+00	f
1339	Well-Worn	0.07	296	2025-02-20 23:40:31.149967+00	f
1340	Battle-Scarred	0.06	296	2025-02-20 23:40:31.116758+00	f
1341	Factory New	0.15	297	2025-02-20 23:40:50.980231+00	f
1342	Minimal Wear	0.09	297	2025-02-20 23:40:51.048012+00	f
1343	Field-Tested	0.07	297	2025-02-20 23:40:51.023978+00	f
1344	Well-Worn	0.07	297	2025-02-20 23:40:51.06801+00	f
1345	Battle-Scarred	0.06	297	2025-02-20 23:40:50.945238+00	f
1346	Factory New	0.31	298	2025-02-20 23:40:24.055969+00	f
1347	Minimal Wear	0.02	298	2025-02-20 23:40:24.06597+00	f
1348	Field-Tested	0.02	298	2025-02-20 23:40:24.059969+00	f
1349	Well-Worn	0.03	298	2025-02-20 23:40:24.068969+00	f
1350	Battle-Scarred	0.02	298	2025-02-20 23:40:24.050969+00	f
1351	Factory New	0.08	299	2025-02-20 23:40:20.838423+00	f
1352	Minimal Wear	0.02	299	2025-02-20 23:40:20.858694+00	f
1353	Field-Tested	0.02	299	2025-02-20 23:40:20.850693+00	f
1354	Well-Worn	0.02	299	2025-02-20 23:40:20.869565+00	f
1355	Battle-Scarred	0.02	299	2025-02-20 23:40:20.832236+00	f
1356	Factory New	0.08	300	2025-02-20 23:40:10.221626+00	f
1357	Minimal Wear	0.02	300	2025-02-20 23:40:10.244279+00	f
1358	Field-Tested	0.02	300	2025-02-20 23:40:10.234488+00	f
1359	Well-Worn	0.02	300	2025-02-20 23:40:10.254588+00	f
1360	Battle-Scarred	0.02	300	2025-02-20 23:40:10.211615+00	f
1361	Factory New	0.1	301	2025-02-20 23:40:22.090437+00	f
1362	Minimal Wear	0.02	301	2025-02-20 23:40:22.107437+00	f
1363	Field-Tested	0.02	301	2025-02-20 23:40:22.100439+00	f
1364	Well-Worn	0.02	301	2025-02-20 23:40:22.112438+00	f
1365	Battle-Scarred	0.02	301	2025-02-20 23:40:22.076437+00	f
1366	Factory New	0.08	302	2025-02-20 23:40:24.945544+00	f
1367	Minimal Wear	0.02	302	2025-02-20 23:40:24.952999+00	f
1368	Field-Tested	0.02	302	2025-02-20 23:40:24.949999+00	f
1369	Well-Worn	0.02	302	2025-02-20 23:40:24.956999+00	f
1370	Battle-Scarred	0.02	302	2025-02-20 23:40:24.940542+00	f
1371	Factory New	0.06	303	2025-02-20 23:40:27.68057+00	f
1372	Minimal Wear	0.02	303	2025-02-20 23:40:27.688569+00	f
1373	Field-Tested	0.02	303	2025-02-20 23:40:27.68457+00	f
1374	Well-Worn	0.02	303	2025-02-20 23:40:27.692568+00	f
1375	Battle-Scarred	0.02	303	2025-02-20 23:40:27.674568+00	f
1376	Factory New	633.16	304	2025-02-20 23:40:04.707658+00	f
1377	Minimal Wear	735	304	2025-02-20 23:40:04.712659+00	f
1378	Factory New	71	305	2025-02-20 23:40:12.301255+00	f
1379	Minimal Wear	36.94	305	2025-02-20 23:40:12.309255+00	f
1380	Field-Tested	22.45	305	2025-02-20 23:40:12.305256+00	f
1381	Well-Worn	21.04	305	2025-02-20 23:40:12.316256+00	f
1382	Battle-Scarred	21.3	305	2025-02-20 23:40:12.297256+00	f
1383	Factory New	5.06	306	2025-02-20 23:40:23.077229+00	f
1384	Minimal Wear	21.55	306	2025-02-20 23:40:23.089228+00	f
1385	Factory New	\N	307	\N	f
1386	Minimal Wear	110.89	307	2025-02-20 23:40:03.924809+00	f
1387	Field-Tested	108.25	307	2025-02-20 23:40:03.91981+00	f
1388	Well-Worn	207.51	307	2025-02-20 23:40:03.93081+00	f
1389	Battle-Scarred	102.72	307	2025-02-15 23:05:26.564876+00	f
1390	Factory New	263.16	308	2025-02-15 23:05:37.080044+00	f
1391	Minimal Wear	\N	308	\N	f
1392	Field-Tested	112.29	308	2025-02-15 18:52:02.427417+00	f
1393	Well-Worn	95.65	308	2025-02-20 23:40:30.248242+00	f
1394	Battle-Scarred	295.68	308	2025-02-20 23:40:30.238668+00	f
1395	Minimal Wear	165.86	309	2025-02-20 23:40:01.638024+00	f
1396	Field-Tested	116.62	309	2025-02-20 23:40:01.634024+00	f
1398	Factory New	419.04	310	2025-02-20 23:40:27.608569+00	f
1399	Minimal Wear	25.71	310	2025-02-20 23:40:27.618569+00	f
1400	Field-Tested	22.1	310	2025-02-20 23:40:27.613569+00	f
1401	Well-Worn	24.49	310	2025-02-20 23:40:27.622568+00	f
1402	Battle-Scarred	22.82	310	2025-02-20 23:40:27.604569+00	f
1403	Factory New	66.32	311	2025-02-15 23:05:25.363333+00	f
1404	Minimal Wear	23.08	311	2025-02-20 23:40:01.023725+00	f
1405	Field-Tested	20.33	311	2025-02-20 23:40:01.018724+00	f
1406	Well-Worn	20.6	311	2025-02-20 23:40:01.028724+00	f
1407	Battle-Scarred	18.56	311	2025-02-20 23:40:01.014725+00	f
1408	Factory New	44.18	312	2025-02-20 23:40:15.865861+00	f
1409	Minimal Wear	22.67	312	2025-02-20 23:40:15.87386+00	f
1410	Field-Tested	19.43	312	2025-02-20 23:40:15.869861+00	f
1411	Well-Worn	22.16	312	2025-02-20 23:40:15.880801+00	f
1412	Battle-Scarred	18.63	312	2025-02-20 23:40:15.860863+00	f
1413	Factory New	5222.22	313	2025-02-20 23:40:03.630269+00	f
1414	Minimal Wear	2808.72	313	2025-02-20 23:40:03.642268+00	f
1415	Field-Tested	2023.58	313	2025-02-20 23:40:03.636267+00	f
1416	Well-Worn	1693.34	313	2025-02-20 23:40:03.650782+00	f
1417	Battle-Scarred	1757.33	313	2025-02-20 23:40:03.620268+00	f
1418	Factory New	1231.87	314	2025-02-20 23:40:16.334616+00	f
1419	Minimal Wear	912.27	314	2025-02-20 23:40:16.342615+00	f
1420	Field-Tested	1413.66	314	2025-02-20 23:40:16.338615+00	f
1421	Factory New	537.54	315	2025-02-20 23:40:15.374303+00	f
1422	Minimal Wear	593.65	315	2025-02-20 23:40:15.381302+00	f
1423	Factory New	426.95	316	2025-02-20 23:40:10.123019+00	f
1424	Minimal Wear	242.47	316	2025-02-20 23:40:10.133019+00	f
1425	Field-Tested	230.29	316	2025-02-20 23:40:10.12802+00	f
1426	Well-Worn	\N	316	\N	f
1427	Factory New	189.11	317	2025-02-20 23:40:20.681096+00	f
1428	Minimal Wear	196.48	317	2025-02-20 23:40:20.698097+00	f
1429	Field-Tested	\N	317	\N	f
1430	Factory New	145	318	2025-02-20 23:40:51.884667+00	f
1431	Minimal Wear	123.53	318	2025-02-20 23:40:51.901666+00	f
1432	Field-Tested	137.51	318	2025-02-20 23:40:51.892665+00	f
1433	Well-Worn	\N	318	\N	f
1434	Factory New	40.29	319	2025-02-20 23:40:03.938809+00	f
1435	Minimal Wear	29.23	319	2025-02-20 23:40:03.949814+00	f
1436	Field-Tested	24.6	319	2025-02-20 23:40:03.94581+00	f
1437	Well-Worn	32.43	319	2025-02-20 23:40:03.953808+00	f
1438	Battle-Scarred	25.58	319	2025-02-20 23:40:03.935809+00	f
1439	Factory New	31.23	320	2025-02-20 23:40:49.664509+00	f
1440	Minimal Wear	29.05	320	2025-02-20 23:40:49.672507+00	f
1441	Field-Tested	23.66	320	2025-02-20 23:40:49.668508+00	f
1442	Well-Worn	24.77	320	2025-02-20 23:40:49.676507+00	f
1443	Battle-Scarred	22.79	320	2025-02-20 23:40:49.659507+00	f
1444	Factory New	24.15	321	2025-02-20 23:40:14.392826+00	f
1445	Minimal Wear	26.2	321	2025-02-20 23:40:14.411826+00	f
1446	Field-Tested	24.74	321	2025-02-20 23:40:14.398825+00	f
1447	Well-Worn	22.88	321	2025-02-20 23:40:14.424866+00	f
1448	Battle-Scarred	35.77	321	2025-02-20 23:40:14.378826+00	f
1449	Factory New	29.99	322	2025-02-20 23:40:22.968023+00	f
1450	Minimal Wear	20.69	322	2025-02-20 23:40:22.98134+00	f
1451	Field-Tested	25.14	322	2025-02-20 23:40:22.974699+00	f
1452	Factory New	5.43	323	2025-02-20 23:40:06.592647+00	f
1453	Minimal Wear	4.82	323	2025-02-20 23:40:06.615647+00	f
1454	Field-Tested	4.87	323	2025-02-20 23:40:06.605648+00	f
1455	Well-Worn	6.58	323	2025-02-20 23:40:06.623648+00	f
1456	Battle-Scarred	4.54	323	2025-02-20 23:40:06.584647+00	f
1457	Factory New	4.91	324	2025-02-20 23:40:01.646024+00	f
1458	Minimal Wear	5.18	324	2025-02-20 23:40:01.653873+00	f
1459	Field-Tested	4.5	324	2025-02-20 23:40:01.649872+00	f
1460	Well-Worn	\N	324	\N	f
1461	Battle-Scarred	5.52	324	2025-02-20 23:40:01.641024+00	f
1462	Factory New	5.27	325	2025-02-20 23:40:21.945282+00	f
1463	Minimal Wear	5.32	325	2025-02-20 23:40:21.967282+00	f
1464	Field-Tested	4.51	325	2025-02-20 23:40:21.950281+00	f
1465	Well-Worn	6.14	325	2025-02-20 23:40:21.977283+00	f
1466	Battle-Scarred	11.42	325	2025-02-15 18:56:29.265042+00	f
1467	Factory New	5.49	326	2025-02-20 23:40:18.93653+00	f
1468	Minimal Wear	5.11	326	2025-02-20 23:40:18.946529+00	f
1469	Field-Tested	4.57	326	2025-02-20 23:40:18.94053+00	f
1470	Well-Worn	738.95	326	2025-02-20 23:40:18.95053+00	f
1471	Battle-Scarred	4.9	326	2025-02-20 23:40:18.92953+00	f
1472	Factory New	2069.56	327	2025-02-20 23:40:01.353309+00	f
1473	Minimal Wear	1141.3	327	2025-02-20 23:40:01.35931+00	f
1474	Field-Tested	787.83	327	2025-02-20 23:40:01.35631+00	f
1475	Well-Worn	443.52	327	2025-02-20 23:40:01.363311+00	f
1476	Battle-Scarred	362.2	327	2025-02-20 23:40:01.350309+00	f
1477	Factory New	240.67	328	2025-02-20 23:40:03.89781+00	f
1478	Minimal Wear	213.49	328	2025-02-20 23:40:03.90781+00	f
1479	Field-Tested	157.74	328	2025-02-20 23:40:03.901809+00	f
1480	Well-Worn	161.61	328	2025-02-20 23:40:03.914809+00	f
1481	Battle-Scarred	169.37	328	2025-02-20 23:40:03.891809+00	f
1482	Factory New	236.18	329	2025-02-20 23:40:17.05235+00	f
1483	Minimal Wear	207.71	329	2025-02-20 23:40:17.06035+00	f
1484	Field-Tested	150.29	329	2025-02-20 23:40:17.05535+00	f
1485	Well-Worn	110.89	329	2025-02-20 23:40:17.06535+00	f
1486	Battle-Scarred	148.75	329	2025-02-20 23:40:17.048349+00	f
1487	Factory New	78.24	330	2025-02-20 23:40:11.788152+00	f
1488	Minimal Wear	56.44	330	2025-02-20 23:40:11.818844+00	f
1489	Field-Tested	45.08	330	2025-02-20 23:40:11.804672+00	f
1490	Well-Worn	60	330	2025-02-15 23:05:29.231812+00	f
1491	Battle-Scarred	50.5	330	2025-02-15 23:05:29.22159+00	f
1492	Factory New	43.89	331	2025-02-20 23:40:12.520276+00	f
1493	Minimal Wear	58.3	331	2025-02-20 23:40:12.5384+00	f
1494	Field-Tested	43.94	331	2025-02-20 23:40:12.52979+00	f
1495	Well-Worn	60.69	331	2025-02-20 23:40:12.547397+00	f
1496	Factory New	40.53	332	2025-02-20 23:40:28.581722+00	f
1497	Minimal Wear	\N	332	\N	f
1498	Factory New	27.36	333	2025-02-20 23:40:23.345982+00	f
1499	Minimal Wear	14	333	2025-02-20 23:40:23.354643+00	f
1500	Field-Tested	13.74	333	2025-02-20 23:40:23.349982+00	f
1501	Well-Worn	15.84	333	2025-02-15 18:55:21.623643+00	f
1502	Battle-Scarred	15.6	333	2025-02-20 23:40:23.339983+00	f
1503	Factory New	19.08	334	2025-02-20 23:40:05.249405+00	f
1504	Minimal Wear	16.17	334	2025-02-20 23:40:05.258407+00	f
1505	Field-Tested	15.67	334	2025-02-20 23:40:05.253406+00	f
1506	Well-Worn	25.43	334	2025-02-20 23:40:05.265406+00	f
1507	Battle-Scarred	17.26	334	2025-02-20 23:40:05.246408+00	f
1508	Factory New	14.16	335	2025-02-20 23:40:21.435985+00	f
1509	Minimal Wear	13.9	335	2025-02-20 23:40:21.456985+00	f
1510	Field-Tested	16.1	335	2025-02-20 23:40:21.439985+00	f
1511	Well-Worn	39.98	335	2025-02-15 18:56:50.6848+00	f
1512	Battle-Scarred	18.65	335	2025-02-15 18:56:51.128209+00	f
1513	Factory New	15.54	336	2025-02-20 23:40:25.157009+00	f
1514	Minimal Wear	15.06	336	2025-02-20 23:40:25.16601+00	f
1515	Field-Tested	17.75	336	2025-02-20 23:40:25.160009+00	f
1516	Well-Worn	18.13	336	2025-02-20 23:40:25.170009+00	f
1517	Battle-Scarred	44.21	336	2025-02-15 23:05:34.991267+00	f
1518	Factory New	3.8	337	2025-02-20 23:40:22.194489+00	f
1519	Minimal Wear	3.62	337	2025-02-20 23:40:22.201485+00	f
1520	Field-Tested	3.28	337	2025-02-20 23:40:22.198487+00	f
1521	Well-Worn	3.68	337	2025-02-15 23:05:33.577514+00	f
1522	Battle-Scarred	3.07	337	2025-02-20 23:40:22.189487+00	f
1523	Factory New	3.81	338	2025-02-20 23:40:27.155942+00	f
1524	Minimal Wear	3.3	338	2025-02-20 23:40:27.165942+00	f
1525	Field-Tested	4.22	338	2025-02-20 23:40:27.160942+00	f
1526	Well-Worn	4.44	338	2025-02-20 23:40:27.169942+00	f
1527	Battle-Scarred	3.92	338	2025-02-20 23:40:27.151941+00	f
1528	Factory New	4.45	339	2025-02-20 23:40:19.583071+00	f
1529	Minimal Wear	3.24	339	2025-02-20 23:40:19.59184+00	f
1530	Field-Tested	3.28	339	2025-02-20 23:40:19.587837+00	f
1531	Well-Worn	8.26	339	2025-02-20 23:40:19.598837+00	f
1532	Battle-Scarred	3.41	339	2025-02-20 23:40:19.57707+00	f
1533	Factory New	4.06	340	2025-02-20 23:40:51.699407+00	f
1534	Minimal Wear	3.23	340	2025-02-20 23:40:51.713627+00	f
1535	Field-Tested	3.36	340	2025-02-20 23:40:51.704406+00	f
1536	Well-Worn	4.33	340	2025-02-15 23:05:45.194836+00	f
1537	Battle-Scarred	3.2	340	2025-02-15 23:05:45.18558+00	f
1538	Factory New	14.8	341	2025-02-20 23:40:14.335514+00	f
1539	Minimal Wear	0.51	341	2025-02-20 23:40:14.355825+00	f
1540	Field-Tested	0.53	341	2025-02-20 23:40:14.341514+00	f
1541	Well-Worn	1.2	341	2025-02-20 23:40:14.369827+00	f
1542	Battle-Scarred	0.51	341	2025-02-20 23:40:14.320483+00	f
1543	Factory New	0.92	342	2025-02-20 23:40:49.837086+00	f
1544	Minimal Wear	0.53	342	2025-02-20 23:40:49.855291+00	f
1545	Field-Tested	0.52	342	2025-02-20 23:40:49.844295+00	f
1546	Well-Worn	7.45	342	2025-02-20 23:40:49.859288+00	f
1547	Battle-Scarred	1.07	342	2025-02-20 23:40:49.828346+00	f
1548	Factory New	0.88	343	2025-02-20 23:40:06.282414+00	f
1549	Minimal Wear	0.6	343	2025-02-20 23:40:06.313415+00	f
1550	Field-Tested	0.53	343	2025-02-20 23:40:06.300414+00	f
1551	Well-Worn	4.8	343	2025-02-20 23:40:06.333414+00	f
1552	Battle-Scarred	0.54	343	2025-02-20 23:40:06.271414+00	f
1553	Factory New	0.63	344	2025-02-20 23:40:30.184534+00	f
1554	Minimal Wear	0.58	344	2025-02-20 23:40:30.212995+00	f
1555	Field-Tested	0.5	344	2025-02-20 23:40:30.200994+00	f
1556	Well-Worn	8.11	344	2025-02-20 23:40:30.225734+00	f
1557	Battle-Scarred	0.74	344	2025-02-20 23:40:30.168948+00	f
1558	Minimal Wear	0.55	345	2025-02-20 23:40:25.518031+00	f
1559	Field-Tested	0.48	345	2025-02-20 23:40:25.514032+00	f
1560	Well-Worn	0.6	345	2025-02-20 23:40:25.522031+00	f
1561	Battle-Scarred	9.46	345	2025-02-20 23:40:25.508031+00	f
1562	Factory New	50.97	346	2025-02-20 23:40:49.46641+00	f
1563	Minimal Wear	11.55	346	2025-02-20 23:40:49.47441+00	f
1564	Field-Tested	2.58	346	2025-02-20 23:40:49.47041+00	f
1565	Well-Worn	2.67	346	2025-02-20 23:40:49.47741+00	f
1566	Battle-Scarred	2.55	346	2025-02-20 23:40:49.46041+00	f
1567	Factory New	2.49	347	2025-02-20 23:40:05.63813+00	f
1568	Minimal Wear	6.87	347	2025-02-15 19:07:05.878173+00	f
1569	Factory New	201.05	348	2025-02-20 23:40:16.546726+00	f
1570	Minimal Wear	23.43	348	2025-02-20 23:40:16.554725+00	f
1571	Field-Tested	6.87	348	2025-02-20 23:40:16.550726+00	f
1572	Well-Worn	19.33	348	2025-02-20 23:40:16.559726+00	f
1573	Battle-Scarred	9.48	348	2025-02-20 23:40:16.539725+00	f
1574	Factory New	73.93	349	2025-02-20 23:40:23.769767+00	f
1575	Minimal Wear	5.19	349	2025-02-20 23:40:23.778768+00	f
1576	Field-Tested	2.48	349	2025-02-20 23:40:23.773767+00	f
1577	Well-Worn	7.13	349	2025-02-20 23:40:23.782767+00	f
1578	Battle-Scarred	17.44	349	2025-02-15 18:54:57.188173+00	f
1579	Factory New	17.5	350	2025-02-20 23:40:22.297313+00	f
1580	Minimal Wear	4.17	350	2025-02-20 23:40:22.306313+00	f
1581	Field-Tested	1.68	350	2025-02-20 23:40:22.302314+00	f
1582	Well-Worn	2.23	350	2025-02-20 23:40:22.310313+00	f
1583	Battle-Scarred	1.83	350	2025-02-20 23:40:22.292313+00	f
1584	Factory New	\N	351	\N	f
1585	Minimal Wear	4.19	351	2025-02-20 23:40:18.249638+00	f
1586	Field-Tested	2.2	351	2025-02-20 23:40:18.245639+00	f
1587	Well-Worn	26.7	351	2025-02-20 23:40:18.253638+00	f
1588	Battle-Scarred	4.25	351	2025-02-20 23:40:18.240122+00	f
1589	Minimal Wear	0.66	352	2025-02-20 23:40:03.841981+00	f
1590	Field-Tested	0.33	352	2025-02-20 23:40:03.836981+00	f
1591	Well-Worn	0.86	352	2025-02-20 23:40:03.848982+00	f
1592	Battle-Scarred	0.58	352	2025-02-20 23:40:03.832982+00	f
1593	Factory New	0.88	353	2025-02-20 23:40:12.370996+00	f
1594	Minimal Wear	0.65	353	2025-02-20 23:40:12.382508+00	f
1595	Field-Tested	0.48	353	2025-02-20 23:40:12.375508+00	f
1596	Factory New	0.83	354	2025-02-20 23:40:18.869529+00	f
1597	Minimal Wear	0.88	354	2025-02-20 23:40:18.87853+00	f
1598	Factory New	0.88	355	2025-02-20 23:40:30.400489+00	f
1599	Minimal Wear	0.58	355	2025-02-20 23:40:30.40849+00	f
1600	Field-Tested	0.37	355	2025-02-20 23:40:30.40449+00	f
1601	Well-Worn	0.42	355	2025-02-20 23:40:30.417138+00	f
1602	Battle-Scarred	0.35	355	2025-02-20 23:40:30.394977+00	f
1603	Factory New	1.56	356	2025-02-20 23:40:14.880831+00	f
1604	Minimal Wear	0.11	356	2025-02-20 23:40:14.898869+00	f
1605	Field-Tested	0.07	356	2025-02-20 23:40:14.892348+00	f
1606	Well-Worn	0.1	356	2025-02-20 23:40:14.907869+00	f
1607	Battle-Scarred	0.08	356	2025-02-20 23:40:14.870315+00	f
1608	Factory New	0.23	357	2025-02-20 23:40:22.631608+00	f
1609	Minimal Wear	0.09	357	2025-02-20 23:40:22.641606+00	f
1610	Field-Tested	0.06	357	2025-02-20 23:40:22.637605+00	f
1611	Well-Worn	0.07	357	2025-02-20 23:40:22.647159+00	f
1612	Battle-Scarred	0.07	357	2025-02-20 23:40:22.625094+00	f
1613	Factory New	0.21	358	2025-02-20 23:40:51.681407+00	f
1614	Minimal Wear	0.09	358	2025-02-20 23:40:51.690407+00	f
1615	Field-Tested	0.06	358	2025-02-20 23:40:51.686409+00	f
1616	Well-Worn	0.08	358	2025-02-20 23:40:51.694407+00	f
1617	Battle-Scarred	0.07	358	2025-02-20 23:40:51.676406+00	f
1618	Factory New	0.14	359	2025-02-20 23:40:06.916831+00	f
1619	Minimal Wear	0.1	359	2025-02-20 23:40:06.933829+00	f
1620	Field-Tested	0.06	359	2025-02-20 23:40:06.922829+00	f
1621	Well-Worn	0.06	359	2025-02-20 23:40:06.942829+00	f
1622	Battle-Scarred	0.07	359	2025-02-20 23:40:06.90983+00	f
1623	Factory New	0.13	360	2025-02-20 23:40:21.7045+00	f
1624	Minimal Wear	0.09	360	2025-02-20 23:40:21.7135+00	f
1625	Field-Tested	0.08	360	2025-02-20 23:40:21.708501+00	f
1626	Factory New	0.13	361	2025-02-20 23:40:54.271441+00	f
1627	Minimal Wear	0.1	361	2025-02-20 23:40:54.289935+00	f
1628	Field-Tested	0.07	361	2025-02-20 23:40:54.279441+00	f
1629	Well-Worn	0.06	361	2025-02-20 23:40:54.298935+00	f
1630	Battle-Scarred	0.08	361	2025-02-20 23:40:54.263441+00	f
1631	Factory New	0.32	362	2025-02-20 23:40:49.641507+00	f
1632	Minimal Wear	0.03	362	2025-02-20 23:40:49.649507+00	f
1633	Field-Tested	0.02	362	2025-02-20 23:40:49.64551+00	f
1634	Well-Worn	0.02	362	2025-02-20 23:40:49.655507+00	f
1635	Battle-Scarred	0.02	362	2025-02-20 23:40:49.637508+00	f
1636	Factory New	0.27	363	2025-02-20 23:40:07.270392+00	f
1637	Minimal Wear	0.03	363	2025-02-20 23:40:07.288392+00	f
1638	Field-Tested	0.02	363	2025-02-20 23:40:07.279393+00	f
1639	Well-Worn	0.02	363	2025-02-20 23:40:07.302393+00	f
1640	Battle-Scarred	0.02	363	2025-02-20 23:40:07.262393+00	f
1641	Factory New	0.12	364	2025-02-20 23:40:22.214905+00	f
1642	Minimal Wear	0.02	364	2025-02-20 23:40:22.221904+00	f
1643	Field-Tested	0.02	364	2025-02-20 23:40:22.217904+00	f
1644	Well-Worn	0.02	364	2025-02-20 23:40:22.228907+00	f
1645	Battle-Scarred	0.02	364	2025-02-20 23:40:22.209904+00	f
1646	Factory New	0.08	365	2025-02-20 23:40:01.612974+00	f
1647	Minimal Wear	0.02	365	2025-02-20 23:40:01.622973+00	f
1648	Field-Tested	0.02	365	2025-02-20 23:40:01.617974+00	f
1649	Well-Worn	0.02	365	2025-02-20 23:40:01.628973+00	f
1650	Battle-Scarred	0.02	365	2025-02-20 23:40:01.607972+00	f
1651	Factory New	0.12	366	2025-02-20 23:40:26.15388+00	f
1652	Minimal Wear	0.02	366	2025-02-20 23:40:26.181394+00	f
1653	Field-Tested	0.02	366	2025-02-20 23:40:26.16688+00	f
1654	Well-Worn	0.02	366	2025-02-20 23:40:26.186392+00	f
1655	Battle-Scarred	0.02	366	2025-02-20 23:40:26.14988+00	f
1656	Factory New	0.25	367	2025-02-20 23:40:05.739709+00	f
1657	Minimal Wear	0.15	367	2025-02-20 23:40:05.74971+00	f
1658	Field-Tested	0.12	367	2025-02-20 23:40:05.744711+00	f
1659	Well-Worn	0.33	367	2025-02-20 23:40:05.753709+00	f
1660	Factory New	0.93	368	2025-02-20 23:40:53.306152+00	f
1661	Minimal Wear	0.67	368	2025-02-20 23:40:53.339424+00	f
1662	Field-Tested	0.45	368	2025-02-20 23:40:53.319422+00	f
1663	Well-Worn	0.43	368	2025-02-20 23:40:53.35096+00	f
1664	Battle-Scarred	0.43	368	2025-02-20 23:40:53.288417+00	f
1665	Factory New	0.84	369	2025-02-20 23:40:28.050273+00	f
1666	Minimal Wear	0.77	369	2025-02-20 23:40:28.057274+00	f
1667	Factory New	0.92	370	2025-02-20 23:40:25.13801+00	f
1668	Minimal Wear	0.61	370	2025-02-20 23:40:25.148009+00	f
1669	Field-Tested	0.35	370	2025-02-20 23:40:25.143009+00	f
1670	Well-Worn	0.37	370	2025-02-20 23:40:25.153009+00	f
1671	Battle-Scarred	0.41	370	2025-02-20 23:40:25.133009+00	f
1672	Factory New	1.25	371	2025-02-20 23:40:03.87181+00	f
1673	Minimal Wear	0.12	371	2025-02-20 23:40:03.882809+00	f
1674	Field-Tested	0.08	371	2025-02-20 23:40:03.876809+00	f
1675	Well-Worn	0.11	371	2025-02-20 23:40:03.887809+00	f
1676	Battle-Scarred	0.09	371	2025-02-20 23:40:03.86681+00	f
1677	Factory New	0.88	372	2025-02-20 23:40:07.424086+00	f
1678	Minimal Wear	0.09	372	2025-02-20 23:40:07.434085+00	f
1679	Field-Tested	0.08	372	2025-02-20 23:40:07.429087+00	f
1680	Well-Worn	0.07	372	2025-02-20 23:40:07.438086+00	f
1681	Battle-Scarred	0.06	372	2025-02-20 23:40:07.420086+00	f
1682	Factory New	0.54	373	2025-02-20 23:40:05.168339+00	f
1683	Minimal Wear	0.11	373	2025-02-20 23:40:05.180193+00	f
1684	Field-Tested	0.07	373	2025-02-20 23:40:05.173339+00	f
1685	Well-Worn	0.07	373	2025-02-20 23:40:05.185192+00	f
1686	Battle-Scarred	0.07	373	2025-02-20 23:40:05.164339+00	f
1687	Factory New	0.17	374	2025-02-20 23:40:54.144294+00	f
1688	Minimal Wear	0.1	374	2025-02-20 23:40:54.158439+00	f
1689	Field-Tested	0.06	374	2025-02-20 23:40:54.151439+00	f
1690	Well-Worn	0.07	374	2025-02-20 23:40:54.169441+00	f
1691	Battle-Scarred	0.07	374	2025-02-20 23:40:54.135294+00	f
1692	Factory New	0.11	375	2025-02-20 23:40:25.850592+00	f
1693	Minimal Wear	0.09	375	2025-02-20 23:40:25.870715+00	f
1694	Field-Tested	0.06	375	2025-02-20 23:40:25.856718+00	f
1695	Well-Worn	0.07	375	2025-02-20 23:40:25.875715+00	f
1696	Battle-Scarred	0.07	375	2025-02-20 23:40:25.836074+00	f
1697	Factory New	0.3	376	2025-02-20 23:40:02.064001+00	f
1698	Minimal Wear	0.03	376	2025-02-20 23:40:02.079023+00	f
1699	Field-Tested	0.02	376	2025-02-20 23:40:02.067998+00	f
1700	Well-Worn	0.02	376	2025-02-20 23:40:02.084021+00	f
1701	Battle-Scarred	0.02	376	2025-02-20 23:40:02.056995+00	f
1702	Factory New	0.16	377	2025-02-20 23:40:54.111293+00	f
1703	Minimal Wear	0.03	377	2025-02-20 23:40:54.121294+00	f
1704	Field-Tested	0.02	377	2025-02-20 23:40:54.117293+00	f
1705	Well-Worn	0.02	377	2025-02-20 23:40:54.126293+00	f
1706	Battle-Scarred	0.02	377	2025-02-20 23:40:54.106293+00	f
1707	Factory New	0.17	378	2025-02-20 23:40:11.957071+00	f
1708	Minimal Wear	0.03	378	2025-02-20 23:40:11.976069+00	f
1709	Field-Tested	0.02	378	2025-02-20 23:40:11.971071+00	f
1710	Well-Worn	0.02	378	2025-02-20 23:40:11.98207+00	f
1711	Battle-Scarred	0.02	378	2025-02-20 23:40:11.948556+00	f
1712	Factory New	0.14	379	2025-02-20 23:40:23.408524+00	f
1713	Minimal Wear	0.02	379	2025-02-20 23:40:23.419524+00	f
1714	Field-Tested	0.02	379	2025-02-20 23:40:23.415525+00	f
1715	Well-Worn	0.02	379	2025-02-20 23:40:23.425526+00	f
1716	Battle-Scarred	0.02	379	2025-02-20 23:40:23.404524+00	f
1717	Factory New	0.12	380	2025-02-20 23:40:28.859846+00	f
1718	Minimal Wear	0.03	380	2025-02-20 23:40:28.869847+00	f
1719	Field-Tested	0.02	380	2025-02-20 23:40:28.865846+00	f
1720	Well-Worn	0.02	380	2025-02-20 23:40:28.873846+00	f
1721	Battle-Scarred	0.02	380	2025-02-20 23:40:28.855846+00	f
1722	Factory New	0.07	381	2025-02-20 23:40:10.671718+00	f
1723	Minimal Wear	0.02	381	2025-02-20 23:40:10.701004+00	f
1724	Field-Tested	0.02	381	2025-02-20 23:40:10.687754+00	f
1725	Well-Worn	0.02	381	2025-02-20 23:40:10.71525+00	f
1726	Battle-Scarred	0.02	381	2025-02-20 23:40:10.658018+00	f
1727	Factory New	6315.79	382	2025-02-15 23:05:36.154927+00	f
1728	Minimal Wear	49.53	382	2025-02-20 23:40:27.701569+00	f
1729	Field-Tested	9.91	382	2025-02-20 23:40:27.698568+00	f
1730	Well-Worn	16.13	382	2025-02-20 23:40:27.706569+00	f
1731	Battle-Scarred	10.84	382	2025-02-15 23:05:36.151926+00	f
1732	Factory New	\N	383	\N	f
1733	Minimal Wear	690.7	383	2025-02-20 23:40:16.251684+00	f
1734	Field-Tested	32.28	383	2025-02-20 23:40:16.244532+00	f
1735	Well-Worn	59.4	383	2025-02-20 23:40:16.259676+00	f
1736	Battle-Scarred	\N	383	\N	f
1737	Factory New	\N	384	\N	f
1738	Minimal Wear	\N	384	\N	f
1739	Field-Tested	13.78	384	2025-02-20 23:40:21.938281+00	f
1740	Well-Worn	\N	384	\N	f
1741	Battle-Scarred	83.5	384	2025-02-20 23:40:21.934281+00	f
1742	Factory New	\N	385	\N	f
1743	Minimal Wear	57.73	385	2025-02-15 18:54:53.870641+00	f
1744	Field-Tested	29	385	2025-02-20 23:40:23.913053+00	f
1745	Well-Worn	28.82	385	2025-02-20 23:40:23.918052+00	f
1746	Battle-Scarred	29.58	385	2025-02-20 23:40:23.908052+00	f
1747	Factory New	700.57	386	2025-02-20 23:40:54.097295+00	f
1748	Minimal Wear	46.32	386	2025-02-15 23:05:45.905769+00	f
1749	Field-Tested	25.24	386	2025-02-20 23:40:54.101295+00	f
1750	Well-Worn	\N	386	\N	f
1751	Battle-Scarred	37.44	386	2025-02-20 23:40:54.090295+00	f
1752	Factory New	\N	387	\N	f
1753	Minimal Wear	41.41	387	2025-02-20 23:40:21.6505+00	f
1754	Field-Tested	13.84	387	2025-02-20 23:40:21.646501+00	f
1755	Well-Worn	28	387	2025-02-20 23:40:21.6555+00	f
1756	Battle-Scarred	33	387	2025-02-15 18:56:47.459339+00	f
1757	Factory New	842.11	388	2025-02-15 23:05:35.338152+00	f
1758	Minimal Wear	52.37	388	2025-02-20 23:40:25.817074+00	f
1759	Field-Tested	\N	388	\N	f
1760	Well-Worn	101.18	388	2025-02-20 23:40:25.822074+00	f
1761	Battle-Scarred	18.25	388	2025-02-20 23:40:25.811075+00	f
1762	Factory New	\N	389	\N	f
1763	Minimal Wear	43.66	389	2025-02-20 23:40:22.674158+00	f
1764	Field-Tested	14.42	389	2025-02-20 23:40:22.670161+00	f
1765	Well-Worn	14.4	389	2025-02-20 23:40:22.686281+00	f
1766	Battle-Scarred	10.5	389	2025-02-15 18:55:46.669187+00	f
1767	Factory New	31.58	390	2025-02-20 23:40:54.455546+00	f
1768	Minimal Wear	4.57	390	2025-02-20 23:40:54.466547+00	f
1769	Field-Tested	2.17	390	2025-02-20 23:40:54.460546+00	f
1770	Well-Worn	4.66	390	2025-02-20 23:40:54.470547+00	f
1771	Battle-Scarred	3.02	390	2025-02-20 23:40:54.450547+00	f
1772	Factory New	\N	391	\N	f
1773	Minimal Wear	5.33	391	2025-02-20 23:40:17.594641+00	f
1774	Field-Tested	2.05	391	2025-02-20 23:40:17.58864+00	f
1775	Well-Worn	5.58	391	2025-02-20 23:40:17.599641+00	f
1776	Battle-Scarred	17.91	391	2025-02-20 23:40:17.584641+00	f
1777	Factory New	36	392	2025-02-15 18:52:58.258073+00	f
1778	Minimal Wear	6.06	392	2025-02-20 23:40:25.578032+00	f
1779	Field-Tested	2.34	392	2025-02-20 23:40:25.573031+00	f
1780	Well-Worn	6.05	392	2025-02-20 23:40:25.584031+00	f
1781	Battle-Scarred	2.36	392	2025-02-20 23:40:25.569031+00	f
1782	Factory New	161.1	393	2025-02-20 23:40:17.720526+00	f
1783	Minimal Wear	20.77	393	2025-02-20 23:40:17.730526+00	f
1784	Field-Tested	7.06	393	2025-02-20 23:40:17.725526+00	f
1785	Well-Worn	14.37	393	2025-02-20 23:40:17.735526+00	f
1786	Battle-Scarred	8.6	393	2025-02-20 23:40:17.716526+00	f
1787	Factory New	163.08	394	2025-02-20 23:40:20.240019+00	f
1788	Minimal Wear	199.9	394	2025-02-15 23:05:32.792085+00	f
1789	Factory New	16.84	395	2025-02-20 23:40:51.232339+00	f
1790	Minimal Wear	51	395	2025-02-20 23:40:51.252316+00	f
1791	Factory New	15.86	396	2025-02-20 23:40:16.719417+00	f
1792	Minimal Wear	16.95	396	2025-02-20 23:40:16.729418+00	f
1793	Field-Tested	19.7	396	2025-02-20 23:40:16.724417+00	f
1794	Well-Worn	22	396	2025-02-15 19:00:41.443652+00	f
1795	Factory New	104.22	397	2025-02-20 23:40:12.674471+00	f
1796	Minimal Wear	17.78	397	2025-02-20 23:40:12.694472+00	f
1797	Field-Tested	17.84	397	2025-02-20 23:40:12.685471+00	f
1798	Well-Worn	19.29	397	2025-02-20 23:40:12.70247+00	f
1799	Battle-Scarred	20.11	397	2025-02-20 23:40:12.66647+00	f
1800	Factory New	49.5	398	2025-02-20 23:40:29.883853+00	f
1801	Minimal Wear	35.57	398	2025-02-20 23:40:29.891853+00	f
1802	Field-Tested	22.11	398	2025-02-20 23:40:29.887853+00	f
1803	Well-Worn	19.4	398	2025-02-15 18:42:42.483094+00	f
1804	Battle-Scarred	18.18	398	2025-02-15 18:42:42.97609+00	f
1805	Factory New	32	399	2025-02-15 18:58:19.63889+00	f
1806	Minimal Wear	19.44	399	2025-02-15 18:58:19.152176+00	f
1807	Field-Tested	22.83	399	2025-02-20 23:40:19.390661+00	f
1808	Well-Worn	18.1	399	2025-02-15 18:58:19.028427+00	f
1809	Battle-Scarred	19.56	399	2025-02-15 18:58:19.864682+00	f
1810	Factory New	21.16	400	2025-02-20 23:40:28.532927+00	f
1811	Minimal Wear	26.62	400	2025-02-20 23:40:28.541927+00	f
1812	Field-Tested	21.06	400	2025-02-20 23:40:28.536926+00	f
1813	Well-Worn	19.11	400	2025-02-15 18:46:45.326574+00	f
1814	Battle-Scarred	38.45	400	2025-02-20 23:40:28.528928+00	f
1815	Factory New	21.74	401	2025-02-15 18:56:56.918654+00	f
1816	Minimal Wear	25.48	401	2025-02-20 23:40:21.262018+00	f
1817	Field-Tested	17.57	401	2025-02-20 23:40:21.257019+00	f
1818	Well-Worn	\N	401	\N	f
1819	Battle-Scarred	\N	401	\N	f
1820	Factory New	31.58	402	2025-02-20 23:40:09.174599+00	f
1821	Minimal Wear	5.7	402	2025-02-20 23:40:09.191598+00	f
1822	Field-Tested	3.51	402	2025-02-20 23:40:09.1846+00	f
1823	Well-Worn	3.41	402	2025-02-15 19:05:30.693229+00	f
1824	Battle-Scarred	3.69	402	2025-02-20 23:40:09.167598+00	f
1825	Factory New	14.09	403	2025-02-20 23:40:01.569973+00	f
1826	Minimal Wear	3.98	403	2025-02-20 23:40:01.577974+00	f
1827	Field-Tested	3.46	403	2025-02-20 23:40:01.573973+00	f
1828	Well-Worn	3.43	403	2025-02-15 23:05:25.732719+00	f
1829	Battle-Scarred	6.2	403	2025-02-20 23:40:01.565422+00	f
1830	Factory New	16.17	404	2025-02-15 19:04:38.004903+00	f
1831	Minimal Wear	3.54	404	2025-02-20 23:40:10.962466+00	f
1832	Field-Tested	3.49	404	2025-02-20 23:40:10.957465+00	f
1833	Well-Worn	4	404	2025-02-20 23:40:10.967982+00	f
1834	Battle-Scarred	3.65	404	2025-02-20 23:40:10.950949+00	f
1835	Factory New	15.55	405	2025-02-20 23:40:25.008895+00	f
1836	Minimal Wear	3.35	405	2025-02-20 23:40:25.017895+00	f
1837	Field-Tested	3.53	405	2025-02-20 23:40:25.014897+00	f
1838	Well-Worn	4.15	405	2025-02-20 23:40:25.021896+00	f
1839	Battle-Scarred	4.5	405	2025-02-20 23:40:25.002516+00	f
1840	Factory New	27.8	406	2025-02-20 23:40:23.385642+00	f
1841	Minimal Wear	3.82	406	2025-02-20 23:40:23.394643+00	f
1842	Field-Tested	3.44	406	2025-02-20 23:40:23.389641+00	f
1843	Well-Worn	3.51	406	2025-02-20 23:40:23.400011+00	f
1844	Battle-Scarred	3.67	406	2025-02-20 23:40:23.379641+00	f
1845	Factory New	5.8	407	2025-02-20 23:40:11.618821+00	f
1846	Minimal Wear	3.38	407	2025-02-20 23:40:11.634811+00	f
1847	Field-Tested	3.18	407	2025-02-20 23:40:11.626811+00	f
1848	Well-Worn	5.69	407	2025-02-20 23:40:11.641681+00	f
1849	Battle-Scarred	3.82	407	2025-02-20 23:40:11.608129+00	f
1850	Factory New	13340.74	408	2025-02-20 23:40:03.472762+00	f
1851	Minimal Wear	11530.86	408	2025-02-20 23:40:03.484762+00	f
1852	Field-Tested	9001.34	408	2025-02-20 23:40:03.477763+00	f
1853	Well-Worn	7940.07	408	2025-02-20 23:40:03.490277+00	f
1854	Battle-Scarred	16165.79	408	2025-02-20 23:40:03.468247+00	f
1855	Factory New	2956.57	409	2025-02-20 23:40:21.389835+00	f
1856	Minimal Wear	2956.72	409	2025-02-20 23:40:21.393835+00	f
1857	Field-Tested	\N	409	\N	f
1858	Well-Worn	\N	409	\N	f
1859	Battle-Scarred	\N	409	\N	f
1860	Factory New	389.21	410	2025-02-20 23:40:04.934193+00	f
1861	Minimal Wear	360.4	410	2025-02-20 23:40:04.942192+00	f
1862	Field-Tested	406.57	410	2025-02-20 23:40:04.938191+00	f
1863	Well-Worn	\N	410	\N	f
1864	Battle-Scarred	625.48	410	2025-02-20 23:40:04.929194+00	f
1865	Factory New	432.28	411	2025-02-20 23:40:24.384604+00	f
1866	Minimal Wear	418.12	411	2025-02-20 23:40:24.391604+00	f
1867	Field-Tested	356.4	411	2025-02-20 23:40:24.387604+00	f
1868	Well-Worn	\N	411	\N	f
1869	Battle-Scarred	\N	411	\N	f
1870	Factory New	396.94	412	2025-02-20 23:40:01.700873+00	f
1871	Minimal Wear	975.72	412	2025-02-20 23:40:01.708872+00	f
1872	Field-Tested	378.95	412	2025-02-20 23:40:01.705871+00	f
1873	Well-Worn	\N	412	\N	f
1874	Battle-Scarred	\N	412	\N	f
1875	Factory New	201.25	413	2025-02-20 23:40:54.426547+00	f
1876	Minimal Wear	132.91	413	2025-02-20 23:40:54.437546+00	f
1877	Field-Tested	158.83	413	2025-02-20 23:40:54.432547+00	f
1878	Well-Worn	509.57	413	2025-02-20 23:40:54.443548+00	f
1879	Battle-Scarred	122.76	413	2025-02-15 23:05:46.03454+00	f
1880	Factory New	153.42	414	2025-02-20 23:40:16.874875+00	f
1881	Minimal Wear	296.42	414	2025-02-20 23:40:16.884876+00	f
1882	Field-Tested	148.84	414	2025-02-20 23:40:16.880876+00	f
1883	Well-Worn	\N	414	\N	f
1884	Battle-Scarred	244.59	414	2025-02-20 23:40:16.870876+00	f
1885	Factory New	191.18	415	2025-02-20 23:40:27.336587+00	f
1886	Minimal Wear	131.29	415	2025-02-20 23:40:27.342587+00	f
1887	Field-Tested	130.1	415	2025-02-15 23:05:35.893629+00	f
1888	Well-Worn	\N	415	\N	f
1889	Battle-Scarred	314.84	415	2025-02-15 18:51:14.450138+00	f
1890	Factory New	161.53	416	2025-02-20 23:40:04.156731+00	f
1891	Minimal Wear	146.98	416	2025-02-20 23:40:04.16673+00	f
1892	Field-Tested	147.04	416	2025-02-20 23:40:04.161732+00	f
1893	Well-Worn	\N	416	\N	f
1894	Battle-Scarred	146.37	416	2025-02-20 23:40:04.15173+00	f
1895	Factory New	65.63	417	2025-02-20 23:40:15.484525+00	f
1896	Minimal Wear	47.77	417	2025-02-20 23:40:15.495526+00	f
1897	Field-Tested	36.57	417	2025-02-20 23:40:15.489524+00	f
1898	Well-Worn	39.93	417	2025-02-15 23:05:30.513589+00	f
1899	Battle-Scarred	44.22	417	2025-02-20 23:40:15.479525+00	f
1900	Factory New	55.29	418	2025-02-20 23:40:06.737647+00	f
1901	Minimal Wear	33.98	418	2025-02-20 23:40:06.755648+00	f
1902	Field-Tested	31.71	418	2025-02-20 23:40:06.747648+00	f
1903	Well-Worn	33.25	418	2025-02-20 23:40:06.764648+00	f
1904	Battle-Scarred	38.86	418	2025-02-20 23:40:06.730648+00	f
1905	Factory New	37	419	2025-02-20 23:40:53.514958+00	f
1906	Minimal Wear	31.3	419	2025-02-20 23:40:53.532118+00	f
1907	Field-Tested	36.99	419	2025-02-20 23:40:53.525724+00	f
1908	Factory New	35.82	420	2025-02-20 23:40:17.748526+00	f
1909	Minimal Wear	33.09	420	2025-02-20 23:40:17.756525+00	f
1910	Field-Tested	36.23	420	2025-02-20 23:40:17.752526+00	f
1911	Factory New	23.89	421	2025-02-20 23:40:29.697772+00	f
1912	Minimal Wear	6.62	421	2025-02-20 23:40:29.714605+00	f
1913	Field-Tested	6.33	421	2025-02-20 23:40:29.706286+00	f
1914	Well-Worn	6.94	421	2025-02-20 23:40:29.722639+00	f
1915	Battle-Scarred	8.76	421	2025-02-20 23:40:29.689167+00	f
1916	Factory New	14.95	422	2025-02-20 23:40:12.107185+00	f
1917	Minimal Wear	6.85	422	2025-02-20 23:40:12.116183+00	f
1918	Field-Tested	6.48	422	2025-02-20 23:40:12.112184+00	f
1919	Well-Worn	6.84	422	2025-02-20 23:40:12.120184+00	f
1920	Battle-Scarred	6.56	422	2025-02-20 23:40:12.103184+00	f
1921	Factory New	8.14	423	2025-02-20 23:40:08.246012+00	f
1922	Minimal Wear	6.98	423	2025-02-20 23:40:08.275528+00	f
1923	Field-Tested	6.1	423	2025-02-20 23:40:08.261014+00	f
1924	Well-Worn	6	423	2025-02-20 23:40:08.282528+00	f
1925	Battle-Scarred	6.17	423	2025-02-20 23:40:08.239013+00	f
1926	Factory New	12.61	424	2025-02-20 23:40:19.445481+00	f
1927	Minimal Wear	6.98	424	2025-02-20 23:40:19.45348+00	f
1928	Field-Tested	6.45	424	2025-02-20 23:40:19.44948+00	f
1929	Well-Worn	6.35	424	2025-02-20 23:40:19.457889+00	f
1930	Battle-Scarred	5.91	424	2025-02-20 23:40:19.43948+00	f
1931	Factory New	7.5	425	2025-02-20 23:40:28.145645+00	f
1932	Minimal Wear	7.42	425	2025-02-20 23:40:28.171547+00	f
1933	Field-Tested	6.69	425	2025-02-20 23:40:28.164544+00	f
1934	Well-Worn	8.09	425	2025-02-20 23:40:28.181541+00	f
1935	Battle-Scarred	7	425	2025-02-20 23:40:28.136644+00	f
1936	Factory New	\N	426	\N	f
1937	Minimal Wear	121.14	426	2025-02-20 23:40:49.790774+00	f
1938	Field-Tested	48.29	426	2025-02-20 23:40:49.787775+00	f
1939	Well-Worn	68.78	426	2025-02-15 23:05:44.786487+00	f
1940	Battle-Scarred	49.73	426	2025-02-20 23:40:49.782774+00	f
1941	Factory New	328.49	427	2025-02-20 23:40:23.972245+00	f
1942	Minimal Wear	77.2	427	2025-02-20 23:40:23.982245+00	f
1943	Field-Tested	24.16	427	2025-02-20 23:40:23.977245+00	f
1944	Well-Worn	30.5	427	2025-02-20 23:40:23.987245+00	f
1945	Battle-Scarred	52.35	427	2025-02-20 23:40:23.966246+00	f
1946	Factory New	422.67	428	2025-02-20 23:40:16.351614+00	f
1947	Minimal Wear	117.88	428	2025-02-20 23:40:16.360615+00	f
1948	Field-Tested	40.44	428	2025-02-20 23:40:16.356615+00	f
1949	Well-Worn	26.96	428	2025-02-20 23:40:16.364615+00	f
1950	Battle-Scarred	38.43	428	2025-02-20 23:40:16.347615+00	f
1951	Factory New	236.47	429	2025-02-20 23:40:54.404548+00	f
1952	Minimal Wear	23.96	429	2025-02-20 23:40:54.417547+00	f
1953	Field-Tested	11.37	429	2025-02-20 23:40:54.409547+00	f
1954	Well-Worn	19.54	429	2025-02-20 23:40:54.421547+00	f
1955	Battle-Scarred	10.13	429	2025-02-20 23:40:54.400547+00	f
1956	Factory New	\N	430	\N	f
1957	Minimal Wear	27.5	430	2025-02-20 23:40:24.669307+00	f
1958	Field-Tested	12.64	430	2025-02-15 23:05:34.756824+00	f
1959	Well-Worn	18.56	430	2025-02-20 23:40:24.673307+00	f
1960	Battle-Scarred	13.13	430	2025-02-15 23:05:34.754848+00	f
1961	Factory New	91.36	431	2025-02-20 23:40:51.610408+00	f
1962	Minimal Wear	29.84	431	2025-02-20 23:40:51.619406+00	f
1963	Field-Tested	11.54	431	2025-02-20 23:40:51.615407+00	f
1964	Well-Worn	19.44	431	2025-02-15 23:05:45.14467+00	f
1965	Battle-Scarred	17.7	431	2025-02-20 23:40:51.606407+00	f
1966	Factory New	\N	432	\N	f
1967	Minimal Wear	4.07	432	2025-02-20 23:40:18.009729+00	f
1968	Field-Tested	2.84	432	2025-02-20 23:40:18.004698+00	f
1969	Well-Worn	2.92	432	2025-02-20 23:40:18.015786+00	f
1970	Battle-Scarred	2.95	432	2025-02-20 23:40:17.998809+00	f
1971	Factory New	19.65	433	2025-02-20 23:40:25.674526+00	f
1972	Minimal Wear	5.28	433	2025-02-20 23:40:25.694197+00	f
1973	Field-Tested	3.25	433	2025-02-20 23:40:25.681527+00	f
1974	Well-Worn	3.62	433	2025-02-15 18:52:54.836784+00	f
1975	Battle-Scarred	4.33	433	2025-02-20 23:40:25.666525+00	f
1976	Factory New	\N	434	\N	f
1977	Minimal Wear	4.53	434	2025-02-20 23:40:30.497871+00	f
1978	Field-Tested	2.75	434	2025-02-20 23:40:30.485449+00	f
1979	Well-Worn	3.91	434	2025-02-20 23:40:30.506904+00	f
1980	Battle-Scarred	7.71	434	2025-02-20 23:40:30.473882+00	f
1981	Factory New	1789.48	435	2025-02-15 23:05:32.612754+00	f
1982	Minimal Wear	103.34	435	2025-02-20 23:40:19.612694+00	f
1983	Field-Tested	13.32	435	2025-02-20 23:40:19.607693+00	f
1984	Well-Worn	19.99	435	2025-02-20 23:40:19.616693+00	f
1985	Battle-Scarred	16.03	435	2025-02-20 23:40:19.603692+00	f
1986	Factory New	37.94	436	2025-02-20 23:40:23.121818+00	f
1987	Minimal Wear	58.95	436	2025-02-20 23:40:23.135082+00	f
1988	Factory New	203.43	437	2025-02-20 23:40:13.695017+00	f
1989	Minimal Wear	17.86	437	2025-02-20 23:40:13.706022+00	f
1990	Field-Tested	8.47	437	2025-02-20 23:40:13.700016+00	f
1991	Well-Worn	18.45	437	2025-02-15 19:02:44.20327+00	f
1992	Battle-Scarred	18.46	437	2025-02-20 23:40:13.689015+00	f
1993	Factory New	\N	438	\N	f
1994	Minimal Wear	26.32	438	2025-02-20 23:40:12.216391+00	f
1995	Field-Tested	10.78	438	2025-02-20 23:40:12.212391+00	f
1996	Well-Worn	26.14	438	2025-02-20 23:40:12.220755+00	f
1997	Battle-Scarred	15.03	438	2025-02-20 23:40:12.207391+00	f
1998	Factory New	132.06	439	2025-02-20 23:40:10.056742+00	f
1999	Minimal Wear	22.43	439	2025-02-15 19:05:01.62838+00	f
2000	Field-Tested	10.47	439	2025-02-20 23:40:10.064743+00	f
2001	Well-Worn	7.99	439	2025-02-15 19:05:01.505531+00	f
2002	Battle-Scarred	10.53	439	2025-02-20 23:40:10.049743+00	f
2003	Factory New	135.19	440	2025-02-15 23:05:27.977004+00	f
2004	Minimal Wear	13.02	440	2025-02-20 23:40:07.367392+00	f
2005	Field-Tested	5.21	440	2025-02-20 23:40:07.358393+00	f
2006	Well-Worn	9.39	440	2025-02-20 23:40:07.373393+00	f
2007	Battle-Scarred	7.78	440	2025-02-20 23:40:07.351393+00	f
2008	Factory New	353.93	441	2025-02-20 23:40:15.438978+00	f
2009	Minimal Wear	243.14	441	2025-02-20 23:40:15.447974+00	f
2010	Field-Tested	146.37	441	2025-02-20 23:40:15.442973+00	f
2011	Well-Worn	108.39	441	2025-02-20 23:40:15.451974+00	f
2012	Battle-Scarred	106.27	441	2025-02-20 23:40:15.434302+00	f
2013	Factory New	103.02	442	2025-02-20 23:40:03.811037+00	f
2014	Minimal Wear	48.8	442	2025-02-20 23:40:03.82098+00	f
2015	Field-Tested	34.75	442	2025-02-20 23:40:03.816985+00	f
2016	Well-Worn	49.53	442	2025-02-20 23:40:03.827981+00	f
2017	Battle-Scarred	44.89	442	2025-02-20 23:40:03.804035+00	f
2018	Factory New	62.72	443	2025-02-20 23:40:53.608716+00	f
2019	Minimal Wear	44.91	443	2025-02-20 23:40:53.627763+00	f
2020	Field-Tested	32.24	443	2025-02-20 23:40:53.617715+00	f
2021	Well-Worn	31.57	443	2025-02-20 23:40:53.635795+00	f
2022	Battle-Scarred	28.66	443	2025-02-20 23:40:53.603715+00	f
2023	Factory New	52.78	444	2025-02-20 23:40:04.331626+00	f
2024	Minimal Wear	9.4	444	2025-02-20 23:40:04.339626+00	f
2025	Field-Tested	10.94	444	2025-02-20 23:40:04.335626+00	f
2026	Well-Worn	13.44	444	2025-02-20 23:40:04.345627+00	f
2027	Battle-Scarred	14.5	444	2025-02-20 23:40:04.326627+00	f
2028	Factory New	17.04	445	2025-02-20 23:40:29.07391+00	f
2029	Minimal Wear	12.7	445	2025-02-20 23:40:29.089432+00	f
2030	Field-Tested	14.99	445	2025-02-20 23:40:29.082435+00	f
2031	Well-Worn	16.83	445	2025-02-15 23:05:36.745221+00	f
2032	Factory New	16.79	446	2025-02-20 23:40:55.005179+00	f
2033	Minimal Wear	28.11	446	2025-02-20 23:40:55.022358+00	f
2034	Field-Tested	13.5	446	2025-02-20 23:40:55.015359+00	f
2035	Well-Worn	\N	446	\N	f
2036	Battle-Scarred	\N	446	\N	f
2037	Factory New	44.12	447	2025-02-20 23:40:12.848094+00	f
2038	Minimal Wear	4.55	447	2025-02-20 23:40:12.865094+00	f
2039	Field-Tested	3.27	447	2025-02-20 23:40:12.858093+00	f
2040	Well-Worn	4.11	447	2025-02-15 23:05:29.625587+00	f
2041	Battle-Scarred	4.43	447	2025-02-20 23:40:12.841471+00	f
2042	Factory New	21.63	448	2025-02-20 23:40:05.582458+00	f
2043	Minimal Wear	2.96	448	2025-02-20 23:40:05.591234+00	f
2044	Field-Tested	2.22	448	2025-02-20 23:40:05.587234+00	f
2045	Well-Worn	2.6	448	2025-02-20 23:40:05.605068+00	f
2046	Battle-Scarred	1.99	448	2025-02-20 23:40:05.579458+00	f
2047	Factory New	20.12	449	2025-02-20 23:40:22.654159+00	f
2048	Minimal Wear	2.78	449	2025-02-20 23:40:22.663158+00	f
2049	Field-Tested	2.43	449	2025-02-20 23:40:22.658159+00	f
2050	Well-Worn	3.78	449	2025-02-20 23:40:22.667159+00	f
2051	Battle-Scarred	3.04	449	2025-02-20 23:40:22.650159+00	f
2052	Factory New	13.15	450	2025-02-20 23:40:19.218367+00	f
2053	Minimal Wear	3.7	450	2025-02-20 23:40:19.228369+00	f
2054	Field-Tested	2.05	450	2025-02-20 23:40:19.222368+00	f
2055	Well-Worn	2.67	450	2025-02-20 23:40:19.232367+00	f
2056	Battle-Scarred	2.62	450	2025-02-20 23:40:19.215368+00	f
2057	Factory New	34.5	451	2025-02-15 18:57:13.702234+00	f
2058	Minimal Wear	4.9	451	2025-02-20 23:40:21.153378+00	f
2059	Field-Tested	1.8	451	2025-02-20 23:40:21.146378+00	f
2060	Well-Worn	1.62	451	2025-02-15 23:05:32.980861+00	f
2061	Battle-Scarred	0.97	451	2025-02-20 23:40:21.138381+00	f
2062	Factory New	27.79	452	2025-02-20 23:40:18.359135+00	f
2063	Minimal Wear	1.11	452	2025-02-20 23:40:18.372403+00	f
2064	Field-Tested	0.45	452	2025-02-20 23:40:18.366402+00	f
2065	Well-Worn	15.34	452	2025-02-20 23:40:18.381817+00	f
2066	Battle-Scarred	0.48	452	2025-02-20 23:40:18.354072+00	f
2067	Factory New	17.67	453	2025-02-20 23:40:31.052498+00	f
2068	Minimal Wear	0.89	453	2025-02-20 23:40:31.064499+00	f
2069	Field-Tested	0.49	453	2025-02-20 23:40:31.057498+00	f
2070	Well-Worn	0.78	453	2025-02-20 23:40:31.071499+00	f
2071	Battle-Scarred	0.52	453	2025-02-20 23:40:31.048386+00	f
2072	Factory New	8.06	454	2025-02-20 23:40:13.716015+00	f
2073	Minimal Wear	1.06	454	2025-02-20 23:40:13.729748+00	f
2074	Field-Tested	0.46	454	2025-02-20 23:40:13.721532+00	f
2075	Well-Worn	0.77	454	2025-02-20 23:40:13.734439+00	f
2076	Battle-Scarred	6.58	454	2025-02-20 23:40:13.711016+00	f
2077	Factory New	6.54	455	2025-02-20 23:40:52.362294+00	f
2078	Minimal Wear	1.24	455	2025-02-20 23:40:52.373294+00	f
2079	Field-Tested	0.6	455	2025-02-20 23:40:52.367293+00	f
2080	Well-Worn	1.11	455	2025-02-20 23:40:52.378293+00	f
2081	Battle-Scarred	0.51	455	2025-02-20 23:40:52.355296+00	f
2082	Factory New	4435.08	456	2025-02-20 23:40:01.367076+00	f
2083	Minimal Wear	1289.58	456	2025-02-20 23:40:01.375075+00	f
2084	Field-Tested	574.79	456	2025-02-20 23:40:01.371076+00	f
2085	Well-Worn	336.34	456	2025-02-20 23:40:01.381076+00	f
2086	Battle-Scarred	290.48	456	2025-02-15 23:05:25.62872+00	f
2087	Factory New	2245.6	457	2025-02-20 23:40:00.346304+00	f
2088	Minimal Wear	1702.4	457	2025-02-20 23:40:00.357302+00	f
2089	Field-Tested	1067.04	457	2025-02-20 23:40:00.352302+00	f
2090	Well-Worn	\N	457	\N	f
2091	Battle-Scarred	632.83	457	2025-02-20 23:40:00.338303+00	f
2092	Factory New	402.05	458	2025-02-20 23:40:09.614334+00	f
2093	Minimal Wear	313.57	458	2025-02-20 23:40:09.647335+00	f
2094	Field-Tested	326.32	458	2025-02-20 23:40:09.628336+00	f
2095	Well-Worn	\N	458	\N	f
2096	Battle-Scarred	\N	458	\N	f
2097	Factory New	361.68	459	2025-02-20 23:40:15.848861+00	f
2098	Minimal Wear	320.22	459	2025-02-20 23:40:15.85686+00	f
2099	Field-Tested	308.13	459	2025-02-20 23:40:15.852861+00	f
2100	Well-Worn	\N	459	\N	f
2101	Battle-Scarred	\N	459	\N	f
2102	Factory New	351.1	460	2025-02-20 23:40:05.497458+00	f
2103	Minimal Wear	354.82	460	2025-02-20 23:40:05.508459+00	f
2104	Field-Tested	339.07	460	2025-02-20 23:40:05.504459+00	f
2105	Well-Worn	\N	460	\N	f
2106	Battle-Scarred	272.03	460	2025-02-15 23:05:27.421098+00	f
2107	Factory New	367.66	461	2025-02-20 23:40:05.482585+00	f
2108	Minimal Wear	339.49	461	2025-02-20 23:40:05.491458+00	f
2109	Field-Tested	323.8	461	2025-02-20 23:40:05.487585+00	f
2110	Well-Worn	\N	461	\N	f
2111	Battle-Scarred	\N	461	\N	f
2112	Factory New	159.59	462	2025-02-20 23:40:11.153416+00	f
2113	Minimal Wear	147.69	462	2025-02-20 23:40:11.167415+00	f
2114	Field-Tested	170.71	462	2025-02-20 23:40:11.159415+00	f
2115	Well-Worn	\N	462	\N	f
2116	Battle-Scarred	\N	462	\N	f
2117	Factory New	159.25	463	2025-02-20 23:40:17.841525+00	f
2118	Minimal Wear	147.85	463	2025-02-20 23:40:17.851039+00	f
2119	Field-Tested	141.93	463	2025-02-20 23:40:17.847039+00	f
2120	Well-Worn	\N	463	\N	f
2121	Battle-Scarred	\N	463	\N	f
2122	Factory New	179.8	464	2025-02-20 23:40:50.394657+00	f
2123	Minimal Wear	142.98	464	2025-02-20 23:40:50.436559+00	f
2124	Field-Tested	136.46	464	2025-02-20 23:40:50.425242+00	f
2125	Well-Worn	138.97	464	2025-02-20 23:40:50.463766+00	f
2126	Battle-Scarred	\N	464	\N	f
2127	Factory New	33.86	465	2025-02-20 23:40:05.147338+00	f
2128	Minimal Wear	30.69	465	2025-02-20 23:40:05.154339+00	f
2129	Field-Tested	29.3	465	2025-02-20 23:40:05.151339+00	f
2130	Well-Worn	35.84	465	2025-02-20 23:40:05.158338+00	f
2131	Battle-Scarred	27.56	465	2025-02-20 23:40:05.140826+00	f
2132	Factory New	32.15	466	2025-02-20 23:40:23.534886+00	f
2133	Minimal Wear	29.54	466	2025-02-20 23:40:23.555886+00	f
2134	Field-Tested	28.76	466	2025-02-20 23:40:23.541887+00	f
2135	Well-Worn	35.2	466	2025-02-20 23:40:23.561889+00	f
2136	Battle-Scarred	30	466	2025-02-20 23:40:23.529888+00	f
2137	Factory New	9.44	467	2025-02-20 23:40:49.39948+00	f
2138	Minimal Wear	5.72	467	2025-02-20 23:40:49.408481+00	f
2139	Field-Tested	3.62	467	2025-02-20 23:40:49.404481+00	f
2140	Well-Worn	4.6	467	2025-02-20 23:40:49.412481+00	f
2141	Battle-Scarred	4.74	467	2025-02-20 23:40:49.39448+00	f
2142	Factory New	6.76	468	2025-02-20 23:40:25.352395+00	f
2143	Minimal Wear	4.04	468	2025-02-20 23:40:25.360395+00	f
2144	Field-Tested	3.47	468	2025-02-20 23:40:25.356396+00	f
2145	Well-Worn	4.09	468	2025-02-20 23:40:25.365395+00	f
2146	Battle-Scarred	4.22	468	2025-02-20 23:40:25.349395+00	f
2147	Factory New	6.68	469	2025-02-20 23:40:23.890053+00	f
2148	Minimal Wear	5.19	469	2025-02-20 23:40:23.900053+00	f
2149	Field-Tested	5.79	469	2025-02-20 23:40:23.896053+00	f
2150	Well-Worn	5.86	469	2025-02-20 23:40:23.904053+00	f
2151	Battle-Scarred	4.94	469	2025-02-20 23:40:23.8853+00	f
2152	Factory New	5.35	470	2025-02-20 23:40:10.907762+00	f
2153	Minimal Wear	4.04	470	2025-02-20 23:40:10.918307+00	f
2154	Field-Tested	3.46	470	2025-02-20 23:40:10.914313+00	f
2155	Well-Worn	4.83	470	2025-02-15 19:04:38.829538+00	f
2156	Battle-Scarred	3.27	470	2025-02-20 23:40:10.902531+00	f
2157	Factory New	5.31	471	2025-02-15 23:05:37.03907+00	f
2158	Minimal Wear	4.2	471	2025-02-20 23:40:30.087629+00	f
2159	Field-Tested	3.69	471	2025-02-20 23:40:30.080631+00	f
2160	Well-Worn	9.06	471	2025-02-20 23:40:30.097033+00	f
2161	Battle-Scarred	3.84	471	2025-02-20 23:40:30.071559+00	f
2162	Factory New	4.13	472	2025-02-20 23:40:15.575342+00	f
2163	Minimal Wear	1.2	472	2025-02-20 23:40:15.584343+00	f
2164	Field-Tested	0.38	472	2025-02-20 23:40:15.580343+00	f
2165	Well-Worn	0.58	472	2025-02-20 23:40:15.588342+00	f
2166	Battle-Scarred	0.33	472	2025-02-20 23:40:15.570343+00	f
2167	Factory New	1.03	473	2025-02-20 23:40:28.899751+00	f
2168	Factory New	0.9	474	2025-02-20 23:40:09.862695+00	f
2169	Minimal Wear	0.57	474	2025-02-20 23:40:09.873676+00	f
2170	Field-Tested	0.42	474	2025-02-20 23:40:09.867674+00	f
2171	Well-Worn	0.49	474	2025-02-20 23:40:09.878675+00	f
2172	Factory New	0.86	475	2025-02-20 23:40:08.708089+00	f
2173	Minimal Wear	0.64	475	2025-02-20 23:40:08.722642+00	f
2174	Field-Tested	0.38	475	2025-02-20 23:40:08.714088+00	f
2175	Well-Worn	0.41	475	2025-02-20 23:40:08.730975+00	f
2176	Battle-Scarred	0.43	475	2025-02-20 23:40:08.699088+00	f
2177	Factory New	0.89	476	2025-02-20 23:40:52.89755+00	f
2178	Minimal Wear	0.11	476	2025-02-20 23:40:52.931547+00	f
2179	Field-Tested	0.08	476	2025-02-20 23:40:52.909547+00	f
2180	Well-Worn	0.12	476	2025-02-20 23:40:52.941547+00	f
2181	Battle-Scarred	0.09	476	2025-02-20 23:40:52.887549+00	f
2182	Factory New	0.49	477	2025-02-20 23:40:20.62543+00	f
2183	Minimal Wear	0.13	477	2025-02-20 23:40:20.657099+00	f
2184	Field-Tested	0.07	477	2025-02-20 23:40:20.642945+00	f
2185	Well-Worn	0.08	477	2025-02-20 23:40:20.666098+00	f
2186	Battle-Scarred	0.16	477	2025-02-20 23:40:20.611392+00	f
2187	Factory New	0.44	478	2025-02-20 23:40:01.586973+00	f
2188	Minimal Wear	0.1	478	2025-02-20 23:40:01.599974+00	f
2189	Field-Tested	0.07	478	2025-02-20 23:40:01.590972+00	f
2190	Well-Worn	0.08	478	2025-02-20 23:40:01.603974+00	f
2191	Battle-Scarred	0.07	478	2025-02-20 23:40:01.581973+00	f
2192	Factory New	0.12	479	2025-02-20 23:40:11.058646+00	f
2193	Minimal Wear	0.1	479	2025-02-20 23:40:11.067646+00	f
2194	Field-Tested	0.06	479	2025-02-20 23:40:11.064647+00	f
2195	Well-Worn	0.07	479	2025-02-20 23:40:11.073645+00	f
2196	Battle-Scarred	0.08	479	2025-02-20 23:40:11.054646+00	f
2197	Factory New	0.12	480	2025-02-20 23:40:12.189391+00	f
2198	Minimal Wear	0.1	480	2025-02-20 23:40:12.198391+00	f
2199	Field-Tested	0.07	480	2025-02-20 23:40:12.194394+00	f
2200	Well-Worn	0.09	480	2025-02-20 23:40:12.202391+00	f
2201	Battle-Scarred	0.07	480	2025-02-20 23:40:12.185391+00	f
2202	Factory New	0.12	481	2025-02-20 23:40:13.845305+00	f
2203	Minimal Wear	0.09	481	2025-02-20 23:40:13.864302+00	f
2204	Field-Tested	0.06	481	2025-02-20 23:40:13.855302+00	f
2205	Well-Worn	0.08	481	2025-02-20 23:40:13.870306+00	f
2206	Battle-Scarred	0.07	481	2025-02-20 23:40:13.838263+00	f
2207	Factory New	0.2	482	2025-02-20 23:40:28.984908+00	f
2208	Minimal Wear	0.03	482	2025-02-20 23:40:28.991908+00	f
2209	Field-Tested	0.02	482	2025-02-20 23:40:28.988908+00	f
2210	Well-Worn	0.03	482	2025-02-20 23:40:28.996909+00	f
2211	Battle-Scarred	0.02	482	2025-02-20 23:40:28.97991+00	f
2212	Factory New	0.1	483	2025-02-20 23:40:05.818308+00	f
2213	Minimal Wear	0.02	483	2025-02-20 23:40:05.826307+00	f
2214	Field-Tested	0.02	483	2025-02-20 23:40:05.822307+00	f
2215	Well-Worn	0.02	483	2025-02-20 23:40:05.831307+00	f
2216	Battle-Scarred	0.02	483	2025-02-20 23:40:05.814307+00	f
2217	Factory New	0.05	484	2025-02-20 23:40:27.382476+00	f
2218	Minimal Wear	0.02	484	2025-02-20 23:40:27.391476+00	f
2219	Field-Tested	0.02	484	2025-02-20 23:40:27.387476+00	f
2220	Well-Worn	0.02	484	2025-02-20 23:40:27.395478+00	f
2221	Battle-Scarred	0.02	484	2025-02-20 23:40:27.378477+00	f
2222	Factory New	0.06	485	2025-02-20 23:40:18.908529+00	f
2223	Minimal Wear	0.02	485	2025-02-20 23:40:18.918529+00	f
2224	Field-Tested	0.02	485	2025-02-20 23:40:18.913529+00	f
2225	Well-Worn	0.02	485	2025-02-20 23:40:18.922528+00	f
2226	Battle-Scarred	0.02	485	2025-02-20 23:40:18.905529+00	f
2227	Factory New	0.03	486	2025-02-20 23:40:49.351999+00	f
2228	Minimal Wear	0.02	486	2025-02-20 23:40:49.362001+00	f
2229	Field-Tested	0.02	486	2025-02-20 23:40:49.358001+00	f
2230	Well-Worn	0.02	486	2025-02-20 23:40:49.367+00	f
2231	Battle-Scarred	0.02	486	2025-02-20 23:40:49.349001+00	f
2232	Factory New	18251.16	487	2025-02-20 23:40:01.335309+00	f
2233	Minimal Wear	13140.8	487	2025-02-20 23:40:01.343309+00	f
2234	Field-Tested	9062.32	487	2025-02-20 23:40:01.34031+00	f
2235	Well-Worn	5913.27	487	2025-02-20 23:40:01.347309+00	f
2236	Battle-Scarred	7337.77	487	2025-02-15 23:05:25.603296+00	f
2237	Factory New	3252.39	488	2025-02-20 23:40:21.156377+00	f
2238	Minimal Wear	3368.43	488	2025-02-15 23:05:32.988889+00	f
2239	Field-Tested	2217.39	488	2025-02-20 23:40:21.16238+00	f
2240	Well-Worn	\N	488	\N	f
2241	Battle-Scarred	\N	488	\N	f
2242	Factory New	475.12	489	2025-02-20 23:40:29.766279+00	f
2243	Minimal Wear	393.92	489	2025-02-20 23:40:29.775598+00	f
2244	Field-Tested	\N	489	\N	f
2245	Well-Worn	\N	489	\N	f
2246	Battle-Scarred	\N	489	\N	f
2247	Factory New	397.61	490	2025-02-20 23:40:01.788741+00	f
2248	Minimal Wear	372.88	490	2025-02-20 23:40:01.800742+00	f
2249	Field-Tested	517.43	490	2025-02-20 23:40:01.794741+00	f
2250	Well-Worn	\N	490	\N	f
2251	Battle-Scarred	\N	490	\N	f
2252	Factory New	445.89	491	2025-02-20 23:40:13.38773+00	f
2253	Minimal Wear	409.44	491	2025-02-20 23:40:13.399759+00	f
2254	Field-Tested	739.19	491	2025-02-20 23:40:13.393761+00	f
2255	Well-Worn	\N	491	\N	f
2256	Battle-Scarred	\N	491	\N	f
2257	Factory New	209.36	492	2025-02-20 23:40:08.621203+00	f
2258	Minimal Wear	133.65	492	2025-02-20 23:40:08.653581+00	f
2259	Field-Tested	160.64	492	2025-02-20 23:40:08.634575+00	f
2260	Well-Worn	654.78	492	2025-02-20 23:40:08.663587+00	f
2261	Battle-Scarred	\N	492	\N	f
2262	Factory New	161.1	493	2025-02-20 23:40:09.254381+00	f
2263	Minimal Wear	137.46	493	2025-02-20 23:40:09.270379+00	f
2264	Field-Tested	133.68	493	2025-02-20 23:40:09.262382+00	f
2265	Well-Worn	\N	493	\N	f
2266	Battle-Scarred	\N	493	\N	f
2267	Factory New	146.8	494	2025-02-20 23:40:51.526751+00	f
2268	Minimal Wear	140.66	494	2025-02-20 23:40:51.536751+00	f
2269	Field-Tested	139.7	494	2025-02-20 23:40:51.532751+00	f
2270	Well-Worn	\N	494	\N	f
2271	Battle-Scarred	\N	494	\N	f
2272	Factory New	156.8	495	2025-02-20 23:40:19.540071+00	f
2273	Minimal Wear	141.02	495	2025-02-20 23:40:19.549071+00	f
2274	Field-Tested	155.22	495	2025-02-20 23:40:19.545073+00	f
2275	Well-Worn	\N	495	\N	f
2276	Battle-Scarred	\N	495	\N	f
2277	Factory New	37.59	496	2025-02-20 23:40:15.829959+00	f
2278	Minimal Wear	34.06	496	2025-02-20 23:40:15.837959+00	f
2279	Field-Tested	33.59	496	2025-02-20 23:40:15.833959+00	f
2280	Well-Worn	77.38	496	2025-02-20 23:40:15.841958+00	f
2281	Battle-Scarred	37.4	496	2025-02-20 23:40:15.824959+00	f
2282	Factory New	35.49	497	2025-02-20 23:40:54.008295+00	f
2283	Minimal Wear	33.93	497	2025-02-20 23:40:54.024295+00	f
2284	Field-Tested	32.32	497	2025-02-20 23:40:54.016296+00	f
2285	Well-Worn	38.55	497	2025-02-20 23:40:54.034294+00	f
2286	Battle-Scarred	41.48	497	2025-02-20 23:40:54.000294+00	f
2287	Factory New	34.7	498	2025-02-20 23:40:25.108222+00	f
2288	Minimal Wear	33.33	498	2025-02-20 23:40:25.124336+00	f
2289	Field-Tested	33.83	498	2025-02-20 23:40:25.117916+00	f
2290	Well-Worn	37.92	498	2025-02-20 23:40:25.129009+00	f
2291	Battle-Scarred	37.67	498	2025-02-20 23:40:25.102221+00	f
2292	Factory New	37.22	499	2025-02-20 23:40:49.997484+00	f
2293	Minimal Wear	34.62	499	2025-02-20 23:40:50.015442+00	f
2294	Field-Tested	36.34	499	2025-02-20 23:40:50.007486+00	f
2295	Well-Worn	56.89	499	2025-02-15 18:05:53.315899+00	f
2296	Battle-Scarred	86.23	499	2025-02-20 23:40:49.992601+00	f
2297	Factory New	5.89	500	2025-02-20 23:40:17.542994+00	f
2298	Minimal Wear	5.43	500	2025-02-20 23:40:17.557993+00	f
2299	Field-Tested	5.02	500	2025-02-20 23:40:17.551994+00	f
2300	Well-Worn	6.34	500	2025-02-20 23:40:17.562994+00	f
2301	Battle-Scarred	44.05	500	2025-02-20 23:40:17.527996+00	f
2302	Factory New	7.55	501	2025-02-20 23:40:14.010833+00	f
2303	Minimal Wear	5.09	501	2025-02-20 23:40:14.046087+00	f
2304	Field-Tested	5	501	2025-02-20 23:40:14.02983+00	f
2305	Well-Worn	5.2	501	2025-02-20 23:40:14.059219+00	f
2306	Battle-Scarred	4.83	501	2025-02-20 23:40:13.99183+00	f
2307	Factory New	6.06	502	2025-02-20 23:40:26.207225+00	f
2308	Minimal Wear	5.37	502	2025-02-20 23:40:26.242226+00	f
2309	Field-Tested	5.18	502	2025-02-20 23:40:26.223239+00	f
2310	Well-Worn	11.1	502	2025-02-20 23:40:26.257225+00	f
2311	Battle-Scarred	6.1	502	2025-02-20 23:40:26.201392+00	f
2312	Factory New	5.63	503	2025-02-20 23:40:30.527159+00	f
2313	Minimal Wear	5.55	503	2025-02-20 23:40:30.55029+00	f
2314	Field-Tested	5.13	503	2025-02-20 23:40:30.538189+00	f
2315	Well-Worn	5.7	503	2025-02-20 23:40:30.559951+00	f
2316	Battle-Scarred	7.66	503	2025-02-20 23:40:30.518162+00	f
2317	Factory New	5.46	504	2025-02-20 23:40:18.491657+00	f
2318	Minimal Wear	5.23	504	2025-02-20 23:40:18.502658+00	f
2319	Field-Tested	5.11	504	2025-02-20 23:40:18.496658+00	f
2320	Well-Worn	5.09	504	2025-02-20 23:40:18.506657+00	f
2321	Battle-Scarred	4.92	504	2025-02-20 23:40:18.487657+00	f
2322	Factory New	0.11	505	2025-02-20 23:40:49.925602+00	f
2323	Minimal Wear	0.1	505	2025-02-20 23:40:49.940602+00	f
2324	Field-Tested	0.1	505	2025-02-20 23:40:49.934601+00	f
2325	Well-Worn	0.6	505	2025-02-20 23:40:49.944602+00	f
2326	Factory New	0.83	506	2025-02-20 23:40:05.618095+00	f
2327	Minimal Wear	0.56	506	2025-02-20 23:40:05.627132+00	f
2328	Field-Tested	0.39	506	2025-02-20 23:40:05.62213+00	f
2329	Well-Worn	0.36	506	2025-02-20 23:40:05.63413+00	f
2330	Battle-Scarred	0.39	506	2025-02-20 23:40:05.613467+00	f
2331	Factory New	0.88	507	2025-02-20 23:40:29.94652+00	f
2332	Minimal Wear	0.65	507	2025-02-20 23:40:29.965657+00	f
2333	Field-Tested	0.28	507	2025-02-20 23:40:29.954657+00	f
2334	Well-Worn	0.58	507	2025-02-20 23:40:29.972389+00	f
2335	Factory New	4.29	508	2025-02-20 23:40:16.592725+00	f
2336	Minimal Wear	0.34	508	2025-02-20 23:40:16.601726+00	f
2337	Field-Tested	0.13	508	2025-02-20 23:40:16.597725+00	f
2338	Well-Worn	0.14	508	2025-02-20 23:40:16.608725+00	f
2339	Battle-Scarred	0.13	508	2025-02-20 23:40:16.587725+00	f
2340	Factory New	0.18	509	2025-02-20 23:40:16.779762+00	f
2341	Minimal Wear	0.13	509	2025-02-20 23:40:16.787762+00	f
2342	Field-Tested	0.13	509	2025-02-20 23:40:16.783762+00	f
2343	Factory New	0.12	510	2025-02-20 23:40:18.054299+00	f
2344	Minimal Wear	0.17	510	2025-02-20 23:40:18.058922+00	f
2345	Factory New	0.17	511	2025-02-20 23:40:23.875299+00	f
2346	Minimal Wear	0.16	511	2025-02-20 23:40:23.880299+00	f
2347	Factory New	0.16	512	2025-02-20 23:40:24.338093+00	f
2348	Minimal Wear	0.12	512	2025-02-20 23:40:24.348092+00	f
2349	Field-Tested	0.13	512	2025-02-20 23:40:24.342092+00	f
2350	Well-Worn	0.12	512	2025-02-20 23:40:24.354093+00	f
2351	Factory New	0.14	513	2025-02-20 23:40:27.348963+00	f
2352	Minimal Wear	0.15	513	2025-02-20 23:40:27.352476+00	f
2353	Factory New	0.12	514	2025-02-20 23:40:09.36599+00	f
2354	Minimal Wear	0.03	514	2025-02-20 23:40:09.374989+00	f
2355	Field-Tested	0.02	514	2025-02-20 23:40:09.369989+00	f
2356	Well-Worn	0.03	514	2025-02-20 23:40:09.381989+00	f
2357	Battle-Scarred	0.02	514	2025-02-20 23:40:09.36199+00	f
2358	Factory New	0.11	515	2025-02-20 23:40:10.929353+00	f
2359	Minimal Wear	0.03	515	2025-02-20 23:40:10.93995+00	f
2360	Field-Tested	0.02	515	2025-02-20 23:40:10.934867+00	f
2361	Well-Worn	0.03	515	2025-02-20 23:40:10.946948+00	f
2362	Battle-Scarred	0.02	515	2025-02-20 23:40:10.922826+00	f
2363	Factory New	0.14	516	2025-02-20 23:40:05.791709+00	f
2364	Minimal Wear	0.03	516	2025-02-20 23:40:05.803709+00	f
2365	Field-Tested	0.02	516	2025-02-20 23:40:05.797709+00	f
2366	Well-Worn	0.03	516	2025-02-20 23:40:05.808307+00	f
2367	Battle-Scarred	0.02	516	2025-02-20 23:40:05.787709+00	f
2368	Factory New	0.09	517	2025-02-20 23:40:22.058437+00	f
2369	Minimal Wear	0.03	517	2025-02-20 23:40:22.068439+00	f
2370	Field-Tested	0.02	517	2025-02-20 23:40:22.064437+00	f
2371	Well-Worn	0.02	517	2025-02-20 23:40:22.072437+00	f
2372	Battle-Scarred	0.02	517	2025-02-20 23:40:22.054437+00	f
2373	Factory New	0.11	518	2025-02-20 23:40:26.328633+00	f
2374	Minimal Wear	0.02	518	2025-02-20 23:40:26.346386+00	f
2375	Field-Tested	0.02	518	2025-02-20 23:40:26.333633+00	f
2376	Well-Worn	0.02	518	2025-02-20 23:40:26.351385+00	f
2377	Battle-Scarred	0.02	518	2025-02-20 23:40:26.315633+00	f
2378	Factory New	0.09	519	2025-02-20 23:40:52.38834+00	f
2379	Minimal Wear	0.02	519	2025-02-20 23:40:52.39834+00	f
2380	Field-Tested	0.02	519	2025-02-20 23:40:52.39334+00	f
2381	Well-Worn	0.03	519	2025-02-20 23:40:52.403341+00	f
2382	Battle-Scarred	0.02	519	2025-02-20 23:40:52.383293+00	f
2383	Field-Tested	11.24	520	2025-02-20 23:40:05.841309+00	f
2384	Well-Worn	6.9	520	2025-02-20 23:40:05.865309+00	f
2385	Battle-Scarred	8.99	520	2025-02-20 23:40:05.835307+00	f
2386	Factory New	143.98	521	2025-02-20 23:39:59.756258+00	f
2387	Minimal Wear	41.32	521	2025-02-20 23:39:59.766257+00	f
2388	Field-Tested	41.29	521	2025-02-20 23:39:59.761258+00	f
2389	Well-Worn	48.65	521	2025-02-20 23:39:59.770257+00	f
2390	Battle-Scarred	41.06	521	2025-02-20 23:39:59.752258+00	f
2391	Factory New	29.82	522	2025-02-15 23:05:34.778491+00	f
2392	Minimal Wear	4.76	522	2025-02-20 23:40:24.704959+00	f
2393	Field-Tested	3.63	522	2025-02-20 23:40:24.699959+00	f
2394	Well-Worn	16.57	522	2025-02-15 18:54:07.366078+00	f
2395	Battle-Scarred	8.88	522	2025-02-15 23:05:34.776521+00	f
2396	Factory New	16.08	523	2025-02-20 23:40:25.439396+00	f
2397	Minimal Wear	15.63	523	2025-02-20 23:40:25.445396+00	f
2398	Factory New	30.96	524	2025-02-20 23:40:17.645696+00	f
2399	Minimal Wear	8.56	524	2025-02-20 23:40:17.653692+00	f
2400	Field-Tested	2.82	524	2025-02-20 23:40:17.649692+00	f
2401	Well-Worn	6.62	524	2025-02-20 23:40:17.656693+00	f
2402	Battle-Scarred	6.34	524	2025-02-20 23:40:17.63964+00	f
2403	Factory New	103.16	525	2025-02-20 23:40:54.966179+00	f
2404	Minimal Wear	3.62	525	2025-02-20 23:40:54.98618+00	f
2405	Field-Tested	2.33	525	2025-02-20 23:40:54.975181+00	f
2406	Well-Worn	3.67	525	2025-02-20 23:40:54.994179+00	f
2407	Battle-Scarred	3.67	525	2025-02-20 23:40:54.957177+00	f
2408	Field-Tested	0.59	1709	2025-02-20 23:40:37.717805+00	t
2409	Factory New	4.8	1709	2025-02-20 23:40:37.706581+00	t
2410	Minimal Wear	1.02	1709	2025-02-20 23:40:37.722805+00	t
2411	Well-Worn	0.45	1709	2025-02-20 23:40:37.737469+00	t
2412	Battle-Scarred	0.49	1709	2025-02-20 23:40:37.701579+00	t
2413	Factory New	149.99	527	2025-02-20 23:40:15.327707+00	f
2414	Minimal Wear	52.86	527	2025-02-20 23:40:15.364302+00	f
2415	Field-Tested	23.04	527	2025-02-20 23:40:15.349987+00	f
2416	Well-Worn	20.27	527	2025-02-20 23:40:15.369302+00	f
2417	Battle-Scarred	18.25	527	2025-02-20 23:40:15.323707+00	f
2418	Factory New	353.94	527	2025-02-20 23:40:39.187894+00	t
2419	Minimal Wear	147.83	527	2025-02-20 23:40:39.199609+00	t
2420	Field-Tested	72.15	527	2025-02-20 23:40:39.193609+00	t
2421	Well-Worn	53.86	527	2025-02-15 23:05:40.152798+00	t
2422	Battle-Scarred	73.93	527	2025-02-20 23:40:39.182893+00	t
2423	Factory New	12.62	529	2025-02-20 23:40:17.210337+00	f
2424	Minimal Wear	8.79	529	2025-02-20 23:40:17.220337+00	f
2425	Field-Tested	7.24	529	2025-02-20 23:40:17.215338+00	f
2426	Well-Worn	26.32	529	2025-02-20 23:40:17.225337+00	f
2427	Factory New	50.3	529	2025-02-20 23:40:40.38858+00	t
2428	Minimal Wear	34.98	529	2025-02-20 23:40:40.39869+00	t
2429	Field-Tested	23.91	529	2025-02-20 23:40:40.39258+00	t
2430	Well-Worn	58.8	529	2025-02-20 23:40:40.40269+00	t
2431	Minimal Wear	51.38	531	2025-02-20 23:40:11.521982+00	f
2432	Field-Tested	7.02	531	2025-02-20 23:40:11.510211+00	f
2433	Well-Worn	4.53	531	2025-02-20 23:40:11.52898+00	f
2434	Battle-Scarred	5.09	531	2025-02-20 23:40:11.499212+00	f
2435	Minimal Wear	121.11	531	2025-02-20 23:40:37.158341+00	t
2436	Field-Tested	14.64	531	2025-02-20 23:40:37.154342+00	t
2437	Well-Worn	13.02	531	2025-02-20 23:40:37.163342+00	t
2438	Battle-Scarred	10	531	2025-02-20 23:40:37.147183+00	t
2439	Minimal Wear	13.95	533	2025-02-20 23:40:09.598738+00	f
2440	Field-Tested	3.1	533	2025-02-20 23:40:09.591739+00	f
2441	Well-Worn	3.92	533	2025-02-20 23:40:09.606334+00	f
2442	Battle-Scarred	3.85	533	2025-02-20 23:40:09.584738+00	f
2443	Minimal Wear	40.02	533	2025-02-20 23:40:36.557574+00	t
2444	Field-Tested	7.09	533	2025-02-20 23:40:36.554573+00	t
2445	Well-Worn	8.3	533	2025-02-20 23:40:36.564183+00	t
2446	Battle-Scarred	5.73	533	2025-02-20 23:40:36.550573+00	t
2447	Factory New	13.31	535	2025-02-20 23:40:07.542567+00	f
2448	Minimal Wear	6.21	535	2025-02-20 23:40:07.578672+00	f
2449	Field-Tested	4.3	535	2025-02-20 23:40:07.559828+00	f
2450	Well-Worn	4.77	535	2025-02-20 23:40:07.589481+00	f
2451	Battle-Scarred	4.85	535	2025-02-20 23:40:07.531163+00	f
2452	Factory New	44.99	535	2025-02-20 23:40:36.005956+00	t
2453	Minimal Wear	19.78	535	2025-02-20 23:40:36.015956+00	t
2454	Field-Tested	7.89	535	2025-02-20 23:40:36.009956+00	t
2455	Well-Worn	7.49	535	2025-02-20 23:40:36.020168+00	t
2456	Battle-Scarred	7.46	535	2025-02-20 23:40:35.99867+00	t
2457	Factory New	4.15	537	2025-02-20 23:40:17.935983+00	f
2458	Minimal Wear	1.19	537	2025-02-20 23:40:17.945983+00	f
2459	Field-Tested	0.72	537	2025-02-20 23:40:17.939983+00	f
2460	Well-Worn	0.43	537	2025-02-20 23:40:17.950983+00	f
2461	Battle-Scarred	0.66	537	2025-02-20 23:40:17.930983+00	f
2462	Factory New	10.81	537	2025-02-20 23:40:40.898628+00	t
2463	Minimal Wear	4.07	537	2025-02-20 23:40:40.909628+00	t
2464	Field-Tested	1.46	537	2025-02-20 23:40:40.904631+00	t
2465	Well-Worn	1.05	537	2025-02-20 23:40:40.915709+00	t
2466	Battle-Scarred	1.03	537	2025-02-20 23:40:40.892628+00	t
2467	Factory New	3.21	539	2025-02-20 23:40:04.012587+00	f
2468	Minimal Wear	2.24	539	2025-02-20 23:40:04.020585+00	f
2469	Field-Tested	1.81	539	2025-02-20 23:40:04.016585+00	f
2470	Well-Worn	2.16	539	2025-02-20 23:40:04.025585+00	f
2471	Factory New	9.54	539	2025-02-20 23:40:34.470561+00	t
2472	Minimal Wear	6.33	539	2025-02-20 23:40:34.48879+00	t
2473	Field-Tested	4.95	539	2025-02-20 23:40:34.479907+00	t
2474	Well-Worn	7.09	539	2025-02-20 23:40:34.49879+00	t
2475	Factory New	3.38	541	2025-02-20 23:40:04.366627+00	f
2476	Minimal Wear	1.28	541	2025-02-20 23:40:04.374628+00	f
2477	Field-Tested	0.8	541	2025-02-20 23:40:04.370627+00	f
2478	Well-Worn	0.86	541	2025-02-20 23:40:04.379626+00	f
2479	Battle-Scarred	0.98	541	2025-02-20 23:40:04.362631+00	f
2480	Factory New	8.73	541	2025-02-20 23:40:34.741007+00	t
2481	Minimal Wear	2.94	541	2025-02-20 23:40:34.774788+00	t
2482	Field-Tested	1.21	541	2025-02-20 23:40:34.758918+00	t
2483	Well-Worn	1.95	541	2025-02-20 23:40:34.786686+00	t
2484	Battle-Scarred	1.21	541	2025-02-20 23:40:34.732282+00	t
2485	Field-Tested	0.59	543	2025-02-20 23:40:51.672407+00	f
2486	Field-Tested	1.11	543	2025-02-20 23:40:48.14481+00	t
2487	Factory New	6.61	545	2025-02-20 23:39:59.884383+00	f
2488	Minimal Wear	2.44	545	2025-02-20 23:39:59.891384+00	f
2489	Field-Tested	1.7	545	2025-02-20 23:39:59.887384+00	f
2490	Well-Worn	1.65	545	2025-02-20 23:39:59.898384+00	f
2491	Battle-Scarred	1.59	545	2025-02-20 23:39:59.879384+00	f
2492	Factory New	28.91	545	2025-02-20 23:40:31.589729+00	t
2493	Minimal Wear	8.8	545	2025-02-20 23:40:31.599798+00	t
2494	Field-Tested	5.43	545	2025-02-20 23:40:31.593797+00	t
2495	Well-Worn	4.14	545	2025-02-20 23:40:31.602797+00	t
2496	Battle-Scarred	4.17	545	2025-02-20 23:40:31.58573+00	t
2497	Factory New	0.81	547	2025-02-20 23:40:24.176627+00	f
2498	Minimal Wear	0.31	547	2025-02-20 23:40:24.186627+00	f
2499	Field-Tested	0.19	547	2025-02-20 23:40:24.182627+00	f
2500	Well-Worn	0.37	547	2025-02-20 23:40:24.191627+00	f
2501	Battle-Scarred	0.19	547	2025-02-20 23:40:24.172627+00	f
2502	Factory New	3.16	547	2025-02-20 23:40:43.915871+00	t
2503	Minimal Wear	0.97	547	2025-02-20 23:40:43.93087+00	t
2504	Field-Tested	0.39	547	2025-02-20 23:40:43.91987+00	t
2505	Well-Worn	0.91	547	2025-02-20 23:40:43.93487+00	t
2506	Battle-Scarred	0.34	547	2025-02-20 23:40:43.903871+00	t
2507	Factory New	0.39	549	2025-02-20 23:40:04.754402+00	f
2508	Minimal Wear	0.27	549	2025-02-20 23:40:04.762401+00	f
2509	Field-Tested	0.14	549	2025-02-20 23:40:04.7584+00	f
2510	Well-Worn	0.22	549	2025-02-20 23:40:04.767401+00	f
2511	Battle-Scarred	0.6	549	2025-02-20 23:40:04.748402+00	f
2512	Factory New	1.91	549	2025-02-20 23:40:35.095346+00	t
2513	Minimal Wear	1.45	549	2025-02-20 23:40:35.104455+00	t
2514	Field-Tested	0.82	549	2025-02-20 23:40:35.099346+00	t
2515	Well-Worn	1.35	549	2025-02-20 23:40:35.109454+00	t
2516	Battle-Scarred	17.75	549	2025-02-20 23:40:35.090345+00	t
2517	Factory New	0.32	551	2025-02-20 23:40:18.887529+00	f
2518	Minimal Wear	0.19	551	2025-02-20 23:40:18.897529+00	f
2519	Field-Tested	0.13	551	2025-02-20 23:40:18.891529+00	f
2520	Well-Worn	0.17	551	2025-02-20 23:40:18.90053+00	f
2521	Battle-Scarred	0.58	551	2025-02-20 23:40:18.88353+00	f
2522	Factory New	0.97	551	2025-02-20 23:40:41.418088+00	t
2523	Minimal Wear	0.62	551	2025-02-20 23:40:41.427088+00	t
2524	Field-Tested	0.42	551	2025-02-20 23:40:41.422088+00	t
2525	Well-Worn	0.42	551	2025-02-20 23:40:41.432088+00	t
2526	Battle-Scarred	0.7	551	2025-02-20 23:40:41.413088+00	t
2527	Factory New	0.37	553	2025-02-20 23:40:30.894032+00	f
2528	Minimal Wear	0.25	553	2025-02-20 23:40:30.945825+00	f
2529	Field-Tested	0.18	553	2025-02-20 23:40:30.92179+00	f
2530	Well-Worn	0.59	553	2025-02-20 23:40:30.962255+00	f
2531	Battle-Scarred	0.29	553	2025-02-20 23:40:30.881912+00	f
2532	Factory New	0.99	553	2025-02-20 23:40:47.495847+00	t
2533	Minimal Wear	0.58	553	2025-02-20 23:40:47.503845+00	t
2534	Field-Tested	0.35	553	2025-02-20 23:40:47.499844+00	t
2535	Well-Worn	0.28	553	2025-02-20 23:40:47.507844+00	t
2536	Battle-Scarred	0.38	553	2025-02-20 23:40:47.490847+00	t
2537	Minimal Wear	0.16	555	2025-02-20 23:40:21.385834+00	f
2538	Field-Tested	0.27	555	2025-02-20 23:40:21.380834+00	f
2539	Minimal Wear	0.45	555	2025-02-20 23:40:42.235786+00	t
2540	Field-Tested	0.39	555	2025-02-20 23:40:42.228112+00	t
2541	Factory New	153.1	557	2025-02-20 23:40:14.997866+00	f
2542	Minimal Wear	70.81	557	2025-02-20 23:40:15.024856+00	f
2543	Field-Tested	29.78	557	2025-02-20 23:40:15.013857+00	f
2544	Well-Worn	24.4	557	2025-02-20 23:40:15.039857+00	f
2545	Battle-Scarred	20.56	557	2025-02-20 23:40:14.990856+00	f
2546	Factory New	323.47	557	2025-02-20 23:40:39.035603+00	t
2547	Minimal Wear	123.15	557	2025-02-20 23:40:39.043602+00	t
2548	Field-Tested	68.02	557	2025-02-20 23:40:39.039602+00	t
2549	Well-Worn	64.65	557	2025-02-20 23:40:39.049601+00	t
2550	Battle-Scarred	79.45	557	2025-02-20 23:40:39.031867+00	t
2551	Factory New	7.98	559	2025-02-20 23:40:25.714531+00	f
2552	Minimal Wear	5.42	559	2025-02-20 23:40:25.724529+00	f
2553	Field-Tested	4.36	559	2025-02-20 23:40:25.719526+00	f
2554	Well-Worn	5.37	559	2025-02-20 23:40:25.734526+00	f
2555	Battle-Scarred	5.63	559	2025-02-20 23:40:25.701526+00	f
2556	Factory New	39.38	559	2025-02-20 23:40:45.438713+00	t
2557	Minimal Wear	22.83	559	2025-02-20 23:40:45.454713+00	t
2558	Field-Tested	17.45	559	2025-02-20 23:40:45.442713+00	t
2559	Well-Worn	23.91	559	2025-02-20 23:40:45.458713+00	t
2560	Battle-Scarred	22.8	559	2025-02-20 23:40:45.433714+00	t
2561	Minimal Wear	18.92	561	2025-02-20 23:40:23.32961+00	f
2562	Field-Tested	3.59	561	2025-02-20 23:40:23.32461+00	f
2563	Well-Worn	4.15	561	2025-02-20 23:40:23.33361+00	f
2564	Battle-Scarred	3.12	561	2025-02-20 23:40:23.320611+00	f
2565	Minimal Wear	66.85	561	2025-02-20 23:40:43.288874+00	t
2566	Field-Tested	13.15	561	2025-02-20 23:40:43.285873+00	t
2567	Well-Worn	11.84	561	2025-02-20 23:40:43.293874+00	t
2568	Battle-Scarred	10.02	561	2025-02-20 23:40:43.280874+00	t
2569	Factory New	11.29	563	2025-02-20 23:40:52.176067+00	f
2570	Minimal Wear	5.91	563	2025-02-20 23:40:52.194513+00	f
2571	Field-Tested	3.7	563	2025-02-20 23:40:52.187512+00	f
2572	Well-Worn	3.85	563	2025-02-20 23:40:52.204512+00	f
2573	Battle-Scarred	2.4	563	2025-02-20 23:40:52.170068+00	f
2574	Factory New	22.69	563	2025-02-20 23:40:48.331062+00	t
2575	Minimal Wear	11.84	563	2025-02-20 23:40:48.339573+00	t
2576	Field-Tested	5.34	563	2025-02-20 23:40:48.335575+00	t
2577	Well-Worn	7.07	563	2025-02-20 23:40:48.342574+00	t
2578	Battle-Scarred	5.79	563	2025-02-20 23:40:48.325061+00	t
2579	Factory New	12.25	565	2025-02-20 23:40:01.718872+00	f
2580	Minimal Wear	6.23	565	2025-02-20 23:40:01.728873+00	f
2581	Field-Tested	2.96	565	2025-02-20 23:40:01.722872+00	f
2582	Well-Worn	2.16	565	2025-02-20 23:40:01.731872+00	f
2583	Battle-Scarred	2.2	565	2025-02-20 23:40:01.714873+00	f
2584	Factory New	28.47	565	2025-02-20 23:40:33.395359+00	t
2585	Minimal Wear	11.98	565	2025-02-20 23:40:33.404651+00	t
2586	Field-Tested	4.9	565	2025-02-20 23:40:33.40065+00	t
2587	Well-Worn	4.75	565	2025-02-20 23:40:33.409649+00	t
2588	Battle-Scarred	4.86	565	2025-02-20 23:40:33.390358+00	t
2589	Factory New	3.61	567	2025-02-20 23:40:29.307068+00	f
2590	Minimal Wear	1.48	567	2025-02-20 23:40:29.32207+00	f
2591	Field-Tested	0.63	567	2025-02-20 23:40:29.31407+00	f
2592	Well-Worn	0.47	567	2025-02-20 23:40:29.330722+00	f
2593	Battle-Scarred	0.44	567	2025-02-20 23:40:29.299069+00	f
2594	Factory New	17.49	567	2025-02-20 23:40:47.107959+00	t
2595	Minimal Wear	5.76	567	2025-02-20 23:40:47.122959+00	t
2596	Field-Tested	2.3	567	2025-02-20 23:40:47.116959+00	t
2597	Well-Worn	2.38	567	2025-02-20 23:40:47.126959+00	t
2598	Battle-Scarred	2.27	567	2025-02-20 23:40:47.100958+00	t
2599	Factory New	3.29	569	2025-02-20 23:40:11.541937+00	f
2600	Minimal Wear	1.09	569	2025-02-20 23:40:11.562153+00	f
2601	Field-Tested	0.49	569	2025-02-20 23:40:11.553153+00	f
2602	Well-Worn	0.5	569	2025-02-20 23:40:11.573152+00	f
2603	Battle-Scarred	0.48	569	2025-02-20 23:40:11.535932+00	f
2604	Factory New	9.4	569	2025-02-20 23:40:37.171341+00	t
2605	Minimal Wear	3.13	569	2025-02-20 23:40:37.180579+00	t
2606	Field-Tested	1.4	569	2025-02-20 23:40:37.175462+00	t
2607	Well-Worn	1.48	569	2025-02-20 23:40:37.184577+00	t
2608	Battle-Scarred	1.51	569	2025-02-20 23:40:37.167341+00	t
2609	Factory New	2.5	571	2025-02-20 23:40:54.052303+00	f
2610	Minimal Wear	1.18	571	2025-02-20 23:40:54.071294+00	f
2611	Field-Tested	0.38	571	2025-02-20 23:40:54.060295+00	f
2612	Well-Worn	0.69	571	2025-02-20 23:40:54.080296+00	f
2613	Battle-Scarred	0.46	571	2025-02-20 23:40:54.042294+00	f
2614	Factory New	9.44	571	2025-02-20 23:40:48.97554+00	t
2615	Minimal Wear	3.66	571	2025-02-20 23:40:48.985539+00	t
2616	Field-Tested	1.15	571	2025-02-20 23:40:48.980542+00	t
2617	Well-Worn	2.67	571	2025-02-20 23:40:48.989539+00	t
2618	Battle-Scarred	1.21	571	2025-02-20 23:40:48.96654+00	t
2619	Factory New	1.72	573	2025-02-20 23:40:04.411908+00	f
2620	Minimal Wear	0.99	573	2025-02-20 23:40:04.419522+00	f
2621	Field-Tested	0.57	573	2025-02-20 23:40:04.415908+00	f
2622	Well-Worn	1.08	573	2025-02-20 23:40:04.423519+00	f
2623	Battle-Scarred	0.69	573	2025-02-20 23:40:04.406907+00	f
2624	Factory New	4.27	573	2025-02-20 23:40:34.870034+00	t
2625	Minimal Wear	1.78	573	2025-02-20 23:40:34.881181+00	t
2626	Field-Tested	1.04	573	2025-02-20 23:40:34.876034+00	t
2627	Well-Worn	1.05	573	2025-02-20 23:40:34.885181+00	t
2628	Battle-Scarred	1.03	573	2025-02-20 23:40:34.85615+00	t
2629	Factory New	2.07	575	2025-02-20 23:40:49.868294+00	f
2630	Minimal Wear	0.92	575	2025-02-20 23:40:49.879291+00	f
2631	Field-Tested	0.72	575	2025-02-20 23:40:49.874289+00	f
2632	Well-Worn	0.96	575	2025-02-20 23:40:49.88609+00	f
2633	Factory New	5.19	575	2025-02-20 23:40:47.890332+00	t
2634	Minimal Wear	2.59	575	2025-02-20 23:40:47.899331+00	t
2635	Field-Tested	1.62	575	2025-02-20 23:40:47.896336+00	t
2636	Well-Worn	1.73	575	2025-02-20 23:40:47.903331+00	t
2637	Factory New	0.34	577	2025-02-20 23:40:28.101666+00	f
2638	Minimal Wear	0.12	577	2025-02-20 23:40:28.119644+00	f
2639	Field-Tested	0.16	577	2025-02-20 23:40:28.109667+00	f
2640	Well-Worn	0.17	577	2025-02-20 23:40:28.127643+00	f
2641	Battle-Scarred	0.1	577	2025-02-20 23:40:28.091666+00	f
2642	Factory New	1.46	577	2025-02-20 23:40:46.489721+00	t
2643	Minimal Wear	0.53	577	2025-02-20 23:40:46.49972+00	t
2644	Field-Tested	0.16	577	2025-02-20 23:40:46.493721+00	t
2645	Well-Worn	0.55	577	2025-02-20 23:40:46.504721+00	t
2646	Battle-Scarred	0.3	577	2025-02-20 23:40:46.48472+00	t
2647	Factory New	0.47	579	2025-02-20 23:40:19.688694+00	f
2648	Minimal Wear	0.33	579	2025-02-20 23:40:19.704675+00	f
2649	Field-Tested	0.2	579	2025-02-20 23:40:19.699159+00	f
2650	Well-Worn	0.24	579	2025-02-20 23:40:19.710491+00	f
2651	Battle-Scarred	0.24	579	2025-02-20 23:40:19.684694+00	f
2652	Factory New	2.09	579	2025-02-20 23:40:41.734268+00	t
2653	Minimal Wear	1.56	579	2025-02-20 23:40:41.74178+00	t
2654	Field-Tested	0.93	579	2025-02-20 23:40:41.737781+00	t
2655	Well-Worn	2.67	579	2025-02-20 23:40:41.746782+00	t
2656	Battle-Scarred	2.66	579	2025-02-20 23:40:41.730268+00	t
2657	Factory New	0.37	581	2025-02-20 23:40:22.892667+00	f
2658	Minimal Wear	0.23	581	2025-02-20 23:40:22.913668+00	f
2659	Field-Tested	0.17	581	2025-02-20 23:40:22.904667+00	f
2660	Well-Worn	0.33	581	2025-02-20 23:40:22.919666+00	f
2661	Battle-Scarred	0.17	581	2025-02-20 23:40:22.881667+00	f
2662	Factory New	1.54	581	2025-02-20 23:40:43.108185+00	t
2663	Minimal Wear	0.74	581	2025-02-20 23:40:43.122118+00	t
2664	Field-Tested	0.27	581	2025-02-20 23:40:43.113189+00	t
2665	Well-Worn	0.55	581	2025-02-20 23:40:43.129116+00	t
2666	Battle-Scarred	0.35	581	2025-02-20 23:40:43.104186+00	t
2667	Factory New	0.27	583	2025-02-20 23:40:07.180955+00	f
2668	Minimal Wear	0.15	583	2025-02-20 23:40:07.191021+00	f
2669	Field-Tested	0.12	583	2025-02-20 23:40:07.186471+00	f
2670	Well-Worn	0.12	583	2025-02-20 23:40:07.198021+00	f
2671	Factory New	1.19	583	2025-02-20 23:40:35.903028+00	t
2672	Minimal Wear	0.48	583	2025-02-20 23:40:35.914706+00	t
2673	Field-Tested	0.26	583	2025-02-20 23:40:35.909055+00	t
2674	Well-Worn	0.58	583	2025-02-20 23:40:35.917706+00	t
2675	Factory New	0.31	585	2025-02-20 23:40:10.88253+00	f
2676	Minimal Wear	0.13	585	2025-02-20 23:40:10.892534+00	f
2677	Field-Tested	0.14	585	2025-02-20 23:40:10.88753+00	f
2678	Well-Worn	0.17	585	2025-02-20 23:40:10.898533+00	f
2679	Battle-Scarred	0.16	585	2025-02-20 23:40:10.875532+00	f
2680	Factory New	1.29	585	2025-02-20 23:40:36.906813+00	t
2681	Minimal Wear	0.55	585	2025-02-20 23:40:36.916172+00	t
2682	Field-Tested	0.19	585	2025-02-20 23:40:36.911814+00	t
2683	Well-Worn	0.29	585	2025-02-20 23:40:36.920172+00	t
2684	Battle-Scarred	0.56	585	2025-02-20 23:40:36.893735+00	t
2685	Factory New	0.26	587	2025-02-20 23:40:14.444868+00	f
2686	Minimal Wear	0.18	587	2025-02-20 23:40:14.464868+00	f
2687	Field-Tested	0.13	587	2025-02-20 23:40:14.454869+00	f
2688	Well-Worn	0.19	587	2025-02-20 23:40:14.48087+00	f
2689	Battle-Scarred	0.12	587	2025-02-20 23:40:14.429866+00	f
2690	Factory New	1.09	587	2025-02-20 23:40:38.774166+00	t
2691	Minimal Wear	0.42	587	2025-02-20 23:40:38.79337+00	t
2692	Field-Tested	0.16	587	2025-02-20 23:40:38.785164+00	t
2693	Well-Worn	0.35	587	2025-02-20 23:40:38.797883+00	t
2694	Battle-Scarred	0.74	587	2025-02-20 23:40:38.768801+00	t
2695	Well-Worn	0.14	589	2025-02-20 23:40:30.389177+00	f
2696	Battle-Scarred	0.07	589	2025-02-20 23:40:30.384175+00	f
2697	Well-Worn	6.52	589	2025-02-20 23:40:47.364728+00	t
2698	Battle-Scarred	0.14	589	2025-02-20 23:40:47.359727+00	t
2699	Field-Tested	76.86	591	2025-02-20 23:40:11.28503+00	f
2700	Well-Worn	18.47	591	2025-02-20 23:40:11.292032+00	f
2701	Battle-Scarred	10.66	591	2025-02-20 23:40:11.276029+00	f
2702	Field-Tested	\N	591	\N	t
2703	Well-Worn	76.71	591	2025-02-20 23:40:37.053774+00	t
2704	Battle-Scarred	44.36	591	2025-02-20 23:40:37.049529+00	t
2705	Minimal Wear	42.57	593	2025-02-20 23:40:03.615267+00	f
2706	Field-Tested	39.87	593	2025-02-20 23:40:03.608272+00	f
2707	Minimal Wear	95.74	593	2025-02-20 23:40:34.25263+00	t
2708	Field-Tested	125.69	593	2025-02-20 23:40:34.245632+00	t
2709	Factory New	32.23	595	2025-02-20 23:39:59.830383+00	f
2710	Minimal Wear	17.28	595	2025-02-20 23:39:59.836384+00	f
2711	Field-Tested	13.35	595	2025-02-20 23:39:59.833384+00	f
2712	Well-Worn	45.35	595	2025-02-20 23:39:59.838383+00	f
2713	Battle-Scarred	13.77	595	2025-02-20 23:39:59.825244+00	f
2714	Factory New	101.28	595	2025-02-20 23:40:31.526343+00	t
2715	Minimal Wear	64.3	595	2025-02-20 23:40:31.541352+00	t
2716	Field-Tested	41.47	595	2025-02-20 23:40:31.536353+00	t
2717	Well-Worn	52.22	595	2025-02-20 23:40:31.551355+00	t
2718	Battle-Scarred	45.2	595	2025-02-20 23:40:31.519344+00	t
2719	Factory New	\N	597	\N	f
2720	Minimal Wear	\N	597	\N	f
2721	Field-Tested	\N	597	\N	f
2722	Well-Worn	\N	597	\N	f
2723	Battle-Scarred	\N	597	\N	f
2724	Factory New	\N	597	\N	t
2725	Minimal Wear	\N	597	\N	t
2726	Field-Tested	\N	597	\N	t
2727	Well-Worn	\N	597	\N	t
2728	Battle-Scarred	\N	597	\N	t
2729	Factory New	11.79	599	2025-02-20 23:40:23.930053+00	f
2730	Minimal Wear	6.42	599	2025-02-20 23:40:23.938245+00	f
2731	Field-Tested	6	599	2025-02-20 23:40:23.934053+00	f
2732	Well-Worn	6.71	599	2025-02-20 23:40:23.942245+00	f
2733	Battle-Scarred	6.59	599	2025-02-20 23:40:23.923052+00	f
2734	Factory New	30.32	599	2025-02-20 23:40:43.580259+00	t
2735	Minimal Wear	19.18	599	2025-02-20 23:40:43.597765+00	t
2736	Field-Tested	17.75	599	2025-02-20 23:40:43.591766+00	t
2737	Well-Worn	20.86	599	2025-02-20 23:40:43.608261+00	t
2738	Battle-Scarred	18.75	599	2025-02-20 23:40:43.57526+00	t
2739	Factory New	7.74	601	2025-02-20 23:40:05.198192+00	f
2740	Minimal Wear	3.54	601	2025-02-20 23:40:05.208896+00	f
2741	Field-Tested	1.56	601	2025-02-20 23:40:05.204705+00	f
2742	Well-Worn	2.09	601	2025-02-20 23:40:05.215893+00	f
2743	Battle-Scarred	2.32	601	2025-02-20 23:40:05.190192+00	f
2744	Factory New	23.22	601	2025-02-20 23:40:35.375103+00	t
2745	Minimal Wear	8.61	601	2025-02-20 23:40:35.38422+00	t
2746	Field-Tested	5.26	601	2025-02-20 23:40:35.380103+00	t
2747	Well-Worn	5.29	601	2025-02-20 23:40:35.388219+00	t
2748	Battle-Scarred	5.51	601	2025-02-20 23:40:35.370104+00	t
2749	Factory New	3.79	603	2025-02-20 23:40:17.167444+00	f
2750	Minimal Wear	2.22	603	2025-02-20 23:40:17.176337+00	f
2751	Field-Tested	2.62	603	2025-02-20 23:40:17.172338+00	f
2752	Well-Worn	3.7	603	2025-02-20 23:40:17.182337+00	f
2753	Battle-Scarred	7.87	603	2025-02-20 23:40:17.162445+00	f
2754	Factory New	10.04	603	2025-02-20 23:40:40.337579+00	t
2755	Minimal Wear	5.73	603	2025-02-20 23:40:40.34858+00	t
2756	Field-Tested	4.38	603	2025-02-20 23:40:40.341581+00	t
2757	Well-Worn	5.58	603	2025-02-20 23:40:40.35458+00	t
2758	Battle-Scarred	5.62	603	2025-02-20 23:40:40.33258+00	t
2759	Factory New	3.15	605	2025-02-20 23:40:07.148958+00	f
2760	Minimal Wear	2.05	605	2025-02-20 23:40:07.164955+00	f
2761	Field-Tested	2.51	605	2025-02-20 23:40:07.155955+00	f
2762	Well-Worn	2.51	605	2025-02-20 23:40:07.172956+00	f
2763	Battle-Scarred	2.48	605	2025-02-20 23:40:07.138954+00	f
2764	Factory New	9.08	605	2025-02-20 23:40:35.888767+00	t
2765	Minimal Wear	7.09	605	2025-02-20 23:40:35.897767+00	t
2766	Field-Tested	4.74	605	2025-02-20 23:40:35.892767+00	t
2767	Well-Worn	8.76	605	2025-02-15 23:05:38.773418+00	t
2768	Battle-Scarred	4.18	605	2025-02-15 18:40:18.628699+00	t
2769	Factory New	3.41	607	2025-02-20 23:40:31.086686+00	f
2770	Minimal Wear	2.16	607	2025-02-20 23:40:31.102148+00	f
2771	Field-Tested	1.91	607	2025-02-20 23:40:31.095151+00	f
2772	Well-Worn	2.18	607	2025-02-20 23:40:31.108149+00	f
2773	Battle-Scarred	21.99	607	2025-02-20 23:40:31.080689+00	f
2774	Factory New	8.88	607	2025-02-20 23:40:47.511844+00	t
2775	Minimal Wear	6.17	607	2025-02-20 23:40:47.520844+00	t
2776	Field-Tested	4.17	607	2025-02-20 23:40:47.516844+00	t
2777	Well-Worn	7.64	607	2025-02-20 23:40:47.523844+00	t
2778	Battle-Scarred	33.15	607	2025-02-15 18:32:23.231564+00	t
2779	Factory New	2.98	609	2025-02-20 23:40:19.905602+00	f
2780	Minimal Wear	1.04	609	2025-02-20 23:40:19.924603+00	f
2781	Field-Tested	0.61	609	2025-02-20 23:40:19.918605+00	f
2782	Well-Worn	0.39	609	2025-02-20 23:40:19.940607+00	f
2783	Battle-Scarred	0.4	609	2025-02-20 23:40:19.899093+00	f
2784	Factory New	6.67	609	2025-02-20 23:40:41.825071+00	t
2785	Minimal Wear	2.16	609	2025-02-20 23:40:41.835071+00	t
2786	Field-Tested	1.3	609	2025-02-20 23:40:41.830072+00	t
2787	Well-Worn	1.31	609	2025-02-20 23:40:41.83907+00	t
2788	Battle-Scarred	1.19	609	2025-02-20 23:40:41.82007+00	t
2789	Factory New	0.81	611	2025-02-20 23:40:12.397508+00	f
2790	Minimal Wear	0.65	611	2025-02-20 23:40:12.405509+00	f
2791	Field-Tested	0.54	611	2025-02-20 23:40:12.401508+00	f
2792	Well-Worn	0.6	611	2025-02-20 23:40:12.40951+00	f
2793	Battle-Scarred	1.48	611	2025-02-20 23:40:12.391509+00	f
2794	Factory New	2.56	611	2025-02-20 23:40:37.474304+00	t
2795	Minimal Wear	2.09	611	2025-02-20 23:40:37.483558+00	t
2796	Field-Tested	1.34	611	2025-02-20 23:40:37.478303+00	t
2797	Well-Worn	2.79	611	2025-02-15 23:05:39.649802+00	t
2798	Battle-Scarred	2.18	611	2025-02-20 23:40:37.470108+00	t
2799	Factory New	0.58	613	2025-02-20 23:40:14.60838+00	f
2800	Minimal Wear	0.42	613	2025-02-20 23:40:14.624377+00	f
2801	Field-Tested	0.28	613	2025-02-20 23:40:14.617377+00	f
2802	Well-Worn	0.45	613	2025-02-20 23:40:14.632376+00	f
2803	Battle-Scarred	0.25	613	2025-02-20 23:40:14.602377+00	f
2804	Factory New	1.79	613	2025-02-20 23:40:38.808883+00	t
2805	Minimal Wear	0.93	613	2025-02-20 23:40:38.820353+00	t
2806	Field-Tested	0.5	613	2025-02-20 23:40:38.814354+00	t
2807	Well-Worn	0.72	613	2025-02-20 23:40:38.828918+00	t
2808	Battle-Scarred	0.6	613	2025-02-20 23:40:38.804884+00	t
2809	Factory New	0.5	615	2025-02-20 23:40:54.710535+00	f
2810	Minimal Wear	0.36	615	2025-02-20 23:40:54.731537+00	f
2811	Field-Tested	0.27	615	2025-02-20 23:40:54.720535+00	f
2812	Well-Worn	0.25	615	2025-02-20 23:40:54.738534+00	f
2813	Battle-Scarred	0.6	615	2025-02-20 23:40:54.704534+00	f
2814	Factory New	1.42	615	2025-02-20 23:40:49.097062+00	t
2815	Minimal Wear	1.34	615	2025-02-20 23:40:49.107061+00	t
2816	Field-Tested	0.77	615	2025-02-20 23:40:49.102061+00	t
2817	Well-Worn	0.72	615	2025-02-20 23:40:49.111061+00	t
2818	Battle-Scarred	0.9	615	2025-02-20 23:40:49.09206+00	t
2819	Factory New	0.5	617	2025-02-20 23:40:27.524294+00	f
2820	Minimal Wear	0.37	617	2025-02-20 23:40:27.534292+00	f
2821	Field-Tested	0.24	617	2025-02-20 23:40:27.529293+00	f
2822	Well-Worn	0.25	617	2025-02-20 23:40:27.538293+00	f
2823	Battle-Scarred	0.56	617	2025-02-20 23:40:27.518293+00	f
2824	Factory New	1.31	617	2025-02-20 23:40:46.293822+00	t
2825	Minimal Wear	0.86	617	2025-02-20 23:40:46.30482+00	t
2826	Field-Tested	0.54	617	2025-02-20 23:40:46.299821+00	t
2827	Well-Worn	5.29	617	2025-02-20 23:40:46.308821+00	t
2828	Battle-Scarred	0.78	617	2025-02-20 23:40:46.289822+00	t
2829	Factory New	44.83	619	2025-02-20 23:40:16.269615+00	f
2830	Minimal Wear	15.45	619	2025-02-20 23:40:16.279614+00	f
2831	Field-Tested	8.12	619	2025-02-20 23:40:16.274615+00	f
2832	Well-Worn	9.42	619	2025-02-20 23:40:16.283615+00	f
2833	Battle-Scarred	7.39	619	2025-02-20 23:40:16.265615+00	f
2834	Factory New	119.52	619	2025-02-20 23:40:39.651726+00	t
2835	Minimal Wear	58.2	619	2025-02-20 23:40:39.660726+00	t
2836	Field-Tested	23.17	619	2025-02-20 23:40:39.655726+00	t
2837	Well-Worn	22.48	619	2025-02-20 23:40:39.666726+00	t
2838	Battle-Scarred	21.99	619	2025-02-20 23:40:39.648726+00	t
2839	Factory New	4.53	621	2025-02-20 23:40:18.984529+00	f
2840	Minimal Wear	2.22	621	2025-02-20 23:40:18.992094+00	f
2841	Field-Tested	1.68	621	2025-02-20 23:40:18.988096+00	f
2842	Well-Worn	3.43	621	2025-02-20 23:40:18.997095+00	f
2843	Battle-Scarred	1.84	621	2025-02-20 23:40:18.978564+00	f
2844	Factory New	20.43	621	2025-02-20 23:40:41.440731+00	t
2845	Minimal Wear	9.62	621	2025-02-20 23:40:41.450244+00	t
2846	Field-Tested	6.95	621	2025-02-20 23:40:41.446246+00	t
2847	Well-Worn	12.48	621	2025-02-20 23:40:41.453244+00	t
2848	Battle-Scarred	7.78	621	2025-02-20 23:40:41.436088+00	t
2849	Factory New	11.17	623	2025-02-20 23:40:52.67983+00	f
2850	Minimal Wear	4.93	623	2025-02-20 23:40:52.697831+00	f
2851	Field-Tested	2.88	623	2025-02-20 23:40:52.68883+00	f
2852	Well-Worn	2.96	623	2025-02-20 23:40:52.705829+00	f
2853	Battle-Scarred	2.65	623	2025-02-20 23:40:52.67183+00	f
2854	Factory New	33.28	623	2025-02-20 23:40:48.533153+00	t
2855	Minimal Wear	14.2	623	2025-02-20 23:40:48.543152+00	t
2856	Field-Tested	7.07	623	2025-02-20 23:40:48.539152+00	t
2857	Well-Worn	7.99	623	2025-02-20 23:40:48.548152+00	t
2858	Battle-Scarred	8.94	623	2025-02-20 23:40:48.522152+00	t
2859	Factory New	7.88	625	2025-02-20 23:40:03.661782+00	f
2860	Minimal Wear	3.89	625	2025-02-20 23:40:03.671782+00	f
2861	Field-Tested	2.38	625	2025-02-20 23:40:03.667783+00	f
2862	Well-Worn	3.99	625	2025-02-20 23:40:03.679783+00	f
2863	Battle-Scarred	2.39	625	2025-02-20 23:40:03.655782+00	f
2864	Factory New	19.14	625	2025-02-20 23:40:34.269873+00	t
2865	Minimal Wear	9.48	625	2025-02-20 23:40:34.291023+00	t
2866	Field-Tested	6.07	625	2025-02-20 23:40:34.281022+00	t
2867	Well-Worn	9.34	625	2025-02-20 23:40:34.301213+00	t
2868	Battle-Scarred	7.46	625	2025-02-20 23:40:34.26036+00	t
2869	Factory New	7.32	627	2025-02-20 23:40:02.112583+00	f
2870	Minimal Wear	3.54	627	2025-02-20 23:40:02.129579+00	f
2871	Field-Tested	1.56	627	2025-02-20 23:40:02.12058+00	f
2872	Well-Worn	1.84	627	2025-02-20 23:40:02.133579+00	f
2873	Battle-Scarred	2.27	627	2025-02-20 23:40:02.106065+00	f
2874	Factory New	16.83	627	2025-02-20 23:40:33.623117+00	t
2875	Minimal Wear	5.71	627	2025-02-20 23:40:33.643918+00	t
2876	Field-Tested	2.77	627	2025-02-20 23:40:33.634903+00	t
2877	Well-Worn	4.07	627	2025-02-20 23:40:33.650028+00	t
2878	Battle-Scarred	3.18	627	2025-02-20 23:40:33.610926+00	t
2879	Factory New	2.09	629	2025-02-20 23:40:12.7806+00	f
2880	Minimal Wear	1.13	629	2025-02-20 23:40:12.799601+00	f
2881	Field-Tested	0.72	629	2025-02-20 23:40:12.7896+00	f
2882	Well-Worn	1.09	629	2025-02-20 23:40:12.807601+00	f
2883	Battle-Scarred	1.17	629	2025-02-20 23:40:12.772601+00	f
2884	Factory New	6.85	629	2025-02-20 23:40:37.619289+00	t
2885	Minimal Wear	3.33	629	2025-02-20 23:40:37.630288+00	t
2886	Field-Tested	1.93	629	2025-02-20 23:40:37.625288+00	t
2887	Well-Worn	2.94	629	2025-02-20 23:40:37.637675+00	t
2888	Battle-Scarred	2.16	629	2025-02-20 23:40:37.610115+00	t
2889	Factory New	1.76	631	2025-02-20 23:40:18.218121+00	f
2890	Minimal Wear	0.74	631	2025-02-20 23:40:18.229122+00	f
2891	Field-Tested	0.35	631	2025-02-20 23:40:18.221121+00	f
2892	Well-Worn	0.29	631	2025-02-20 23:40:18.236121+00	f
2893	Battle-Scarred	0.3	631	2025-02-20 23:40:18.213122+00	f
2894	Factory New	5.46	631	2025-02-20 23:40:41.090729+00	t
2895	Minimal Wear	1.33	631	2025-02-20 23:40:41.101729+00	t
2896	Field-Tested	0.73	631	2025-02-20 23:40:41.09573+00	t
2897	Well-Worn	0.73	631	2025-02-20 23:40:41.107729+00	t
2898	Battle-Scarred	0.55	631	2025-02-20 23:40:41.085729+00	t
2899	Factory New	1.54	633	2025-02-20 23:40:51.148916+00	f
2900	Minimal Wear	0.72	633	2025-02-20 23:40:51.200263+00	f
2901	Field-Tested	0.34	633	2025-02-20 23:40:51.192403+00	f
2902	Well-Worn	0.52	633	2025-02-20 23:40:51.211262+00	f
2903	Battle-Scarred	0.33	633	2025-02-20 23:40:51.102917+00	f
2904	Factory New	3.53	633	2025-02-20 23:40:48.00996+00	t
2905	Minimal Wear	1.62	633	2025-02-20 23:40:48.01896+00	t
2906	Field-Tested	0.63	633	2025-02-20 23:40:48.014961+00	t
2907	Well-Worn	0.99	633	2025-02-20 23:40:48.023961+00	t
2908	Battle-Scarred	0.72	633	2025-02-20 23:40:48.005963+00	t
2909	Factory New	1.48	635	2025-02-20 23:40:22.319314+00	f
2910	Minimal Wear	0.73	635	2025-02-20 23:40:22.328313+00	f
2911	Field-Tested	0.3	635	2025-02-20 23:40:22.323313+00	f
2912	Well-Worn	0.39	635	2025-02-20 23:40:22.334621+00	f
2913	Battle-Scarred	0.33	635	2025-02-20 23:40:22.314315+00	f
2914	Factory New	3.12	635	2025-02-20 23:40:42.695445+00	t
2915	Minimal Wear	1.28	635	2025-02-20 23:40:42.705444+00	t
2916	Field-Tested	0.6	635	2025-02-20 23:40:42.701444+00	t
2917	Well-Worn	0.67	635	2025-02-20 23:40:42.709446+00	t
2918	Battle-Scarred	0.49	635	2025-02-20 23:40:42.690444+00	t
2919	Factory New	1.45	637	2025-02-20 23:40:21.344836+00	f
2920	Minimal Wear	0.73	637	2025-02-20 23:40:21.354835+00	f
2921	Field-Tested	0.35	637	2025-02-20 23:40:21.351835+00	f
2922	Well-Worn	0.33	637	2025-02-20 23:40:21.358834+00	f
2923	Battle-Scarred	0.36	637	2025-02-20 23:40:21.339835+00	f
2924	Factory New	3.41	637	2025-02-20 23:40:42.160545+00	t
2925	Minimal Wear	1.32	637	2025-02-20 23:40:42.183693+00	t
2926	Field-Tested	0.7	637	2025-02-20 23:40:42.173544+00	t
2927	Well-Worn	0.89	637	2025-02-20 23:40:42.191692+00	t
2928	Battle-Scarred	0.7	637	2025-02-20 23:40:42.157544+00	t
2929	Factory New	0.31	639	2025-02-20 23:40:26.812061+00	f
2930	Minimal Wear	0.12	639	2025-02-20 23:40:26.832059+00	f
2931	Field-Tested	0.08	639	2025-02-20 23:40:26.821058+00	f
2932	Well-Worn	0.08	639	2025-02-20 23:40:26.849059+00	f
2933	Battle-Scarred	0.08	639	2025-02-20 23:40:26.798541+00	f
2934	Factory New	1.3	639	2025-02-20 23:40:45.909042+00	t
2935	Minimal Wear	0.29	639	2025-02-20 23:40:45.920041+00	t
2936	Field-Tested	0.15	639	2025-02-20 23:40:45.916042+00	t
2937	Well-Worn	0.22	639	2025-02-20 23:40:45.925042+00	t
2938	Battle-Scarred	0.22	639	2025-02-20 23:40:45.903042+00	t
2939	Factory New	0.3	641	2025-02-20 23:40:19.729011+00	f
2940	Minimal Wear	0.14	641	2025-02-20 23:40:19.746009+00	f
2941	Field-Tested	0.08	641	2025-02-20 23:40:19.737007+00	f
2942	Well-Worn	0.06	641	2025-02-20 23:40:19.753543+00	f
2943	Battle-Scarred	0.06	641	2025-02-20 23:40:19.72201+00	f
2944	Factory New	1.45	641	2025-02-20 23:40:41.75578+00	t
2945	Minimal Wear	0.33	641	2025-02-20 23:40:41.765294+00	t
2946	Field-Tested	0.14	641	2025-02-20 23:40:41.75978+00	t
2947	Well-Worn	0.14	641	2025-02-20 23:40:41.770294+00	t
2948	Battle-Scarred	0.13	641	2025-02-20 23:40:41.750781+00	t
2949	Factory New	0.27	643	2025-02-20 23:40:23.201+00	f
2950	Minimal Wear	0.12	643	2025-02-20 23:40:23.214001+00	f
2951	Field-Tested	0.1	643	2025-02-20 23:40:23.206+00	f
2952	Well-Worn	0.15	643	2025-02-20 23:40:23.219+00	f
2953	Battle-Scarred	0.07	643	2025-02-20 23:40:23.197004+00	f
2954	Factory New	1.19	643	2025-02-20 23:40:43.207107+00	t
2955	Minimal Wear	0.28	643	2025-02-20 23:40:43.218314+00	t
2956	Field-Tested	0.13	643	2025-02-20 23:40:43.211106+00	t
2957	Well-Worn	0.12	643	2025-02-20 23:40:43.222315+00	t
2958	Battle-Scarred	0.15	643	2025-02-20 23:40:43.203106+00	t
2959	Factory New	0.25	645	2025-02-20 23:40:25.906826+00	f
2960	Minimal Wear	0.12	645	2025-02-20 23:40:25.929821+00	f
2961	Field-Tested	0.07	645	2025-02-20 23:40:25.91382+00	f
2962	Well-Worn	0.09	645	2025-02-20 23:40:25.944822+00	f
2963	Battle-Scarred	0.07	645	2025-02-20 23:40:25.890819+00	f
2964	Factory New	0.71	645	2025-02-20 23:40:45.560717+00	t
2965	Minimal Wear	0.26	645	2025-02-20 23:40:45.580174+00	t
2966	Field-Tested	0.11	645	2025-02-20 23:40:45.568714+00	t
2967	Well-Worn	0.26	645	2025-02-20 23:40:45.584688+00	t
2968	Battle-Scarred	0.15	645	2025-02-20 23:40:45.551715+00	t
2969	Factory New	0.24	647	2025-02-20 23:40:28.014272+00	f
2970	Minimal Wear	0.15	647	2025-02-20 23:40:28.032271+00	f
2971	Field-Tested	0.06	647	2025-02-20 23:40:28.022273+00	f
2972	Well-Worn	0.08	647	2025-02-20 23:40:28.040272+00	f
2973	Battle-Scarred	0.12	647	2025-02-20 23:40:28.004276+00	f
2974	Factory New	0.81	647	2025-02-20 23:40:46.46572+00	t
2975	Minimal Wear	0.29	647	2025-02-20 23:40:46.47372+00	t
2976	Field-Tested	0.15	647	2025-02-20 23:40:46.46972+00	t
2977	Well-Worn	0.3	647	2025-02-20 23:40:46.47772+00	t
2978	Battle-Scarred	0.14	647	2025-02-20 23:40:46.46072+00	t
2979	Factory New	0.29	649	2025-02-20 23:40:09.336989+00	f
2980	Minimal Wear	0.15	649	2025-02-20 23:40:09.350989+00	f
2981	Field-Tested	0.09	649	2025-02-20 23:40:09.344991+00	f
2982	Well-Worn	0.16	649	2025-02-20 23:40:09.35799+00	f
2983	Battle-Scarred	0.07	649	2025-02-20 23:40:09.330476+00	f
2984	Factory New	0.94	649	2025-02-20 23:40:36.453639+00	t
2985	Minimal Wear	0.45	649	2025-02-20 23:40:36.462278+00	t
2986	Field-Tested	0.18	649	2025-02-20 23:40:36.457638+00	t
2987	Well-Worn	0.3	649	2025-02-20 23:40:36.469276+00	t
2988	Battle-Scarred	0.2	649	2025-02-20 23:40:36.449638+00	t
2989	Factory New	0.24	651	2025-02-20 23:40:54.671332+00	f
2990	Minimal Wear	0.14	651	2025-02-20 23:40:54.687533+00	f
2991	Field-Tested	0.06	651	2025-02-20 23:40:54.68102+00	f
2992	Well-Worn	0.11	651	2025-02-20 23:40:54.697535+00	f
2993	Battle-Scarred	0.08	651	2025-02-20 23:40:54.657333+00	f
2994	Factory New	0.69	651	2025-02-20 23:40:49.070992+00	t
2995	Minimal Wear	0.31	651	2025-02-20 23:40:49.082513+00	t
2996	Field-Tested	0.12	651	2025-02-20 23:40:49.076992+00	t
2997	Well-Worn	0.18	651	2025-02-20 23:40:49.087064+00	t
2998	Battle-Scarred	0.11	651	2025-02-20 23:40:49.066993+00	t
2999	Factory New	583.59	653	2025-02-20 23:40:03.58293+00	f
3000	Minimal Wear	606.87	653	2025-02-20 23:40:03.596448+00	f
3001	Factory New	912.15	653	2025-02-20 23:40:34.225419+00	t
3002	Minimal Wear	1117.58	653	2025-02-20 23:40:34.236419+00	t
3003	Factory New	368.71	655	2025-02-20 23:39:59.844386+00	f
3004	Minimal Wear	271.94	655	2025-02-20 23:39:59.850383+00	f
3005	Field-Tested	245.42	655	2025-02-20 23:39:59.848383+00	f
3006	Well-Worn	206.3	655	2025-02-20 23:39:59.853383+00	f
3007	Battle-Scarred	193.79	655	2025-02-20 23:39:59.841383+00	f
3008	Factory New	970.39	655	2025-02-20 23:40:31.569131+00	t
3009	Minimal Wear	561.64	655	2025-02-20 23:40:31.57673+00	t
3010	Field-Tested	433.67	655	2025-02-20 23:40:31.572715+00	t
3011	Well-Worn	429.39	655	2025-02-20 23:40:31.58173+00	t
3012	Battle-Scarred	325	655	2025-02-20 23:40:31.562133+00	t
3013	Factory New	98.03	657	2025-02-20 23:40:05.037258+00	f
3014	Minimal Wear	102.2	657	2025-02-20 23:40:05.040259+00	f
3015	Factory New	154.2	657	2025-02-20 23:40:35.291666+00	t
3016	Minimal Wear	\N	657	\N	t
3017	Minimal Wear	94.42	659	2025-02-20 23:40:52.788547+00	f
3018	Field-Tested	84.94	659	2025-02-20 23:40:52.778731+00	f
3019	Minimal Wear	144.55	659	2025-02-20 23:40:48.584328+00	t
3020	Field-Tested	140.69	659	2025-02-20 23:40:48.580328+00	t
3021	Factory New	110.28	661	2025-02-20 23:40:12.488305+00	f
3022	Minimal Wear	115.79	661	2025-02-20 23:40:12.498308+00	f
3023	Factory New	507.18	661	2025-02-20 23:40:37.515362+00	t
3024	Minimal Wear	295.68	661	2025-02-20 23:40:37.521361+00	t
3025	Minimal Wear	93.48	663	2025-02-20 23:40:15.155883+00	f
3026	Field-Tested	89.16	663	2025-02-20 23:40:15.150883+00	f
3027	Minimal Wear	145.75	663	2025-02-20 23:40:39.074289+00	t
3028	Field-Tested	162.46	663	2025-02-20 23:40:39.070818+00	t
3029	Factory New	44.1	665	2025-02-20 23:40:28.813016+00	f
3030	Minimal Wear	26.15	665	2025-02-20 23:40:28.821016+00	f
3031	Field-Tested	25.5	665	2025-02-20 23:40:28.817015+00	f
3032	Well-Worn	25.58	665	2025-02-20 23:40:28.825528+00	f
3033	Battle-Scarred	24.88	665	2025-02-20 23:40:28.808015+00	f
3034	Factory New	122.56	665	2025-02-20 23:40:46.85928+00	t
3035	Minimal Wear	28.3	665	2025-02-20 23:40:46.87028+00	t
3036	Field-Tested	26.45	665	2025-02-20 23:40:46.866281+00	t
3037	Well-Worn	30.5	665	2025-02-20 23:40:46.87528+00	t
3038	Battle-Scarred	36.84	665	2025-02-20 23:40:46.856279+00	t
3039	Factory New	25.78	667	2025-02-20 23:40:02.522747+00	f
3040	Minimal Wear	25.82	667	2025-02-20 23:40:02.530262+00	f
3041	Factory New	28.11	667	2025-02-20 23:40:33.766461+00	t
3042	Minimal Wear	27.47	667	2025-02-20 23:40:33.770461+00	t
3043	Minimal Wear	25.53	669	2025-02-20 23:40:19.469402+00	f
3044	Field-Tested	26.27	669	2025-02-20 23:40:19.46341+00	f
3045	Minimal Wear	27.47	669	2025-02-20 23:40:41.653759+00	t
3046	Field-Tested	27.31	669	2025-02-20 23:40:41.649759+00	t
3047	Factory New	79.02	671	2025-02-20 23:40:28.948305+00	f
3048	Minimal Wear	49.44	671	2025-02-20 23:40:28.957908+00	f
3049	Field-Tested	62.66	671	2025-02-20 23:40:28.953305+00	f
3050	Factory New	487.86	671	2025-02-20 23:40:46.949281+00	t
3051	Minimal Wear	191.2	671	2025-02-20 23:40:46.95728+00	t
3052	Field-Tested	266.11	671	2025-02-20 23:40:46.95428+00	t
3053	Factory New	47.5	673	2025-02-20 23:40:53.687868+00	f
3054	Minimal Wear	41.04	673	2025-02-20 23:40:53.704951+00	f
3055	Field-Tested	46.74	673	2025-02-20 23:40:53.69691+00	f
3056	Factory New	63.43	673	2025-02-20 23:40:48.799607+00	t
3057	Minimal Wear	60.19	673	2025-02-20 23:40:48.807243+00	t
3058	Field-Tested	54.18	673	2025-02-20 23:40:48.803608+00	t
3059	Factory New	49.33	675	2025-02-20 23:40:24.503432+00	f
3060	Minimal Wear	63.55	675	2025-02-20 23:40:24.508432+00	f
3061	Factory New	91.46	675	2025-02-20 23:40:44.240081+00	t
3062	Minimal Wear	153.28	675	2025-02-20 23:40:44.25208+00	t
3063	Factory New	19.48	677	2025-02-20 23:40:09.131598+00	f
3064	Minimal Wear	11.81	677	2025-02-20 23:40:09.152598+00	f
3065	Field-Tested	10.05	677	2025-02-20 23:40:09.145598+00	f
3066	Well-Worn	9.13	677	2025-02-20 23:40:09.161599+00	f
3067	Battle-Scarred	9.42	677	2025-02-20 23:40:09.1177+00	f
3068	Factory New	79.54	677	2025-02-20 23:40:36.392737+00	t
3069	Minimal Wear	37.72	677	2025-02-20 23:40:36.405368+00	t
3070	Field-Tested	24.68	677	2025-02-20 23:40:36.398738+00	t
3071	Well-Worn	22.71	677	2025-02-20 23:40:36.410368+00	t
3072	Battle-Scarred	24.47	677	2025-02-20 23:40:36.388737+00	t
3073	Factory New	10.36	679	2025-02-20 23:40:20.312147+00	f
3074	Minimal Wear	16.83	679	2025-02-20 23:40:20.319148+00	f
3075	Factory New	36.65	679	2025-02-20 23:40:41.932242+00	t
3076	Minimal Wear	50.3	679	2025-02-20 23:40:41.937242+00	t
3077	Factory New	11.05	681	2025-02-20 23:40:21.833886+00	f
3078	Minimal Wear	10.64	681	2025-02-20 23:40:21.837885+00	f
3079	Factory New	34.79	681	2025-02-20 23:40:42.543761+00	t
3080	Minimal Wear	22.34	681	2025-02-20 23:40:42.54976+00	t
3081	Factory New	11.84	683	2025-02-20 23:40:06.342414+00	f
3082	Minimal Wear	10.2	683	2025-02-20 23:40:06.359415+00	f
3083	Field-Tested	12.95	683	2025-02-20 23:40:06.351414+00	f
3084	Factory New	32.36	683	2025-02-20 23:40:35.643087+00	t
3085	Minimal Wear	19.63	683	2025-02-20 23:40:35.648087+00	t
3086	Field-Tested	24.06	683	2025-02-15 18:40:36.341735+00	t
3087	Factory New	14.51	685	2025-02-20 23:40:27.405476+00	f
3088	Minimal Wear	3.85	685	2025-02-20 23:40:27.415476+00	f
3089	Field-Tested	3.12	685	2025-02-20 23:40:27.409476+00	f
3090	Well-Worn	3.54	685	2025-02-20 23:40:27.420476+00	f
3091	Battle-Scarred	3.38	685	2025-02-20 23:40:27.400476+00	f
3092	Factory New	96.98	685	2025-02-20 23:40:46.180267+00	t
3093	Minimal Wear	10	685	2025-02-20 23:40:46.190267+00	t
3094	Field-Tested	7.35	685	2025-02-20 23:40:46.185266+00	t
3095	Well-Worn	14.65	685	2025-02-20 23:40:46.194266+00	t
3096	Battle-Scarred	9.18	685	2025-02-20 23:40:46.175269+00	t
3097	Factory New	4.71	687	2025-02-20 23:40:49.455414+00	f
3098	Factory New	9.56	687	2025-02-20 23:40:47.673909+00	t
3099	Factory New	4.41	689	2025-02-20 23:40:07.778331+00	f
3100	Minimal Wear	4.13	689	2025-02-20 23:40:07.797284+00	f
3101	Field-Tested	3.7	689	2025-02-20 23:40:07.785331+00	f
3102	Well-Worn	6.79	689	2025-02-20 23:40:07.806283+00	f
3103	Factory New	9.93	689	2025-02-20 23:40:36.054377+00	t
3104	Minimal Wear	7.8	689	2025-02-20 23:40:36.063562+00	t
3105	Field-Tested	7.67	689	2025-02-20 23:40:36.058377+00	t
3106	Well-Worn	51.75	689	2025-02-20 23:40:36.067565+00	t
3107	Factory New	4.51	691	2025-02-20 23:40:23.786767+00	f
3108	Minimal Wear	3.77	691	2025-02-20 23:40:23.797768+00	f
3109	Field-Tested	3.24	691	2025-02-20 23:40:23.791767+00	f
3110	Factory New	8.09	691	2025-02-20 23:40:43.438959+00	t
3111	Minimal Wear	7.23	691	2025-02-20 23:40:43.452164+00	t
3112	Field-Tested	7.4	691	2025-02-20 23:40:43.442959+00	t
3113	Factory New	6.81	693	2025-02-20 23:40:14.801494+00	f
3114	Minimal Wear	5.72	693	2025-02-20 23:40:14.820499+00	f
3115	Field-Tested	10.27	693	2025-02-20 23:40:14.815495+00	f
3116	Factory New	21.3	693	2025-02-20 23:40:38.993045+00	t
3117	Minimal Wear	16.56	693	2025-02-20 23:40:39.002045+00	t
3118	Field-Tested	23.72	693	2025-02-20 23:40:38.998045+00	t
3119	Factory New	17.75	695	2025-02-20 23:40:04.646698+00	f
3120	Minimal Wear	7.89	695	2025-02-20 23:40:04.655701+00	f
3121	Field-Tested	7.48	695	2025-02-20 23:40:04.651697+00	f
3122	Well-Worn	18.97	695	2025-02-15 23:05:26.988924+00	f
3123	Battle-Scarred	10	695	2025-02-20 23:40:04.640698+00	f
3124	Factory New	113.32	695	2025-02-20 23:40:35.008074+00	t
3125	Minimal Wear	34.9	695	2025-02-20 23:40:35.017073+00	t
3126	Field-Tested	25.72	695	2025-02-20 23:40:35.013073+00	t
3127	Well-Worn	149.54	695	2025-02-20 23:40:35.021261+00	t
3128	Battle-Scarred	36.85	695	2025-02-20 23:40:35.002884+00	t
3129	Factory New	37.63	697	2025-02-20 23:40:24.160627+00	f
3130	Minimal Wear	31.04	697	2025-02-20 23:40:24.169628+00	f
3131	Field-Tested	34.34	697	2025-02-20 23:40:24.165627+00	f
3132	Factory New	54.5	697	2025-02-20 23:40:43.883872+00	t
3133	Minimal Wear	55.34	697	2025-02-20 23:40:43.898871+00	t
3134	Field-Tested	54.53	697	2025-02-20 23:40:43.88787+00	t
3135	Factory New	38.62	699	2025-02-20 23:40:04.507597+00	f
3136	Minimal Wear	27.92	699	2025-02-20 23:40:04.517595+00	f
3137	Field-Tested	19.67	699	2025-02-20 23:40:04.513596+00	f
3138	Well-Worn	26.22	699	2025-02-15 19:08:07.41888+00	f
3139	Factory New	73.93	699	2025-02-20 23:40:34.91331+00	t
3140	Minimal Wear	38.99	699	2025-02-20 23:40:34.92031+00	t
3141	Field-Tested	27.06	699	2025-02-20 23:40:34.917309+00	t
3142	Well-Worn	\N	699	\N	t
3143	Factory New	19.16	701	2025-02-20 23:40:05.017258+00	f
3144	Minimal Wear	8.45	701	2025-02-20 23:40:05.026257+00	f
3145	Field-Tested	5.49	701	2025-02-20 23:40:05.021259+00	f
3146	Well-Worn	7.64	701	2025-02-20 23:40:05.033258+00	f
3147	Battle-Scarred	5.29	701	2025-02-20 23:40:05.013257+00	f
3148	Factory New	65.57	701	2025-02-20 23:40:35.263996+00	t
3149	Minimal Wear	26.32	701	2025-02-20 23:40:35.274997+00	t
3150	Field-Tested	15.95	701	2025-02-20 23:40:35.267996+00	t
3151	Well-Worn	42.14	701	2025-02-20 23:40:35.283153+00	t
3152	Battle-Scarred	24.5	701	2025-02-20 23:40:35.259667+00	t
3153	Factory New	6.84	703	2025-02-20 23:40:09.235528+00	f
3154	Minimal Wear	6.64	703	2025-02-20 23:40:09.248379+00	f
3155	Field-Tested	6.98	703	2025-02-20 23:40:09.241379+00	f
3156	Factory New	22.18	703	2025-02-20 23:40:36.415367+00	t
3157	Minimal Wear	17.45	703	2025-02-20 23:40:36.424438+00	t
3158	Field-Tested	21.58	703	2025-02-20 23:40:36.420436+00	t
3159	Factory New	74.08	705	2025-02-20 23:40:50.568605+00	f
3160	Minimal Wear	6.81	705	2025-02-20 23:40:50.668253+00	f
3161	Field-Tested	8.52	705	2025-02-20 23:40:50.63266+00	f
3162	Factory New	17.02	705	2025-02-20 23:40:47.99228+00	t
3163	Minimal Wear	13.2	705	2025-02-20 23:40:48.00128+00	t
3164	Field-Tested	15.58	705	2025-02-20 23:40:47.99728+00	t
3165	Factory New	6.2	707	2025-02-20 23:40:04.551596+00	f
3166	Minimal Wear	4.82	707	2025-02-20 23:40:04.559597+00	f
3167	Field-Tested	5	707	2025-02-20 23:40:04.555595+00	f
3168	Factory New	15.55	707	2025-02-20 23:40:34.946942+00	t
3169	Minimal Wear	11.64	707	2025-02-20 23:40:34.954942+00	t
3170	Field-Tested	18.43	707	2025-02-20 23:40:34.950943+00	t
3171	Factory New	23.92	709	2025-02-20 23:40:53.725339+00	f
3172	Minimal Wear	8.91	709	2025-02-20 23:40:53.744051+00	f
3173	Field-Tested	6.08	709	2025-02-20 23:40:53.736051+00	f
3174	Well-Worn	8.3	709	2025-02-20 23:40:53.752575+00	f
3175	Battle-Scarred	5.73	709	2025-02-20 23:40:53.714995+00	f
3176	Factory New	98.45	709	2025-02-20 23:40:48.816242+00	t
3177	Minimal Wear	33.29	709	2025-02-20 23:40:48.826243+00	t
3178	Field-Tested	18.03	709	2025-02-20 23:40:48.820241+00	t
3179	Well-Worn	25.2	709	2025-02-15 18:29:55.333139+00	t
3180	Battle-Scarred	21.81	709	2025-02-20 23:40:48.811243+00	t
3181	Factory New	18.82	711	2025-02-20 23:40:12.277258+00	f
3182	Minimal Wear	3.39	711	2025-02-20 23:40:12.287255+00	f
3183	Field-Tested	2.02	711	2025-02-20 23:40:12.282256+00	f
3184	Well-Worn	3.18	711	2025-02-20 23:40:12.291255+00	f
3185	Battle-Scarred	1.94	711	2025-02-20 23:40:12.272742+00	f
3186	Factory New	110.59	711	2025-02-20 23:40:37.40952+00	t
3187	Minimal Wear	10.7	711	2025-02-20 23:40:37.418673+00	t
3188	Field-Tested	5.14	711	2025-02-20 23:40:37.414674+00	t
3189	Well-Worn	11.38	711	2025-02-20 23:40:37.423674+00	t
3190	Battle-Scarred	8	711	2025-02-15 23:05:39.60722+00	t
3191	Factory New	12.53	713	2025-02-20 23:40:04.075216+00	f
3192	Minimal Wear	1.84	713	2025-02-20 23:40:04.08673+00	f
3193	Field-Tested	1.1	713	2025-02-20 23:40:04.082217+00	f
3194	Well-Worn	1.25	713	2025-02-20 23:40:04.09073+00	f
3195	Battle-Scarred	1.09	713	2025-02-20 23:40:04.068615+00	f
3196	Factory New	82.06	713	2025-02-20 23:40:34.560029+00	t
3197	Minimal Wear	4.85	713	2025-02-20 23:40:34.576906+00	t
3198	Field-Tested	2.03	713	2025-02-20 23:40:34.568909+00	t
3199	Well-Worn	2.75	713	2025-02-20 23:40:34.586906+00	t
3200	Battle-Scarred	2.31	713	2025-02-20 23:40:34.551306+00	t
3201	Factory New	4.44	715	2025-02-20 23:40:06.691647+00	f
3202	Minimal Wear	2.44	715	2025-02-20 23:40:06.714648+00	f
3203	Field-Tested	1.8	715	2025-02-20 23:40:06.703648+00	f
3204	Well-Worn	3.35	715	2025-02-20 23:40:06.721647+00	f
3205	Battle-Scarred	2.45	715	2025-02-20 23:40:06.683649+00	f
3206	Factory New	11.03	715	2025-02-20 23:40:35.787905+00	t
3207	Minimal Wear	6.64	715	2025-02-20 23:40:35.796906+00	t
3208	Field-Tested	3.61	715	2025-02-20 23:40:35.791906+00	t
3209	Well-Worn	104.96	715	2025-02-15 18:40:21.726389+00	t
3210	Battle-Scarred	4.73	715	2025-02-20 23:40:35.783906+00	t
3211	Factory New	2.6	717	2025-02-20 23:40:23.048001+00	f
3212	Minimal Wear	1.33	717	2025-02-20 23:40:23.05799+00	f
3213	Field-Tested	1.32	717	2025-02-20 23:40:23.052+00	f
3214	Well-Worn	7.1	717	2025-02-20 23:40:23.067591+00	f
3215	Battle-Scarred	1.28	717	2025-02-20 23:40:23.041+00	f
3216	Factory New	6.67	717	2025-02-20 23:40:43.159152+00	t
3217	Minimal Wear	5.78	717	2025-02-20 23:40:43.169198+00	t
3218	Field-Tested	2.85	717	2025-02-20 23:40:43.165198+00	t
3219	Well-Worn	41.11	717	2025-02-20 23:40:43.173234+00	t
3220	Battle-Scarred	7.94	717	2025-02-15 18:34:13.397765+00	t
3221	Factory New	146.43	719	2025-02-20 23:40:03.990587+00	f
3222	Minimal Wear	94.39	719	2025-02-20 23:40:04.000586+00	f
3223	Field-Tested	56.29	719	2025-02-20 23:40:03.996586+00	f
3224	Well-Worn	118.37	719	2025-02-20 23:40:04.004586+00	f
3225	Battle-Scarred	44.32	719	2025-02-20 23:40:03.986586+00	f
3226	Factory New	283.37	719	2025-02-20 23:40:34.437384+00	t
3227	Minimal Wear	167	719	2025-02-20 23:40:34.453274+00	t
3228	Field-Tested	106.48	719	2025-02-20 23:40:34.446276+00	t
3229	Well-Worn	141.13	719	2025-02-20 23:40:34.46056+00	t
3230	Battle-Scarred	126.23	719	2025-02-20 23:40:34.430387+00	t
3231	Factory New	16.58	721	2025-02-20 23:40:07.319393+00	f
3232	Minimal Wear	10.61	721	2025-02-20 23:40:07.335392+00	f
3233	Field-Tested	9.13	721	2025-02-20 23:40:07.327393+00	f
3234	Well-Worn	13.82	721	2025-02-20 23:40:07.341392+00	f
3235	Battle-Scarred	11.06	721	2025-02-20 23:40:07.313393+00	f
3236	Factory New	61.5	721	2025-02-20 23:40:35.939974+00	t
3237	Minimal Wear	38.18	721	2025-02-20 23:40:35.949152+00	t
3238	Field-Tested	35.73	721	2025-02-20 23:40:35.945155+00	t
3239	Well-Worn	43.82	721	2025-02-15 23:05:38.805032+00	t
3240	Battle-Scarred	42.66	721	2025-02-20 23:40:35.935291+00	t
3241	Factory New	22.22	723	2025-02-20 23:40:20.273145+00	f
3242	Minimal Wear	10.57	723	2025-02-20 23:40:20.29523+00	f
3243	Field-Tested	6.64	723	2025-02-20 23:40:20.279171+00	f
3244	Well-Worn	7.42	723	2025-02-15 23:05:32.805379+00	f
3245	Battle-Scarred	7.09	723	2025-02-20 23:40:20.256303+00	f
3246	Factory New	105.2	723	2025-02-20 23:40:41.914242+00	t
3247	Minimal Wear	26.62	723	2025-02-20 23:40:41.922243+00	t
3248	Field-Tested	15.24	723	2025-02-20 23:40:41.918242+00	t
3249	Well-Worn	15.12	723	2025-02-20 23:40:41.926242+00	t
3250	Battle-Scarred	15.95	723	2025-02-20 23:40:41.909461+00	t
3251	Factory New	11.64	725	2025-02-20 23:40:01.657872+00	f
3252	Minimal Wear	7.11	725	2025-02-20 23:40:01.667872+00	f
3253	Field-Tested	5.97	725	2025-02-20 23:40:01.662873+00	f
3254	Well-Worn	6.79	725	2025-02-20 23:40:01.671872+00	f
3255	Factory New	24.99	725	2025-02-20 23:40:33.352992+00	t
3256	Minimal Wear	13.12	725	2025-02-20 23:40:33.37633+00	t
3257	Field-Tested	10.58	725	2025-02-20 23:40:33.368328+00	t
3258	Well-Worn	17.67	725	2025-02-20 23:40:33.387359+00	t
3259	Factory New	11.56	727	2025-02-20 23:40:24.83806+00	f
3260	Minimal Wear	7.26	727	2025-02-20 23:40:24.858939+00	f
3261	Field-Tested	5.57	727	2025-02-20 23:40:24.849743+00	f
3262	Well-Worn	8.55	727	2025-02-20 23:40:24.865098+00	f
3263	Battle-Scarred	6.47	727	2025-02-20 23:40:24.82606+00	f
3264	Factory New	27.19	727	2025-02-20 23:40:44.788689+00	t
3265	Minimal Wear	14.98	727	2025-02-20 23:40:44.812295+00	t
3266	Field-Tested	11.1	727	2025-02-20 23:40:44.79369+00	t
3267	Well-Worn	11.7	727	2025-02-20 23:40:44.826893+00	t
3268	Battle-Scarred	12.25	727	2025-02-20 23:40:44.779689+00	t
3269	Factory New	2.96	729	2025-02-20 23:40:18.444521+00	f
3270	Minimal Wear	1.34	729	2025-02-20 23:40:18.455657+00	f
3271	Field-Tested	1	729	2025-02-20 23:40:18.449516+00	f
3272	Well-Worn	1.15	729	2025-02-20 23:40:18.458657+00	f
3273	Battle-Scarred	1.07	729	2025-02-20 23:40:18.439517+00	f
3274	Factory New	12.51	729	2025-02-20 23:40:41.157729+00	t
3275	Minimal Wear	3.39	729	2025-02-20 23:40:41.167732+00	t
3276	Field-Tested	1.47	729	2025-02-20 23:40:41.162731+00	t
3277	Well-Worn	3.37	729	2025-02-20 23:40:41.171729+00	t
3278	Battle-Scarred	2.96	729	2025-02-20 23:40:41.15373+00	t
3279	Factory New	2.02	731	2025-02-20 23:40:52.143851+00	f
3280	Minimal Wear	1.33	731	2025-02-20 23:40:52.157066+00	f
3281	Field-Tested	0.74	731	2025-02-20 23:40:52.153067+00	f
3282	Well-Worn	1.03	731	2025-02-20 23:40:52.161066+00	f
3283	Battle-Scarred	0.62	731	2025-02-20 23:40:52.135851+00	f
3284	Factory New	5.74	731	2025-02-20 23:40:48.306061+00	t
3285	Minimal Wear	2.6	731	2025-02-20 23:40:48.315061+00	t
3286	Field-Tested	1.3	731	2025-02-20 23:40:48.31006+00	t
3287	Well-Worn	6.06	731	2025-02-20 23:40:48.320061+00	t
3288	Battle-Scarred	1.17	731	2025-02-20 23:40:48.301062+00	t
3289	Factory New	1.99	733	2025-02-20 23:40:08.999534+00	f
3290	Minimal Wear	1.51	733	2025-02-20 23:40:09.012048+00	f
3291	Field-Tested	0.99	733	2025-02-20 23:40:09.007049+00	f
3292	Well-Worn	0.88	733	2025-02-20 23:40:09.022565+00	f
3293	Battle-Scarred	1.48	733	2025-02-20 23:40:08.988535+00	f
3294	Factory New	5.27	733	2025-02-20 23:40:36.346662+00	t
3295	Minimal Wear	3.39	733	2025-02-20 23:40:36.354662+00	t
3296	Field-Tested	1.85	733	2025-02-20 23:40:36.350662+00	t
3297	Well-Worn	4.55	733	2025-02-20 23:40:36.358662+00	t
3298	Battle-Scarred	2.03	733	2025-02-20 23:40:36.341665+00	t
3299	Factory New	2.04	735	2025-02-20 23:40:23.806772+00	f
3300	Minimal Wear	1.28	735	2025-02-20 23:40:23.815492+00	f
3301	Field-Tested	0.82	735	2025-02-20 23:40:23.811495+00	f
3302	Well-Worn	0.88	735	2025-02-20 23:40:23.819492+00	f
3303	Battle-Scarred	0.93	735	2025-02-20 23:40:23.801773+00	f
3304	Factory New	6.84	735	2025-02-20 23:40:43.460164+00	t
3305	Minimal Wear	3.56	735	2025-02-20 23:40:43.492217+00	t
3306	Field-Tested	1.65	735	2025-02-20 23:40:43.487218+00	t
3307	Well-Worn	4.52	735	2025-02-20 23:40:43.500217+00	t
3308	Battle-Scarred	1.91	735	2025-02-20 23:40:43.457164+00	t
3309	Factory New	1.86	737	2025-02-20 23:40:13.668014+00	f
3310	Minimal Wear	1.11	737	2025-02-20 23:40:13.680015+00	f
3311	Field-Tested	0.62	737	2025-02-20 23:40:13.673016+00	f
3312	Well-Worn	0.62	737	2025-02-20 23:40:13.685015+00	f
3313	Battle-Scarred	0.54	737	2025-02-20 23:40:13.663015+00	f
3314	Factory New	4.4	737	2025-02-20 23:40:38.422438+00	t
3315	Minimal Wear	2.34	737	2025-02-20 23:40:38.443549+00	t
3316	Field-Tested	1.14	737	2025-02-20 23:40:38.43855+00	t
3317	Well-Worn	1.29	737	2025-02-20 23:40:38.463869+00	t
3318	Battle-Scarred	1.2	737	2025-02-20 23:40:38.405692+00	t
3319	Factory New	0.31	739	2025-02-20 23:40:18.131628+00	f
3320	Minimal Wear	0.27	739	2025-02-20 23:40:18.140628+00	f
3321	Field-Tested	0.18	739	2025-02-20 23:40:18.13663+00	f
3322	Well-Worn	0.15	739	2025-02-20 23:40:18.14563+00	f
3323	Battle-Scarred	0.12	739	2025-02-20 23:40:18.126629+00	f
3324	Factory New	1.05	739	2025-02-20 23:40:41.04773+00	t
3325	Minimal Wear	0.48	739	2025-02-20 23:40:41.056729+00	t
3326	Field-Tested	0.14	739	2025-02-20 23:40:41.052728+00	t
3327	Well-Worn	0.5	739	2025-02-20 23:40:41.060729+00	t
3328	Battle-Scarred	0.24	739	2025-02-20 23:40:41.041696+00	t
3329	Factory New	1.45	741	2025-02-20 23:40:13.308385+00	f
3330	Minimal Wear	0.28	741	2025-02-20 23:40:13.318386+00	f
3331	Field-Tested	0.22	741	2025-02-20 23:40:13.314388+00	f
3332	Well-Worn	0.19	741	2025-02-20 23:40:13.323386+00	f
3333	Battle-Scarred	0.18	741	2025-02-20 23:40:13.304387+00	f
3334	Factory New	5.71	741	2025-02-20 23:40:37.932574+00	t
3335	Minimal Wear	2.11	741	2025-02-20 23:40:37.952586+00	t
3336	Field-Tested	0.62	741	2025-02-20 23:40:37.938546+00	t
3337	Well-Worn	0.57	741	2025-02-20 23:40:37.957447+00	t
3338	Battle-Scarred	0.53	741	2025-02-20 23:40:37.912606+00	t
3339	Factory New	0.74	743	2025-02-20 23:40:07.486086+00	f
3340	Minimal Wear	0.22	743	2025-02-20 23:40:07.510874+00	f
3341	Field-Tested	0.18	743	2025-02-20 23:40:07.495833+00	f
3342	Well-Worn	0.15	743	2025-02-20 23:40:07.520875+00	f
3343	Battle-Scarred	0.15	743	2025-02-20 23:40:07.476086+00	f
3344	Factory New	4.19	743	2025-02-20 23:40:35.979418+00	t
3345	Minimal Wear	0.87	743	2025-02-20 23:40:35.988669+00	t
3346	Field-Tested	0.5	743	2025-02-20 23:40:35.984671+00	t
3347	Well-Worn	0.3	743	2025-02-20 23:40:35.99367+00	t
3348	Battle-Scarred	0.3	743	2025-02-20 23:40:35.974415+00	t
3349	Factory New	0.35	745	2025-02-20 23:40:16.84528+00	f
3350	Minimal Wear	0.17	745	2025-02-20 23:40:16.85228+00	f
3351	Field-Tested	0.31	745	2025-02-20 23:40:16.84828+00	f
3352	Well-Worn	0.14	745	2025-02-20 23:40:16.85588+00	f
3353	Battle-Scarred	0.12	745	2025-02-20 23:40:16.838279+00	f
3354	Factory New	1.55	745	2025-02-20 23:40:39.984493+00	t
3355	Minimal Wear	0.34	745	2025-02-20 23:40:39.993137+00	t
3356	Field-Tested	0.2	745	2025-02-20 23:40:39.988492+00	t
3357	Well-Worn	0.24	745	2025-02-20 23:40:39.999136+00	t
3358	Battle-Scarred	0.23	745	2025-02-20 23:40:39.980493+00	t
3359	Factory New	0.38	747	2025-02-20 23:40:49.581557+00	f
3360	Minimal Wear	0.24	747	2025-02-20 23:40:49.589557+00	f
3361	Field-Tested	0.18	747	2025-02-20 23:40:49.586557+00	f
3362	Well-Worn	0.46	747	2025-02-20 23:40:49.594185+00	f
3363	Battle-Scarred	0.15	747	2025-02-20 23:40:49.576558+00	f
3364	Factory New	1.62	747	2025-02-20 23:40:47.767672+00	t
3365	Minimal Wear	0.57	747	2025-02-20 23:40:47.779673+00	t
3366	Field-Tested	0.27	747	2025-02-20 23:40:47.774673+00	t
3367	Well-Worn	0.68	747	2025-02-20 23:40:47.783672+00	t
3368	Battle-Scarred	0.27	747	2025-02-20 23:40:47.760673+00	t
3369	Factory New	0.28	749	2025-02-20 23:40:06.185168+00	f
3370	Minimal Wear	0.19	749	2025-02-20 23:40:06.200071+00	f
3371	Field-Tested	0.15	749	2025-02-20 23:40:06.191073+00	f
3372	Well-Worn	0.34	749	2025-02-20 23:40:06.207947+00	f
3373	Battle-Scarred	0.15	749	2025-02-20 23:40:06.179168+00	f
3374	Factory New	1.18	749	2025-02-20 23:40:35.599305+00	t
3375	Minimal Wear	0.48	749	2025-02-20 23:40:35.608697+00	t
3376	Field-Tested	0.17	749	2025-02-20 23:40:35.604064+00	t
3377	Well-Worn	0.33	749	2025-02-20 23:40:35.613698+00	t
3378	Battle-Scarred	0.29	749	2025-02-20 23:40:35.594304+00	t
3379	Factory New	0.25	751	2025-02-20 23:40:27.278589+00	f
3380	Minimal Wear	0.17	751	2025-02-20 23:40:27.287586+00	f
3381	Field-Tested	0.16	751	2025-02-20 23:40:27.282587+00	f
3382	Well-Worn	0.15	751	2025-02-20 23:40:27.291586+00	f
3383	Battle-Scarred	0.14	751	2025-02-20 23:40:27.273587+00	f
3384	Factory New	0.74	751	2025-02-20 23:40:46.096155+00	t
3385	Minimal Wear	0.34	751	2025-02-20 23:40:46.105154+00	t
3386	Field-Tested	0.19	751	2025-02-20 23:40:46.100152+00	t
3387	Well-Worn	0.18	751	2025-02-20 23:40:46.109154+00	t
3388	Battle-Scarred	0.72	751	2025-02-20 23:40:46.090152+00	t
3389	Factory New	194.37	753	2025-02-20 23:39:59.685543+00	f
3390	Minimal Wear	62.77	753	2025-02-20 23:39:59.691544+00	f
3391	Field-Tested	32.31	753	2025-02-20 23:39:59.688543+00	f
3392	Well-Worn	48.95	753	2025-02-20 23:39:59.696543+00	f
3393	Battle-Scarred	30.2	753	2025-02-20 23:39:59.682543+00	f
3394	Factory New	431.58	753	2025-02-20 23:40:31.411715+00	t
3395	Minimal Wear	128.65	753	2025-02-20 23:40:31.431227+00	t
3396	Field-Tested	71.3	753	2025-02-20 23:40:31.421041+00	t
3397	Well-Worn	96.84	753	2025-02-20 23:40:31.44079+00	t
3398	Battle-Scarred	67.84	753	2025-02-20 23:40:31.403715+00	t
3399	Factory New	33.85	755	2025-02-20 23:40:03.689782+00	f
3400	Minimal Wear	28.94	755	2025-02-20 23:40:03.699783+00	f
3401	Field-Tested	25.36	755	2025-02-20 23:40:03.695783+00	f
3402	Well-Worn	25.95	755	2025-02-20 23:40:03.703783+00	f
3403	Battle-Scarred	26.62	755	2025-02-20 23:40:03.685783+00	f
3404	Factory New	99.62	755	2025-02-20 23:40:34.310215+00	t
3405	Minimal Wear	76.14	755	2025-02-20 23:40:34.332338+00	t
3406	Field-Tested	58.16	755	2025-02-20 23:40:34.321336+00	t
3407	Well-Worn	88.11	755	2025-02-20 23:40:34.33993+00	t
3408	Battle-Scarred	58.23	755	2025-02-15 23:05:38.035432+00	t
3409	Factory New	11.02	757	2025-02-20 23:40:05.104827+00	f
3410	Minimal Wear	6.87	757	2025-02-20 23:40:05.116825+00	f
3411	Field-Tested	5.33	757	2025-02-20 23:40:05.108826+00	f
3412	Well-Worn	7.58	757	2025-02-20 23:40:05.120825+00	f
3413	Battle-Scarred	5.63	757	2025-02-20 23:40:05.097826+00	f
3414	Factory New	24.8	757	2025-02-20 23:40:35.350013+00	t
3415	Minimal Wear	16.57	757	2025-02-20 23:40:35.358013+00	t
3416	Field-Tested	12.8	757	2025-02-20 23:40:35.354013+00	t
3417	Well-Worn	16.68	757	2025-02-20 23:40:35.363132+00	t
3418	Battle-Scarred	16.35	757	2025-02-20 23:40:35.347014+00	t
3419	Factory New	9.89	759	2025-02-20 23:40:18.76783+00	f
3420	Minimal Wear	6.22	759	2025-02-20 23:40:18.776342+00	f
3421	Field-Tested	4.05	759	2025-02-20 23:40:18.77183+00	f
3422	Well-Worn	4.89	759	2025-02-20 23:40:18.783705+00	f
3423	Battle-Scarred	3.47	759	2025-02-20 23:40:18.763829+00	f
3424	Factory New	20.4	759	2025-02-20 23:40:41.323699+00	t
3425	Minimal Wear	12.28	759	2025-02-20 23:40:41.333698+00	t
3426	Field-Tested	6.86	759	2025-02-20 23:40:41.329702+00	t
3427	Well-Worn	8.88	759	2025-02-20 23:40:41.337698+00	t
3428	Battle-Scarred	8.39	759	2025-02-20 23:40:41.319698+00	t
3429	Factory New	9.3	761	2025-02-20 23:40:51.920665+00	f
3430	Minimal Wear	6.02	761	2025-02-20 23:40:51.932665+00	f
3431	Field-Tested	3.99	761	2025-02-20 23:40:51.926665+00	f
3432	Well-Worn	4.06	761	2025-02-20 23:40:51.936665+00	f
3433	Battle-Scarred	3.68	761	2025-02-20 23:40:51.909665+00	f
3434	Factory New	18.87	761	2025-02-20 23:40:48.197386+00	t
3435	Minimal Wear	11.78	761	2025-02-20 23:40:48.206386+00	t
3436	Field-Tested	7.8	761	2025-02-20 23:40:48.201386+00	t
3437	Well-Worn	9.75	761	2025-02-20 23:40:48.210387+00	t
3438	Battle-Scarred	9.8	761	2025-02-20 23:40:48.192386+00	t
3439	Factory New	2.55	763	2025-02-20 23:40:17.304889+00	f
3440	Minimal Wear	0.91	763	2025-02-20 23:40:17.31489+00	f
3441	Field-Tested	0.49	763	2025-02-20 23:40:17.307889+00	f
3442	Well-Worn	0.53	763	2025-02-20 23:40:17.318889+00	f
3443	Battle-Scarred	0.49	763	2025-02-20 23:40:17.30089+00	f
3444	Factory New	8	763	2025-02-20 23:40:40.469201+00	t
3445	Minimal Wear	2.05	763	2025-02-20 23:40:40.492541+00	t
3446	Field-Tested	1.34	763	2025-02-20 23:40:40.485337+00	t
3447	Well-Worn	1.81	763	2025-02-20 23:40:40.498806+00	t
3448	Battle-Scarred	1.27	763	2025-02-20 23:40:40.465202+00	t
3449	Factory New	1.51	765	2025-02-20 23:40:10.976017+00	f
3450	Minimal Wear	0.86	765	2025-02-20 23:40:10.989022+00	f
3451	Field-Tested	0.5	765	2025-02-20 23:40:10.984018+00	f
3452	Well-Worn	0.51	765	2025-02-20 23:40:10.995096+00	f
3453	Battle-Scarred	0.45	765	2025-02-20 23:40:10.9715+00	f
3454	Factory New	3.18	765	2025-02-20 23:40:36.929172+00	t
3455	Minimal Wear	1.6	765	2025-02-20 23:40:36.936863+00	t
3456	Field-Tested	1.05	765	2025-02-20 23:40:36.933862+00	t
3457	Well-Worn	2.18	765	2025-02-20 23:40:36.940862+00	t
3458	Battle-Scarred	1.27	765	2025-02-20 23:40:36.924171+00	t
3459	Factory New	1.66	767	2025-02-20 23:40:12.032808+00	f
3460	Minimal Wear	0.96	767	2025-02-20 23:40:12.040809+00	f
3461	Field-Tested	0.8	767	2025-02-20 23:40:12.036809+00	f
3462	Well-Worn	0.88	767	2025-02-20 23:40:12.046673+00	f
3463	Battle-Scarred	0.88	767	2025-02-20 23:40:12.02881+00	f
3464	Factory New	4.7	767	2025-02-20 23:40:37.300495+00	t
3465	Minimal Wear	2.35	767	2025-02-20 23:40:37.309495+00	t
3466	Field-Tested	2.19	767	2025-02-20 23:40:37.305496+00	t
3467	Well-Worn	1.59	767	2025-02-20 23:40:37.313661+00	t
3468	Battle-Scarred	2.03	767	2025-02-20 23:40:37.293496+00	t
3469	Factory New	1.73	769	2025-02-20 23:40:23.947245+00	f
3470	Minimal Wear	1.18	769	2025-02-20 23:40:23.956245+00	f
3471	Field-Tested	0.87	769	2025-02-20 23:40:23.951249+00	f
3472	Well-Worn	3.25	769	2025-02-20 23:40:23.960245+00	f
3473	Factory New	4.08	769	2025-02-20 23:40:43.61326+00	t
3474	Minimal Wear	2.23	769	2025-02-20 23:40:43.630261+00	t
3475	Field-Tested	1.74	769	2025-02-20 23:40:43.62426+00	t
3476	Well-Worn	3.52	769	2025-02-20 23:40:43.641258+00	t
3477	Factory New	1.69	771	2025-02-20 23:40:52.848548+00	f
3478	Minimal Wear	1.08	771	2025-02-20 23:40:52.866547+00	f
3479	Field-Tested	0.7	771	2025-02-20 23:40:52.855547+00	f
3480	Well-Worn	1.24	771	2025-02-20 23:40:52.877547+00	f
3481	Battle-Scarred	1.2	771	2025-02-20 23:40:52.838547+00	f
3482	Factory New	4.29	771	2025-02-20 23:40:48.591911+00	t
3483	Minimal Wear	2.09	771	2025-02-20 23:40:48.599912+00	t
3484	Field-Tested	2.32	771	2025-02-20 23:40:48.596913+00	t
3485	Well-Worn	4.07	771	2025-02-20 23:40:48.604912+00	t
3486	Battle-Scarred	3.79	771	2025-02-20 23:40:48.588912+00	t
3487	Factory New	2.78	773	2025-02-20 23:40:16.153318+00	f
3488	Minimal Wear	0.72	773	2025-02-20 23:40:16.177551+00	f
3489	Field-Tested	0.37	773	2025-02-20 23:40:16.165321+00	f
3490	Well-Worn	0.17	773	2025-02-20 23:40:16.189549+00	f
3491	Battle-Scarred	0.17	773	2025-02-20 23:40:16.143318+00	f
3492	Factory New	10.88	773	2025-02-20 23:40:39.630727+00	t
3493	Minimal Wear	2.61	773	2025-02-20 23:40:39.638727+00	t
3494	Field-Tested	1.19	773	2025-02-20 23:40:39.634726+00	t
3495	Well-Worn	0.9	773	2025-02-20 23:40:39.642726+00	t
3496	Battle-Scarred	0.76	773	2025-02-20 23:40:39.626026+00	t
3497	Minimal Wear	0.88	775	2025-02-20 23:40:49.607186+00	f
3498	Field-Tested	0.11	775	2025-02-20 23:40:49.602186+00	f
3499	Well-Worn	0.12	775	2025-02-20 23:40:49.611186+00	f
3500	Battle-Scarred	0.09	775	2025-02-20 23:40:49.599186+00	f
3501	Minimal Wear	3.68	775	2025-02-20 23:40:47.796497+00	t
3502	Field-Tested	0.17	775	2025-02-20 23:40:47.792496+00	t
3503	Well-Worn	0.16	775	2025-02-20 23:40:47.800495+00	t
3504	Battle-Scarred	0.13	775	2025-02-20 23:40:47.788496+00	t
3505	Factory New	0.54	777	2025-02-20 23:40:13.013853+00	f
3506	Minimal Wear	0.16	777	2025-02-20 23:40:13.029948+00	f
3507	Field-Tested	0.11	777	2025-02-20 23:40:13.022356+00	f
3508	Well-Worn	0.13	777	2025-02-20 23:40:13.050537+00	f
3509	Battle-Scarred	0.13	777	2025-02-20 23:40:13.004506+00	f
3510	Factory New	1.94	777	2025-02-20 23:40:37.756093+00	t
3511	Minimal Wear	0.53	777	2025-02-20 23:40:37.780804+00	t
3512	Field-Tested	0.39	777	2025-02-20 23:40:37.761094+00	t
3513	Well-Worn	0.72	777	2025-02-20 23:40:37.809165+00	t
3514	Battle-Scarred	0.43	777	2025-02-20 23:40:37.742467+00	t
3515	Factory New	0.29	779	2025-02-20 23:40:28.424239+00	f
3516	Minimal Wear	0.15	779	2025-02-20 23:40:28.433524+00	f
3517	Field-Tested	0.09	779	2025-02-20 23:40:28.42924+00	f
3518	Well-Worn	0.14	779	2025-02-20 23:40:28.437524+00	f
3519	Battle-Scarred	0.12	779	2025-02-20 23:40:28.420239+00	f
3520	Factory New	1.25	779	2025-02-20 23:40:46.587234+00	t
3521	Minimal Wear	0.33	779	2025-02-20 23:40:46.595236+00	t
3522	Field-Tested	0.14	779	2025-02-20 23:40:46.591234+00	t
3523	Well-Worn	0.45	779	2025-02-20 23:40:46.600234+00	t
3524	Battle-Scarred	0.16	779	2025-02-20 23:40:46.582234+00	t
3525	Factory New	0.34	781	2025-02-20 23:40:20.354514+00	f
3526	Minimal Wear	0.16	781	2025-02-20 23:40:20.379019+00	f
3527	Field-Tested	0.1	781	2025-02-20 23:40:20.363067+00	f
3528	Well-Worn	0.16	781	2025-02-20 23:40:20.384209+00	f
3529	Battle-Scarred	0.15	781	2025-02-20 23:40:20.336664+00	f
3530	Factory New	1.38	781	2025-02-20 23:40:41.945244+00	t
3531	Minimal Wear	0.52	781	2025-02-20 23:40:41.954243+00	t
3532	Field-Tested	0.27	781	2025-02-20 23:40:41.950242+00	t
3533	Well-Worn	0.74	781	2025-02-20 23:40:41.957242+00	t
3534	Battle-Scarred	0.23	781	2025-02-20 23:40:41.940242+00	t
3535	Factory New	0.26	783	2025-02-20 23:40:30.112035+00	f
3536	Minimal Wear	0.14	783	2025-02-20 23:40:30.127505+00	f
3537	Field-Tested	0.09	783	2025-02-20 23:40:30.119505+00	f
3538	Well-Worn	0.09	783	2025-02-20 23:40:30.135752+00	f
3539	Battle-Scarred	0.07	783	2025-02-20 23:40:30.104033+00	f
3540	Factory New	0.89	783	2025-02-20 23:40:47.322727+00	t
3541	Minimal Wear	0.28	783	2025-02-20 23:40:47.332728+00	t
3542	Field-Tested	0.14	783	2025-02-20 23:40:47.327727+00	t
3543	Well-Worn	0.13	783	2025-02-20 23:40:47.336728+00	t
3544	Battle-Scarred	0.15	783	2025-02-20 23:40:47.318727+00	t
3545	Factory New	0.26	785	2025-02-20 23:40:22.367614+00	f
3546	Minimal Wear	0.13	785	2025-02-20 23:40:22.374614+00	f
3547	Field-Tested	0.08	785	2025-02-20 23:40:22.370615+00	f
3548	Well-Worn	0.12	785	2025-02-20 23:40:22.379614+00	f
3549	Battle-Scarred	0.08	785	2025-02-20 23:40:22.363615+00	f
3550	Factory New	0.75	785	2025-02-20 23:40:42.742444+00	t
3551	Minimal Wear	0.3	785	2025-02-20 23:40:42.751444+00	t
3552	Field-Tested	0.16	785	2025-02-20 23:40:42.747444+00	t
3553	Well-Worn	0.27	785	2025-02-20 23:40:42.757445+00	t
3554	Battle-Scarred	0.17	785	2025-02-20 23:40:42.738444+00	t
3555	Factory New	57.9	787	2025-02-20 23:40:00.712487+00	f
3556	Minimal Wear	17.61	787	2025-02-20 23:40:00.736631+00	f
3557	Field-Tested	9.36	787	2025-02-20 23:40:00.72849+00	f
3558	Well-Worn	9.17	787	2025-02-20 23:40:00.757026+00	f
3559	Battle-Scarred	7.07	787	2025-02-20 23:40:00.701486+00	f
3560	Factory New	162.41	787	2025-02-20 23:40:32.422519+00	t
3561	Minimal Wear	48.68	787	2025-02-20 23:40:32.43752+00	t
3562	Field-Tested	28.39	787	2025-02-20 23:40:32.42852+00	t
3563	Well-Worn	20.96	787	2025-02-20 23:40:32.442519+00	t
3564	Battle-Scarred	27.71	787	2025-02-20 23:40:32.418519+00	t
3565	Factory New	17.05	789	2025-02-20 23:40:21.107382+00	f
3566	Minimal Wear	7.39	789	2025-02-20 23:40:21.126378+00	f
3567	Field-Tested	3.21	789	2025-02-20 23:40:21.117378+00	f
3568	Well-Worn	4.42	789	2025-02-20 23:40:21.132377+00	f
3569	Battle-Scarred	3.39	789	2025-02-20 23:40:21.088657+00	f
3570	Factory New	70.82	789	2025-02-20 23:40:42.05561+00	t
3571	Minimal Wear	18.98	789	2025-02-20 23:40:42.064612+00	t
3572	Field-Tested	8.99	789	2025-02-20 23:40:42.058611+00	t
3573	Well-Worn	10.75	789	2025-02-20 23:40:42.068612+00	t
3574	Battle-Scarred	7	789	2025-02-20 23:40:42.050611+00	t
3575	Factory New	9.58	791	2025-02-20 23:40:08.390171+00	f
3576	Minimal Wear	3.68	791	2025-02-20 23:40:08.412688+00	f
3577	Field-Tested	1.83	791	2025-02-20 23:40:08.404173+00	f
3578	Well-Worn	1.77	791	2025-02-20 23:40:08.424721+00	f
3579	Battle-Scarred	1.74	791	2025-02-20 23:40:08.385173+00	f
3580	Factory New	24.28	791	2025-02-20 23:40:36.173473+00	t
3581	Minimal Wear	7.19	791	2025-02-20 23:40:36.182621+00	t
3582	Field-Tested	4.1	791	2025-02-20 23:40:36.176473+00	t
3583	Well-Worn	3.82	791	2025-02-20 23:40:36.186621+00	t
3584	Battle-Scarred	3.92	791	2025-02-20 23:40:36.168915+00	t
3585	Factory New	7.73	793	2025-02-20 23:40:18.825704+00	f
3586	Minimal Wear	3.55	793	2025-02-20 23:40:18.837705+00	f
3587	Field-Tested	1.72	793	2025-02-20 23:40:18.833704+00	f
3588	Well-Worn	1.42	793	2025-02-20 23:40:18.841704+00	f
3589	Battle-Scarred	1.28	793	2025-02-20 23:40:18.821705+00	f
3590	Factory New	15.9	793	2025-02-20 23:40:41.369698+00	t
3591	Minimal Wear	6.33	793	2025-02-20 23:40:41.37734+00	t
3592	Field-Tested	2.82	793	2025-02-20 23:40:41.372698+00	t
3593	Well-Worn	2.44	793	2025-02-20 23:40:41.382336+00	t
3594	Battle-Scarred	2.45	793	2025-02-20 23:40:41.364699+00	t
3595	Factory New	7.97	795	2025-02-20 23:40:06.547647+00	f
3596	Minimal Wear	3.3	795	2025-02-20 23:40:06.565649+00	f
3597	Field-Tested	1.7	795	2025-02-20 23:40:06.556647+00	f
3598	Well-Worn	1.33	795	2025-02-20 23:40:06.574648+00	f
3599	Battle-Scarred	1.93	795	2025-02-20 23:40:06.518648+00	f
3600	Factory New	17.25	795	2025-02-20 23:40:35.766752+00	t
3601	Minimal Wear	5.88	795	2025-02-20 23:40:35.774751+00	t
3602	Field-Tested	2.49	795	2025-02-20 23:40:35.770752+00	t
3603	Well-Worn	2.27	795	2025-02-20 23:40:35.779753+00	t
3604	Battle-Scarred	2.24	795	2025-02-20 23:40:35.760669+00	t
3605	Factory New	1.91	797	2025-02-20 23:40:15.527527+00	f
3606	Minimal Wear	0.89	797	2025-02-20 23:40:15.536525+00	f
3607	Field-Tested	0.49	797	2025-02-20 23:40:15.533525+00	f
3608	Well-Worn	1.37	797	2025-02-20 23:40:15.540525+00	f
3609	Battle-Scarred	1.63	797	2025-02-20 23:40:15.522524+00	f
3610	Factory New	8.13	797	2025-02-20 23:40:39.2543+00	t
3611	Minimal Wear	5.12	797	2025-02-20 23:40:39.2623+00	t
3612	Field-Tested	3.12	797	2025-02-20 23:40:39.258299+00	t
3613	Well-Worn	5.02	797	2025-02-20 23:40:39.267299+00	t
3614	Battle-Scarred	5.9	797	2025-02-20 23:40:39.249233+00	t
3615	Factory New	2.07	799	2025-02-20 23:40:53.856225+00	f
3616	Minimal Wear	0.96	799	2025-02-20 23:40:53.867223+00	f
3617	Field-Tested	0.54	799	2025-02-20 23:40:53.860223+00	f
3618	Well-Worn	1.05	799	2025-02-20 23:40:53.873223+00	f
3619	Battle-Scarred	0.5	799	2025-02-20 23:40:53.851225+00	f
3620	Factory New	6.95	799	2025-02-20 23:40:48.887812+00	t
3621	Minimal Wear	3.89	799	2025-02-20 23:40:48.905708+00	t
3622	Field-Tested	2.17	799	2025-02-20 23:40:48.896679+00	t
3623	Well-Worn	2.54	799	2025-02-20 23:40:48.911291+00	t
3624	Battle-Scarred	2.09	799	2025-02-20 23:40:48.876689+00	t
3625	Factory New	1.67	801	2025-02-20 23:40:10.395992+00	f
3626	Minimal Wear	0.68	801	2025-02-20 23:40:10.413401+00	f
3627	Field-Tested	0.31	801	2025-02-20 23:40:10.405991+00	f
3628	Well-Worn	0.28	801	2025-02-20 23:40:10.421401+00	f
3629	Battle-Scarred	0.27	801	2025-02-20 23:40:10.335239+00	f
3630	Factory New	2.93	801	2025-02-20 23:40:36.769449+00	t
3631	Minimal Wear	1	801	2025-02-20 23:40:36.778319+00	t
3632	Field-Tested	0.46	801	2025-02-20 23:40:36.77345+00	t
3633	Well-Worn	0.37	801	2025-02-20 23:40:36.783507+00	t
3634	Battle-Scarred	0.42	801	2025-02-20 23:40:36.76545+00	t
3635	Factory New	1.41	803	2025-02-20 23:40:26.274225+00	f
3636	Minimal Wear	0.71	803	2025-02-20 23:40:26.294226+00	f
3637	Field-Tested	0.32	803	2025-02-20 23:40:26.280228+00	f
3638	Well-Worn	0.42	803	2025-02-20 23:40:26.300112+00	f
3639	Battle-Scarred	0.32	803	2025-02-20 23:40:26.262232+00	f
3640	Factory New	2.75	803	2025-02-20 23:40:45.714566+00	t
3641	Minimal Wear	1.42	803	2025-02-20 23:40:45.727563+00	t
3642	Field-Tested	0.44	803	2025-02-20 23:40:45.722563+00	t
3643	Well-Worn	0.74	803	2025-02-20 23:40:45.736565+00	t
3644	Battle-Scarred	0.39	803	2025-02-20 23:40:45.709531+00	t
3645	Factory New	1.35	805	2025-02-20 23:40:55.164943+00	f
3646	Minimal Wear	0.67	805	2025-02-20 23:40:55.173942+00	f
3647	Field-Tested	0.35	805	2025-02-20 23:40:55.169942+00	f
3648	Well-Worn	0.31	805	2025-02-20 23:40:55.177942+00	f
3649	Battle-Scarred	0.33	805	2025-02-20 23:40:55.157942+00	f
3650	Factory New	2.59	805	2025-02-20 23:40:49.299+00	t
3651	Minimal Wear	1.04	805	2025-02-20 23:40:49.307+00	t
3652	Field-Tested	0.53	805	2025-02-20 23:40:49.303+00	t
3653	Well-Worn	0.57	805	2025-02-20 23:40:49.314002+00	t
3654	Battle-Scarred	0.54	805	2025-02-20 23:40:49.294001+00	t
3655	Factory New	0.44	807	2025-02-20 23:40:09.820122+00	f
3656	Minimal Wear	0.13	807	2025-02-20 23:40:09.831123+00	f
3657	Field-Tested	0.08	807	2025-02-20 23:40:09.824123+00	f
3658	Well-Worn	0.06	807	2025-02-20 23:40:09.835694+00	f
3659	Battle-Scarred	0.07	807	2025-02-20 23:40:09.814125+00	f
3660	Factory New	1.63	807	2025-02-20 23:40:36.610787+00	t
3661	Minimal Wear	0.33	807	2025-02-20 23:40:36.618788+00	t
3662	Field-Tested	0.15	807	2025-02-20 23:40:36.615789+00	t
3663	Well-Worn	0.15	807	2025-02-20 23:40:36.623691+00	t
3664	Battle-Scarred	0.22	807	2025-02-20 23:40:36.607788+00	t
3665	Factory New	0.35	809	2025-02-20 23:40:16.959407+00	f
3666	Minimal Wear	0.12	809	2025-02-20 23:40:16.968921+00	f
3667	Field-Tested	0.06	809	2025-02-20 23:40:16.96492+00	f
3668	Well-Worn	0.07	809	2025-02-20 23:40:16.972921+00	f
3669	Battle-Scarred	0.07	809	2025-02-20 23:40:16.955407+00	f
3670	Factory New	1.27	809	2025-02-20 23:40:40.107485+00	t
3671	Minimal Wear	0.31	809	2025-02-20 23:40:40.122177+00	t
3672	Field-Tested	0.14	809	2025-02-20 23:40:40.11591+00	t
3673	Well-Worn	0.14	809	2025-02-20 23:40:40.127496+00	t
3674	Battle-Scarred	0.16	809	2025-02-20 23:40:40.102066+00	t
3675	Factory New	0.27	811	2025-02-20 23:40:18.675757+00	f
3676	Minimal Wear	0.1	811	2025-02-20 23:40:18.688832+00	f
3677	Field-Tested	0.06	811	2025-02-20 23:40:18.682757+00	f
3678	Well-Worn	0.07	811	2025-02-20 23:40:18.69283+00	f
3679	Battle-Scarred	0.07	811	2025-02-20 23:40:18.671757+00	f
3680	Factory New	1.03	811	2025-02-20 23:40:41.301699+00	t
3681	Minimal Wear	0.25	811	2025-02-20 23:40:41.310711+00	t
3682	Field-Tested	0.12	811	2025-02-20 23:40:41.306698+00	t
3683	Well-Worn	0.14	811	2025-02-20 23:40:41.315698+00	t
3684	Battle-Scarred	0.16	811	2025-02-20 23:40:41.2967+00	t
3685	Factory New	0.24	813	2025-02-20 23:40:22.828815+00	f
3686	Minimal Wear	0.12	813	2025-02-20 23:40:22.839665+00	f
3687	Field-Tested	0.07	813	2025-02-20 23:40:22.835666+00	f
3688	Well-Worn	0.06	813	2025-02-20 23:40:22.845667+00	f
3689	Battle-Scarred	0.06	813	2025-02-20 23:40:22.823814+00	f
3690	Factory New	1.11	813	2025-02-20 23:40:42.966008+00	t
3691	Minimal Wear	0.25	813	2025-02-20 23:40:42.979006+00	t
3692	Field-Tested	0.11	813	2025-02-20 23:40:42.972005+00	t
3693	Well-Worn	0.23	813	2025-02-20 23:40:42.987677+00	t
3694	Battle-Scarred	0.13	813	2025-02-20 23:40:42.958635+00	t
3695	Factory New	0.24	815	2025-02-20 23:40:31.169251+00	f
3696	Minimal Wear	0.1	815	2025-02-20 23:40:31.186123+00	f
3697	Field-Tested	0.06	815	2025-02-20 23:40:31.176123+00	f
3698	Well-Worn	0.06	815	2025-02-20 23:40:31.193266+00	f
3699	Battle-Scarred	0.06	815	2025-02-20 23:40:31.15626+00	f
3700	Factory New	0.73	815	2025-02-20 23:40:47.533844+00	t
3701	Minimal Wear	0.25	815	2025-02-20 23:40:47.544845+00	t
3702	Field-Tested	0.11	815	2025-02-20 23:40:47.538844+00	t
3703	Well-Worn	0.12	815	2025-02-20 23:40:47.549844+00	t
3704	Battle-Scarred	0.15	815	2025-02-20 23:40:47.528845+00	t
3705	Factory New	0.2	817	2025-02-20 23:40:17.882039+00	f
3706	Minimal Wear	0.11	817	2025-02-20 23:40:17.891987+00	f
3707	Field-Tested	0.06	817	2025-02-20 23:40:17.886983+00	f
3708	Well-Worn	0.13	817	2025-02-20 23:40:17.896983+00	f
3709	Battle-Scarred	0.06	817	2025-02-20 23:40:17.876039+00	f
3710	Factory New	0.63	817	2025-02-20 23:40:40.85963+00	t
3711	Minimal Wear	0.25	817	2025-02-20 23:40:40.869629+00	t
3712	Field-Tested	0.11	817	2025-02-20 23:40:40.864628+00	t
3713	Well-Worn	0.26	817	2025-02-20 23:40:40.874628+00	t
3714	Battle-Scarred	0.16	817	2025-02-20 23:40:40.855628+00	t
3715	Factory New	0.2	819	2025-02-20 23:40:27.632569+00	f
3716	Minimal Wear	0.11	819	2025-02-20 23:40:27.642569+00	f
3717	Field-Tested	0.06	819	2025-02-20 23:40:27.637569+00	f
3718	Well-Worn	0.07	819	2025-02-20 23:40:27.650569+00	f
3719	Battle-Scarred	0.06	819	2025-02-20 23:40:27.628584+00	f
3720	Factory New	0.65	819	2025-02-20 23:40:46.356822+00	t
3721	Minimal Wear	0.28	819	2025-02-20 23:40:46.366821+00	t
3722	Field-Tested	0.13	819	2025-02-20 23:40:46.36082+00	t
3723	Well-Worn	0.13	819	2025-02-20 23:40:46.37082+00	t
3724	Battle-Scarred	0.16	819	2025-02-20 23:40:46.352821+00	t
3725	Minimal Wear	47.61	821	2025-02-20 23:40:24.540036+00	f
3726	Field-Tested	32.34	821	2025-02-20 23:40:24.535945+00	f
3727	Minimal Wear	239.49	821	2025-02-20 23:40:44.324685+00	t
3728	Field-Tested	113.5	821	2025-02-20 23:40:44.313677+00	t
3729	Factory New	381.87	823	2025-02-20 23:40:02.681121+00	f
3730	Minimal Wear	144.56	823	2025-02-20 23:40:02.698636+00	f
3731	Field-Tested	134.35	823	2025-02-20 23:40:02.686633+00	f
3732	Factory New	723.2	823	2025-02-20 23:40:33.816542+00	t
3733	Minimal Wear	240.1	823	2025-02-20 23:40:33.826386+00	t
3734	Field-Tested	188.61	823	2025-02-20 23:40:33.821399+00	t
3735	Factory New	358.27	825	2025-02-20 23:40:01.062293+00	f
3736	Minimal Wear	116.99	825	2025-02-20 23:40:01.075292+00	f
3737	Field-Tested	60.54	825	2025-02-20 23:40:01.071293+00	f
3738	Well-Worn	57.15	825	2025-02-20 23:40:01.084294+00	f
3739	Battle-Scarred	79.65	825	2025-02-20 23:40:01.056293+00	f
3740	Factory New	\N	825	\N	t
3741	Minimal Wear	285.32	825	2025-02-20 23:40:32.625076+00	t
3742	Field-Tested	140.69	825	2025-02-20 23:40:32.60919+00	t
3743	Well-Worn	157.35	825	2025-02-20 23:40:32.630076+00	t
3744	Battle-Scarred	146.12	825	2025-02-20 23:40:32.59694+00	t
3745	Factory New	\N	827	\N	f
3746	Minimal Wear	26.6	827	2025-02-20 23:40:30.849073+00	f
3747	Field-Tested	15.45	827	2025-02-20 23:40:30.820327+00	f
3748	Well-Worn	30.18	827	2025-02-20 23:40:30.874911+00	f
3749	Battle-Scarred	17.26	827	2025-02-20 23:40:30.811029+00	f
3750	Factory New	\N	827	\N	t
3751	Minimal Wear	36.11	827	2025-02-20 23:40:47.481844+00	t
3752	Field-Tested	23.73	827	2025-02-20 23:40:47.476844+00	t
3753	Well-Worn	27.93	827	2025-02-20 23:40:47.486843+00	t
3754	Battle-Scarred	33.57	827	2025-02-20 23:40:47.470843+00	t
3755	Factory New	41.24	829	2025-02-20 23:40:11.754152+00	f
3756	Minimal Wear	21.22	829	2025-02-20 23:40:11.771152+00	f
3757	Field-Tested	18.05	829	2025-02-20 23:40:11.760154+00	f
3758	Well-Worn	26.45	829	2025-02-20 23:40:11.780153+00	f
3759	Battle-Scarred	18.46	829	2025-02-20 23:40:11.742152+00	f
3760	Factory New	198.66	829	2025-02-20 23:40:37.217745+00	t
3761	Minimal Wear	32.38	829	2025-02-20 23:40:37.228745+00	t
3762	Field-Tested	29.17	829	2025-02-20 23:40:37.222743+00	t
3763	Well-Worn	28.04	829	2025-02-20 23:40:37.233943+00	t
3764	Battle-Scarred	25.32	829	2025-02-20 23:40:37.213743+00	t
3765	Factory New	39.98	831	2025-02-20 23:40:24.11694+00	f
3766	Minimal Wear	25.94	831	2025-02-20 23:40:24.124939+00	f
3767	Field-Tested	26.41	831	2025-02-20 23:40:24.12094+00	f
3768	Factory New	79.73	831	2025-02-20 23:40:43.808706+00	t
3769	Minimal Wear	34.49	831	2025-02-20 23:40:43.819826+00	t
3770	Field-Tested	\N	831	\N	t
3771	Factory New	21.89	833	2025-02-15 23:05:30.817355+00	f
3772	Minimal Wear	5.77	833	2025-02-20 23:40:16.007799+00	f
3773	Field-Tested	5.68	833	2025-02-20 23:40:16.003798+00	f
3774	Well-Worn	6.15	833	2025-02-20 23:40:16.013799+00	f
3775	Battle-Scarred	5.67	833	2025-02-20 23:40:15.999798+00	f
3776	Factory New	118.27	833	2025-02-20 23:40:39.538211+00	t
3777	Minimal Wear	8	833	2025-02-20 23:40:39.547212+00	t
3778	Field-Tested	4.56	833	2025-02-20 23:40:39.542212+00	t
3779	Well-Worn	6.2	833	2025-02-20 23:40:39.551211+00	t
3780	Battle-Scarred	5.35	833	2025-02-20 23:40:39.531211+00	t
3781	Factory New	5.62	835	2025-02-20 23:40:18.040785+00	f
3782	Minimal Wear	5.23	835	2025-02-20 23:40:18.051299+00	f
3783	Field-Tested	5.49	835	2025-02-20 23:40:18.047299+00	f
3784	Factory New	6.42	835	2025-02-20 23:40:40.985495+00	t
3785	Minimal Wear	7.5	835	2025-02-20 23:40:40.995496+00	t
3786	Field-Tested	5.93	835	2025-02-20 23:40:40.990494+00	t
3787	Minimal Wear	4.85	837	2025-02-20 23:40:07.617382+00	f
3788	Field-Tested	5.09	837	2025-02-20 23:40:07.606677+00	f
3789	Minimal Wear	6.97	837	2025-02-20 23:40:36.02917+00	t
3790	Field-Tested	6.12	837	2025-02-20 23:40:36.024168+00	t
3791	Factory New	30.5	839	2025-02-20 23:40:16.613726+00	f
3792	Minimal Wear	19.56	839	2025-02-20 23:40:16.621725+00	f
3793	Field-Tested	16.36	839	2025-02-20 23:40:16.616725+00	f
3794	Factory New	112.32	839	2025-02-20 23:40:39.850643+00	t
3795	Minimal Wear	54.84	839	2025-02-20 23:40:39.857644+00	t
3796	Field-Tested	60.52	839	2025-02-20 23:40:39.854644+00	t
3797	Factory New	87.51	841	2025-02-20 23:40:04.794512+00	f
3798	Minimal Wear	72.15	841	2025-02-20 23:40:04.805192+00	f
3799	Field-Tested	80.95	841	2025-02-20 23:40:04.798193+00	f
3800	Factory New	169.11	841	2025-02-20 23:40:35.139705+00	t
3801	Minimal Wear	149.89	841	2025-02-20 23:40:35.148705+00	t
3802	Field-Tested	155.46	841	2025-02-20 23:40:35.143706+00	t
3803	Factory New	50.95	843	2025-02-20 23:40:03.331151+00	f
3804	Minimal Wear	36.69	843	2025-02-20 23:40:03.344665+00	f
3805	Field-Tested	34.16	843	2025-02-20 23:40:03.337665+00	f
3806	Well-Worn	49.9	843	2025-02-20 23:40:03.350664+00	f
3807	Factory New	110.74	843	2025-02-20 23:40:34.058472+00	t
3808	Minimal Wear	88	843	2025-02-20 23:40:34.070194+00	t
3809	Field-Tested	87.92	843	2025-02-20 23:40:34.066207+00	t
3810	Well-Worn	116.8	843	2025-02-20 23:40:34.074194+00	t
3811	Factory New	53.95	845	2025-02-20 23:40:07.20202+00	f
3812	Minimal Wear	31.71	845	2025-02-20 23:40:07.212021+00	f
3813	Field-Tested	25.42	845	2025-02-20 23:40:07.208022+00	f
3814	Well-Worn	29.08	845	2025-02-20 23:40:07.216021+00	f
3815	Factory New	48.04	845	2025-02-20 23:40:35.922292+00	t
3816	Minimal Wear	36.52	845	2025-02-20 23:40:35.931292+00	t
3817	Field-Tested	27.18	845	2025-02-20 23:40:35.926291+00	t
3818	Well-Worn	\N	845	\N	t
3819	Factory New	16.96	847	2025-02-20 23:39:59.794258+00	f
3820	Minimal Wear	14.22	847	2025-02-20 23:39:59.817242+00	f
3821	Field-Tested	13.21	847	2025-02-20 23:39:59.806242+00	f
3822	Well-Worn	17.57	847	2025-02-20 23:39:59.821243+00	f
3823	Factory New	56.91	847	2025-02-20 23:40:31.485638+00	t
3824	Minimal Wear	38.3	847	2025-02-20 23:40:31.504848+00	t
3825	Field-Tested	29.54	847	2025-02-20 23:40:31.493687+00	t
3826	Well-Worn	55.19	847	2025-02-20 23:40:31.51185+00	t
3827	Factory New	10.08	849	2025-02-20 23:40:24.435388+00	f
3828	Minimal Wear	8.5	849	2025-02-20 23:40:24.444388+00	f
3829	Field-Tested	83.16	849	2025-02-20 23:40:24.439388+00	f
3830	Well-Worn	10.08	849	2025-02-20 23:40:24.448387+00	f
3831	Battle-Scarred	11.58	849	2025-02-20 23:40:24.431388+00	f
3832	Factory New	18.48	849	2025-02-20 23:40:44.153537+00	t
3833	Minimal Wear	17.31	849	2025-02-20 23:40:44.169536+00	t
3834	Field-Tested	13.75	849	2025-02-20 23:40:44.157537+00	t
3835	Well-Worn	26.05	849	2025-02-20 23:40:44.173536+00	t
3836	Battle-Scarred	15.49	849	2025-02-20 23:40:44.141544+00	t
3837	Factory New	2.37	851	2025-02-20 23:40:09.671333+00	f
3838	Minimal Wear	1.92	851	2025-02-20 23:40:09.696396+00	f
3839	Field-Tested	1.92	851	2025-02-20 23:40:09.685335+00	f
3840	Well-Worn	7.37	851	2025-02-20 23:40:09.70502+00	f
3841	Battle-Scarred	4.43	851	2025-02-20 23:40:09.659335+00	f
3842	Factory New	7.48	851	2025-02-20 23:40:36.568179+00	t
3843	Minimal Wear	6.71	851	2025-02-20 23:40:36.574982+00	t
3844	Field-Tested	7.19	851	2025-02-20 23:40:36.571179+00	t
3845	Well-Worn	29.27	851	2025-02-20 23:40:36.58007+00	t
3846	Battle-Scarred	6.81	851	2025-02-15 18:39:33.782016+00	t
3847	Factory New	3.72	853	2025-02-20 23:40:11.200416+00	f
3848	Factory New	13.54	853	2025-02-20 23:40:37.045532+00	t
3849	Factory New	2.8	855	2025-02-20 23:40:10.07859+00	f
3850	Minimal Wear	2.82	855	2025-02-20 23:40:10.092587+00	f
3851	Field-Tested	2.35	855	2025-02-20 23:40:10.086589+00	f
3852	Factory New	9.17	855	2025-02-20 23:40:36.700276+00	t
3853	Minimal Wear	9.36	855	2025-02-20 23:40:36.708277+00	t
3854	Field-Tested	8.14	855	2025-02-20 23:40:36.704277+00	t
3855	Factory New	2.36	857	2025-02-20 23:40:21.803886+00	f
3856	Minimal Wear	1.62	857	2025-02-20 23:40:21.812886+00	f
3857	Field-Tested	1.47	857	2025-02-20 23:40:21.807885+00	f
3858	Well-Worn	19.54	857	2025-02-20 23:40:21.816885+00	f
3859	Factory New	6.65	857	2025-02-20 23:40:42.51676+00	t
3860	Minimal Wear	7.4	857	2025-02-20 23:40:42.525761+00	t
3861	Field-Tested	7.19	857	2025-02-20 23:40:42.520761+00	t
3862	Well-Worn	\N	857	\N	t
3863	Factory New	2.09	859	2025-02-20 23:40:26.370382+00	f
3864	Minimal Wear	3.68	859	2025-02-20 23:40:26.388383+00	f
3865	Field-Tested	1.72	859	2025-02-20 23:40:26.382383+00	f
3866	Well-Worn	15.97	859	2025-02-20 23:40:26.399382+00	f
3867	Battle-Scarred	8.97	859	2025-02-20 23:40:26.365381+00	f
3868	Factory New	6.95	859	2025-02-20 23:40:45.741564+00	t
3869	Minimal Wear	6.65	859	2025-02-20 23:40:45.755564+00	t
3870	Field-Tested	9.72	859	2025-02-20 23:40:45.747563+00	t
3871	Well-Worn	23.63	859	2025-02-20 23:40:45.762564+00	t
3872	Battle-Scarred	\N	859	\N	t
3873	Factory New	2.94	861	2025-02-20 23:40:24.130627+00	f
3874	Minimal Wear	3.07	861	2025-02-20 23:40:24.134627+00	f
3875	Field-Tested	11.02	861	2025-02-15 23:05:34.47034+00	f
3876	Factory New	8.52	861	2025-02-20 23:40:43.823828+00	t
3877	Minimal Wear	8.45	861	2025-02-20 23:40:43.840827+00	t
3878	Field-Tested	8.81	861	2025-02-20 23:40:43.835827+00	t
3879	Factory New	221.46	863	2025-02-20 23:40:00.454553+00	f
3880	Minimal Wear	132.83	863	2025-02-20 23:40:00.466553+00	f
3881	Field-Tested	91.06	863	2025-02-20 23:40:00.461554+00	f
3882	Well-Worn	81.06	863	2025-02-20 23:40:00.470554+00	f
3883	Battle-Scarred	70.52	863	2025-02-20 23:40:00.449553+00	f
3884	Factory New	372.69	863	2025-02-20 23:40:32.059546+00	t
3885	Minimal Wear	292.35	863	2025-02-20 23:40:32.117957+00	t
3886	Field-Tested	172.64	863	2025-02-20 23:40:32.091336+00	t
3887	Well-Worn	117.9	863	2025-02-20 23:40:32.136102+00	t
3888	Battle-Scarred	114.83	863	2025-02-20 23:40:32.055547+00	t
3889	Factory New	93.94	865	2025-02-20 23:40:15.742342+00	f
3890	Minimal Wear	30.58	865	2025-02-20 23:40:15.752343+00	f
3891	Field-Tested	18.48	865	2025-02-20 23:40:15.748343+00	f
3892	Well-Worn	23.3	865	2025-02-20 23:40:15.757343+00	f
3893	Battle-Scarred	71.58	865	2025-02-15 23:05:30.663074+00	f
3894	Factory New	192.05	865	2025-02-20 23:40:39.369775+00	t
3895	Minimal Wear	71.91	865	2025-02-20 23:40:39.379245+00	t
3896	Field-Tested	67.17	865	2025-02-20 23:40:39.373804+00	t
3897	Well-Worn	124.36	865	2025-02-20 23:40:39.383243+00	t
3898	Battle-Scarred	\N	865	\N	t
3899	Factory New	63.16	867	2025-02-20 23:40:21.6645+00	f
3900	Minimal Wear	19.14	867	2025-02-20 23:40:21.672499+00	f
3901	Field-Tested	8.59	867	2025-02-20 23:40:21.6685+00	f
3902	Well-Worn	11.06	867	2025-02-20 23:40:21.6765+00	f
3903	Battle-Scarred	9.27	867	2025-02-20 23:40:21.6585+00	f
3904	Factory New	326.12	867	2025-02-20 23:40:42.407017+00	t
3905	Minimal Wear	50.96	867	2025-02-20 23:40:42.417016+00	t
3906	Field-Tested	16.87	867	2025-02-20 23:40:42.412017+00	t
3907	Well-Worn	54.1	867	2025-02-20 23:40:42.421016+00	t
3908	Battle-Scarred	20.71	867	2025-02-20 23:40:42.403015+00	t
3909	Factory New	46.13	869	2025-02-20 23:40:03.0218+00	f
3910	Minimal Wear	17.86	869	2025-02-20 23:40:03.046113+00	f
3911	Field-Tested	17.82	869	2025-02-20 23:40:03.036113+00	f
3912	Factory New	102.55	869	2025-02-20 23:40:33.990683+00	t
3913	Minimal Wear	41.55	869	2025-02-20 23:40:34.007064+00	t
3914	Field-Tested	38.1	869	2025-02-20 23:40:33.999682+00	t
3915	Factory New	34.03	871	2025-02-20 23:40:01.508347+00	f
3916	Minimal Wear	12.03	871	2025-02-20 23:40:01.517348+00	f
3917	Field-Tested	8.04	871	2025-02-20 23:40:01.513347+00	f
3918	Well-Worn	9.89	871	2025-02-20 23:40:01.522348+00	f
3919	Battle-Scarred	11.24	871	2025-02-20 23:40:01.503347+00	f
3920	Factory New	115.31	871	2025-02-20 23:40:33.257807+00	t
3921	Minimal Wear	22.33	871	2025-02-20 23:40:33.277356+00	t
3922	Field-Tested	16.27	871	2025-02-20 23:40:33.268255+00	t
3923	Well-Worn	20.51	871	2025-02-20 23:40:33.286128+00	t
3924	Battle-Scarred	16.97	871	2025-02-20 23:40:33.250289+00	t
3925	Factory New	24.34	873	2025-02-20 23:40:22.522532+00	f
3926	Minimal Wear	11.78	873	2025-02-20 23:40:22.539524+00	f
3927	Field-Tested	8.85	873	2025-02-20 23:40:22.526524+00	f
3928	Factory New	\N	873	\N	t
3929	Minimal Wear	32.24	873	2025-02-20 23:40:42.792349+00	t
3930	Field-Tested	16.52	873	2025-02-20 23:40:42.788349+00	t
3931	Factory New	125.82	875	2025-02-20 23:40:04.868191+00	f
3932	Minimal Wear	36.12	875	2025-02-20 23:40:04.884192+00	f
3933	Field-Tested	13.14	875	2025-02-20 23:40:04.872198+00	f
3934	Well-Worn	13.31	875	2025-02-20 23:40:04.897193+00	f
3935	Battle-Scarred	16.79	875	2025-02-20 23:40:04.864192+00	f
3936	Factory New	329.7	875	2025-02-20 23:40:35.214334+00	t
3937	Minimal Wear	91.72	875	2025-02-20 23:40:35.222469+00	t
3938	Field-Tested	21.86	875	2025-02-20 23:40:35.218333+00	t
3939	Well-Worn	28.43	875	2025-02-20 23:40:35.228471+00	t
3940	Battle-Scarred	25.72	875	2025-02-20 23:40:35.208334+00	t
3941	Factory New	5.85	877	2025-02-20 23:40:25.375395+00	f
3942	Minimal Wear	4.7	877	2025-02-20 23:40:25.386396+00	f
3943	Field-Tested	2.73	877	2025-02-20 23:40:25.381396+00	f
3944	Well-Worn	3.04	877	2025-02-20 23:40:25.390396+00	f
3945	Battle-Scarred	2.69	877	2025-02-20 23:40:25.369395+00	f
3946	Factory New	27.93	877	2025-02-20 23:40:45.168071+00	t
3947	Minimal Wear	7.03	877	2025-02-20 23:40:45.182071+00	t
3948	Field-Tested	5.15	877	2025-02-20 23:40:45.177071+00	t
3949	Well-Worn	6.95	877	2025-02-20 23:40:45.196071+00	t
3950	Battle-Scarred	6.18	877	2025-02-15 23:05:42.569692+00	t
3951	Factory New	4.89	879	2025-02-20 23:40:19.355635+00	f
3952	Minimal Wear	4.13	879	2025-02-20 23:40:19.359636+00	f
3953	Factory New	16.83	879	2025-02-20 23:40:41.617759+00	t
3954	Minimal Wear	20.45	879	2025-02-20 23:40:41.621759+00	t
3955	Factory New	4.68	881	2025-02-20 23:40:13.371729+00	f
3956	Minimal Wear	4.39	881	2025-02-20 23:40:13.38273+00	f
3957	Field-Tested	5.82	881	2025-02-20 23:40:13.37773+00	f
3958	Factory New	14.35	881	2025-02-20 23:40:38.021067+00	t
3959	Minimal Wear	13.66	881	2025-02-20 23:40:38.034908+00	t
3960	Field-Tested	14.72	881	2025-02-15 18:38:30.322084+00	t
3961	Factory New	5.32	883	2025-02-20 23:40:25.26924+00	f
3962	Minimal Wear	3.8	883	2025-02-20 23:40:25.278243+00	f
3963	Field-Tested	2.53	883	2025-02-20 23:40:25.27224+00	f
3964	Well-Worn	15.67	883	2025-02-20 23:40:25.282761+00	f
3965	Battle-Scarred	2.67	883	2025-02-20 23:40:25.265241+00	f
3966	Factory New	40.19	883	2025-02-20 23:40:45.087441+00	t
3967	Minimal Wear	5.69	883	2025-02-20 23:40:45.103438+00	t
3968	Field-Tested	4.13	883	2025-02-20 23:40:45.099444+00	t
3969	Well-Worn	5.19	883	2025-02-20 23:40:45.119136+00	t
3970	Battle-Scarred	3.98	883	2025-02-15 23:05:42.553898+00	t
3971	Factory New	51.07	885	2025-02-20 23:40:17.62564+00	f
3972	Minimal Wear	4.28	885	2025-02-20 23:40:17.63564+00	f
3973	Field-Tested	4.54	885	2025-02-20 23:40:17.63164+00	f
3974	Well-Worn	4.75	885	2025-02-15 23:05:31.634242+00	f
3975	Battle-Scarred	4.15	885	2025-02-20 23:40:17.62064+00	f
3976	Factory New	99.79	885	2025-02-20 23:40:40.634287+00	t
3977	Minimal Wear	7.17	885	2025-02-20 23:40:40.652311+00	t
3978	Field-Tested	2.6	885	2025-02-20 23:40:40.642311+00	t
3979	Well-Worn	2.86	885	2025-02-20 23:40:40.659312+00	t
3980	Battle-Scarred	2.66	885	2025-02-20 23:40:40.620286+00	t
3981	Factory New	10.79	887	2025-02-20 23:40:21.214378+00	f
3982	Minimal Wear	3.12	887	2025-02-20 23:40:21.221377+00	f
3983	Field-Tested	2.24	887	2025-02-20 23:40:21.218377+00	f
3984	Well-Worn	1.93	887	2025-02-20 23:40:21.226377+00	f
3985	Battle-Scarred	2.07	887	2025-02-20 23:40:21.210377+00	f
3986	Factory New	33.59	887	2025-02-15 18:35:03.995286+00	t
3987	Minimal Wear	5.62	887	2025-02-20 23:40:42.081613+00	t
3988	Field-Tested	2.83	887	2025-02-20 23:40:42.076611+00	t
3989	Well-Worn	3.7	887	2025-02-20 23:40:42.086611+00	t
3990	Battle-Scarred	2.37	887	2025-02-20 23:40:42.072612+00	t
3991	Factory New	7.18	889	2025-02-20 23:40:52.518185+00	f
3992	Minimal Wear	5.32	889	2025-02-20 23:40:52.527185+00	f
3993	Field-Tested	4.18	889	2025-02-20 23:40:52.522184+00	f
3994	Factory New	14.8	889	2025-02-20 23:40:48.479155+00	t
3995	Minimal Wear	6.25	889	2025-02-20 23:40:48.487152+00	t
3996	Field-Tested	6.02	889	2025-02-20 23:40:48.483153+00	t
3997	Factory New	6.93	891	2025-02-20 23:40:04.214627+00	f
3998	Minimal Wear	2.82	891	2025-02-20 23:40:04.223627+00	f
3999	Field-Tested	2.47	891	2025-02-20 23:40:04.219626+00	f
4000	Well-Worn	25.27	891	2025-02-20 23:40:04.229628+00	f
4001	Factory New	9.58	891	2025-02-20 23:40:34.652822+00	t
4002	Minimal Wear	3.97	891	2025-02-20 23:40:34.662485+00	t
4003	Field-Tested	2.46	891	2025-02-20 23:40:34.656332+00	t
4004	Well-Worn	19.82	891	2025-02-20 23:40:34.666483+00	t
4005	Minimal Wear	3.56	893	2025-02-20 23:40:29.014908+00	f
4006	Field-Tested	2.8	893	2025-02-20 23:40:29.008908+00	f
4007	Minimal Wear	5.3	893	2025-02-20 23:40:46.988958+00	t
4008	Field-Tested	4.11	893	2025-02-20 23:40:46.984959+00	t
4009	Minimal Wear	2.66	895	2025-02-20 23:40:54.805425+00	f
4010	Field-Tested	2.22	895	2025-02-20 23:40:54.782646+00	f
4011	Well-Worn	3.27	895	2025-02-20 23:40:54.815891+00	f
4012	Battle-Scarred	3.03	895	2025-02-20 23:40:54.773648+00	f
4013	Minimal Wear	4.94	895	2025-02-20 23:40:49.122061+00	t
4014	Field-Tested	2.99	895	2025-02-20 23:40:49.119061+00	t
4015	Well-Worn	3.15	895	2025-02-20 23:40:49.127062+00	t
4016	Battle-Scarred	9.33	895	2025-02-20 23:40:49.115061+00	t
4017	Factory New	135.58	897	2025-02-20 23:39:59.669543+00	f
4018	Minimal Wear	74.49	897	2025-02-20 23:39:59.676543+00	f
4019	Field-Tested	38.23	897	2025-02-20 23:39:59.673546+00	f
4020	Well-Worn	29.29	897	2025-02-20 23:39:59.679544+00	f
4021	Battle-Scarred	30.37	897	2025-02-20 23:39:59.664544+00	f
4022	Factory New	259.75	897	2025-02-20 23:40:31.370702+00	t
4023	Minimal Wear	152.55	897	2025-02-20 23:40:31.386092+00	t
4024	Field-Tested	93.92	897	2025-02-20 23:40:31.376558+00	t
4025	Well-Worn	84.06	897	2025-02-20 23:40:31.395194+00	t
4026	Battle-Scarred	67.71	897	2025-02-20 23:40:31.365592+00	t
4027	Factory New	91.16	899	2025-02-20 23:40:03.503793+00	f
4028	Minimal Wear	49.13	899	2025-02-20 23:40:03.530628+00	f
4029	Field-Tested	29.87	899	2025-02-20 23:40:03.517304+00	f
4030	Well-Worn	25.22	899	2025-02-20 23:40:03.554245+00	f
4031	Battle-Scarred	25.93	899	2025-02-20 23:40:03.495792+00	f
4032	Factory New	246.81	899	2025-02-20 23:40:34.188334+00	t
4033	Minimal Wear	184.8	899	2025-02-20 23:40:34.205137+00	t
4034	Field-Tested	69.15	899	2025-02-20 23:40:34.196851+00	t
4035	Well-Worn	83.34	899	2025-02-20 23:40:34.217136+00	t
4036	Battle-Scarred	73.6	899	2025-02-20 23:40:34.180332+00	t
4037	Factory New	17.55	901	2025-02-20 23:40:28.383238+00	f
4038	Minimal Wear	7.88	901	2025-02-20 23:40:28.39124+00	f
4039	Field-Tested	4.97	901	2025-02-20 23:40:28.387238+00	f
4040	Well-Worn	4.88	901	2025-02-20 23:40:28.39524+00	f
4041	Battle-Scarred	5.25	901	2025-02-20 23:40:28.378239+00	f
4042	Factory New	60.52	901	2025-02-20 23:40:46.560233+00	t
4043	Minimal Wear	23.2	901	2025-02-20 23:40:46.570234+00	t
4044	Field-Tested	9.57	901	2025-02-20 23:40:46.566233+00	t
4045	Well-Worn	9	901	2025-02-20 23:40:46.575234+00	t
4046	Battle-Scarred	8.35	901	2025-02-20 23:40:46.557234+00	t
4047	Factory New	14.97	903	2025-02-20 23:40:04.689658+00	f
4048	Minimal Wear	9.65	903	2025-02-20 23:40:04.697658+00	f
4049	Field-Tested	4.97	903	2025-02-20 23:40:04.692658+00	f
4050	Well-Worn	5.03	903	2025-02-20 23:40:04.701658+00	f
4051	Battle-Scarred	4.75	903	2025-02-20 23:40:04.68566+00	f
4052	Factory New	31.05	903	2025-02-20 23:40:35.051262+00	t
4053	Minimal Wear	16.85	903	2025-02-20 23:40:35.060335+00	t
4054	Field-Tested	10.95	903	2025-02-20 23:40:35.056158+00	t
4055	Well-Worn	10.14	903	2025-02-20 23:40:35.066335+00	t
4056	Battle-Scarred	11.02	903	2025-02-20 23:40:35.048262+00	t
4057	Factory New	12.85	905	2025-02-20 23:40:19.321636+00	f
4058	Minimal Wear	8.85	905	2025-02-20 23:40:19.330635+00	f
4059	Field-Tested	8.28	905	2025-02-20 23:40:19.325636+00	f
4060	Factory New	34	905	2025-02-20 23:40:41.58176+00	t
4061	Minimal Wear	17.02	905	2025-02-20 23:40:41.589759+00	t
4062	Field-Tested	11.83	905	2025-02-20 23:40:41.585759+00	t
4063	Minimal Wear	6.91	907	2025-02-20 23:40:21.371834+00	f
4064	Field-Tested	0.69	907	2025-02-20 23:40:21.367835+00	f
4065	Well-Worn	0.71	907	2025-02-20 23:40:21.374835+00	f
4066	Battle-Scarred	0.7	907	2025-02-20 23:40:21.363834+00	f
4067	Minimal Wear	36.8	907	2025-02-20 23:40:42.218099+00	t
4068	Field-Tested	1.65	907	2025-02-20 23:40:42.212104+00	t
4069	Well-Worn	2.57	907	2025-02-15 23:05:41.595663+00	t
4070	Battle-Scarred	1.63	907	2025-02-20 23:40:42.205695+00	t
4071	Factory New	5.12	909	2025-02-20 23:40:15.958799+00	f
4072	Minimal Wear	3.15	909	2025-02-20 23:40:15.968799+00	f
4073	Field-Tested	2.44	909	2025-02-20 23:40:15.964798+00	f
4074	Well-Worn	4.29	909	2025-02-20 23:40:15.972798+00	f
4075	Battle-Scarred	2.94	909	2025-02-20 23:40:15.954798+00	f
4076	Factory New	19.52	909	2025-02-20 23:40:39.510212+00	t
4077	Minimal Wear	8.69	909	2025-02-20 23:40:39.522211+00	t
4078	Field-Tested	6.19	909	2025-02-20 23:40:39.518212+00	t
4079	Well-Worn	7.86	909	2025-02-20 23:40:39.527212+00	t
4080	Battle-Scarred	6.9	909	2025-02-20 23:40:39.505211+00	t
4081	Factory New	5.36	911	2025-02-20 23:40:22.712282+00	f
4082	Minimal Wear	1.75	911	2025-02-20 23:40:22.730041+00	f
4083	Field-Tested	0.93	911	2025-02-20 23:40:22.720281+00	f
4084	Well-Worn	0.91	911	2025-02-20 23:40:22.743417+00	f
4085	Battle-Scarred	0.77	911	2025-02-20 23:40:22.69728+00	f
4086	Factory New	17.47	911	2025-02-20 23:40:42.850349+00	t
4087	Minimal Wear	4.4	911	2025-02-20 23:40:42.858349+00	t
4088	Field-Tested	2.19	911	2025-02-20 23:40:42.85435+00	t
4089	Well-Worn	1.55	911	2025-02-20 23:40:42.863352+00	t
4090	Battle-Scarred	1.53	911	2025-02-20 23:40:42.845352+00	t
4091	Factory New	2.96	913	2025-02-20 23:40:20.77126+00	f
4092	Minimal Wear	1.99	913	2025-02-20 23:40:20.794538+00	f
4093	Field-Tested	1.38	913	2025-02-20 23:40:20.789495+00	f
4094	Well-Worn	2	913	2025-02-20 23:40:20.807536+00	f
4095	Battle-Scarred	1.82	913	2025-02-20 23:40:20.765018+00	f
4096	Factory New	8.86	913	2025-02-20 23:40:42.016099+00	t
4097	Minimal Wear	5.7	913	2025-02-20 23:40:42.024099+00	t
4098	Field-Tested	5.34	913	2025-02-20 23:40:42.0201+00	t
4099	Well-Worn	5.82	913	2025-02-20 23:40:42.029101+00	t
4100	Battle-Scarred	5.86	913	2025-02-20 23:40:42.011099+00	t
4101	Factory New	2.23	915	2025-02-20 23:40:08.204815+00	f
4102	Minimal Wear	1.97	915	2025-02-20 23:40:08.217813+00	f
4103	Field-Tested	1.44	915	2025-02-20 23:40:08.210813+00	f
4104	Well-Worn	1.54	915	2025-02-20 23:40:08.222813+00	f
4105	Battle-Scarred	1.1	915	2025-02-20 23:40:08.199813+00	f
4106	Factory New	7.83	915	2025-02-20 23:40:36.135727+00	t
4107	Minimal Wear	4.06	915	2025-02-20 23:40:36.143799+00	t
4108	Field-Tested	2.58	915	2025-02-20 23:40:36.139799+00	t
4109	Well-Worn	3.8	915	2025-02-20 23:40:36.149798+00	t
4110	Battle-Scarred	2.6	915	2025-02-20 23:40:36.132735+00	t
4111	Factory New	7.92	917	2025-02-20 23:40:11.906925+00	f
4112	Minimal Wear	2.82	917	2025-02-20 23:40:11.924938+00	f
4113	Field-Tested	1.34	917	2025-02-20 23:40:11.916316+00	f
4114	Well-Worn	1.04	917	2025-02-20 23:40:11.93585+00	f
4115	Battle-Scarred	0.72	917	2025-02-20 23:40:11.896454+00	f
4116	Factory New	20.05	917	2025-02-20 23:40:37.240943+00	t
4117	Minimal Wear	5.42	917	2025-02-20 23:40:37.250944+00	t
4118	Field-Tested	2.36	917	2025-02-20 23:40:37.246943+00	t
4119	Well-Worn	1.56	917	2025-02-20 23:40:37.255259+00	t
4120	Battle-Scarred	1.39	917	2025-02-20 23:40:37.237943+00	t
4121	Factory New	2	919	2025-02-20 23:40:53.885405+00	f
4122	Minimal Wear	1.58	919	2025-02-20 23:40:53.894405+00	f
4123	Field-Tested	1.08	919	2025-02-20 23:40:53.889405+00	f
4124	Well-Worn	1.54	919	2025-02-20 23:40:53.904407+00	f
4125	Battle-Scarred	1.86	919	2025-02-20 23:40:53.879225+00	f
4126	Factory New	5.55	919	2025-02-20 23:40:48.925659+00	t
4127	Minimal Wear	5.19	919	2025-02-20 23:40:48.941867+00	t
4128	Field-Tested	2.95	919	2025-02-20 23:40:48.932977+00	t
4129	Well-Worn	4.35	919	2025-02-20 23:40:48.958469+00	t
4130	Battle-Scarred	4.83	919	2025-02-20 23:40:48.91954+00	t
4131	Factory New	2.16	921	2025-02-20 23:40:12.352996+00	f
4132	Minimal Wear	0.72	921	2025-02-20 23:40:12.363996+00	f
4133	Field-Tested	0.65	921	2025-02-20 23:40:12.356995+00	f
4134	Well-Worn	0.75	921	2025-02-20 23:40:12.367996+00	f
4135	Battle-Scarred	0.67	921	2025-02-20 23:40:12.344257+00	f
4136	Factory New	7.85	921	2025-02-20 23:40:37.4529+00	t
4137	Minimal Wear	2.79	921	2025-02-20 23:40:37.46211+00	t
4138	Field-Tested	1.45	921	2025-02-20 23:40:37.458109+00	t
4139	Well-Worn	3.24	921	2025-02-20 23:40:37.467108+00	t
4140	Battle-Scarred	1.47	921	2025-02-20 23:40:37.4489+00	t
4141	Factory New	0.97	923	2025-02-20 23:40:24.60272+00	f
4142	Minimal Wear	0.39	923	2025-02-20 23:40:24.612711+00	f
4143	Field-Tested	0.49	923	2025-02-20 23:40:24.60871+00	f
4144	Well-Worn	0.3	923	2025-02-20 23:40:24.617711+00	f
4145	Battle-Scarred	0.36	923	2025-02-20 23:40:24.598243+00	f
4146	Factory New	5.65	923	2025-02-20 23:40:44.429504+00	t
4147	Minimal Wear	1.09	923	2025-02-20 23:40:44.467506+00	t
4148	Field-Tested	0.43	923	2025-02-20 23:40:44.439508+00	t
4149	Well-Worn	0.32	923	2025-02-20 23:40:44.476506+00	t
4150	Battle-Scarred	0.38	923	2025-02-20 23:40:44.418503+00	t
4151	Factory New	0.75	925	2025-02-20 23:40:22.135485+00	f
4152	Minimal Wear	0.35	925	2025-02-20 23:40:22.154485+00	f
4153	Field-Tested	0.42	925	2025-02-20 23:40:22.142486+00	f
4154	Well-Worn	0.3	925	2025-02-20 23:40:22.158485+00	f
4155	Battle-Scarred	0.31	925	2025-02-20 23:40:22.131486+00	f
4156	Factory New	2.3	925	2025-02-20 23:40:42.616968+00	t
4157	Minimal Wear	0.63	925	2025-02-20 23:40:42.625968+00	t
4158	Field-Tested	0.45	925	2025-02-20 23:40:42.620968+00	t
4159	Well-Worn	0.26	925	2025-02-20 23:40:42.630968+00	t
4160	Battle-Scarred	0.37	925	2025-02-20 23:40:42.610761+00	t
4161	Factory New	0.45	927	2025-02-20 23:40:52.220512+00	f
4162	Minimal Wear	0.35	927	2025-02-20 23:40:52.241512+00	f
4163	Field-Tested	0.34	927	2025-02-20 23:40:52.233515+00	f
4164	Well-Worn	0.42	927	2025-02-20 23:40:52.251513+00	f
4165	Battle-Scarred	0.26	927	2025-02-20 23:40:52.210512+00	f
4166	Factory New	1.47	927	2025-02-20 23:40:48.351574+00	t
4167	Minimal Wear	0.71	927	2025-02-20 23:40:48.360573+00	t
4168	Field-Tested	0.39	927	2025-02-20 23:40:48.355574+00	t
4169	Well-Worn	1.46	927	2025-02-20 23:40:48.368574+00	t
4170	Battle-Scarred	0.35	927	2025-02-20 23:40:48.347573+00	t
4171	Factory New	108.2	929	2025-02-20 23:40:05.392261+00	f
4172	Minimal Wear	50.88	929	2025-02-20 23:40:05.408871+00	f
4173	Field-Tested	35.41	929	2025-02-20 23:40:05.401871+00	f
4174	Well-Worn	38.29	929	2025-02-20 23:40:05.418227+00	f
4175	Battle-Scarred	30.5	929	2025-02-20 23:40:05.381667+00	f
4176	Factory New	194.25	929	2025-02-20 23:40:35.439755+00	t
4177	Minimal Wear	113.75	929	2025-02-20 23:40:35.449917+00	t
4178	Field-Tested	72.3	929	2025-02-20 23:40:35.443917+00	t
4179	Well-Worn	86.37	929	2025-02-20 23:40:35.453916+00	t
4180	Battle-Scarred	75.11	929	2025-02-20 23:40:35.436756+00	t
4181	Factory New	17.4	931	2025-02-20 23:40:00.555589+00	f
4182	Minimal Wear	9.74	931	2025-02-20 23:40:00.564589+00	f
4183	Field-Tested	7.2	931	2025-02-20 23:40:00.56059+00	f
4184	Well-Worn	11.66	931	2025-02-20 23:40:00.578692+00	f
4185	Battle-Scarred	8.88	931	2025-02-20 23:40:00.551589+00	f
4186	Factory New	55.55	931	2025-02-20 23:40:32.286391+00	t
4187	Minimal Wear	32.21	931	2025-02-20 23:40:32.313448+00	t
4188	Field-Tested	22.18	931	2025-02-20 23:40:32.300925+00	t
4189	Well-Worn	26.61	931	2025-02-20 23:40:32.31844+00	t
4190	Battle-Scarred	23.02	931	2025-02-20 23:40:32.281391+00	t
4191	Factory New	10.41	933	2025-02-20 23:40:16.522725+00	f
4192	Minimal Wear	5.5	933	2025-02-20 23:40:16.532725+00	f
4193	Field-Tested	3.46	933	2025-02-20 23:40:16.527726+00	f
4194	Well-Worn	4.72	933	2025-02-20 23:40:16.536725+00	f
4195	Battle-Scarred	3.61	933	2025-02-20 23:40:16.518725+00	f
4196	Factory New	18.54	933	2025-02-20 23:40:39.807644+00	t
4197	Minimal Wear	13.08	933	2025-02-20 23:40:39.819644+00	t
4198	Field-Tested	7.07	933	2025-02-20 23:40:39.814644+00	t
4199	Well-Worn	7.39	933	2025-02-20 23:40:39.822644+00	t
4200	Battle-Scarred	7.64	933	2025-02-20 23:40:39.803644+00	t
4201	Factory New	10.43	935	2025-02-20 23:40:13.497738+00	f
4202	Minimal Wear	5.88	935	2025-02-20 23:40:13.505737+00	f
4203	Field-Tested	3.72	935	2025-02-20 23:40:13.501737+00	f
4204	Well-Worn	5.63	935	2025-02-20 23:40:13.510741+00	f
4205	Battle-Scarred	3.46	935	2025-02-20 23:40:13.491737+00	f
4206	Factory New	25.47	935	2025-02-20 23:40:38.102725+00	t
4207	Minimal Wear	12.58	935	2025-02-20 23:40:38.119942+00	t
4208	Field-Tested	8.8	935	2025-02-20 23:40:38.107727+00	t
4209	Well-Worn	13.14	935	2025-02-20 23:40:38.125942+00	t
4210	Battle-Scarred	8.57	935	2025-02-20 23:40:38.085929+00	t
4211	Factory New	8.66	937	2025-02-20 23:40:54.378549+00	f
4212	Minimal Wear	4.63	937	2025-02-20 23:40:54.389547+00	f
4213	Field-Tested	2.91	937	2025-02-20 23:40:54.383547+00	f
4214	Well-Worn	2.72	937	2025-02-20 23:40:54.394547+00	f
4215	Battle-Scarred	2.95	937	2025-02-20 23:40:54.373546+00	f
4216	Factory New	16.96	937	2025-02-20 23:40:48.997378+00	t
4217	Minimal Wear	8.52	937	2025-02-20 23:40:49.005377+00	t
4218	Field-Tested	4.99	937	2025-02-20 23:40:49.001377+00	t
4219	Well-Worn	5.81	937	2025-02-20 23:40:49.009929+00	t
4220	Battle-Scarred	5.5	937	2025-02-20 23:40:48.992539+00	t
4221	Factory New	2.08	939	2025-02-20 23:40:18.066923+00	f
4222	Minimal Wear	0.89	939	2025-02-20 23:40:18.074924+00	f
4223	Field-Tested	0.43	939	2025-02-20 23:40:18.069922+00	f
4224	Well-Worn	0.36	939	2025-02-20 23:40:18.080922+00	f
4225	Battle-Scarred	0.33	939	2025-02-20 23:40:18.062923+00	f
4226	Factory New	4.67	939	2025-02-20 23:40:41.005495+00	t
4227	Minimal Wear	1.49	939	2025-02-20 23:40:41.015494+00	t
4228	Field-Tested	0.66	939	2025-02-20 23:40:41.009495+00	t
4229	Well-Worn	0.58	939	2025-02-20 23:40:41.019494+00	t
4230	Battle-Scarred	0.58	939	2025-02-20 23:40:40.999494+00	t
4231	Factory New	1.83	941	2025-02-20 23:40:16.675417+00	f
4232	Minimal Wear	0.78	941	2025-02-20 23:40:16.686417+00	f
4233	Field-Tested	0.4	941	2025-02-20 23:40:16.680417+00	f
4234	Well-Worn	0.37	941	2025-02-20 23:40:16.690417+00	f
4235	Battle-Scarred	0.33	941	2025-02-20 23:40:16.670417+00	f
4236	Factory New	4.72	941	2025-02-20 23:40:39.892644+00	t
4237	Minimal Wear	1.47	941	2025-02-20 23:40:39.904158+00	t
4238	Field-Tested	0.65	941	2025-02-20 23:40:39.899157+00	t
4239	Well-Worn	0.65	941	2025-02-20 23:40:39.908158+00	t
4240	Battle-Scarred	0.61	941	2025-02-20 23:40:39.888643+00	t
4241	Factory New	1.67	943	2025-02-20 23:40:49.48841+00	f
4242	Minimal Wear	0.74	943	2025-02-20 23:40:49.497048+00	f
4243	Field-Tested	0.39	943	2025-02-20 23:40:49.49241+00	f
4244	Well-Worn	0.37	943	2025-02-20 23:40:49.501046+00	f
4245	Battle-Scarred	0.32	943	2025-02-20 23:40:49.48441+00	f
4246	Factory New	4.96	943	2025-02-20 23:40:47.682675+00	t
4247	Minimal Wear	1.49	943	2025-02-20 23:40:47.689673+00	t
4248	Field-Tested	0.66	943	2025-02-20 23:40:47.686672+00	t
4249	Well-Worn	0.6	943	2025-02-20 23:40:47.694672+00	t
4250	Battle-Scarred	0.62	943	2025-02-20 23:40:47.677673+00	t
4251	Factory New	1.47	945	2025-02-20 23:40:18.629001+00	f
4252	Minimal Wear	0.78	945	2025-02-20 23:40:18.637+00	f
4253	Field-Tested	0.4	945	2025-02-20 23:40:18.633+00	f
4254	Well-Worn	0.47	945	2025-02-20 23:40:18.64+00	f
4255	Battle-Scarred	0.34	945	2025-02-20 23:40:18.624001+00	f
4256	Factory New	3.31	945	2025-02-20 23:40:41.254652+00	t
4257	Minimal Wear	1.53	945	2025-02-20 23:40:41.265699+00	t
4258	Field-Tested	0.66	945	2025-02-20 23:40:41.258652+00	t
4259	Well-Worn	1.07	945	2025-02-20 23:40:41.269698+00	t
4260	Battle-Scarred	0.73	945	2025-02-20 23:40:41.250652+00	t
4261	Factory New	1.63	947	2025-02-20 23:40:11.39984+00	f
4262	Minimal Wear	0.84	947	2025-02-20 23:40:11.409397+00	f
4263	Field-Tested	0.4	947	2025-02-20 23:40:11.404838+00	f
4264	Well-Worn	0.73	947	2025-02-20 23:40:11.414396+00	f
4265	Battle-Scarred	0.42	947	2025-02-20 23:40:11.389839+00	f
4266	Factory New	4.42	947	2025-02-20 23:40:37.086472+00	t
4267	Minimal Wear	1.63	947	2025-02-20 23:40:37.095777+00	t
4268	Field-Tested	1.02	947	2025-02-20 23:40:37.090472+00	t
4269	Well-Worn	1.31	947	2025-02-20 23:40:37.100776+00	t
4270	Battle-Scarred	0.8	947	2025-02-20 23:40:37.08248+00	t
4271	Factory New	0.29	949	2025-02-20 23:40:22.607093+00	f
4272	Minimal Wear	0.11	949	2025-02-20 23:40:22.617094+00	f
4273	Field-Tested	0.08	949	2025-02-20 23:40:22.612094+00	f
4274	Well-Worn	0.06	949	2025-02-20 23:40:22.621094+00	f
4275	Battle-Scarred	0.08	949	2025-02-20 23:40:22.603094+00	f
4276	Factory New	1.13	949	2025-02-20 23:40:42.825349+00	t
4277	Minimal Wear	0.27	949	2025-02-20 23:40:42.83535+00	t
4278	Field-Tested	0.12	949	2025-02-20 23:40:42.831349+00	t
4279	Well-Worn	0.11	949	2025-02-20 23:40:42.84035+00	t
4280	Battle-Scarred	0.1	949	2025-02-20 23:40:42.821349+00	t
4281	Factory New	0.31	951	2025-02-20 23:40:29.463263+00	f
4282	Minimal Wear	0.1	951	2025-02-20 23:40:29.471261+00	f
4283	Field-Tested	0.07	951	2025-02-20 23:40:29.46726+00	f
4284	Well-Worn	0.07	951	2025-02-20 23:40:29.475262+00	f
4285	Battle-Scarred	0.1	951	2025-02-20 23:40:29.45826+00	f
4286	Factory New	1.29	951	2025-02-20 23:40:47.136959+00	t
4287	Minimal Wear	0.29	951	2025-02-20 23:40:47.14596+00	t
4288	Field-Tested	0.14	951	2025-02-20 23:40:47.140958+00	t
4289	Well-Worn	0.12	951	2025-02-20 23:40:47.149958+00	t
4290	Battle-Scarred	0.27	951	2025-02-20 23:40:47.132958+00	t
4291	Factory New	0.25	953	2025-02-20 23:40:24.68196+00	f
4292	Minimal Wear	0.11	953	2025-02-20 23:40:24.689959+00	f
4293	Field-Tested	0.08	953	2025-02-20 23:40:24.685959+00	f
4294	Well-Worn	0.06	953	2025-02-20 23:40:24.693959+00	f
4295	Battle-Scarred	0.07	953	2025-02-20 23:40:24.676307+00	f
4296	Factory New	0.78	953	2025-02-20 23:40:44.577357+00	t
4297	Minimal Wear	0.24	953	2025-02-20 23:40:44.617077+00	t
4298	Field-Tested	0.11	953	2025-02-20 23:40:44.600484+00	t
4299	Well-Worn	0.1	953	2025-02-20 23:40:44.628573+00	t
4300	Battle-Scarred	0.11	953	2025-02-20 23:40:44.565363+00	t
4301	Factory New	0.26	955	2025-02-20 23:40:26.077383+00	f
4302	Minimal Wear	0.11	955	2025-02-20 23:40:26.097662+00	f
4303	Field-Tested	0.08	955	2025-02-20 23:40:26.091384+00	f
4304	Well-Worn	0.06	955	2025-02-20 23:40:26.109662+00	f
4305	Battle-Scarred	0.06	955	2025-02-20 23:40:26.061385+00	f
4306	Factory New	1.24	955	2025-02-20 23:40:45.681531+00	t
4307	Minimal Wear	0.24	955	2025-02-20 23:40:45.697532+00	t
4308	Field-Tested	0.11	955	2025-02-20 23:40:45.69153+00	t
4309	Well-Worn	0.09	955	2025-02-20 23:40:45.703537+00	t
4310	Battle-Scarred	0.09	955	2025-02-20 23:40:45.676531+00	t
4311	Factory New	0.24	957	2025-02-20 23:40:21.530597+00	f
4312	Minimal Wear	0.1	957	2025-02-20 23:40:21.537597+00	f
4313	Field-Tested	0.07	957	2025-02-20 23:40:21.534597+00	f
4314	Well-Worn	0.08	957	2025-02-20 23:40:21.55665+00	f
4315	Battle-Scarred	0.07	957	2025-02-20 23:40:21.5246+00	f
4316	Factory New	0.67	957	2025-02-20 23:40:42.346505+00	t
4317	Minimal Wear	0.23	957	2025-02-20 23:40:42.355503+00	t
4318	Field-Tested	0.1	957	2025-02-20 23:40:42.351503+00	t
4319	Well-Worn	0.12	957	2025-02-20 23:40:42.359504+00	t
4320	Battle-Scarred	0.11	957	2025-02-20 23:40:42.340503+00	t
4321	Factory New	0.22	959	2025-02-20 23:40:28.658592+00	f
4322	Minimal Wear	0.11	959	2025-02-20 23:40:28.668726+00	f
4323	Field-Tested	0.05	959	2025-02-20 23:40:28.664591+00	f
4324	Well-Worn	0.06	959	2025-02-20 23:40:28.672238+00	f
4325	Battle-Scarred	0.06	959	2025-02-20 23:40:28.653593+00	f
4326	Factory New	0.6	959	2025-02-20 23:40:46.689691+00	t
4327	Minimal Wear	0.25	959	2025-02-20 23:40:46.69869+00	t
4328	Field-Tested	0.13	959	2025-02-20 23:40:46.693691+00	t
4329	Well-Worn	0.17	959	2025-02-20 23:40:46.702692+00	t
4330	Battle-Scarred	0.11	959	2025-02-20 23:40:46.685692+00	t
4331	Factory New	0.22	961	2025-02-20 23:40:23.457526+00	f
4332	Minimal Wear	0.11	961	2025-02-20 23:40:23.468524+00	f
4333	Field-Tested	0.07	961	2025-02-20 23:40:23.464526+00	f
4334	Well-Worn	0.07	961	2025-02-20 23:40:23.473524+00	f
4335	Battle-Scarred	0.08	961	2025-02-20 23:40:23.453525+00	f
4336	Factory New	0.66	961	2025-02-20 23:40:43.318873+00	t
4337	Minimal Wear	0.29	961	2025-02-20 23:40:43.329877+00	t
4338	Field-Tested	0.12	961	2025-02-20 23:40:43.324874+00	t
4339	Well-Worn	0.16	961	2025-02-20 23:40:43.333875+00	t
4340	Battle-Scarred	0.11	961	2025-02-20 23:40:43.314874+00	t
4341	Factory New	105.71	963	2025-02-20 23:40:00.60569+00	f
4342	Minimal Wear	36.36	963	2025-02-20 23:40:00.62269+00	f
4343	Field-Tested	20.32	963	2025-02-20 23:40:00.615691+00	f
4344	Well-Worn	33.92	963	2025-02-20 23:40:00.631611+00	f
4345	Battle-Scarred	20.68	963	2025-02-20 23:40:00.592691+00	f
4346	Factory New	160.29	963	2025-02-20 23:40:32.337623+00	t
4347	Minimal Wear	91.54	963	2025-02-20 23:40:32.375853+00	t
4348	Field-Tested	52.73	963	2025-02-20 23:40:32.355156+00	t
4349	Well-Worn	70.48	963	2025-02-15 23:05:37.530392+00	t
4350	Battle-Scarred	58.29	963	2025-02-20 23:40:32.333108+00	t
4351	Factory New	24.25	965	2025-02-20 23:40:08.444344+00	f
4352	Minimal Wear	5.89	965	2025-02-20 23:40:08.464343+00	f
4353	Field-Tested	3.43	965	2025-02-20 23:40:08.457348+00	f
4354	Well-Worn	5.14	965	2025-02-20 23:40:08.477342+00	f
4355	Battle-Scarred	4.44	965	2025-02-20 23:40:08.438833+00	f
4356	Factory New	95.37	965	2025-02-20 23:40:36.195623+00	t
4357	Minimal Wear	23.43	965	2025-02-20 23:40:36.206165+00	t
4358	Field-Tested	12.12	965	2025-02-20 23:40:36.201165+00	t
4359	Well-Worn	10.06	965	2025-02-20 23:40:36.209166+00	t
4360	Battle-Scarred	13.33	965	2025-02-20 23:40:36.190622+00	t
4361	Factory New	18.57	967	2025-02-20 23:40:49.620185+00	f
4362	Minimal Wear	7.53	967	2025-02-20 23:40:49.629511+00	f
4363	Field-Tested	4.71	967	2025-02-20 23:40:49.625507+00	f
4364	Well-Worn	4.41	967	2025-02-20 23:40:49.633506+00	f
4365	Battle-Scarred	3.27	967	2025-02-20 23:40:49.617186+00	f
4366	Factory New	57.13	967	2025-02-20 23:40:47.809008+00	t
4367	Minimal Wear	21.06	967	2025-02-20 23:40:47.820576+00	t
4368	Field-Tested	10.75	967	2025-02-20 23:40:47.816009+00	t
4369	Well-Worn	11.67	967	2025-02-20 23:40:47.824576+00	t
4370	Battle-Scarred	11.93	967	2025-02-20 23:40:47.805009+00	t
4371	Factory New	13.18	969	2025-02-20 23:40:19.624693+00	f
4372	Minimal Wear	5.92	969	2025-02-20 23:40:19.633693+00	f
4373	Field-Tested	2.95	969	2025-02-20 23:40:19.629695+00	f
4374	Well-Worn	3.7	969	2025-02-20 23:40:19.637693+00	f
4375	Battle-Scarred	2.7	969	2025-02-20 23:40:19.620693+00	f
4376	Factory New	36.96	969	2025-02-20 23:40:41.708267+00	t
4377	Minimal Wear	16.42	969	2025-02-20 23:40:41.719267+00	t
4378	Field-Tested	7.03	969	2025-02-20 23:40:41.714269+00	t
4379	Well-Worn	5.92	969	2025-02-20 23:40:41.725267+00	t
4380	Battle-Scarred	6.96	969	2025-02-20 23:40:41.703316+00	t
4381	Factory New	9.36	971	2025-02-20 23:40:02.288631+00	f
4382	Minimal Wear	4.1	971	2025-02-20 23:40:02.308151+00	f
4383	Field-Tested	2.48	971	2025-02-20 23:40:02.301632+00	f
4384	Well-Worn	3.56	971	2025-02-20 23:40:02.322145+00	f
4385	Battle-Scarred	3.48	971	2025-02-20 23:40:02.282632+00	f
4386	Factory New	20.08	971	2025-02-20 23:40:33.659028+00	t
4387	Minimal Wear	9.99	971	2025-02-20 23:40:33.670292+00	t
4388	Field-Tested	4.87	971	2025-02-20 23:40:33.666294+00	t
4389	Well-Worn	6.07	971	2025-02-20 23:40:33.674293+00	t
4390	Battle-Scarred	4.8	971	2025-02-20 23:40:33.655029+00	t
4391	Factory New	15.18	973	2025-02-20 23:40:04.907192+00	f
4392	Minimal Wear	1.89	973	2025-02-20 23:40:04.917191+00	f
4393	Field-Tested	0.58	973	2025-02-20 23:40:04.913192+00	f
4394	Well-Worn	0.72	973	2025-02-20 23:40:04.922192+00	f
4395	Battle-Scarred	0.6	973	2025-02-20 23:40:04.901192+00	f
4396	Factory New	58.8	973	2025-02-20 23:40:35.237469+00	t
4397	Minimal Wear	8.38	973	2025-02-20 23:40:35.246667+00	t
4398	Field-Tested	2.38	973	2025-02-20 23:40:35.240667+00	t
4399	Well-Worn	2.09	973	2025-02-20 23:40:35.250666+00	t
4400	Battle-Scarred	2.35	973	2025-02-20 23:40:35.233469+00	t
4401	Factory New	2.22	975	2025-02-20 23:40:27.658569+00	f
4402	Minimal Wear	0.78	975	2025-02-20 23:40:27.667569+00	f
4403	Field-Tested	0.45	975	2025-02-20 23:40:27.663569+00	f
4404	Well-Worn	0.62	975	2025-02-20 23:40:27.670569+00	f
4405	Battle-Scarred	0.42	975	2025-02-20 23:40:27.654571+00	f
4406	Factory New	5.86	975	2025-02-20 23:40:46.379822+00	t
4407	Minimal Wear	1.74	975	2025-02-20 23:40:46.389821+00	t
4408	Field-Tested	0.73	975	2025-02-20 23:40:46.385822+00	t
4409	Well-Worn	0.87	975	2025-02-20 23:40:46.393821+00	t
4410	Battle-Scarred	0.83	975	2025-02-20 23:40:46.374821+00	t
4411	Factory New	3.46	977	2025-02-20 23:40:13.590985+00	f
4412	Minimal Wear	1.04	977	2025-02-20 23:40:13.600984+00	f
4413	Field-Tested	0.53	977	2025-02-20 23:40:13.596984+00	f
4414	Well-Worn	0.64	977	2025-02-20 23:40:13.605985+00	f
4415	Battle-Scarred	0.6	977	2025-02-20 23:40:13.586985+00	f
4416	Factory New	11.4	977	2025-02-20 23:40:38.311035+00	t
4417	Minimal Wear	3.28	977	2025-02-20 23:40:38.323591+00	t
4418	Field-Tested	1.86	977	2025-02-20 23:40:38.318588+00	t
4419	Well-Worn	1.74	977	2025-02-20 23:40:38.329597+00	t
4420	Battle-Scarred	1.63	977	2025-02-20 23:40:38.302522+00	t
4421	Factory New	2.05	979	2025-02-20 23:40:28.790015+00	f
4422	Minimal Wear	0.79	979	2025-02-20 23:40:28.800015+00	f
4423	Field-Tested	0.43	979	2025-02-20 23:40:28.794016+00	f
4424	Well-Worn	0.43	979	2025-02-20 23:40:28.804015+00	f
4425	Battle-Scarred	0.58	979	2025-02-20 23:40:28.786016+00	f
4426	Factory New	5.54	979	2025-02-20 23:40:46.834704+00	t
4427	Minimal Wear	2.07	979	2025-02-20 23:40:46.846281+00	t
4428	Field-Tested	0.85	979	2025-02-20 23:40:46.840767+00	t
4429	Well-Worn	1.05	979	2025-02-20 23:40:46.85128+00	t
4430	Battle-Scarred	0.92	979	2025-02-20 23:40:46.827078+00	t
4431	Factory New	1.7	981	2025-02-20 23:40:18.107629+00	f
4432	Minimal Wear	0.85	981	2025-02-20 23:40:18.116631+00	f
4433	Field-Tested	0.46	981	2025-02-20 23:40:18.11263+00	f
4434	Well-Worn	0.65	981	2025-02-20 23:40:18.121629+00	f
4435	Factory New	3.9	981	2025-02-20 23:40:41.024495+00	t
4436	Minimal Wear	1.64	981	2025-02-20 23:40:41.0329+00	t
4437	Field-Tested	1.05	981	2025-02-20 23:40:41.028902+00	t
4438	Well-Worn	1.31	981	2025-02-20 23:40:41.0369+00	t
4439	Minimal Wear	0.67	983	2025-02-20 23:40:21.274835+00	f
4440	Field-Tested	0.11	983	2025-02-20 23:40:21.270836+00	f
4441	Well-Worn	0.14	983	2025-02-20 23:40:21.279836+00	f
4442	Battle-Scarred	0.12	983	2025-02-20 23:40:21.266019+00	f
4443	Minimal Wear	2.75	983	2025-02-20 23:40:42.101611+00	t
4444	Field-Tested	0.28	983	2025-02-20 23:40:42.097612+00	t
4445	Well-Worn	0.48	983	2025-02-20 23:40:42.106611+00	t
4446	Battle-Scarred	0.31	983	2025-02-20 23:40:42.091612+00	t
4447	Factory New	0.53	985	2025-02-20 23:40:04.240628+00	f
4448	Minimal Wear	0.16	985	2025-02-20 23:40:04.249626+00	f
4449	Field-Tested	0.15	985	2025-02-20 23:40:04.246627+00	f
4450	Well-Worn	0.09	985	2025-02-20 23:40:04.253627+00	f
4451	Battle-Scarred	0.09	985	2025-02-20 23:40:04.233626+00	f
4452	Factory New	2.64	985	2025-02-20 23:40:34.676484+00	t
4453	Minimal Wear	0.57	985	2025-02-20 23:40:34.687099+00	t
4454	Field-Tested	0.17	985	2025-02-20 23:40:34.682097+00	t
4455	Well-Worn	0.19	985	2025-02-20 23:40:34.690097+00	t
4456	Battle-Scarred	0.28	985	2025-02-20 23:40:34.670483+00	t
4457	Factory New	0.56	987	2025-02-20 23:40:24.713959+00	f
4458	Minimal Wear	0.16	987	2025-02-20 23:40:24.721959+00	f
4459	Field-Tested	0.12	987	2025-02-20 23:40:24.718959+00	f
4460	Well-Worn	1.12	987	2025-02-20 23:40:24.730567+00	f
4461	Battle-Scarred	0.16	987	2025-02-20 23:40:24.708959+00	f
4462	Factory New	2.39	987	2025-02-20 23:40:44.681665+00	t
4463	Minimal Wear	0.72	987	2025-02-20 23:40:44.706594+00	t
4464	Field-Tested	0.21	987	2025-02-20 23:40:44.697665+00	t
4465	Well-Worn	1.67	987	2025-02-20 23:40:44.719284+00	t
4466	Battle-Scarred	0.21	987	2025-02-20 23:40:44.65961+00	t
4467	Factory New	0.57	989	2025-02-20 23:40:09.844695+00	f
4468	Minimal Wear	0.16	989	2025-02-20 23:40:09.853694+00	f
4469	Field-Tested	0.12	989	2025-02-20 23:40:09.848694+00	f
4470	Well-Worn	0.13	989	2025-02-20 23:40:09.857694+00	f
4471	Battle-Scarred	0.13	989	2025-02-20 23:40:09.839694+00	f
4472	Factory New	2.5	989	2025-02-20 23:40:36.632691+00	t
4473	Minimal Wear	0.48	989	2025-02-20 23:40:36.642028+00	t
4474	Field-Tested	0.2	989	2025-02-20 23:40:36.637979+00	t
4475	Well-Worn	0.2	989	2025-02-20 23:40:36.64803+00	t
4476	Battle-Scarred	0.34	989	2025-02-20 23:40:36.628691+00	t
4477	Factory New	0.33	991	2025-02-20 23:40:54.893176+00	f
4478	Minimal Wear	0.18	991	2025-02-20 23:40:54.904177+00	f
4479	Field-Tested	0.14	991	2025-02-20 23:40:54.899176+00	f
4480	Well-Worn	0.23	991	2025-02-15 23:05:46.213794+00	f
4481	Battle-Scarred	0.31	991	2025-02-20 23:40:54.889176+00	f
4482	Factory New	1.65	991	2025-02-20 23:40:49.178061+00	t
4483	Minimal Wear	0.92	991	2025-02-20 23:40:49.187478+00	t
4484	Field-Tested	0.32	991	2025-02-20 23:40:49.184478+00	t
4485	Well-Worn	7.4	991	2025-02-20 23:40:49.190478+00	t
4486	Battle-Scarred	1.47	991	2025-02-20 23:40:49.17506+00	t
4487	Factory New	0.42	993	2025-02-20 23:40:51.348544+00	f
4488	Minimal Wear	0.13	993	2025-02-20 23:40:51.374382+00	f
4489	Field-Tested	0.13	993	2025-02-20 23:40:51.359543+00	f
4490	Well-Worn	0.14	993	2025-02-20 23:40:51.382743+00	f
4491	Battle-Scarred	0.12	993	2025-02-20 23:40:51.33273+00	f
4492	Factory New	1.5	993	2025-02-20 23:40:48.046515+00	t
4493	Minimal Wear	0.74	993	2025-02-20 23:40:48.054515+00	t
4494	Field-Tested	0.13	993	2025-02-20 23:40:48.050514+00	t
4495	Well-Worn	0.29	993	2025-02-20 23:40:48.058514+00	t
4496	Battle-Scarred	0.14	993	2025-02-20 23:40:48.041514+00	t
4497	Factory New	0.26	995	2025-02-20 23:40:11.082646+00	f
4498	Minimal Wear	0.13	995	2025-02-20 23:40:11.091645+00	f
4499	Field-Tested	0.09	995	2025-02-20 23:40:11.086646+00	f
4500	Well-Worn	0.17	995	2025-02-20 23:40:11.097646+00	f
4501	Factory New	0.98	995	2025-02-20 23:40:36.984655+00	t
4502	Minimal Wear	0.36	995	2025-02-20 23:40:36.991654+00	t
4503	Field-Tested	0.25	995	2025-02-20 23:40:36.988654+00	t
4504	Well-Worn	0.74	995	2025-02-20 23:40:36.998815+00	t
4505	Factory New	125.43	997	2025-02-20 23:40:15.460975+00	f
4506	Minimal Wear	53.8	997	2025-02-20 23:40:15.470526+00	f
4507	Field-Tested	28.54	997	2025-02-20 23:40:15.465973+00	f
4508	Well-Worn	112.63	997	2025-02-20 23:40:15.475525+00	f
4509	Battle-Scarred	27	997	2025-02-20 23:40:15.455974+00	f
4510	Factory New	186.4	997	2025-02-20 23:40:39.232965+00	t
4511	Minimal Wear	110.11	997	2025-02-20 23:40:39.240233+00	t
4512	Field-Tested	70.97	997	2025-02-20 23:40:39.237232+00	t
4513	Well-Worn	95.07	997	2025-02-20 23:40:39.245235+00	t
4514	Battle-Scarred	66.13	997	2025-02-20 23:40:39.225965+00	t
4515	Factory New	6.38	999	2025-02-20 23:40:13.539737+00	f
4516	Minimal Wear	5.04	999	2025-02-20 23:40:13.551984+00	f
4517	Field-Tested	5.24	999	2025-02-20 23:40:13.545739+00	f
4518	Well-Worn	8.15	999	2025-02-15 23:05:29.836729+00	f
4519	Battle-Scarred	5.73	999	2025-02-15 23:05:29.827494+00	f
4520	Factory New	39.97	999	2025-02-20 23:40:38.208359+00	t
4521	Minimal Wear	24.67	999	2025-02-20 23:40:38.230378+00	t
4522	Field-Tested	21.96	999	2025-02-20 23:40:38.215376+00	t
4523	Well-Worn	28	999	2025-02-20 23:40:38.246975+00	t
4524	Battle-Scarred	22.09	999	2025-02-20 23:40:38.19436+00	t
4525	Factory New	29.62	1001	2025-02-20 23:40:15.913799+00	f
4526	Minimal Wear	11.3	1001	2025-02-20 23:40:15.923798+00	f
4527	Field-Tested	7.53	1001	2025-02-20 23:40:15.919798+00	f
4528	Well-Worn	8.87	1001	2025-02-20 23:40:15.927799+00	f
4529	Battle-Scarred	7.22	1001	2025-02-20 23:40:15.906798+00	f
4530	Factory New	93.15	1001	2025-02-20 23:40:39.451187+00	t
4531	Minimal Wear	35.35	1001	2025-02-20 23:40:39.473411+00	t
4532	Field-Tested	19.22	1001	2025-02-20 23:40:39.465412+00	t
4533	Well-Worn	21.94	1001	2025-02-20 23:40:39.478413+00	t
4534	Battle-Scarred	18.23	1001	2025-02-20 23:40:39.448188+00	t
4535	Factory New	11.19	1003	2025-02-20 23:40:22.782404+00	f
4536	Minimal Wear	6.23	1003	2025-02-20 23:40:22.792813+00	f
4537	Field-Tested	3.66	1003	2025-02-20 23:40:22.788815+00	f
4538	Well-Worn	4.83	1003	2025-02-20 23:40:22.797813+00	f
4539	Battle-Scarred	3.62	1003	2025-02-20 23:40:22.775103+00	f
4540	Factory New	27.58	1003	2025-02-20 23:40:42.88835+00	t
4541	Minimal Wear	11.81	1003	2025-02-20 23:40:42.90035+00	t
4542	Field-Tested	8.14	1003	2025-02-20 23:40:42.89335+00	t
4543	Well-Worn	9.97	1003	2025-02-20 23:40:42.91135+00	t
4544	Battle-Scarred	9.98	1003	2025-02-20 23:40:42.88135+00	t
4545	Factory New	9.91	1005	2025-02-20 23:40:27.296587+00	f
4546	Minimal Wear	5.13	1005	2025-02-20 23:40:27.304588+00	f
4547	Field-Tested	3.15	1005	2025-02-20 23:40:27.300586+00	f
4548	Well-Worn	5.34	1005	2025-02-20 23:40:27.308587+00	f
4549	Factory New	18.78	1005	2025-02-20 23:40:46.114153+00	t
4550	Minimal Wear	9.46	1005	2025-02-20 23:40:46.122154+00	t
4551	Field-Tested	6.07	1005	2025-02-20 23:40:46.118153+00	t
4552	Well-Worn	7.16	1005	2025-02-20 23:40:46.127154+00	t
4553	Factory New	3.48	1007	2025-02-20 23:40:27.180942+00	f
4554	Minimal Wear	1.26	1007	2025-02-20 23:40:27.188942+00	f
4555	Field-Tested	0.74	1007	2025-02-20 23:40:27.184942+00	f
4556	Well-Worn	0.67	1007	2025-02-20 23:40:27.192942+00	f
4557	Battle-Scarred	0.46	1007	2025-02-20 23:40:27.173941+00	f
4558	Factory New	16.27	1007	2025-02-20 23:40:46.006785+00	t
4559	Minimal Wear	4.56	1007	2025-02-20 23:40:46.017785+00	t
4560	Field-Tested	2.24	1007	2025-02-20 23:40:46.011785+00	t
4561	Well-Worn	1.39	1007	2025-02-20 23:40:46.021785+00	t
4562	Battle-Scarred	1.48	1007	2025-02-20 23:40:46.001784+00	t
4563	Factory New	2.52	1009	2025-02-20 23:40:03.786783+00	f
4564	Minimal Wear	1.7	1009	2025-02-20 23:40:03.798296+00	f
4565	Field-Tested	1.68	1009	2025-02-20 23:40:03.792296+00	f
4566	Well-Worn	4.3	1009	2025-02-15 23:05:26.497452+00	f
4567	Factory New	8.2	1009	2025-02-20 23:40:34.393465+00	t
4568	Minimal Wear	5.89	1009	2025-02-20 23:40:34.404165+00	t
4569	Field-Tested	5.19	1009	2025-02-20 23:40:34.399012+00	t
4570	Well-Worn	11.97	1009	2025-02-15 18:41:28.05935+00	t
4571	Factory New	2.33	1011	2025-02-20 23:40:30.648154+00	f
4572	Minimal Wear	1.09	1011	2025-02-20 23:40:30.68111+00	f
4573	Field-Tested	0.78	1011	2025-02-20 23:40:30.668947+00	f
4574	Well-Worn	0.74	1011	2025-02-20 23:40:30.694408+00	f
4575	Battle-Scarred	0.63	1011	2025-02-20 23:40:30.622288+00	f
4576	Factory New	5.97	1011	2025-02-20 23:40:47.427073+00	t
4577	Minimal Wear	2.74	1011	2025-02-20 23:40:47.43685+00	t
4578	Field-Tested	1.49	1011	2025-02-20 23:40:47.432073+00	t
4579	Well-Worn	1.23	1011	2025-02-20 23:40:47.440846+00	t
4580	Battle-Scarred	1.33	1011	2025-02-20 23:40:47.423072+00	t
4581	Factory New	2.58	1013	2025-02-20 23:40:01.484348+00	f
4582	Minimal Wear	1.27	1013	2025-02-20 23:40:01.492348+00	f
4583	Field-Tested	0.89	1013	2025-02-20 23:40:01.487347+00	f
4584	Well-Worn	2.85	1013	2025-02-20 23:40:01.499348+00	f
4585	Battle-Scarred	1.19	1013	2025-02-20 23:40:01.480347+00	f
4586	Factory New	7.26	1013	2025-02-20 23:40:33.208715+00	t
4587	Minimal Wear	3.19	1013	2025-02-20 23:40:33.233862+00	t
4588	Field-Tested	1.79	1013	2025-02-20 23:40:33.220862+00	t
4589	Well-Worn	3.09	1013	2025-02-20 23:40:33.240289+00	t
4590	Battle-Scarred	1.79	1013	2025-02-20 23:40:33.196895+00	t
4591	Factory New	2.45	1015	2025-02-20 23:40:24.456388+00	f
4592	Minimal Wear	1.25	1015	2025-02-20 23:40:24.469387+00	f
4593	Field-Tested	0.88	1015	2025-02-20 23:40:24.464388+00	f
4594	Well-Worn	1.18	1015	2025-02-20 23:40:24.475387+00	f
4595	Battle-Scarred	0.89	1015	2025-02-20 23:40:24.452387+00	f
4596	Factory New	7.39	1015	2025-02-20 23:40:44.188565+00	t
4597	Minimal Wear	3.41	1015	2025-02-20 23:40:44.200566+00	t
4598	Field-Tested	2.23	1015	2025-02-20 23:40:44.194565+00	t
4599	Well-Worn	27.8	1015	2025-02-20 23:40:44.204566+00	t
4600	Battle-Scarred	1.99	1015	2025-02-20 23:40:44.185051+00	t
4601	Factory New	0.96	1017	2025-02-20 23:40:09.933034+00	f
4602	Minimal Wear	0.53	1017	2025-02-20 23:40:09.951032+00	f
4603	Field-Tested	0.32	1017	2025-02-20 23:40:09.941033+00	f
4604	Well-Worn	0.36	1017	2025-02-20 23:40:09.958032+00	f
4605	Battle-Scarred	0.31	1017	2025-02-20 23:40:09.92397+00	f
4606	Factory New	3.48	1017	2025-02-20 23:40:36.683184+00	t
4607	Minimal Wear	1.59	1017	2025-02-20 23:40:36.690183+00	t
4608	Field-Tested	0.65	1017	2025-02-20 23:40:36.687184+00	t
4609	Well-Worn	2.18	1017	2025-02-20 23:40:36.694184+00	t
4610	Battle-Scarred	0.93	1017	2025-02-20 23:40:36.679098+00	t
4611	Factory New	0.5	1019	2025-02-20 23:40:25.616998+00	f
4612	Minimal Wear	0.29	1019	2025-02-20 23:40:25.625998+00	f
4613	Field-Tested	0.27	1019	2025-02-20 23:40:25.621998+00	f
4614	Well-Worn	0.2	1019	2025-02-20 23:40:25.630997+00	f
4615	Battle-Scarred	0.22	1019	2025-02-20 23:40:25.612999+00	f
4616	Factory New	1.77	1019	2025-02-20 23:40:45.35533+00	t
4617	Minimal Wear	0.6	1019	2025-02-20 23:40:45.37133+00	t
4618	Field-Tested	0.3	1019	2025-02-20 23:40:45.35933+00	t
4619	Well-Worn	0.31	1019	2025-02-20 23:40:45.376331+00	t
4620	Battle-Scarred	0.86	1019	2025-02-20 23:40:45.34233+00	t
4621	Factory New	0.89	1021	2025-02-20 23:40:23.829495+00	f
4622	Minimal Wear	0.27	1021	2025-02-20 23:40:23.837492+00	f
4623	Field-Tested	0.15	1021	2025-02-20 23:40:23.833492+00	f
4624	Well-Worn	0.26	1021	2025-02-20 23:40:23.842299+00	f
4625	Battle-Scarred	0.14	1021	2025-02-20 23:40:23.824493+00	f
4626	Factory New	3.68	1021	2025-02-20 23:40:43.508217+00	t
4627	Minimal Wear	0.6	1021	2025-02-20 23:40:43.523216+00	t
4628	Field-Tested	0.3	1021	2025-02-20 23:40:43.519216+00	t
4629	Well-Worn	0.67	1021	2025-02-20 23:40:43.539216+00	t
4630	Battle-Scarred	0.57	1021	2025-02-20 23:40:43.504216+00	t
4631	Factory New	0.82	1023	2025-02-20 23:40:49.686083+00	f
4632	Minimal Wear	0.5	1023	2025-02-20 23:40:49.694083+00	f
4633	Field-Tested	0.18	1023	2025-02-20 23:40:49.690083+00	f
4634	Well-Worn	0.24	1023	2025-02-20 23:40:49.699082+00	f
4635	Battle-Scarred	0.3	1023	2025-02-20 23:40:49.680507+00	f
4636	Factory New	2.59	1023	2025-02-20 23:40:47.834575+00	t
4637	Minimal Wear	2.03	1023	2025-02-20 23:40:47.841576+00	t
4638	Field-Tested	0.54	1023	2025-02-20 23:40:47.837575+00	t
4639	Well-Worn	1.34	1023	2025-02-20 23:40:47.845581+00	t
4640	Battle-Scarred	1.17	1023	2025-02-20 23:40:47.829578+00	t
4641	Factory New	0.83	1025	2025-02-20 23:40:16.796761+00	f
4642	Minimal Wear	0.22	1025	2025-02-20 23:40:16.808279+00	f
4643	Field-Tested	0.19	1025	2025-02-20 23:40:16.80428+00	f
4644	Well-Worn	0.22	1025	2025-02-20 23:40:16.81328+00	f
4645	Battle-Scarred	0.19	1025	2025-02-20 23:40:16.791762+00	f
4646	Factory New	3.24	1025	2025-02-20 23:40:39.956098+00	t
4647	Minimal Wear	0.89	1025	2025-02-20 23:40:39.969097+00	t
4648	Field-Tested	0.36	1025	2025-02-20 23:40:39.964098+00	t
4649	Well-Worn	0.33	1025	2025-02-20 23:40:39.975495+00	t
4650	Battle-Scarred	0.44	1025	2025-02-20 23:40:39.951098+00	t
4651	Factory New	0.3	1027	2025-02-20 23:40:27.969272+00	f
4652	Minimal Wear	0.21	1027	2025-02-20 23:40:27.986272+00	f
4653	Field-Tested	0.15	1027	2025-02-20 23:40:27.977273+00	f
4654	Well-Worn	0.23	1027	2025-02-20 23:40:27.995275+00	f
4655	Battle-Scarred	0.22	1027	2025-02-20 23:40:27.95814+00	f
4656	Factory New	1.31	1027	2025-02-20 23:40:46.442727+00	t
4657	Minimal Wear	0.64	1027	2025-02-20 23:40:46.45172+00	t
4658	Field-Tested	0.24	1027	2025-02-20 23:40:46.44772+00	t
4659	Well-Worn	0.56	1027	2025-02-20 23:40:46.45572+00	t
4660	Battle-Scarred	0.35	1027	2025-02-20 23:40:46.438482+00	t
4661	Factory New	0.34	1029	2025-02-20 23:40:21.769886+00	f
4662	Minimal Wear	0.19	1029	2025-02-20 23:40:21.778888+00	f
4663	Field-Tested	0.22	1029	2025-02-20 23:40:21.772885+00	f
4664	Well-Worn	0.15	1029	2025-02-20 23:40:21.782885+00	f
4665	Battle-Scarred	0.23	1029	2025-02-20 23:40:21.765886+00	f
4666	Factory New	1.02	1029	2025-02-20 23:40:42.493595+00	t
4667	Minimal Wear	0.55	1029	2025-02-20 23:40:42.50676+00	t
4668	Field-Tested	0.28	1029	2025-02-20 23:40:42.50176+00	t
4669	Well-Worn	0.31	1029	2025-02-20 23:40:42.510761+00	t
4670	Battle-Scarred	0.36	1029	2025-02-20 23:40:42.476594+00	t
4671	Factory New	37.94	1031	2025-02-20 23:40:15.766447+00	f
4672	Minimal Wear	16.58	1031	2025-02-20 23:40:15.77396+00	f
4673	Field-Tested	11.25	1031	2025-02-20 23:40:15.769959+00	f
4674	Well-Worn	14.35	1031	2025-02-20 23:40:15.77896+00	f
4675	Battle-Scarred	10.27	1031	2025-02-20 23:40:15.761344+00	f
4676	Factory New	103.49	1031	2025-02-20 23:40:39.391243+00	t
4677	Minimal Wear	44.91	1031	2025-02-20 23:40:39.401453+00	t
4678	Field-Tested	28.8	1031	2025-02-20 23:40:39.397454+00	t
4679	Well-Worn	\N	1031	\N	t
4680	Battle-Scarred	36.03	1031	2025-02-20 23:40:39.387243+00	t
4681	Factory New	24.66	1033	2025-02-20 23:40:29.184432+00	f
4682	Minimal Wear	16.62	1033	2025-02-20 23:40:29.215831+00	f
4683	Field-Tested	14.38	1033	2025-02-20 23:40:29.200641+00	f
4684	Well-Worn	21.16	1033	2025-02-20 23:40:29.225387+00	f
4685	Battle-Scarred	16.74	1033	2025-02-20 23:40:29.168433+00	f
4686	Factory New	91.19	1033	2025-02-20 23:40:47.05796+00	t
4687	Minimal Wear	66.37	1033	2025-02-20 23:40:47.068958+00	t
4688	Field-Tested	45.1	1033	2025-02-20 23:40:47.06396+00	t
4689	Well-Worn	40.74	1033	2025-02-20 23:40:47.072958+00	t
4690	Battle-Scarred	70.74	1033	2025-02-20 23:40:47.051959+00	t
4691	Factory New	11.61	1035	2025-02-20 23:40:07.995642+00	f
4692	Minimal Wear	6.27	1035	2025-02-20 23:40:08.033455+00	f
4693	Field-Tested	4.64	1035	2025-02-20 23:40:08.012661+00	f
4694	Well-Worn	6.6	1035	2025-02-20 23:40:08.049001+00	f
4695	Battle-Scarred	6.1	1035	2025-02-20 23:40:07.980637+00	f
4696	Factory New	29.48	1035	2025-02-20 23:40:36.088487+00	t
4697	Minimal Wear	16.3	1035	2025-02-20 23:40:36.097486+00	t
4698	Field-Tested	15.7	1035	2025-02-20 23:40:36.091486+00	t
4699	Well-Worn	17.51	1035	2025-02-20 23:40:36.102622+00	t
4700	Battle-Scarred	15.53	1035	2025-02-20 23:40:36.085486+00	t
4701	Factory New	10.36	1037	2025-02-20 23:40:25.030895+00	f
4702	Minimal Wear	4.2	1037	2025-02-20 23:40:25.040443+00	f
4703	Field-Tested	2.52	1037	2025-02-20 23:40:25.035895+00	f
4704	Well-Worn	3.7	1037	2025-02-20 23:40:25.045441+00	f
4705	Battle-Scarred	3.85	1037	2025-02-20 23:40:25.025895+00	f
4706	Factory New	21.15	1037	2025-02-20 23:40:44.911547+00	t
4707	Minimal Wear	10.36	1037	2025-02-20 23:40:44.927547+00	t
4708	Field-Tested	7.4	1037	2025-02-20 23:40:44.923548+00	t
4709	Well-Worn	8.32	1037	2025-02-20 23:40:44.939546+00	t
4710	Battle-Scarred	22.18	1037	2025-02-20 23:40:44.906547+00	t
4711	Factory New	8.45	1039	2025-02-20 23:40:31.239922+00	f
4712	Minimal Wear	4.32	1039	2025-02-20 23:40:31.257663+00	f
4713	Field-Tested	2.67	1039	2025-02-20 23:40:31.251093+00	f
4714	Well-Worn	3.91	1039	2025-02-20 23:40:31.264663+00	f
4715	Battle-Scarred	2.87	1039	2025-02-20 23:40:31.232026+00	f
4716	Factory New	18.22	1039	2025-02-15 23:05:43.645115+00	t
4717	Minimal Wear	9.87	1039	2025-02-20 23:40:47.579846+00	t
4718	Field-Tested	4.62	1039	2025-02-20 23:40:47.573844+00	t
4719	Well-Worn	5.83	1039	2025-02-20 23:40:47.584857+00	t
4720	Battle-Scarred	4.16	1039	2025-02-20 23:40:47.568844+00	t
4721	Factory New	3.7	1041	2025-02-20 23:40:52.72383+00	f
4722	Minimal Wear	2.19	1041	2025-02-20 23:40:52.739828+00	f
4723	Field-Tested	1.22	1041	2025-02-20 23:40:52.733829+00	f
4724	Well-Worn	1.84	1041	2025-02-20 23:40:52.760829+00	f
4725	Battle-Scarred	1.47	1041	2025-02-20 23:40:52.71583+00	f
4726	Factory New	12.8	1041	2025-02-20 23:40:48.557153+00	t
4727	Minimal Wear	7.53	1041	2025-02-20 23:40:48.571818+00	t
4728	Field-Tested	4.46	1041	2025-02-20 23:40:48.563107+00	t
4729	Well-Worn	5.42	1041	2025-02-20 23:40:48.575328+00	t
4730	Battle-Scarred	6.89	1041	2025-02-20 23:40:48.552153+00	t
4731	Factory New	3.52	1043	2025-02-20 23:40:06.82168+00	f
4732	Minimal Wear	1.33	1043	2025-02-20 23:40:06.839679+00	f
4733	Field-Tested	0.55	1043	2025-02-20 23:40:06.832681+00	f
4734	Well-Worn	0.58	1043	2025-02-20 23:40:06.85168+00	f
4735	Battle-Scarred	0.55	1043	2025-02-20 23:40:06.81368+00	f
4736	Factory New	11.52	1043	2025-02-20 23:40:35.823033+00	t
4737	Minimal Wear	3.41	1043	2025-02-20 23:40:35.833032+00	t
4738	Field-Tested	1.03	1043	2025-02-20 23:40:35.828034+00	t
4739	Well-Worn	1.14	1043	2025-02-20 23:40:35.836033+00	t
4740	Battle-Scarred	1.34	1043	2025-02-20 23:40:35.819857+00	t
4741	Factory New	3.56	1045	2025-02-20 23:40:15.250584+00	f
4742	Minimal Wear	1.1	1045	2025-02-20 23:40:15.259581+00	f
4743	Field-Tested	0.65	1045	2025-02-20 23:40:15.254581+00	f
4744	Well-Worn	1.1	1045	2025-02-20 23:40:15.264582+00	f
4745	Battle-Scarred	0.91	1045	2025-02-20 23:40:15.244553+00	f
4746	Factory New	13.11	1045	2025-02-20 23:40:39.128593+00	t
4747	Minimal Wear	5.34	1045	2025-02-20 23:40:39.136829+00	t
4748	Field-Tested	4.15	1045	2025-02-20 23:40:39.132829+00	t
4749	Well-Worn	4.52	1045	2025-02-20 23:40:39.14083+00	t
4750	Battle-Scarred	5.48	1045	2025-02-20 23:40:39.123594+00	t
4751	Factory New	1.71	1047	2025-02-20 23:40:11.005054+00	f
4752	Minimal Wear	0.8	1047	2025-02-20 23:40:11.01954+00	f
4753	Field-Tested	0.45	1047	2025-02-20 23:40:11.014091+00	f
4754	Well-Worn	2.96	1047	2025-02-20 23:40:11.02454+00	f
4755	Battle-Scarred	0.76	1047	2025-02-20 23:40:11.000051+00	f
4756	Factory New	3.42	1047	2025-02-20 23:40:36.950862+00	t
4757	Minimal Wear	2.23	1047	2025-02-20 23:40:36.958105+00	t
4758	Field-Tested	1.18	1047	2025-02-20 23:40:36.954105+00	t
4759	Well-Worn	1.54	1047	2025-02-20 23:40:36.962107+00	t
4760	Battle-Scarred	1.1	1047	2025-02-20 23:40:36.946863+00	t
4761	Factory New	1.39	1049	2025-02-20 23:40:21.819885+00	f
4762	Minimal Wear	0.9	1049	2025-02-20 23:40:21.829885+00	f
4763	Field-Tested	0.58	1049	2025-02-20 23:40:21.823885+00	f
4764	Factory New	3.42	1049	2025-02-20 23:40:42.53076+00	t
4765	Minimal Wear	1.63	1049	2025-02-20 23:40:42.53976+00	t
4766	Field-Tested	1.44	1049	2025-02-20 23:40:42.53476+00	t
4767	Factory New	1.93	1051	2025-02-20 23:40:12.735601+00	f
4768	Minimal Wear	0.41	1051	2025-02-20 23:40:12.752599+00	f
4769	Field-Tested	0.28	1051	2025-02-20 23:40:12.7426+00	f
4770	Well-Worn	0.23	1051	2025-02-20 23:40:12.765601+00	f
4771	Battle-Scarred	0.21	1051	2025-02-20 23:40:12.726048+00	f
4772	Factory New	10.05	1051	2025-02-20 23:40:37.586329+00	t
4773	Minimal Wear	1.93	1051	2025-02-20 23:40:37.597604+00	t
4774	Field-Tested	0.74	1051	2025-02-20 23:40:37.59133+00	t
4775	Well-Worn	0.72	1051	2025-02-20 23:40:37.606123+00	t
4776	Battle-Scarred	0.59	1051	2025-02-20 23:40:37.576331+00	t
4777	Factory New	1.82	1053	2025-02-20 23:40:23.175561+00	f
4778	Minimal Wear	0.29	1053	2025-02-20 23:40:23.187421+00	f
4779	Field-Tested	0.19	1053	2025-02-20 23:40:23.182422+00	f
4780	Well-Worn	0.36	1053	2025-02-20 23:40:23.191422+00	f
4781	Battle-Scarred	0.27	1053	2025-02-20 23:40:23.170561+00	f
4782	Factory New	5.4	1053	2025-02-20 23:40:43.186232+00	t
4783	Minimal Wear	1.37	1053	2025-02-20 23:40:43.194232+00	t
4784	Field-Tested	0.44	1053	2025-02-20 23:40:43.190233+00	t
4785	Well-Worn	0.36	1053	2025-02-20 23:40:43.199107+00	t
4786	Battle-Scarred	0.35	1053	2025-02-20 23:40:43.177232+00	t
4787	Factory New	0.62	1055	2025-02-20 23:40:11.179416+00	f
4788	Minimal Wear	0.19	1055	2025-02-20 23:40:11.188417+00	f
4789	Field-Tested	0.18	1055	2025-02-20 23:40:11.184416+00	f
4790	Well-Worn	0.13	1055	2025-02-20 23:40:11.193416+00	f
4791	Battle-Scarred	0.14	1055	2025-02-20 23:40:11.173417+00	f
4792	Factory New	3.71	1055	2025-02-20 23:40:37.027106+00	t
4793	Minimal Wear	0.72	1055	2025-02-20 23:40:37.036531+00	t
4794	Field-Tested	0.38	1055	2025-02-20 23:40:37.033106+00	t
4795	Well-Worn	0.48	1055	2025-02-20 23:40:37.04053+00	t
4796	Battle-Scarred	0.48	1055	2025-02-20 23:40:37.023106+00	t
4797	Factory New	0.88	1057	2025-02-20 23:40:19.007095+00	f
4798	Minimal Wear	0.24	1057	2025-02-20 23:40:19.017094+00	f
4799	Field-Tested	0.2	1057	2025-02-20 23:40:19.012095+00	f
4800	Well-Worn	0.37	1057	2025-02-20 23:40:19.021095+00	f
4801	Battle-Scarred	0.25	1057	2025-02-20 23:40:19.001095+00	f
4802	Factory New	3.04	1057	2025-02-20 23:40:41.464246+00	t
4803	Minimal Wear	1.13	1057	2025-02-20 23:40:41.48643+00	t
4804	Field-Tested	0.54	1057	2025-02-20 23:40:41.471245+00	t
4805	Well-Worn	1.74	1057	2025-02-20 23:40:41.49043+00	t
4806	Battle-Scarred	0.62	1057	2025-02-20 23:40:41.458245+00	t
4807	Factory New	0.43	1059	2025-02-20 23:40:04.388628+00	f
4808	Minimal Wear	0.29	1059	2025-02-20 23:40:04.397626+00	f
4809	Field-Tested	0.17	1059	2025-02-20 23:40:04.392627+00	f
4810	Well-Worn	0.26	1059	2025-02-20 23:40:04.401626+00	f
4811	Battle-Scarred	0.73	1059	2025-02-20 23:40:04.383627+00	f
4812	Factory New	1.75	1059	2025-02-20 23:40:34.80549+00	t
4813	Minimal Wear	0.68	1059	2025-02-20 23:40:34.829578+00	t
4814	Field-Tested	0.43	1059	2025-02-20 23:40:34.819575+00	t
4815	Well-Worn	0.54	1059	2025-02-20 23:40:34.84015+00	t
4816	Battle-Scarred	0.4	1059	2025-02-20 23:40:34.795686+00	t
4817	Factory New	0.35	1061	2025-02-20 23:40:18.325594+00	f
4818	Minimal Wear	0.22	1061	2025-02-20 23:40:18.338846+00	f
4819	Field-Tested	0.17	1061	2025-02-20 23:40:18.332916+00	f
4820	Well-Worn	0.12	1061	2025-02-20 23:40:18.345391+00	f
4821	Factory New	1.18	1061	2025-02-20 23:40:41.112732+00	t
4822	Minimal Wear	0.49	1061	2025-02-20 23:40:41.120729+00	t
4823	Field-Tested	0.33	1061	2025-02-20 23:40:41.116729+00	t
4824	Well-Worn	0.25	1061	2025-02-20 23:40:41.12573+00	t
4825	Factory New	0.3	1063	2025-02-20 23:40:20.875572+00	f
4826	Minimal Wear	0.2	1063	2025-02-20 23:40:20.890727+00	f
4827	Field-Tested	0.13	1063	2025-02-20 23:40:20.885723+00	f
4828	Well-Worn	0.17	1063	2025-02-20 23:40:20.89673+00	f
4829	Factory New	1.15	1063	2025-02-20 23:40:42.033099+00	t
4830	Minimal Wear	0.84	1063	2025-02-20 23:40:42.041612+00	t
4831	Field-Tested	0.55	1063	2025-02-20 23:40:42.037611+00	t
4832	Well-Worn	2.72	1063	2025-02-20 23:40:42.046612+00	t
4833	Factory New	157.63	1065	2025-02-20 23:40:00.642046+00	f
4834	Minimal Wear	92.27	1065	2025-02-20 23:40:00.681486+00	f
4835	Field-Tested	44.73	1065	2025-02-20 23:40:00.666494+00	f
4836	Well-Worn	58.43	1065	2025-02-20 23:40:00.692488+00	f
4837	Battle-Scarred	39.16	1065	2025-02-20 23:40:00.63621+00	f
4838	Factory New	391.48	1065	2025-02-20 23:40:32.398862+00	t
4839	Minimal Wear	194.57	1065	2025-02-20 23:40:32.408002+00	t
4840	Field-Tested	91.58	1065	2025-02-20 23:40:32.404004+00	t
4841	Well-Worn	122	1065	2025-02-20 23:40:32.414524+00	t
4842	Battle-Scarred	104.06	1065	2025-02-20 23:40:32.392398+00	t
4843	Factory New	84.25	1067	2025-02-20 23:40:04.814192+00	f
4844	Minimal Wear	33.13	1067	2025-02-20 23:40:04.822192+00	f
4845	Field-Tested	21.88	1067	2025-02-20 23:40:04.818191+00	f
4846	Well-Worn	19.91	1067	2025-02-20 23:40:04.826191+00	f
4847	Battle-Scarred	19.5	1067	2025-02-20 23:40:04.809191+00	f
4848	Factory New	157.34	1067	2025-02-20 23:40:35.157706+00	t
4849	Minimal Wear	87.57	1067	2025-02-20 23:40:35.167763+00	t
4850	Field-Tested	52.89	1067	2025-02-20 23:40:35.161914+00	t
4851	Well-Worn	47.69	1067	2025-02-20 23:40:35.170763+00	t
4852	Battle-Scarred	61.22	1067	2025-02-20 23:40:35.152706+00	t
4853	Factory New	46.49	1069	2025-02-20 23:40:15.550831+00	f
4854	Minimal Wear	21.59	1069	2025-02-20 23:40:15.560343+00	f
4855	Field-Tested	10.94	1069	2025-02-20 23:40:15.555346+00	f
4856	Well-Worn	11.34	1069	2025-02-20 23:40:15.566343+00	f
4857	Battle-Scarred	9.53	1069	2025-02-20 23:40:15.545526+00	f
4858	Factory New	108.4	1069	2025-02-20 23:40:39.275615+00	t
4859	Minimal Wear	51.73	1069	2025-02-20 23:40:39.285615+00	t
4860	Field-Tested	28.38	1069	2025-02-20 23:40:39.280614+00	t
4861	Well-Worn	27.83	1069	2025-02-20 23:40:39.289616+00	t
4862	Battle-Scarred	29.48	1069	2025-02-20 23:40:39.271298+00	t
4863	Factory New	16.61	1071	2025-02-20 23:40:07.634381+00	f
4864	Minimal Wear	9.5	1071	2025-02-20 23:40:07.650382+00	f
4865	Field-Tested	5.67	1071	2025-02-20 23:40:07.641381+00	f
4866	Well-Worn	6.67	1071	2025-02-20 23:40:07.659332+00	f
4867	Battle-Scarred	5.12	1071	2025-02-20 23:40:07.625383+00	f
4868	Factory New	52.64	1071	2025-02-20 23:40:36.037169+00	t
4869	Minimal Wear	20.2	1071	2025-02-20 23:40:36.04638+00	t
4870	Field-Tested	10.7	1071	2025-02-20 23:40:36.040168+00	t
4871	Well-Worn	43.58	1071	2025-02-20 23:40:36.050378+00	t
4872	Battle-Scarred	8.5	1071	2025-02-20 23:40:36.033167+00	t
4873	Factory New	16.38	1073	2025-02-20 23:40:30.271202+00	f
4874	Minimal Wear	8.09	1073	2025-02-20 23:40:30.292093+00	f
4875	Field-Tested	4.79	1073	2025-02-20 23:40:30.281887+00	f
4876	Well-Worn	5.42	1073	2025-02-20 23:40:30.305936+00	f
4877	Battle-Scarred	4.07	1073	2025-02-20 23:40:30.259101+00	f
4878	Factory New	36.28	1073	2025-02-20 23:40:47.347728+00	t
4879	Minimal Wear	17.46	1073	2025-02-20 23:40:47.355727+00	t
4880	Field-Tested	9	1073	2025-02-20 23:40:47.351727+00	t
4881	Well-Worn	\N	1073	\N	t
4882	Battle-Scarred	13.1	1073	2025-02-20 23:40:47.340728+00	t
4883	Factory New	5	1075	2025-02-20 23:40:03.746782+00	f
4884	Minimal Wear	2.85	1075	2025-02-20 23:40:03.756783+00	f
4885	Field-Tested	1.91	1075	2025-02-20 23:40:03.751783+00	f
4886	Well-Worn	2.49	1075	2025-02-20 23:40:03.761783+00	f
4887	Battle-Scarred	1.77	1075	2025-02-20 23:40:03.741783+00	f
4888	Factory New	14.8	1075	2025-02-20 23:40:34.371819+00	t
4889	Minimal Wear	9.22	1075	2025-02-20 23:40:34.383954+00	t
4890	Field-Tested	5.99	1075	2025-02-20 23:40:34.377818+00	t
4891	Well-Worn	7	1075	2025-02-20 23:40:34.387953+00	t
4892	Battle-Scarred	5.85	1075	2025-02-20 23:40:34.367819+00	t
4893	Factory New	3.88	1077	2025-02-20 23:40:22.2748+00	f
4894	Minimal Wear	1.49	1077	2025-02-20 23:40:22.285313+00	f
4895	Field-Tested	0.73	1077	2025-02-20 23:40:22.2808+00	f
4896	Well-Worn	0.8	1077	2025-02-20 23:40:22.289313+00	f
4897	Battle-Scarred	0.77	1077	2025-02-20 23:40:22.2708+00	f
4898	Factory New	10.77	1077	2025-02-20 23:40:42.671931+00	t
4899	Minimal Wear	3.32	1077	2025-02-20 23:40:42.680932+00	t
4900	Field-Tested	1.63	1077	2025-02-20 23:40:42.675932+00	t
4901	Well-Worn	1.74	1077	2025-02-20 23:40:42.686452+00	t
4902	Battle-Scarred	1.72	1077	2025-02-20 23:40:42.667931+00	t
4903	Factory New	3.78	1079	2025-02-20 23:40:04.12573+00	f
4904	Minimal Wear	1.48	1079	2025-02-20 23:40:04.134731+00	f
4905	Field-Tested	0.94	1079	2025-02-20 23:40:04.13073+00	f
4906	Well-Worn	2.96	1079	2025-02-20 23:40:04.13873+00	f
4907	Battle-Scarred	1.03	1079	2025-02-20 23:40:04.120729+00	f
4908	Factory New	10.39	1079	2025-02-20 23:40:34.631126+00	t
4909	Minimal Wear	4.29	1079	2025-02-20 23:40:34.642298+00	t
4910	Field-Tested	2.45	1079	2025-02-20 23:40:34.637644+00	t
4911	Well-Worn	1.92	1079	2025-02-20 23:40:34.6483+00	t
4912	Battle-Scarred	2.23	1079	2025-02-20 23:40:34.627125+00	t
4913	Factory New	3.58	1081	2025-02-20 23:40:19.399479+00	f
4914	Minimal Wear	1.54	1081	2025-02-20 23:40:19.407479+00	f
4915	Field-Tested	0.78	1081	2025-02-20 23:40:19.40348+00	f
4916	Well-Worn	1.16	1081	2025-02-20 23:40:19.412481+00	f
4917	Battle-Scarred	0.75	1081	2025-02-20 23:40:19.39548+00	f
4918	Factory New	6.65	1081	2025-02-20 23:40:41.630759+00	t
4919	Minimal Wear	3.81	1081	2025-02-20 23:40:41.63876+00	t
4920	Field-Tested	1.62	1081	2025-02-20 23:40:41.634759+00	t
4921	Well-Worn	2.25	1081	2025-02-20 23:40:41.643759+00	t
4922	Battle-Scarred	1.6	1081	2025-02-20 23:40:41.625759+00	t
4923	Factory New	3.2	1083	2025-02-20 23:40:10.537405+00	f
4924	Minimal Wear	1.58	1083	2025-02-20 23:40:10.557765+00	f
4925	Field-Tested	0.75	1083	2025-02-20 23:40:10.547766+00	f
4926	Well-Worn	0.75	1083	2025-02-20 23:40:10.580045+00	f
4927	Battle-Scarred	0.82	1083	2025-02-20 23:40:10.522421+00	f
4928	Factory New	6.86	1083	2025-02-20 23:40:36.815136+00	t
4929	Minimal Wear	3.24	1083	2025-02-20 23:40:36.824198+00	t
4930	Field-Tested	1.45	1083	2025-02-20 23:40:36.820166+00	t
4931	Well-Worn	1.92	1083	2025-02-20 23:40:36.829199+00	t
4932	Battle-Scarred	1.25	1083	2025-02-20 23:40:36.809566+00	t
4933	Factory New	1.79	1085	2025-02-20 23:40:25.180009+00	f
4934	Minimal Wear	0.33	1085	2025-02-20 23:40:25.19001+00	f
4935	Field-Tested	0.24	1085	2025-02-20 23:40:25.185009+00	f
4936	Well-Worn	0.2	1085	2025-02-20 23:40:25.197009+00	f
4937	Battle-Scarred	0.2	1085	2025-02-20 23:40:25.174009+00	f
4938	Factory New	5.74	1085	2025-02-20 23:40:44.989438+00	t
4939	Minimal Wear	1.31	1085	2025-02-20 23:40:45.005438+00	t
4940	Field-Tested	0.49	1085	2025-02-20 23:40:45.000438+00	t
4941	Well-Worn	0.35	1085	2025-02-20 23:40:45.016445+00	t
4942	Battle-Scarred	0.34	1085	2025-02-20 23:40:44.985439+00	t
4943	Factory New	1.46	1087	2025-02-20 23:40:50.274807+00	f
4944	Minimal Wear	0.34	1087	2025-02-20 23:40:50.347938+00	f
4945	Field-Tested	0.23	1087	2025-02-20 23:40:50.323303+00	f
4946	Well-Worn	0.22	1087	2025-02-20 23:40:50.375939+00	f
4947	Battle-Scarred	0.27	1087	2025-02-20 23:40:50.250807+00	f
4948	Factory New	3.85	1087	2025-02-20 23:40:47.974673+00	t
4949	Minimal Wear	1.04	1087	2025-02-20 23:40:47.983671+00	t
4950	Field-Tested	0.49	1087	2025-02-20 23:40:47.979673+00	t
4951	Well-Worn	0.39	1087	2025-02-20 23:40:47.987671+00	t
4952	Battle-Scarred	0.35	1087	2025-02-20 23:40:47.969671+00	t
4953	Factory New	1.3	1089	2025-02-20 23:40:13.519738+00	f
4954	Minimal Wear	0.48	1089	2025-02-20 23:40:13.531738+00	f
4955	Field-Tested	0.24	1089	2025-02-20 23:40:13.524738+00	f
4956	Well-Worn	0.33	1089	2025-02-20 23:40:13.535738+00	f
4957	Battle-Scarred	0.34	1089	2025-02-20 23:40:13.515738+00	f
4958	Factory New	5.13	1089	2025-02-20 23:40:38.143599+00	t
4959	Minimal Wear	1.19	1089	2025-02-20 23:40:38.171809+00	t
4960	Field-Tested	0.74	1089	2025-02-20 23:40:38.157805+00	t
4961	Well-Worn	0.76	1089	2025-02-20 23:40:38.17702+00	t
4962	Battle-Scarred	0.72	1089	2025-02-20 23:40:38.139598+00	t
4963	Factory New	1.05	1091	2025-02-20 23:40:19.788542+00	f
4964	Minimal Wear	0.53	1091	2025-02-20 23:40:19.801542+00	f
4965	Field-Tested	0.29	1091	2025-02-20 23:40:19.792542+00	f
4966	Well-Worn	0.49	1091	2025-02-20 23:40:19.807541+00	f
4967	Battle-Scarred	0.32	1091	2025-02-20 23:40:19.783543+00	f
4968	Factory New	2.5	1091	2025-02-20 23:40:41.777808+00	t
4969	Minimal Wear	1.28	1091	2025-02-20 23:40:41.787752+00	t
4970	Field-Tested	0.66	1091	2025-02-20 23:40:41.784239+00	t
4971	Well-Worn	1.47	1091	2025-02-20 23:40:41.791752+00	t
4972	Battle-Scarred	0.72	1091	2025-02-20 23:40:41.773807+00	t
4973	Factory New	0.45	1093	2025-02-20 23:40:01.410966+00	f
4974	Minimal Wear	0.33	1093	2025-02-20 23:40:01.418964+00	f
4975	Field-Tested	0.22	1093	2025-02-20 23:40:01.414964+00	f
4976	Well-Worn	0.21	1093	2025-02-20 23:40:01.43905+00	f
4977	Battle-Scarred	0.24	1093	2025-02-20 23:40:01.404964+00	f
4978	Factory New	1.33	1093	2025-02-20 23:40:33.006046+00	t
4979	Minimal Wear	0.77	1093	2025-02-20 23:40:33.050216+00	t
4980	Field-Tested	0.33	1093	2025-02-20 23:40:33.031049+00	t
4981	Well-Worn	0.37	1093	2025-02-20 23:40:33.067637+00	t
4982	Battle-Scarred	0.37	1093	2025-02-20 23:40:32.999124+00	t
4983	Factory New	0.46	1095	2025-02-20 23:40:06.869681+00	f
4984	Minimal Wear	0.32	1095	2025-02-20 23:40:06.889828+00	f
4985	Field-Tested	0.24	1095	2025-02-20 23:40:06.881836+00	f
4986	Well-Worn	0.24	1095	2025-02-20 23:40:06.901829+00	f
4987	Battle-Scarred	0.26	1095	2025-02-20 23:40:06.85968+00	f
4988	Factory New	1.14	1095	2025-02-20 23:40:35.844229+00	t
4989	Minimal Wear	0.81	1095	2025-02-20 23:40:35.852229+00	t
4990	Field-Tested	0.41	1095	2025-02-20 23:40:35.849229+00	t
4991	Well-Worn	0.45	1095	2025-02-20 23:40:35.856229+00	t
4992	Battle-Scarred	4.43	1095	2025-02-20 23:40:35.840033+00	t
4993	Factory New	0.55	1097	2025-02-20 23:40:27.215455+00	f
4994	Minimal Wear	0.53	1097	2025-02-20 23:40:27.222456+00	f
4995	Field-Tested	0.22	1097	2025-02-20 23:40:27.218454+00	f
4996	Well-Worn	0.89	1097	2025-02-20 23:40:27.227456+00	f
4997	Battle-Scarred	0.18	1097	2025-02-20 23:40:27.210942+00	f
4998	Factory New	1.36	1097	2025-02-20 23:40:46.047787+00	t
4999	Minimal Wear	0.63	1097	2025-02-20 23:40:46.056785+00	t
5000	Field-Tested	0.32	1097	2025-02-20 23:40:46.051784+00	t
5001	Well-Worn	0.87	1097	2025-02-20 23:40:46.059785+00	t
5002	Battle-Scarred	0.3	1097	2025-02-20 23:40:46.041783+00	t
5003	Factory New	767.85	1099	2025-02-20 23:40:01.288309+00	f
5004	Minimal Wear	509.97	1099	2025-02-20 23:40:01.30031+00	f
5005	Field-Tested	254.83	1099	2025-02-20 23:40:01.29231+00	f
5006	Well-Worn	175.63	1099	2025-02-20 23:40:01.305309+00	f
5007	Battle-Scarred	144.15	1099	2025-02-20 23:40:01.28431+00	f
5008	Factory New	1470.23	1099	2025-02-20 23:40:32.897002+00	t
5009	Minimal Wear	939.02	1099	2025-02-20 23:40:32.92542+00	t
5010	Field-Tested	458.28	1099	2025-02-20 23:40:32.91025+00	t
5011	Well-Worn	269.06	1099	2025-02-20 23:40:32.938135+00	t
5012	Battle-Scarred	191.34	1099	2025-02-20 23:40:32.889041+00	t
5013	Factory New	12.72	1101	2025-02-20 23:40:15.888798+00	f
5014	Minimal Wear	8.54	1101	2025-02-20 23:40:15.898798+00	f
5015	Field-Tested	6.37	1101	2025-02-20 23:40:15.892798+00	f
5016	Well-Worn	13.02	1101	2025-02-20 23:40:15.902799+00	f
5017	Battle-Scarred	9.31	1101	2025-02-20 23:40:15.885798+00	f
5018	Factory New	38.4	1101	2025-02-20 23:40:39.43082+00	t
5019	Minimal Wear	20.79	1101	2025-02-20 23:40:39.439189+00	t
5020	Field-Tested	25.65	1101	2025-02-20 23:40:39.434187+00	t
5021	Well-Worn	98.79	1101	2025-02-20 23:40:39.443188+00	t
5022	Battle-Scarred	18.51	1101	2025-02-15 23:05:40.268178+00	t
5023	Factory New	92.41	1103	2025-02-20 23:40:14.678561+00	f
5024	Minimal Wear	53.53	1103	2025-02-20 23:40:14.68956+00	f
5025	Field-Tested	43.46	1103	2025-02-20 23:40:14.682561+00	f
5026	Well-Worn	42.11	1103	2025-02-20 23:40:14.696561+00	f
5027	Battle-Scarred	45.39	1103	2025-02-20 23:40:14.67156+00	f
5028	Factory New	167	1103	2025-02-20 23:40:38.89601+00	t
5029	Minimal Wear	93.88	1103	2025-02-20 23:40:38.90401+00	t
5030	Field-Tested	63.44	1103	2025-02-20 23:40:38.900009+00	t
5031	Well-Worn	63.41	1103	2025-02-20 23:40:38.908009+00	t
5032	Battle-Scarred	66.32	1103	2025-02-20 23:40:38.869473+00	t
5033	Factory New	66.54	1105	2025-02-20 23:40:27.430677+00	f
5034	Minimal Wear	54.72	1105	2025-02-20 23:40:27.437676+00	f
5035	Field-Tested	42.1	1105	2025-02-20 23:40:27.434678+00	f
5036	Well-Worn	45.68	1105	2025-02-15 23:05:35.969131+00	f
5037	Battle-Scarred	47	1105	2025-02-20 23:40:27.424476+00	f
5038	Factory New	111.33	1105	2025-02-20 23:40:46.204824+00	t
5039	Minimal Wear	97.11	1105	2025-02-20 23:40:46.213822+00	t
5040	Field-Tested	56.86	1105	2025-02-20 23:40:46.20882+00	t
5041	Well-Worn	67.41	1105	2025-02-15 18:32:02.441631+00	t
5042	Battle-Scarred	89.44	1105	2025-02-20 23:40:46.200266+00	t
5043	Factory New	64.28	1107	2025-02-20 23:40:52.587698+00	f
5044	Minimal Wear	55.23	1107	2025-02-20 23:40:52.607243+00	f
5045	Field-Tested	47.57	1107	2025-02-20 23:40:52.598244+00	f
5046	Well-Worn	54.39	1107	2025-02-20 23:40:52.621243+00	f
5047	Factory New	131.23	1107	2025-02-20 23:40:48.509152+00	t
5048	Minimal Wear	108.42	1107	2025-02-20 23:40:48.519152+00	t
5049	Field-Tested	104.77	1107	2025-02-20 23:40:48.515152+00	t
5050	Well-Worn	102.83	1107	2025-02-15 23:05:44.154448+00	t
5051	Factory New	67.97	1109	2025-02-20 23:40:53.391511+00	f
5052	Minimal Wear	60.29	1109	2025-02-20 23:40:53.410511+00	f
5053	Field-Tested	65.23	1109	2025-02-20 23:40:53.400511+00	f
5054	Well-Worn	101.06	1109	2025-02-20 23:40:53.423511+00	f
5055	Battle-Scarred	\N	1109	\N	f
5056	Factory New	140.71	1109	2025-02-20 23:40:48.740588+00	t
5057	Minimal Wear	123.49	1109	2025-02-20 23:40:48.750589+00	t
5058	Field-Tested	96.26	1109	2025-02-20 23:40:48.74559+00	t
5059	Well-Worn	\N	1109	\N	t
5060	Battle-Scarred	422.06	1109	2025-02-20 23:40:48.736588+00	t
5061	Factory New	11.1	1111	2025-02-20 23:40:54.503298+00	f
5062	Minimal Wear	10.09	1111	2025-02-20 23:40:54.514299+00	f
5063	Field-Tested	8.65	1111	2025-02-20 23:40:54.508298+00	f
5064	Well-Worn	9.68	1111	2025-02-20 23:40:54.519298+00	f
5065	Battle-Scarred	\N	1111	\N	f
5066	Factory New	33.97	1111	2025-02-20 23:40:49.013925+00	t
5067	Minimal Wear	15.03	1111	2025-02-20 23:40:49.020924+00	t
5068	Field-Tested	13.41	1111	2025-02-20 23:40:49.017924+00	t
5069	Well-Worn	\N	1111	\N	t
5070	Battle-Scarred	\N	1111	\N	t
5071	Factory New	10.74	1113	2025-02-20 23:40:02.398651+00	f
5072	Minimal Wear	9.65	1113	2025-02-20 23:40:02.429166+00	f
5073	Field-Tested	8.36	1113	2025-02-20 23:40:02.41465+00	f
5074	Well-Worn	8.47	1113	2025-02-20 23:40:02.437981+00	f
5075	Battle-Scarred	10.3	1113	2025-02-20 23:40:02.393653+00	f
5076	Factory New	18.58	1113	2025-02-20 23:40:33.711044+00	t
5077	Minimal Wear	13.62	1113	2025-02-20 23:40:33.724266+00	t
5078	Field-Tested	13.78	1113	2025-02-20 23:40:33.718044+00	t
5079	Well-Worn	13.91	1113	2025-02-20 23:40:33.730267+00	t
5080	Battle-Scarred	16.85	1113	2025-02-20 23:40:33.706044+00	t
5081	Factory New	11.74	1115	2025-02-20 23:40:17.571504+00	f
5082	Minimal Wear	10.76	1115	2025-02-20 23:40:17.580504+00	f
5083	Field-Tested	10.53	1115	2025-02-20 23:40:17.575504+00	f
5084	Well-Worn	10.51	1115	2025-02-15 23:05:31.598318+00	f
5085	Battle-Scarred	16.17	1115	2025-02-20 23:40:17.568507+00	f
5086	Factory New	19.95	1115	2025-02-20 23:40:40.572773+00	t
5087	Minimal Wear	16.09	1115	2025-02-20 23:40:40.580773+00	t
5088	Field-Tested	15.99	1115	2025-02-20 23:40:40.575773+00	t
5089	Well-Worn	19.28	1115	2025-02-20 23:40:40.585773+00	t
5090	Battle-Scarred	\N	1115	\N	t
5091	Factory New	11.45	1117	2025-02-20 23:40:25.330821+00	f
5092	Minimal Wear	9.94	1117	2025-02-20 23:40:25.340395+00	f
5093	Field-Tested	8.92	1117	2025-02-20 23:40:25.33482+00	f
5094	Well-Worn	9.35	1117	2025-02-20 23:40:25.345397+00	f
5095	Battle-Scarred	14.45	1117	2025-02-20 23:40:25.32582+00	f
5096	Factory New	17.99	1117	2025-02-20 23:40:45.144871+00	t
5097	Minimal Wear	15.96	1117	2025-02-20 23:40:45.164071+00	t
5098	Field-Tested	12.7	1117	2025-02-20 23:40:45.152071+00	t
5099	Well-Worn	13.8	1117	2025-02-15 18:33:14.005715+00	t
5100	Battle-Scarred	16.58	1117	2025-02-20 23:40:45.131827+00	t
5101	Factory New	13.4	1119	2025-02-20 23:40:16.889892+00	f
5102	Minimal Wear	10.91	1119	2025-02-20 23:40:16.898891+00	f
5103	Field-Tested	11.62	1119	2025-02-20 23:40:16.892892+00	f
5104	Well-Worn	21.06	1119	2025-02-20 23:40:16.906407+00	f
5105	Battle-Scarred	108.72	1119	2025-02-15 19:00:23.313083+00	f
5106	Factory New	20.94	1119	2025-02-20 23:40:40.002137+00	t
5107	Minimal Wear	16.32	1119	2025-02-20 23:40:40.027137+00	t
5108	Field-Tested	15.3	1119	2025-02-20 23:40:40.012141+00	t
5109	Well-Worn	25.27	1119	2025-02-20 23:40:40.03866+00	t
5110	Battle-Scarred	\N	1119	\N	t
5111	Factory New	8.57	1121	2025-02-20 23:40:04.349626+00	f
5112	Minimal Wear	7.35	1121	2025-02-20 23:40:04.357627+00	f
5113	Field-Tested	7.14	1121	2025-02-20 23:40:04.352626+00	f
5114	Well-Worn	29.84	1121	2025-02-15 19:08:11.451486+00	f
5115	Battle-Scarred	\N	1121	\N	f
5116	Factory New	22.04	1121	2025-02-20 23:40:34.700098+00	t
5117	Minimal Wear	4.74	1121	2025-02-20 23:40:34.721136+00	t
5118	Field-Tested	3.04	1121	2025-02-20 23:40:34.708098+00	t
5119	Well-Worn	\N	1121	\N	t
5120	Battle-Scarred	4.39	1121	2025-02-20 23:40:34.694098+00	t
5121	Factory New	14.39	1123	2025-02-20 23:40:49.708931+00	f
5122	Minimal Wear	4.3	1123	2025-02-20 23:40:49.722376+00	f
5123	Field-Tested	3.41	1123	2025-02-20 23:40:49.718088+00	f
5124	Well-Worn	3.43	1123	2025-02-20 23:40:49.727775+00	f
5125	Battle-Scarred	3.18	1123	2025-02-20 23:40:49.704931+00	f
5126	Factory New	32.59	1123	2025-02-20 23:40:47.853576+00	t
5127	Minimal Wear	6.78	1123	2025-02-20 23:40:47.860576+00	t
5128	Field-Tested	3.98	1123	2025-02-20 23:40:47.856577+00	t
5129	Well-Worn	3.54	1123	2025-02-20 23:40:47.864576+00	t
5130	Battle-Scarred	3.02	1123	2025-02-20 23:40:47.849576+00	t
5131	Factory New	3.5	1125	2025-02-20 23:40:24.569036+00	f
5132	Minimal Wear	2.66	1125	2025-02-20 23:40:24.592071+00	f
5133	Field-Tested	3.74	1125	2025-02-20 23:40:24.573036+00	f
5134	Well-Worn	3.67	1125	2025-02-15 23:05:34.717369+00	f
5135	Battle-Scarred	6.45	1125	2025-02-15 23:05:34.707112+00	f
5136	Factory New	14.23	1125	2025-02-20 23:40:44.371589+00	t
5137	Minimal Wear	5.11	1125	2025-02-15 23:05:42.395497+00	t
5138	Field-Tested	3.41	1125	2025-02-20 23:40:44.391589+00	t
5139	Well-Worn	23.34	1125	2025-02-20 23:40:44.409589+00	t
5140	Battle-Scarred	56.38	1125	2025-02-20 23:40:44.355589+00	t
5141	Factory New	6.37	1127	2025-02-20 23:40:06.770648+00	f
5142	Minimal Wear	4.35	1127	2025-02-20 23:40:06.792648+00	f
5143	Field-Tested	5.37	1127	2025-02-20 23:40:06.780648+00	f
5144	Well-Worn	20.46	1127	2025-02-20 23:40:06.804648+00	f
5145	Factory New	6.66	1127	2025-02-20 23:40:35.802074+00	t
5146	Minimal Wear	4.06	1127	2025-02-20 23:40:35.81186+00	t
5147	Field-Tested	4.44	1127	2025-02-20 23:40:35.807074+00	t
5148	Well-Worn	24.92	1127	2025-02-20 23:40:35.815856+00	t
5149	Factory New	4.24	1129	2025-02-20 23:40:11.66369+00	f
5150	Minimal Wear	3.03	1129	2025-02-20 23:40:11.681679+00	f
5151	Field-Tested	2.13	1129	2025-02-20 23:40:11.67468+00	f
5152	Well-Worn	2.66	1129	2025-02-20 23:40:11.685679+00	f
5153	Battle-Scarred	2.04	1129	2025-02-20 23:40:11.652679+00	f
5154	Factory New	6.55	1129	2025-02-20 23:40:37.192713+00	t
5155	Minimal Wear	3.79	1129	2025-02-20 23:40:37.204713+00	t
5156	Field-Tested	2.05	1129	2025-02-20 23:40:37.200713+00	t
5157	Well-Worn	2.54	1129	2025-02-20 23:40:37.208713+00	t
5158	Battle-Scarred	1.71	1129	2025-02-20 23:40:37.188576+00	t
5159	Factory New	2.8	1131	2025-02-20 23:40:04.589521+00	f
5160	Minimal Wear	2.04	1131	2025-02-20 23:40:04.611185+00	f
5161	Field-Tested	1.87	1131	2025-02-20 23:40:04.603868+00	f
5162	Well-Worn	1.73	1131	2025-02-20 23:40:04.615697+00	f
5163	Battle-Scarred	1.73	1131	2025-02-20 23:40:04.58652+00	f
5164	Factory New	4.44	1131	2025-02-20 23:40:34.963944+00	t
5165	Minimal Wear	2.31	1131	2025-02-20 23:40:34.972944+00	t
5166	Field-Tested	1.98	1131	2025-02-20 23:40:34.967942+00	t
5167	Well-Worn	1.82	1131	2025-02-20 23:40:34.977553+00	t
5168	Battle-Scarred	1.5	1131	2025-02-20 23:40:34.957942+00	t
5169	Factory New	2.32	1133	2025-02-20 23:40:24.760954+00	f
5170	Minimal Wear	2.08	1133	2025-02-20 23:40:24.774468+00	f
5171	Field-Tested	1.91	1133	2025-02-20 23:40:24.768957+00	f
5172	Factory New	4.13	1133	2025-02-20 23:40:44.724279+00	t
5173	Minimal Wear	2.46	1133	2025-02-20 23:40:44.738009+00	t
5174	Field-Tested	2.52	1133	2025-02-20 23:40:44.733008+00	t
5175	Factory New	3.22	1135	2025-02-20 23:40:22.999412+00	f
5176	Minimal Wear	2.26	1135	2025-02-20 23:40:23.031118+00	f
5177	Field-Tested	2	1135	2025-02-20 23:40:23.024604+00	f
5178	Well-Worn	2.13	1135	2025-02-20 23:40:23.036119+00	f
5179	Battle-Scarred	2.02	1135	2025-02-20 23:40:22.987779+00	f
5180	Factory New	5.89	1135	2025-02-20 23:40:43.141115+00	t
5181	Minimal Wear	3.6	1135	2025-02-20 23:40:43.152114+00	t
5182	Field-Tested	2.96	1135	2025-02-20 23:40:43.147116+00	t
5183	Well-Worn	2.78	1135	2025-02-20 23:40:43.156152+00	t
5184	Battle-Scarred	2.49	1135	2025-02-20 23:40:43.137114+00	t
5185	Field-Tested	2.31	1137	2025-02-20 23:40:29.796747+00	f
5186	Well-Worn	1.77	1137	2025-02-20 23:40:29.804748+00	f
5187	Battle-Scarred	1.85	1137	2025-02-20 23:40:29.789112+00	f
5188	Field-Tested	2.96	1137	2025-02-20 23:40:47.235138+00	t
5189	Well-Worn	3.41	1137	2025-02-20 23:40:47.238139+00	t
5190	Battle-Scarred	4.13	1137	2025-02-20 23:40:47.226106+00	t
5191	Factory New	213.7	1139	2025-02-20 23:40:00.425554+00	f
5192	Minimal Wear	156.09	1139	2025-02-20 23:40:00.436555+00	f
5193	Field-Tested	124.07	1139	2025-02-20 23:40:00.430554+00	f
5194	Well-Worn	108.81	1139	2025-02-20 23:40:00.441554+00	f
5195	Battle-Scarred	88.39	1139	2025-02-20 23:40:00.414349+00	f
5196	Factory New	497.94	1139	2025-02-20 23:40:31.992325+00	t
5197	Minimal Wear	263.1	1139	2025-02-20 23:40:32.036415+00	t
5198	Field-Tested	163.65	1139	2025-02-20 23:40:32.016292+00	t
5199	Well-Worn	178.95	1139	2025-02-20 23:40:32.051017+00	t
5200	Battle-Scarred	147.69	1139	2025-02-20 23:40:31.970256+00	t
5201	Factory New	143.33	1141	2025-02-20 23:40:02.87593+00	f
5202	Minimal Wear	78.4	1141	2025-02-20 23:40:02.906928+00	f
5203	Field-Tested	40	1141	2025-02-20 23:40:02.88593+00	f
5204	Well-Worn	28.07	1141	2025-02-20 23:40:02.916443+00	f
5205	Battle-Scarred	21.53	1141	2025-02-20 23:40:02.866929+00	f
5206	Factory New	292.79	1141	2025-02-20 23:40:33.901878+00	t
5207	Minimal Wear	129.4	1141	2025-02-20 23:40:33.924336+00	t
5208	Field-Tested	70.2	1141	2025-02-20 23:40:33.910876+00	t
5209	Well-Worn	51.97	1141	2025-02-20 23:40:33.934841+00	t
5210	Battle-Scarred	53.09	1141	2025-02-20 23:40:33.892443+00	t
5211	Factory New	24.05	1143	2025-02-20 23:40:14.755072+00	f
5212	Minimal Wear	14.45	1143	2025-02-20 23:40:14.779459+00	f
5213	Field-Tested	10.54	1143	2025-02-20 23:40:14.762078+00	f
5214	Well-Worn	13.31	1143	2025-02-20 23:40:14.784459+00	f
5215	Battle-Scarred	10.72	1143	2025-02-20 23:40:14.740561+00	f
5216	Factory New	67.06	1143	2025-02-20 23:40:38.964735+00	t
5217	Minimal Wear	38.45	1143	2025-02-20 23:40:38.977523+00	t
5218	Field-Tested	25.86	1143	2025-02-20 23:40:38.969735+00	t
5219	Well-Worn	35.52	1143	2025-02-20 23:40:38.988194+00	t
5220	Battle-Scarred	26.48	1143	2025-02-20 23:40:38.959735+00	t
5221	Factory New	23.56	1145	2025-02-20 23:40:52.982568+00	f
5222	Minimal Wear	13.98	1145	2025-02-20 23:40:53.001463+00	f
5223	Field-Tested	8.98	1145	2025-02-20 23:40:52.991919+00	f
5224	Well-Worn	8.29	1145	2025-02-20 23:40:53.009271+00	f
5225	Battle-Scarred	7.53	1145	2025-02-20 23:40:52.9742+00	f
5226	Factory New	64.88	1145	2025-02-20 23:40:48.625515+00	t
5227	Minimal Wear	29.56	1145	2025-02-20 23:40:48.635177+00	t
5228	Field-Tested	21.79	1145	2025-02-20 23:40:48.630516+00	t
5229	Well-Worn	20.92	1145	2025-02-20 23:40:48.638171+00	t
5230	Battle-Scarred	18.55	1145	2025-02-20 23:40:48.621516+00	t
5231	Factory New	19.28	1147	2025-02-20 23:40:55.216159+00	f
5232	Minimal Wear	11.79	1147	2025-02-20 23:40:55.224158+00	f
5233	Field-Tested	8.12	1147	2025-02-20 23:40:55.219159+00	f
5234	Well-Worn	8.34	1147	2025-02-20 23:40:55.230159+00	f
5235	Battle-Scarred	7.97	1147	2025-02-20 23:40:55.211159+00	f
5236	Factory New	43.83	1147	2025-02-20 23:40:49.322+00	t
5237	Minimal Wear	27.97	1147	2025-02-20 23:40:49.334001+00	t
5238	Field-Tested	18.69	1147	2025-02-20 23:40:49.330001+00	t
5239	Well-Worn	20.13	1147	2025-02-20 23:40:49.337001+00	t
5240	Battle-Scarred	16.08	1147	2025-02-20 23:40:49.319+00	t
5241	Factory New	3.19	1149	2025-02-20 23:40:15.935798+00	f
5242	Minimal Wear	1.52	1149	2025-02-20 23:40:15.945799+00	f
5243	Field-Tested	0.99	1149	2025-02-20 23:40:15.939798+00	f
5244	Well-Worn	0.92	1149	2025-02-20 23:40:15.949798+00	f
5245	Battle-Scarred	0.82	1149	2025-02-20 23:40:15.932797+00	f
5246	Factory New	11.87	1149	2025-02-20 23:40:39.487413+00	t
5247	Minimal Wear	3.84	1149	2025-02-20 23:40:39.496412+00	t
5248	Field-Tested	2.46	1149	2025-02-20 23:40:39.491411+00	t
5249	Well-Worn	2.21	1149	2025-02-20 23:40:39.501217+00	t
5250	Battle-Scarred	2.77	1149	2025-02-20 23:40:39.483411+00	t
5251	Factory New	2.97	1151	2025-02-20 23:40:19.262224+00	f
5252	Minimal Wear	1.49	1151	2025-02-20 23:40:19.271749+00	f
5253	Field-Tested	0.92	1151	2025-02-20 23:40:19.267093+00	f
5254	Well-Worn	0.89	1151	2025-02-20 23:40:19.275749+00	f
5255	Battle-Scarred	0.84	1151	2025-02-20 23:40:19.256071+00	f
5256	Factory New	6.23	1151	2025-02-20 23:40:41.54346+00	t
5257	Minimal Wear	3.13	1151	2025-02-20 23:40:41.55346+00	t
5258	Field-Tested	2.05	1151	2025-02-20 23:40:41.549461+00	t
5259	Well-Worn	1.81	1151	2025-02-20 23:40:41.55746+00	t
5260	Battle-Scarred	1.72	1151	2025-02-20 23:40:41.53946+00	t
5261	Factory New	2.62	1153	2025-02-20 23:40:12.253742+00	f
5262	Minimal Wear	1.66	1153	2025-02-20 23:40:12.264743+00	f
5263	Field-Tested	0.9	1153	2025-02-20 23:40:12.257741+00	f
5264	Well-Worn	1.33	1153	2025-02-20 23:40:12.268742+00	f
5265	Battle-Scarred	1.13	1153	2025-02-20 23:40:12.248755+00	f
5266	Factory New	8.42	1153	2025-02-20 23:40:37.387692+00	t
5267	Minimal Wear	5.21	1153	2025-02-20 23:40:37.398249+00	t
5268	Field-Tested	2.88	1153	2025-02-20 23:40:37.391691+00	t
5269	Well-Worn	4.11	1153	2025-02-20 23:40:37.404519+00	t
5270	Battle-Scarred	2.69	1153	2025-02-20 23:40:37.383693+00	t
5271	Factory New	2.96	1155	2025-02-20 23:40:09.457962+00	f
5272	Minimal Wear	1.52	1155	2025-02-20 23:40:09.467962+00	f
5273	Field-Tested	0.93	1155	2025-02-20 23:40:09.462962+00	f
5274	Well-Worn	0.92	1155	2025-02-20 23:40:09.470961+00	f
5275	Battle-Scarred	0.8	1155	2025-02-20 23:40:09.453962+00	f
5276	Factory New	7.24	1155	2025-02-20 23:40:36.501303+00	t
5277	Minimal Wear	3.27	1155	2025-02-20 23:40:36.509303+00	t
5278	Field-Tested	1.98	1155	2025-02-20 23:40:36.505303+00	t
5279	Well-Worn	1.8	1155	2025-02-20 23:40:36.515304+00	t
5280	Battle-Scarred	1.86	1155	2025-02-20 23:40:36.494066+00	t
5281	Factory New	2.47	1157	2025-02-20 23:40:29.98806+00	f
5282	Minimal Wear	1.3	1157	2025-02-20 23:40:30.004257+00	f
5283	Field-Tested	0.97	1157	2025-02-20 23:40:29.99626+00	f
5284	Well-Worn	0.92	1157	2025-02-20 23:40:30.011258+00	f
5285	Battle-Scarred	0.8	1157	2025-02-20 23:40:29.98006+00	f
5286	Factory New	5.72	1157	2025-02-20 23:40:47.27117+00	t
5287	Minimal Wear	3.31	1157	2025-02-20 23:40:47.283727+00	t
5288	Field-Tested	1.87	1157	2025-02-20 23:40:47.277171+00	t
5289	Well-Worn	1.86	1157	2025-02-20 23:40:47.287728+00	t
5290	Battle-Scarred	1.84	1157	2025-02-20 23:40:47.267171+00	t
5291	Factory New	0.62	1159	2025-02-20 23:40:17.142444+00	f
5292	Minimal Wear	0.17	1159	2025-02-20 23:40:17.152444+00	f
5293	Field-Tested	0.12	1159	2025-02-20 23:40:17.148444+00	f
5294	Well-Worn	0.09	1159	2025-02-20 23:40:17.158444+00	f
5295	Battle-Scarred	0.09	1159	2025-02-20 23:40:17.138444+00	f
5296	Factory New	3.18	1159	2025-02-20 23:40:40.31069+00	t
5297	Minimal Wear	0.58	1159	2025-02-20 23:40:40.322694+00	t
5298	Field-Tested	0.26	1159	2025-02-20 23:40:40.31769+00	t
5299	Well-Worn	0.22	1159	2025-02-20 23:40:40.32669+00	t
5300	Battle-Scarred	0.18	1159	2025-02-20 23:40:40.30669+00	t
5301	Factory New	0.34	1161	2025-02-20 23:40:29.105433+00	f
5302	Minimal Wear	0.15	1161	2025-02-20 23:40:29.135432+00	f
5303	Field-Tested	0.09	1161	2025-02-20 23:40:29.119433+00	f
5304	Well-Worn	0.08	1161	2025-02-20 23:40:29.153433+00	f
5305	Battle-Scarred	0.11	1161	2025-02-20 23:40:29.097432+00	f
5306	Factory New	2.08	1161	2025-02-20 23:40:47.023959+00	t
5307	Minimal Wear	0.48	1161	2025-02-20 23:40:47.034959+00	t
5308	Field-Tested	0.23	1161	2025-02-20 23:40:47.02996+00	t
5309	Well-Worn	0.2	1161	2025-02-20 23:40:47.03896+00	t
5310	Battle-Scarred	0.17	1161	2025-02-20 23:40:47.018959+00	t
5311	Factory New	0.39	1163	2025-02-20 23:40:50.148755+00	f
5312	Minimal Wear	0.16	1163	2025-02-20 23:40:50.181756+00	f
5313	Field-Tested	0.09	1163	2025-02-20 23:40:50.161756+00	f
5314	Well-Worn	0.08	1163	2025-02-20 23:40:50.227413+00	f
5315	Battle-Scarred	0.08	1163	2025-02-20 23:40:50.141755+00	f
5316	Factory New	1.15	1163	2025-02-20 23:40:47.951671+00	t
5317	Minimal Wear	0.43	1163	2025-02-20 23:40:47.95967+00	t
5318	Field-Tested	0.18	1163	2025-02-20 23:40:47.955671+00	t
5319	Well-Worn	0.18	1163	2025-02-20 23:40:47.964671+00	t
5320	Battle-Scarred	0.18	1163	2025-02-20 23:40:47.947672+00	t
5321	Factory New	0.3	1165	2025-02-20 23:40:51.966038+00	f
5322	Minimal Wear	0.16	1165	2025-02-20 23:40:51.97604+00	f
5323	Field-Tested	0.09	1165	2025-02-20 23:40:51.970038+00	f
5324	Well-Worn	0.14	1165	2025-02-20 23:40:51.984458+00	f
5325	Battle-Scarred	0.08	1165	2025-02-20 23:40:51.959038+00	f
5326	Factory New	0.86	1165	2025-02-20 23:40:48.238507+00	t
5327	Minimal Wear	0.43	1165	2025-02-20 23:40:48.247507+00	t
5328	Field-Tested	0.21	1165	2025-02-20 23:40:48.241507+00	t
5329	Well-Worn	0.34	1165	2025-02-20 23:40:48.251506+00	t
5330	Battle-Scarred	0.17	1165	2025-02-20 23:40:48.234508+00	t
5331	Factory New	0.26	1167	2025-02-20 23:40:54.574332+00	f
5332	Minimal Wear	0.16	1167	2025-02-20 23:40:54.585331+00	f
5333	Field-Tested	0.08	1167	2025-02-20 23:40:54.580331+00	f
5334	Well-Worn	0.11	1167	2025-02-20 23:40:54.590332+00	f
5335	Battle-Scarred	0.08	1167	2025-02-20 23:40:54.568331+00	f
5336	Factory New	1.07	1167	2025-02-20 23:40:49.045994+00	t
5337	Minimal Wear	0.42	1167	2025-02-20 23:40:49.054992+00	t
5338	Field-Tested	0.2	1167	2025-02-20 23:40:49.049992+00	t
5339	Well-Worn	0.23	1167	2025-02-20 23:40:49.060992+00	t
5340	Battle-Scarred	0.19	1167	2025-02-20 23:40:49.040994+00	t
5341	Factory New	0.25	1169	2025-02-20 23:40:06.384512+00	f
5342	Minimal Wear	0.17	1169	2025-02-20 23:40:06.406499+00	f
5343	Field-Tested	0.09	1169	2025-02-20 23:40:06.3925+00	f
5344	Well-Worn	0.11	1169	2025-02-20 23:40:06.417617+00	f
5345	Battle-Scarred	0.11	1169	2025-02-20 23:40:06.373414+00	f
5346	Factory New	0.78	1169	2025-02-20 23:40:35.662206+00	t
5347	Minimal Wear	0.43	1169	2025-02-20 23:40:35.688269+00	t
5348	Field-Tested	0.22	1169	2025-02-20 23:40:35.674454+00	t
5349	Well-Worn	0.27	1169	2025-02-15 23:05:38.661992+00	t
5350	Battle-Scarred	0.18	1169	2025-02-20 23:40:35.652087+00	t
5351	Factory New	0.27	1171	2025-02-20 23:40:21.747313+00	f
5352	Minimal Wear	0.16	1171	2025-02-20 23:40:21.755313+00	f
5353	Field-Tested	0.09	1171	2025-02-20 23:40:21.752313+00	f
5354	Well-Worn	0.1	1171	2025-02-20 23:40:21.759314+00	f
5355	Battle-Scarred	0.08	1171	2025-02-20 23:40:21.739314+00	f
5356	Factory New	0.75	1171	2025-02-20 23:40:42.451722+00	t
5357	Minimal Wear	0.4	1171	2025-02-20 23:40:42.459722+00	t
5358	Field-Tested	0.2	1171	2025-02-20 23:40:42.455723+00	t
5359	Well-Worn	0.22	1171	2025-02-20 23:40:42.465722+00	t
5360	Battle-Scarred	0.17	1171	2025-02-20 23:40:42.447724+00	t
5361	Factory New	2330.48	1173	2025-02-20 23:39:59.933383+00	f
5362	Minimal Wear	1312.49	1173	2025-02-20 23:39:59.944385+00	f
5363	Field-Tested	866.98	1173	2025-02-20 23:39:59.937383+00	f
5364	Well-Worn	865	1173	2025-02-20 23:39:59.950382+00	f
5365	Battle-Scarred	625.63	1173	2025-02-20 23:39:59.929383+00	f
5366	Factory New	5683.16	1173	2025-02-20 23:40:31.608797+00	t
5367	Minimal Wear	3032.97	1173	2025-02-20 23:40:31.616887+00	t
5368	Field-Tested	1951.21	1173	2025-02-20 23:40:31.613887+00	t
5369	Well-Worn	1788.43	1173	2025-02-15 23:05:37.4336+00	t
5370	Battle-Scarred	\N	1173	\N	t
5371	Factory New	136.42	1175	2025-02-20 23:40:04.964194+00	f
5372	Minimal Wear	133.06	1175	2025-02-20 23:40:04.968191+00	f
5373	Factory New	252.44	1175	2025-02-20 23:40:35.254666+00	t
5374	Minimal Wear	215.5	1175	2025-02-15 23:05:38.412166+00	t
5375	Factory New	\N	1177	\N	f
5376	Minimal Wear	118.38	1177	2025-02-20 23:40:24.633711+00	f
5377	Field-Tested	105.1	1177	2025-02-20 23:40:24.628711+00	f
5378	Well-Worn	131.86	1177	2025-02-20 23:40:24.640724+00	f
5379	Battle-Scarred	132.91	1177	2025-02-20 23:40:24.622711+00	f
5380	Factory New	903.36	1177	2025-02-20 23:40:44.512362+00	t
5381	Minimal Wear	269.07	1177	2025-02-20 23:40:44.556356+00	t
5382	Field-Tested	242.23	1177	2025-02-20 23:40:44.544364+00	t
5383	Well-Worn	\N	1177	\N	t
5384	Battle-Scarred	698.41	1177	2025-02-20 23:40:44.492356+00	t
5385	Factory New	149.84	1179	2025-02-20 23:40:03.456247+00	f
5386	Minimal Wear	162.44	1179	2025-02-20 23:40:03.462247+00	f
5387	Factory New	440.98	1179	2025-02-20 23:40:34.160198+00	t
5388	Minimal Wear	387.89	1179	2025-02-20 23:40:34.169198+00	t
5389	Factory New	130.06	1181	2025-02-20 23:40:22.872666+00	f
5390	Minimal Wear	134.49	1181	2025-02-20 23:40:22.876668+00	f
5391	Factory New	330.99	1181	2025-02-20 23:40:43.07397+00	t
5392	Minimal Wear	292.72	1181	2025-02-20 23:40:43.077969+00	t
5393	Factory New	58.85	1183	2025-02-20 23:40:53.435511+00	f
5394	Minimal Wear	31.6	1183	2025-02-20 23:40:53.460511+00	f
5395	Field-Tested	27.06	1183	2025-02-20 23:40:53.449509+00	f
5396	Well-Worn	36.7	1183	2025-02-20 23:40:53.47251+00	f
5397	Battle-Scarred	27.29	1183	2025-02-15 23:05:45.683473+00	f
5398	Factory New	243.47	1183	2025-02-20 23:40:48.757588+00	t
5399	Minimal Wear	73.66	1183	2025-02-20 23:40:48.768103+00	t
5400	Field-Tested	53.15	1183	2025-02-20 23:40:48.764107+00	t
5401	Well-Worn	50.58	1183	2025-02-20 23:40:48.772103+00	t
5402	Battle-Scarred	54.8	1183	2025-02-20 23:40:48.753589+00	t
5403	Factory New	47.27	1185	2025-02-20 23:40:16.625724+00	f
5404	Minimal Wear	30.45	1185	2025-02-20 23:40:16.637726+00	f
5405	Field-Tested	29.59	1185	2025-02-20 23:40:16.630725+00	f
5406	Well-Worn	38	1185	2025-02-20 23:40:16.65042+00	f
5407	Factory New	\N	1185	\N	t
5408	Minimal Wear	50.26	1185	2025-02-20 23:40:39.867644+00	t
5409	Field-Tested	46.62	1185	2025-02-20 23:40:39.862645+00	t
5410	Well-Worn	49.68	1185	2025-02-20 23:40:39.871644+00	t
5411	Factory New	35.5	1187	2025-02-20 23:40:17.006349+00	f
5412	Minimal Wear	28.65	1187	2025-02-20 23:40:17.01635+00	f
5413	Field-Tested	26.53	1187	2025-02-20 23:40:17.012351+00	f
5414	Well-Worn	35.34	1187	2025-02-20 23:40:17.020349+00	f
5415	Battle-Scarred	32.34	1187	2025-02-20 23:40:17.00236+00	f
5416	Factory New	203.15	1187	2025-02-20 23:40:40.140536+00	t
5417	Minimal Wear	48.06	1187	2025-02-20 23:40:40.152629+00	t
5418	Field-Tested	42.67	1187	2025-02-20 23:40:40.147851+00	t
5419	Well-Worn	63.16	1187	2025-02-20 23:40:40.156622+00	t
5420	Battle-Scarred	39.9	1187	2025-02-20 23:40:40.135146+00	t
5421	Minimal Wear	30.74	1189	2025-02-20 23:40:14.979727+00	f
5422	Field-Tested	29.33	1189	2025-02-20 23:40:14.971472+00	f
5423	Minimal Wear	78.63	1189	2025-02-20 23:40:39.026869+00	t
5424	Field-Tested	73.48	1189	2025-02-20 23:40:39.022868+00	t
5425	Factory New	19.79	1191	2025-02-20 23:40:05.675711+00	f
5426	Minimal Wear	8.12	1191	2025-02-20 23:40:05.689709+00	f
5427	Field-Tested	7.95	1191	2025-02-20 23:40:05.686709+00	f
5428	Well-Worn	9.2	1191	2025-02-20 23:40:05.695712+00	f
5429	Battle-Scarred	8.71	1191	2025-02-20 23:40:05.671709+00	f
5430	Factory New	\N	1191	\N	t
5431	Minimal Wear	11.05	1191	2025-02-20 23:40:35.510811+00	t
5432	Field-Tested	6.62	1191	2025-02-20 23:40:35.506812+00	t
5433	Well-Worn	10.15	1191	2025-02-15 23:05:38.570087+00	t
5434	Battle-Scarred	11.77	1191	2025-02-20 23:40:35.500294+00	t
5435	Factory New	33.16	1193	2025-02-20 23:40:12.010812+00	f
5436	Minimal Wear	9.62	1193	2025-02-20 23:40:12.019808+00	f
5437	Field-Tested	8.05	1193	2025-02-20 23:40:12.015808+00	f
5438	Well-Worn	9.35	1193	2025-02-20 23:40:12.023809+00	f
5439	Battle-Scarred	10.11	1193	2025-02-20 23:40:12.005809+00	f
5440	Factory New	\N	1193	\N	t
5441	Minimal Wear	12.49	1193	2025-02-20 23:40:37.285029+00	t
5442	Field-Tested	6.96	1193	2025-02-20 23:40:37.281028+00	t
5443	Well-Worn	7.38	1193	2025-02-20 23:40:37.289029+00	t
5444	Battle-Scarred	8.2	1193	2025-02-20 23:40:37.277028+00	t
5445	Factory New	20.67	1195	2025-02-20 23:40:22.257801+00	f
5446	Minimal Wear	8.24	1195	2025-02-20 23:40:22.2668+00	f
5447	Field-Tested	9.16	1195	2025-02-20 23:40:22.2628+00	f
5448	Factory New	42.11	1195	2025-02-20 23:40:42.654932+00	t
5449	Minimal Wear	8.84	1195	2025-02-20 23:40:42.663932+00	t
5450	Field-Tested	6.88	1195	2025-02-20 23:40:42.658932+00	t
5451	Factory New	14.06	1197	2025-02-20 23:40:51.269442+00	f
5452	Minimal Wear	8.23	1197	2025-02-20 23:40:51.314881+00	f
5453	Field-Tested	7.88	1197	2025-02-20 23:40:51.297715+00	f
5454	Factory New	40.18	1197	2025-02-20 23:40:48.027961+00	t
5455	Minimal Wear	7.84	1197	2025-02-20 23:40:48.037517+00	t
5456	Field-Tested	9.27	1197	2025-02-20 23:40:48.032961+00	t
5457	Factory New	13.33	1199	2025-02-20 23:40:28.833846+00	f
5458	Minimal Wear	10.14	1199	2025-02-20 23:40:28.843846+00	f
5459	Field-Tested	8.09	1199	2025-02-20 23:40:28.838847+00	f
5460	Well-Worn	8.63	1199	2025-02-20 23:40:28.851846+00	f
5461	Battle-Scarred	10.09	1199	2025-02-20 23:40:28.829847+00	f
5462	Factory New	60.45	1199	2025-02-20 23:40:46.88728+00	t
5463	Minimal Wear	9.28	1199	2025-02-20 23:40:46.896282+00	t
5464	Field-Tested	7.09	1199	2025-02-20 23:40:46.89028+00	t
5465	Well-Worn	6.96	1199	2025-02-20 23:40:46.90128+00	t
5466	Battle-Scarred	7.03	1199	2025-02-20 23:40:46.882282+00	t
5467	Factory New	17.5	1201	2025-02-15 19:04:46.794283+00	f
5468	Minimal Wear	9.59	1201	2025-02-20 23:40:10.187613+00	f
5469	Field-Tested	7.59	1201	2025-02-20 23:40:10.172613+00	f
5470	Well-Worn	8.06	1201	2025-02-20 23:40:10.199613+00	f
5471	Battle-Scarred	9.75	1201	2025-02-20 23:40:10.158613+00	f
5472	Factory New	52.04	1201	2025-02-20 23:40:36.725507+00	t
5473	Minimal Wear	10.55	1201	2025-02-20 23:40:36.734507+00	t
5474	Field-Tested	7.45	1201	2025-02-20 23:40:36.729507+00	t
5475	Well-Worn	8.75	1201	2025-02-20 23:40:36.737507+00	t
5476	Battle-Scarred	7.99	1201	2025-02-15 18:39:28.124695+00	t
5477	Factory New	44.18	1203	2025-02-20 23:40:15.111758+00	f
5478	Minimal Wear	31.85	1203	2025-02-20 23:40:15.134802+00	f
5479	Field-Tested	24.4	1203	2025-02-20 23:40:15.128043+00	f
5480	Well-Worn	34	1203	2025-02-20 23:40:15.145892+00	f
5481	Battle-Scarred	23.38	1203	2025-02-20 23:40:15.10249+00	f
5482	Factory New	140.08	1203	2025-02-20 23:40:39.056818+00	t
5483	Minimal Wear	105.69	1203	2025-02-20 23:40:39.065819+00	t
5484	Field-Tested	61.25	1203	2025-02-20 23:40:39.060819+00	t
5485	Well-Worn	63.09	1203	2025-02-15 23:05:40.080059+00	t
5486	Battle-Scarred	111.65	1203	2025-02-20 23:40:39.052818+00	t
5487	Factory New	37.1	1205	2025-02-20 23:40:24.365094+00	f
5488	Minimal Wear	14.72	1205	2025-02-20 23:40:24.374092+00	f
5489	Field-Tested	7.9	1205	2025-02-20 23:40:24.369092+00	f
5490	Well-Worn	10.37	1205	2025-02-20 23:40:24.379278+00	f
5491	Battle-Scarred	10.53	1205	2025-02-20 23:40:24.358093+00	f
5492	Factory New	192.69	1205	2025-02-20 23:40:44.107507+00	t
5493	Minimal Wear	55.36	1205	2025-02-20 23:40:44.125545+00	t
5494	Field-Tested	25.72	1205	2025-02-20 23:40:44.113511+00	t
5495	Well-Worn	30.35	1205	2025-02-20 23:40:44.137544+00	t
5496	Battle-Scarred	31.26	1205	2025-02-20 23:40:44.094469+00	t
5497	Factory New	14.03	1207	2025-02-20 23:40:13.560986+00	f
5498	Minimal Wear	7.93	1207	2025-02-20 23:40:13.578986+00	f
5499	Field-Tested	5.49	1207	2025-02-20 23:40:13.565985+00	f
5500	Well-Worn	8.9	1207	2025-02-20 23:40:13.582985+00	f
5501	Battle-Scarred	4.89	1207	2025-02-20 23:40:13.555984+00	f
5502	Factory New	58.39	1207	2025-02-20 23:40:38.269744+00	t
5503	Minimal Wear	31.6	1207	2025-02-20 23:40:38.294521+00	t
5504	Field-Tested	23.16	1207	2025-02-20 23:40:38.286258+00	t
5505	Well-Worn	24.84	1207	2025-02-20 23:40:38.298522+00	t
5506	Battle-Scarred	17.3	1207	2025-02-20 23:40:38.265743+00	t
5507	Factory New	8.73	1209	2025-02-20 23:40:09.390989+00	f
5508	Minimal Wear	4.43	1209	2025-02-20 23:40:09.400106+00	f
5509	Field-Tested	2.45	1209	2025-02-20 23:40:09.396106+00	f
5510	Well-Worn	2.43	1209	2025-02-20 23:40:09.405106+00	f
5511	Battle-Scarred	2.61	1209	2025-02-20 23:40:09.385989+00	f
5512	Factory New	23.89	1209	2025-02-20 23:40:36.476276+00	t
5513	Minimal Wear	11.06	1209	2025-02-20 23:40:36.486066+00	t
5514	Field-Tested	6.46	1209	2025-02-20 23:40:36.482067+00	t
5515	Well-Worn	5.74	1209	2025-02-20 23:40:36.490065+00	t
5516	Battle-Scarred	5.63	1209	2025-02-20 23:40:36.472276+00	t
5517	Factory New	10.88	1211	2025-02-20 23:40:04.831192+00	f
5518	Minimal Wear	7.48	1211	2025-02-20 23:40:04.840191+00	f
5519	Field-Tested	6.86	1211	2025-02-20 23:40:04.836192+00	f
5520	Factory New	28.81	1211	2025-02-20 23:40:35.175764+00	t
5521	Minimal Wear	19.56	1211	2025-02-20 23:40:35.184571+00	t
5522	Field-Tested	18.76	1211	2025-02-20 23:40:35.179765+00	t
5523	Factory New	2.11	1213	2025-02-20 23:40:04.524596+00	f
5524	Minimal Wear	1.27	1213	2025-02-20 23:40:04.541596+00	f
5525	Field-Tested	0.9	1213	2025-02-20 23:40:04.5336+00	f
5526	Well-Worn	0.85	1213	2025-02-20 23:40:04.547596+00	f
5527	Battle-Scarred	0.67	1213	2025-02-20 23:40:04.520596+00	f
5528	Factory New	5.88	1213	2025-02-20 23:40:34.930781+00	t
5529	Minimal Wear	3.71	1213	2025-02-20 23:40:34.938778+00	t
5530	Field-Tested	2.58	1213	2025-02-20 23:40:34.934778+00	t
5531	Well-Worn	1.73	1213	2025-02-20 23:40:34.941942+00	t
5532	Battle-Scarred	1.67	1213	2025-02-20 23:40:34.924539+00	t
5533	Factory New	1.72	1215	2025-02-20 23:40:25.96182+00	f
5534	Minimal Wear	1.09	1215	2025-02-20 23:40:25.987335+00	f
5535	Field-Tested	0.8	1215	2025-02-20 23:40:25.968819+00	f
5536	Well-Worn	2.96	1215	2025-02-20 23:40:26.004334+00	f
5537	Battle-Scarred	1.08	1215	2025-02-20 23:40:25.94982+00	f
5538	Factory New	4.7	1215	2025-02-20 23:40:45.601688+00	t
5539	Minimal Wear	3.45	1215	2025-02-20 23:40:45.617532+00	t
5540	Field-Tested	2.38	1215	2025-02-20 23:40:45.613532+00	t
5541	Well-Worn	3.06	1215	2025-02-20 23:40:45.628532+00	t
5542	Battle-Scarred	2.4	1215	2025-02-20 23:40:45.596689+00	t
5543	Factory New	1.71	1217	2025-02-20 23:40:21.898063+00	f
5544	Minimal Wear	1.15	1217	2025-02-20 23:40:21.907063+00	f
5545	Field-Tested	0.95	1217	2025-02-20 23:40:21.902063+00	f
5546	Factory New	5.05	1217	2025-02-20 23:40:42.57276+00	t
5547	Minimal Wear	3.19	1217	2025-02-20 23:40:42.58176+00	t
5548	Field-Tested	3.27	1217	2025-02-20 23:40:42.576762+00	t
5549	Factory New	1.84	1219	2025-02-20 23:40:24.138627+00	f
5550	Minimal Wear	1.04	1219	2025-02-20 23:40:24.149627+00	f
5551	Field-Tested	0.96	1219	2025-02-20 23:40:24.144629+00	f
5552	Well-Worn	1.85	1219	2025-02-20 23:40:24.154627+00	f
5553	Factory New	6.09	1219	2025-02-20 23:40:43.851857+00	t
5554	Minimal Wear	3.29	1219	2025-02-20 23:40:43.867871+00	t
5555	Field-Tested	2.67	1219	2025-02-20 23:40:43.856857+00	t
5556	Well-Worn	3.09	1219	2025-02-20 23:40:43.87187+00	t
5557	Factory New	2.85	1221	2025-02-20 23:40:28.88275+00	f
5558	Minimal Wear	0.59	1221	2025-02-20 23:40:28.890751+00	f
5559	Field-Tested	0.29	1221	2025-02-20 23:40:28.886751+00	f
5560	Well-Worn	0.29	1221	2025-02-20 23:40:28.895753+00	f
5561	Battle-Scarred	0.19	1221	2025-02-20 23:40:28.879752+00	f
5562	Factory New	11.98	1221	2025-02-20 23:40:46.90928+00	t
5563	Minimal Wear	2.24	1221	2025-02-20 23:40:46.918279+00	t
5564	Field-Tested	0.91	1221	2025-02-20 23:40:46.91428+00	t
5565	Well-Worn	0.72	1221	2025-02-20 23:40:46.92228+00	t
5566	Battle-Scarred	0.64	1221	2025-02-20 23:40:46.90528+00	t
5567	Factory New	1.04	1223	2025-02-20 23:40:22.805814+00	f
5568	Minimal Wear	0.2	1223	2025-02-20 23:40:22.815813+00	f
5569	Field-Tested	0.12	1223	2025-02-20 23:40:22.809813+00	f
5570	Well-Worn	0.12	1223	2025-02-20 23:40:22.819815+00	f
5571	Battle-Scarred	0.12	1223	2025-02-20 23:40:22.801814+00	f
5572	Factory New	3.42	1223	2025-02-20 23:40:42.933634+00	t
5573	Minimal Wear	0.86	1223	2025-02-20 23:40:42.948636+00	t
5574	Field-Tested	0.32	1223	2025-02-20 23:40:42.940634+00	t
5575	Well-Worn	0.25	1223	2025-02-20 23:40:42.953634+00	t
5576	Battle-Scarred	0.29	1223	2025-02-20 23:40:42.922634+00	t
5577	Factory New	0.33	1225	2025-02-20 23:40:51.74888+00	f
5578	Minimal Wear	0.18	1225	2025-02-20 23:40:51.785589+00	f
5579	Field-Tested	0.15	1225	2025-02-20 23:40:51.772957+00	f
5580	Well-Worn	0.16	1225	2025-02-20 23:40:51.793589+00	f
5581	Factory New	0.97	1225	2025-02-20 23:40:48.150811+00	t
5582	Minimal Wear	0.6	1225	2025-02-20 23:40:48.15881+00	t
5583	Field-Tested	0.33	1225	2025-02-20 23:40:48.15481+00	t
5584	Well-Worn	0.6	1225	2025-02-20 23:40:48.164811+00	t
5585	Factory New	0.38	1227	2025-02-20 23:40:19.557071+00	f
5586	Minimal Wear	0.19	1227	2025-02-20 23:40:19.56707+00	f
5587	Field-Tested	0.12	1227	2025-02-20 23:40:19.563072+00	f
5588	Well-Worn	1.07	1227	2025-02-20 23:40:19.571071+00	f
5589	Battle-Scarred	0.3	1227	2025-02-20 23:40:19.55207+00	f
5590	Factory New	0.88	1227	2025-02-20 23:40:41.682759+00	t
5591	Minimal Wear	0.53	1227	2025-02-20 23:40:41.691315+00	t
5592	Field-Tested	0.36	1227	2025-02-20 23:40:41.686759+00	t
5593	Well-Worn	0.54	1227	2025-02-20 23:40:41.698317+00	t
5594	Battle-Scarred	0.37	1227	2025-02-20 23:40:41.677759+00	t
5595	Factory New	0.28	1229	2025-02-20 23:40:21.287834+00	f
5596	Minimal Wear	0.16	1229	2025-02-20 23:40:21.296836+00	f
5597	Field-Tested	0.1	1229	2025-02-20 23:40:21.291834+00	f
5598	Well-Worn	0.12	1229	2025-02-20 23:40:21.300835+00	f
5599	Battle-Scarred	0.16	1229	2025-02-20 23:40:21.283836+00	f
5600	Factory New	0.85	1229	2025-02-20 23:40:42.116547+00	t
5601	Minimal Wear	0.57	1229	2025-02-20 23:40:42.124544+00	t
5602	Field-Tested	0.28	1229	2025-02-20 23:40:42.120544+00	t
5603	Well-Worn	0.39	1229	2025-02-20 23:40:42.130546+00	t
5604	Battle-Scarred	0.43	1229	2025-02-20 23:40:42.110611+00	t
5605	Factory New	469.3	1231	2025-02-20 23:40:15.621343+00	f
5606	Minimal Wear	307.5	1231	2025-02-20 23:40:15.633343+00	f
5607	Field-Tested	222.62	1231	2025-02-20 23:40:15.628345+00	f
5608	Well-Worn	199.6	1231	2025-02-20 23:40:15.637344+00	f
5609	Battle-Scarred	152	1231	2025-02-20 23:40:15.615343+00	f
5610	Factory New	975.42	1231	2025-02-20 23:40:39.316031+00	t
5611	Minimal Wear	514.96	1231	2025-02-20 23:40:39.32703+00	t
5612	Field-Tested	287.08	1231	2025-02-20 23:40:39.32203+00	t
5613	Well-Worn	305.84	1231	2025-02-20 23:40:39.33203+00	t
5614	Battle-Scarred	225.78	1231	2025-02-20 23:40:39.309584+00	t
5615	Factory New	64.46	1233	2025-02-20 23:40:12.822472+00	f
5616	Minimal Wear	25.58	1233	2025-02-20 23:40:12.834472+00	f
5617	Field-Tested	13.46	1233	2025-02-20 23:40:12.830472+00	f
5618	Well-Worn	12.17	1233	2025-02-20 23:40:12.83747+00	f
5619	Battle-Scarred	12.11	1233	2025-02-20 23:40:12.815473+00	f
5620	Factory New	214.08	1233	2025-02-20 23:40:37.664548+00	t
5621	Minimal Wear	98.56	1233	2025-02-20 23:40:37.689037+00	t
5622	Field-Tested	44.12	1233	2025-02-20 23:40:37.675468+00	t
5623	Well-Worn	44.43	1233	2025-02-15 23:05:39.718005+00	t
5624	Battle-Scarred	57.48	1233	2025-02-20 23:40:37.654548+00	t
5625	Factory New	76.42	1235	2025-02-20 23:40:09.286379+00	f
5626	Minimal Wear	39.78	1235	2025-02-20 23:40:09.298379+00	f
5627	Field-Tested	26.83	1235	2025-02-20 23:40:09.29138+00	f
5628	Well-Worn	23.02	1235	2025-02-20 23:40:09.30438+00	f
5629	Battle-Scarred	21.93	1235	2025-02-20 23:40:09.279379+00	f
5630	Factory New	232.59	1235	2025-02-20 23:40:36.433436+00	t
5631	Minimal Wear	64.52	1235	2025-02-20 23:40:36.441638+00	t
5632	Field-Tested	44.62	1235	2025-02-20 23:40:36.437439+00	t
5633	Well-Worn	37.43	1235	2025-02-20 23:40:36.446639+00	t
5634	Battle-Scarred	33.64	1235	2025-02-20 23:40:36.429438+00	t
5635	Factory New	54.69	1237	2025-02-20 23:40:15.805959+00	f
5636	Minimal Wear	38.67	1237	2025-02-20 23:40:15.816959+00	f
5637	Field-Tested	26.36	1237	2025-02-20 23:40:15.809958+00	f
5638	Well-Worn	23.57	1237	2025-02-20 23:40:15.820959+00	f
5639	Battle-Scarred	19.05	1237	2025-02-20 23:40:15.801961+00	f
5640	Factory New	120.37	1237	2025-02-20 23:40:39.409454+00	t
5641	Minimal Wear	61.75	1237	2025-02-20 23:40:39.420818+00	t
5642	Field-Tested	50.33	1237	2025-02-20 23:40:39.416817+00	t
5643	Well-Worn	49.31	1237	2025-02-20 23:40:39.425817+00	t
5644	Battle-Scarred	47.77	1237	2025-02-20 23:40:39.405452+00	t
5645	Factory New	52.33	1239	2025-02-20 23:40:53.210169+00	f
5646	Minimal Wear	38.31	1239	2025-02-20 23:40:53.22117+00	f
5647	Field-Tested	26.62	1239	2025-02-20 23:40:53.217174+00	f
5648	Well-Worn	27.39	1239	2025-02-20 23:40:53.22617+00	f
5649	Battle-Scarred	30.79	1239	2025-02-20 23:40:53.204171+00	f
5650	Factory New	147.83	1239	2025-02-20 23:40:48.693771+00	t
5651	Minimal Wear	73.88	1239	2025-02-20 23:40:48.703771+00	t
5652	Field-Tested	39.27	1239	2025-02-20 23:40:48.69877+00	t
5653	Well-Worn	45.03	1239	2025-02-20 23:40:48.70677+00	t
5654	Battle-Scarred	38.45	1239	2025-02-20 23:40:48.68977+00	t
5655	Factory New	10.19	1241	2025-02-20 23:40:03.398663+00	f
5656	Minimal Wear	5.74	1241	2025-02-20 23:40:03.407662+00	f
5657	Field-Tested	4.52	1241	2025-02-20 23:40:03.402663+00	f
5658	Well-Worn	3.99	1241	2025-02-20 23:40:03.412663+00	f
5659	Battle-Scarred	4.29	1241	2025-02-20 23:40:03.392663+00	f
5660	Factory New	40.96	1241	2025-02-20 23:40:34.114295+00	t
5661	Minimal Wear	13.21	1241	2025-02-20 23:40:34.125379+00	t
5662	Field-Tested	8.23	1241	2025-02-20 23:40:34.120259+00	t
5663	Well-Worn	9.6	1241	2025-02-20 23:40:34.13126+00	t
5664	Battle-Scarred	13.34	1241	2025-02-20 23:40:34.106316+00	t
5665	Factory New	9.69	1243	2025-02-20 23:40:05.925931+00	f
5666	Minimal Wear	5.3	1243	2025-02-20 23:40:05.980604+00	f
5667	Field-Tested	4.22	1243	2025-02-20 23:40:05.951931+00	f
5668	Well-Worn	4.43	1243	2025-02-20 23:40:05.99412+00	f
5669	Battle-Scarred	4.25	1243	2025-02-20 23:40:05.890931+00	f
5670	Factory New	15.79	1243	2025-02-20 23:40:35.555897+00	t
5671	Minimal Wear	10.35	1243	2025-02-20 23:40:35.567113+00	t
5672	Field-Tested	5.81	1243	2025-02-20 23:40:35.561113+00	t
5673	Well-Worn	5.49	1243	2025-02-15 23:05:38.603886+00	t
5674	Battle-Scarred	4.43	1243	2025-02-20 23:40:35.551898+00	t
5675	Factory New	10.5	1245	2025-02-20 23:40:51.653408+00	f
5676	Minimal Wear	4.69	1245	2025-02-20 23:40:51.663407+00	f
5677	Field-Tested	3.93	1245	2025-02-20 23:40:51.657407+00	f
5678	Well-Worn	4.02	1245	2025-02-20 23:40:51.668411+00	f
5679	Battle-Scarred	3.3	1245	2025-02-20 23:40:51.649407+00	f
5680	Factory New	14.79	1245	2025-02-20 23:40:48.13081+00	t
5681	Minimal Wear	9.48	1245	2025-02-20 23:40:48.13981+00	t
5682	Field-Tested	7.19	1245	2025-02-20 23:40:48.13581+00	t
5683	Well-Worn	3.69	1245	2025-02-15 23:05:43.951836+00	t
5684	Battle-Scarred	6.88	1245	2025-02-15 23:05:43.942616+00	t
5685	Factory New	8.49	1247	2025-02-20 23:40:29.568888+00	f
5686	Minimal Wear	4.91	1247	2025-02-20 23:40:29.586888+00	f
5687	Field-Tested	3.98	1247	2025-02-20 23:40:29.578889+00	f
5688	Well-Worn	3.83	1247	2025-02-20 23:40:29.596889+00	f
5689	Battle-Scarred	5.07	1247	2025-02-20 23:40:29.558919+00	f
5690	Factory New	19.16	1247	2025-02-20 23:40:47.185471+00	t
5691	Minimal Wear	9.37	1247	2025-02-20 23:40:47.193471+00	t
5692	Field-Tested	5.78	1247	2025-02-20 23:40:47.189471+00	t
5693	Well-Worn	5.26	1247	2025-02-20 23:40:47.198471+00	t
5694	Battle-Scarred	4.35	1247	2025-02-20 23:40:47.180471+00	t
5695	Factory New	8.63	1249	2025-02-20 23:40:21.7215+00	f
5696	Minimal Wear	5.13	1249	2025-02-20 23:40:21.731313+00	f
5697	Field-Tested	4.08	1249	2025-02-20 23:40:21.7255+00	f
5698	Well-Worn	3.75	1249	2025-02-20 23:40:21.735313+00	f
5699	Battle-Scarred	4.43	1249	2025-02-20 23:40:21.717501+00	f
5700	Factory New	13.55	1249	2025-02-20 23:40:42.430017+00	t
5701	Minimal Wear	7.8	1249	2025-02-20 23:40:42.438016+00	t
5702	Field-Tested	6.03	1249	2025-02-20 23:40:42.434016+00	t
5703	Well-Worn	5.16	1249	2025-02-20 23:40:42.441724+00	t
5704	Battle-Scarred	5.25	1249	2025-02-20 23:40:42.425016+00	t
5705	Factory New	1.79	1251	2025-02-20 23:40:12.168391+00	f
5706	Minimal Wear	0.9	1251	2025-02-20 23:40:12.176391+00	f
5707	Field-Tested	0.63	1251	2025-02-20 23:40:12.172391+00	f
5708	Well-Worn	0.57	1251	2025-02-20 23:40:12.181391+00	f
5709	Battle-Scarred	0.69	1251	2025-02-20 23:40:12.164391+00	f
5710	Factory New	6.63	1251	2025-02-20 23:40:37.365344+00	t
5711	Minimal Wear	2.22	1251	2025-02-20 23:40:37.374692+00	t
5712	Field-Tested	1.03	1251	2025-02-20 23:40:37.370344+00	t
5713	Well-Worn	0.95	1251	2025-02-20 23:40:37.378694+00	t
5714	Battle-Scarred	0.85	1251	2025-02-20 23:40:37.360344+00	t
5715	Factory New	1.16	1253	2025-02-20 23:40:18.537658+00	f
5716	Minimal Wear	0.74	1253	2025-02-20 23:40:18.546658+00	f
5717	Field-Tested	0.63	1253	2025-02-20 23:40:18.540658+00	f
5718	Well-Worn	0.69	1253	2025-02-20 23:40:18.550657+00	f
5719	Battle-Scarred	0.54	1253	2025-02-20 23:40:18.533659+00	f
5720	Factory New	4.84	1253	2025-02-20 23:40:41.18073+00	t
5721	Minimal Wear	1.65	1253	2025-02-20 23:40:41.189729+00	t
5722	Field-Tested	0.65	1253	2025-02-20 23:40:41.18573+00	t
5723	Well-Worn	0.62	1253	2025-02-20 23:40:41.193729+00	t
5724	Battle-Scarred	0.72	1253	2025-02-20 23:40:41.175729+00	t
5725	Factory New	0.94	1255	2025-02-20 23:40:10.2739+00	f
5726	Minimal Wear	0.68	1255	2025-02-20 23:40:10.300456+00	f
5727	Field-Tested	0.83	1255	2025-02-20 23:40:10.288447+00	f
5728	Well-Worn	0.91	1255	2025-02-20 23:40:10.311271+00	f
5729	Battle-Scarred	0.71	1255	2025-02-20 23:40:10.264987+00	f
5730	Factory New	2.76	1255	2025-02-20 23:40:36.746573+00	t
5731	Minimal Wear	1.33	1255	2025-02-20 23:40:36.754572+00	t
5732	Field-Tested	0.66	1255	2025-02-20 23:40:36.750572+00	t
5733	Well-Worn	0.84	1255	2025-02-20 23:40:36.757571+00	t
5734	Battle-Scarred	0.71	1255	2025-02-20 23:40:36.740571+00	t
5735	Factory New	1.11	1257	2025-02-20 23:40:23.48398+00	f
5736	Minimal Wear	0.87	1257	2025-02-20 23:40:23.492979+00	f
5737	Field-Tested	0.89	1257	2025-02-20 23:40:23.488979+00	f
5738	Well-Worn	1.86	1257	2025-02-20 23:40:23.498979+00	f
5739	Battle-Scarred	0.74	1257	2025-02-20 23:40:23.47998+00	f
5740	Factory New	2.73	1257	2025-02-20 23:40:43.341746+00	t
5741	Minimal Wear	1.39	1257	2025-02-20 23:40:43.355745+00	t
5742	Field-Tested	0.7	1257	2025-02-20 23:40:43.347751+00	t
5743	Well-Worn	8.26	1257	2025-02-20 23:40:43.359745+00	t
5744	Battle-Scarred	0.62	1257	2025-02-20 23:40:43.338231+00	t
5745	Factory New	2.23	1259	2025-02-20 23:40:04.623698+00	f
5746	Minimal Wear	0.66	1259	2025-02-20 23:40:04.633698+00	f
5747	Field-Tested	0.67	1259	2025-02-20 23:40:04.629698+00	f
5748	Well-Worn	0.58	1259	2025-02-20 23:40:04.637699+00	f
5749	Battle-Scarred	0.54	1259	2025-02-20 23:40:04.619698+00	f
5750	Factory New	4.1	1259	2025-02-20 23:40:34.985667+00	t
5751	Minimal Wear	1.4	1259	2025-02-20 23:40:34.993667+00	t
5752	Field-Tested	0.64	1259	2025-02-20 23:40:34.989668+00	t
5753	Well-Worn	0.62	1259	2025-02-20 23:40:34.998668+00	t
5754	Battle-Scarred	0.62	1259	2025-02-20 23:40:34.981668+00	t
5755	Factory New	2.98	1261	2025-02-20 23:40:13.748952+00	f
5756	Minimal Wear	0.66	1261	2025-02-20 23:40:13.763023+00	f
5757	Field-Tested	0.62	1261	2025-02-20 23:40:13.755953+00	f
5758	Well-Worn	0.58	1261	2025-02-20 23:40:13.770008+00	f
5759	Battle-Scarred	0.54	1261	2025-02-20 23:40:13.73944+00	f
5760	Factory New	97.86	1261	2025-02-15 18:38:09.614604+00	t
5761	Minimal Wear	1.62	1261	2025-02-20 23:40:38.486341+00	t
5762	Field-Tested	0.74	1261	2025-02-20 23:40:38.480587+00	t
5763	Well-Worn	0.56	1261	2025-02-20 23:40:38.494344+00	t
5764	Battle-Scarred	0.74	1261	2025-02-20 23:40:38.469867+00	t
5765	Factory New	1.08	1263	2025-02-20 23:40:24.485388+00	f
5766	Minimal Wear	0.77	1263	2025-02-20 23:40:24.495433+00	f
5767	Field-Tested	0.65	1263	2025-02-20 23:40:24.489388+00	f
5768	Well-Worn	0.96	1263	2025-02-20 23:40:24.499431+00	f
5769	Battle-Scarred	0.57	1263	2025-02-20 23:40:24.480387+00	f
5770	Factory New	3.24	1263	2025-02-20 23:40:44.215079+00	t
5771	Minimal Wear	1.69	1263	2025-02-20 23:40:44.224081+00	t
5772	Field-Tested	0.72	1263	2025-02-20 23:40:44.22008+00	t
5773	Well-Worn	7.09	1263	2025-02-20 23:40:44.23608+00	t
5774	Battle-Scarred	0.85	1263	2025-02-20 23:40:44.209565+00	t
5775	Factory New	415.59	1265	2025-02-20 23:40:03.714782+00	f
5776	Minimal Wear	325.27	1265	2025-02-20 23:40:03.728784+00	f
5777	Field-Tested	248.97	1265	2025-02-20 23:40:03.719783+00	f
5778	Well-Worn	188	1265	2025-02-20 23:40:03.734783+00	f
5779	Battle-Scarred	189.18	1265	2025-02-20 23:40:03.710784+00	f
5780	Factory New	1010.53	1265	2025-02-20 23:40:34.346932+00	t
5781	Minimal Wear	583.95	1265	2025-02-20 23:40:34.354932+00	t
5782	Field-Tested	410.6	1265	2025-02-20 23:40:34.350931+00	t
5783	Well-Worn	610.53	1265	2025-02-20 23:40:34.359072+00	t
5784	Battle-Scarred	\N	1265	\N	t
5785	Factory New	120.14	1267	2025-02-20 23:40:09.481961+00	f
5786	Minimal Wear	48.06	1267	2025-02-20 23:40:09.489962+00	f
5787	Field-Tested	28.66	1267	2025-02-20 23:40:09.485962+00	f
5788	Well-Worn	32.52	1267	2025-02-20 23:40:09.495962+00	f
5789	Battle-Scarred	29.4	1267	2025-02-20 23:40:09.476963+00	f
5790	Factory New	\N	1267	\N	t
5791	Minimal Wear	167.14	1267	2025-02-20 23:40:36.528452+00	t
5792	Field-Tested	103.34	1267	2025-02-20 23:40:36.522451+00	t
5793	Well-Worn	134.46	1267	2025-02-20 23:40:36.533451+00	t
5794	Battle-Scarred	125.06	1267	2025-02-20 23:40:36.519303+00	t
5795	Factory New	82.38	1269	2025-02-20 23:40:16.059797+00	f
5796	Minimal Wear	54.92	1269	2025-02-20 23:40:16.069799+00	f
5797	Field-Tested	47.24	1269	2025-02-20 23:40:16.065798+00	f
5798	Well-Worn	51.67	1269	2025-02-20 23:40:16.073799+00	f
5799	Battle-Scarred	64.52	1269	2025-02-15 23:05:30.856412+00	f
5800	Factory New	155.53	1269	2025-02-20 23:40:39.577623+00	t
5801	Minimal Wear	110.89	1269	2025-02-20 23:40:39.587623+00	t
5802	Field-Tested	107.37	1269	2025-02-20 23:40:39.582623+00	t
5803	Well-Worn	224.23	1269	2025-02-20 23:40:39.590624+00	t
5804	Battle-Scarred	105.16	1269	2025-02-15 23:05:40.33312+00	t
5805	Factory New	69.82	1271	2025-02-20 23:40:12.081184+00	f
5806	Minimal Wear	49.29	1271	2025-02-20 23:40:12.090184+00	f
5807	Field-Tested	44.06	1271	2025-02-20 23:40:12.086184+00	f
5808	Well-Worn	45.52	1271	2025-02-20 23:40:12.099183+00	f
5809	Battle-Scarred	51.59	1271	2025-02-20 23:40:12.075185+00	f
5810	Factory New	162.63	1271	2025-02-20 23:40:37.342017+00	t
5811	Minimal Wear	109.99	1271	2025-02-20 23:40:37.350017+00	t
5812	Field-Tested	77.8	1271	2025-02-20 23:40:37.346019+00	t
5813	Well-Worn	105.39	1271	2025-02-20 23:40:37.356346+00	t
5814	Battle-Scarred	94	1271	2025-02-20 23:40:37.338016+00	t
5815	Factory New	65.85	1273	2025-02-20 23:40:05.76571+00	f
5816	Minimal Wear	38	1273	2025-02-20 23:40:05.778709+00	f
5817	Field-Tested	41.08	1273	2025-02-20 23:40:05.77271+00	f
5818	Well-Worn	45.69	1273	2025-02-20 23:40:05.78371+00	f
5819	Battle-Scarred	43.16	1273	2025-02-20 23:40:05.75871+00	f
5820	Factory New	266.11	1273	2025-02-20 23:40:35.537679+00	t
5821	Minimal Wear	86.62	1273	2025-02-20 23:40:35.547899+00	t
5822	Field-Tested	136.55	1273	2025-02-20 23:40:35.541898+00	t
5823	Well-Worn	86.93	1273	2025-02-15 23:05:38.589451+00	t
5824	Battle-Scarred	\N	1273	\N	t
5825	Factory New	32.56	1275	2025-02-20 23:40:00.891739+00	f
5826	Minimal Wear	24.39	1275	2025-02-20 23:40:00.916706+00	f
5827	Field-Tested	21.4	1275	2025-02-20 23:40:00.90441+00	f
5828	Well-Worn	28.88	1275	2025-02-20 23:40:00.924154+00	f
5829	Battle-Scarred	29.91	1275	2025-02-20 23:40:00.886168+00	f
5830	Factory New	100	1275	2025-02-20 23:40:32.453524+00	t
5831	Minimal Wear	62.14	1275	2025-02-20 23:40:32.464685+00	t
5832	Field-Tested	45.23	1275	2025-02-20 23:40:32.459521+00	t
5833	Well-Worn	54.56	1275	2025-02-15 23:05:37.56439+00	t
5834	Battle-Scarred	55.54	1275	2025-02-20 23:40:32.447521+00	t
5835	Factory New	11.66	1277	2025-02-20 23:40:24.517432+00	f
5836	Minimal Wear	9.47	1277	2025-02-20 23:40:24.526431+00	f
5837	Field-Tested	5.23	1277	2025-02-20 23:40:24.521432+00	f
5838	Well-Worn	6.71	1277	2025-02-20 23:40:24.531945+00	f
5839	Battle-Scarred	5.23	1277	2025-02-20 23:40:24.513432+00	f
5840	Factory New	41.39	1277	2025-02-20 23:40:44.268675+00	t
5841	Minimal Wear	18.74	1277	2025-02-20 23:40:44.287674+00	t
5842	Field-Tested	17.44	1277	2025-02-20 23:40:44.282674+00	t
5843	Well-Worn	13.94	1277	2025-02-20 23:40:44.298675+00	t
5844	Battle-Scarred	12.58	1277	2025-02-20 23:40:44.255677+00	t
5845	Factory New	12.72	1279	2025-02-20 23:40:23.271524+00	f
5846	Minimal Wear	9.31	1279	2025-02-20 23:40:23.282655+00	f
5847	Field-Tested	12.15	1279	2025-02-20 23:40:23.278657+00	f
5848	Well-Worn	11.71	1279	2025-02-20 23:40:23.287656+00	f
5849	Battle-Scarred	8.31	1279	2025-02-20 23:40:23.266524+00	f
5850	Factory New	31.47	1279	2025-02-20 23:40:43.260149+00	t
5851	Minimal Wear	24.22	1279	2025-02-20 23:40:43.270148+00	t
5852	Field-Tested	17.65	1279	2025-02-20 23:40:43.266149+00	t
5853	Well-Worn	22.79	1279	2025-02-20 23:40:43.274874+00	t
5854	Battle-Scarred	14.54	1279	2025-02-20 23:40:43.253314+00	t
5855	Factory New	15.33	1281	2025-02-20 23:40:24.016852+00	f
5856	Minimal Wear	8.64	1281	2025-02-15 23:05:34.406752+00	f
5857	Field-Tested	5.44	1281	2025-02-20 23:40:24.020852+00	f
5858	Well-Worn	7.18	1281	2025-02-20 23:40:24.024852+00	f
5859	Battle-Scarred	7.06	1281	2025-02-20 23:40:24.012852+00	f
5860	Factory New	26.16	1281	2025-02-20 23:40:43.695777+00	t
5861	Minimal Wear	18.02	1281	2025-02-20 23:40:43.710775+00	t
5862	Field-Tested	12.46	1281	2025-02-20 23:40:43.707776+00	t
5863	Well-Worn	12.32	1281	2025-02-20 23:40:43.725543+00	t
5864	Battle-Scarred	12.43	1281	2025-02-20 23:40:43.691775+00	t
5865	Factory New	11.74	1283	2025-02-20 23:40:29.035909+00	f
5866	Minimal Wear	9.16	1283	2025-02-20 23:40:29.055909+00	f
5867	Field-Tested	8.6	1283	2025-02-20 23:40:29.04491+00	f
5868	Well-Worn	8.88	1283	2025-02-20 23:40:29.066909+00	f
5869	Battle-Scarred	8.69	1283	2025-02-15 23:05:36.725717+00	f
5870	Factory New	24.2	1283	2025-02-20 23:40:46.999959+00	t
5871	Minimal Wear	23.11	1283	2025-02-20 23:40:47.008958+00	t
5872	Field-Tested	22.55	1283	2025-02-20 23:40:47.004959+00	t
5873	Well-Worn	24.55	1283	2025-02-20 23:40:47.01496+00	t
5874	Battle-Scarred	22.13	1283	2025-02-20 23:40:46.99396+00	t
5875	Factory New	28.67	1285	2025-02-20 23:40:52.536185+00	f
5876	Minimal Wear	9.45	1285	2025-02-20 23:40:52.544185+00	f
5877	Field-Tested	5.05	1285	2025-02-20 23:40:52.540186+00	f
5878	Well-Worn	7.26	1285	2025-02-20 23:40:52.550185+00	f
5879	Battle-Scarred	6.97	1285	2025-02-20 23:40:52.532185+00	f
5880	Factory New	157.95	1285	2025-02-15 23:05:44.138122+00	t
5881	Minimal Wear	30.89	1285	2025-02-20 23:40:48.500152+00	t
5882	Field-Tested	13.34	1285	2025-02-20 23:40:48.495154+00	t
5883	Well-Worn	14.59	1285	2025-02-20 23:40:48.505152+00	t
5884	Battle-Scarred	11.65	1285	2025-02-20 23:40:48.491152+00	t
5885	Factory New	11.2	1287	2025-02-20 23:40:14.924872+00	f
5886	Minimal Wear	5.49	1287	2025-02-20 23:40:14.937437+00	f
5887	Field-Tested	4.7	1287	2025-02-20 23:40:14.931869+00	f
5888	Well-Worn	8.11	1287	2025-02-20 23:40:14.963473+00	f
5889	Battle-Scarred	5.45	1287	2025-02-20 23:40:14.914872+00	f
5890	Factory New	37.18	1287	2025-02-20 23:40:39.007045+00	t
5891	Minimal Wear	17.5	1287	2025-02-20 23:40:39.017869+00	t
5892	Field-Tested	10.11	1287	2025-02-20 23:40:39.010046+00	t
5893	Well-Worn	16.1	1287	2025-02-15 23:05:40.052608+00	t
5894	Battle-Scarred	11.5	1287	2025-02-15 23:05:40.043714+00	t
5895	Factory New	11.84	1289	2025-02-20 23:40:49.532567+00	f
5896	Minimal Wear	3.68	1289	2025-02-20 23:40:49.541556+00	f
5897	Field-Tested	2.9	1289	2025-02-20 23:40:49.536556+00	f
5898	Well-Worn	3.26	1289	2025-02-20 23:40:49.547557+00	f
5899	Battle-Scarred	2.14	1289	2025-02-20 23:40:49.527046+00	f
5900	Factory New	29.43	1289	2025-02-20 23:40:47.721672+00	t
5901	Minimal Wear	13.07	1289	2025-02-20 23:40:47.732673+00	t
5902	Field-Tested	5.74	1289	2025-02-20 23:40:47.726674+00	t
5903	Well-Worn	7.32	1289	2025-02-20 23:40:47.736672+00	t
5904	Battle-Scarred	7.66	1289	2025-02-15 23:05:43.727202+00	t
5905	Factory New	7.1	1291	2025-02-20 23:40:16.700429+00	f
5906	Minimal Wear	3.99	1291	2025-02-20 23:40:16.710418+00	f
5907	Field-Tested	3.33	1291	2025-02-20 23:40:16.706417+00	f
5908	Well-Worn	4.45	1291	2025-02-20 23:40:16.715417+00	f
5909	Battle-Scarred	5.04	1291	2025-02-20 23:40:16.695418+00	f
5910	Factory New	9.67	1291	2025-02-20 23:40:39.916097+00	t
5911	Minimal Wear	7.55	1291	2025-02-20 23:40:39.924097+00	t
5912	Field-Tested	6.44	1291	2025-02-20 23:40:39.919098+00	t
5913	Well-Worn	\N	1291	\N	t
5914	Battle-Scarred	\N	1291	\N	t
5915	Factory New	3.49	1293	2025-02-20 23:40:07.826432+00	f
5916	Minimal Wear	2.54	1293	2025-02-20 23:40:07.924642+00	f
5917	Field-Tested	3.16	1293	2025-02-20 23:40:07.880432+00	f
5918	Well-Worn	3.77	1293	2025-02-20 23:40:07.939639+00	f
5919	Battle-Scarred	2.57	1293	2025-02-20 23:40:07.818432+00	f
5920	Factory New	9.73	1293	2025-02-20 23:40:36.071562+00	t
5921	Minimal Wear	7.66	1293	2025-02-20 23:40:36.080487+00	t
5922	Field-Tested	6.28	1293	2025-02-20 23:40:36.075561+00	t
5923	Well-Worn	7.36	1293	2025-02-15 18:40:12.648864+00	t
5924	Battle-Scarred	\N	1293	\N	t
5925	Factory New	5.34	1295	2025-02-20 23:40:17.900983+00	f
5926	Minimal Wear	3.68	1295	2025-02-20 23:40:17.908982+00	f
5927	Field-Tested	3.61	1295	2025-02-20 23:40:17.904984+00	f
5928	Well-Worn	\N	1295	\N	f
5929	Factory New	13.85	1295	2025-02-20 23:40:40.87963+00	t
5930	Minimal Wear	5.99	1295	2025-02-20 23:40:40.888628+00	t
5931	Field-Tested	5.77	1295	2025-02-20 23:40:40.885628+00	t
5932	Well-Worn	6.98	1295	2025-02-15 18:36:29.978051+00	t
5933	Factory New	4.05	1297	2025-02-20 23:40:51.859105+00	f
5934	Minimal Wear	3.08	1297	2025-02-20 23:40:51.876665+00	f
5935	Field-Tested	2.82	1297	2025-02-20 23:40:51.868667+00	f
5936	Well-Worn	3.12	1297	2025-02-15 18:05:24.070285+00	f
5937	Battle-Scarred	2.52	1297	2025-02-20 23:40:51.850589+00	f
5938	Factory New	11.75	1297	2025-02-20 23:40:48.174809+00	t
5939	Minimal Wear	6	1297	2025-02-20 23:40:48.184387+00	t
5940	Field-Tested	4.81	1297	2025-02-20 23:40:48.18039+00	t
5941	Well-Worn	14.65	1297	2025-02-20 23:40:48.188386+00	t
5942	Battle-Scarred	5.97	1297	2025-02-20 23:40:48.17081+00	t
5943	Field-Tested	153.78	1299	2025-02-20 23:40:02.612932+00	f
5944	Well-Worn	111.52	1299	2025-02-20 23:40:02.617935+00	f
5945	Battle-Scarred	80.43	1299	2025-02-20 23:40:02.596931+00	f
5946	Field-Tested	283.85	1299	2025-02-20 23:40:33.781752+00	t
5947	Well-Worn	206.68	1299	2025-02-20 23:40:33.78575+00	t
5948	Battle-Scarred	139.12	1299	2025-02-20 23:40:33.775462+00	t
5949	Factory New	4.8	1301	2025-02-20 23:40:01.546421+00	f
5950	Minimal Wear	3.23	1301	2025-02-20 23:40:01.555421+00	f
5951	Field-Tested	3.32	1301	2025-02-20 23:40:01.550421+00	f
5952	Well-Worn	4.24	1301	2025-02-20 23:40:01.560423+00	f
5953	Battle-Scarred	5.26	1301	2025-02-20 23:40:01.541423+00	f
5954	Factory New	16.22	1301	2025-02-20 23:40:33.319339+00	t
5955	Minimal Wear	13.08	1301	2025-02-20 23:40:33.339276+00	t
5956	Field-Tested	11.55	1301	2025-02-20 23:40:33.330276+00	t
5957	Well-Worn	18.19	1301	2025-02-15 23:05:37.73944+00	t
5958	Battle-Scarred	25.59	1301	2025-02-20 23:40:33.301058+00	t
5959	Minimal Wear	163.95	1303	2025-02-20 23:40:01.097743+00	f
5960	Field-Tested	34.79	1303	2025-02-20 23:40:01.091807+00	f
5961	Well-Worn	28.1	1303	2025-02-20 23:40:01.103741+00	f
5962	Battle-Scarred	23.98	1303	2025-02-20 23:40:01.087807+00	f
5963	Minimal Wear	333.45	1303	2025-02-20 23:40:32.662271+00	t
5964	Field-Tested	85.62	1303	2025-02-20 23:40:32.649584+00	t
5965	Well-Worn	78.95	1303	2025-02-20 23:40:32.668265+00	t
5966	Battle-Scarred	65.7	1303	2025-02-20 23:40:32.642596+00	t
5967	Factory New	12.19	1305	2025-02-20 23:40:21.605761+00	f
5968	Minimal Wear	10.67	1305	2025-02-20 23:40:21.613762+00	f
5969	Field-Tested	10.52	1305	2025-02-20 23:40:21.609761+00	f
5970	Factory New	26.45	1305	2025-02-20 23:40:42.388503+00	t
5971	Minimal Wear	25	1305	2025-02-20 23:40:42.398504+00	t
5972	Field-Tested	22.91	1305	2025-02-20 23:40:42.392504+00	t
5973	Minimal Wear	14.8	1307	2025-02-20 23:40:25.21301+00	f
5974	Field-Tested	8.74	1307	2025-02-20 23:40:25.208009+00	f
5975	Well-Worn	10.35	1307	2025-02-20 23:40:25.217009+00	f
5976	Battle-Scarred	9.87	1307	2025-02-20 23:40:25.203008+00	f
5977	Minimal Wear	21.39	1307	2025-02-20 23:40:45.037439+00	t
5978	Field-Tested	13.78	1307	2025-02-20 23:40:45.024439+00	t
5979	Well-Worn	19.9	1307	2025-02-20 23:40:45.047439+00	t
5980	Battle-Scarred	21.8	1307	2025-02-20 23:40:45.020439+00	t
5981	Factory New	10.04	1309	2025-02-20 23:40:17.030349+00	f
5982	Minimal Wear	6.93	1309	2025-02-20 23:40:17.03935+00	f
5983	Field-Tested	4.12	1309	2025-02-20 23:40:17.03435+00	f
5984	Well-Worn	3.36	1309	2025-02-20 23:40:17.04335+00	f
5985	Battle-Scarred	3.76	1309	2025-02-20 23:40:17.02535+00	f
5986	Factory New	31.58	1309	2025-02-20 23:40:40.173622+00	t
5987	Minimal Wear	12.86	1309	2025-02-20 23:40:40.196526+00	t
5988	Field-Tested	8.07	1309	2025-02-20 23:40:40.184013+00	t
5989	Well-Worn	6.93	1309	2025-02-20 23:40:40.204524+00	t
5990	Battle-Scarred	8.09	1309	2025-02-20 23:40:40.160622+00	t
5991	Factory New	9.2	1311	2025-02-20 23:40:52.952198+00	f
5992	Minimal Wear	6.91	1311	2025-02-20 23:40:52.968199+00	f
5993	Field-Tested	4.57	1311	2025-02-20 23:40:52.960199+00	f
5995	Factory New	18.34	1311	2025-02-20 23:40:48.608911+00	t
5996	Minimal Wear	12.93	1311	2025-02-20 23:40:48.617912+00	t
5997	Field-Tested	9.26	1311	2025-02-20 23:40:48.613914+00	t
5999	Minimal Wear	9	1313	2025-02-20 23:40:08.512342+00	f
6000	Field-Tested	3.54	1313	2025-02-20 23:40:08.496344+00	f
6001	Well-Worn	3.56	1313	2025-02-20 23:40:08.517341+00	f
6002	Battle-Scarred	2.93	1313	2025-02-20 23:40:08.482344+00	f
6003	Minimal Wear	16.12	1313	2025-02-20 23:40:36.222385+00	t
6004	Field-Tested	6.42	1313	2025-02-20 23:40:36.218165+00	t
6005	Well-Worn	6.63	1313	2025-02-20 23:40:36.226385+00	t
6006	Battle-Scarred	6.3	1313	2025-02-20 23:40:36.214166+00	t
6007	Minimal Wear	6.73	1315	2025-02-20 23:40:28.706238+00	f
6008	Field-Tested	3.54	1315	2025-02-20 23:40:28.702237+00	f
6009	Well-Worn	3.34	1315	2025-02-20 23:40:28.711239+00	f
6010	Battle-Scarred	3.37	1315	2025-02-20 23:40:28.698238+00	f
6011	Minimal Wear	12.93	1315	2025-02-20 23:40:46.773693+00	t
6012	Field-Tested	7.39	1315	2025-02-20 23:40:46.767692+00	t
6013	Well-Worn	13.02	1315	2025-02-20 23:40:46.780692+00	t
6014	Battle-Scarred	14.82	1315	2025-02-20 23:40:46.760692+00	t
6015	Minimal Wear	2.12	1317	2025-02-20 23:40:50.114244+00	f
6016	Field-Tested	0.55	1317	2025-02-20 23:40:50.108245+00	f
6017	Well-Worn	0.63	1317	2025-02-20 23:40:50.130243+00	f
6018	Battle-Scarred	0.44	1317	2025-02-20 23:40:50.093243+00	f
6019	Minimal Wear	4.43	1317	2025-02-20 23:40:47.937331+00	t
6020	Field-Tested	0.89	1317	2025-02-20 23:40:47.932331+00	t
6021	Well-Worn	1.71	1317	2025-02-20 23:40:47.941681+00	t
6022	Battle-Scarred	0.99	1317	2025-02-20 23:40:47.929332+00	t
6023	Factory New	1.2	1319	2025-02-20 23:40:51.466549+00	f
6024	Minimal Wear	0.74	1319	2025-02-20 23:40:51.476548+00	f
6025	Field-Tested	0.51	1319	2025-02-20 23:40:51.470549+00	f
6026	Well-Worn	0.52	1319	2025-02-20 23:40:51.48055+00	f
6027	Battle-Scarred	0.47	1319	2025-02-20 23:40:51.46055+00	f
6028	Factory New	2.16	1319	2025-02-20 23:40:48.074031+00	t
6029	Minimal Wear	1.19	1319	2025-02-20 23:40:48.084813+00	t
6030	Field-Tested	0.9	1319	2025-02-20 23:40:48.08003+00	t
6031	Well-Worn	0.91	1319	2025-02-20 23:40:48.08981+00	t
6032	Battle-Scarred	1.05	1319	2025-02-20 23:40:48.065514+00	t
6033	Factory New	0.9	1321	2025-02-20 23:40:21.50572+00	f
6034	Minimal Wear	0.66	1321	2025-02-20 23:40:21.51672+00	f
6035	Field-Tested	0.55	1321	2025-02-20 23:40:21.511725+00	f
6036	Well-Worn	0.53	1321	2025-02-20 23:40:21.520719+00	f
6037	Factory New	1.84	1321	2025-02-20 23:40:42.322502+00	t
6038	Minimal Wear	1.26	1321	2025-02-20 23:40:42.332503+00	t
6039	Field-Tested	1.19	1321	2025-02-20 23:40:42.327503+00	t
6040	Well-Worn	1.68	1321	2025-02-20 23:40:42.336503+00	t
6041	Factory New	0.83	1323	2025-02-20 23:40:17.954983+00	f
6042	Minimal Wear	0.68	1323	2025-02-20 23:40:17.965984+00	f
6043	Field-Tested	0.72	1323	2025-02-20 23:40:17.959984+00	f
6044	Well-Worn	3.3	1323	2025-02-20 23:40:17.969983+00	f
6045	Factory New	1.77	1323	2025-02-20 23:40:40.919709+00	t
6046	Minimal Wear	1.25	1323	2025-02-20 23:40:40.92771+00	t
6047	Field-Tested	1.06	1323	2025-02-20 23:40:40.92371+00	t
6048	Well-Worn	2.59	1323	2025-02-20 23:40:40.932784+00	t
6049	Factory New	120.38	1325	2025-02-20 23:40:05.275407+00	f
6050	Minimal Wear	41.79	1325	2025-02-20 23:40:05.287406+00	f
6051	Field-Tested	19.97	1325	2025-02-20 23:40:05.283406+00	f
6052	Well-Worn	24.03	1325	2025-02-20 23:40:05.291406+00	f
6053	Battle-Scarred	15.57	1325	2025-02-20 23:40:05.268406+00	f
6054	Factory New	376.86	1325	2025-02-20 23:40:35.397219+00	t
6055	Minimal Wear	104.71	1325	2025-02-20 23:40:35.407035+00	t
6056	Field-Tested	64.51	1325	2025-02-20 23:40:35.401432+00	t
6057	Well-Worn	52.57	1325	2025-02-20 23:40:35.413037+00	t
6058	Battle-Scarred	51.19	1325	2025-02-20 23:40:35.39222+00	t
6059	Factory New	82.05	1327	2025-02-20 23:40:00.533589+00	f
6060	Minimal Wear	37.39	1327	2025-02-20 23:40:00.541588+00	f
6061	Field-Tested	21.85	1327	2025-02-20 23:40:00.538588+00	f
6062	Well-Worn	72.82	1327	2025-02-20 23:40:00.547589+00	f
6063	Battle-Scarred	29.66	1327	2025-02-20 23:40:00.529589+00	f
6064	Factory New	176.4	1327	2025-02-20 23:40:32.176305+00	t
6065	Minimal Wear	102.46	1327	2025-02-20 23:40:32.22094+00	t
6066	Field-Tested	82.43	1327	2025-02-20 23:40:32.19721+00	t
6067	Well-Worn	84.22	1327	2025-02-20 23:40:32.256012+00	t
6068	Battle-Scarred	77.82	1327	2025-02-20 23:40:32.155427+00	t
6069	Factory New	21.59	1329	2025-02-20 23:40:13.347729+00	f
6070	Minimal Wear	9.47	1329	2025-02-20 23:40:13.362732+00	f
6071	Field-Tested	5.75	1329	2025-02-20 23:40:13.35773+00	f
6072	Well-Worn	5.4	1329	2025-02-20 23:40:13.36773+00	f
6073	Battle-Scarred	5.63	1329	2025-02-20 23:40:13.342722+00	f
6074	Factory New	73.07	1329	2025-02-15 23:05:39.769271+00	t
6075	Minimal Wear	31.65	1329	2025-02-20 23:40:37.997744+00	t
6076	Field-Tested	17.75	1329	2025-02-20 23:40:37.989723+00	t
6077	Well-Worn	17.69	1329	2025-02-20 23:40:38.016065+00	t
6078	Battle-Scarred	16.57	1329	2025-02-20 23:40:37.972786+00	t
6079	Factory New	22.07	1331	2025-02-20 23:40:17.60464+00	f
6080	Minimal Wear	9.89	1331	2025-02-20 23:40:17.613641+00	f
6081	Field-Tested	5.42	1331	2025-02-20 23:40:17.60864+00	f
6082	Well-Worn	6.64	1331	2025-02-20 23:40:17.61664+00	f
6083	Battle-Scarred	7.33	1331	2025-02-15 23:05:31.612141+00	f
6084	Factory New	58.12	1331	2025-02-20 23:40:40.595288+00	t
6085	Minimal Wear	21.42	1331	2025-02-20 23:40:40.60629+00	t
6086	Field-Tested	22.71	1331	2025-02-20 23:40:40.600286+00	t
6087	Well-Worn	25.53	1331	2025-02-20 23:40:40.610287+00	t
6088	Battle-Scarred	25.78	1331	2025-02-20 23:40:40.589773+00	t
6089	Factory New	21.9	1333	2025-02-20 23:40:29.900992+00	f
6090	Minimal Wear	11.42	1333	2025-02-20 23:40:29.909992+00	f
6091	Field-Tested	7.92	1333	2025-02-20 23:40:29.905992+00	f
6092	Well-Worn	11.51	1333	2025-02-20 23:40:29.915183+00	f
6093	Battle-Scarred	8.02	1333	2025-02-20 23:40:29.896992+00	f
6094	Factory New	66.25	1333	2025-02-20 23:40:47.24817+00	t
6095	Minimal Wear	43.97	1333	2025-02-20 23:40:47.257171+00	t
6096	Field-Tested	20.27	1333	2025-02-20 23:40:47.253171+00	t
6097	Well-Worn	23.22	1333	2025-02-20 23:40:47.26117+00	t
6098	Battle-Scarred	22	1333	2025-02-20 23:40:47.242139+00	t
6099	Factory New	22.47	1335	2025-02-20 23:40:16.412449+00	f
6100	Minimal Wear	8.72	1335	2025-02-20 23:40:16.420447+00	f
6101	Field-Tested	5.18	1335	2025-02-20 23:40:16.416447+00	f
6102	Well-Worn	5.02	1335	2025-02-20 23:40:16.424448+00	f
6103	Battle-Scarred	4.06	1335	2025-02-20 23:40:16.406448+00	f
6104	Factory New	76.89	1335	2025-02-20 23:40:39.720059+00	t
6105	Minimal Wear	36.47	1335	2025-02-20 23:40:39.72906+00	t
6106	Field-Tested	10.65	1335	2025-02-20 23:40:39.72506+00	t
6107	Well-Worn	14.66	1335	2025-02-20 23:40:39.733059+00	t
6108	Battle-Scarred	14.3	1335	2025-02-20 23:40:39.716059+00	t
6109	Factory New	14.95	1337	2025-02-20 23:40:20.443444+00	f
6110	Minimal Wear	8.98	1337	2025-02-20 23:40:20.482439+00	f
6111	Field-Tested	5.89	1337	2025-02-20 23:40:20.46444+00	f
6112	Well-Worn	7.07	1337	2025-02-20 23:40:20.49244+00	f
6113	Battle-Scarred	5.59	1337	2025-02-20 23:40:20.412893+00	f
6114	Factory New	42.78	1337	2025-02-20 23:40:41.968242+00	t
6115	Minimal Wear	23.38	1337	2025-02-20 23:40:41.985355+00	t
6116	Field-Tested	10.2	1337	2025-02-20 23:40:41.975244+00	t
6117	Well-Worn	11.18	1337	2025-02-20 23:40:41.990355+00	t
6118	Battle-Scarred	11.39	1337	2025-02-20 23:40:41.964243+00	t
6119	Factory New	10.5	1339	2025-02-20 23:40:08.822295+00	f
6120	Minimal Wear	4.54	1339	2025-02-20 23:40:08.846092+00	f
6121	Field-Tested	2.78	1339	2025-02-20 23:40:08.839094+00	f
6122	Well-Worn	2.16	1339	2025-02-20 23:40:08.861093+00	f
6123	Battle-Scarred	2.64	1339	2025-02-20 23:40:08.805295+00	f
6124	Factory New	28.84	1339	2025-02-20 23:40:36.282815+00	t
6125	Minimal Wear	14.73	1339	2025-02-20 23:40:36.290816+00	t
6126	Field-Tested	6.31	1339	2025-02-20 23:40:36.286816+00	t
6127	Well-Worn	5.99	1339	2025-02-20 23:40:36.296817+00	t
6128	Battle-Scarred	6.02	1339	2025-02-20 23:40:36.276712+00	t
6129	Factory New	4.4	1341	2025-02-20 23:40:08.95801+00	f
6130	Minimal Wear	3.22	1341	2025-02-20 23:40:08.975536+00	f
6131	Field-Tested	2.4	1341	2025-02-20 23:40:08.96401+00	f
6132	Well-Worn	2.88	1341	2025-02-15 23:05:28.364724+00	f
6133	Factory New	14.48	1341	2025-02-20 23:40:36.32459+00	t
6134	Minimal Wear	8.48	1341	2025-02-20 23:40:36.33459+00	t
6135	Field-Tested	5.78	1341	2025-02-20 23:40:36.329592+00	t
6136	Well-Worn	6.7	1341	2025-02-20 23:40:36.33759+00	t
6137	Factory New	2.31	1343	2025-02-20 23:40:17.698525+00	f
6138	Minimal Wear	1.2	1343	2025-02-20 23:40:17.706527+00	f
6139	Field-Tested	0.85	1343	2025-02-20 23:40:17.702525+00	f
6140	Well-Worn	1.04	1343	2025-02-20 23:40:17.711528+00	f
6141	Battle-Scarred	0.94	1343	2025-02-20 23:40:17.691529+00	f
6142	Factory New	6.96	1343	2025-02-20 23:40:40.706643+00	t
6143	Minimal Wear	3.59	1343	2025-02-20 23:40:40.755205+00	t
6144	Field-Tested	2.12	1343	2025-02-20 23:40:40.721641+00	t
6145	Well-Worn	2.6	1343	2025-02-20 23:40:40.760205+00	t
6146	Battle-Scarred	3.27	1343	2025-02-20 23:40:40.698567+00	t
6147	Factory New	9.35	1345	2025-02-20 23:40:52.50067+00	f
6148	Minimal Wear	3.04	1345	2025-02-20 23:40:52.50867+00	f
6149	Field-Tested	1.77	1345	2025-02-20 23:40:52.50467+00	f
6150	Well-Worn	1.77	1345	2025-02-20 23:40:52.515185+00	f
6151	Battle-Scarred	1.6	1345	2025-02-20 23:40:52.496673+00	f
6152	Factory New	41.06	1345	2025-02-20 23:40:48.460552+00	t
6153	Minimal Wear	9.86	1345	2025-02-20 23:40:48.470553+00	t
6154	Field-Tested	5.85	1345	2025-02-20 23:40:48.467553+00	t
6155	Well-Worn	6.98	1345	2025-02-20 23:40:48.474553+00	t
6156	Battle-Scarred	5.18	1345	2025-02-20 23:40:48.456554+00	t
6157	Factory New	4.99	1347	2025-02-20 23:40:55.040369+00	f
6158	Minimal Wear	1.82	1347	2025-02-20 23:40:55.059367+00	f
6159	Field-Tested	1.13	1347	2025-02-20 23:40:55.048367+00	f
6160	Well-Worn	0.86	1347	2025-02-20 23:40:55.067369+00	f
6161	Battle-Scarred	0.77	1347	2025-02-20 23:40:55.032367+00	f
6162	Factory New	29.58	1347	2025-02-20 23:40:49.22948+00	t
6163	Minimal Wear	6.49	1347	2025-02-20 23:40:49.237477+00	t
6164	Field-Tested	3.82	1347	2025-02-20 23:40:49.234478+00	t
6165	Well-Worn	2.03	1347	2025-02-20 23:40:49.241478+00	t
6166	Battle-Scarred	2.22	1347	2025-02-20 23:40:49.223477+00	t
6167	Factory New	1.52	1349	2025-02-20 23:40:07.06186+00	f
6168	Minimal Wear	1.1	1349	2025-02-20 23:40:07.079957+00	f
6169	Field-Tested	0.98	1349	2025-02-20 23:40:07.069857+00	f
6170	Well-Worn	1.18	1349	2025-02-20 23:40:07.088955+00	f
6171	Battle-Scarred	0.75	1349	2025-02-20 23:40:07.052858+00	f
6172	Factory New	9.11	1349	2025-02-20 23:40:35.867832+00	t
6173	Minimal Wear	2.95	1349	2025-02-20 23:40:35.880767+00	t
6174	Field-Tested	1.26	1349	2025-02-20 23:40:35.875648+00	t
6175	Well-Worn	1.18	1349	2025-02-20 23:40:35.884766+00	t
6176	Battle-Scarred	0.69	1349	2025-02-20 23:40:35.860228+00	t
6177	Factory New	1.85	1351	2025-02-20 23:40:25.774526+00	f
6178	Minimal Wear	1.11	1351	2025-02-20 23:40:25.79755+00	f
6179	Field-Tested	0.84	1351	2025-02-20 23:40:25.785038+00	f
6180	Well-Worn	0.59	1351	2025-02-20 23:40:25.801553+00	f
6181	Battle-Scarred	1.46	1351	2025-02-20 23:40:25.769526+00	f
6182	Factory New	5.71	1351	2025-02-20 23:40:45.518714+00	t
6183	Minimal Wear	3.06	1351	2025-02-20 23:40:45.536714+00	t
6184	Field-Tested	2.02	1351	2025-02-20 23:40:45.522714+00	t
6185	Well-Worn	1.75	1351	2025-02-20 23:40:45.547714+00	t
6186	Battle-Scarred	1.08	1351	2025-02-20 23:40:45.506715+00	t
6187	Factory New	1.75	1353	2025-02-20 23:40:01.857366+00	f
6188	Minimal Wear	1.13	1353	2025-02-20 23:40:01.866366+00	f
6189	Field-Tested	0.93	1353	2025-02-20 23:40:01.862366+00	f
6190	Well-Worn	1.48	1353	2025-02-20 23:40:01.882506+00	f
6191	Battle-Scarred	0.81	1353	2025-02-20 23:40:01.853368+00	f
6192	Factory New	4.26	1353	2025-02-20 23:40:33.507319+00	t
6193	Minimal Wear	7.19	1353	2025-02-20 23:40:33.535127+00	t
6194	Field-Tested	1.31	1353	2025-02-20 23:40:33.518256+00	t
6195	Well-Worn	4.5	1353	2025-02-20 23:40:33.543169+00	t
6196	Battle-Scarred	1.1	1353	2025-02-20 23:40:33.495371+00	t
6197	Factory New	1.93	1355	2025-02-20 23:40:10.774451+00	f
6198	Minimal Wear	1.17	1355	2025-02-20 23:40:10.800348+00	f
6199	Field-Tested	0.73	1355	2025-02-20 23:40:10.787349+00	f
6200	Well-Worn	14.77	1355	2025-02-20 23:40:10.808867+00	f
6201	Battle-Scarred	1.36	1355	2025-02-20 23:40:10.734252+00	f
6202	Factory New	6.7	1355	2025-02-20 23:40:36.858279+00	t
6203	Minimal Wear	3.68	1355	2025-02-20 23:40:36.867376+00	t
6204	Field-Tested	1.28	1355	2025-02-20 23:40:36.863377+00	t
6205	Well-Worn	0.84	1355	2025-02-20 23:40:36.871375+00	t
6206	Battle-Scarred	2.96	1355	2025-02-20 23:40:36.852279+00	t
6207	Factory New	2.1	1357	2025-02-20 23:40:19.196367+00	f
6208	Minimal Wear	1.22	1357	2025-02-20 23:40:19.205368+00	f
6209	Field-Tested	1.26	1357	2025-02-20 23:40:19.200367+00	f
6210	Well-Worn	0.66	1357	2025-02-20 23:40:19.209367+00	f
6211	Battle-Scarred	0.69	1357	2025-02-20 23:40:19.191369+00	f
6212	Factory New	9.61	1357	2025-02-20 23:40:41.502429+00	t
6213	Minimal Wear	4	1357	2025-02-20 23:40:41.510461+00	t
6214	Field-Tested	1.92	1357	2025-02-20 23:40:41.50646+00	t
6215	Well-Worn	0.9	1357	2025-02-20 23:40:41.516461+00	t
6216	Battle-Scarred	0.69	1357	2025-02-20 23:40:41.496431+00	t
6217	Factory New	215.7	1359	2025-02-20 23:40:01.314309+00	f
6218	Minimal Wear	57.28	1359	2025-02-20 23:40:01.322309+00	f
6219	Field-Tested	36.94	1359	2025-02-20 23:40:01.318311+00	f
6220	Well-Worn	59.93	1359	2025-02-20 23:40:01.330311+00	f
6221	Battle-Scarred	49.74	1359	2025-02-20 23:40:01.30931+00	f
6222	Factory New	1193.64	1359	2025-02-20 23:40:32.95908+00	t
6223	Minimal Wear	187.18	1359	2025-02-20 23:40:32.978954+00	t
6224	Field-Tested	99.58	1359	2025-02-20 23:40:32.967828+00	t
6225	Well-Worn	118.26	1359	2025-02-20 23:40:32.988431+00	t
6226	Battle-Scarred	121.06	1359	2025-02-20 23:40:32.949135+00	t
6227	Factory New	33.8	1361	2025-02-20 23:40:22.585032+00	f
6228	Minimal Wear	19.97	1361	2025-02-20 23:40:22.593032+00	f
6229	Field-Tested	12.82	1361	2025-02-20 23:40:22.589031+00	f
6230	Well-Worn	13.79	1361	2025-02-20 23:40:22.599097+00	f
6231	Battle-Scarred	14.97	1361	2025-02-20 23:40:22.580031+00	f
6232	Factory New	195.59	1361	2025-02-20 23:40:42.801349+00	t
6233	Minimal Wear	87.09	1361	2025-02-20 23:40:42.812351+00	t
6234	Field-Tested	50.53	1361	2025-02-20 23:40:42.80735+00	t
6235	Well-Worn	88.56	1361	2025-02-20 23:40:42.816349+00	t
6236	Battle-Scarred	61.35	1361	2025-02-20 23:40:42.79735+00	t
6237	Factory New	20.7	1363	2025-02-20 23:40:54.940176+00	f
6238	Minimal Wear	11.64	1363	2025-02-20 23:40:54.947181+00	f
6239	Field-Tested	9.18	1363	2025-02-15 23:05:46.234855+00	f
6240	Well-Worn	9.95	1363	2025-02-20 23:40:54.952176+00	f
6241	Battle-Scarred	10.6	1363	2025-02-20 23:40:54.936176+00	f
6242	Factory New	79.9	1363	2025-02-20 23:40:49.216478+00	t
6243	Minimal Wear	38.8	1363	2025-02-15 23:05:44.481989+00	t
6244	Field-Tested	26.15	1363	2025-02-20 23:40:49.219477+00	t
6245	Well-Worn	\N	1363	\N	t
6246	Battle-Scarred	\N	1363	\N	t
6247	Factory New	20.78	1365	2025-02-20 23:40:23.435524+00	f
6248	Minimal Wear	11.43	1365	2025-02-20 23:40:23.449525+00	f
6249	Field-Tested	6.03	1365	2025-02-20 23:40:23.441524+00	f
6250	Well-Worn	8.69	1365	2025-02-15 18:55:18.488829+00	f
6251	Battle-Scarred	10.89	1365	2025-02-20 23:40:23.430523+00	f
6252	Factory New	61.77	1365	2025-02-20 23:40:43.299874+00	t
6253	Minimal Wear	71.4	1365	2025-02-20 23:40:43.308873+00	t
6254	Field-Tested	13.9	1365	2025-02-20 23:40:43.304873+00	t
6255	Well-Worn	20	1365	2025-02-15 23:05:42.034844+00	t
6256	Battle-Scarred	21.54	1365	2025-02-15 23:05:42.025591+00	t
6257	Factory New	13	1367	2025-02-20 23:40:27.359476+00	f
6258	Minimal Wear	5.83	1367	2025-02-20 23:40:27.369476+00	f
6259	Field-Tested	3.85	1367	2025-02-20 23:40:27.366475+00	f
6260	Well-Worn	5.27	1367	2025-02-20 23:40:27.373476+00	f
6261	Battle-Scarred	4.08	1367	2025-02-20 23:40:27.356476+00	f
6262	Factory New	60.27	1367	2025-02-20 23:40:46.158153+00	t
6263	Minimal Wear	15.5	1367	2025-02-20 23:40:46.167155+00	t
6264	Field-Tested	10.18	1367	2025-02-20 23:40:46.163154+00	t
6265	Well-Worn	11.04	1367	2025-02-20 23:40:46.171154+00	t
6266	Battle-Scarred	10.36	1367	2025-02-20 23:40:46.154154+00	t
6267	Factory New	12.46	1369	2025-02-20 23:40:14.708561+00	f
6268	Minimal Wear	8.42	1369	2025-02-20 23:40:14.725566+00	f
6269	Field-Tested	7.36	1369	2025-02-20 23:40:14.717568+00	f
6270	Well-Worn	14.7	1369	2025-02-20 23:40:14.736564+00	f
6271	Battle-Scarred	8.1	1369	2025-02-20 23:40:14.701566+00	f
6272	Factory New	44.85	1369	2025-02-20 23:40:38.925323+00	t
6273	Minimal Wear	25.65	1369	2025-02-20 23:40:38.949618+00	t
6274	Field-Tested	18.53	1369	2025-02-20 23:40:38.936133+00	t
6275	Well-Worn	23.4	1369	2025-02-20 23:40:38.954735+00	t
6276	Battle-Scarred	21.92	1369	2025-02-20 23:40:38.915015+00	t
6277	Factory New	6.66	1371	2025-02-20 23:40:16.041798+00	f
6278	Minimal Wear	3.29	1371	2025-02-20 23:40:16.052799+00	f
6279	Field-Tested	2.92	1371	2025-02-20 23:40:16.047798+00	f
6280	Well-Worn	4.84	1371	2025-02-20 23:40:16.055798+00	f
6281	Battle-Scarred	3.91	1371	2025-02-20 23:40:16.038799+00	f
6282	Factory New	21.82	1371	2025-02-20 23:40:39.560212+00	t
6283	Minimal Wear	10.22	1371	2025-02-20 23:40:39.570622+00	t
6284	Field-Tested	6.78	1371	2025-02-20 23:40:39.566622+00	t
6285	Well-Worn	12.53	1371	2025-02-20 23:40:39.573623+00	t
6286	Battle-Scarred	10.06	1371	2025-02-20 23:40:39.555211+00	t
6287	Factory New	2.36	1373	2025-02-20 23:40:30.433935+00	f
6288	Minimal Wear	1.35	1373	2025-02-20 23:40:30.455927+00	f
6289	Field-Tested	0.72	1373	2025-02-20 23:40:30.442451+00	f
6290	Well-Worn	0.65	1373	2025-02-20 23:40:30.465448+00	f
6291	Battle-Scarred	0.96	1373	2025-02-20 23:40:30.424653+00	f
6292	Factory New	15.79	1373	2025-02-20 23:40:47.372727+00	t
6293	Minimal Wear	7.39	1373	2025-02-20 23:40:47.384728+00	t
6294	Field-Tested	2.73	1373	2025-02-20 23:40:47.379729+00	t
6295	Well-Worn	1.82	1373	2025-02-20 23:40:47.392073+00	t
6296	Battle-Scarred	2	1373	2025-02-20 23:40:47.368727+00	t
6297	Factory New	2.28	1375	2025-02-20 23:40:12.63647+00	f
6298	Minimal Wear	1.98	1375	2025-02-20 23:40:12.654471+00	f
6299	Field-Tested	2.27	1375	2025-02-20 23:40:12.645472+00	f
6300	Factory New	8.1	1375	2025-02-20 23:40:37.556086+00	t
6301	Minimal Wear	6.63	1375	2025-02-20 23:40:37.572087+00	t
6302	Field-Tested	6.25	1375	2025-02-20 23:40:37.56209+00	t
6303	Factory New	4.21	1377	2025-02-20 23:40:17.859038+00	f
6304	Minimal Wear	0.55	1377	2025-02-20 23:40:17.86904+00	f
6305	Field-Tested	0.4	1377	2025-02-20 23:40:17.86404+00	f
6306	Well-Worn	2.18	1377	2025-02-20 23:40:17.872039+00	f
6307	Battle-Scarred	0.58	1377	2025-02-20 23:40:17.855039+00	f
6308	Factory New	13.63	1377	2025-02-15 23:05:40.851626+00	t
6309	Minimal Wear	1.56	1377	2025-02-20 23:40:40.847629+00	t
6310	Field-Tested	1.5	1377	2025-02-20 23:40:40.841628+00	t
6311	Well-Worn	2.03	1377	2025-02-20 23:40:40.851628+00	t
6312	Battle-Scarred	2.1	1377	2025-02-20 23:40:40.833629+00	t
6313	Factory New	2.68	1379	2025-02-20 23:40:51.540834+00	f
6314	Minimal Wear	0.62	1379	2025-02-20 23:40:51.550834+00	f
6315	Field-Tested	0.43	1379	2025-02-20 23:40:51.545835+00	f
6316	Factory New	6.95	1379	2025-02-20 23:40:48.093809+00	t
6317	Minimal Wear	2.22	1379	2025-02-20 23:40:48.10381+00	t
6318	Field-Tested	1.31	1379	2025-02-20 23:40:48.09881+00	t
6319	Factory New	2.05	1381	2025-02-20 23:40:09.907674+00	f
6320	Minimal Wear	2.04	1381	2025-02-20 23:40:09.916945+00	f
6321	Field-Tested	2.3	1381	2025-02-15 23:05:28.678015+00	f
6322	Factory New	4.6	1381	2025-02-20 23:40:36.664097+00	t
6323	Minimal Wear	4.3	1381	2025-02-20 23:40:36.673096+00	t
6324	Field-Tested	3.99	1381	2025-02-20 23:40:36.669096+00	t
6325	Factory New	0.86	1383	2025-02-20 23:40:19.845542+00	f
6326	Minimal Wear	0.64	1383	2025-02-20 23:40:19.867543+00	f
6327	Field-Tested	0.45	1383	2025-02-20 23:40:19.861542+00	f
6328	Well-Worn	1.46	1383	2025-02-20 23:40:19.883541+00	f
6329	Battle-Scarred	2.76	1383	2025-02-20 23:40:19.839544+00	f
6330	Factory New	2.57	1383	2025-02-20 23:40:41.802071+00	t
6331	Minimal Wear	2.31	1383	2025-02-20 23:40:41.810071+00	t
6332	Field-Tested	1.57	1383	2025-02-20 23:40:41.807071+00	t
6333	Well-Worn	17.74	1383	2025-02-20 23:40:41.816072+00	t
6334	Battle-Scarred	10.71	1383	2025-02-20 23:40:41.797269+00	t
6335	Factory New	0.65	1385	2025-02-20 23:40:10.821465+00	f
6336	Minimal Wear	0.57	1385	2025-02-20 23:40:10.850014+00	f
6337	Field-Tested	0.5	1385	2025-02-20 23:40:10.837981+00	f
6338	Factory New	2	1385	2025-02-20 23:40:36.874932+00	t
6339	Minimal Wear	1.7	1385	2025-02-20 23:40:36.885021+00	t
6340	Field-Tested	1.56	1385	2025-02-20 23:40:36.88002+00	t
6341	Factory New	402.74	1387	2025-02-20 23:40:00.199146+00	f
6342	Minimal Wear	258.13	1387	2025-02-20 23:40:00.205143+00	f
6343	Field-Tested	205.48	1387	2025-02-20 23:40:00.202153+00	f
6344	Well-Worn	167.07	1387	2025-02-20 23:40:00.208143+00	f
6345	Battle-Scarred	152.91	1387	2025-02-20 23:40:00.191144+00	f
6346	Factory New	857.45	1387	2025-02-20 23:40:31.686965+00	t
6347	Minimal Wear	532.21	1387	2025-02-20 23:40:31.73603+00	t
6348	Field-Tested	364.96	1387	2025-02-20 23:40:31.712554+00	t
6349	Well-Worn	274	1387	2025-02-20 23:40:31.743029+00	t
6350	Battle-Scarred	216.84	1387	2025-02-20 23:40:31.675928+00	t
6351	Factory New	11.56	1389	2025-02-20 23:40:16.456166+00	f
6352	Minimal Wear	7.37	1389	2025-02-20 23:40:16.465167+00	f
6353	Field-Tested	7.24	1389	2025-02-20 23:40:16.459166+00	f
6354	Well-Worn	15.1	1389	2025-02-20 23:40:16.468166+00	f
6355	Battle-Scarred	11.22	1389	2025-02-20 23:40:16.452166+00	f
6356	Factory New	55.7	1389	2025-02-20 23:40:39.760059+00	t
6357	Minimal Wear	26.13	1389	2025-02-20 23:40:39.76906+00	t
6358	Field-Tested	26.69	1389	2025-02-20 23:40:39.766059+00	t
6359	Well-Worn	30.08	1389	2025-02-20 23:40:39.77406+00	t
6360	Battle-Scarred	25.5	1389	2025-02-15 23:05:40.427229+00	t
6361	Factory New	35.98	1391	2025-02-20 23:40:05.050257+00	f
6362	Minimal Wear	26.04	1391	2025-02-20 23:40:05.058258+00	f
6363	Field-Tested	19.4	1391	2025-02-20 23:40:05.054257+00	f
6364	Well-Worn	30.53	1391	2025-02-20 23:40:05.064258+00	f
6365	Battle-Scarred	23.18	1391	2025-02-20 23:40:05.046258+00	f
6366	Factory New	95.2	1391	2025-02-20 23:40:35.303068+00	t
6367	Minimal Wear	55.35	1391	2025-02-20 23:40:35.316068+00	t
6368	Field-Tested	38.26	1391	2025-02-20 23:40:35.309068+00	t
6369	Well-Worn	50.93	1391	2025-02-20 23:40:35.320277+00	t
6370	Battle-Scarred	45.55	1391	2025-02-20 23:40:35.298898+00	t
6371	Factory New	34	1393	2025-02-20 23:40:03.373664+00	f
6372	Minimal Wear	22.23	1393	2025-02-20 23:40:03.383664+00	f
6373	Field-Tested	18.39	1393	2025-02-20 23:40:03.378664+00	f
6374	Well-Worn	17.68	1393	2025-02-20 23:40:03.387664+00	f
6375	Battle-Scarred	17.37	1393	2025-02-20 23:40:03.368662+00	f
6376	Factory New	82.17	1393	2025-02-20 23:40:34.087474+00	t
6377	Minimal Wear	44.21	1393	2025-02-20 23:40:34.097473+00	t
6378	Field-Tested	30.41	1393	2025-02-20 23:40:34.092474+00	t
6379	Well-Worn	35.82	1393	2025-02-20 23:40:34.101803+00	t
6380	Battle-Scarred	33.29	1393	2025-02-20 23:40:34.082959+00	t
6381	Factory New	30.41	1395	2025-02-20 23:40:21.860552+00	f
6382	Minimal Wear	22.53	1395	2025-02-20 23:40:21.870551+00	f
6383	Field-Tested	18.1	1395	2025-02-20 23:40:21.866552+00	f
6384	Well-Worn	16.66	1395	2025-02-20 23:40:21.874552+00	f
6385	Battle-Scarred	20.53	1395	2025-02-20 23:40:21.855553+00	f
6386	Factory New	70.91	1395	2025-02-20 23:40:42.557761+00	t
6387	Minimal Wear	44.02	1395	2025-02-20 23:40:42.56876+00	t
6388	Field-Tested	30.73	1395	2025-02-20 23:40:42.563762+00	t
6389	Well-Worn	\N	1395	\N	t
6390	Battle-Scarred	29.46	1395	2025-02-20 23:40:42.55376+00	t
6391	Factory New	8.59	1397	2025-02-20 23:40:13.282385+00	f
6392	Minimal Wear	4.03	1397	2025-02-20 23:40:13.292385+00	f
6393	Field-Tested	2.69	1397	2025-02-20 23:40:13.288386+00	f
6394	Well-Worn	3.69	1397	2025-02-20 23:40:13.299385+00	f
6395	Battle-Scarred	2.73	1397	2025-02-20 23:40:13.276385+00	f
6396	Factory New	35.79	1397	2025-02-20 23:40:37.848454+00	t
6397	Minimal Wear	8.6	1397	2025-02-20 23:40:37.873297+00	t
6398	Field-Tested	6.66	1397	2025-02-20 23:40:37.856135+00	t
6399	Well-Worn	5.99	1397	2025-02-20 23:40:37.893647+00	t
6400	Battle-Scarred	5.49	1397	2025-02-20 23:40:37.826385+00	t
6401	Factory New	7.97	1399	2025-02-20 23:40:08.746285+00	f
6402	Minimal Wear	4.82	1399	2025-02-20 23:40:08.758284+00	f
6403	Field-Tested	2.97	1399	2025-02-20 23:40:08.751289+00	f
6404	Well-Worn	4.32	1399	2025-02-20 23:40:08.765285+00	f
6405	Battle-Scarred	4.48	1399	2025-02-20 23:40:08.737285+00	f
6406	Factory New	20.09	1399	2025-02-20 23:40:36.259547+00	t
6407	Minimal Wear	10.43	1399	2025-02-20 23:40:36.269712+00	t
6408	Field-Tested	5.92	1399	2025-02-20 23:40:36.264713+00	t
6409	Well-Worn	7.08	1399	2025-02-20 23:40:36.273713+00	t
6410	Battle-Scarred	5.74	1399	2025-02-20 23:40:36.255548+00	t
6411	Factory New	4.37	1401	2025-02-20 23:40:09.888674+00	f
6412	Minimal Wear	2.97	1401	2025-02-20 23:40:09.898674+00	f
6413	Field-Tested	2.48	1401	2025-02-20 23:40:09.892674+00	f
6414	Well-Worn	3.86	1401	2025-02-20 23:40:09.902674+00	f
6415	Battle-Scarred	6.52	1401	2025-02-20 23:40:09.883674+00	f
6416	Factory New	10.72	1401	2025-02-20 23:40:36.65103+00	t
6417	Minimal Wear	16.17	1401	2025-02-20 23:40:36.660095+00	t
6418	Field-Tested	5.91	1401	2025-02-20 23:40:36.656029+00	t
6419	Well-Worn	\N	1401	\N	t
6420	Battle-Scarred	7	1401	2025-02-15 23:05:39.222667+00	t
6421	Factory New	4.05	1403	2025-02-20 23:40:18.149628+00	f
6422	Minimal Wear	2.94	1403	2025-02-20 23:40:18.157629+00	f
6423	Field-Tested	2.48	1403	2025-02-20 23:40:18.153629+00	f
6424	Well-Worn	2.73	1403	2025-02-20 23:40:18.162629+00	f
6425	Factory New	9.08	1403	2025-02-20 23:40:41.065729+00	t
6426	Minimal Wear	8.84	1403	2025-02-20 23:40:41.075729+00	t
6427	Field-Tested	5.1	1403	2025-02-20 23:40:41.070729+00	t
6428	Well-Worn	9.75	1403	2025-02-20 23:40:41.081729+00	t
6429	Factory New	4.1	1405	2025-02-20 23:40:19.237368+00	f
6430	Minimal Wear	3.13	1405	2025-02-20 23:40:19.247368+00	f
6431	Field-Tested	2.94	1405	2025-02-20 23:40:19.242369+00	f
6432	Well-Worn	4.04	1405	2025-02-20 23:40:19.251367+00	f
6433	Factory New	10.03	1405	2025-02-20 23:40:41.520461+00	t
6434	Minimal Wear	6.97	1405	2025-02-20 23:40:41.531462+00	t
6435	Field-Tested	6.45	1405	2025-02-20 23:40:41.525461+00	t
6436	Well-Worn	37.72	1405	2025-02-20 23:40:41.535461+00	t
6437	Factory New	6.36	1407	2025-02-20 23:40:53.17117+00	f
6438	Minimal Wear	1.83	1407	2025-02-20 23:40:53.18717+00	f
6439	Field-Tested	1.93	1407	2025-02-20 23:40:53.179171+00	f
6440	Well-Worn	1.58	1407	2025-02-20 23:40:53.195171+00	f
6441	Battle-Scarred	1.48	1407	2025-02-20 23:40:53.159195+00	f
6442	Factory New	22.99	1407	2025-02-20 23:40:48.671684+00	t
6443	Minimal Wear	6.46	1407	2025-02-20 23:40:48.68177+00	t
6444	Field-Tested	3.63	1407	2025-02-20 23:40:48.675685+00	t
6445	Well-Worn	3.5	1407	2025-02-20 23:40:48.685771+00	t
6446	Battle-Scarred	3.7	1407	2025-02-20 23:40:48.668684+00	t
6447	Factory New	1.78	1409	2025-02-20 23:40:05.72071+00	f
6448	Minimal Wear	0.61	1409	2025-02-20 23:40:05.731709+00	f
6449	Field-Tested	0.53	1409	2025-02-20 23:40:05.725711+00	f
6450	Well-Worn	0.4	1409	2025-02-20 23:40:05.735709+00	f
6451	Battle-Scarred	0.39	1409	2025-02-20 23:40:05.71671+00	f
6452	Factory New	8.16	1409	2025-02-20 23:40:35.519816+00	t
6453	Minimal Wear	1.51	1409	2025-02-20 23:40:35.529681+00	t
6454	Field-Tested	0.78	1409	2025-02-20 23:40:35.523991+00	t
6455	Well-Worn	0.84	1409	2025-02-20 23:40:35.533679+00	t
6456	Battle-Scarred	0.57	1409	2025-02-20 23:40:35.516812+00	t
6457	Factory New	2.36	1411	2025-02-20 23:40:26.022383+00	f
6458	Minimal Wear	0.62	1411	2025-02-20 23:40:26.041388+00	f
6459	Field-Tested	0.6	1411	2025-02-20 23:40:26.036384+00	f
6460	Well-Worn	0.62	1411	2025-02-20 23:40:26.055383+00	f
6461	Battle-Scarred	0.4	1411	2025-02-20 23:40:26.010333+00	f
6462	Factory New	5.16	1411	2025-02-20 23:40:45.645533+00	t
6463	Minimal Wear	1.4	1411	2025-02-20 23:40:45.660531+00	t
6464	Field-Tested	0.8	1411	2025-02-20 23:40:45.64953+00	t
6465	Well-Worn	0.59	1411	2025-02-20 23:40:45.665531+00	t
6466	Battle-Scarred	0.56	1411	2025-02-20 23:40:45.633531+00	t
6467	Factory New	1.63	1413	2025-02-20 23:40:49.737776+00	f
6468	Minimal Wear	0.6	1413	2025-02-20 23:40:49.748774+00	f
6469	Field-Tested	0.56	1413	2025-02-20 23:40:49.741774+00	f
6470	Well-Worn	0.44	1413	2025-02-20 23:40:49.754775+00	f
6471	Battle-Scarred	0.38	1413	2025-02-20 23:40:49.733774+00	f
6472	Factory New	6.17	1413	2025-02-20 23:40:47.874577+00	t
6473	Minimal Wear	2.37	1413	2025-02-20 23:40:47.884332+00	t
6474	Field-Tested	0.95	1413	2025-02-20 23:40:47.877576+00	t
6475	Well-Worn	0.89	1413	2025-02-20 23:40:47.887331+00	t
6476	Battle-Scarred	0.71	1413	2025-02-20 23:40:47.868576+00	t
6477	Factory New	1.24	1415	2025-02-20 23:40:29.494922+00	f
6478	Minimal Wear	0.63	1415	2025-02-20 23:40:29.514919+00	f
6479	Field-Tested	0.56	1415	2025-02-20 23:40:29.50592+00	f
6480	Well-Worn	0.56	1415	2025-02-20 23:40:29.521919+00	f
6481	Battle-Scarred	0.66	1415	2025-02-20 23:40:29.488919+00	f
6482	Factory New	7.33	1415	2025-02-20 23:40:47.157959+00	t
6483	Minimal Wear	1.9	1415	2025-02-20 23:40:47.167958+00	t
6484	Field-Tested	0.99	1415	2025-02-20 23:40:47.162959+00	t
6485	Well-Worn	1.17	1415	2025-02-20 23:40:47.172959+00	t
6486	Battle-Scarred	1.04	1415	2025-02-20 23:40:47.154959+00	t
6487	Factory New	1.03	1417	2025-02-20 23:40:17.097935+00	f
6488	Minimal Wear	0.69	1417	2025-02-20 23:40:17.106444+00	f
6489	Field-Tested	0.6	1417	2025-02-20 23:40:17.102454+00	f
6490	Well-Worn	0.77	1417	2025-02-20 23:40:17.111446+00	f
6491	Battle-Scarred	0.52	1417	2025-02-20 23:40:17.090932+00	f
6492	Factory New	3.54	1417	2025-02-20 23:40:40.21976+00	t
6493	Minimal Wear	2.18	1417	2025-02-20 23:40:40.233324+00	t
6494	Field-Tested	1.18	1417	2025-02-20 23:40:40.224681+00	t
6495	Well-Worn	2.23	1417	2025-02-20 23:40:40.239685+00	t
6496	Battle-Scarred	3.2	1417	2025-02-15 23:05:40.613196+00	t
6497	Factory New	127.24	1419	2025-02-20 23:40:15.596343+00	f
6498	Minimal Wear	51.4	1419	2025-02-20 23:40:15.604343+00	f
6499	Field-Tested	23.53	1419	2025-02-20 23:40:15.600343+00	f
6500	Well-Worn	29.09	1419	2025-02-20 23:40:15.608342+00	f
6501	Battle-Scarred	18.07	1419	2025-02-20 23:40:15.591343+00	f
6502	Factory New	216.52	1419	2025-02-20 23:40:39.297854+00	t
6503	Minimal Wear	104.07	1419	2025-02-20 23:40:39.305585+00	t
6504	Field-Tested	47.31	1419	2025-02-20 23:40:39.301584+00	t
6505	Well-Worn	65.45	1419	2025-02-15 23:05:40.208962+00	t
6506	Battle-Scarred	114.26	1419	2025-02-20 23:40:39.292854+00	t
6507	Factory New	38.12	1421	2025-02-20 23:40:12.325256+00	f
6508	Minimal Wear	13.27	1421	2025-02-20 23:40:12.335255+00	f
6509	Field-Tested	6.96	1421	2025-02-20 23:40:12.331256+00	f
6510	Well-Worn	5.58	1421	2025-02-20 23:40:12.339255+00	f
6511	Battle-Scarred	5.58	1421	2025-02-20 23:40:12.320255+00	f
6512	Factory New	162.34	1421	2025-02-20 23:40:37.431673+00	t
6513	Minimal Wear	56.21	1421	2025-02-20 23:40:37.4399+00	t
6514	Field-Tested	28.47	1421	2025-02-20 23:40:37.4359+00	t
6515	Well-Worn	17.83	1421	2025-02-20 23:40:37.443902+00	t
6516	Battle-Scarred	18.34	1421	2025-02-20 23:40:37.428684+00	t
6517	Factory New	13.53	1423	2025-02-20 23:40:16.915408+00	f
6518	Minimal Wear	5.92	1423	2025-02-20 23:40:16.923407+00	f
6519	Field-Tested	2.77	1423	2025-02-20 23:40:16.919407+00	f
6520	Well-Worn	2.96	1423	2025-02-20 23:40:16.928408+00	f
6521	Battle-Scarred	2.29	1423	2025-02-20 23:40:16.911409+00	f
6522	Factory New	52.62	1423	2025-02-20 23:40:40.057659+00	t
6523	Minimal Wear	14.42	1423	2025-02-20 23:40:40.076936+00	t
6524	Field-Tested	6.93	1423	2025-02-20 23:40:40.065659+00	t
6525	Well-Worn	6.25	1423	2025-02-20 23:40:40.090766+00	t
6526	Battle-Scarred	5.6	1423	2025-02-20 23:40:40.051658+00	t
6527	Factory New	12.34	1425	2025-02-20 23:40:00.965534+00	f
6528	Minimal Wear	6.82	1425	2025-02-20 23:40:00.973534+00	f
6529	Field-Tested	4.79	1425	2025-02-20 23:40:00.968534+00	f
6530	Well-Worn	24.4	1425	2025-02-20 23:40:00.979535+00	f
6531	Battle-Scarred	5.46	1425	2025-02-20 23:40:00.958533+00	f
6532	Factory New	35.99	1425	2025-02-20 23:40:32.47769+00	t
6533	Minimal Wear	21.59	1425	2025-02-20 23:40:32.49259+00	t
6534	Field-Tested	12.02	1425	2025-02-20 23:40:32.483051+00	t
6535	Well-Worn	19.67	1425	2025-02-20 23:40:32.498577+00	t
6536	Battle-Scarred	14.34	1425	2025-02-20 23:40:32.470684+00	t
6537	Factory New	10.98	1427	2025-02-20 23:40:18.022786+00	f
6538	Minimal Wear	5.1	1427	2025-02-20 23:40:18.032786+00	f
6539	Field-Tested	2.25	1427	2025-02-20 23:40:18.028787+00	f
6540	Well-Worn	1.89	1427	2025-02-20 23:40:18.036786+00	f
6541	Battle-Scarred	2.39	1427	2025-02-20 23:40:18.018786+00	f
6542	Factory New	37.2	1427	2025-02-20 23:40:40.966893+00	t
6543	Minimal Wear	10.7	1427	2025-02-20 23:40:40.974928+00	t
6544	Field-Tested	5.03	1427	2025-02-20 23:40:40.970894+00	t
6545	Well-Worn	6.02	1427	2025-02-20 23:40:40.980497+00	t
6546	Battle-Scarred	6.23	1427	2025-02-20 23:40:40.962901+00	t
6547	Factory New	3.06	1429	2025-02-20 23:40:29.248278+00	f
6548	Minimal Wear	1.57	1429	2025-02-20 23:40:29.276545+00	f
6549	Field-Tested	0.69	1429	2025-02-20 23:40:29.262868+00	f
6550	Well-Worn	1.2	1429	2025-02-20 23:40:29.291069+00	f
6551	Battle-Scarred	0.89	1429	2025-02-20 23:40:29.237387+00	f
6552	Factory New	11.42	1429	2025-02-20 23:40:47.08296+00	t
6553	Minimal Wear	4.31	1429	2025-02-20 23:40:47.090959+00	t
6554	Field-Tested	1.88	1429	2025-02-20 23:40:47.086959+00	t
6555	Well-Worn	5.12	1429	2025-02-20 23:40:47.095961+00	t
6556	Battle-Scarred	2.2	1429	2025-02-20 23:40:47.076959+00	t
6557	Factory New	3.16	1431	2025-02-20 23:40:22.441474+00	f
6558	Minimal Wear	1.19	1431	2025-02-20 23:40:22.450499+00	f
6559	Field-Tested	0.59	1431	2025-02-20 23:40:22.446499+00	f
6560	Well-Worn	0.67	1431	2025-02-20 23:40:22.4575+00	f
6561	Battle-Scarred	0.46	1431	2025-02-20 23:40:22.437304+00	f
6562	Factory New	7.4	1431	2025-02-20 23:40:42.768444+00	t
6563	Minimal Wear	2.68	1431	2025-02-20 23:40:42.776443+00	t
6564	Field-Tested	1.45	1431	2025-02-20 23:40:42.772444+00	t
6565	Well-Worn	2.02	1431	2025-02-20 23:40:42.781443+00	t
6566	Battle-Scarred	1.31	1431	2025-02-20 23:40:42.762445+00	t
6567	Factory New	2.93	1433	2025-02-20 23:40:28.445526+00	f
6568	Minimal Wear	1.04	1433	2025-02-20 23:40:28.456525+00	f
6569	Field-Tested	0.59	1433	2025-02-20 23:40:28.452525+00	f
6570	Well-Worn	0.36	1433	2025-02-20 23:40:28.459524+00	f
6571	Battle-Scarred	0.34	1433	2025-02-20 23:40:28.440524+00	f
6572	Factory New	8.11	1433	2025-02-20 23:40:46.609234+00	t
6573	Minimal Wear	1.85	1433	2025-02-20 23:40:46.618039+00	t
6574	Field-Tested	1.25	1433	2025-02-20 23:40:46.615043+00	t
6575	Well-Worn	1.33	1433	2025-02-20 23:40:46.622039+00	t
6576	Battle-Scarred	1.3	1433	2025-02-20 23:40:46.605234+00	t
6577	Factory New	1.94	1435	2025-02-20 23:40:27.452677+00	f
6578	Minimal Wear	0.82	1435	2025-02-20 23:40:27.460808+00	f
6579	Field-Tested	0.42	1435	2025-02-20 23:40:27.455677+00	f
6580	Well-Worn	0.39	1435	2025-02-20 23:40:27.467802+00	f
6581	Battle-Scarred	0.55	1435	2025-02-20 23:40:27.448677+00	f
6582	Factory New	5.37	1435	2025-02-20 23:40:46.220822+00	t
6583	Minimal Wear	1.72	1435	2025-02-20 23:40:46.23182+00	t
6584	Field-Tested	0.84	1435	2025-02-20 23:40:46.225821+00	t
6585	Well-Worn	0.75	1435	2025-02-20 23:40:46.236822+00	t
6586	Battle-Scarred	0.75	1435	2025-02-20 23:40:46.216821+00	t
6587	Factory New	2.24	1437	2025-02-20 23:40:30.02741+00	f
6588	Minimal Wear	1.11	1437	2025-02-20 23:40:30.057783+00	f
6589	Field-Tested	0.5	1437	2025-02-20 23:40:30.041779+00	f
6590	Well-Worn	0.53	1437	2025-02-20 23:40:30.067559+00	f
6591	Battle-Scarred	0.53	1437	2025-02-20 23:40:30.018409+00	f
6592	Factory New	5.12	1437	2025-02-20 23:40:47.297727+00	t
6593	Minimal Wear	1.92	1437	2025-02-20 23:40:47.305729+00	t
6594	Field-Tested	1.05	1437	2025-02-20 23:40:47.301727+00	t
6595	Well-Worn	0.88	1437	2025-02-20 23:40:47.312729+00	t
6596	Battle-Scarred	0.87	1437	2025-02-20 23:40:47.291727+00	t
6597	Factory New	3.16	1439	2025-02-20 23:40:02.80843+00	f
6598	Minimal Wear	0.65	1439	2025-02-20 23:40:02.818424+00	f
6599	Field-Tested	0.31	1439	2025-02-20 23:40:02.812425+00	f
6600	Well-Worn	0.68	1439	2025-02-20 23:40:02.827425+00	f
6601	Battle-Scarred	0.35	1439	2025-02-20 23:40:02.797876+00	f
6602	Factory New	9.82	1439	2025-02-20 23:40:33.835385+00	t
6603	Minimal Wear	2.55	1439	2025-02-20 23:40:33.84539+00	t
6604	Field-Tested	1.64	1439	2025-02-20 23:40:33.839386+00	t
6605	Well-Worn	2.94	1439	2025-02-20 23:40:33.852032+00	t
6606	Battle-Scarred	1.94	1439	2025-02-20 23:40:33.831386+00	t
6607	Factory New	1.61	1441	2025-02-20 23:40:04.72467+00	f
6608	Minimal Wear	0.47	1441	2025-02-20 23:40:04.735402+00	f
6609	Field-Tested	0.25	1441	2025-02-20 23:40:04.73089+00	f
6610	Well-Worn	0.27	1441	2025-02-20 23:40:04.740402+00	f
6611	Battle-Scarred	0.22	1441	2025-02-20 23:40:04.716658+00	f
6612	Factory New	8.07	1441	2025-02-20 23:40:35.07418+00	t
6613	Minimal Wear	2.1	1441	2025-02-20 23:40:35.083345+00	t
6614	Field-Tested	1.03	1441	2025-02-20 23:40:35.079182+00	t
6615	Well-Worn	0.74	1441	2025-02-20 23:40:35.087347+00	t
6616	Battle-Scarred	0.8	1441	2025-02-20 23:40:35.069335+00	t
6617	Factory New	0.35	1443	2025-02-20 23:40:04.10073+00	f
6618	Minimal Wear	0.11	1443	2025-02-20 23:40:04.111729+00	f
6619	Field-Tested	0.09	1443	2025-02-20 23:40:04.10673+00	f
6620	Well-Worn	0.08	1443	2025-02-20 23:40:04.11673+00	f
6621	Battle-Scarred	0.08	1443	2025-02-20 23:40:04.096729+00	f
6622	Factory New	1.3	1443	2025-02-20 23:40:34.601934+00	t
6623	Minimal Wear	0.38	1443	2025-02-20 23:40:34.618094+00	t
6624	Field-Tested	0.16	1443	2025-02-20 23:40:34.610934+00	t
6625	Well-Worn	0.14	1443	2025-02-20 23:40:34.622613+00	t
6626	Battle-Scarred	0.17	1443	2025-02-20 23:40:34.592481+00	t
6627	Factory New	0.44	1445	2025-02-20 23:40:18.557658+00	f
6628	Minimal Wear	0.12	1445	2025-02-20 23:40:18.567657+00	f
6629	Field-Tested	0.1	1445	2025-02-20 23:40:18.562659+00	f
6630	Well-Worn	0.09	1445	2025-02-20 23:40:18.571657+00	f
6631	Battle-Scarred	0.06	1445	2025-02-20 23:40:18.553658+00	f
6632	Factory New	1.19	1445	2025-02-20 23:40:41.205638+00	t
6633	Minimal Wear	0.28	1445	2025-02-20 23:40:41.214638+00	t
6634	Field-Tested	0.13	1445	2025-02-20 23:40:41.209637+00	t
6635	Well-Worn	0.13	1445	2025-02-20 23:40:41.220638+00	t
6636	Battle-Scarred	0.13	1445	2025-02-20 23:40:41.198729+00	t
6637	Factory New	0.27	1447	2025-02-20 23:40:21.48872+00	f
6638	Minimal Wear	0.15	1447	2025-02-20 23:40:21.496721+00	f
6639	Field-Tested	0.07	1447	2025-02-20 23:40:21.492722+00	f
6640	Well-Worn	0.15	1447	2025-02-20 23:40:21.50072+00	f
6641	Battle-Scarred	0.12	1447	2025-02-20 23:40:21.484721+00	f
6642	Factory New	1.25	1447	2025-02-20 23:40:42.305882+00	t
6643	Minimal Wear	0.53	1447	2025-02-20 23:40:42.313882+00	t
6644	Field-Tested	0.13	1447	2025-02-20 23:40:42.309882+00	t
6645	Well-Worn	0.16	1447	2025-02-20 23:40:42.318503+00	t
6646	Battle-Scarred	0.13	1447	2025-02-20 23:40:42.297884+00	t
6647	Factory New	0.32	1449	2025-02-20 23:40:26.506682+00	f
6648	Minimal Wear	0.16	1449	2025-02-20 23:40:26.519677+00	f
6649	Field-Tested	0.08	1449	2025-02-20 23:40:26.511679+00	f
6650	Well-Worn	0.11	1449	2025-02-20 23:40:26.523679+00	f
6651	Battle-Scarred	0.11	1449	2025-02-20 23:40:26.501646+00	f
6652	Factory New	0.75	1449	2025-02-20 23:40:45.807714+00	t
6653	Minimal Wear	0.37	1449	2025-02-20 23:40:45.820713+00	t
6654	Field-Tested	0.15	1449	2025-02-20 23:40:45.810713+00	t
6655	Well-Worn	0.23	1449	2025-02-20 23:40:45.824714+00	t
6656	Battle-Scarred	0.24	1449	2025-02-20 23:40:45.8032+00	t
6657	Factory New	0.29	1451	2025-02-20 23:40:02.342745+00	f
6658	Minimal Wear	0.15	1451	2025-02-20 23:40:02.362746+00	f
6659	Field-Tested	0.11	1451	2025-02-20 23:40:02.357745+00	f
6660	Well-Worn	0.16	1451	2025-02-20 23:40:02.378651+00	f
6661	Battle-Scarred	0.05	1451	2025-02-20 23:40:02.337145+00	f
6662	Factory New	1.16	1451	2025-02-20 23:40:33.6868+00	t
6663	Minimal Wear	0.4	1451	2025-02-20 23:40:33.6968+00	t
6664	Field-Tested	0.13	1451	2025-02-20 23:40:33.690807+00	t
6665	Well-Worn	0.39	1451	2025-02-20 23:40:33.701044+00	t
6666	Battle-Scarred	0.16	1451	2025-02-20 23:40:33.6818+00	t
6667	Factory New	156.71	1453	2025-02-20 23:40:16.498725+00	f
6668	Minimal Wear	46.75	1453	2025-02-20 23:40:16.510726+00	f
6669	Field-Tested	14.57	1453	2025-02-20 23:40:16.504726+00	f
6670	Well-Worn	19.07	1453	2025-02-20 23:40:16.515726+00	f
6671	Battle-Scarred	18.48	1453	2025-02-20 23:40:16.494727+00	f
6672	Factory New	367.74	1453	2025-02-20 23:40:39.78406+00	t
6673	Minimal Wear	114.29	1453	2025-02-20 23:40:39.793059+00	t
6674	Field-Tested	39.15	1453	2025-02-20 23:40:39.789059+00	t
6675	Well-Worn	39.9	1453	2025-02-20 23:40:39.79906+00	t
6676	Battle-Scarred	35.49	1453	2025-02-20 23:40:39.77806+00	t
6677	Factory New	13.28	1455	2025-02-20 23:40:08.881611+00	f
6678	Minimal Wear	6.41	1455	2025-02-20 23:40:08.901616+00	f
6679	Field-Tested	3.94	1455	2025-02-20 23:40:08.889611+00	f
6680	Well-Worn	5.55	1455	2025-02-20 23:40:08.909017+00	f
6681	Battle-Scarred	5.68	1455	2025-02-20 23:40:08.868611+00	f
6682	Factory New	44.58	1455	2025-02-20 23:40:36.306406+00	t
6683	Minimal Wear	22.79	1455	2025-02-20 23:40:36.316407+00	t
6684	Field-Tested	10.12	1455	2025-02-20 23:40:36.310407+00	t
6685	Well-Worn	16.4	1455	2025-02-20 23:40:36.319407+00	t
6686	Battle-Scarred	13.86	1455	2025-02-20 23:40:36.301407+00	t
6687	Factory New	14.91	1457	2025-02-20 23:40:01.811743+00	f
6688	Minimal Wear	5.43	1457	2025-02-20 23:40:01.820255+00	f
6689	Field-Tested	1.94	1457	2025-02-20 23:40:01.816255+00	f
6690	Well-Worn	2.25	1457	2025-02-20 23:40:01.825255+00	f
6691	Battle-Scarred	1.87	1457	2025-02-20 23:40:01.805741+00	f
6692	Factory New	62.11	1457	2025-02-20 23:40:33.442466+00	t
6693	Minimal Wear	16.66	1457	2025-02-20 23:40:33.454468+00	t
6694	Field-Tested	4.13	1457	2025-02-20 23:40:33.448467+00	t
6695	Well-Worn	4.4	1457	2025-02-20 23:40:33.474311+00	t
6696	Battle-Scarred	4.43	1457	2025-02-20 23:40:33.43732+00	t
6697	Minimal Wear	11.83	1459	2025-02-20 23:40:54.55733+00	f
6698	Field-Tested	1.7	1459	2025-02-20 23:40:54.553332+00	f
6699	Well-Worn	2.55	1459	2025-02-20 23:40:54.562332+00	f
6700	Battle-Scarred	1.77	1459	2025-02-20 23:40:54.549331+00	f
6701	Minimal Wear	54.95	1459	2025-02-20 23:40:49.034431+00	t
6702	Field-Tested	4.42	1459	2025-02-20 23:40:49.029926+00	t
6703	Well-Worn	6.03	1459	2025-02-20 23:40:49.037438+00	t
6704	Battle-Scarred	4.38	1459	2025-02-20 23:40:49.024924+00	t
6705	Field-Tested	1.8	1461	2025-02-20 23:40:27.201941+00	f
6706	Well-Worn	1.71	1461	2025-02-20 23:40:27.204942+00	f
6707	Battle-Scarred	1.4	1461	2025-02-20 23:40:27.196941+00	f
6708	Field-Tested	3.68	1461	2025-02-20 23:40:46.033785+00	t
6709	Well-Worn	9.09	1461	2025-02-20 23:40:46.037785+00	t
6710	Battle-Scarred	4.22	1461	2025-02-20 23:40:46.026786+00	t
6711	Factory New	14.92	1463	2025-02-20 23:40:02.637449+00	f
6712	Minimal Wear	7.05	1463	2025-02-20 23:40:02.655+00	f
6713	Field-Tested	3.98	1463	2025-02-20 23:40:02.650483+00	f
6714	Well-Worn	3.57	1463	2025-02-20 23:40:02.667996+00	f
6715	Battle-Scarred	3.53	1463	2025-02-20 23:40:02.632449+00	f
6716	Factory New	39.71	1463	2025-02-20 23:40:33.795754+00	t
6717	Minimal Wear	18.62	1463	2025-02-20 23:40:33.80602+00	t
6718	Field-Tested	9.48	1463	2025-02-20 23:40:33.799751+00	t
6719	Well-Worn	8.31	1463	2025-02-20 23:40:33.81002+00	t
6720	Battle-Scarred	7.92	1463	2025-02-20 23:40:33.790752+00	t
6721	Factory New	4.13	1465	2025-02-20 23:40:05.072826+00	f
6722	Minimal Wear	1.88	1465	2025-02-20 23:40:05.083827+00	f
6723	Field-Tested	0.71	1465	2025-02-20 23:40:05.078827+00	f
6724	Well-Worn	0.79	1465	2025-02-20 23:40:05.087825+00	f
6725	Battle-Scarred	0.87	1465	2025-02-20 23:40:05.068825+00	f
6726	Factory New	19.49	1465	2025-02-20 23:40:35.32983+00	t
6727	Minimal Wear	7.29	1465	2025-02-20 23:40:35.337829+00	t
6728	Field-Tested	3.28	1465	2025-02-20 23:40:35.33383+00	t
6729	Well-Worn	4.17	1465	2025-02-20 23:40:35.341014+00	t
6730	Battle-Scarred	4.02	1465	2025-02-20 23:40:35.325277+00	t
6731	Factory New	2.1	1467	2025-02-20 23:40:49.421426+00	f
6732	Minimal Wear	1.11	1467	2025-02-20 23:40:49.431425+00	f
6733	Field-Tested	0.47	1467	2025-02-20 23:40:49.426426+00	f
6734	Well-Worn	0.59	1467	2025-02-20 23:40:49.435425+00	f
6735	Battle-Scarred	0.57	1467	2025-02-20 23:40:49.417479+00	f
6736	Factory New	6.63	1467	2025-02-20 23:40:47.655907+00	t
6737	Minimal Wear	2.48	1467	2025-02-20 23:40:47.664909+00	t
6738	Field-Tested	1.52	1467	2025-02-20 23:40:47.659909+00	t
6739	Well-Worn	1.91	1467	2025-02-20 23:40:47.668909+00	t
6740	Battle-Scarred	1.66	1467	2025-02-20 23:40:47.651909+00	t
6741	Factory New	1.79	1469	2025-02-20 23:40:18.605999+00	f
6742	Minimal Wear	0.73	1469	2025-02-20 23:40:18.616+00	f
6743	Field-Tested	0.34	1469	2025-02-20 23:40:18.61+00	f
6744	Well-Worn	0.35	1469	2025-02-20 23:40:18.62+00	f
6745	Battle-Scarred	0.3	1469	2025-02-20 23:40:18.600999+00	f
6746	Factory New	3.84	1469	2025-02-20 23:40:41.23264+00	t
6747	Minimal Wear	1.56	1469	2025-02-20 23:40:41.240669+00	t
6748	Field-Tested	0.82	1469	2025-02-20 23:40:41.236669+00	t
6749	Well-Worn	0.73	1469	2025-02-20 23:40:41.245669+00	t
6750	Battle-Scarred	0.7	1469	2025-02-20 23:40:41.224638+00	t
6751	Factory New	1.54	1471	2025-02-20 23:40:51.940665+00	f
6752	Minimal Wear	0.77	1471	2025-02-20 23:40:51.951039+00	f
6753	Field-Tested	0.44	1471	2025-02-20 23:40:51.946665+00	f
6754	Well-Worn	1.25	1471	2025-02-20 23:40:51.955038+00	f
6755	Factory New	3.6	1471	2025-02-20 23:40:48.214507+00	t
6756	Minimal Wear	1.79	1471	2025-02-20 23:40:48.223507+00	t
6757	Field-Tested	1.33	1471	2025-02-20 23:40:48.218506+00	t
6758	Well-Worn	6.15	1471	2025-02-20 23:40:48.230509+00	t
6759	Factory New	1.41	1473	2025-02-20 23:40:01.26431+00	f
6760	Minimal Wear	0.71	1473	2025-02-20 23:40:01.27331+00	f
6761	Field-Tested	0.42	1473	2025-02-20 23:40:01.269309+00	f
6762	Well-Worn	1.3	1473	2025-02-20 23:40:01.28031+00	f
6763	Battle-Scarred	0.49	1473	2025-02-20 23:40:01.258309+00	f
6764	Factory New	6.38	1473	2025-02-20 23:40:32.859018+00	t
6765	Minimal Wear	3.12	1473	2025-02-20 23:40:32.870917+00	t
6766	Field-Tested	2.96	1473	2025-02-20 23:40:32.866917+00	t
6767	Well-Worn	9.88	1473	2025-02-20 23:40:32.88304+00	t
6768	Battle-Scarred	3.7	1473	2025-02-20 23:40:32.855015+00	t
6769	Factory New	0.93	1475	2025-02-20 23:40:17.671693+00	f
6770	Minimal Wear	0.33	1475	2025-02-20 23:40:17.680525+00	f
6771	Field-Tested	0.15	1475	2025-02-20 23:40:17.675693+00	f
6772	Well-Worn	0.13	1475	2025-02-20 23:40:17.685526+00	f
6773	Battle-Scarred	0.12	1475	2025-02-20 23:40:17.667693+00	f
6774	Factory New	2.43	1475	2025-02-20 23:40:40.671911+00	t
6775	Minimal Wear	0.84	1475	2025-02-20 23:40:40.683727+00	t
6776	Field-Tested	0.42	1475	2025-02-20 23:40:40.67615+00	t
6777	Well-Worn	0.3	1475	2025-02-20 23:40:40.689945+00	t
6778	Battle-Scarred	0.45	1475	2025-02-20 23:40:40.667052+00	t
6779	Factory New	0.62	1477	2025-02-20 23:40:11.120335+00	f
6780	Minimal Wear	0.33	1477	2025-02-20 23:40:11.131337+00	f
6781	Field-Tested	0.19	1477	2025-02-20 23:40:11.124337+00	f
6782	Well-Worn	0.42	1477	2025-02-20 23:40:11.134336+00	f
6783	Battle-Scarred	0.21	1477	2025-02-20 23:40:11.116337+00	f
6784	Factory New	2.58	1477	2025-02-20 23:40:37.005815+00	t
6785	Minimal Wear	1.03	1477	2025-02-20 23:40:37.015106+00	t
6786	Field-Tested	0.35	1477	2025-02-20 23:40:37.010084+00	t
6787	Well-Worn	1.64	1477	2025-02-20 23:40:37.019105+00	t
6788	Battle-Scarred	0.37	1477	2025-02-20 23:40:37.001813+00	t
6789	Factory New	0.55	1479	2025-02-20 23:40:24.199628+00	f
6790	Minimal Wear	0.31	1479	2025-02-20 23:40:24.208258+00	f
6791	Field-Tested	0.15	1479	2025-02-20 23:40:24.203629+00	f
6792	Well-Worn	0.19	1479	2025-02-20 23:40:24.213259+00	f
6793	Battle-Scarred	0.26	1479	2025-02-20 23:40:24.195629+00	f
6794	Factory New	1.93	1479	2025-02-20 23:40:43.95087+00	t
6795	Minimal Wear	0.9	1479	2025-02-20 23:40:43.966871+00	t
6796	Field-Tested	0.37	1479	2025-02-20 23:40:43.960872+00	t
6797	Well-Worn	0.51	1479	2025-02-20 23:40:43.97687+00	t
6798	Battle-Scarred	0.59	1479	2025-02-20 23:40:43.946872+00	t
6799	Factory New	0.58	1481	2025-02-20 23:40:24.879726+00	f
6800	Minimal Wear	0.28	1481	2025-02-20 23:40:24.893031+00	f
6801	Field-Tested	0.16	1481	2025-02-20 23:40:24.886524+00	f
6802	Well-Worn	0.27	1481	2025-02-20 23:40:24.898541+00	f
6803	Battle-Scarred	0.15	1481	2025-02-20 23:40:24.872104+00	f
6804	Factory New	1.59	1481	2025-02-20 23:40:44.846413+00	t
6805	Minimal Wear	0.79	1481	2025-02-20 23:40:44.863414+00	t
6806	Field-Tested	0.33	1481	2025-02-20 23:40:44.857412+00	t
6807	Well-Worn	0.44	1481	2025-02-20 23:40:44.871547+00	t
6808	Battle-Scarred	0.3	1481	2025-02-20 23:40:44.837419+00	t
6809	Factory New	0.52	1483	2025-02-20 23:40:07.392086+00	f
6810	Minimal Wear	0.31	1483	2025-02-20 23:40:07.410086+00	f
6811	Field-Tested	0.15	1483	2025-02-20 23:40:07.403087+00	f
6812	Well-Worn	0.27	1483	2025-02-20 23:40:07.416086+00	f
6813	Battle-Scarred	0.17	1483	2025-02-20 23:40:07.384393+00	f
6814	Factory New	1.62	1483	2025-02-20 23:40:35.957153+00	t
6815	Minimal Wear	0.92	1483	2025-02-20 23:40:35.965669+00	t
6816	Field-Tested	0.41	1483	2025-02-20 23:40:35.960327+00	t
6817	Well-Worn	0.46	1483	2025-02-20 23:40:35.970415+00	t
6818	Battle-Scarred	0.53	1483	2025-02-20 23:40:35.953153+00	t
6819	Minimal Wear	0.52	1485	2025-02-20 23:40:19.290748+00	f
6820	Field-Tested	0.16	1485	2025-02-20 23:40:19.286747+00	f
6821	Well-Worn	0.18	1485	2025-02-20 23:40:19.294751+00	f
6822	Battle-Scarred	0.17	1485	2025-02-20 23:40:19.282747+00	f
6823	Minimal Wear	1.61	1485	2025-02-20 23:40:41.570461+00	t
6824	Field-Tested	0.36	1485	2025-02-20 23:40:41.566461+00	t
6825	Well-Worn	0.31	1485	2025-02-20 23:40:41.574461+00	t
6826	Battle-Scarred	0.28	1485	2025-02-20 23:40:41.562462+00	t
6827	Factory New	141.9	1487	2025-02-20 23:40:53.543118+00	f
6828	Minimal Wear	64.03	1487	2025-02-20 23:40:53.557054+00	f
6829	Field-Tested	36.23	1487	2025-02-20 23:40:53.552543+00	f
6830	Well-Worn	36.22	1487	2025-02-20 23:40:53.566053+00	f
6831	Battle-Scarred	29.35	1487	2025-02-20 23:40:53.537118+00	f
6832	Factory New	272.17	1487	2025-02-20 23:40:48.782103+00	t
6833	Minimal Wear	134.55	1487	2025-02-20 23:40:48.789103+00	t
6834	Field-Tested	96.38	1487	2025-02-20 23:40:48.786104+00	t
6835	Well-Worn	120.09	1487	2025-02-20 23:40:48.794609+00	t
6836	Battle-Scarred	96.32	1487	2025-02-20 23:40:48.776103+00	t
6837	Factory New	17.37	1489	2025-02-20 23:40:02.840929+00	f
6838	Minimal Wear	11.56	1489	2025-02-20 23:40:02.850929+00	f
6839	Field-Tested	8.1	1489	2025-02-20 23:40:02.846929+00	f
6840	Well-Worn	11.47	1489	2025-02-20 23:40:02.858929+00	f
6841	Battle-Scarred	9.29	1489	2025-02-20 23:40:02.832425+00	f
6842	Factory New	48.5	1489	2025-02-20 23:40:33.862101+00	t
6843	Minimal Wear	30	1489	2025-02-20 23:40:33.873684+00	t
6844	Field-Tested	23.27	1489	2025-02-20 23:40:33.866684+00	t
6845	Well-Worn	29.53	1489	2025-02-20 23:40:33.884915+00	t
6846	Battle-Scarred	25.96	1489	2025-02-20 23:40:33.857033+00	t
6847	Factory New	15.71	1491	2025-02-20 23:40:00.367968+00	f
6848	Minimal Wear	8.92	1491	2025-02-20 23:40:00.378486+00	f
6849	Field-Tested	5.4	1491	2025-02-20 23:40:00.371969+00	f
6850	Well-Worn	7.19	1491	2025-02-20 23:40:00.396486+00	f
6851	Battle-Scarred	5.19	1491	2025-02-20 23:40:00.362303+00	f
6852	Factory New	44.07	1491	2025-02-20 23:40:31.885254+00	t
6853	Minimal Wear	24.4	1491	2025-02-20 23:40:31.929174+00	t
6854	Field-Tested	13.84	1491	2025-02-20 23:40:31.905342+00	t
6855	Well-Worn	18.44	1491	2025-02-20 23:40:31.951344+00	t
6856	Battle-Scarred	13.5	1491	2025-02-20 23:40:31.862278+00	t
6857	Factory New	11.63	1493	2025-02-20 23:40:30.581434+00	f
6858	Minimal Wear	5.22	1493	2025-02-20 23:40:30.600595+00	f
6859	Field-Tested	2.97	1493	2025-02-20 23:40:30.590433+00	f
6860	Well-Worn	2.78	1493	2025-02-20 23:40:30.606143+00	f
6861	Battle-Scarred	2.36	1493	2025-02-20 23:40:30.568949+00	f
6862	Factory New	29.58	1493	2025-02-20 23:40:47.403073+00	t
6863	Minimal Wear	9.47	1493	2025-02-20 23:40:47.414073+00	t
6864	Field-Tested	5.31	1493	2025-02-20 23:40:47.409073+00	t
6865	Well-Worn	4.65	1493	2025-02-20 23:40:47.419073+00	t
6866	Battle-Scarred	4.21	1493	2025-02-20 23:40:47.398074+00	t
6867	Factory New	10.83	1495	2025-02-20 23:40:24.247008+00	f
6868	Minimal Wear	5.7	1495	2025-02-20 23:40:24.256007+00	f
6869	Field-Tested	3.1	1495	2025-02-20 23:40:24.251008+00	f
6870	Well-Worn	2.93	1495	2025-02-20 23:40:24.262008+00	f
6871	Battle-Scarred	2.25	1495	2025-02-20 23:40:24.241007+00	f
6872	Factory New	22.29	1495	2025-02-20 23:40:43.995873+00	t
6873	Minimal Wear	10.59	1495	2025-02-20 23:40:44.01087+00	t
6874	Field-Tested	5.34	1495	2025-02-20 23:40:43.999871+00	t
6875	Well-Worn	5.56	1495	2025-02-20 23:40:44.01687+00	t
6876	Battle-Scarred	5.27	1495	2025-02-20 23:40:43.983871+00	t
6877	Factory New	2.02	1497	2025-02-20 23:40:06.237462+00	f
6878	Minimal Wear	0.91	1497	2025-02-20 23:40:06.251462+00	f
6879	Field-Tested	0.45	1497	2025-02-20 23:40:06.244462+00	f
6880	Well-Worn	0.42	1497	2025-02-20 23:40:06.261462+00	f
6881	Battle-Scarred	0.44	1497	2025-02-20 23:40:06.231462+00	f
6882	Factory New	5.48	1497	2025-02-20 23:40:35.620861+00	t
6883	Minimal Wear	2.53	1497	2025-02-20 23:40:35.633973+00	t
6884	Field-Tested	1.23	1497	2025-02-20 23:40:35.629975+00	t
6885	Well-Worn	1.18	1497	2025-02-20 23:40:35.637973+00	t
6886	Battle-Scarred	1.35	1497	2025-02-20 23:40:35.617697+00	t
6887	Factory New	2.16	1499	2025-02-20 23:40:26.602743+00	f
6888	Minimal Wear	0.87	1499	2025-02-20 23:40:26.62858+00	f
6889	Field-Tested	0.54	1499	2025-02-20 23:40:26.616576+00	f
6890	Well-Worn	0.42	1499	2025-02-20 23:40:26.638577+00	f
6891	Battle-Scarred	0.42	1499	2025-02-20 23:40:26.598742+00	f
6892	Factory New	7.09	1499	2025-02-20 23:40:45.836743+00	t
6893	Minimal Wear	1.88	1499	2025-02-20 23:40:45.848744+00	t
6894	Field-Tested	0.9	1499	2025-02-20 23:40:45.840743+00	t
6895	Well-Worn	1.11	1499	2025-02-20 23:40:45.853743+00	t
6896	Battle-Scarred	1.19	1499	2025-02-20 23:40:45.831744+00	t
6897	Factory New	1.6	1501	2025-02-20 23:40:28.485912+00	f
6898	Minimal Wear	0.92	1501	2025-02-20 23:40:28.494915+00	f
6899	Field-Tested	0.49	1501	2025-02-20 23:40:28.489912+00	f
6900	Well-Worn	0.62	1501	2025-02-20 23:40:28.498911+00	f
6901	Battle-Scarred	0.43	1501	2025-02-20 23:40:28.481912+00	f
6902	Factory New	4.2	1501	2025-02-20 23:40:46.633553+00	t
6903	Minimal Wear	2.03	1501	2025-02-20 23:40:46.654553+00	t
6904	Field-Tested	1.18	1501	2025-02-20 23:40:46.642554+00	t
6905	Well-Worn	1.44	1501	2025-02-20 23:40:46.658552+00	t
6906	Battle-Scarred	1.37	1501	2025-02-20 23:40:46.627039+00	t
6907	Factory New	1.7	1503	2025-02-20 23:40:25.225009+00	f
6908	Minimal Wear	0.84	1503	2025-02-20 23:40:25.238009+00	f
6909	Field-Tested	0.44	1503	2025-02-20 23:40:25.23401+00	f
6910	Well-Worn	0.43	1503	2025-02-20 23:40:25.241009+00	f
6911	Battle-Scarred	0.41	1503	2025-02-20 23:40:25.221009+00	f
6912	Factory New	3.89	1503	2025-02-20 23:40:45.056438+00	t
6913	Minimal Wear	1.82	1503	2025-02-20 23:40:45.071438+00	t
6914	Field-Tested	0.83	1503	2025-02-20 23:40:45.067439+00	t
6915	Well-Worn	1.31	1503	2025-02-20 23:40:45.082439+00	t
6916	Battle-Scarred	1	1503	2025-02-20 23:40:45.052438+00	t
6917	Factory New	1.55	1505	2025-02-20 23:40:13.7851+00	f
6918	Minimal Wear	0.84	1505	2025-02-20 23:40:13.7971+00	f
6919	Field-Tested	0.44	1505	2025-02-20 23:40:13.789099+00	f
6920	Well-Worn	0.43	1505	2025-02-20 23:40:13.806135+00	f
6921	Battle-Scarred	0.37	1505	2025-02-20 23:40:13.775044+00	f
6922	Factory New	3.87	1505	2025-02-20 23:40:38.509892+00	t
6923	Minimal Wear	1.79	1505	2025-02-20 23:40:38.525221+00	t
6924	Field-Tested	0.84	1505	2025-02-20 23:40:38.520216+00	t
6925	Well-Worn	0.83	1505	2025-02-20 23:40:38.538303+00	t
6926	Battle-Scarred	0.79	1505	2025-02-20 23:40:38.502378+00	t
6927	Factory New	0.37	1507	2025-02-20 23:40:16.291614+00	f
6928	Minimal Wear	0.12	1507	2025-02-20 23:40:16.300614+00	f
6929	Field-Tested	0.08	1507	2025-02-20 23:40:16.296617+00	f
6930	Well-Worn	0.07	1507	2025-02-20 23:40:16.305615+00	f
6931	Battle-Scarred	0.09	1507	2025-02-20 23:40:16.287615+00	f
6932	Factory New	2.56	1507	2025-02-20 23:40:39.674726+00	t
6933	Minimal Wear	0.52	1507	2025-02-20 23:40:39.684727+00	t
6934	Field-Tested	0.26	1507	2025-02-20 23:40:39.680728+00	t
6935	Well-Worn	0.22	1507	2025-02-20 23:40:39.688726+00	t
6936	Battle-Scarred	0.2	1507	2025-02-20 23:40:39.670726+00	t
6937	Factory New	0.34	1509	2025-02-20 23:40:08.152997+00	f
6938	Minimal Wear	0.11	1509	2025-02-20 23:40:08.182509+00	f
6939	Field-Tested	0.08	1509	2025-02-20 23:40:08.168511+00	f
6940	Well-Worn	0.06	1509	2025-02-20 23:40:08.188509+00	f
6941	Battle-Scarred	0.07	1509	2025-02-20 23:40:08.147996+00	f
6942	Factory New	1.59	1509	2025-02-20 23:40:36.113138+00	t
6943	Minimal Wear	0.36	1509	2025-02-20 23:40:36.121284+00	t
6944	Field-Tested	0.14	1509	2025-02-20 23:40:36.117137+00	t
6945	Well-Worn	0.12	1509	2025-02-20 23:40:36.127216+00	t
6946	Battle-Scarred	0.12	1509	2025-02-20 23:40:36.107137+00	t
6947	Factory New	0.34	1511	2025-02-20 23:40:13.617985+00	f
6948	Minimal Wear	0.12	1511	2025-02-20 23:40:13.627987+00	f
6949	Field-Tested	0.09	1511	2025-02-20 23:40:13.621985+00	f
6950	Well-Worn	0.08	1511	2025-02-20 23:40:13.631991+00	f
6951	Battle-Scarred	0.08	1511	2025-02-20 23:40:13.612989+00	f
6952	Factory New	2.11	1511	2025-02-20 23:40:38.342917+00	t
6953	Minimal Wear	0.42	1511	2025-02-20 23:40:38.357184+00	t
6954	Field-Tested	0.2	1511	2025-02-20 23:40:38.349916+00	t
6955	Well-Worn	0.21	1511	2025-02-20 23:40:38.361184+00	t
6956	Battle-Scarred	0.18	1511	2025-02-20 23:40:38.337592+00	t
6957	Factory New	0.25	1513	2025-02-20 23:40:21.308835+00	f
6958	Minimal Wear	0.1	1513	2025-02-20 23:40:21.318835+00	f
6959	Field-Tested	0.06	1513	2025-02-20 23:40:21.314835+00	f
6960	Well-Worn	0.07	1513	2025-02-20 23:40:21.322835+00	f
6961	Battle-Scarred	0.07	1513	2025-02-20 23:40:21.305835+00	f
6962	Factory New	0.93	1513	2025-02-20 23:40:42.139544+00	t
6963	Minimal Wear	0.26	1513	2025-02-20 23:40:42.149544+00	t
6964	Field-Tested	0.13	1513	2025-02-20 23:40:42.145546+00	t
6965	Well-Worn	0.1	1513	2025-02-20 23:40:42.153544+00	t
6966	Battle-Scarred	0.11	1513	2025-02-20 23:40:42.134544+00	t
6967	Factory New	0.26	1515	2025-02-20 23:40:17.191339+00	f
6968	Minimal Wear	0.12	1515	2025-02-20 23:40:17.202338+00	f
6969	Field-Tested	0.06	1515	2025-02-20 23:40:17.197337+00	f
6970	Well-Worn	0.07	1515	2025-02-20 23:40:17.206337+00	f
6971	Battle-Scarred	0.08	1515	2025-02-20 23:40:17.187337+00	f
6972	Factory New	1.05	1515	2025-02-20 23:40:40.36458+00	t
6973	Minimal Wear	0.28	1515	2025-02-20 23:40:40.37558+00	t
6974	Field-Tested	0.18	1515	2025-02-20 23:40:40.37058+00	t
6975	Well-Worn	0.11	1515	2025-02-20 23:40:40.380581+00	t
6976	Battle-Scarred	0.11	1515	2025-02-20 23:40:40.35858+00	t
6977	Factory New	0.23	1517	2025-02-20 23:40:52.275924+00	f
6978	Minimal Wear	0.11	1517	2025-02-20 23:40:52.29278+00	f
6979	Field-Tested	0.06	1517	2025-02-20 23:40:52.284779+00	f
6980	Well-Worn	0.08	1517	2025-02-20 23:40:52.300779+00	f
6981	Battle-Scarred	0.07	1517	2025-02-20 23:40:52.259026+00	f
6982	Factory New	0.73	1517	2025-02-20 23:40:48.376574+00	t
6983	Minimal Wear	0.27	1517	2025-02-20 23:40:48.385711+00	t
6984	Field-Tested	0.13	1517	2025-02-20 23:40:48.380574+00	t
6985	Well-Worn	0.11	1517	2025-02-20 23:40:48.38971+00	t
6986	Battle-Scarred	0.11	1517	2025-02-20 23:40:48.372574+00	t
6987	Factory New	0.22	1519	2025-02-20 23:40:11.44521+00	f
6988	Minimal Wear	0.11	1519	2025-02-20 23:40:11.454211+00	f
6989	Field-Tested	0.07	1519	2025-02-20 23:40:11.44921+00	f
6990	Well-Worn	0.08	1519	2025-02-20 23:40:11.458209+00	f
6991	Battle-Scarred	0.07	1519	2025-02-20 23:40:11.440212+00	f
6992	Factory New	0.78	1519	2025-02-20 23:40:37.131191+00	t
6993	Minimal Wear	0.34	1519	2025-02-20 23:40:37.138182+00	t
6994	Field-Tested	0.16	1519	2025-02-20 23:40:37.135184+00	t
6995	Well-Worn	0.29	1519	2025-02-20 23:40:37.142184+00	t
6996	Battle-Scarred	0.17	1519	2025-02-20 23:40:37.126191+00	t
6997	Factory New	139.09	1521	2025-02-20 23:40:16.433447+00	f
6998	Minimal Wear	52.89	1521	2025-02-20 23:40:16.441447+00	f
6999	Field-Tested	13.73	1521	2025-02-20 23:40:16.437447+00	f
7000	Well-Worn	17.04	1521	2025-02-20 23:40:16.448166+00	f
7001	Battle-Scarred	8.95	1521	2025-02-20 23:40:16.429447+00	f
7002	Factory New	244.92	1521	2025-02-20 23:40:39.73706+00	t
7003	Minimal Wear	103.41	1521	2025-02-20 23:40:39.748059+00	t
7004	Field-Tested	35	1521	2025-02-20 23:40:39.742059+00	t
7005	Well-Worn	42.95	1521	2025-02-20 23:40:39.75206+00	t
7006	Battle-Scarred	22.46	1521	2025-02-15 23:05:40.415058+00	t
7007	Factory New	56.95	1523	2025-02-20 23:40:00.284363+00	f
7008	Minimal Wear	17.09	1523	2025-02-20 23:40:00.329303+00	f
7009	Field-Tested	9.24	1523	2025-02-20 23:40:00.324303+00	f
7010	Well-Worn	7.65	1523	2025-02-20 23:40:00.334303+00	f
7011	Battle-Scarred	6.61	1523	2025-02-20 23:40:00.272069+00	f
7012	Factory New	128.65	1523	2025-02-20 23:40:31.772746+00	t
7013	Minimal Wear	47.82	1523	2025-02-20 23:40:31.802653+00	t
7014	Field-Tested	27.24	1523	2025-02-20 23:40:31.784974+00	t
7015	Well-Worn	24.55	1523	2025-02-20 23:40:31.842248+00	t
7016	Battle-Scarred	23.66	1523	2025-02-20 23:40:31.758745+00	t
7017	Factory New	12.36	1525	2025-02-20 23:40:52.414344+00	f
7018	Minimal Wear	4.88	1525	2025-02-20 23:40:52.424341+00	f
7019	Field-Tested	2.02	1525	2025-02-20 23:40:52.41934+00	f
7020	Well-Worn	1.4	1525	2025-02-20 23:40:52.42734+00	f
7021	Battle-Scarred	1.4	1525	2025-02-20 23:40:52.407339+00	f
7022	Factory New	29.58	1525	2025-02-20 23:40:48.42034+00	t
7023	Minimal Wear	8.92	1525	2025-02-20 23:40:48.429342+00	t
7024	Field-Tested	3.68	1525	2025-02-20 23:40:48.42434+00	t
7025	Well-Worn	2.4	1525	2025-02-20 23:40:48.433854+00	t
7026	Battle-Scarred	2.94	1525	2025-02-20 23:40:48.41634+00	t
7027	Factory New	12.42	1527	2025-02-20 23:40:23.229004+00	f
7028	Minimal Wear	4.96	1527	2025-02-20 23:40:23.255965+00	f
7029	Field-Tested	1.94	1527	2025-02-20 23:40:23.251965+00	f
7030	Well-Worn	1.37	1527	2025-02-20 23:40:23.26053+00	f
7031	Battle-Scarred	1.46	1527	2025-02-20 23:40:23.222+00	f
7032	Factory New	29.71	1527	2025-02-20 23:40:43.234314+00	t
7033	Minimal Wear	8.64	1527	2025-02-20 23:40:43.242313+00	t
7034	Field-Tested	4.86	1527	2025-02-20 23:40:43.238315+00	t
7035	Well-Worn	4.77	1527	2025-02-20 23:40:43.249315+00	t
7036	Battle-Scarred	2.46	1527	2025-02-20 23:40:43.229315+00	t
7037	Factory New	12.36	1529	2025-02-20 23:40:03.256687+00	f
7038	Minimal Wear	5.82	1529	2025-02-20 23:40:03.288304+00	f
7039	Field-Tested	2.5	1529	2025-02-20 23:40:03.278359+00	f
7040	Well-Worn	3.68	1529	2025-02-20 23:40:03.3043+00	f
7041	Battle-Scarred	2.36	1529	2025-02-20 23:40:03.247687+00	f
7042	Factory New	34	1529	2025-02-20 23:40:34.027219+00	t
7043	Minimal Wear	14.06	1529	2025-02-20 23:40:34.044475+00	t
7044	Field-Tested	7.36	1529	2025-02-20 23:40:34.036218+00	t
7045	Well-Worn	15.34	1529	2025-02-20 23:40:34.054474+00	t
7046	Battle-Scarred	7.4	1529	2025-02-20 23:40:34.019062+00	t
7047	Factory New	3.24	1531	2025-02-20 23:40:15.192557+00	f
7048	Minimal Wear	1.17	1531	2025-02-20 23:40:15.201553+00	f
7049	Field-Tested	0.53	1531	2025-02-20 23:40:15.198552+00	f
7050	Well-Worn	1.18	1531	2025-02-20 23:40:15.206553+00	f
7051	Battle-Scarred	0.49	1531	2025-02-20 23:40:15.185552+00	f
7052	Factory New	12.89	1531	2025-02-20 23:40:39.10451+00	t
7053	Minimal Wear	4.55	1531	2025-02-20 23:40:39.112241+00	t
7054	Field-Tested	2.24	1531	2025-02-20 23:40:39.10824+00	t
7055	Well-Worn	3.8	1531	2025-02-20 23:40:39.118593+00	t
7056	Battle-Scarred	2.79	1531	2025-02-20 23:40:39.10051+00	t
7057	Factory New	2.47	1533	2025-02-20 23:40:26.448011+00	f
7058	Minimal Wear	0.87	1533	2025-02-20 23:40:26.467527+00	f
7059	Field-Tested	0.38	1533	2025-02-20 23:40:26.457011+00	f
7060	Well-Worn	0.35	1533	2025-02-20 23:40:26.476571+00	f
7061	Battle-Scarred	0.35	1533	2025-02-20 23:40:26.44101+00	f
7062	Factory New	4.39	1533	2025-02-20 23:40:45.776563+00	t
7063	Minimal Wear	1.3	1533	2025-02-20 23:40:45.790563+00	t
7064	Field-Tested	0.68	1533	2025-02-20 23:40:45.786563+00	t
7065	Well-Worn	0.73	1533	2025-02-20 23:40:45.794563+00	t
7066	Battle-Scarred	0.45	1533	2025-02-20 23:40:45.772562+00	t
7067	Factory New	1.91	1535	2025-02-20 23:40:13.470738+00	f
7068	Minimal Wear	1.09	1535	2025-02-20 23:40:13.480738+00	f
7069	Field-Tested	0.46	1535	2025-02-20 23:40:13.475738+00	f
7070	Well-Worn	0.73	1535	2025-02-20 23:40:13.486738+00	f
7071	Battle-Scarred	0.39	1535	2025-02-20 23:40:13.465738+00	f
7072	Factory New	8.4	1535	2025-02-20 23:40:38.052275+00	t
7073	Minimal Wear	3.35	1535	2025-02-20 23:40:38.068849+00	t
7074	Field-Tested	1.44	1535	2025-02-20 23:40:38.063848+00	t
7075	Well-Worn	2.53	1535	2025-02-20 23:40:38.080616+00	t
7076	Battle-Scarred	1.32	1535	2025-02-20 23:40:38.047275+00	t
7077	Factory New	1.57	1537	2025-02-20 23:40:24.785466+00	f
7078	Minimal Wear	0.95	1537	2025-02-20 23:40:24.804467+00	f
7079	Field-Tested	0.39	1537	2025-02-20 23:40:24.791467+00	f
7080	Well-Worn	0.54	1537	2025-02-20 23:40:24.815061+00	f
7081	Battle-Scarred	0.37	1537	2025-02-20 23:40:24.780468+00	f
7082	Factory New	3.46	1537	2025-02-20 23:40:44.750008+00	t
7083	Minimal Wear	1.48	1537	2025-02-20 23:40:44.764051+00	t
7084	Field-Tested	0.89	1537	2025-02-20 23:40:44.754049+00	t
7085	Well-Worn	1.46	1537	2025-02-20 23:40:44.768048+00	t
7086	Battle-Scarred	1.72	1537	2025-02-20 23:40:44.746009+00	t
7087	Field-Tested	0.77	1539	2025-02-20 23:40:17.43689+00	f
7088	Well-Worn	0.35	1539	2025-02-20 23:40:17.440889+00	f
7089	Battle-Scarred	0.3	1539	2025-02-20 23:40:17.43389+00	f
7090	Field-Tested	2.9	1539	2025-02-20 23:40:40.546502+00	t
7091	Well-Worn	1.24	1539	2025-02-20 23:40:40.5505+00	t
7092	Battle-Scarred	1.12	1539	2025-02-20 23:40:40.541499+00	t
7093	Factory New	0.31	1541	2025-02-20 23:40:28.360238+00	f
7094	Minimal Wear	0.13	1541	2025-02-20 23:40:28.369239+00	f
7095	Field-Tested	0.06	1541	2025-02-20 23:40:28.365239+00	f
7096	Well-Worn	0.08	1541	2025-02-20 23:40:28.374238+00	f
7097	Battle-Scarred	0.06	1541	2025-02-20 23:40:28.356239+00	f
7098	Factory New	1.45	1541	2025-02-20 23:40:46.539235+00	t
7099	Minimal Wear	0.33	1541	2025-02-20 23:40:46.549235+00	t
7100	Field-Tested	0.12	1541	2025-02-20 23:40:46.543235+00	t
7101	Well-Worn	0.14	1541	2025-02-20 23:40:46.553234+00	t
7102	Battle-Scarred	0.11	1541	2025-02-20 23:40:46.532234+00	t
7103	Factory New	0.29	1543	2025-02-20 23:40:18.65+00	f
7104	Minimal Wear	0.12	1543	2025-02-20 23:40:18.658758+00	f
7105	Field-Tested	0.07	1543	2025-02-20 23:40:18.654+00	f
7106	Well-Worn	0.08	1543	2025-02-20 23:40:18.665757+00	f
7107	Battle-Scarred	0.08	1543	2025-02-20 23:40:18.646001+00	f
7108	Factory New	1.51	1543	2025-02-20 23:40:41.2787+00	t
7109	Minimal Wear	0.32	1543	2025-02-20 23:40:41.287698+00	t
7110	Field-Tested	0.13	1543	2025-02-20 23:40:41.283698+00	t
7111	Well-Worn	0.13	1543	2025-02-20 23:40:41.291699+00	t
7112	Battle-Scarred	0.14	1543	2025-02-20 23:40:41.273698+00	t
7113	Factory New	0.31	1545	2025-02-20 23:40:17.978985+00	f
7114	Minimal Wear	0.12	1545	2025-02-20 23:40:17.989809+00	f
7115	Field-Tested	0.08	1545	2025-02-20 23:40:17.985807+00	f
7116	Well-Worn	0.06	1545	2025-02-20 23:40:17.995807+00	f
7117	Battle-Scarred	0.06	1545	2025-02-20 23:40:17.973983+00	f
7118	Factory New	1.03	1545	2025-02-20 23:40:40.939783+00	t
7119	Minimal Wear	0.3	1545	2025-02-20 23:40:40.950817+00	t
7120	Field-Tested	0.13	1545	2025-02-20 23:40:40.946819+00	t
7121	Well-Worn	0.13	1545	2025-02-20 23:40:40.95585+00	t
7122	Battle-Scarred	0.11	1545	2025-02-20 23:40:40.936783+00	t
7123	Factory New	0.34	1547	2025-02-20 23:40:19.998494+00	f
7124	Minimal Wear	0.12	1547	2025-02-20 23:40:20.030495+00	f
7125	Field-Tested	0.07	1547	2025-02-20 23:40:20.012496+00	f
7126	Well-Worn	0.06	1547	2025-02-20 23:40:20.048009+00	f
7127	Battle-Scarred	0.06	1547	2025-02-20 23:40:19.99227+00	f
7128	Factory New	2	1547	2025-02-20 23:40:41.848943+00	t
7129	Minimal Wear	0.4	1547	2025-02-20 23:40:41.855943+00	t
7130	Field-Tested	0.21	1547	2025-02-20 23:40:41.851943+00	t
7131	Well-Worn	0.15	1547	2025-02-20 23:40:41.859943+00	t
7132	Battle-Scarred	0.12	1547	2025-02-20 23:40:41.84307+00	t
7133	Factory New	0.29	1549	2025-02-20 23:40:23.996247+00	f
7134	Minimal Wear	0.11	1549	2025-02-20 23:40:24.004853+00	f
7135	Field-Tested	0.07	1549	2025-02-20 23:40:24.000856+00	f
7136	Well-Worn	0.09	1549	2025-02-20 23:40:24.007853+00	f
7137	Battle-Scarred	0.07	1549	2025-02-20 23:40:23.991246+00	f
7138	Factory New	1.18	1549	2025-02-20 23:40:43.657258+00	t
7139	Minimal Wear	0.3	1549	2025-02-20 23:40:43.674259+00	t
7140	Field-Tested	0.12	1549	2025-02-20 23:40:43.661258+00	t
7141	Well-Worn	0.13	1549	2025-02-20 23:40:43.67926+00	t
7142	Battle-Scarred	0.11	1549	2025-02-20 23:40:43.64626+00	t
7143	Factory New	0.3	1551	2025-02-20 23:40:49.903088+00	f
7144	Minimal Wear	0.11	1551	2025-02-20 23:40:49.913603+00	f
7145	Field-Tested	0.06	1551	2025-02-20 23:40:49.907092+00	f
7146	Well-Worn	0.06	1551	2025-02-20 23:40:49.921601+00	f
7147	Battle-Scarred	0.07	1551	2025-02-20 23:40:49.892088+00	f
7148	Factory New	1.05	1551	2025-02-20 23:40:47.912333+00	t
7149	Minimal Wear	0.29	1551	2025-02-20 23:40:47.920331+00	t
7150	Field-Tested	0.13	1551	2025-02-20 23:40:47.917331+00	t
7151	Well-Worn	0.14	1551	2025-02-20 23:40:47.924332+00	t
7152	Battle-Scarred	0.11	1551	2025-02-20 23:40:47.907331+00	t
7153	Factory New	0.23	1553	2025-02-20 23:40:27.474802+00	f
7154	Minimal Wear	0.11	1553	2025-02-20 23:40:27.484802+00	f
7155	Field-Tested	0.06	1553	2025-02-20 23:40:27.479802+00	f
7156	Well-Worn	0.08	1553	2025-02-20 23:40:27.488802+00	f
7157	Battle-Scarred	0.06	1553	2025-02-20 23:40:27.470802+00	f
7158	Factory New	0.76	1553	2025-02-20 23:40:46.245822+00	t
7159	Minimal Wear	0.29	1553	2025-02-20 23:40:46.253821+00	t
7160	Field-Tested	0.12	1553	2025-02-20 23:40:46.24982+00	t
7161	Well-Worn	0.12	1553	2025-02-20 23:40:46.25782+00	t
7162	Battle-Scarred	0.12	1553	2025-02-20 23:40:46.239821+00	t
7163	Factory New	92.63	1555	2025-02-20 23:40:16.388448+00	f
7164	Minimal Wear	20.69	1555	2025-02-20 23:40:16.39745+00	f
7165	Field-Tested	7.96	1555	2025-02-20 23:40:16.392447+00	f
7166	Well-Worn	12.19	1555	2025-02-20 23:40:16.401448+00	f
7167	Battle-Scarred	8.86	1555	2025-02-20 23:40:16.38445+00	f
7168	Factory New	277.88	1555	2025-02-20 23:40:39.699241+00	t
7169	Minimal Wear	76.86	1555	2025-02-20 23:40:39.710059+00	t
7170	Field-Tested	27	1555	2025-02-20 23:40:39.703239+00	t
7171	Well-Worn	40.17	1555	2025-02-15 23:05:40.40176+00	t
7172	Battle-Scarred	37.92	1555	2025-02-20 23:40:39.693726+00	t
7173	Factory New	15.73	1557	2025-02-20 23:40:26.758025+00	f
7174	Minimal Wear	9.38	1557	2025-02-20 23:40:26.78054+00	f
7175	Field-Tested	8.8	1557	2025-02-20 23:40:26.774541+00	f
7176	Well-Worn	14.02	1557	2025-02-20 23:40:26.79254+00	f
7177	Factory New	101.9	1557	2025-02-20 23:40:45.884042+00	t
7178	Minimal Wear	44.21	1557	2025-02-20 23:40:45.896043+00	t
7179	Field-Tested	31.06	1557	2025-02-20 23:40:45.890041+00	t
7180	Well-Worn	\N	1557	\N	t
7181	Factory New	34.96	1559	2025-02-20 23:40:00.989212+00	f
7182	Minimal Wear	18.43	1559	2025-02-20 23:40:01.004725+00	f
7183	Field-Tested	12.34	1559	2025-02-20 23:40:00.996725+00	f
7184	Well-Worn	17.15	1559	2025-02-20 23:40:01.007724+00	f
7185	Battle-Scarred	11.24	1559	2025-02-20 23:40:00.984534+00	f
7186	Factory New	106.89	1559	2025-02-20 23:40:32.514555+00	t
7187	Minimal Wear	52.17	1559	2025-02-20 23:40:32.525862+00	t
7188	Field-Tested	30.83	1559	2025-02-20 23:40:32.518554+00	t
7189	Well-Worn	50.63	1559	2025-02-20 23:40:32.533871+00	t
7190	Battle-Scarred	47.44	1559	2025-02-20 23:40:32.505556+00	t
7191	Factory New	10.86	1561	2025-02-20 23:40:25.05344+00	f
7192	Minimal Wear	4.57	1561	2025-02-20 23:40:25.065441+00	f
7193	Field-Tested	1.85	1561	2025-02-20 23:40:25.059441+00	f
7194	Well-Worn	2.22	1561	2025-02-20 23:40:25.071441+00	f
7195	Battle-Scarred	1.68	1561	2025-02-20 23:40:25.04944+00	f
7196	Factory New	35.6	1561	2025-02-20 23:40:44.954546+00	t
7197	Minimal Wear	11.78	1561	2025-02-20 23:40:44.969549+00	t
7198	Field-Tested	6.85	1561	2025-02-20 23:40:44.958547+00	t
7199	Well-Worn	8.86	1561	2025-02-20 23:40:44.975547+00	t
7200	Battle-Scarred	6.74	1561	2025-02-20 23:40:44.943547+00	t
7201	Minimal Wear	12.85	1563	2025-02-20 23:40:11.042626+00	f
7202	Field-Tested	2.05	1563	2025-02-20 23:40:11.038402+00	f
7203	Well-Worn	1.91	1563	2025-02-20 23:40:11.050647+00	f
7204	Battle-Scarred	1.79	1563	2025-02-20 23:40:11.030972+00	f
7205	Minimal Wear	210	1563	2025-02-20 23:40:36.975442+00	t
7206	Field-Tested	3.84	1563	2025-02-20 23:40:36.971104+00	t
7207	Well-Worn	2.67	1563	2025-02-20 23:40:36.980655+00	t
7208	Battle-Scarred	2.82	1563	2025-02-20 23:40:36.967105+00	t
7209	Factory New	7.76	1565	2025-02-20 23:40:21.466984+00	f
7210	Minimal Wear	3.27	1565	2025-02-20 23:40:21.473985+00	f
7211	Field-Tested	1.63	1565	2025-02-20 23:40:21.469985+00	f
7212	Well-Worn	1.19	1565	2025-02-20 23:40:21.479721+00	f
7213	Battle-Scarred	0.66	1565	2025-02-20 23:40:21.462986+00	f
7214	Factory New	33.71	1565	2025-02-20 23:40:42.251704+00	t
7215	Minimal Wear	14.34	1565	2025-02-20 23:40:42.280995+00	t
7216	Field-Tested	6.09	1565	2025-02-20 23:40:42.270995+00	t
7217	Well-Worn	3.35	1565	2025-02-20 23:40:42.290312+00	t
7218	Battle-Scarred	2.24	1565	2025-02-20 23:40:42.243257+00	t
7219	Factory New	6.42	1567	2025-02-20 23:40:49.375+00	f
7220	Minimal Wear	3.61	1567	2025-02-20 23:40:49.385513+00	f
7221	Field-Tested	1.86	1567	2025-02-20 23:40:49.381002+00	f
7222	Well-Worn	1.75	1567	2025-02-20 23:40:49.39048+00	f
7223	Battle-Scarred	1.73	1567	2025-02-20 23:40:49.37+00	f
7224	Factory New	16.33	1567	2025-02-20 23:40:47.636855+00	t
7225	Minimal Wear	8.11	1567	2025-02-20 23:40:47.644913+00	t
7226	Field-Tested	4.93	1567	2025-02-20 23:40:47.640856+00	t
7227	Well-Worn	3.06	1567	2025-02-20 23:40:47.648908+00	t
7228	Battle-Scarred	3.79	1567	2025-02-20 23:40:47.632856+00	t
7229	Factory New	3.51	1569	2025-02-20 23:40:09.791428+00	f
7230	Minimal Wear	1.86	1569	2025-02-20 23:40:09.803125+00	f
7231	Field-Tested	0.95	1569	2025-02-20 23:40:09.79801+00	f
7232	Well-Worn	1.04	1569	2025-02-20 23:40:09.808123+00	f
7233	Battle-Scarred	0.78	1569	2025-02-20 23:40:09.78562+00	f
7234	Factory New	9.75	1569	2025-02-20 23:40:36.588071+00	t
7235	Minimal Wear	4.94	1569	2025-02-20 23:40:36.598071+00	t
7236	Field-Tested	2.73	1569	2025-02-20 23:40:36.592072+00	t
7237	Well-Worn	3.7	1569	2025-02-20 23:40:36.602168+00	t
7238	Battle-Scarred	3.7	1569	2025-02-20 23:40:36.58407+00	t
7239	Factory New	2.48	1571	2025-02-20 23:40:25.593031+00	f
7240	Minimal Wear	1.33	1571	2025-02-20 23:40:25.604484+00	f
7241	Field-Tested	0.74	1571	2025-02-20 23:40:25.599035+00	f
7242	Well-Worn	0.68	1571	2025-02-20 23:40:25.607997+00	f
7243	Battle-Scarred	0.71	1571	2025-02-20 23:40:25.588031+00	f
7244	Factory New	9.02	1571	2025-02-20 23:40:45.304893+00	t
7245	Minimal Wear	3.37	1571	2025-02-20 23:40:45.330253+00	t
7246	Field-Tested	1.67	1571	2025-02-20 23:40:45.314894+00	t
7247	Well-Worn	2.08	1571	2025-02-20 23:40:45.338768+00	t
7248	Battle-Scarred	1.47	1571	2025-02-20 23:40:45.291889+00	t
7249	Factory New	2.59	1573	2025-02-20 23:40:54.917177+00	f
7250	Minimal Wear	1.4	1573	2025-02-20 23:40:54.926176+00	f
7251	Field-Tested	1.11	1573	2025-02-20 23:40:54.922177+00	f
7252	Well-Worn	1.25	1573	2025-02-20 23:40:54.932177+00	f
7253	Battle-Scarred	1.63	1573	2025-02-20 23:40:54.909175+00	f
7254	Factory New	8	1573	2025-02-20 23:40:49.199477+00	t
7255	Minimal Wear	4.23	1573	2025-02-20 23:40:49.207478+00	t
7256	Field-Tested	1.86	1573	2025-02-20 23:40:49.203478+00	t
7257	Well-Worn	4.04	1573	2025-02-20 23:40:49.210478+00	t
7258	Battle-Scarred	2.65	1573	2025-02-20 23:40:49.195479+00	t
7259	Factory New	3.17	1575	2025-02-20 23:40:28.720208+00	f
7260	Minimal Wear	1.62	1575	2025-02-20 23:40:28.731208+00	f
7261	Field-Tested	0.89	1575	2025-02-20 23:40:28.726208+00	f
7262	Well-Worn	0.97	1575	2025-02-20 23:40:28.739209+00	f
7263	Battle-Scarred	0.85	1575	2025-02-20 23:40:28.716695+00	f
7264	Factory New	9.27	1575	2025-02-20 23:40:46.796693+00	t
7265	Minimal Wear	4.12	1575	2025-02-20 23:40:46.811691+00	t
7266	Field-Tested	2.1	1575	2025-02-20 23:40:46.805692+00	t
7267	Well-Worn	5.92	1575	2025-02-20 23:40:46.816691+00	t
7268	Battle-Scarred	5.19	1575	2025-02-20 23:40:46.789691+00	t
7269	Factory New	4.22	1577	2025-02-20 23:40:26.656576+00	f
7270	Minimal Wear	0.37	1577	2025-02-20 23:40:26.675796+00	f
7271	Field-Tested	0.14	1577	2025-02-20 23:40:26.669797+00	f
7272	Well-Worn	0.17	1577	2025-02-20 23:40:26.691796+00	f
7273	Battle-Scarred	0.12	1577	2025-02-20 23:40:26.651576+00	f
7274	Factory New	27.98	1577	2025-02-20 23:40:45.864744+00	t
7275	Minimal Wear	1.89	1577	2025-02-20 23:40:45.873743+00	t
7276	Field-Tested	0.88	1577	2025-02-20 23:40:45.868743+00	t
7277	Well-Worn	0.67	1577	2025-02-20 23:40:45.878041+00	t
7278	Battle-Scarred	0.88	1577	2025-02-20 23:40:45.856743+00	t
7279	Factory New	0.65	1579	2025-02-20 23:40:04.846192+00	f
7280	Minimal Wear	0.41	1579	2025-02-20 23:40:04.854193+00	f
7281	Field-Tested	0.36	1579	2025-02-20 23:40:04.850192+00	f
7282	Well-Worn	0.72	1579	2025-02-20 23:40:04.857191+00	f
7283	Factory New	4.05	1579	2025-02-20 23:40:35.188571+00	t
7284	Minimal Wear	2.96	1579	2025-02-20 23:40:35.199129+00	t
7285	Field-Tested	2.18	1579	2025-02-20 23:40:35.19409+00	t
7286	Well-Worn	4.4	1579	2025-02-20 23:40:35.203333+00	t
7287	Factory New	0.62	1581	2025-02-20 23:40:01.957244+00	f
7288	Minimal Wear	0.29	1581	2025-02-20 23:40:01.968244+00	f
7289	Field-Tested	0.14	1581	2025-02-20 23:40:01.964245+00	f
7290	Well-Worn	0.3	1581	2025-02-20 23:40:01.973244+00	f
7291	Battle-Scarred	0.3	1581	2025-02-20 23:40:01.952244+00	f
7292	Factory New	3.06	1581	2025-02-20 23:40:33.56564+00	t
7293	Minimal Wear	1.09	1581	2025-02-20 23:40:33.586697+00	t
7294	Field-Tested	0.35	1581	2025-02-20 23:40:33.575639+00	t
7295	Well-Worn	1.69	1581	2025-02-20 23:40:33.595606+00	t
7296	Battle-Scarred	0.32	1581	2025-02-20 23:40:33.555173+00	t
7297	Factory New	0.58	1583	2025-02-20 23:40:31.272662+00	f
7298	Minimal Wear	0.24	1583	2025-02-20 23:40:31.282621+00	f
7299	Field-Tested	0.12	1583	2025-02-20 23:40:31.276844+00	f
7300	Well-Worn	0.12	1583	2025-02-20 23:40:31.287621+00	f
7301	Battle-Scarred	0.1	1583	2025-02-20 23:40:31.268662+00	f
7302	Factory New	2.21	1583	2025-02-20 23:40:47.592855+00	t
7303	Minimal Wear	1.18	1583	2025-02-20 23:40:47.601857+00	t
7304	Field-Tested	0.43	1583	2025-02-20 23:40:47.597858+00	t
7305	Well-Worn	0.6	1583	2025-02-20 23:40:47.605857+00	t
7306	Battle-Scarred	0.26	1583	2025-02-20 23:40:47.588856+00	t
7307	Factory New	0.54	1585	2025-02-20 23:40:22.752946+00	f
7308	Minimal Wear	0.37	1585	2025-02-20 23:40:22.767742+00	f
7309	Field-Tested	0.43	1585	2025-02-20 23:40:22.760464+00	f
7310	Factory New	2.02	1585	2025-02-20 23:40:42.868349+00	t
7311	Minimal Wear	1.46	1585	2025-02-20 23:40:42.87635+00	t
7312	Field-Tested	1.53	1585	2025-02-20 23:40:42.872351+00	t
7313	Factory New	0.74	1587	2025-02-20 23:40:27.591569+00	f
7314	Minimal Wear	0.3	1587	2025-02-20 23:40:27.599568+00	f
7315	Field-Tested	0.6	1587	2025-02-20 23:40:27.595571+00	f
7316	Well-Worn	0.18	1587	2025-02-15 23:05:36.093456+00	f
7317	Battle-Scarred	13.75	1587	2025-02-20 23:40:27.587569+00	f
7318	Factory New	1.58	1587	2025-02-20 23:40:46.335821+00	t
7319	Minimal Wear	1.34	1587	2025-02-20 23:40:46.34382+00	t
7320	Field-Tested	0.73	1587	2025-02-20 23:40:46.33982+00	t
7321	Well-Worn	4.99	1587	2025-02-20 23:40:46.348821+00	t
7322	Battle-Scarred	6.95	1587	2025-02-15 23:05:43.028488+00	t
7323	Factory New	169.98	1589	2025-02-20 23:40:15.273093+00	f
7324	Minimal Wear	124.6	1589	2025-02-20 23:40:15.282706+00	f
7325	Field-Tested	63.92	1589	2025-02-20 23:40:15.278095+00	f
7326	Well-Worn	51.57	1589	2025-02-20 23:40:15.286707+00	f
7327	Battle-Scarred	42.84	1589	2025-02-20 23:40:15.269094+00	f
7328	Factory New	361.99	1589	2025-02-20 23:40:39.14883+00	t
7329	Minimal Wear	213.63	1589	2025-02-20 23:40:39.156663+00	t
7330	Field-Tested	147.62	1589	2025-02-20 23:40:39.153664+00	t
7331	Well-Worn	115.79	1589	2025-02-20 23:40:39.160666+00	t
7332	Battle-Scarred	124.99	1589	2025-02-20 23:40:39.144831+00	t
7333	Factory New	182.96	1591	2025-02-20 23:40:53.054949+00	f
7334	Minimal Wear	101.32	1591	2025-02-20 23:40:53.1045+00	f
7335	Field-Tested	57.17	1591	2025-02-20 23:40:53.07347+00	f
7336	Well-Worn	48.49	1591	2025-02-20 23:40:53.140845+00	f
7337	Battle-Scarred	45.31	1591	2025-02-20 23:40:53.018789+00	f
7338	Factory New	637.33	1591	2025-02-20 23:40:48.647171+00	t
7339	Minimal Wear	273.5	1591	2025-02-20 23:40:48.65717+00	t
7340	Field-Tested	157.1	1591	2025-02-20 23:40:48.65217+00	t
7341	Well-Worn	147.85	1591	2025-02-20 23:40:48.663171+00	t
7342	Battle-Scarred	114.9	1591	2025-02-20 23:40:48.64217+00	t
7343	Factory New	80.56	1593	2025-02-20 23:40:00.141144+00	f
7344	Minimal Wear	27.8	1593	2025-02-20 23:40:00.170144+00	f
7345	Field-Tested	15.23	1593	2025-02-20 23:40:00.152143+00	f
7346	Well-Worn	16.97	1593	2025-02-20 23:40:00.183145+00	f
7347	Battle-Scarred	13.12	1593	2025-02-20 23:40:00.105154+00	f
7348	Factory New	146.8	1593	2025-02-20 23:40:31.630887+00	t
7349	Minimal Wear	72.8	1593	2025-02-20 23:40:31.64803+00	t
7350	Field-Tested	37.7	1593	2025-02-20 23:40:31.639033+00	t
7351	Well-Worn	35.49	1593	2025-02-20 23:40:31.6571+00	t
7352	Battle-Scarred	40.63	1593	2025-02-20 23:40:31.620886+00	t
7353	Factory New	26.63	1595	2025-02-20 23:40:10.443404+00	f
7354	Minimal Wear	16.9	1595	2025-02-20 23:40:10.471402+00	f
7355	Field-Tested	9.36	1595	2025-02-20 23:40:10.459402+00	f
7356	Well-Worn	11.31	1595	2025-02-20 23:40:10.482402+00	f
7357	Battle-Scarred	8.88	1595	2025-02-20 23:40:10.433402+00	f
7358	Factory New	73.24	1595	2025-02-20 23:40:36.791508+00	t
7359	Minimal Wear	33.9	1595	2025-02-20 23:40:36.801566+00	t
7360	Field-Tested	19.8	1595	2025-02-20 23:40:36.797508+00	t
7361	Well-Worn	19.65	1595	2025-02-20 23:40:36.805566+00	t
7362	Battle-Scarred	19.9	1595	2025-02-20 23:40:36.786508+00	t
7363	Factory New	23.98	1597	2025-02-20 23:40:28.931304+00	f
7364	Minimal Wear	14.42	1597	2025-02-20 23:40:28.939306+00	f
7365	Field-Tested	10.26	1597	2025-02-20 23:40:28.934305+00	f
7366	Well-Worn	11.12	1597	2025-02-20 23:40:28.944306+00	f
7367	Battle-Scarred	11.6	1597	2025-02-20 23:40:28.926305+00	f
7368	Factory New	63.79	1597	2025-02-20 23:40:46.93228+00	t
7369	Minimal Wear	39.58	1597	2025-02-20 23:40:46.94028+00	t
7370	Field-Tested	21.03	1597	2025-02-20 23:40:46.936279+00	t
7371	Well-Worn	25.34	1597	2025-02-20 23:40:46.944282+00	t
7372	Battle-Scarred	23.57	1597	2025-02-20 23:40:46.92728+00	t
7373	Factory New	7.59	1599	2025-02-20 23:40:12.054671+00	f
7374	Minimal Wear	3.78	1599	2025-02-20 23:40:12.066672+00	f
7375	Field-Tested	1.94	1599	2025-02-20 23:40:12.058672+00	f
7376	Well-Worn	2.16	1599	2025-02-20 23:40:12.070673+00	f
7377	Battle-Scarred	2.05	1599	2025-02-20 23:40:12.050673+00	f
7378	Factory New	31.39	1599	2025-02-20 23:40:37.320662+00	t
7379	Minimal Wear	8.98	1599	2025-02-20 23:40:37.329663+00	t
7380	Field-Tested	4.79	1599	2025-02-20 23:40:37.324662+00	t
7381	Well-Worn	5.19	1599	2025-02-20 23:40:37.334429+00	t
7382	Battle-Scarred	7.35	1599	2025-02-20 23:40:37.316662+00	t
7383	Factory New	5.92	1601	2025-02-20 23:40:24.28858+00	f
7384	Minimal Wear	3.54	1601	2025-02-20 23:40:24.29658+00	f
7385	Field-Tested	1.83	1601	2025-02-20 23:40:24.29258+00	f
7386	Well-Worn	2.02	1601	2025-02-20 23:40:24.301581+00	f
7387	Battle-Scarred	1.69	1601	2025-02-20 23:40:24.285068+00	f
7388	Factory New	12.03	1601	2025-02-20 23:40:44.040921+00	t
7389	Minimal Wear	6.66	1601	2025-02-20 23:40:44.056922+00	t
7390	Field-Tested	4.74	1601	2025-02-20 23:40:44.045923+00	t
7391	Well-Worn	4.7	1601	2025-02-20 23:40:44.061923+00	t
7392	Battle-Scarred	5.72	1601	2025-02-20 23:40:44.029923+00	t
7393	Factory New	5.28	1603	2025-02-20 23:40:14.22572+00	f
7394	Minimal Wear	2.43	1603	2025-02-20 23:40:14.251721+00	f
7395	Field-Tested	2.02	1603	2025-02-20 23:40:14.24672+00	f
7396	Well-Worn	1.91	1603	2025-02-20 23:40:14.266484+00	f
7397	Battle-Scarred	1.82	1603	2025-02-20 23:40:14.21472+00	f
7398	Factory New	10.7	1603	2025-02-20 23:40:38.664834+00	t
7399	Minimal Wear	5.24	1603	2025-02-20 23:40:38.680052+00	t
7400	Field-Tested	3.93	1603	2025-02-20 23:40:38.675053+00	t
7401	Well-Worn	3.77	1603	2025-02-15 23:05:39.950804+00	t
7402	Battle-Scarred	2.79	1603	2025-02-20 23:40:38.657317+00	t
7403	Factory New	5.1	1605	2025-02-20 23:40:19.481403+00	f
7404	Minimal Wear	2.56	1605	2025-02-20 23:40:19.490402+00	f
7405	Field-Tested	2.1	1605	2025-02-20 23:40:19.485401+00	f
7406	Well-Worn	8.08	1605	2025-02-20 23:40:19.495401+00	f
7407	Battle-Scarred	2.23	1605	2025-02-20 23:40:19.475401+00	f
7408	Factory New	9.21	1605	2025-02-20 23:40:41.66376+00	t
7409	Minimal Wear	4.95	1605	2025-02-20 23:40:41.672759+00	t
7410	Field-Tested	3.16	1605	2025-02-20 23:40:41.668759+00	t
7411	Well-Worn	\N	1605	\N	t
7412	Battle-Scarred	3.32	1605	2025-02-20 23:40:41.657759+00	t
7413	Factory New	2.17	1607	2025-02-20 23:40:06.097659+00	f
7414	Minimal Wear	0.5	1607	2025-02-20 23:40:06.114858+00	f
7415	Field-Tested	0.39	1607	2025-02-20 23:40:06.106658+00	f
7416	Well-Worn	0.2	1607	2025-02-20 23:40:06.125345+00	f
7417	Battle-Scarred	0.29	1607	2025-02-20 23:40:06.084658+00	f
7418	Factory New	7.6	1607	2025-02-20 23:40:35.576114+00	t
7419	Minimal Wear	1.39	1607	2025-02-20 23:40:35.585304+00	t
7420	Field-Tested	0.73	1607	2025-02-20 23:40:35.581304+00	t
7421	Well-Worn	0.62	1607	2025-02-20 23:40:35.589308+00	t
7422	Battle-Scarred	0.58	1607	2025-02-20 23:40:35.572112+00	t
7423	Factory New	0.7	1609	2025-02-20 23:40:54.83689+00	f
7424	Minimal Wear	0.38	1609	2025-02-20 23:40:54.85589+00	f
7425	Field-Tested	0.24	1609	2025-02-20 23:40:54.84389+00	f
7426	Well-Worn	0.18	1609	2025-02-20 23:40:54.859888+00	f
7427	Battle-Scarred	0.19	1609	2025-02-20 23:40:54.82589+00	f
7428	Factory New	4.29	1609	2025-02-20 23:40:49.13706+00	t
7429	Minimal Wear	0.9	1609	2025-02-20 23:40:49.145061+00	t
7430	Field-Tested	0.49	1609	2025-02-20 23:40:49.141061+00	t
7431	Well-Worn	0.29	1609	2025-02-20 23:40:49.150062+00	t
7432	Battle-Scarred	0.38	1609	2025-02-20 23:40:49.132061+00	t
7433	Factory New	1.29	1611	2025-02-20 23:40:13.640985+00	f
7434	Minimal Wear	0.73	1611	2025-02-20 23:40:13.651984+00	f
7435	Field-Tested	0.42	1611	2025-02-20 23:40:13.647985+00	f
7436	Well-Worn	3.3	1611	2025-02-20 23:40:13.655984+00	f
7437	Battle-Scarred	0.28	1611	2025-02-20 23:40:13.636984+00	f
7438	Factory New	8.45	1611	2025-02-20 23:40:38.376415+00	t
7439	Minimal Wear	1.97	1611	2025-02-20 23:40:38.38931+00	t
7440	Field-Tested	0.97	1611	2025-02-20 23:40:38.384417+00	t
7441	Well-Worn	3.43	1611	2025-02-20 23:40:38.398691+00	t
7442	Battle-Scarred	0.97	1611	2025-02-20 23:40:38.367697+00	t
7443	Factory New	0.55	1613	2025-02-20 23:40:27.497802+00	f
7444	Minimal Wear	0.39	1613	2025-02-20 23:40:27.50878+00	f
7445	Field-Tested	0.18	1613	2025-02-20 23:40:27.502323+00	f
7446	Well-Worn	0.43	1613	2025-02-20 23:40:27.514293+00	f
7447	Battle-Scarred	0.19	1613	2025-02-20 23:40:27.492802+00	f
7448	Factory New	1.83	1613	2025-02-20 23:40:46.266822+00	t
7449	Minimal Wear	0.95	1613	2025-02-20 23:40:46.27582+00	t
7450	Field-Tested	0.48	1613	2025-02-20 23:40:46.271821+00	t
7451	Well-Worn	0.78	1613	2025-02-20 23:40:46.28082+00	t
7452	Battle-Scarred	0.37	1613	2025-02-20 23:40:46.26082+00	t
7453	Factory New	0.67	1615	2025-02-20 23:40:17.780526+00	f
7454	Minimal Wear	0.4	1615	2025-02-20 23:40:17.789526+00	f
7455	Field-Tested	0.29	1615	2025-02-20 23:40:17.785525+00	f
7456	Well-Worn	0.45	1615	2025-02-20 23:40:17.795527+00	f
7457	Battle-Scarred	0.98	1615	2025-02-20 23:40:17.775526+00	f
7458	Factory New	1.87	1615	2025-02-20 23:40:40.79073+00	t
7459	Minimal Wear	1.19	1615	2025-02-20 23:40:40.814095+00	t
7460	Field-Tested	0.66	1615	2025-02-20 23:40:40.798731+00	t
7461	Well-Worn	0.74	1615	2025-02-20 23:40:40.827552+00	t
7462	Battle-Scarred	1.34	1615	2025-02-20 23:40:40.775729+00	t
7463	Factory New	0.95	1617	2025-02-20 23:40:08.676088+00	f
7464	Minimal Wear	0.59	1617	2025-02-20 23:40:08.689093+00	f
7465	Field-Tested	0.29	1617	2025-02-20 23:40:08.681087+00	f
7466	Well-Worn	0.54	1617	2025-02-20 23:40:08.69509+00	f
7467	Battle-Scarred	0.31	1617	2025-02-20 23:40:08.667574+00	f
7468	Factory New	3.16	1617	2025-02-20 23:40:36.237385+00	t
7469	Minimal Wear	1.56	1617	2025-02-20 23:40:36.247548+00	t
7470	Field-Tested	1.06	1617	2025-02-20 23:40:36.241547+00	t
7471	Well-Worn	1.64	1617	2025-02-20 23:40:36.252547+00	t
7472	Battle-Scarred	1.79	1617	2025-02-20 23:40:36.232384+00	t
7473	Factory New	0.6	1619	2025-02-20 23:40:17.371889+00	f
7474	Minimal Wear	0.5	1619	2025-02-20 23:40:17.381889+00	f
7475	Field-Tested	0.28	1619	2025-02-20 23:40:17.376889+00	f
7476	Well-Worn	0.26	1619	2025-02-20 23:40:17.386889+00	f
7477	Battle-Scarred	1.37	1619	2025-02-20 23:40:17.368889+00	f
7478	Factory New	1.62	1619	2025-02-20 23:40:40.504501+00	t
7479	Minimal Wear	1.18	1619	2025-02-20 23:40:40.515502+00	t
7480	Field-Tested	0.53	1619	2025-02-20 23:40:40.5105+00	t
7481	Well-Worn	2.23	1619	2025-02-20 23:40:40.5185+00	t
7482	Battle-Scarred	1.63	1619	2025-02-15 18:36:36.570195+00	t
7483	Factory New	325.27	1621	2025-02-20 23:40:02.934446+00	f
7484	Minimal Wear	154.44	1621	2025-02-20 23:40:02.991552+00	f
7485	Field-Tested	87.64	1621	2025-02-20 23:40:02.958974+00	f
7486	Well-Worn	62.94	1621	2025-02-20 23:40:03.007011+00	f
7487	Battle-Scarred	61.29	1621	2025-02-20 23:40:02.924444+00	f
7488	Factory New	690	1621	2025-02-20 23:40:33.955033+00	t
7489	Minimal Wear	322.73	1621	2025-02-20 23:40:33.971236+00	t
7490	Field-Tested	184.8	1621	2025-02-20 23:40:33.964234+00	t
7491	Well-Worn	133.05	1621	2025-02-20 23:40:33.981683+00	t
7492	Battle-Scarred	112.3	1621	2025-02-20 23:40:33.943033+00	t
7493	Factory New	58.69	1623	2025-02-20 23:40:17.480272+00	f
7494	Minimal Wear	26.08	1623	2025-02-20 23:40:17.488991+00	f
7495	Field-Tested	12.91	1623	2025-02-20 23:40:17.485272+00	f
7496	Well-Worn	11.44	1623	2025-02-20 23:40:17.495993+00	f
7497	Battle-Scarred	15.44	1623	2025-02-20 23:40:17.475274+00	f
7498	Factory New	269.55	1623	2025-02-20 23:40:40.558499+00	t
7499	Minimal Wear	159.72	1623	2025-02-20 23:40:40.568785+00	t
7500	Field-Tested	45.27	1623	2025-02-20 23:40:40.564501+00	t
7501	Well-Worn	61.9	1623	2025-02-15 23:05:40.773073+00	t
7502	Battle-Scarred	47.34	1623	2025-02-20 23:40:40.5555+00	t
7503	Minimal Wear	77.92	1625	2025-02-20 23:40:28.970909+00	f
7504	Field-Tested	10.5	1625	2025-02-20 23:40:28.965908+00	f
7505	Well-Worn	13.68	1625	2025-02-20 23:40:28.974908+00	f
7506	Battle-Scarred	14.89	1625	2025-02-20 23:40:28.961909+00	f
7507	Minimal Wear	265	1625	2025-02-20 23:40:46.97228+00	t
7508	Field-Tested	29.43	1625	2025-02-20 23:40:46.969281+00	t
7509	Well-Worn	38.92	1625	2025-02-20 23:40:46.97896+00	t
7510	Battle-Scarred	26.07	1625	2025-02-20 23:40:46.964282+00	t
7511	Factory New	61.9	1627	2025-02-20 23:40:49.557557+00	f
7512	Minimal Wear	28.71	1627	2025-02-20 23:40:49.567557+00	f
7513	Field-Tested	14.07	1627	2025-02-20 23:40:49.562558+00	f
7514	Well-Worn	17.31	1627	2025-02-20 23:40:49.570556+00	f
7515	Battle-Scarred	12.72	1627	2025-02-20 23:40:49.552558+00	f
7516	Factory New	181.13	1627	2025-02-20 23:40:47.746672+00	t
7517	Minimal Wear	72.21	1627	2025-02-20 23:40:47.753672+00	t
7518	Field-Tested	162.63	1627	2025-02-20 23:40:47.749673+00	t
7519	Well-Worn	60.64	1627	2025-02-20 23:40:47.756673+00	t
7520	Battle-Scarred	49.47	1627	2025-02-20 23:40:47.740673+00	t
7521	Factory New	37.93	1629	2025-02-20 23:40:28.336239+00	f
7522	Minimal Wear	17.63	1629	2025-02-20 23:40:28.347239+00	f
7523	Field-Tested	9.12	1629	2025-02-20 23:40:28.341238+00	f
7524	Well-Worn	8.6	1629	2025-02-20 23:40:28.352239+00	f
7525	Battle-Scarred	7.67	1629	2025-02-20 23:40:28.331239+00	f
7526	Factory New	113.05	1629	2025-02-20 23:40:46.513722+00	t
7527	Minimal Wear	45.58	1629	2025-02-20 23:40:46.52272+00	t
7528	Field-Tested	20.09	1629	2025-02-20 23:40:46.51772+00	t
7529	Well-Worn	20.56	1629	2025-02-20 23:40:46.52772+00	t
7530	Battle-Scarred	15.78	1629	2025-02-20 23:40:46.50872+00	t
7531	Factory New	12.73	1631	2025-02-20 23:40:01.037291+00	f
7532	Minimal Wear	5.85	1631	2025-02-20 23:40:01.047292+00	f
7533	Field-Tested	4.3	1631	2025-02-20 23:40:01.041292+00	f
7534	Well-Worn	5.09	1631	2025-02-20 23:40:01.051292+00	f
7535	Battle-Scarred	4.86	1631	2025-02-20 23:40:01.032724+00	f
7536	Factory New	41.44	1631	2025-02-20 23:40:32.554019+00	t
7537	Minimal Wear	24.87	1631	2025-02-20 23:40:32.572483+00	t
7538	Field-Tested	11.69	1631	2025-02-20 23:40:32.567483+00	t
7539	Well-Worn	15.98	1631	2025-02-20 23:40:32.585084+00	t
7540	Battle-Scarred	48.43	1631	2025-02-20 23:40:32.54142+00	t
7541	Factory New	8.88	1633	2025-02-20 23:40:22.854666+00	f
7542	Minimal Wear	4.37	1633	2025-02-20 23:40:22.863667+00	f
7543	Field-Tested	1.78	1633	2025-02-20 23:40:22.858666+00	f
7544	Well-Worn	2.67	1633	2025-02-20 23:40:22.868665+00	f
7545	Battle-Scarred	2.04	1633	2025-02-20 23:40:22.849666+00	f
7546	Factory New	25.16	1633	2025-02-20 23:40:43.028671+00	t
7547	Minimal Wear	10.63	1633	2025-02-20 23:40:43.056681+00	t
7548	Field-Tested	5.28	1633	2025-02-20 23:40:43.048113+00	t
7549	Well-Worn	3.46	1633	2025-02-20 23:40:43.065192+00	t
7550	Battle-Scarred	4.29	1633	2025-02-20 23:40:42.997351+00	t
7551	Factory New	5.49	1635	2025-02-20 23:40:25.531031+00	f
7552	Minimal Wear	4.39	1635	2025-02-20 23:40:25.539031+00	f
7553	Field-Tested	1.87	1635	2025-02-20 23:40:25.535031+00	f
7554	Well-Worn	1.67	1635	2025-02-20 23:40:25.543032+00	f
7555	Battle-Scarred	2.09	1635	2025-02-20 23:40:25.526031+00	f
7556	Factory New	16.19	1635	2025-02-20 23:40:45.24789+00	t
7557	Minimal Wear	8.1	1635	2025-02-20 23:40:45.26589+00	t
7558	Field-Tested	4.66	1635	2025-02-20 23:40:45.256889+00	t
7559	Well-Worn	3.56	1635	2025-02-20 23:40:45.276892+00	t
7560	Battle-Scarred	9.2	1635	2025-02-20 23:40:45.241888+00	t
7561	Factory New	5.91	1637	2025-02-20 23:40:01.461349+00	f
7562	Minimal Wear	3.55	1637	2025-02-20 23:40:01.469348+00	f
7563	Field-Tested	2.14	1637	2025-02-20 23:40:01.466362+00	f
7564	Well-Worn	3.18	1637	2025-02-20 23:40:01.473348+00	f
7565	Battle-Scarred	1.89	1637	2025-02-20 23:40:01.456348+00	f
7566	Factory New	20.75	1637	2025-02-20 23:40:33.097057+00	t
7567	Minimal Wear	8.86	1637	2025-02-20 23:40:33.174353+00	t
7568	Field-Tested	5.2	1637	2025-02-20 23:40:33.152258+00	t
7569	Well-Worn	9.38	1637	2025-02-15 18:42:10.69203+00	t
7570	Battle-Scarred	4.53	1637	2025-02-15 23:05:37.697468+00	t
7571	Factory New	6.64	1639	2025-02-20 23:40:19.338635+00	f
7572	Minimal Wear	3.35	1639	2025-02-20 23:40:19.347635+00	f
7573	Field-Tested	1.57	1639	2025-02-20 23:40:19.342636+00	f
7574	Well-Worn	1.78	1639	2025-02-20 23:40:19.351635+00	f
7575	Battle-Scarred	1.93	1639	2025-02-20 23:40:19.334636+00	f
7576	Factory New	18.45	1639	2025-02-20 23:40:41.59976+00	t
7577	Minimal Wear	8.87	1639	2025-02-20 23:40:41.60876+00	t
7578	Field-Tested	5.05	1639	2025-02-20 23:40:41.604758+00	t
7579	Well-Worn	5.46	1639	2025-02-20 23:40:41.613761+00	t
7580	Battle-Scarred	4.41	1639	2025-02-20 23:40:41.592759+00	t
7581	Factory New	4.71	1641	2025-02-20 23:40:05.65113+00	f
7582	Minimal Wear	1.79	1641	2025-02-20 23:40:05.659131+00	f
7583	Field-Tested	1.08	1641	2025-02-20 23:40:05.65513+00	f
7584	Well-Worn	0.96	1641	2025-02-20 23:40:05.667712+00	f
7585	Battle-Scarred	0.88	1641	2025-02-20 23:40:05.646132+00	f
7586	Factory New	13.36	1641	2025-02-20 23:40:35.484029+00	t
7587	Minimal Wear	2.47	1641	2025-02-20 23:40:35.492028+00	t
7588	Field-Tested	1.62	1641	2025-02-20 23:40:35.488028+00	t
7589	Well-Worn	0.75	1641	2025-02-20 23:40:35.496029+00	t
7590	Battle-Scarred	1.22	1641	2025-02-20 23:40:35.479784+00	t
7591	Factory New	1.57	1643	2025-02-20 23:40:27.048078+00	f
7592	Minimal Wear	0.9	1643	2025-02-20 23:40:27.06539+00	f
7593	Field-Tested	0.7	1643	2025-02-20 23:40:27.056077+00	f
7594	Well-Worn	1.29	1643	2025-02-20 23:40:27.074962+00	f
7595	Battle-Scarred	0.98	1643	2025-02-20 23:40:27.040079+00	f
7596	Factory New	6.66	1643	2025-02-20 23:40:45.980043+00	t
7597	Minimal Wear	3.33	1643	2025-02-20 23:40:45.991199+00	t
7598	Field-Tested	0.92	1643	2025-02-20 23:40:45.986199+00	t
7599	Well-Worn	3.15	1643	2025-02-20 23:40:45.997199+00	t
7600	Battle-Scarred	0.79	1643	2025-02-20 23:40:45.975041+00	t
7601	Factory New	1.03	1645	2025-02-20 23:40:10.101589+00	f
7602	Minimal Wear	0.97	1645	2025-02-20 23:40:10.113103+00	f
7603	Field-Tested	0.96	1645	2025-02-20 23:40:10.107101+00	f
7604	Well-Worn	1.08	1645	2025-02-20 23:40:10.117102+00	f
7605	Battle-Scarred	0.89	1645	2025-02-20 23:40:10.097588+00	f
7606	Factory New	\N	1645	\N	t
7607	Minimal Wear	2.51	1645	2025-02-20 23:40:36.721507+00	t
7608	Field-Tested	1.18	1645	2025-02-20 23:40:36.717277+00	t
7609	Well-Worn	\N	1645	\N	t
7610	Battle-Scarred	2.11	1645	2025-02-20 23:40:36.712278+00	t
7611	Factory New	1.84	1647	2025-02-20 23:40:14.646561+00	f
7612	Minimal Wear	0.85	1647	2025-02-20 23:40:14.65856+00	f
7613	Field-Tested	1.05	1647	2025-02-20 23:40:14.651561+00	f
7614	Well-Worn	1.49	1647	2025-02-20 23:40:14.66456+00	f
7615	Battle-Scarred	0.64	1647	2025-02-20 23:40:14.640561+00	f
7616	Factory New	5.35	1647	2025-02-20 23:40:38.837141+00	t
7617	Minimal Wear	1.58	1647	2025-02-20 23:40:38.851141+00	t
7618	Field-Tested	0.97	1647	2025-02-20 23:40:38.847144+00	t
7619	Well-Worn	1.65	1647	2025-02-20 23:40:38.865474+00	t
7620	Battle-Scarred	0.93	1647	2025-02-20 23:40:38.833141+00	t
7621	Factory New	1.31	1649	2025-02-20 23:40:22.012283+00	f
7622	Minimal Wear	0.94	1649	2025-02-20 23:40:22.043438+00	f
7623	Field-Tested	0.78	1649	2025-02-20 23:40:22.031803+00	f
7624	Well-Worn	1.12	1649	2025-02-20 23:40:22.050437+00	f
7625	Battle-Scarred	0.89	1649	2025-02-20 23:40:22.005281+00	f
7626	Factory New	4.37	1649	2025-02-20 23:40:42.59276+00	t
7627	Minimal Wear	1.83	1649	2025-02-20 23:40:42.60176+00	t
7628	Field-Tested	0.93	1649	2025-02-20 23:40:42.597761+00	t
7629	Well-Worn	22.12	1649	2025-02-20 23:40:42.606761+00	t
7630	Battle-Scarred	1.48	1649	2025-02-20 23:40:42.588761+00	t
7631	Factory New	1	1651	2025-02-20 23:40:27.751904+00	f
7632	Minimal Wear	0.84	1651	2025-02-20 23:40:27.802041+00	f
7633	Field-Tested	0.95	1651	2025-02-20 23:40:27.755904+00	f
7634	Well-Worn	0.89	1651	2025-02-20 23:40:27.822452+00	f
7635	Factory New	2.82	1651	2025-02-20 23:40:46.399821+00	t
7636	Minimal Wear	2.14	1651	2025-02-20 23:40:46.408821+00	t
7637	Field-Tested	1.19	1651	2025-02-20 23:40:46.403822+00	t
7638	Well-Worn	1.64	1651	2025-02-20 23:40:46.413483+00	t
7639	Factory New	1.55	1653	2025-02-20 23:40:18.419818+00	f
7640	Minimal Wear	1.43	1653	2025-02-20 23:40:18.430818+00	f
7641	Field-Tested	1.42	1653	2025-02-20 23:40:18.425817+00	f
7642	Well-Worn	2.59	1653	2025-02-20 23:40:18.435519+00	f
7643	Battle-Scarred	1.84	1653	2025-02-20 23:40:18.412818+00	f
7644	Factory New	7.97	1653	2025-02-20 23:40:41.133729+00	t
7645	Minimal Wear	3.82	1653	2025-02-20 23:40:41.142729+00	t
7646	Field-Tested	1.36	1653	2025-02-20 23:40:41.138729+00	t
7647	Well-Worn	3.69	1653	2025-02-20 23:40:41.148731+00	t
7648	Battle-Scarred	2.28	1653	2025-02-20 23:40:41.129731+00	t
7649	Factory New	52.73	1655	2025-02-20 23:40:53.815147+00	f
7650	Minimal Wear	21.75	1655	2025-02-20 23:40:53.834223+00	f
7651	Field-Tested	13.69	1655	2025-02-20 23:40:53.822667+00	f
7652	Well-Worn	13.71	1655	2025-02-20 23:40:53.842223+00	f
7653	Battle-Scarred	11.47	1655	2025-02-20 23:40:53.805106+00	f
7654	Factory New	208.95	1655	2025-02-20 23:40:48.835763+00	t
7655	Minimal Wear	71.71	1655	2025-02-20 23:40:48.855689+00	t
7656	Field-Tested	44.37	1655	2025-02-20 23:40:48.841687+00	t
7657	Well-Worn	42.63	1655	2025-02-20 23:40:48.867688+00	t
7658	Battle-Scarred	50.27	1655	2025-02-20 23:40:48.831242+00	t
7659	Factory New	34.98	1657	2025-02-20 23:40:16.095805+00	f
7660	Minimal Wear	13.91	1657	2025-02-20 23:40:16.104804+00	f
7661	Field-Tested	6.95	1657	2025-02-20 23:40:16.100812+00	f
7662	Well-Worn	11.78	1657	2025-02-20 23:40:16.109806+00	f
7663	Battle-Scarred	8.28	1657	2025-02-20 23:40:16.090803+00	f
7664	Factory New	118.28	1657	2025-02-20 23:40:39.604026+00	t
7665	Minimal Wear	44.49	1657	2025-02-20 23:40:39.617029+00	t
7666	Field-Tested	22.02	1657	2025-02-20 23:40:39.609026+00	t
7667	Well-Worn	29.58	1657	2025-02-20 23:40:39.622026+00	t
7668	Battle-Scarred	22.18	1657	2025-02-20 23:40:39.600026+00	t
7669	Factory New	12.58	1659	2025-02-20 23:40:11.312031+00	f
7670	Minimal Wear	6.1	1659	2025-02-20 23:40:11.332842+00	f
7671	Field-Tested	3.31	1659	2025-02-20 23:40:11.319031+00	f
7672	Well-Worn	3.28	1659	2025-02-20 23:40:11.339838+00	f
7673	Battle-Scarred	3.89	1659	2025-02-20 23:40:11.304031+00	f
7674	Factory New	36.75	1659	2025-02-20 23:40:37.065775+00	t
7675	Minimal Wear	13.14	1659	2025-02-20 23:40:37.073961+00	t
7676	Field-Tested	8.1	1659	2025-02-20 23:40:37.069774+00	t
7677	Well-Worn	6.66	1659	2025-02-20 23:40:37.076961+00	t
7678	Battle-Scarred	7.74	1659	2025-02-20 23:40:37.059774+00	t
7679	Factory New	11.23	1661	2025-02-20 23:40:20.069455+00	f
7680	Minimal Wear	4.89	1661	2025-02-20 23:40:20.087455+00	f
7681	Field-Tested	2.81	1661	2025-02-20 23:40:20.081455+00	f
7682	Well-Worn	2.62	1661	2025-02-20 23:40:20.097455+00	f
7683	Battle-Scarred	2.48	1661	2025-02-20 23:40:20.064455+00	f
7684	Factory New	31.64	1661	2025-02-20 23:40:41.869943+00	t
7685	Minimal Wear	16.06	1661	2025-02-20 23:40:41.876943+00	t
7686	Field-Tested	7.69	1661	2025-02-20 23:40:41.873943+00	t
7687	Well-Worn	6.93	1661	2025-02-20 23:40:41.882943+00	t
7688	Battle-Scarred	7.1	1661	2025-02-20 23:40:41.865943+00	t
7689	Factory New	9.59	1663	2025-02-20 23:40:55.082366+00	f
7690	Minimal Wear	4.06	1663	2025-02-20 23:40:55.103946+00	f
7691	Field-Tested	1.81	1663	2025-02-20 23:40:55.089943+00	f
7692	Well-Worn	2.12	1663	2025-02-20 23:40:55.110943+00	f
7693	Battle-Scarred	2.21	1663	2025-02-20 23:40:55.074367+00	f
7694	Factory New	26.99	1663	2025-02-20 23:40:49.252+00	t
7695	Minimal Wear	9.62	1663	2025-02-20 23:40:49.264+00	t
7696	Field-Tested	3.92	1663	2025-02-20 23:40:49.257001+00	t
7697	Well-Worn	6.64	1663	2025-02-20 23:40:49.268+00	t
7698	Battle-Scarred	4.72	1663	2025-02-20 23:40:49.248001+00	t
7699	Factory New	13.29	1665	2025-02-20 23:40:01.163372+00	f
7700	Minimal Wear	6.06	1665	2025-02-20 23:40:01.172371+00	f
7701	Field-Tested	4.14	1665	2025-02-20 23:40:01.168372+00	f
7702	Well-Worn	3.52	1665	2025-02-20 23:40:01.18131+00	f
7703	Battle-Scarred	3.5	1665	2025-02-20 23:40:01.157371+00	f
7704	Factory New	48.49	1665	2025-02-20 23:40:32.696976+00	t
7705	Minimal Wear	22.03	1665	2025-02-20 23:40:32.717655+00	t
7706	Field-Tested	13.75	1665	2025-02-20 23:40:32.701992+00	t
7707	Well-Worn	12.04	1665	2025-02-20 23:40:32.726113+00	t
7708	Battle-Scarred	11.85	1665	2025-02-20 23:40:32.683971+00	t
7709	Factory New	3.11	1667	2025-02-20 23:40:05.559458+00	f
7710	Minimal Wear	1.48	1667	2025-02-20 23:40:05.570458+00	f
7711	Field-Tested	0.65	1667	2025-02-20 23:40:05.566458+00	f
7712	Well-Worn	0.74	1667	2025-02-20 23:40:05.574458+00	f
7713	Battle-Scarred	0.63	1667	2025-02-20 23:40:05.555458+00	f
7714	Factory New	12.49	1667	2025-02-20 23:40:35.462041+00	t
7715	Minimal Wear	5.27	1667	2025-02-20 23:40:35.47078+00	t
7716	Field-Tested	2.52	1667	2025-02-20 23:40:35.467268+00	t
7717	Well-Worn	2.77	1667	2025-02-20 23:40:35.47478+00	t
7718	Battle-Scarred	3.27	1667	2025-02-20 23:40:35.457917+00	t
7719	Factory New	1.63	1669	2025-02-20 23:40:23.569886+00	f
7720	Minimal Wear	0.78	1669	2025-02-20 23:40:23.579888+00	f
7721	Field-Tested	0.34	1669	2025-02-20 23:40:23.573888+00	f
7722	Well-Worn	0.72	1669	2025-02-20 23:40:23.585887+00	f
7723	Battle-Scarred	0.31	1669	2025-02-20 23:40:23.565887+00	f
7724	Factory New	5.7	1669	2025-02-20 23:40:43.373746+00	t
7725	Minimal Wear	1.54	1669	2025-02-20 23:40:43.389478+00	t
7726	Field-Tested	0.61	1669	2025-02-20 23:40:43.377744+00	t
7727	Well-Worn	1.12	1669	2025-02-20 23:40:43.401479+00	t
7728	Battle-Scarred	0.73	1669	2025-02-20 23:40:43.368746+00	t
7729	Factory New	1.56	1671	2025-02-20 23:40:16.737418+00	f
7730	Minimal Wear	0.79	1671	2025-02-20 23:40:16.74842+00	f
7731	Field-Tested	0.33	1671	2025-02-20 23:40:16.741417+00	f
7732	Well-Worn	0.3	1671	2025-02-20 23:40:16.752418+00	f
7733	Battle-Scarred	0.39	1671	2025-02-20 23:40:16.733417+00	f
7734	Factory New	4.13	1671	2025-02-20 23:40:39.934098+00	t
7735	Minimal Wear	1.48	1671	2025-02-20 23:40:39.941096+00	t
7736	Field-Tested	0.59	1671	2025-02-20 23:40:39.938097+00	t
7737	Well-Worn	0.52	1671	2025-02-20 23:40:39.947097+00	t
7738	Battle-Scarred	1.33	1671	2025-02-20 23:40:39.930099+00	t
7739	Factory New	1.37	1673	2025-02-20 23:40:21.588649+00	f
7740	Minimal Wear	0.7	1673	2025-02-20 23:40:21.596648+00	f
7741	Field-Tested	0.33	1673	2025-02-20 23:40:21.592648+00	f
7742	Well-Worn	0.29	1673	2025-02-20 23:40:21.600649+00	f
7743	Battle-Scarred	0.31	1673	2025-02-20 23:40:21.584649+00	f
7744	Factory New	3.28	1673	2025-02-20 23:40:42.368503+00	t
7745	Minimal Wear	1.45	1673	2025-02-20 23:40:42.376503+00	t
7746	Field-Tested	0.57	1673	2025-02-20 23:40:42.372503+00	t
7747	Well-Worn	0.95	1673	2025-02-20 23:40:42.381503+00	t
7748	Battle-Scarred	0.56	1673	2025-02-20 23:40:42.364504+00	t
7749	Factory New	1.41	1675	2025-02-20 23:40:12.419508+00	f
7750	Minimal Wear	0.36	1675	2025-02-20 23:40:12.435447+00	f
7751	Field-Tested	0.29	1675	2025-02-20 23:40:12.428447+00	f
7752	Well-Worn	0.21	1675	2025-02-20 23:40:12.442318+00	f
7753	Battle-Scarred	0.14	1675	2025-02-20 23:40:12.415508+00	f
7754	Factory New	5.75	1675	2025-02-20 23:40:37.490556+00	t
7755	Minimal Wear	1.47	1675	2025-02-20 23:40:37.50187+00	t
7756	Field-Tested	0.73	1675	2025-02-20 23:40:37.497865+00	t
7757	Well-Worn	1.19	1675	2025-02-20 23:40:37.509864+00	t
7758	Battle-Scarred	0.72	1675	2025-02-20 23:40:37.487556+00	t
7759	Factory New	0.84	1677	2025-02-20 23:40:04.051585+00	f
7760	Minimal Wear	0.31	1677	2025-02-20 23:40:04.060587+00	f
7761	Field-Tested	0.17	1677	2025-02-20 23:40:04.055586+00	f
7762	Well-Worn	0.38	1677	2025-02-20 23:40:04.064614+00	f
7763	Battle-Scarred	0.19	1677	2025-02-20 23:40:04.047585+00	f
7764	Factory New	2.96	1677	2025-02-20 23:40:34.517449+00	t
7765	Minimal Wear	0.78	1677	2025-02-20 23:40:34.533374+00	t
7766	Field-Tested	0.43	1677	2025-02-20 23:40:34.525374+00	t
7767	Well-Worn	0.4	1677	2025-02-20 23:40:34.541322+00	t
7768	Battle-Scarred	0.42	1677	2025-02-20 23:40:34.506931+00	t
7769	Factory New	0.62	1679	2025-02-20 23:40:26.938563+00	f
7770	Minimal Wear	0.27	1679	2025-02-20 23:40:26.966563+00	f
7771	Field-Tested	0.17	1679	2025-02-20 23:40:26.950562+00	f
7772	Well-Worn	0.15	1679	2025-02-20 23:40:26.979563+00	f
7773	Battle-Scarred	0.2	1679	2025-02-20 23:40:26.921563+00	f
7774	Factory New	2.57	1679	2025-02-20 23:40:45.935041+00	t
7775	Minimal Wear	0.83	1679	2025-02-20 23:40:45.947044+00	t
7776	Field-Tested	0.38	1679	2025-02-20 23:40:45.940041+00	t
7777	Well-Worn	0.36	1679	2025-02-20 23:40:45.951042+00	t
7778	Battle-Scarred	0.35	1679	2025-02-20 23:40:45.931042+00	t
7779	Factory New	0.49	1681	2025-02-20 23:40:28.56372+00	f
7780	Minimal Wear	0.3	1681	2025-02-20 23:40:28.57172+00	f
7781	Field-Tested	0.19	1681	2025-02-20 23:40:28.56872+00	f
7782	Well-Worn	0.19	1681	2025-02-20 23:40:28.575721+00	f
7783	Battle-Scarred	0.13	1681	2025-02-20 23:40:28.558721+00	f
7784	Factory New	2.23	1681	2025-02-20 23:40:46.667552+00	t
7785	Minimal Wear	0.74	1681	2025-02-20 23:40:46.674553+00	t
7786	Field-Tested	0.42	1681	2025-02-20 23:40:46.670551+00	t
7787	Well-Worn	0.36	1681	2025-02-20 23:40:46.680693+00	t
7788	Battle-Scarred	0.36	1681	2025-02-20 23:40:46.663553+00	t
7789	Factory New	0.53	1683	2025-02-20 23:40:14.284488+00	f
7790	Minimal Wear	0.25	1683	2025-02-20 23:40:14.302484+00	f
7791	Field-Tested	0.16	1683	2025-02-20 23:40:14.297484+00	f
7792	Well-Worn	0.25	1683	2025-02-20 23:40:14.315483+00	f
7793	Battle-Scarred	0.17	1683	2025-02-20 23:40:14.274483+00	f
7794	Factory New	1.39	1683	2025-02-20 23:40:38.6938+00	t
7795	Minimal Wear	0.74	1683	2025-02-20 23:40:38.704801+00	t
7796	Field-Tested	0.4	1683	2025-02-20 23:40:38.6998+00	t
7797	Well-Worn	0.52	1683	2025-02-20 23:40:38.714326+00	t
7798	Battle-Scarred	0.37	1683	2025-02-20 23:40:38.689102+00	t
7799	Factory New	0.47	1685	2025-02-20 23:40:22.345615+00	f
7800	Minimal Wear	0.25	1685	2025-02-20 23:40:22.354617+00	f
7801	Field-Tested	0.17	1685	2025-02-20 23:40:22.350614+00	f
7802	Well-Worn	0.18	1685	2025-02-20 23:40:22.357614+00	f
7803	Battle-Scarred	0.17	1685	2025-02-20 23:40:22.340614+00	f
7804	Factory New	1.64	1685	2025-02-20 23:40:42.719444+00	t
7805	Minimal Wear	0.84	1685	2025-02-20 23:40:42.730445+00	t
7806	Field-Tested	0.38	1685	2025-02-20 23:40:42.724445+00	t
7807	Well-Worn	0.38	1685	2025-02-20 23:40:42.734445+00	t
7808	Battle-Scarred	0.39	1685	2025-02-20 23:40:42.714444+00	t
7809	Factory New	0.47	1687	2025-02-20 23:40:52.08785+00	f
7810	Minimal Wear	0.25	1687	2025-02-20 23:40:52.103853+00	f
7811	Field-Tested	0.14	1687	2025-02-20 23:40:52.095852+00	f
7812	Well-Worn	0.15	1687	2025-02-20 23:40:52.126852+00	f
7813	Battle-Scarred	0.44	1687	2025-02-20 23:40:52.07785+00	f
7814	Factory New	1.44	1687	2025-02-20 23:40:48.283506+00	t
7815	Minimal Wear	0.89	1687	2025-02-20 23:40:48.292061+00	t
7816	Field-Tested	0.39	1687	2025-02-20 23:40:48.287507+00	t
7817	Well-Worn	0.53	1687	2025-02-20 23:40:48.297063+00	t
7818	Battle-Scarred	0.74	1687	2025-02-20 23:40:48.279509+00	t
7819	Factory New	162	1689	2025-02-20 23:40:01.215309+00	f
7820	Minimal Wear	62.81	1689	2025-02-20 23:40:01.224312+00	f
7821	Field-Tested	37.68	1689	2025-02-20 23:40:01.21931+00	f
7822	Well-Worn	31.64	1689	2025-02-20 23:40:01.231309+00	f
7823	Battle-Scarred	29.64	1689	2025-02-20 23:40:01.209311+00	f
7824	Factory New	329.03	1689	2025-02-20 23:40:32.741567+00	t
7825	Minimal Wear	142.67	1689	2025-02-20 23:40:32.753248+00	t
7826	Field-Tested	102.19	1689	2025-02-20 23:40:32.748508+00	t
7827	Well-Worn	98.95	1689	2025-02-20 23:40:32.762017+00	t
7828	Battle-Scarred	101.64	1689	2025-02-20 23:40:32.736636+00	t
7829	Factory New	9.83	1691	2025-02-20 23:40:24.076969+00	f
7830	Minimal Wear	5.14	1691	2025-02-20 23:40:24.086939+00	f
7831	Field-Tested	3.22	1691	2025-02-20 23:40:24.082939+00	f
7832	Well-Worn	6.05	1691	2025-02-20 23:40:24.091939+00	f
7833	Battle-Scarred	4.22	1691	2025-02-20 23:40:24.072968+00	f
7834	Factory New	40.64	1691	2025-02-20 23:40:43.785166+00	t
7835	Minimal Wear	22.18	1691	2025-02-20 23:40:43.792678+00	t
7836	Field-Tested	10.3	1691	2025-02-20 23:40:43.788678+00	t
7837	Well-Worn	29.34	1691	2025-02-20 23:40:43.803678+00	t
7838	Battle-Scarred	13.46	1691	2025-02-20 23:40:43.77454+00	t
7839	Factory New	13.31	1693	2025-02-20 23:40:25.639997+00	f
7840	Minimal Wear	5.6	1693	2025-02-20 23:40:25.654526+00	f
7841	Field-Tested	2.92	1693	2025-02-20 23:40:25.643508+00	f
7842	Well-Worn	2.48	1693	2025-02-20 23:40:25.658532+00	f
7843	Battle-Scarred	2.16	1693	2025-02-20 23:40:25.635998+00	f
7844	Factory New	42.59	1693	2025-02-20 23:40:45.39333+00	t
7845	Minimal Wear	11.75	1693	2025-02-20 23:40:45.410331+00	t
7846	Field-Tested	6.52	1693	2025-02-20 23:40:45.406331+00	t
7847	Well-Worn	8.3	1693	2025-02-20 23:40:45.422651+00	t
7848	Battle-Scarred	9.34	1693	2025-02-20 23:40:45.38933+00	t
7849	Factory New	14.39	1695	2025-02-20 23:40:15.415302+00	f
7850	Minimal Wear	7.24	1695	2025-02-20 23:40:15.425301+00	f
7851	Field-Tested	5.14	1695	2025-02-20 23:40:15.420301+00	f
7852	Well-Worn	8.5	1695	2025-02-20 23:40:15.430302+00	f
7853	Battle-Scarred	5.13	1695	2025-02-20 23:40:15.409303+00	f
7854	Factory New	36.96	1695	2025-02-20 23:40:39.208609+00	t
7855	Minimal Wear	19.28	1695	2025-02-20 23:40:39.217967+00	t
7856	Field-Tested	14.5	1695	2025-02-20 23:40:39.212966+00	t
7857	Well-Worn	16.36	1695	2025-02-20 23:40:39.221966+00	t
7858	Battle-Scarred	17.75	1695	2025-02-20 23:40:39.20361+00	t
7859	Factory New	12.71	1697	2025-02-20 23:40:27.010598+00	f
7860	Minimal Wear	5.18	1697	2025-02-20 23:40:27.029596+00	f
7861	Field-Tested	2.86	1697	2025-02-20 23:40:27.019629+00	f
7862	Well-Worn	3.64	1697	2025-02-15 23:05:35.701628+00	f
7863	Battle-Scarred	2.96	1697	2025-02-20 23:40:26.998603+00	f
7864	Factory New	32.31	1697	2025-02-20 23:40:45.959043+00	t
7865	Minimal Wear	10.78	1697	2025-02-20 23:40:45.967041+00	t
7866	Field-Tested	5.74	1697	2025-02-20 23:40:45.964043+00	t
7867	Well-Worn	6.8	1697	2025-02-20 23:40:45.971041+00	t
7868	Battle-Scarred	6.2	1697	2025-02-20 23:40:45.955041+00	t
7869	Factory New	1.57	1699	2025-02-20 23:40:51.558835+00	f
7870	Minimal Wear	0.79	1699	2025-02-20 23:40:51.566834+00	f
7871	Field-Tested	0.58	1699	2025-02-20 23:40:51.562837+00	f
7872	Well-Worn	0.53	1699	2025-02-20 23:40:51.571834+00	f
7873	Battle-Scarred	0.55	1699	2025-02-20 23:40:51.554835+00	f
7874	Factory New	3.47	1699	2025-02-20 23:40:48.113811+00	t
7875	Minimal Wear	2.14	1699	2025-02-20 23:40:48.12181+00	t
7876	Field-Tested	1.52	1699	2025-02-20 23:40:48.117811+00	t
7877	Well-Worn	2.23	1699	2025-02-20 23:40:48.125809+00	t
7878	Battle-Scarred	2.11	1699	2025-02-20 23:40:48.10781+00	t
7879	Factory New	1.57	1701	2025-02-20 23:40:28.681237+00	f
7880	Minimal Wear	0.96	1701	2025-02-20 23:40:28.689238+00	f
7881	Field-Tested	0.63	1701	2025-02-20 23:40:28.685238+00	f
7882	Well-Worn	0.69	1701	2025-02-20 23:40:28.693237+00	f
7883	Battle-Scarred	0.56	1701	2025-02-20 23:40:28.676237+00	f
7884	Factory New	3.64	1701	2025-02-20 23:40:46.721692+00	t
7885	Minimal Wear	1.91	1701	2025-02-20 23:40:46.743693+00	t
7886	Field-Tested	1.23	1701	2025-02-20 23:40:46.732691+00	t
7887	Well-Worn	1.36	1701	2025-02-20 23:40:46.753693+00	t
7888	Battle-Scarred	1.25	1701	2025-02-20 23:40:46.707691+00	t
7889	Factory New	1.63	1703	2025-02-20 23:40:55.130945+00	f
7890	Minimal Wear	0.83	1703	2025-02-20 23:40:55.147942+00	f
7891	Field-Tested	0.47	1703	2025-02-20 23:40:55.138945+00	f
7892	Well-Worn	0.52	1703	2025-02-20 23:40:55.153943+00	f
7893	Battle-Scarred	0.48	1703	2025-02-20 23:40:55.121942+00	f
7894	Factory New	4.84	1703	2025-02-20 23:40:49.277001+00	t
7895	Minimal Wear	2.14	1703	2025-02-20 23:40:49.285+00	t
7896	Field-Tested	1.1	1703	2025-02-20 23:40:49.281+00	t
7897	Well-Worn	2.96	1703	2025-02-20 23:40:49.289+00	t
7898	Battle-Scarred	2.56	1703	2025-02-20 23:40:49.272+00	t
7899	Factory New	2.21	1705	2025-02-20 23:40:20.120502+00	f
7900	Minimal Wear	1.14	1705	2025-02-20 23:40:20.141016+00	f
7901	Field-Tested	1.18	1705	2025-02-20 23:40:20.135015+00	f
7902	Well-Worn	1.2	1705	2025-02-20 23:40:20.155016+00	f
7903	Battle-Scarred	1.4	1705	2025-02-20 23:40:20.101458+00	f
7904	Factory New	4.79	1705	2025-02-20 23:40:41.889943+00	t
7905	Minimal Wear	2.74	1705	2025-02-20 23:40:41.901944+00	t
7906	Field-Tested	1.63	1705	2025-02-20 23:40:41.897944+00	t
7907	Well-Worn	2.04	1705	2025-02-20 23:40:41.905461+00	t
7908	Battle-Scarred	1.96	1705	2025-02-20 23:40:41.886944+00	t
7909	Factory New	1.73	1707	2025-02-20 23:40:04.486596+00	f
7910	Minimal Wear	1.2	1707	2025-02-20 23:40:04.497597+00	f
7911	Field-Tested	0.64	1707	2025-02-20 23:40:04.490596+00	f
7912	Well-Worn	0.89	1707	2025-02-20 23:40:04.501596+00	f
7913	Battle-Scarred	0.47	1707	2025-02-20 23:40:04.482595+00	f
7914	Factory New	5.04	1707	2025-02-20 23:40:34.89218+00	t
7915	Minimal Wear	2.09	1707	2025-02-20 23:40:34.902311+00	t
7916	Field-Tested	1.18	1707	2025-02-20 23:40:34.897181+00	t
7917	Well-Worn	2.14	1707	2025-02-20 23:40:34.90731+00	t
7918	Battle-Scarred	1.47	1707	2025-02-20 23:40:34.88918+00	t
7919	Factory New	1.28	1709	2025-02-20 23:40:12.962313+00	f
7920	Minimal Wear	0.27	1709	2025-02-20 23:40:12.982411+00	f
7921	Field-Tested	0.17	1709	2025-02-20 23:40:12.971206+00	f
7922	Well-Worn	0.18	1709	2025-02-20 23:40:12.992492+00	f
7923	Battle-Scarred	0.14	1709	2025-02-20 23:40:12.947513+00	f
7924	Factory New	0.63	1710	2025-02-20 23:40:49.509046+00	f
7925	Minimal Wear	0.18	1710	2025-02-20 23:40:49.518046+00	f
7926	Field-Tested	0.1	1710	2025-02-20 23:40:49.514049+00	f
7927	Well-Worn	0.31	1710	2025-02-20 23:40:49.522046+00	f
7928	Battle-Scarred	0.35	1710	2025-02-20 23:40:49.505047+00	f
7929	Factory New	3.05	1710	2025-02-20 23:40:47.704672+00	t
7930	Minimal Wear	0.62	1710	2025-02-20 23:40:47.713673+00	t
7931	Field-Tested	0.28	1710	2025-02-20 23:40:47.708672+00	t
7932	Well-Worn	0.16	1710	2025-02-20 23:40:47.717672+00	t
7933	Battle-Scarred	0.23	1710	2025-02-20 23:40:47.699672+00	t
7934	Factory New	0.38	1712	2025-02-20 23:40:02.472521+00	f
7935	Minimal Wear	0.15	1712	2025-02-20 23:40:02.497747+00	f
7936	Field-Tested	0.14	1712	2025-02-20 23:40:02.488747+00	f
7937	Well-Worn	0.06	1712	2025-02-20 23:40:02.507748+00	f
7938	Battle-Scarred	0.1	1712	2025-02-20 23:40:02.455996+00	f
7939	Factory New	2.16	1712	2025-02-20 23:40:33.747001+00	t
7940	Minimal Wear	0.43	1712	2025-02-20 23:40:33.756001+00	t
7941	Field-Tested	0.17	1712	2025-02-20 23:40:33.751+00	t
7942	Well-Worn	0.17	1712	2025-02-20 23:40:33.760461+00	t
7943	Battle-Scarred	0.14	1712	2025-02-20 23:40:33.735266+00	t
7944	Factory New	0.34	1714	2025-02-20 23:40:10.618706+00	f
7945	Minimal Wear	0.12	1714	2025-02-20 23:40:10.642707+00	f
7946	Field-Tested	0.1	1714	2025-02-20 23:40:10.631707+00	f
7947	Well-Worn	0.09	1714	2025-02-20 23:40:10.652948+00	f
7948	Battle-Scarred	0.08	1714	2025-02-20 23:40:10.601189+00	f
7949	Factory New	1.16	1714	2025-02-20 23:40:36.836196+00	t
7950	Minimal Wear	0.31	1714	2025-02-20 23:40:36.844279+00	t
7951	Field-Tested	0.14	1714	2025-02-20 23:40:36.840278+00	t
7952	Well-Worn	0.12	1714	2025-02-20 23:40:36.849279+00	t
7953	Battle-Scarred	0.16	1714	2025-02-20 23:40:36.833198+00	t
7954	Factory New	0.3	1716	2025-02-20 23:40:30.727238+00	f
7955	Minimal Wear	0.16	1716	2025-02-20 23:40:30.749495+00	f
7956	Field-Tested	0.15	1716	2025-02-20 23:40:30.739398+00	f
7957	Well-Worn	0.12	1716	2025-02-20 23:40:30.760352+00	f
7958	Battle-Scarred	0.15	1716	2025-02-20 23:40:30.709815+00	f
7959	Factory New	1.02	1716	2025-02-20 23:40:47.451843+00	t
7960	Minimal Wear	0.38	1716	2025-02-20 23:40:47.459843+00	t
7961	Field-Tested	0.15	1716	2025-02-20 23:40:47.455845+00	t
7962	Well-Worn	0.15	1716	2025-02-20 23:40:47.464844+00	t
7963	Battle-Scarred	0.13	1716	2025-02-20 23:40:47.447845+00	t
7964	Factory New	0.32	1718	2025-02-20 23:40:17.259008+00	f
7965	Minimal Wear	0.19	1718	2025-02-20 23:40:17.269009+00	f
7966	Field-Tested	0.12	1718	2025-02-20 23:40:17.265009+00	f
7967	Well-Worn	0.3	1718	2025-02-20 23:40:17.272009+00	f
7968	Battle-Scarred	0.08	1718	2025-02-20 23:40:17.255008+00	f
7969	Factory New	0.81	1718	2025-02-20 23:40:40.41469+00	t
7970	Minimal Wear	0.48	1718	2025-02-20 23:40:40.436595+00	t
7971	Field-Tested	0.16	1718	2025-02-20 23:40:40.431525+00	t
7972	Well-Worn	0.43	1718	2025-02-20 23:40:40.441576+00	t
7973	Battle-Scarred	0.12	1718	2025-02-20 23:40:40.408694+00	t
7974	Factory New	0.25	1720	2025-02-20 23:40:27.548805+00	f
7975	Minimal Wear	0.13	1720	2025-02-20 23:40:27.557569+00	f
7976	Field-Tested	0.1	1720	2025-02-20 23:40:27.554571+00	f
7977	Well-Worn	0.19	1720	2025-02-20 23:40:27.56157+00	f
7978	Battle-Scarred	0.64	1720	2025-02-20 23:40:27.544808+00	f
7979	Factory New	0.83	1720	2025-02-20 23:40:46.318821+00	t
7980	Minimal Wear	0.28	1720	2025-02-20 23:40:46.32682+00	t
7981	Field-Tested	0.18	1720	2025-02-20 23:40:46.32282+00	t
7982	Well-Worn	1.34	1720	2025-02-20 23:40:46.331821+00	t
7983	Battle-Scarred	0.28	1720	2025-02-20 23:40:46.313822+00	t
7984	Factory New	188.35	1722	2025-02-20 23:39:59.774258+00	f
7985	Minimal Wear	164.59	1722	2025-02-20 23:39:59.784258+00	f
7986	Field-Tested	151.96	1722	2025-02-20 23:39:59.779257+00	f
7987	Well-Worn	144.53	1722	2025-02-20 23:39:59.789257+00	f
7988	Factory New	348.07	1722	2025-02-20 23:40:31.451393+00	t
7989	Minimal Wear	276.17	1722	2025-02-20 23:40:31.468929+00	t
7990	Field-Tested	237.03	1722	2025-02-20 23:40:31.45793+00	t
7991	Well-Worn	254.8	1722	2025-02-20 23:40:31.476089+00	t
7992	Factory New	36.22	1724	2025-02-20 23:40:53.247713+00	f
7993	Minimal Wear	21.59	1724	2025-02-20 23:40:53.268713+00	f
7994	Field-Tested	16.08	1724	2025-02-20 23:40:53.256713+00	f
7995	Well-Worn	19.99	1724	2025-02-20 23:40:53.276378+00	f
7996	Battle-Scarred	16.18	1724	2025-02-20 23:40:53.236712+00	f
7997	Factory New	125.67	1724	2025-02-20 23:40:48.71677+00	t
7998	Minimal Wear	68	1724	2025-02-20 23:40:48.726772+00	t
7999	Field-Tested	43.17	1724	2025-02-20 23:40:48.71977+00	t
8000	Well-Worn	52.63	1724	2025-02-20 23:40:48.73359+00	t
8001	Battle-Scarred	50.15	1724	2025-02-20 23:40:48.710769+00	t
8002	Factory New	41.12	1726	2025-02-20 23:40:15.167882+00	f
8003	Minimal Wear	19.41	1726	2025-02-20 23:40:15.176553+00	f
8004	Field-Tested	12.46	1726	2025-02-20 23:40:15.172552+00	f
8005	Well-Worn	19.52	1726	2025-02-20 23:40:15.181552+00	f
8006	Battle-Scarred	12.22	1726	2025-02-20 23:40:15.163885+00	f
8007	Factory New	85.75	1726	2025-02-20 23:40:39.084289+00	t
8008	Minimal Wear	54.14	1726	2025-02-20 23:40:39.092331+00	t
8009	Field-Tested	28.62	1726	2025-02-20 23:40:39.087289+00	t
8010	Well-Worn	43.51	1726	2025-02-20 23:40:39.096511+00	t
8011	Battle-Scarred	35.29	1726	2025-02-20 23:40:39.080291+00	t
8012	Factory New	17.5	1728	2025-02-20 23:40:03.435209+00	f
8013	Minimal Wear	13.9	1728	2025-02-20 23:40:03.446209+00	f
8014	Field-Tested	12.79	1728	2025-02-20 23:40:03.440208+00	f
8015	Well-Worn	17.04	1728	2025-02-20 23:40:03.451209+00	f
8016	Battle-Scarred	16.1	1728	2025-02-20 23:40:03.430178+00	f
8017	Factory New	35.46	1728	2025-02-20 23:40:34.140384+00	t
8018	Minimal Wear	26.02	1728	2025-02-20 23:40:34.150384+00	t
8019	Field-Tested	25.14	1728	2025-02-20 23:40:34.145385+00	t
8020	Well-Worn	24.47	1728	2025-02-20 23:40:34.155385+00	t
8021	Battle-Scarred	18.97	1728	2025-02-20 23:40:34.135261+00	t
8022	Factory New	15.62	1730	2025-02-20 23:40:04.665699+00	f
8023	Minimal Wear	13.3	1730	2025-02-20 23:40:04.674658+00	f
8024	Field-Tested	12.36	1730	2025-02-20 23:40:04.668698+00	f
8025	Well-Worn	14.14	1730	2025-02-20 23:40:04.681658+00	f
8026	Battle-Scarred	14.37	1730	2025-02-20 23:40:04.6607+00	f
8027	Factory New	30.08	1730	2025-02-20 23:40:35.031262+00	t
8028	Minimal Wear	24.58	1730	2025-02-20 23:40:35.040261+00	t
8029	Field-Tested	20.32	1730	2025-02-20 23:40:35.035261+00	t
8030	Well-Worn	21.35	1730	2025-02-20 23:40:35.044262+00	t
8031	Battle-Scarred	42.15	1730	2025-02-20 23:40:35.026261+00	t
8032	Factory New	4.06	1732	2025-02-20 23:40:11.422397+00	f
8033	Minimal Wear	2.53	1732	2025-02-20 23:40:11.432396+00	f
8034	Field-Tested	2.05	1732	2025-02-20 23:40:11.429397+00	f
8035	Well-Worn	2.5	1732	2025-02-20 23:40:11.436395+00	f
8036	Battle-Scarred	2.35	1732	2025-02-20 23:40:11.418395+00	f
8037	Factory New	11.37	1732	2025-02-20 23:40:37.108776+00	t
8038	Minimal Wear	6.18	1732	2025-02-20 23:40:37.118191+00	t
8039	Field-Tested	3.56	1732	2025-02-20 23:40:37.114192+00	t
8040	Well-Worn	5.45	1732	2025-02-20 23:40:37.122191+00	t
8041	Battle-Scarred	3.72	1732	2025-02-20 23:40:37.104776+00	t
8042	Factory New	3.24	1734	2025-02-20 23:40:13.812663+00	f
8043	Minimal Wear	1.9	1734	2025-02-20 23:40:13.826229+00	f
8044	Field-Tested	1.86	1734	2025-02-20 23:40:13.81918+00	f
8045	Well-Worn	2.14	1734	2025-02-20 23:40:13.831235+00	f
8046	Factory New	6.33	1734	2025-02-20 23:40:38.548175+00	t
8047	Minimal Wear	4.04	1734	2025-02-20 23:40:38.571806+00	t
8048	Field-Tested	2.5	1734	2025-02-20 23:40:38.557806+00	t
8049	Well-Worn	2.71	1734	2025-02-20 23:40:38.584835+00	t
8050	Factory New	3.24	1736	2025-02-20 23:40:54.87089+00	f
8051	Minimal Wear	2.87	1736	2025-02-20 23:40:54.879405+00	f
8052	Field-Tested	1.78	1736	2025-02-20 23:40:54.874408+00	f
8053	Well-Worn	2.16	1736	2025-02-20 23:40:54.885176+00	f
8054	Battle-Scarred	2.1	1736	2025-02-20 23:40:54.866889+00	f
8055	Factory New	6.64	1736	2025-02-20 23:40:49.157061+00	t
8056	Minimal Wear	4.04	1736	2025-02-20 23:40:49.16806+00	t
8057	Field-Tested	3.13	1736	2025-02-20 23:40:49.162062+00	t
8058	Well-Worn	3.85	1736	2025-02-20 23:40:49.171061+00	t
8059	Battle-Scarred	4.06	1736	2025-02-20 23:40:49.153062+00	t
8060	Factory New	4.06	1738	2025-02-20 23:40:52.319777+00	f
8061	Minimal Wear	1.92	1738	2025-02-20 23:40:52.335779+00	f
8062	Field-Tested	1.64	1738	2025-02-20 23:40:52.327777+00	f
8063	Well-Worn	1.65	1738	2025-02-20 23:40:52.346781+00	f
8064	Battle-Scarred	1.73	1738	2025-02-20 23:40:52.307778+00	f
8065	Factory New	9.33	1738	2025-02-20 23:40:48.399712+00	t
8066	Minimal Wear	3.78	1738	2025-02-20 23:40:48.408711+00	t
8067	Field-Tested	2.68	1738	2025-02-20 23:40:48.404711+00	t
8068	Well-Worn	3.7	1738	2025-02-20 23:40:48.412712+00	t
8069	Battle-Scarred	2.39	1738	2025-02-20 23:40:48.393711+00	t
8070	Factory New	3.43	1740	2025-02-20 23:40:17.119444+00	f
8071	Minimal Wear	1.91	1740	2025-02-20 23:40:17.129444+00	f
8072	Field-Tested	1.79	1740	2025-02-20 23:40:17.124445+00	f
8073	Well-Worn	2.27	1740	2025-02-20 23:40:17.133444+00	f
8074	Battle-Scarred	2.31	1740	2025-02-20 23:40:17.115444+00	f
8075	Factory New	6.48	1740	2025-02-20 23:40:40.253831+00	t
8076	Minimal Wear	3.48	1740	2025-02-20 23:40:40.296692+00	t
8077	Field-Tested	3.23	1740	2025-02-20 23:40:40.267563+00	t
8078	Well-Worn	4.76	1740	2025-02-20 23:40:40.30169+00	t
8079	Battle-Scarred	4.38	1740	2025-02-20 23:40:40.247388+00	t
8080	Factory New	0.59	1742	2025-02-20 23:40:05.303406+00	f
8081	Minimal Wear	0.42	1742	2025-02-20 23:40:05.314406+00	f
8082	Field-Tested	0.3	1742	2025-02-20 23:40:05.307405+00	f
8083	Well-Worn	0.4	1742	2025-02-20 23:40:05.319407+00	f
8084	Battle-Scarred	0.47	1742	2025-02-20 23:40:05.296407+00	f
8085	Factory New	2.95	1742	2025-02-20 23:40:35.420758+00	t
8086	Minimal Wear	2.09	1742	2025-02-20 23:40:35.428758+00	t
8087	Field-Tested	1.33	1742	2025-02-20 23:40:35.424756+00	t
8088	Well-Worn	2.09	1742	2025-02-20 23:40:35.432756+00	t
8089	Battle-Scarred	2	1742	2025-02-20 23:40:35.417035+00	t
8090	Factory New	1.27	1744	2025-02-20 23:40:31.295934+00	f
8091	Minimal Wear	0.29	1744	2025-02-20 23:40:31.32009+00	f
8092	Field-Tested	0.2	1744	2025-02-20 23:40:31.311192+00	f
8093	Well-Worn	0.19	1744	2025-02-20 23:40:31.333431+00	f
8094	Battle-Scarred	0.18	1744	2025-02-20 23:40:31.290622+00	f
8095	Factory New	2.54	1744	2025-02-20 23:40:47.614856+00	t
8096	Minimal Wear	0.62	1744	2025-02-20 23:40:47.621855+00	t
8097	Field-Tested	0.37	1744	2025-02-20 23:40:47.618857+00	t
8098	Well-Worn	0.33	1744	2025-02-20 23:40:47.626856+00	t
8099	Battle-Scarred	0.29	1744	2025-02-20 23:40:47.609857+00	t
8100	Factory New	0.45	1746	2025-02-20 23:40:24.033853+00	f
8101	Minimal Wear	0.28	1746	2025-02-20 23:40:24.040853+00	f
8102	Field-Tested	0.23	1746	2025-02-20 23:40:24.037853+00	f
8103	Well-Worn	0.34	1746	2025-02-20 23:40:24.046971+00	f
8104	Battle-Scarred	0.6	1746	2025-02-20 23:40:24.029854+00	f
8105	Factory New	0.98	1746	2025-02-20 23:40:43.741541+00	t
8106	Minimal Wear	0.69	1746	2025-02-20 23:40:43.75754+00	t
8107	Field-Tested	0.46	1746	2025-02-20 23:40:43.75354+00	t
8108	Well-Worn	0.38	1746	2025-02-20 23:40:43.77054+00	t
8109	Battle-Scarred	0.4	1746	2025-02-20 23:40:43.73654+00	t
8110	Factory New	0.5	1748	2025-02-20 23:40:09.087121+00	f
8111	Minimal Wear	0.36	1748	2025-02-20 23:40:09.103186+00	f
8112	Field-Tested	0.27	1748	2025-02-20 23:40:09.091122+00	f
8113	Well-Worn	0.42	1748	2025-02-20 23:40:09.109185+00	f
8114	Battle-Scarred	0.22	1748	2025-02-20 23:40:09.074075+00	f
8115	Factory New	1.57	1748	2025-02-20 23:40:36.368809+00	t
8116	Minimal Wear	0.97	1748	2025-02-20 23:40:36.380738+00	t
8117	Field-Tested	0.41	1748	2025-02-20 23:40:36.37448+00	t
8118	Well-Worn	2.39	1748	2025-02-20 23:40:36.384738+00	t
8119	Battle-Scarred	0.45	1748	2025-02-20 23:40:36.364808+00	t
8120	Factory New	0.43	1750	2025-02-20 23:40:18.850705+00	f
8121	Minimal Wear	0.3	1750	2025-02-20 23:40:18.858705+00	f
8122	Field-Tested	0.23	1750	2025-02-20 23:40:18.854704+00	f
8123	Well-Worn	0.29	1750	2025-02-20 23:40:18.865529+00	f
8124	Battle-Scarred	0.23	1750	2025-02-20 23:40:18.847704+00	f
8125	Factory New	1.31	1750	2025-02-20 23:40:41.390335+00	t
8126	Minimal Wear	0.85	1750	2025-02-20 23:40:41.404336+00	t
8127	Field-Tested	0.33	1750	2025-02-20 23:40:41.398337+00	t
8128	Well-Worn	0.78	1750	2025-02-20 23:40:41.408089+00	t
8129	Battle-Scarred	0.3	1750	2025-02-20 23:40:41.386337+00	t
8130	Factory New	0.5	1752	2025-02-20 23:40:25.748526+00	f
8131	Minimal Wear	0.27	1752	2025-02-20 23:40:25.756529+00	f
8132	Field-Tested	0.23	1752	2025-02-20 23:40:25.752526+00	f
8133	Well-Worn	0.24	1752	2025-02-20 23:40:25.766527+00	f
8134	Battle-Scarred	7.02	1752	2025-02-20 23:40:25.738525+00	f
8135	Factory New	0.86	1752	2025-02-20 23:40:45.474724+00	t
8136	Minimal Wear	0.63	1752	2025-02-20 23:40:45.489714+00	t
8137	Field-Tested	0.38	1752	2025-02-20 23:40:45.485716+00	t
8138	Well-Worn	1.46	1752	2025-02-20 23:40:45.502714+00	t
8139	Battle-Scarred	3.7	1752	2025-02-20 23:40:45.469714+00	t
8140	Factory New	0.54	1754	2025-02-20 23:40:27.317589+00	f
8141	Minimal Wear	0.31	1754	2025-02-20 23:40:27.325587+00	f
8142	Field-Tested	0.22	1754	2025-02-20 23:40:27.321588+00	f
8143	Well-Worn	0.26	1754	2025-02-20 23:40:27.330587+00	f
8144	Battle-Scarred	0.27	1754	2025-02-20 23:40:27.31359+00	f
8145	Factory New	1.39	1754	2025-02-20 23:40:46.137153+00	t
8146	Minimal Wear	0.66	1754	2025-02-20 23:40:46.147154+00	t
8147	Field-Tested	0.34	1754	2025-02-20 23:40:46.141152+00	t
8148	Well-Worn	0.38	1754	2025-02-20 23:40:46.150153+00	t
8149	Battle-Scarred	0.38	1754	2025-02-20 23:40:46.132154+00	t
8150	Field-Tested	167.63	1756	2025-02-20 23:40:15.735343+00	f
8151	Well-Worn	126.36	1756	2025-02-20 23:40:15.738343+00	f
8152	Battle-Scarred	95.13	1756	2025-02-20 23:40:15.731345+00	f
8153	Field-Tested	460.12	1756	2025-02-20 23:40:39.359775+00	t
8154	Well-Worn	284.11	1756	2025-02-20 23:40:39.366775+00	t
8155	Battle-Scarred	170.57	1756	2025-02-20 23:40:39.356776+00	t
8156	Factory New	7.99	1758	2025-02-20 23:40:31.201267+00	f
8157	Minimal Wear	5.98	1758	2025-02-20 23:40:31.217026+00	f
8158	Field-Tested	6.06	1758	2025-02-20 23:40:31.208268+00	f
8159	Well-Worn	11.34	1758	2025-02-20 23:40:31.224027+00	f
8160	Factory New	41.96	1758	2025-02-20 23:40:47.553845+00	t
8161	Minimal Wear	18.91	1758	2025-02-20 23:40:47.564845+00	t
8162	Field-Tested	17.16	1758	2025-02-20 23:40:47.556844+00	t
8163	Well-Worn	\N	1758	\N	t
8164	Minimal Wear	86.64	1760	2025-02-20 23:40:03.857982+00	f
8165	Field-Tested	45.92	1760	2025-02-20 23:40:03.852981+00	f
8166	Well-Worn	58.92	1760	2025-02-20 23:40:03.862981+00	f
8167	Minimal Wear	147.37	1760	2025-02-20 23:40:34.415164+00	t
8168	Field-Tested	86.79	1760	2025-02-20 23:40:34.409165+00	t
8169	Well-Worn	146.32	1760	2025-02-20 23:40:34.420382+00	t
8170	Factory New	26.94	1762	2025-02-20 23:40:15.295707+00	f
8171	Minimal Wear	22.42	1762	2025-02-20 23:40:15.302705+00	f
8172	Field-Tested	24.4	1762	2025-02-20 23:40:15.299705+00	f
8173	Well-Worn	25.66	1762	2025-02-20 23:40:15.307705+00	f
8174	Battle-Scarred	23.57	1762	2025-02-20 23:40:15.290706+00	f
8175	Factory New	94.72	1762	2025-02-20 23:40:39.166664+00	t
8176	Minimal Wear	76.5	1762	2025-02-20 23:40:39.173892+00	t
8177	Field-Tested	69.7	1762	2025-02-20 23:40:39.170424+00	t
8178	Well-Worn	87.77	1762	2025-02-20 23:40:39.177894+00	t
8179	Battle-Scarred	82.27	1762	2025-02-15 23:05:40.130365+00	t
8180	Factory New	27.37	1764	2025-02-20 23:40:23.8553+00	f
8181	Minimal Wear	22.4	1764	2025-02-20 23:40:23.866299+00	f
8182	Field-Tested	19.22	1764	2025-02-20 23:40:23.860299+00	f
8183	Well-Worn	18.5	1764	2025-02-20 23:40:23.870299+00	f
8184	Battle-Scarred	17.1	1764	2025-02-20 23:40:23.8503+00	f
8185	Factory New	58.77	1764	2025-02-15 23:05:42.117317+00	t
8186	Minimal Wear	35.73	1764	2025-02-20 23:40:43.56126+00	t
8187	Field-Tested	44.96	1764	2025-02-20 23:40:43.553261+00	t
8188	Well-Worn	36.48	1764	2025-02-20 23:40:43.567261+00	t
8189	Battle-Scarred	28.05	1764	2025-02-20 23:40:43.54726+00	t
8190	Factory New	18.43	1766	2025-02-20 23:40:06.482647+00	f
8191	Minimal Wear	6.66	1766	2025-02-20 23:40:06.502646+00	f
8192	Field-Tested	5.36	1766	2025-02-20 23:40:06.490649+00	f
8193	Well-Worn	17.32	1766	2025-02-20 23:40:06.509647+00	f
8194	Battle-Scarred	6.69	1766	2025-02-20 23:40:06.473649+00	f
8195	Factory New	58.55	1766	2025-02-20 23:40:35.736175+00	t
8196	Minimal Wear	14.06	1766	2025-02-20 23:40:35.748562+00	t
8197	Field-Tested	10.51	1766	2025-02-20 23:40:35.741207+00	t
8198	Well-Worn	36.85	1766	2025-02-20 23:40:35.753669+00	t
8199	Battle-Scarred	13.49	1766	2025-02-15 23:05:38.678269+00	t
8200	Factory New	10.74	1768	2025-02-20 23:40:20.713099+00	f
8201	Minimal Wear	7.77	1768	2025-02-20 23:40:20.746912+00	f
8202	Field-Tested	8.2	1768	2025-02-20 23:40:20.726753+00	f
8203	Factory New	20.45	1768	2025-02-20 23:40:41.998356+00	t
8204	Minimal Wear	17.96	1768	2025-02-20 23:40:42.007099+00	t
8205	Field-Tested	19.86	1768	2025-02-20 23:40:42.002355+00	t
8206	Factory New	10	1770	2025-02-20 23:40:08.352171+00	f
8207	Minimal Wear	8.73	1770	2025-02-20 23:40:08.370175+00	f
8208	Field-Tested	10.19	1770	2025-02-20 23:40:08.364173+00	f
8209	Well-Worn	12.68	1770	2025-02-15 19:05:54.709834+00	f
8210	Factory New	23.31	1770	2025-02-20 23:40:36.152799+00	t
8211	Minimal Wear	15.61	1770	2025-02-20 23:40:36.163916+00	t
8212	Field-Tested	14.67	1770	2025-02-20 23:40:36.1578+00	t
8213	Well-Worn	\N	1770	\N	t
8214	Factory New	6.08	1772	2025-02-20 23:40:22.176485+00	f
8215	Minimal Wear	5.65	1772	2025-02-20 23:40:22.186487+00	f
8216	Field-Tested	5.55	1772	2025-02-20 23:40:22.181485+00	f
8217	Well-Worn	6.82	1772	2025-02-15 18:56:10.704015+00	f
8218	Battle-Scarred	\N	1772	\N	f
8219	Factory New	16.48	1772	2025-02-20 23:40:42.637968+00	t
8220	Minimal Wear	14.8	1772	2025-02-20 23:40:42.646931+00	t
8221	Field-Tested	16.88	1772	2025-02-20 23:40:42.641968+00	t
8222	Well-Worn	45.03	1772	2025-02-20 23:40:42.650931+00	t
8223	Battle-Scarred	20.22	1772	2025-02-20 23:40:42.634968+00	t
8224	Minimal Wear	4.48	1774	2025-02-20 23:40:11.997815+00	f
8225	Field-Tested	1.48	1774	2025-02-20 23:40:11.991069+00	f
8226	Well-Worn	3.08	1774	2025-02-20 23:40:12.000808+00	f
8227	Battle-Scarred	3.68	1774	2025-02-20 23:40:11.986069+00	f
8228	Minimal Wear	6.26	1774	2025-02-20 23:40:37.269258+00	t
8229	Field-Tested	2.23	1774	2025-02-20 23:40:37.266264+00	t
8230	Well-Worn	2.53	1774	2025-02-20 23:40:37.273849+00	t
8231	Battle-Scarred	2.39	1774	2025-02-20 23:40:37.260262+00	t
8232	Factory New	1.71	1776	2025-02-20 23:40:25.468183+00	f
8233	Minimal Wear	0.99	1776	2025-02-20 23:40:25.475182+00	f
8234	Field-Tested	0.87	1776	2025-02-20 23:40:25.471183+00	f
8235	Well-Worn	1.13	1776	2025-02-20 23:40:25.485184+00	f
8236	Factory New	8.14	1776	2025-02-20 23:40:45.200377+00	t
8237	Minimal Wear	1.8	1776	2025-02-20 23:40:45.221888+00	t
8238	Field-Tested	1.34	1776	2025-02-20 23:40:45.213891+00	t
8239	Well-Worn	1.76	1776	2025-02-20 23:40:45.231889+00	t
8240	Factory New	2.5	1778	2025-02-20 23:40:09.519032+00	f
8241	Minimal Wear	1.75	1778	2025-02-20 23:40:09.533738+00	f
8242	Field-Tested	2.22	1778	2025-02-20 23:40:09.527741+00	f
8243	Factory New	4.22	1778	2025-02-20 23:40:36.537451+00	t
8244	Minimal Wear	2.61	1778	2025-02-20 23:40:36.547573+00	t
8245	Field-Tested	2.64	1778	2025-02-20 23:40:36.541572+00	t
8246	Factory New	1.68	1780	2025-02-20 23:40:14.142782+00	f
8247	Minimal Wear	0.93	1780	2025-02-20 23:40:14.159721+00	f
8248	Field-Tested	0.85	1780	2025-02-20 23:40:14.154721+00	f
8249	Well-Worn	1.33	1780	2025-02-20 23:40:14.171721+00	f
8250	Battle-Scarred	0.78	1780	2025-02-20 23:40:14.136781+00	f
8251	Factory New	2.74	1780	2025-02-20 23:40:38.634978+00	t
8252	Minimal Wear	1.84	1780	2025-02-20 23:40:38.651983+00	t
8253	Field-Tested	1.4	1780	2025-02-20 23:40:38.643984+00	t
8254	Well-Worn	7.37	1780	2025-02-15 23:05:39.939312+00	t
8255	Battle-Scarred	1.84	1780	2025-02-20 23:40:38.626297+00	t
8256	Factory New	230.46	1781	2025-02-20 23:40:15.648344+00	f
8257	Factory New	406.34	1781	2025-02-20 23:40:39.340403+00	t
8258	Minimal Wear	151.49	1781	2025-02-20 23:40:15.658343+00	f
8259	Minimal Wear	238.03	1781	2025-02-20 23:40:39.349404+00	t
8260	Field-Tested	133.58	1781	2025-02-20 23:40:15.652343+00	f
8261	Field-Tested	150	1781	2025-02-20 23:40:39.344403+00	t
8262	Well-Worn	129.32	1781	2025-02-20 23:40:15.662343+00	f
8263	Well-Worn	147.37	1781	2025-02-20 23:40:39.353403+00	t
8264	Battle-Scarred	99.06	1781	2025-02-20 23:40:15.642343+00	f
8265	Battle-Scarred	151.05	1781	2025-02-20 23:40:39.336403+00	t
8266	Factory New	82.06	1782	2025-02-20 23:40:12.622469+00	f
8267	Factory New	218.07	1782	2025-02-20 23:40:37.530361+00	t
8268	Minimal Wear	37.65	1782	2025-02-20 23:40:12.632469+00	f
8269	Minimal Wear	104.9	1782	2025-02-20 23:40:37.540763+00	t
8270	Field-Tested	16.08	1782	2025-02-20 23:40:12.628473+00	f
8271	Field-Tested	56.26	1782	2025-02-20 23:40:37.534764+00	t
8272	Well-Worn	22.93	1782	2025-02-15 23:05:29.552794+00	f
8273	Well-Worn	72	1782	2025-02-20 23:40:37.550764+00	t
8274	Battle-Scarred	17.06	1782	2025-02-20 23:40:12.618469+00	f
8275	Battle-Scarred	58.85	1782	2025-02-15 23:05:39.666291+00	t
8276	Factory New	114.85	1783	2025-02-20 23:40:01.239309+00	f
8277	Factory New	133.8	1783	2025-02-20 23:40:32.793417+00	t
8278	Minimal Wear	36.78	1783	2025-02-20 23:40:01.250309+00	f
8279	Minimal Wear	63.1	1783	2025-02-20 23:40:32.819329+00	t
8280	Field-Tested	16.53	1783	2025-02-20 23:40:01.246313+00	f
8281	Field-Tested	29.8	1783	2025-02-20 23:40:32.80833+00	t
8282	Well-Worn	13.27	1783	2025-02-20 23:40:01.25431+00	f
8283	Well-Worn	30.32	1783	2025-02-20 23:40:32.831653+00	t
8284	Battle-Scarred	11.63	1783	2025-02-20 23:40:01.235309+00	f
8285	Battle-Scarred	27.8	1783	2025-02-20 23:40:32.77458+00	t
8286	Factory New	19.22	1784	2025-02-20 23:40:23.65359+00	f
8287	Factory New	36.82	1784	2025-02-20 23:40:43.410479+00	t
8288	Minimal Wear	13.92	1784	2025-02-20 23:40:23.66459+00	f
8289	Minimal Wear	23.65	1784	2025-02-20 23:40:43.424959+00	t
8290	Field-Tested	7.95	1784	2025-02-20 23:40:23.65859+00	f
8291	Field-Tested	11.61	1784	2025-02-20 23:40:43.420959+00	t
8292	Well-Worn	8.26	1784	2025-02-20 23:40:23.668589+00	f
8293	Well-Worn	10.94	1784	2025-02-20 23:40:43.433959+00	t
8294	Battle-Scarred	7.65	1784	2025-02-20 23:40:23.648595+00	f
8295	Battle-Scarred	11.18	1784	2025-02-20 23:40:43.406479+00	t
8296	Factory New	19.83	1785	2025-02-20 23:40:52.043458+00	f
8297	Factory New	39.6	1785	2025-02-20 23:40:48.259507+00	t
8298	Minimal Wear	11.66	1785	2025-02-20 23:40:52.057973+00	f
8299	Minimal Wear	20.84	1785	2025-02-20 23:40:48.270507+00	t
8300	Field-Tested	8.42	1785	2025-02-20 23:40:52.050458+00	f
8301	Field-Tested	12.5	1785	2025-02-20 23:40:48.266508+00	t
8302	Well-Worn	7.8	1785	2025-02-20 23:40:52.069493+00	f
8303	Well-Worn	10.65	1785	2025-02-20 23:40:48.274506+00	t
8304	Battle-Scarred	7.5	1785	2025-02-20 23:40:52.036458+00	f
8305	Battle-Scarred	10.29	1785	2025-02-20 23:40:48.255507+00	t
8306	Factory New	7.24	1786	2025-02-20 23:40:16.568725+00	f
8307	Factory New	27.37	1786	2025-02-20 23:40:39.831644+00	t
8308	Minimal Wear	3.73	1786	2025-02-20 23:40:16.578726+00	f
8309	Minimal Wear	10.3	1786	2025-02-20 23:40:39.840643+00	t
8310	Field-Tested	1.42	1786	2025-02-20 23:40:16.572725+00	f
8311	Field-Tested	3.99	1786	2025-02-20 23:40:39.836644+00	t
8312	Well-Worn	2.77	1786	2025-02-20 23:40:16.582725+00	f
8313	Well-Worn	5.17	1786	2025-02-20 23:40:39.845781+00	t
8314	Battle-Scarred	1.12	1786	2025-02-20 23:40:16.564726+00	f
8315	Battle-Scarred	4.1	1786	2025-02-20 23:40:39.826644+00	t
8316	Factory New	5.43	1787	2025-02-20 23:40:06.436618+00	f
8317	Factory New	8.82	1787	2025-02-20 23:40:35.705533+00	t
8318	Minimal Wear	2.95	1787	2025-02-20 23:40:06.453618+00	f
8319	Minimal Wear	4.62	1787	2025-02-20 23:40:35.722408+00	t
8320	Field-Tested	1	1787	2025-02-20 23:40:06.44462+00	f
8321	Field-Tested	1.96	1787	2025-02-20 23:40:35.714445+00	t
8322	Well-Worn	1.18	1787	2025-02-20 23:40:06.465617+00	f
8323	Well-Worn	5.48	1787	2025-02-20 23:40:35.730373+00	t
8324	Battle-Scarred	1.18	1787	2025-02-20 23:40:06.426619+00	f
8325	Battle-Scarred	2.04	1787	2025-02-20 23:40:35.697268+00	t
8326	Factory New	5.58	1788	2025-02-20 23:40:29.658104+00	f
8327	Factory New	13.84	1788	2025-02-20 23:40:47.207471+00	t
8328	Minimal Wear	3.09	1788	2025-02-20 23:40:29.673356+00	f
8329	Minimal Wear	6.44	1788	2025-02-20 23:40:47.218071+00	t
8330	Field-Tested	1.28	1788	2025-02-20 23:40:29.665103+00	f
8331	Field-Tested	2.32	1788	2025-02-20 23:40:47.213473+00	t
8332	Well-Worn	1.33	1788	2025-02-20 23:40:29.681357+00	f
8333	Well-Worn	3.6	1788	2025-02-20 23:40:47.222071+00	t
8334	Battle-Scarred	1.08	1788	2025-02-20 23:40:29.648108+00	f
8335	Battle-Scarred	2.09	1788	2025-02-20 23:40:47.203472+00	t
8336	Factory New	5.3	1789	2025-02-20 23:40:24.906541+00	f
8337	Factory New	7.5	1789	2025-02-20 23:40:44.880547+00	t
8338	Minimal Wear	2.86	1789	2025-02-20 23:40:24.916542+00	f
8339	Minimal Wear	3.58	1789	2025-02-20 23:40:44.893547+00	t
8340	Field-Tested	1.2	1789	2025-02-20 23:40:24.910542+00	f
8341	Field-Tested	1.89	1789	2025-02-20 23:40:44.888547+00	t
8342	Well-Worn	1.15	1789	2025-02-20 23:40:24.919541+00	f
8343	Well-Worn	9.9	1789	2025-02-20 23:40:44.899547+00	t
8344	Battle-Scarred	1.05	1789	2025-02-20 23:40:24.901542+00	f
8345	Battle-Scarred	1.52	1789	2025-02-20 23:40:44.875546+00	t
8346	Factory New	5.65	1790	2025-02-20 23:40:17.414889+00	f
8347	Factory New	8.88	1790	2025-02-20 23:40:40.5275+00	t
8348	Minimal Wear	3.68	1790	2025-02-20 23:40:17.42189+00	f
8349	Minimal Wear	5.45	1790	2025-02-20 23:40:40.5375+00	t
8350	Field-Tested	1.46	1790	2025-02-20 23:40:17.418888+00	f
8351	Field-Tested	3.98	1790	2025-02-20 23:40:40.5325+00	t
8352	Well-Worn	1.48	1790	2025-02-20 23:40:17.428891+00	f
8353	Well-Worn	6.13	1790	2025-02-15 23:05:40.750169+00	t
8354	Battle-Scarred	1.08	1790	2025-02-20 23:40:17.411892+00	f
8355	Battle-Scarred	3.7	1790	2025-02-20 23:40:40.5225+00	t
8356	Factory New	0.92	1791	2025-02-20 23:40:04.775402+00	f
8357	Factory New	7.22	1791	2025-02-20 23:40:35.121467+00	t
8358	Minimal Wear	0.39	1791	2025-02-20 23:40:04.786402+00	f
8359	Minimal Wear	1.22	1791	2025-02-20 23:40:35.131493+00	t
8360	Field-Tested	0.19	1791	2025-02-20 23:40:04.780401+00	f
8361	Field-Tested	0.61	1791	2025-02-20 23:40:35.126492+00	t
8362	Well-Worn	0.14	1791	2025-02-20 23:40:04.790402+00	f
8363	Well-Worn	0.56	1791	2025-02-20 23:40:35.135571+00	t
8364	Battle-Scarred	0.15	1791	2025-02-20 23:40:04.771401+00	f
8365	Battle-Scarred	0.5	1791	2025-02-20 23:40:35.114454+00	t
8366	Factory New	1.03	1792	2025-02-20 23:40:52.43734+00	f
8367	Factory New	5.6	1792	2025-02-20 23:40:48.439851+00	t
8368	Minimal Wear	0.44	1792	2025-02-20 23:40:52.44634+00	f
8369	Minimal Wear	2.49	1792	2025-02-20 23:40:48.449552+00	t
8370	Field-Tested	0.23	1792	2025-02-20 23:40:52.441339+00	f
8371	Field-Tested	2.15	1792	2025-02-20 23:40:48.443851+00	t
8372	Well-Worn	0.16	1792	2025-02-20 23:40:52.451091+00	f
8373	Well-Worn	0.87	1792	2025-02-20 23:40:48.453553+00	t
8374	Battle-Scarred	0.15	1792	2025-02-20 23:40:52.433341+00	f
8375	Battle-Scarred	1.48	1792	2025-02-20 23:40:48.436851+00	t
8376	Factory New	0.73	1793	2025-02-20 23:40:01.770872+00	f
8377	Factory New	2.65	1793	2025-02-20 23:40:33.420804+00	t
8378	Minimal Wear	0.36	1793	2025-02-20 23:40:01.781743+00	f
8379	Minimal Wear	0.79	1793	2025-02-20 23:40:33.43032+00	t
8380	Field-Tested	0.17	1793	2025-02-20 23:40:01.775743+00	f
8381	Field-Tested	0.33	1793	2025-02-20 23:40:33.42532+00	t
8382	Well-Worn	0.13	1793	2025-02-20 23:40:01.785743+00	f
8383	Well-Worn	0.25	1793	2025-02-20 23:40:33.43432+00	t
8384	Battle-Scarred	0.11	1793	2025-02-20 23:40:01.767872+00	f
8385	Battle-Scarred	0.24	1793	2025-02-20 23:40:33.416495+00	t
8386	Factory New	0.67	1794	2025-02-20 23:40:13.900303+00	f
8387	Factory New	1.38	1794	2025-02-20 23:40:38.600724+00	t
8388	Minimal Wear	0.33	1794	2025-02-20 23:40:13.914303+00	f
8389	Minimal Wear	0.74	1794	2025-02-20 23:40:38.616178+00	t
8390	Field-Tested	0.16	1794	2025-02-20 23:40:13.908303+00	f
8391	Field-Tested	0.33	1794	2025-02-20 23:40:38.607721+00	t
8392	Well-Worn	0.12	1794	2025-02-20 23:40:13.920303+00	f
8393	Well-Worn	0.23	1794	2025-02-20 23:40:38.620178+00	t
8394	Battle-Scarred	0.11	1794	2025-02-20 23:40:13.896302+00	f
8395	Battle-Scarred	0.2	1794	2025-02-20 23:40:38.593721+00	t
8396	Factory New	0.69	1795	2025-02-20 23:40:27.237455+00	f
8397	Factory New	2.95	1795	2025-02-20 23:40:46.069814+00	t
8398	Minimal Wear	0.36	1795	2025-02-20 23:40:27.248455+00	f
8399	Minimal Wear	0.83	1795	2025-02-20 23:40:46.080157+00	t
8400	Field-Tested	0.16	1795	2025-02-20 23:40:27.244456+00	f
8401	Field-Tested	0.27	1795	2025-02-20 23:40:46.073815+00	t
8402	Well-Worn	0.14	1795	2025-02-20 23:40:27.252455+00	f
8403	Well-Worn	0.44	1795	2025-02-20 23:40:46.085154+00	t
8404	Battle-Scarred	0.13	1795	2025-02-20 23:40:27.233456+00	f
8405	Battle-Scarred	0.27	1795	2025-02-20 23:40:46.065784+00	t
8406	Factory New	0.68	1796	2025-02-20 23:40:18.803705+00	f
8407	Factory New	1.78	1796	2025-02-20 23:40:41.347699+00	t
8408	Minimal Wear	0.38	1796	2025-02-20 23:40:18.813705+00	f
8409	Minimal Wear	0.66	1796	2025-02-20 23:40:41.354699+00	t
8410	Field-Tested	0.15	1796	2025-02-20 23:40:18.808704+00	f
8411	Field-Tested	0.26	1796	2025-02-20 23:40:41.350697+00	t
8412	Well-Worn	0.12	1796	2025-02-20 23:40:18.817706+00	f
8413	Well-Worn	0.22	1796	2025-02-20 23:40:41.358698+00	t
8414	Battle-Scarred	0.11	1796	2025-02-20 23:40:18.799704+00	f
8415	Battle-Scarred	0.22	1796	2025-02-20 23:40:41.341698+00	t
8416	Factory New	0.58	1797	2025-02-20 23:40:27.847442+00	f
8417	Factory New	1.37	1797	2025-02-20 23:40:46.421482+00	t
8418	Minimal Wear	0.38	1797	2025-02-20 23:40:27.876625+00	f
8419	Minimal Wear	0.64	1797	2025-02-20 23:40:46.430483+00	t
8420	Field-Tested	0.15	1797	2025-02-20 23:40:27.863442+00	f
8421	Field-Tested	0.25	1797	2025-02-20 23:40:46.425482+00	t
8422	Well-Worn	0.14	1797	2025-02-20 23:40:27.887626+00	f
8423	Well-Worn	0.43	1797	2025-02-20 23:40:46.434481+00	t
8424	Battle-Scarred	0.1	1797	2025-02-20 23:40:27.836443+00	f
8425	Battle-Scarred	0.22	1797	2025-02-20 23:40:46.417481+00	t
8426	Factory New	798.33	1798	2025-02-20 23:40:02.762054+00	f
8427	Minimal Wear	437.87	1798	2025-02-20 23:40:02.784803+00	f
8428	Field-Tested	273.36	1798	2025-02-20 23:40:02.778797+00	f
8429	Well-Worn	222.89	1798	2025-02-20 23:40:02.790796+00	f
8430	Battle-Scarred	173.2	1798	2025-02-20 23:40:02.752546+00	f
8431	Factory New	183.25	1799	2025-02-20 23:40:05.458446+00	f
8432	Minimal Wear	120	1799	2025-02-20 23:40:05.470446+00	f
8433	Field-Tested	85.96	1799	2025-02-20 23:40:05.464446+00	f
8434	Well-Worn	80.36	1799	2025-02-20 23:40:05.475586+00	f
8435	Battle-Scarred	49.69	1799	2025-02-20 23:40:05.454446+00	f
8436	Factory New	92.74	1800	2025-02-20 23:40:01.749872+00	f
8437	Minimal Wear	57.64	1800	2025-02-20 23:40:01.757872+00	f
8438	Field-Tested	30.15	1800	2025-02-20 23:40:01.753872+00	f
8439	Well-Worn	29.29	1800	2025-02-20 23:40:01.763872+00	f
8440	Battle-Scarred	25.1	1800	2025-02-20 23:40:01.745874+00	f
8441	Factory New	23.47	1801	2025-02-20 23:40:16.315615+00	f
8442	Minimal Wear	13.5	1801	2025-02-20 23:40:16.325615+00	f
8443	Field-Tested	7.4	1801	2025-02-20 23:40:16.319616+00	f
8444	Well-Worn	8.75	1801	2025-02-20 23:40:16.330615+00	f
8445	Battle-Scarred	5.88	1801	2025-02-20 23:40:16.311616+00	f
8446	Factory New	13.35	1802	2025-02-20 23:40:04.440519+00	f
8447	Minimal Wear	10.98	1802	2025-02-20 23:40:04.450399+00	f
8448	Field-Tested	7.12	1802	2025-02-20 23:40:04.445519+00	f
8449	Well-Worn	6.27	1802	2025-02-20 23:40:04.455398+00	f
8450	Battle-Scarred	5.95	1802	2025-02-20 23:40:04.437518+00	f
8451	Factory New	13.68	1803	2025-02-20 23:40:24.401605+00	f
8452	Minimal Wear	10.89	1803	2025-02-20 23:40:24.411392+00	f
8453	Field-Tested	7.3	1803	2025-02-20 23:40:24.406604+00	f
8454	Well-Worn	6.88	1803	2025-02-20 23:40:24.415387+00	f
8455	Battle-Scarred	5.82	1803	2025-02-20 23:40:24.397604+00	f
8456	Factory New	4.52	1804	2025-02-20 23:39:59.861385+00	f
8457	Minimal Wear	2.9	1804	2025-02-20 23:39:59.870383+00	f
8458	Field-Tested	2.16	1804	2025-02-20 23:39:59.866383+00	f
8459	Well-Worn	3.27	1804	2025-02-20 23:39:59.874383+00	f
8460	Battle-Scarred	2.88	1804	2025-02-20 23:39:59.856383+00	f
8461	Factory New	1.8	1805	2025-02-20 23:40:28.198541+00	f
8462	Minimal Wear	1.55	1805	2025-02-20 23:40:28.215542+00	f
8463	Field-Tested	1.11	1805	2025-02-20 23:40:28.205541+00	f
8464	Well-Worn	1.02	1805	2025-02-20 23:40:28.222541+00	f
8465	Battle-Scarred	0.78	1805	2025-02-20 23:40:28.189542+00	f
8466	Factory New	1.91	1806	2025-02-20 23:40:54.48155+00	f
8467	Minimal Wear	1.64	1806	2025-02-20 23:40:54.493298+00	f
8468	Field-Tested	1.13	1806	2025-02-20 23:40:54.488547+00	f
8469	Well-Worn	0.98	1806	2025-02-20 23:40:54.498298+00	f
8470	Battle-Scarred	0.75	1806	2025-02-20 23:40:54.475548+00	f
8471	Factory New	1.9	1807	2025-02-20 23:40:27.908624+00	f
8472	Minimal Wear	1.58	1807	2025-02-20 23:40:27.935625+00	f
8473	Field-Tested	1.14	1807	2025-02-20 23:40:27.923627+00	f
8474	Well-Worn	0.96	1807	2025-02-20 23:40:27.948142+00	f
8475	Battle-Scarred	0.82	1807	2025-02-20 23:40:27.899624+00	f
8476	Factory New	0.31	1808	2025-02-20 23:40:18.95853+00	f
8477	Minimal Wear	0.24	1808	2025-02-20 23:40:18.968529+00	f
8478	Field-Tested	0.18	1808	2025-02-20 23:40:18.963529+00	f
8479	Well-Worn	0.16	1808	2025-02-20 23:40:18.97253+00	f
8480	Battle-Scarred	0.15	1808	2025-02-20 23:40:18.954529+00	f
8481	Factory New	0.31	1809	2025-02-20 23:40:07.73833+00	f
8482	Minimal Wear	0.24	1809	2025-02-20 23:40:07.75733+00	f
8483	Field-Tested	0.18	1809	2025-02-20 23:40:07.74733+00	f
8484	Well-Worn	0.16	1809	2025-02-20 23:40:07.768331+00	f
8485	Battle-Scarred	0.16	1809	2025-02-20 23:40:07.73033+00	f
8486	Factory New	0.29	1810	2025-02-20 23:40:11.717677+00	f
8487	Minimal Wear	0.32	1810	2025-02-20 23:40:11.726368+00	f
8488	Field-Tested	0.19	1810	2025-02-20 23:40:11.722367+00	f
8489	Well-Worn	0.16	1810	2025-02-20 23:40:11.733367+00	f
8490	Battle-Scarred	0.17	1810	2025-02-20 23:40:11.713679+00	f
8491	Factory New	0.29	1811	2025-02-20 23:40:22.506013+00	f
8492	Minimal Wear	0.22	1811	2025-02-20 23:40:22.515012+00	f
8493	Field-Tested	0.19	1811	2025-02-20 23:40:22.510012+00	f
8494	Well-Worn	0.18	1811	2025-02-20 23:40:22.518012+00	f
8495	Battle-Scarred	0.16	1811	2025-02-20 23:40:22.502012+00	f
8496	Factory New	0.27	1812	2025-02-20 23:40:14.4999+00	f
8497	Minimal Wear	0.22	1812	2025-02-20 23:40:14.5169+00	f
8498	Field-Tested	0.17	1812	2025-02-20 23:40:14.5059+00	f
8499	Well-Worn	0.16	1812	2025-02-20 23:40:14.528461+00	f
8500	Battle-Scarred	0.15	1812	2025-02-20 23:40:14.485866+00	f
8501	Factory New	0.27	1813	2025-02-20 23:40:29.348721+00	f
8502	Minimal Wear	0.21	1813	2025-02-20 23:40:29.367701+00	f
8503	Field-Tested	0.17	1813	2025-02-20 23:40:29.357721+00	f
8504	Well-Worn	0.16	1813	2025-02-20 23:40:29.375702+00	f
8505	Battle-Scarred	0.14	1813	2025-02-20 23:40:29.338722+00	f
8506	Factory New	867.21	1814	2025-02-20 23:39:59.705627+00	f
8507	Minimal Wear	495.93	1814	2025-02-20 23:39:59.714627+00	f
8508	Field-Tested	289.19	1814	2025-02-20 23:39:59.709629+00	f
8509	Well-Worn	259.68	1814	2025-02-20 23:39:59.718629+00	f
8510	Battle-Scarred	158.05	1814	2025-02-20 23:39:59.700544+00	f
8511	Factory New	232.33	1815	2025-02-20 23:40:03.058787+00	f
8512	Minimal Wear	159.11	1815	2025-02-20 23:40:03.087445+00	f
8513	Field-Tested	125.7	1815	2025-02-20 23:40:03.075447+00	f
8514	Well-Worn	75.19	1815	2025-02-20 23:40:03.113579+00	f
8515	Battle-Scarred	59.68	1815	2025-02-20 23:40:03.053712+00	f
8516	Factory New	98.47	1816	2025-02-20 23:40:55.186942+00	f
8517	Minimal Wear	66.91	1816	2025-02-20 23:40:55.200159+00	f
8518	Field-Tested	33.92	1816	2025-02-20 23:40:55.194646+00	f
8519	Well-Worn	32.64	1816	2025-02-20 23:40:55.205159+00	f
8520	Battle-Scarred	26.66	1816	2025-02-20 23:40:55.183943+00	f
8521	Factory New	16.19	1817	2025-02-20 23:40:01.680872+00	f
8522	Minimal Wear	11.88	1817	2025-02-20 23:40:01.688872+00	f
8523	Field-Tested	7.68	1817	2025-02-20 23:40:01.684872+00	f
8524	Well-Worn	8.59	1817	2025-02-20 23:40:01.692872+00	f
8525	Battle-Scarred	7.12	1817	2025-02-20 23:40:01.674872+00	f
8526	Factory New	16.8	1818	2025-02-20 23:40:06.966829+00	f
8527	Minimal Wear	12.06	1818	2025-02-20 23:40:06.984829+00	f
8528	Field-Tested	8.07	1818	2025-02-20 23:40:06.975829+00	f
8529	Well-Worn	8.28	1818	2025-02-20 23:40:06.991829+00	f
8530	Battle-Scarred	6.89	1818	2025-02-20 23:40:06.954829+00	f
8531	Factory New	14.98	1819	2025-02-20 23:40:54.621331+00	f
8532	Minimal Wear	11.58	1819	2025-02-20 23:40:54.640332+00	f
8533	Field-Tested	7.87	1819	2025-02-20 23:40:54.633332+00	f
8534	Well-Worn	7.82	1819	2025-02-20 23:40:54.651332+00	f
8535	Battle-Scarred	7.12	1819	2025-02-20 23:40:54.614331+00	f
8536	Factory New	3.72	1820	2025-02-20 23:40:17.327891+00	f
8537	Minimal Wear	1.45	1820	2025-02-20 23:40:17.336889+00	f
8538	Field-Tested	0.9	1820	2025-02-20 23:40:17.331889+00	f
8539	Well-Worn	0.84	1820	2025-02-20 23:40:17.339889+00	f
8540	Battle-Scarred	0.78	1820	2025-02-20 23:40:17.321889+00	f
8541	Factory New	1.8	1821	2025-02-20 23:40:22.388127+00	f
8542	Minimal Wear	1.4	1821	2025-02-20 23:40:22.399333+00	f
8543	Field-Tested	0.89	1821	2025-02-20 23:40:22.392649+00	f
8544	Well-Worn	0.81	1821	2025-02-20 23:40:22.403334+00	f
8545	Battle-Scarred	0.75	1821	2025-02-20 23:40:22.38413+00	f
8546	Factory New	1.67	1822	2025-02-20 23:40:11.694679+00	f
8547	Minimal Wear	1.38	1822	2025-02-20 23:40:11.703678+00	f
8548	Field-Tested	0.87	1822	2025-02-20 23:40:11.699678+00	f
8549	Well-Worn	0.84	1822	2025-02-20 23:40:11.707679+00	f
8550	Battle-Scarred	0.77	1822	2025-02-20 23:40:11.689685+00	f
8551	Factory New	1.67	1823	2025-02-20 23:40:13.40976+00	f
8552	Minimal Wear	1.39	1823	2025-02-20 23:40:13.42076+00	f
8553	Field-Tested	0.94	1823	2025-02-20 23:40:13.415759+00	f
8554	Well-Worn	0.86	1823	2025-02-20 23:40:13.425273+00	f
8555	Battle-Scarred	0.83	1823	2025-02-20 23:40:13.40476+00	f
8556	Factory New	2.85	1824	2025-02-20 23:40:05.537458+00	f
8557	Minimal Wear	1.02	1824	2025-02-20 23:40:05.547458+00	f
8558	Field-Tested	0.28	1824	2025-02-20 23:40:05.541459+00	f
8559	Well-Worn	0.6	1824	2025-02-20 23:40:05.551459+00	f
8560	Battle-Scarred	0.15	1824	2025-02-20 23:40:05.533458+00	f
8561	Factory New	0.46	1825	2025-02-20 23:40:15.691343+00	f
8562	Minimal Wear	0.22	1825	2025-02-20 23:40:15.699342+00	f
8563	Field-Tested	0.14	1825	2025-02-20 23:40:15.695343+00	f
8564	Well-Worn	0.17	1825	2025-02-20 23:40:15.704343+00	f
8565	Battle-Scarred	0.17	1825	2025-02-20 23:40:15.687343+00	f
8566	Factory New	0.3	1826	2025-02-20 23:40:21.566648+00	f
8567	Minimal Wear	0.17	1826	2025-02-20 23:40:21.574648+00	f
8568	Field-Tested	0.13	1826	2025-02-20 23:40:21.570649+00	f
8569	Well-Worn	0.11	1826	2025-02-20 23:40:21.580649+00	f
8570	Battle-Scarred	0.1	1826	2025-02-20 23:40:21.561654+00	f
8571	Factory New	0.27	1827	2025-02-20 23:40:25.291315+00	f
8572	Minimal Wear	0.17	1827	2025-02-20 23:40:25.300309+00	f
8573	Field-Tested	0.13	1827	2025-02-20 23:40:25.29631+00	f
8574	Well-Worn	0.1	1827	2025-02-20 23:40:25.30431+00	f
8575	Battle-Scarred	0.11	1827	2025-02-20 23:40:25.286753+00	f
8576	Factory New	0.27	1828	2025-02-20 23:40:09.548737+00	f
8577	Minimal Wear	0.19	1828	2025-02-20 23:40:09.567739+00	f
8578	Field-Tested	0.13	1828	2025-02-20 23:40:09.555738+00	f
8579	Well-Worn	0.12	1828	2025-02-20 23:40:09.575738+00	f
8580	Battle-Scarred	0.12	1828	2025-02-20 23:40:09.540736+00	f
8581	Field-Tested	0.13	1829	2025-02-20 23:40:18.70183+00	f
8582	Well-Worn	0.12	1829	2025-02-20 23:40:18.70683+00	f
8583	Battle-Scarred	0.1	1829	2025-02-20 23:40:18.69783+00	f
8584	Factory New	486.03	1830	2025-02-20 23:40:15.210552+00	f
8585	Minimal Wear	503.9	1830	2025-02-20 23:40:15.215553+00	f
8586	Factory New	91.08	1831	2025-02-20 23:40:12.231755+00	f
8587	Minimal Wear	57.71	1831	2025-02-20 23:40:12.239755+00	f
8588	Field-Tested	50	1831	2025-02-20 23:40:12.235755+00	f
8589	Well-Worn	62.11	1831	2025-02-20 23:40:12.242753+00	f
8590	Battle-Scarred	55.69	1831	2025-02-20 23:40:12.225755+00	f
8591	Factory New	77.2	1832	2025-02-20 23:40:11.845843+00	f
8592	Minimal Wear	55.68	1832	2025-02-20 23:40:11.87458+00	f
8593	Field-Tested	48.62	1832	2025-02-20 23:40:11.862307+00	f
8594	Well-Worn	50.32	1832	2025-02-20 23:40:11.88326+00	f
8595	Battle-Scarred	48.55	1832	2025-02-20 23:40:11.834841+00	f
8596	Factory New	13.14	1833	2025-02-20 23:40:19.646693+00	f
8597	Minimal Wear	7.78	1833	2025-02-20 23:40:19.654694+00	f
8598	Field-Tested	5.35	1833	2025-02-20 23:40:19.651692+00	f
8599	Well-Worn	5.82	1833	2025-02-20 23:40:19.658693+00	f
8600	Battle-Scarred	5.05	1833	2025-02-20 23:40:19.641693+00	f
8601	Factory New	11.04	1834	2025-02-20 23:40:09.415107+00	f
8602	Minimal Wear	6.83	1834	2025-02-20 23:40:09.423106+00	f
8603	Field-Tested	5.19	1834	2025-02-20 23:40:09.419106+00	f
8604	Well-Worn	4.97	1834	2025-02-20 23:40:09.428041+00	f
8605	Battle-Scarred	5.05	1834	2025-02-20 23:40:09.409106+00	f
8606	Factory New	9.89	1835	2025-02-20 23:40:51.507621+00	f
8607	Minimal Wear	7.12	1835	2025-02-20 23:40:51.517622+00	f
8608	Field-Tested	5.34	1835	2025-02-20 23:40:51.511622+00	f
8609	Well-Worn	6.09	1835	2025-02-20 23:40:51.521621+00	f
8610	Battle-Scarred	5.36	1835	2025-02-20 23:40:51.502622+00	f
8611	Factory New	4.52	1836	2025-02-20 23:40:52.458602+00	f
8612	Minimal Wear	2.96	1836	2025-02-20 23:40:52.470603+00	f
8613	Field-Tested	2.13	1836	2025-02-20 23:40:52.464604+00	f
8614	Well-Worn	2.94	1836	2025-02-20 23:40:52.474602+00	f
8615	Battle-Scarred	2.7	1836	2025-02-20 23:40:52.454611+00	f
8616	Factory New	2.14	1837	2025-02-20 23:40:29.923342+00	f
8617	Minimal Wear	1.14	1837	2025-02-20 23:40:29.932517+00	f
8618	Field-Tested	0.71	1837	2025-02-20 23:40:29.928343+00	f
8619	Well-Worn	0.9	1837	2025-02-20 23:40:29.937519+00	f
8620	Battle-Scarred	0.66	1837	2025-02-20 23:40:29.919183+00	f
8621	Factory New	2.43	1838	2025-02-20 23:40:22.417558+00	f
8622	Minimal Wear	1.07	1838	2025-02-20 23:40:22.425791+00	f
8623	Field-Tested	0.72	1838	2025-02-20 23:40:22.421245+00	f
8624	Well-Worn	0.65	1838	2025-02-20 23:40:22.431791+00	f
8625	Battle-Scarred	0.65	1838	2025-02-20 23:40:22.413357+00	f
8626	Factory New	1.64	1839	2025-02-20 23:40:24.100939+00	f
8627	Minimal Wear	1.07	1839	2025-02-20 23:40:24.10894+00	f
8628	Field-Tested	0.71	1839	2025-02-20 23:40:24.10494+00	f
8629	Well-Worn	0.7	1839	2025-02-20 23:40:24.11394+00	f
8630	Battle-Scarred	0.67	1839	2025-02-20 23:40:24.096939+00	f
8631	Factory New	0.73	1840	2025-02-20 23:40:00.790669+00	f
8632	Minimal Wear	0.41	1840	2025-02-20 23:40:00.852716+00	f
8633	Field-Tested	0.28	1840	2025-02-20 23:40:00.828164+00	f
8634	Well-Worn	0.37	1840	2025-02-20 23:40:00.870074+00	f
8635	Battle-Scarred	0.35	1840	2025-02-20 23:40:00.773934+00	f
8636	Factory New	0.53	1841	2025-02-20 23:40:07.711333+00	f
8637	Minimal Wear	0.19	1841	2025-02-20 23:40:07.720329+00	f
8638	Field-Tested	0.17	1841	2025-02-20 23:40:07.715329+00	f
8639	Well-Worn	0.13	1841	2025-02-20 23:40:07.72533+00	f
8640	Battle-Scarred	0.15	1841	2025-02-20 23:40:07.70633+00	f
8641	Factory New	0.3	1842	2025-02-20 23:40:50.501313+00	f
8642	Minimal Wear	0.21	1842	2025-02-20 23:40:50.525903+00	f
8643	Field-Tested	0.16	1842	2025-02-20 23:40:50.519391+00	f
8644	Well-Worn	0.16	1842	2025-02-20 23:40:50.544729+00	f
8645	Battle-Scarred	0.16	1842	2025-02-20 23:40:50.481943+00	f
8646	Factory New	0.29	1843	2025-02-20 23:40:18.394819+00	f
8647	Minimal Wear	0.19	1843	2025-02-20 23:40:18.403818+00	f
8648	Field-Tested	0.16	1843	2025-02-20 23:40:18.399817+00	f
8649	Well-Worn	0.17	1843	2025-02-20 23:40:18.407817+00	f
8650	Battle-Scarred	0.15	1843	2025-02-20 23:40:18.389818+00	f
8651	Factory New	0.3	1844	2025-02-20 23:40:25.489184+00	f
8652	Minimal Wear	0.2	1844	2025-02-20 23:40:25.498031+00	f
8653	Field-Tested	0.18	1844	2025-02-20 23:40:25.492184+00	f
8654	Well-Worn	0.21	1844	2025-02-20 23:40:25.503031+00	f
8655	Field-Tested	0.16	1845	2025-02-20 23:40:18.790704+00	f
8656	Well-Worn	0.15	1845	2025-02-20 23:40:18.795705+00	f
8657	Battle-Scarred	0.13	1845	2025-02-20 23:40:18.787706+00	f
\.



--
-- Name: skin_conditions idx_16558_skin_conditions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.skin_conditions
    ADD CONSTRAINT idx_16558_skin_conditions_pkey PRIMARY KEY (id);


--
-- Name: skins idx_16564_skins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.skins
    ADD CONSTRAINT idx_16564_skins_pkey PRIMARY KEY (id);


--
-- Name: collections idx_16571_collections_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.collections
    ADD CONSTRAINT idx_16571_collections_pkey PRIMARY KEY (id);


--
-- Name: idx_16571_sqlite_autoindex_collections_1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_16571_sqlite_autoindex_collections_1 ON public.collections USING btree (name);


--
-- Name: skin_conditions skin_conditions_skin_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.skin_conditions
    ADD CONSTRAINT skin_conditions_skin_id_fkey FOREIGN KEY (skin_id) REFERENCES public.skins(id);


--
-- Name: skins skins_collection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.skins
    ADD CONSTRAINT skins_collection_id_fkey FOREIGN KEY (collection_id) REFERENCES public.collections(id);


--
-- PostgreSQL database dump complete
--

