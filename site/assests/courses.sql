--
-- PostgreSQL database dump
--

\restrict ffcAexnKUzGsB4yTbWpfB9qQtRsiOtlSh7IvyhPUnt2tDO6kTeJtRxdFYdYbEDU

-- Dumped from database version 18.1 (Debian 18.1-1.pgdg13+2)
-- Dumped by pg_dump version 18.3 (Ubuntu 18.3-1.pgdg24.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', 'public', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

-- DROP DATABASE IF EXISTS obe;

--
-- Name: obe; Type: DATABASE; Schema: -; Owner: -
--

-- CREATE DATABASE obe WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


\unrestrict ffcAexnKUzGsB4yTbWpfB9qQtRsiOtlSh7IvyhPUnt2tDO6kTeJtRxdFYdYbEDU
-- \connect obe
\restrict ffcAexnKUzGsB4yTbWpfB9qQtRsiOtlSh7IvyhPUnt2tDO6kTeJtRxdFYdYbEDU

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', 'public', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: courses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.courses (
    cid bigint,
    code text,
    title text,
    theory integer,
    lab integer
);


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.courses VALUES
	(1, 'ME2407-T', 'Actuating Systems', 3, 0),
	(2, 'ME2407-L', 'Actuating Systems', 0, 1),
	(3, 'ME5101', 'Advanced Embedded Systems', 3, 0),
	(4, 'ME5321', 'Advanced Manufacturing Design Techniques', 3, 0),
	(5, 'ME5227', 'Advanced Modeling and Simulation', 3, 0),
	(6, 'ME5102', 'Advanced Robotics', 3, 0),
	(7, 'ME5327', 'Artificial Intelligence', 3, 0),
	(8, 'ME4721', 'Artificial Intelligence and Computer Vision', 3, 0),
	(9, 'ASA1101', 'Calculus and Analytical Geometry', 3, 0),
	(10, 'ME1120', 'Chemistry Fundamentals', 1, 0),
	(11, 'ASA1102-L', 'Circuit Analysis', 0, 1),
	(12, 'ASA1102-T', 'Circuit Analysis', 2, 0),
	(13, 'ME1112', 'Communication and Presentation Skills', 3, 0),
	(14, 'ME1101', 'Communication and Presentation Skills', 2, 0),
	(15, 'ASA1103', 'Communication and Presentation Skills', 3, 0),
	(16, 'ME2310', 'Community Service', 1, 1),
	(17, 'ASA1104', 'Computer Aided Design', 1, 1),
	(18, 'ME5322', 'Computer Integrated Manufacturing', 3, 0),
	(19, 'ME1209', 'Computer Programming', 0, 2),
	(20, 'ME3602-T', 'Control Systems', 3, 0),
	(21, 'ME3602-L', 'Control Systems', 0, 1),
	(22, 'ME5201', 'Data Acquisition and Control', 3, 0),
	(23, 'ME2312', 'Data Structures and Object Oriented Programming', 0, 2),
	(24, 'ME4821', 'Digital Image Processing', 3, 0),
	(25, 'ME2302-T', 'Digital Logic Design', 2, 0),
	(26, 'ME2302-L', 'Digital Logic Design', 0, 1),
	(27, 'ME4722', 'Digital Signal Processing', 3, 0),
	(28, 'ME1111-T', 'Electric Circuits', 2, 0),
	(29, 'ME1111-L', 'Electric Circuits', 0, 1),
	(30, 'ME2402-L', 'Electro-Mechanical Systems', 0, 1),
	(31, 'ME1201-L', 'Electronic Devices and Circuits', 0, 1),
	(32, 'ME1201-T', 'Electronic Devices and Circuits', 3, 0),
	(33, 'ME2401-T', 'Electronics Circuit Design', 3, 0),
	(34, 'ME2401-L', 'Electronics Circuit Design', 0, 1),
	(35, 'ME1109', 'Engineering Drawing-I', 0, 2),
	(36, 'ME2309', 'Engineering Drawing-II', 0, 1),
	(37, 'ME2303', 'Engineering Dynamics', 3, 0),
	(38, 'ME4702', 'Engineering Economics and Project Management', 3, 0),
	(39, 'ME4823', 'Engineering Management', 3, 0),
	(40, 'ME1104', 'Engineering Mathematics-I: Calculus and Analytical Geometry', 3, 0),
	(41, 'ME2304', 'Engineering Mathematics-III: 3D Geometry and Vector Calculus', 3, 0),
	(42, 'ME1202', 'Engineering Mathematics-II: Linear Algebra and Ordinary Differential Equations (ODEs)', 3, 0),
	(43, 'ME2403', 'Engineering Mathematics-IV: Transformation Techniques', 3, 0),
	(44, 'ME3603', 'Engineering Mathematics-VI: Probability and Statistics', 3, 0),
	(45, 'ME3501', 'Engineering Mathematics-V: Numerical Methods', 3, 0),
	(46, 'ME1203-L', 'Engineering Physics', 0, 1),
	(47, 'ME1203-T', 'Engineering Physics', 2, 0),
	(48, 'ME1204', 'Engineering Statics', 3, 0),
	(49, 'ME1207', 'Engineering Workshop', 0, 2),
	(50, 'ME4724', 'Entrepreneurship', 3, 0),
	(51, 'ME4709', 'Final Design Project-I', 3, 0),
	(52, 'ME4809', 'Final Design Project-II', 3, 0),
	(53, 'ME4711', 'Finite Element Analysis', 0, 1),
	(54, 'ME3502-L', 'Fluid Mechanics', 0, 1),
	(55, 'ME3502-T', 'Fluid Mechanics', 3, 0),
	(56, 'ME2351', 'Foreign Languages', 2, 0),
	(57, 'ASA1115', 'Fundamentals of Engineering Mathematics', 1, 0),
	(58, 'ME1121', 'Fundamentals of Engineering Mathematics', 1, 0),
	(59, 'ME2308-T', 'Fundamentals of Thermal Sciences', 3, 0),
	(60, 'ME2308-L', 'Fundamentals of Thermal Sciences', 0, 1),
	(61, 'ME4703-L', 'Heat Transfer', 0, 1),
	(62, 'ME4703-T', 'Heat Transfer', 2, 0),
	(63, 'ME1116', 'Humanities', 2, 0),
	(64, 'ASA1108', 'Humanities', 2, 0),
	(65, 'ASA1105', 'ICT and Programming Fundamentals', 1, 1),
	(66, 'ME1211', 'Ideology and Constitution of Pakistan', 2, 0),
	(67, 'ME5202', 'Image Processing for Intelligent Systems', 3, 0),
	(68, 'ME4801-L', 'Industrial Automation', 0, 1),
	(69, 'ME4801-T', 'Industrial Automation', 2, 0),
	(70, 'ME5323', 'Industrial Control Technology', 3, 0),
	(71, 'ME3508-T', 'Instrumentation and Measurements', 3, 0),
	(72, 'ME3508-L', 'Instrumentation and Measurements', 0, 1),
	(73, 'ASA1106-T', 'Introduction to Autonomous Systems', 2, 0),
	(74, 'ASA1106-L', 'Introduction to Autonomous Systems', 0, 1),
	(75, 'ASA1107', 'Islamic Studies', 2, 0),
	(76, 'ME1106', 'Islamic Studies', 2, 0),
	(77, 'ME4725', 'Leadership and Motivation Techniques', 3, 0),
	(78, 'ME5228', 'Linear Control Systems', 3, 0),
	(79, 'ME3604', 'Machine Design', 3, 0),
	(80, 'ME4834', 'Machine Learning', 3, 0),
	(81, 'ME5324', 'Machine Vision', 3, 0),
	(82, 'ME4807-T', 'Manufacturing Automation', 2, 0),
	(83, 'ME4807-L', 'Manufacturing Automation', 0, 1),
	(84, 'ME3506', 'Materials and Manufacturing Processes', 3, 0),
	(85, 'ME1208', 'Materials and Manufacturing Processes', 2, 0),
	(86, 'ME4705-T', 'Mechatronics System Design', 3, 0),
	(87, 'ME4705-L', 'Mechatronics System Design', 0, 1),
	(88, 'ME3503-L', 'Microcontroller Based Systems', 0, 1),
	(89, 'ME3503-T', 'Microcontroller Based Systems', 2, 0),
	(90, 'ME3509-L', 'Microprocessor and Microcontroller Based Systems', 0, 1),
	(91, 'ME3509-T', 'Microprocessor and Microcontroller Based Systems', 2, 0),
	(92, 'ME4828', 'Modeling and Simulation', 3, 0),
	(93, 'ME2311', 'Network Analysis', 2, 0),
	(94, 'ME2306', 'Pakistan Studies', 2, 0),
	(95, 'ME5231', 'Pattern Recognition and Analysis', 3, 0),
	(96, 'ME3605-T', 'Power Electronics', 3, 0),
	(97, 'ME3605-L', 'Power Electronics', 0, 1),
	(98, 'ME4706', 'Professional Practices', 2, 0),
	(99, 'ME2353', 'Psychology', 2, 0),
	(100, 'ME5105', 'Research Methodology', 3, 0),
	(101, 'ME4802-T', 'Robotics', 3, 0),
	(102, 'ME4802-L', 'Robotics', 0, 1),
	(103, 'ME5332', 'Sensor and Sensing Technology', 3, 0),
	(104, 'ME3504-L', 'Sensors, Actuators and Instrumentation', 0, 1),
	(105, 'ME3504-T', 'Sensors, Actuators and Instrumentation', 3, 0),
	(106, 'ME4734', 'Sensors and Sensing Technologies', 3, 0),
	(107, 'ME2408', 'Signals and Systems', 2, 0),
	(108, 'ME3607', 'Solid Modeling', 0, 1),
	(109, 'ME2406-L', 'Strength of Materials', 0, 1),
	(110, 'ME2409-T', 'Strength of Materials', 2, 0),
	(111, 'ME2409-L', 'Strength of Materials', 0, 1),
	(112, 'ME4731', 'Supply Chain Management', 3, 0),
	(113, 'ME1110', 'Teachings of Holy Quran', NULL, NULL),
	(114, 'ME1205', 'Technical Writing Skills', 2, 0),
	(115, 'ME3608', 'Technopreneurship', 2, 0),
	(116, 'ME3507-T', 'Theory of Machines', 2, 0),
	(117, 'ME3507-L', 'Theory of Machines', 0, 1),
	(118, 'ME2405-L', 'Thermodynamics', 0, 1),
	(119, 'ME2405-T', 'Thermodynamics', 2, 0);


--
-- PostgreSQL database dump complete
--

\unrestrict ffcAexnKUzGsB4yTbWpfB9qQtRsiOtlSh7IvyhPUnt2tDO6kTeJtRxdFYdYbEDU

