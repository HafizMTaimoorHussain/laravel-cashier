-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2021 at 02:27 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cashier`
--

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

CREATE TABLE `banks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `organization_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banks`
--

INSERT INTO `banks` (`id`, `name`, `organization_id`, `created_at`, `updated_at`) VALUES
(1, 'AL-Habib', 1, '2021-10-21 16:23:02', '2021-10-21 16:23:02');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phoneCode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `code`, `phoneCode`, `created_at`, `updated_at`) VALUES
(1, 'Pakistan', 'PK', '92', NULL, NULL),
(2, 'Albania', 'AL', '355', NULL, NULL),
(3, 'Algeria', 'DZ', '213', NULL, NULL),
(4, 'American Samoa', 'AS', '1684', NULL, NULL),
(5, 'Andorra', 'AD', '376', NULL, NULL),
(6, 'Angola', 'AO', '244', NULL, NULL),
(7, 'Anguilla', 'AI', '1264', NULL, NULL),
(8, 'Antarctica', 'AQ', '0', NULL, NULL),
(9, 'Antigua And Barbuda', 'AG', '1268', NULL, NULL),
(10, 'Argentina', 'AR', '54', NULL, NULL),
(11, 'Armenia', 'AM', '374', NULL, NULL),
(12, 'Aruba', 'AW', '297', NULL, NULL),
(13, 'Australia', 'AU', '61', NULL, NULL),
(14, 'Austria', 'AT', '43', NULL, NULL),
(15, 'Azerbaijan', 'AZ', '994', NULL, NULL),
(16, 'Bahamas The', 'BS', '1242', NULL, NULL),
(17, 'Bahrain', 'BH', '973', NULL, NULL),
(18, 'Bangladesh', 'BD', '880', NULL, NULL),
(19, 'Barbados', 'BB', '1246', NULL, NULL),
(20, 'Belarus', 'BY', '375', NULL, NULL),
(21, 'Belgium', 'BE', '32', NULL, NULL),
(22, 'Belize', 'BZ', '501', NULL, NULL),
(23, 'Benin', 'BJ', '229', NULL, NULL),
(24, 'Bermuda', 'BM', '1441', NULL, NULL),
(25, 'Bhutan', 'BT', '975', NULL, NULL),
(26, 'Bolivia', 'BO', '591', NULL, NULL),
(27, 'Bosnia and Herzegovina', 'BA', '387', NULL, NULL),
(28, 'Botswana', 'BW', '267', NULL, NULL),
(29, 'Bouvet Island', 'BV', '0', NULL, NULL),
(30, 'Brazil', 'BR', '55', NULL, NULL),
(31, 'British Indian Ocean Territory', 'IO', '246', NULL, NULL),
(32, 'Brunei', 'BN', '673', NULL, NULL),
(33, 'Bulgaria', 'BG', '359', NULL, NULL),
(34, 'Burkina Faso', 'BF', '226', NULL, NULL),
(35, 'Burundi', 'BI', '257', NULL, NULL),
(36, 'Cambodia', 'KH', '855', NULL, NULL),
(37, 'Cameroon', 'CM', '237', NULL, NULL),
(38, 'Canada', 'CA', '1', NULL, NULL),
(39, 'Cape Verde', 'CV', '238', NULL, NULL),
(40, 'Cayman Islands', 'KY', '1345', NULL, NULL),
(41, 'Central African Republic', 'CF', '236', NULL, NULL),
(42, 'Chad', 'TD', '235', NULL, NULL),
(43, 'Chile', 'CL', '56', NULL, NULL),
(44, 'China', 'CN', '86', NULL, NULL),
(45, 'Christmas Island', 'CX', '61', NULL, NULL),
(46, 'Cocos (Keeling) Islands', 'CC', '672', NULL, NULL),
(47, 'Colombia', 'CO', '57', NULL, NULL),
(48, 'Comoros', 'KM', '269', NULL, NULL),
(49, 'Congo', 'CG', '242', NULL, NULL),
(50, 'Congo The Democratic Republic Of The', 'CD', '242', NULL, NULL),
(51, 'Cook Islands', 'CK', '682', NULL, NULL),
(52, 'Costa Rica', 'CR', '506', NULL, NULL),
(53, 'Cote D Ivoire (Ivory Coast)', 'CI', '225', NULL, NULL),
(54, 'Croatia (Hrvatska)', 'HR', '385', NULL, NULL),
(55, 'Cuba', 'CU', '53', NULL, NULL),
(56, 'Cyprus', 'CY', '357', NULL, NULL),
(57, 'Czech Republic', 'CZ', '420', NULL, NULL),
(58, 'Denmark', 'DK', '45', NULL, NULL),
(59, 'Djibouti', 'DJ', '253', NULL, NULL),
(60, 'Dominica', 'DM', '1767', NULL, NULL),
(61, 'Dominican Republic', 'DO', '1809', NULL, NULL),
(62, 'East Timor', 'TP', '670', NULL, NULL),
(63, 'Ecuador', 'EC', '593', NULL, NULL),
(64, 'Egypt', 'EG', '20', NULL, NULL),
(65, 'El Salvador', 'SV', '503', NULL, NULL),
(66, 'Equatorial Guinea', 'GQ', '240', NULL, NULL),
(67, 'Eritrea', 'ER', '291', NULL, NULL),
(68, 'Estonia', 'EE', '372', NULL, NULL),
(69, 'Ethiopia', 'ET', '251', NULL, NULL),
(70, 'External Territories of Australia', 'XA', '61', NULL, NULL),
(71, 'Falkland Islands', 'FK', '500', NULL, NULL),
(72, 'Faroe Islands', 'FO', '298', NULL, NULL),
(73, 'Fiji Islands', 'FJ', '679', NULL, NULL),
(74, 'Finland', 'FI', '358', NULL, NULL),
(75, 'France', 'FR', '33', NULL, NULL),
(76, 'French Guiana', 'GF', '594', NULL, NULL),
(77, 'French Polynesia', 'PF', '689', NULL, NULL),
(78, 'French Southern Territories', 'TF', '0', NULL, NULL),
(79, 'Gabon', 'GA', '241', NULL, NULL),
(80, 'Gambia The', 'GM', '220', NULL, NULL),
(81, 'Georgia', 'GE', '995', NULL, NULL),
(82, 'Germany', 'DE', '49', NULL, NULL),
(83, 'Ghana', 'GH', '233', NULL, NULL),
(84, 'Gibraltar', 'GI', '350', NULL, NULL),
(85, 'Greece', 'GR', '30', NULL, NULL),
(86, 'Greenland', 'GL', '299', NULL, NULL),
(87, 'Grenada', 'GD', '1473', NULL, NULL),
(88, 'Guadeloupe', 'GP', '590', NULL, NULL),
(89, 'Guam', 'GU', '1671', NULL, NULL),
(90, 'Guatemala', 'GT', '502', NULL, NULL),
(91, 'Guernsey and Alderney', 'XU', '44', NULL, NULL),
(92, 'Guinea', 'GN', '224', NULL, NULL),
(93, 'Guinea-Bissau', 'GW', '245', NULL, NULL),
(94, 'Guyana', 'GY', '592', NULL, NULL),
(95, 'Haiti', 'HT', '509', NULL, NULL),
(96, 'Heard and McDonald Islands', 'HM', '0', NULL, NULL),
(97, 'Honduras', 'HN', '504', NULL, NULL),
(98, 'Hong Kong S.A.R.', 'HK', '852', NULL, NULL),
(99, 'Hungary', 'HU', '36', NULL, NULL),
(100, 'Iceland', 'IS', '354', NULL, NULL),
(101, 'India', 'IN', '91', NULL, NULL),
(102, 'Indonesia', 'id', '62', NULL, NULL),
(103, 'Iran', 'IR', '98', NULL, NULL),
(104, 'Iraq', 'IQ', '964', NULL, NULL),
(105, 'Ireland', 'IE', '353', NULL, NULL),
(106, 'Israel', 'IL', '972', NULL, NULL),
(107, 'Italy', 'IT', '39', NULL, NULL),
(108, 'Jamaica', 'JM', '1876', NULL, NULL),
(109, 'Japan', 'JP', '81', NULL, NULL),
(110, 'Jersey', 'XJ', '44', NULL, NULL),
(111, 'Jordan', 'JO', '962', NULL, NULL),
(112, 'Kazakhstan', 'KZ', '7', NULL, NULL),
(113, 'Kenya', 'KE', '254', NULL, NULL),
(114, 'Kiribati', 'KI', '686', NULL, NULL),
(115, 'Korea North', 'KP', '850', NULL, NULL),
(116, 'Korea South', 'KR', '82', NULL, NULL),
(117, 'Kuwait', 'KW', '965', NULL, NULL),
(118, 'Kyrgyzstan', 'KG', '996', NULL, NULL),
(119, 'Laos', 'LA', '856', NULL, NULL),
(120, 'Latvia', 'LV', '371', NULL, NULL),
(121, 'Lebanon', 'LB', '961', NULL, NULL),
(122, 'Lesotho', 'LS', '266', NULL, NULL),
(123, 'Liberia', 'LR', '231', NULL, NULL),
(124, 'Libya', 'LY', '218', NULL, NULL),
(125, 'Liechtenstein', 'LI', '423', NULL, NULL),
(126, 'Lithuania', 'LT', '370', NULL, NULL),
(127, 'Luxembourg', 'LU', '352', NULL, NULL),
(128, 'Macau S.A.R.', 'MO', '853', NULL, NULL),
(129, 'Macedonia', 'MK', '389', NULL, NULL),
(130, 'Madagascar', 'MG', '261', NULL, NULL),
(131, 'Malawi', 'MW', '265', NULL, NULL),
(132, 'Malaysia', 'MY', '60', NULL, NULL),
(133, 'Maldives', 'MV', '960', NULL, NULL),
(134, 'Mali', 'ML', '223', NULL, NULL),
(135, 'Malta', 'MT', '356', NULL, NULL),
(136, 'Man (Isle of)', 'XM', '44', NULL, NULL),
(137, 'Marshall Islands', 'MH', '692', NULL, NULL),
(138, 'Martinique', 'MQ', '596', NULL, NULL),
(139, 'Mauritania', 'MR', '222', NULL, NULL),
(140, 'Mauritius', 'MU', '230', NULL, NULL),
(141, 'Mayotte', 'YT', '269', NULL, NULL),
(142, 'Mexico', 'MX', '52', NULL, NULL),
(143, 'Micronesia', 'FM', '691', NULL, NULL),
(144, 'Moldova', 'MD', '373', NULL, NULL),
(145, 'Monaco', 'MC', '377', NULL, NULL),
(146, 'Mongolia', 'MN', '976', NULL, NULL),
(147, 'Montserrat', 'MS', '1664', NULL, NULL),
(148, 'Morocco', 'MA', '212', NULL, NULL),
(149, 'Mozambique', 'MZ', '258', NULL, NULL),
(150, 'Myanmar', 'MM', '95', NULL, NULL),
(151, 'Namibia', 'NA', '264', NULL, NULL),
(152, 'Nauru', 'NR', '674', NULL, NULL),
(153, 'Nepal', 'NP', '977', NULL, NULL),
(154, 'Netherlands Antilles', 'AN', '599', NULL, NULL),
(155, 'Netherlands The', 'NL', '31', NULL, NULL),
(156, 'New Caledonia', 'NC', '687', NULL, NULL),
(157, 'New Zealand', 'NZ', '64', NULL, NULL),
(158, 'Nicaragua', 'NI', '505', NULL, NULL),
(159, 'Niger', 'NE', '227', NULL, NULL),
(160, 'Nigeria', 'NG', '234', NULL, NULL),
(161, 'Niue', 'NU', '683', NULL, NULL),
(162, 'Norfolk Island', 'NF', '672', NULL, NULL),
(163, 'Northern Mariana Islands', 'MP', '1670', NULL, NULL),
(164, 'Norway', 'NO', '47', NULL, NULL),
(165, 'Oman', 'OM', '968', NULL, NULL),
(166, 'Pakistan', 'PK', '92', NULL, NULL),
(167, 'Palau', 'PW', '680', NULL, NULL),
(168, 'Palestinian Territory Occupied', 'PS', '970', NULL, NULL),
(169, 'Panama', 'PA', '507', NULL, NULL),
(170, 'Papua new Guinea', 'PG', '675', NULL, NULL),
(171, 'Paraguay', 'PY', '595', NULL, NULL),
(172, 'Peru', 'PE', '51', NULL, NULL),
(173, 'Philippines', 'PH', '63', NULL, NULL),
(174, 'Pitcairn Island', 'PN', '0', NULL, NULL),
(175, 'Poland', 'PL', '48', NULL, NULL),
(176, 'Portugal', 'PT', '351', NULL, NULL),
(177, 'Puerto Rico', 'PR', '1787', NULL, NULL),
(178, 'Qatar', 'QA', '974', NULL, NULL),
(179, 'Reunion', 'RE', '262', NULL, NULL),
(180, 'Romania', 'RO', '40', NULL, NULL),
(181, 'Russia', 'RU', '70', NULL, NULL),
(182, 'Rwanda', 'RW', '250', NULL, NULL),
(183, 'Saint Helena', 'SH', '290', NULL, NULL),
(184, 'Saint Kitts And Nevis', 'KN', '1869', NULL, NULL),
(185, 'Saint Lucia', 'LC', '1758', NULL, NULL),
(186, 'Saint Pierre and Miquelon', 'PM', '508', NULL, NULL),
(187, 'Saint Vincent And The Grenadines', 'VC', '1784', NULL, NULL),
(188, 'Samoa', 'WS', '684', NULL, NULL),
(189, 'San Marino', 'SM', '378', NULL, NULL),
(190, 'Sao Tome and Principe', 'ST', '239', NULL, NULL),
(191, 'Saudi Arabia', 'SA', '966', NULL, NULL),
(192, 'Senegal', 'SN', '221', NULL, NULL),
(193, 'Serbia', 'RS', '381', NULL, NULL),
(194, 'Seychelles', 'SC', '248', NULL, NULL),
(195, 'Sierra Leone', 'SL', '232', NULL, NULL),
(196, 'Singapore', 'SG', '65', NULL, NULL),
(197, 'Slovakia', 'SK', '421', NULL, NULL),
(198, 'Slovenia', 'SI', '386', NULL, NULL),
(199, 'Smaller Territories of the UK', 'XG', '44', NULL, NULL),
(200, 'Solomon Islands', 'SB', '677', NULL, NULL),
(201, 'Somalia', 'SO', '252', NULL, NULL),
(202, 'South Africa', 'ZA', '27', NULL, NULL),
(203, 'South Georgia', 'GS', '0', NULL, NULL),
(204, 'South Sudan', 'SS', '211', NULL, NULL),
(205, 'Spain', 'ES', '34', NULL, NULL),
(206, 'Sri Lanka', 'LK', '94', NULL, NULL),
(207, 'Sudan', 'SD', '249', NULL, NULL),
(208, 'Suriname', 'SR', '597', NULL, NULL),
(209, 'Svalbard And Jan Mayen Islands', 'SJ', '47', NULL, NULL),
(210, 'Swaziland', 'SZ', '268', NULL, NULL),
(211, 'Sweden', 'SE', '46', NULL, NULL),
(212, 'Switzerland', 'CH', '41', NULL, NULL),
(213, 'Syria', 'SY', '963', NULL, NULL),
(214, 'Taiwan', 'TW', '886', NULL, NULL),
(215, 'Tajikistan', 'TJ', '992', NULL, NULL),
(216, 'Tanzania', 'TZ', '255', NULL, NULL),
(217, 'Thailand', 'TH', '66', NULL, NULL),
(218, 'Togo', 'TG', '228', NULL, NULL),
(219, 'Tokelau', 'TK', '690', NULL, NULL),
(220, 'Tonga', 'TO', '676', NULL, NULL),
(221, 'Trinidad And Tobago', 'TT', '1868', NULL, NULL),
(222, 'Tunisia', 'TN', '216', NULL, NULL),
(223, 'Turkey', 'TR', '90', NULL, NULL),
(224, 'Turkmenistan', 'TM', '7370', NULL, NULL),
(225, 'Turks And Caicos Islands', 'TC', '1649', NULL, NULL),
(226, 'Tuvalu', 'TV', '688', NULL, NULL),
(227, 'Uganda', 'UG', '256', NULL, NULL),
(228, 'Ukraine', 'UA', '380', NULL, NULL),
(229, 'United Arab Emirates', 'AE', '971', NULL, NULL),
(230, 'United Kingdom', 'GB', '44', NULL, NULL),
(231, 'United States', 'US', '1', NULL, NULL),
(232, 'United States Minor Outlying Islands', 'UM', '1', NULL, NULL),
(233, 'Uruguay', 'UY', '598', NULL, NULL),
(234, 'Uzbekistan', 'UZ', '998', NULL, NULL),
(235, 'Vanuatu', 'VU', '678', NULL, NULL),
(236, 'Vatican City State (Holy See)', 'VA', '39', NULL, NULL),
(237, 'Venezuela', 'VE', '58', NULL, NULL),
(238, 'Vietnam', 'VN', '84', NULL, NULL),
(239, 'Virgin Islands (British)', 'VG', '1284', NULL, NULL),
(240, 'Virgin Islands (US)', 'VI', '1340', NULL, NULL),
(241, 'Wallis And Futuna Islands', 'WF', '681', NULL, NULL),
(242, 'Western Sahara', 'EH', '212', NULL, NULL),
(243, 'Yemen', 'YE', '967', NULL, NULL),
(244, 'Yugoslavia', 'YU', '38', NULL, NULL),
(245, 'Zambia', 'ZM', '260', NULL, NULL),
(246, 'Zimbabwe', 'ZW', '263', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `code`, `symbol`, `created_at`, `updated_at`) VALUES
(1, 'Afghani', 'AFN', '؋', NULL, NULL),
(2, 'Lek', 'ALL', 'Lek', NULL, NULL),
(3, 'Netherlands Antillian Guilder', 'ANG', 'ƒ', NULL, NULL),
(4, 'Argentine Peso', 'ARS', '$', NULL, NULL),
(5, 'Australian Dollar', 'AUD', '$', NULL, NULL),
(6, 'Aruban Guilder', 'AWG', 'ƒ', NULL, NULL),
(7, 'Azerbaijanian Manat', 'AZN', 'ман', NULL, NULL),
(8, 'Convertible Marks', 'BAM', 'KM', NULL, NULL),
(9, 'Bangladeshi Taka', 'BDT', '৳', NULL, NULL),
(10, 'Barbados Dollar', 'BBD', '$', NULL, NULL),
(11, 'Bulgarian Lev', 'BGN', 'лв', NULL, NULL),
(12, 'Bermudian Dollar', 'BMD', '$', NULL, NULL),
(13, 'Brunei Dollar', 'BND', '$', NULL, NULL),
(14, 'BOV Boliviano Mvdol', 'BOB', '$b', NULL, NULL),
(15, 'Brazilian Real', 'BRL', 'R$', NULL, NULL),
(16, 'Bahamian Dollar', 'BSD', '$', NULL, NULL),
(17, 'Pula', 'BWP', 'P', NULL, NULL),
(18, 'Belarussian Ruble', 'BYR', '₽', NULL, NULL),
(19, 'Belize Dollar', 'BZD', 'BZ$', NULL, NULL),
(20, 'Canadian Dollar', 'CAD', '$', NULL, NULL),
(21, 'Swiss Franc', 'CHF', 'CHF', NULL, NULL),
(22, 'CLF Chilean Peso Unidades de fomento', 'CLP', '$', NULL, NULL),
(23, 'Yuan Renminbi', 'CNY', '¥', NULL, NULL),
(24, 'COU Colombian Peso Unidad de Valor Real', 'COP', '$', NULL, NULL),
(25, 'Costa Rican Colon', 'CRC', '₡', NULL, NULL),
(26, 'CUC Cuban Peso Peso Convertible', 'CUP', '₱', NULL, NULL),
(27, 'Czech Koruna', 'CZK', 'Kč', NULL, NULL),
(28, 'Danish Krone', 'DKK', 'kr', NULL, NULL),
(29, 'Dominican Peso', 'DOP', 'RD$', NULL, NULL),
(30, 'Egyptian Pound', 'EGP', '£', NULL, NULL),
(31, 'Euro', 'EUR', '€', NULL, NULL),
(32, 'Fiji Dollar', 'FJD', '$', NULL, NULL),
(33, 'Falkland Islands Pound', 'FKP', '£', NULL, NULL),
(34, 'Pound Sterling', 'GBP', '£', NULL, NULL),
(35, 'Gibraltar Pound', 'GIP', '£', NULL, NULL),
(36, 'Quetzal', 'GTQ', 'Q', NULL, NULL),
(37, 'Guyana Dollar', 'GYD', '$', NULL, NULL),
(38, 'Hong Kong Dollar', 'HKD', '$', NULL, NULL),
(39, 'Lempira', 'HNL', 'L', NULL, NULL),
(40, 'Croatian Kuna', 'HRK', 'kn', NULL, NULL),
(41, 'Forint', 'HUF', 'Ft', NULL, NULL),
(42, 'Rupiah', 'IDR', 'Rp', NULL, NULL),
(43, 'New Israeli Sheqel', 'ILS', '₪', NULL, NULL),
(44, 'Iranian Rial', 'IRR', '﷼', NULL, NULL),
(45, 'Iceland Krona', 'ISK', 'kr', NULL, NULL),
(46, 'Jamaican Dollar', 'JMD', 'J$', NULL, NULL),
(47, 'Yen', 'JPY', '¥', NULL, NULL),
(48, 'Som', 'KGS', 'лв', NULL, NULL),
(49, 'Riel', 'KHR', '៛', NULL, NULL),
(50, 'North Korean Won', 'KPW', '₩', NULL, NULL),
(51, 'Won', 'KRW', '₩', NULL, NULL),
(52, 'Cayman Islands Dollar', 'KYD', '$', NULL, NULL),
(53, 'Tenge', 'KZT', 'лв', NULL, NULL),
(54, 'Kip', 'LAK', '₭', NULL, NULL),
(55, 'Lebanese Pound', 'LBP', '£', NULL, NULL),
(56, 'Sri Lanka Rupee', 'LKR', '₨', NULL, NULL),
(57, 'Liberian Dollar', 'LRD', '$', NULL, NULL),
(58, 'Lithuanian Litas', 'LTL', 'Lt', NULL, NULL),
(59, 'Latvian Lats', 'LVL', 'Ls', NULL, NULL),
(60, 'Denar', 'MKD', 'ден', NULL, NULL),
(61, 'Tugrik', 'MNT', '₮', NULL, NULL),
(62, 'Mauritius Rupee', 'MUR', '₨', NULL, NULL),
(63, 'MXV Mexican Peso Mexican Unidad de Inversion (UDI]', 'MXN', '$', NULL, NULL),
(64, 'Malaysian Ringgit', 'MYR', 'RM', NULL, NULL),
(65, 'Metical', 'MZN', 'MT', NULL, NULL),
(66, 'Naira', 'NGN', '₦', NULL, NULL),
(67, 'Cordoba Oro', 'NIO', 'C$', NULL, NULL),
(68, 'Norwegian Krone', 'NOK', 'kr', NULL, NULL),
(69, 'Nepalese Rupee', 'NPR', '₨', NULL, NULL),
(70, 'New Zealand Dollar', 'NZD', '$', NULL, NULL),
(71, 'Rial Omani', 'OMR', '﷼', NULL, NULL),
(72, 'USD Balboa US Dollar', 'PAB', 'B/.', NULL, NULL),
(73, 'Nuevo Sol', 'PEN', 'S/.', NULL, NULL),
(74, 'Philippine Peso', 'PHP', 'Php', NULL, NULL),
(75, 'Pakistan Rupee', 'PKR', '₨', NULL, NULL),
(76, 'Zloty', 'PLN', 'zł', NULL, NULL),
(77, 'Guarani', 'PYG', 'Gs', NULL, NULL),
(78, 'Qatari Rial', 'QAR', '﷼', NULL, NULL),
(79, 'New Leu', 'RON', 'lei', NULL, NULL),
(80, 'Serbian Dinar', 'RSD', 'Дин.', NULL, NULL),
(81, 'Russian Ruble', 'RUB', 'руб', NULL, NULL),
(82, 'Saudi Riyal', 'SAR', '﷼', NULL, NULL),
(83, 'Solomon Islands Dollar', 'SBD', '$', NULL, NULL),
(84, 'Seychelles Rupee', 'SCR', '₨', NULL, NULL),
(85, 'Swedish Krona', 'SEK', 'kr', NULL, NULL),
(86, 'Singapore Dollar', 'SGD', '$', NULL, NULL),
(87, 'Saint Helena Pound', 'SHP', '£', NULL, NULL),
(88, 'Somali Shilling', 'SOS', 'S', NULL, NULL),
(89, 'Surinam Dollar', 'SRD', '$', NULL, NULL),
(90, 'USD El Salvador Colon US Dollar', 'SVC', '$', NULL, NULL),
(91, 'Syrian Pound', 'SYP', '£', NULL, NULL),
(92, 'Baht', 'THB', '฿', NULL, NULL),
(93, 'Turkish Lira', 'TRY', 'TL', NULL, NULL),
(94, 'Trinidad and Tobago Dollar', 'TTD', 'TT$', NULL, NULL),
(95, 'New Taiwan Dollar', 'TWD', 'NT$', NULL, NULL),
(96, 'Hryvnia', 'UAH', '₴', NULL, NULL),
(97, 'US Dollar', 'USD', '$', NULL, NULL),
(98, 'UYI Uruguay Peso en Unidades Indexadas', 'UYU', '$U', NULL, NULL),
(99, 'Uzbekistan Sum', 'UZS', 'лв', NULL, NULL),
(100, 'Bolivar Fuerte', 'VEF', 'Bs', NULL, NULL),
(101, 'Dong', 'VND', '₫', NULL, NULL),
(102, 'East Caribbean Dollar', 'XCD', '$', NULL, NULL),
(103, 'Yemeni Rial', 'YER', '﷼', NULL, NULL),
(104, 'Rand', 'ZAR', 'R', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_prefix_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_stripe_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_line_1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_line_2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shopping_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shopping_country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shopping_timezone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shopping_language` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shopping_currency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shopping_tax_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shopping_tax_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `organization_id` int(10) UNSIGNED DEFAULT NULL,
  `bank_id` int(10) UNSIGNED DEFAULT NULL,
  `pm_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_last_four` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `customer_prefix_id`, `customer_stripe_id`, `stripe_id`, `name`, `email`, `description`, `phone_no`, `address_line_1`, `address_line_2`, `postal_code`, `city`, `billing_email`, `billing_country`, `shopping_email`, `shopping_country`, `shopping_timezone`, `shopping_language`, `shopping_currency`, `shopping_tax_status`, `shopping_tax_id`, `organization_id`, `bank_id`, `pm_type`, `pm_last_four`, `created_at`, `updated_at`) VALUES
(1, 'C0001', 'cus_KS3DyjAFpDQsyI', 'cus_KS4tZZBRHMxEBI', 'James', 'rice.kassandra@example.org', 'james anderson', '03121234561', 'nowhere', 'nowhere', '00900', 'mangopeer', 'rice.kassandra@example.org', 'Pakistan', 'rice.kassandra@example.org', 'Pakistan', NULL, NULL, NULL, 'none', NULL, 1, 1, 'visa', '1111', '2021-10-21 16:48:17', '2021-10-21 18:31:45'),
(2, 'C-0002', 'cus_KS3KPD7tGnPenH', 'cus_KS4lHVdn38Qvd3', 'Nicholas', 'nicholas@example.org', 'nicholas@example.org', '03121234511', 'meerpur', 'meerpur', '00902', 'meerpur khaas', 'nicholas@example.org', 'Andorra', 'nicholas@example.org', 'Andorra', NULL, NULL, NULL, 'none', NULL, 1, 1, 'visa', '1111', '2021-10-21 16:54:27', '2021-10-21 18:26:40');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Arabic', NULL, NULL),
(2, 'Brazilian Portuguese', NULL, NULL),
(3, 'Danish', NULL, NULL),
(4, 'Dutch', NULL, NULL),
(5, 'English', NULL, NULL),
(6, 'Finnish', NULL, NULL),
(7, 'French', NULL, NULL),
(8, 'German', NULL, NULL),
(9, 'Hebrew', NULL, NULL),
(10, 'Italian', NULL, NULL),
(11, 'Japanese', NULL, NULL),
(12, 'Latin American Spanish', NULL, NULL),
(13, 'Norwegian', NULL, NULL),
(14, 'Spanish', NULL, NULL),
(15, 'Swedish', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(65, '2014_10_12_000000_create_users_table', 1),
(66, '2014_10_12_100000_create_password_resets_table', 1),
(67, '2019_05_03_000001_create_customer_columns', 1),
(68, '2019_05_03_000002_create_subscriptions_table', 1),
(69, '2019_05_03_000003_create_subscription_items_table', 1),
(70, '2019_08_19_000000_create_failed_jobs_table', 1),
(71, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(72, '2021_09_08_221855_create_plans_table', 1),
(74, '2021_09_10_224230_create_countries_table', 1),
(75, '2021_09_10_224920_create_currencies_table', 1),
(76, '2021_09_10_231716_create_timezones_table', 1),
(77, '2021_09_10_232057_create_languages_table', 1),
(81, '2021_09_10_221507_create_customers_table', 2),
(82, '2021_10_14_033026_create_banks_table', 3),
(83, '2021_10_14_023742_create_organizations_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `organizations`
--

CREATE TABLE `organizations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `organizations`
--

INSERT INTO `organizations` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Fila tophia', '2021-10-21 16:22:31', '2021-10-21 16:22:31');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_plan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL DEFAULT 0.00,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `name`, `slug`, `stripe_plan`, `product_id`, `price`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Glasses', 'glasses', 'plan_KDnqfCQVZqKOyL', 'prod_KDnqRAm4ypXw3U\r\n', 200.00, 'it\'s a universal wearing glasses.', '2021-09-13 15:58:42', '2021-09-13 15:58:42'),
(2, 'Hosting', 'hosting', 'plan_KDpIcG5KgEG71u', 'prod_KDpIv7W6Hc2pw5', 29.00, 'Web blue hosting', '2021-09-13 17:28:27', '2021-09-13 17:28:27'),
(3, 'Web hosting', 'web hosting', 'plan_KG3Femf66b6pJu', 'prod_KG3F8yA3FZzcPX', 2000.00, NULL, '2021-09-19 16:02:18', '2021-09-19 16:02:18'),
(4, 'Blue hosting', 'blue hosting', 'plan_KG3drJQsjJA2vD', 'prod_KG3dyNFKgccEWi', 1500.00, NULL, '2021-09-19 16:25:41', '2021-09-19 16:25:41'),
(5, 'Green host', 'green host', 'plan_KG3er5BcxOJTqO', 'prod_KG3eVJxxxsBMSf', 2500.00, NULL, '2021-09-19 16:26:24', '2021-09-19 16:26:24'),
(6, 'Red host', 'red host', 'plan_KG3hKx6nEc2NeJ', 'prod_KG3h3bqvgzDUVu', 3000.00, NULL, '2021-09-19 16:29:56', '2021-09-19 16:29:56'),
(7, 'Light host', 'light host', 'plan_KG3ie0tmK0TfW5', 'prod_KG3iGx91XAq7pn', 1000.00, NULL, '2021-09-19 16:30:29', '2021-09-19 16:30:29'),
(8, 'Dark host', 'dark host', 'plan_KG3i3YvE7hf39v', 'prod_KG3idHNFuNFQtj', 500.00, NULL, '2021-09-19 16:30:50', '2021-09-19 16:30:50'),
(9, 'Gray host', 'gray host', 'plan_KG3iMHCYF3xjIW', 'prod_KG3iziCz6wt5w6', 800.00, NULL, '2021-09-19 16:31:10', '2021-09-19 16:31:10'),
(10, 'Light gray host', 'light gray host', 'plan_KG3ovlgoy2sq6H', 'prod_KG3oHBdDx60uoV', 1900.00, NULL, '2021-09-19 16:36:48', '2021-09-19 16:36:48'),
(11, 'Pink host', 'pink host', 'plan_KG3r07RsuShqKv', 'prod_KG3rzIzfPiiz2R', 2400.00, NULL, '2021-09-19 16:39:38', '2021-09-19 16:39:38');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stripe_subscription_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recurring` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `next_invoice_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_stripe_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `organization_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sales_rep` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cfid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `stripe_subscription_id`, `product_id`, `product_name`, `stripe_price`, `stripe_status`, `price`, `currency`, `recurring`, `next_invoice_date`, `customer_stripe_id`, `organization_id`, `sales_rep`, `cfid`, `created_by`, `status`, `payment_status`, `created_at`, `updated_at`) VALUES
(1, NULL, 'prod_KG3iziCz6wt5w6', 'Gray host', NULL, 'active', '800', 'ANG', 'Weekly', 'Oct 28, 2021', NULL, 'Blac', 'David', 'D01', 1, 'Offline', '0', '2021-10-21 17:51:40', '2021-10-21 17:51:40');

-- --------------------------------------------------------

--
-- Table structure for table `timezones`
--

CREATE TABLE `timezones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `offset` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `diff_from_gtm` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `timezones`
--

INSERT INTO `timezones` (`id`, `name`, `offset`, `diff_from_gtm`, `created_at`, `updated_at`) VALUES
(1, 'Africa/Abidjan', '+00:00', 'UTC/GMT +00:00', '2021-09-10 18:27:49', '2021-09-10 18:27:49'),
(2, 'Africa/Accra', '+00:00', 'UTC/GMT +00:00', '2021-09-10 18:27:49', '2021-09-10 18:27:49'),
(3, 'Africa/Addis_Ababa', '+03:00', 'UTC/GMT +03:00', '2021-09-10 21:27:49', '2021-09-10 21:27:49'),
(4, 'Africa/Algiers', '+01:00', 'UTC/GMT +01:00', '2021-09-10 19:27:49', '2021-09-10 19:27:49'),
(5, 'Africa/Asmara', '+03:00', 'UTC/GMT +03:00', '2021-09-10 21:27:49', '2021-09-10 21:27:49'),
(6, 'Africa/Bamako', '+00:00', 'UTC/GMT +00:00', '2021-09-10 18:27:49', '2021-09-10 18:27:49'),
(7, 'Africa/Bangui', '+01:00', 'UTC/GMT +01:00', '2021-09-10 19:27:49', '2021-09-10 19:27:49'),
(8, 'Africa/Banjul', '+00:00', 'UTC/GMT +00:00', '2021-09-10 18:27:49', '2021-09-10 18:27:49'),
(9, 'Africa/Bissau', '+00:00', 'UTC/GMT +00:00', '2021-09-10 18:27:49', '2021-09-10 18:27:49'),
(10, 'Africa/Blantyre', '+02:00', 'UTC/GMT +02:00', '2021-09-10 20:27:49', '2021-09-10 20:27:49'),
(11, 'Africa/Brazzaville', '+01:00', 'UTC/GMT +01:00', '2021-09-10 19:27:49', '2021-09-10 19:27:49'),
(12, 'Africa/Bujumbura', '+02:00', 'UTC/GMT +02:00', '2021-09-10 20:27:49', '2021-09-10 20:27:49'),
(13, 'Africa/Cairo', '+02:00', 'UTC/GMT +02:00', '2021-09-10 20:27:50', '2021-09-10 20:27:50'),
(14, 'Africa/Casablanca', '+01:00', 'UTC/GMT +01:00', '2021-09-10 19:27:50', '2021-09-10 19:27:50'),
(15, 'Africa/Ceuta', '+02:00', 'UTC/GMT +02:00', '2021-09-10 20:27:50', '2021-09-10 20:27:50'),
(16, 'Africa/Conakry', '+00:00', 'UTC/GMT +00:00', '2021-09-10 18:27:50', '2021-09-10 18:27:50'),
(17, 'Africa/Dakar', '+00:00', 'UTC/GMT +00:00', '2021-09-10 18:27:50', '2021-09-10 18:27:50'),
(18, 'Africa/Dar_es_Salaam', '+03:00', 'UTC/GMT +03:00', '2021-09-10 21:27:50', '2021-09-10 21:27:50'),
(19, 'Africa/Djibouti', '+03:00', 'UTC/GMT +03:00', '2021-09-10 21:27:50', '2021-09-10 21:27:50'),
(20, 'Africa/Douala', '+01:00', 'UTC/GMT +01:00', '2021-09-10 19:27:50', '2021-09-10 19:27:50'),
(21, 'Africa/El_Aaiun', '+01:00', 'UTC/GMT +01:00', '2021-09-10 19:27:50', '2021-09-10 19:27:50'),
(22, 'Africa/Freetown', '+00:00', 'UTC/GMT +00:00', '2021-09-10 18:27:50', '2021-09-10 18:27:50'),
(23, 'Africa/Gaborone', '+02:00', 'UTC/GMT +02:00', '2021-09-10 20:27:50', '2021-09-10 20:27:50'),
(24, 'Africa/Harare', '+02:00', 'UTC/GMT +02:00', '2021-09-10 20:27:50', '2021-09-10 20:27:50'),
(25, 'Africa/Johannesburg', '+02:00', 'UTC/GMT +02:00', '2021-09-10 20:27:50', '2021-09-10 20:27:50'),
(26, 'Africa/Juba', '+03:00', 'UTC/GMT +03:00', '2021-09-10 21:27:50', '2021-09-10 21:27:50'),
(27, 'Africa/Kampala', '+03:00', 'UTC/GMT +03:00', '2021-09-10 21:27:50', '2021-09-10 21:27:50'),
(28, 'Africa/Khartoum', '+02:00', 'UTC/GMT +02:00', '2021-09-10 20:27:50', '2021-09-10 20:27:50'),
(29, 'Africa/Kigali', '+02:00', 'UTC/GMT +02:00', '2021-09-10 20:27:50', '2021-09-10 20:27:50'),
(30, 'Africa/Kinshasa', '+01:00', 'UTC/GMT +01:00', '2021-09-10 19:27:50', '2021-09-10 19:27:50'),
(31, 'Africa/Lagos', '+01:00', 'UTC/GMT +01:00', '2021-09-10 19:27:51', '2021-09-10 19:27:51'),
(32, 'Africa/Libreville', '+01:00', 'UTC/GMT +01:00', '2021-09-10 19:27:51', '2021-09-10 19:27:51'),
(33, 'Africa/Lome', '+00:00', 'UTC/GMT +00:00', '2021-09-10 18:27:51', '2021-09-10 18:27:51'),
(34, 'Africa/Luanda', '+01:00', 'UTC/GMT +01:00', '2021-09-10 19:27:51', '2021-09-10 19:27:51'),
(35, 'Africa/Lubumbashi', '+02:00', 'UTC/GMT +02:00', '2021-09-10 20:27:51', '2021-09-10 20:27:51'),
(36, 'Africa/Lusaka', '+02:00', 'UTC/GMT +02:00', '2021-09-10 20:27:51', '2021-09-10 20:27:51'),
(37, 'Africa/Malabo', '+01:00', 'UTC/GMT +01:00', '2021-09-10 19:27:51', '2021-09-10 19:27:51'),
(38, 'Africa/Maputo', '+02:00', 'UTC/GMT +02:00', '2021-09-10 20:27:51', '2021-09-10 20:27:51'),
(39, 'Africa/Maseru', '+02:00', 'UTC/GMT +02:00', '2021-09-10 20:27:51', '2021-09-10 20:27:51'),
(40, 'Africa/Mbabane', '+02:00', 'UTC/GMT +02:00', '2021-09-10 20:27:51', '2021-09-10 20:27:51'),
(41, 'Africa/Mogadishu', '+03:00', 'UTC/GMT +03:00', '2021-09-10 21:27:51', '2021-09-10 21:27:51'),
(42, 'Africa/Monrovia', '+00:00', 'UTC/GMT +00:00', '2021-09-10 18:27:51', '2021-09-10 18:27:51'),
(43, 'Africa/Nairobi', '+03:00', 'UTC/GMT +03:00', '2021-09-10 21:27:51', '2021-09-10 21:27:51'),
(44, 'Africa/Ndjamena', '+01:00', 'UTC/GMT +01:00', '2021-09-10 19:27:52', '2021-09-10 19:27:52'),
(45, 'Africa/Niamey', '+01:00', 'UTC/GMT +01:00', '2021-09-10 19:27:52', '2021-09-10 19:27:52'),
(46, 'Africa/Nouakchott', '+00:00', 'UTC/GMT +00:00', '2021-09-10 18:27:52', '2021-09-10 18:27:52'),
(47, 'Africa/Ouagadougou', '+00:00', 'UTC/GMT +00:00', '2021-09-10 18:27:52', '2021-09-10 18:27:52'),
(48, 'Africa/Porto-Novo', '+01:00', 'UTC/GMT +01:00', '2021-09-10 19:27:52', '2021-09-10 19:27:52'),
(49, 'Africa/Sao_Tome', '+00:00', 'UTC/GMT +00:00', '2021-09-10 18:27:52', '2021-09-10 18:27:52'),
(50, 'Africa/Tripoli', '+02:00', 'UTC/GMT +02:00', '2021-09-10 20:27:52', '2021-09-10 20:27:52'),
(51, 'Africa/Tunis', '+01:00', 'UTC/GMT +01:00', '2021-09-10 19:27:52', '2021-09-10 19:27:52'),
(52, 'Africa/Windhoek', '+02:00', 'UTC/GMT +02:00', '2021-09-10 20:27:52', '2021-09-10 20:27:52'),
(53, 'America/Adak', '-09:00', 'UTC/GMT -09:00', '2021-09-10 09:27:52', '2021-09-10 09:27:52'),
(54, 'America/Anchorage', '-08:00', 'UTC/GMT -08:00', '2021-09-10 10:27:52', '2021-09-10 10:27:52'),
(55, 'America/Anguilla', '-04:00', 'UTC/GMT -04:00', '2021-09-10 14:27:52', '2021-09-10 14:27:52'),
(56, 'America/Antigua', '-04:00', 'UTC/GMT -04:00', '2021-09-10 14:27:52', '2021-09-10 14:27:52'),
(57, 'America/Araguaina', '-03:00', 'UTC/GMT -03:00', '2021-09-10 15:27:52', '2021-09-10 15:27:52'),
(58, 'America/Argentina/Buenos_Aires', '-03:00', 'UTC/GMT -03:00', '2021-09-10 15:27:52', '2021-09-10 15:27:52'),
(59, 'America/Argentina/Catamarca', '-03:00', 'UTC/GMT -03:00', '2021-09-10 15:27:52', '2021-09-10 15:27:52'),
(60, 'America/Argentina/Cordoba', '-03:00', 'UTC/GMT -03:00', '2021-09-10 15:27:52', '2021-09-10 15:27:52'),
(61, 'America/Argentina/Jujuy', '-03:00', 'UTC/GMT -03:00', '2021-09-10 15:27:52', '2021-09-10 15:27:52'),
(62, 'America/Argentina/La_Rioja', '-03:00', 'UTC/GMT -03:00', '2021-09-10 15:27:52', '2021-09-10 15:27:52'),
(63, 'America/Argentina/Mendoza', '-03:00', 'UTC/GMT -03:00', '2021-09-10 15:27:53', '2021-09-10 15:27:53'),
(64, 'America/Argentina/Rio_Gallegos', '-03:00', 'UTC/GMT -03:00', '2021-09-10 15:27:53', '2021-09-10 15:27:53'),
(65, 'America/Argentina/Salta', '-03:00', 'UTC/GMT -03:00', '2021-09-10 15:27:53', '2021-09-10 15:27:53'),
(66, 'America/Argentina/San_Juan', '-03:00', 'UTC/GMT -03:00', '2021-09-10 15:27:53', '2021-09-10 15:27:53'),
(67, 'America/Argentina/San_Luis', '-03:00', 'UTC/GMT -03:00', '2021-09-10 15:27:53', '2021-09-10 15:27:53'),
(68, 'America/Argentina/Tucuman', '-03:00', 'UTC/GMT -03:00', '2021-09-10 15:27:53', '2021-09-10 15:27:53'),
(69, 'America/Argentina/Ushuaia', '-03:00', 'UTC/GMT -03:00', '2021-09-10 15:27:53', '2021-09-10 15:27:53'),
(70, 'America/Aruba', '-04:00', 'UTC/GMT -04:00', '2021-09-10 14:27:53', '2021-09-10 14:27:53'),
(71, 'America/Asuncion', '-04:00', 'UTC/GMT -04:00', '2021-09-10 14:27:53', '2021-09-10 14:27:53'),
(72, 'America/Atikokan', '-05:00', 'UTC/GMT -05:00', '2021-09-10 13:27:53', '2021-09-10 13:27:53'),
(73, 'America/Bahia', '-03:00', 'UTC/GMT -03:00', '2021-09-10 15:27:53', '2021-09-10 15:27:53'),
(74, 'America/Bahia_Banderas', '-05:00', 'UTC/GMT -05:00', '2021-09-10 13:27:53', '2021-09-10 13:27:53'),
(75, 'America/Barbados', '-04:00', 'UTC/GMT -04:00', '2021-09-10 14:27:53', '2021-09-10 14:27:53'),
(76, 'America/Belem', '-03:00', 'UTC/GMT -03:00', '2021-09-10 15:27:53', '2021-09-10 15:27:53'),
(77, 'America/Belize', '-06:00', 'UTC/GMT -06:00', '2021-09-10 12:27:53', '2021-09-10 12:27:53'),
(78, 'America/Blanc-Sablon', '-04:00', 'UTC/GMT -04:00', '2021-09-10 14:27:53', '2021-09-10 14:27:53'),
(79, 'America/Boa_Vista', '-04:00', 'UTC/GMT -04:00', '2021-09-10 14:27:54', '2021-09-10 14:27:54'),
(80, 'America/Bogota', '-05:00', 'UTC/GMT -05:00', '2021-09-10 13:27:54', '2021-09-10 13:27:54'),
(81, 'America/Boise', '-06:00', 'UTC/GMT -06:00', '2021-09-10 12:27:54', '2021-09-10 12:27:54'),
(82, 'America/Cambridge_Bay', '-06:00', 'UTC/GMT -06:00', '2021-09-10 12:27:54', '2021-09-10 12:27:54'),
(83, 'America/Campo_Grande', '-04:00', 'UTC/GMT -04:00', '2021-09-10 14:27:54', '2021-09-10 14:27:54'),
(84, 'America/Cancun', '-05:00', 'UTC/GMT -05:00', '2021-09-10 13:27:54', '2021-09-10 13:27:54'),
(85, 'America/Caracas', '-04:00', 'UTC/GMT -04:00', '2021-09-10 14:27:54', '2021-09-10 14:27:54'),
(86, 'America/Cayenne', '-03:00', 'UTC/GMT -03:00', '2021-09-10 15:27:54', '2021-09-10 15:27:54'),
(87, 'America/Cayman', '-05:00', 'UTC/GMT -05:00', '2021-09-10 13:27:54', '2021-09-10 13:27:54'),
(88, 'America/Chicago', '-05:00', 'UTC/GMT -05:00', '2021-09-10 13:27:54', '2021-09-10 13:27:54'),
(89, 'America/Chihuahua', '-06:00', 'UTC/GMT -06:00', '2021-09-10 12:27:54', '2021-09-10 12:27:54'),
(90, 'America/Costa_Rica', '-06:00', 'UTC/GMT -06:00', '2021-09-10 12:27:54', '2021-09-10 12:27:54'),
(91, 'America/Creston', '-07:00', 'UTC/GMT -07:00', '2021-09-10 11:27:54', '2021-09-10 11:27:54'),
(92, 'America/Cuiaba', '-04:00', 'UTC/GMT -04:00', '2021-09-10 14:27:54', '2021-09-10 14:27:54'),
(93, 'America/Curacao', '-04:00', 'UTC/GMT -04:00', '2021-09-10 14:27:54', '2021-09-10 14:27:54'),
(94, 'America/Danmarkshavn', '+00:00', 'UTC/GMT +00:00', '2021-09-10 18:27:54', '2021-09-10 18:27:54'),
(95, 'America/Dawson', '-07:00', 'UTC/GMT -07:00', '2021-09-10 11:27:54', '2021-09-10 11:27:54'),
(96, 'America/Dawson_Creek', '-07:00', 'UTC/GMT -07:00', '2021-09-10 11:27:54', '2021-09-10 11:27:54'),
(97, 'America/Denver', '-06:00', 'UTC/GMT -06:00', '2021-09-10 12:27:54', '2021-09-10 12:27:54'),
(98, 'America/Detroit', '-04:00', 'UTC/GMT -04:00', '2021-09-10 14:27:55', '2021-09-10 14:27:55'),
(99, 'America/Dominica', '-04:00', 'UTC/GMT -04:00', '2021-09-10 14:27:55', '2021-09-10 14:27:55'),
(100, 'America/Edmonton', '-06:00', 'UTC/GMT -06:00', '2021-09-10 12:27:55', '2021-09-10 12:27:55'),
(101, 'America/Eirunepe', '-05:00', 'UTC/GMT -05:00', '2021-09-10 13:27:55', '2021-09-10 13:27:55'),
(102, 'America/El_Salvador', '-06:00', 'UTC/GMT -06:00', '2021-09-10 12:27:55', '2021-09-10 12:27:55'),
(103, 'America/Fort_Nelson', '-07:00', 'UTC/GMT -07:00', '2021-09-10 11:27:55', '2021-09-10 11:27:55'),
(104, 'America/Fortaleza', '-03:00', 'UTC/GMT -03:00', '2021-09-10 15:27:55', '2021-09-10 15:27:55'),
(105, 'America/Glace_Bay', '-03:00', 'UTC/GMT -03:00', '2021-09-10 15:27:55', '2021-09-10 15:27:55'),
(106, 'America/Godthab', '-02:00', 'UTC/GMT -02:00', '2021-09-10 16:27:55', '2021-09-10 16:27:55'),
(107, 'America/Goose_Bay', '-03:00', 'UTC/GMT -03:00', '2021-09-10 15:27:55', '2021-09-10 15:27:55'),
(108, 'America/Grand_Turk', '-04:00', 'UTC/GMT -04:00', '2021-09-10 14:27:55', '2021-09-10 14:27:55'),
(109, 'America/Grenada', '-04:00', 'UTC/GMT -04:00', '2021-09-10 14:27:55', '2021-09-10 14:27:55'),
(110, 'America/Guadeloupe', '-04:00', 'UTC/GMT -04:00', '2021-09-10 14:27:55', '2021-09-10 14:27:55'),
(111, 'America/Guatemala', '-06:00', 'UTC/GMT -06:00', '2021-09-10 12:27:55', '2021-09-10 12:27:55'),
(112, 'America/Guayaquil', '-05:00', 'UTC/GMT -05:00', '2021-09-10 13:27:55', '2021-09-10 13:27:55'),
(113, 'America/Guyana', '-04:00', 'UTC/GMT -04:00', '2021-09-10 14:27:55', '2021-09-10 14:27:55'),
(114, 'America/Halifax', '-03:00', 'UTC/GMT -03:00', '2021-09-10 15:27:55', '2021-09-10 15:27:55'),
(115, 'America/Havana', '-04:00', 'UTC/GMT -04:00', '2021-09-10 14:27:55', '2021-09-10 14:27:55'),
(116, 'America/Hermosillo', '-07:00', 'UTC/GMT -07:00', '2021-09-10 11:27:55', '2021-09-10 11:27:55'),
(117, 'America/Indiana/Indianapolis', '-04:00', 'UTC/GMT -04:00', '2021-09-10 14:27:56', '2021-09-10 14:27:56'),
(118, 'America/Indiana/Knox', '-05:00', 'UTC/GMT -05:00', '2021-09-10 13:27:56', '2021-09-10 13:27:56'),
(119, 'America/Indiana/Marengo', '-04:00', 'UTC/GMT -04:00', '2021-09-10 14:27:56', '2021-09-10 14:27:56'),
(120, 'America/Indiana/Petersburg', '-04:00', 'UTC/GMT -04:00', '2021-09-10 14:27:56', '2021-09-10 14:27:56'),
(121, 'America/Indiana/Tell_City', '-05:00', 'UTC/GMT -05:00', '2021-09-10 13:27:56', '2021-09-10 13:27:56'),
(122, 'America/Indiana/Vevay', '-04:00', 'UTC/GMT -04:00', '2021-09-10 14:27:56', '2021-09-10 14:27:56'),
(123, 'America/Indiana/Vincennes', '-04:00', 'UTC/GMT -04:00', '2021-09-10 14:27:56', '2021-09-10 14:27:56'),
(124, 'America/Indiana/Winamac', '-04:00', 'UTC/GMT -04:00', '2021-09-10 14:27:56', '2021-09-10 14:27:56'),
(125, 'America/Inuvik', '-06:00', 'UTC/GMT -06:00', '2021-09-10 12:27:56', '2021-09-10 12:27:56'),
(126, 'America/Iqaluit', '-04:00', 'UTC/GMT -04:00', '2021-09-10 14:27:57', '2021-09-10 14:27:57'),
(127, 'America/Jamaica', '-05:00', 'UTC/GMT -05:00', '2021-09-10 13:27:57', '2021-09-10 13:27:57'),
(128, 'America/Juneau', '-08:00', 'UTC/GMT -08:00', '2021-09-10 10:27:57', '2021-09-10 10:27:57'),
(129, 'America/Kentucky/Louisville', '-04:00', 'UTC/GMT -04:00', '2021-09-10 14:27:57', '2021-09-10 14:27:57'),
(130, 'America/Kentucky/Monticello', '-04:00', 'UTC/GMT -04:00', '2021-09-10 14:27:57', '2021-09-10 14:27:57'),
(131, 'America/Kralendijk', '-04:00', 'UTC/GMT -04:00', '2021-09-10 14:27:57', '2021-09-10 14:27:57'),
(132, 'America/La_Paz', '-04:00', 'UTC/GMT -04:00', '2021-09-10 14:27:57', '2021-09-10 14:27:57'),
(133, 'America/Lima', '-05:00', 'UTC/GMT -05:00', '2021-09-10 13:27:57', '2021-09-10 13:27:57'),
(134, 'America/Los_Angeles', '-07:00', 'UTC/GMT -07:00', '2021-09-10 11:27:57', '2021-09-10 11:27:57'),
(135, 'America/Lower_Princes', '-04:00', 'UTC/GMT -04:00', '2021-09-10 14:27:57', '2021-09-10 14:27:57'),
(136, 'America/Maceio', '-03:00', 'UTC/GMT -03:00', '2021-09-10 15:27:57', '2021-09-10 15:27:57'),
(137, 'America/Managua', '-06:00', 'UTC/GMT -06:00', '2021-09-10 12:27:57', '2021-09-10 12:27:57'),
(138, 'America/Manaus', '-04:00', 'UTC/GMT -04:00', '2021-09-10 14:27:57', '2021-09-10 14:27:57'),
(139, 'America/Marigot', '-04:00', 'UTC/GMT -04:00', '2021-09-10 14:27:57', '2021-09-10 14:27:57'),
(140, 'America/Martinique', '-04:00', 'UTC/GMT -04:00', '2021-09-10 14:27:57', '2021-09-10 14:27:57'),
(141, 'America/Matamoros', '-05:00', 'UTC/GMT -05:00', '2021-09-10 13:27:57', '2021-09-10 13:27:57'),
(142, 'America/Mazatlan', '-06:00', 'UTC/GMT -06:00', '2021-09-10 12:27:57', '2021-09-10 12:27:57'),
(143, 'America/Menominee', '-05:00', 'UTC/GMT -05:00', '2021-09-10 13:27:57', '2021-09-10 13:27:57'),
(144, 'America/Merida', '-05:00', 'UTC/GMT -05:00', '2021-09-10 13:27:58', '2021-09-10 13:27:58'),
(145, 'America/Metlakatla', '-08:00', 'UTC/GMT -08:00', '2021-09-10 10:27:58', '2021-09-10 10:27:58'),
(146, 'America/Mexico_City', '-05:00', 'UTC/GMT -05:00', '2021-09-10 13:27:58', '2021-09-10 13:27:58'),
(147, 'America/Miquelon', '-02:00', 'UTC/GMT -02:00', '2021-09-10 16:27:58', '2021-09-10 16:27:58'),
(148, 'America/Moncton', '-03:00', 'UTC/GMT -03:00', '2021-09-10 15:27:58', '2021-09-10 15:27:58'),
(149, 'America/Monterrey', '-05:00', 'UTC/GMT -05:00', '2021-09-10 13:27:58', '2021-09-10 13:27:58'),
(150, 'America/Montevideo', '-03:00', 'UTC/GMT -03:00', '2021-09-10 15:27:58', '2021-09-10 15:27:58'),
(151, 'America/Montserrat', '-04:00', 'UTC/GMT -04:00', '2021-09-10 14:27:58', '2021-09-10 14:27:58'),
(152, 'America/Nassau', '-04:00', 'UTC/GMT -04:00', '2021-09-10 14:27:58', '2021-09-10 14:27:58'),
(153, 'America/New_York', '-04:00', 'UTC/GMT -04:00', '2021-09-10 14:27:58', '2021-09-10 14:27:58'),
(154, 'America/Nipigon', '-04:00', 'UTC/GMT -04:00', '2021-09-10 14:27:58', '2021-09-10 14:27:58'),
(155, 'America/Nome', '-08:00', 'UTC/GMT -08:00', '2021-09-10 10:27:58', '2021-09-10 10:27:58'),
(156, 'America/Noronha', '-02:00', 'UTC/GMT -02:00', '2021-09-10 16:27:58', '2021-09-10 16:27:58'),
(157, 'America/North_Dakota/Beulah', '-05:00', 'UTC/GMT -05:00', '2021-09-10 13:27:58', '2021-09-10 13:27:58'),
(158, 'America/North_Dakota/Center', '-05:00', 'UTC/GMT -05:00', '2021-09-10 13:27:58', '2021-09-10 13:27:58'),
(159, 'America/North_Dakota/New_Salem', '-05:00', 'UTC/GMT -05:00', '2021-09-10 13:27:58', '2021-09-10 13:27:58'),
(160, 'America/Ojinaga', '-06:00', 'UTC/GMT -06:00', '2021-09-10 12:27:58', '2021-09-10 12:27:58'),
(161, 'America/Panama', '-05:00', 'UTC/GMT -05:00', '2021-09-10 13:27:58', '2021-09-10 13:27:58'),
(162, 'America/Pangnirtung', '-04:00', 'UTC/GMT -04:00', '2021-09-10 14:27:58', '2021-09-10 14:27:58'),
(163, 'America/Paramaribo', '-03:00', 'UTC/GMT -03:00', '2021-09-10 15:27:58', '2021-09-10 15:27:58'),
(164, 'America/Phoenix', '-07:00', 'UTC/GMT -07:00', '2021-09-10 11:27:58', '2021-09-10 11:27:58'),
(165, 'America/Port-au-Prince', '-04:00', 'UTC/GMT -04:00', '2021-09-10 14:27:59', '2021-09-10 14:27:59'),
(166, 'America/Port_of_Spain', '-04:00', 'UTC/GMT -04:00', '2021-09-10 14:27:59', '2021-09-10 14:27:59'),
(167, 'America/Porto_Velho', '-04:00', 'UTC/GMT -04:00', '2021-09-10 14:27:59', '2021-09-10 14:27:59'),
(168, 'America/Puerto_Rico', '-04:00', 'UTC/GMT -04:00', '2021-09-10 14:27:59', '2021-09-10 14:27:59'),
(169, 'America/Punta_Arenas', '-03:00', 'UTC/GMT -03:00', '2021-09-10 15:27:59', '2021-09-10 15:27:59'),
(170, 'America/Rainy_River', '-05:00', 'UTC/GMT -05:00', '2021-09-10 13:27:59', '2021-09-10 13:27:59'),
(171, 'America/Rankin_Inlet', '-05:00', 'UTC/GMT -05:00', '2021-09-10 13:27:59', '2021-09-10 13:27:59'),
(172, 'America/Recife', '-03:00', 'UTC/GMT -03:00', '2021-09-10 15:27:59', '2021-09-10 15:27:59'),
(173, 'America/Regina', '-06:00', 'UTC/GMT -06:00', '2021-09-10 12:27:59', '2021-09-10 12:27:59'),
(174, 'America/Resolute', '-05:00', 'UTC/GMT -05:00', '2021-09-10 13:27:59', '2021-09-10 13:27:59'),
(175, 'America/Rio_Branco', '-05:00', 'UTC/GMT -05:00', '2021-09-10 13:27:59', '2021-09-10 13:27:59'),
(176, 'America/Santarem', '-03:00', 'UTC/GMT -03:00', '2021-09-10 15:28:00', '2021-09-10 15:28:00'),
(177, 'America/Santiago', '-03:00', 'UTC/GMT -03:00', '2021-09-10 15:28:00', '2021-09-10 15:28:00'),
(178, 'America/Santo_Domingo', '-04:00', 'UTC/GMT -04:00', '2021-09-10 14:28:00', '2021-09-10 14:28:00'),
(179, 'America/Sao_Paulo', '-03:00', 'UTC/GMT -03:00', '2021-09-10 15:28:00', '2021-09-10 15:28:00'),
(180, 'America/Scoresbysund', '+00:00', 'UTC/GMT +00:00', '2021-09-10 18:28:00', '2021-09-10 18:28:00'),
(181, 'America/Sitka', '-08:00', 'UTC/GMT -08:00', '2021-09-10 10:28:00', '2021-09-10 10:28:00'),
(182, 'America/St_Barthelemy', '-04:00', 'UTC/GMT -04:00', '2021-09-10 14:28:00', '2021-09-10 14:28:00'),
(183, 'America/St_Johns', '-02:30', 'UTC/GMT -02:30', '2021-09-10 15:58:00', '2021-09-10 15:58:00'),
(184, 'America/St_Kitts', '-04:00', 'UTC/GMT -04:00', '2021-09-10 14:28:00', '2021-09-10 14:28:00'),
(185, 'America/St_Lucia', '-04:00', 'UTC/GMT -04:00', '2021-09-10 14:28:00', '2021-09-10 14:28:00'),
(186, 'America/St_Thomas', '-04:00', 'UTC/GMT -04:00', '2021-09-10 14:28:00', '2021-09-10 14:28:00'),
(187, 'America/St_Vincent', '-04:00', 'UTC/GMT -04:00', '2021-09-10 14:28:00', '2021-09-10 14:28:00'),
(188, 'America/Swift_Current', '-06:00', 'UTC/GMT -06:00', '2021-09-10 12:28:00', '2021-09-10 12:28:00'),
(189, 'America/Tegucigalpa', '-06:00', 'UTC/GMT -06:00', '2021-09-10 12:28:00', '2021-09-10 12:28:00'),
(190, 'America/Thule', '-03:00', 'UTC/GMT -03:00', '2021-09-10 15:28:00', '2021-09-10 15:28:00'),
(191, 'America/Thunder_Bay', '-04:00', 'UTC/GMT -04:00', '2021-09-10 14:28:00', '2021-09-10 14:28:00'),
(192, 'America/Tijuana', '-07:00', 'UTC/GMT -07:00', '2021-09-10 11:28:00', '2021-09-10 11:28:00'),
(193, 'America/Toronto', '-04:00', 'UTC/GMT -04:00', '2021-09-10 14:28:00', '2021-09-10 14:28:00'),
(194, 'America/Tortola', '-04:00', 'UTC/GMT -04:00', '2021-09-10 14:28:00', '2021-09-10 14:28:00'),
(195, 'America/Vancouver', '-07:00', 'UTC/GMT -07:00', '2021-09-10 11:28:00', '2021-09-10 11:28:00'),
(196, 'America/Whitehorse', '-07:00', 'UTC/GMT -07:00', '2021-09-10 11:28:00', '2021-09-10 11:28:00'),
(197, 'America/Winnipeg', '-05:00', 'UTC/GMT -05:00', '2021-09-10 13:28:00', '2021-09-10 13:28:00'),
(198, 'America/Yakutat', '-08:00', 'UTC/GMT -08:00', '2021-09-10 10:28:01', '2021-09-10 10:28:01'),
(199, 'America/Yellowknife', '-06:00', 'UTC/GMT -06:00', '2021-09-10 12:28:01', '2021-09-10 12:28:01'),
(200, 'Antarctica/Casey', '+08:00', 'UTC/GMT +08:00', '2021-09-11 02:28:01', '2021-09-11 02:28:01'),
(201, 'Antarctica/Davis', '+07:00', 'UTC/GMT +07:00', '2021-09-11 01:28:01', '2021-09-11 01:28:01'),
(202, 'Antarctica/DumontDUrville', '+10:00', 'UTC/GMT +10:00', '2021-09-11 04:28:01', '2021-09-11 04:28:01'),
(203, 'Antarctica/Macquarie', '+11:00', 'UTC/GMT +11:00', '2021-09-11 05:28:01', '2021-09-11 05:28:01'),
(204, 'Antarctica/Mawson', '+05:00', 'UTC/GMT +05:00', '2021-09-10 23:28:01', '2021-09-10 23:28:01'),
(205, 'Antarctica/McMurdo', '+12:00', 'UTC/GMT +12:00', '2021-09-11 06:28:01', '2021-09-11 06:28:01'),
(206, 'Antarctica/Palmer', '-03:00', 'UTC/GMT -03:00', '2021-09-10 15:28:01', '2021-09-10 15:28:01'),
(207, 'Antarctica/Rothera', '-03:00', 'UTC/GMT -03:00', '2021-09-10 15:28:01', '2021-09-10 15:28:01'),
(208, 'Antarctica/Syowa', '+03:00', 'UTC/GMT +03:00', '2021-09-10 21:28:01', '2021-09-10 21:28:01'),
(209, 'Antarctica/Troll', '+02:00', 'UTC/GMT +02:00', '2021-09-10 20:28:01', '2021-09-10 20:28:01'),
(210, 'Antarctica/Vostok', '+06:00', 'UTC/GMT +06:00', '2021-09-11 00:28:01', '2021-09-11 00:28:01'),
(211, 'Arctic/Longyearbyen', '+02:00', 'UTC/GMT +02:00', '2021-09-10 20:28:01', '2021-09-10 20:28:01'),
(212, 'Asia/Aden', '+03:00', 'UTC/GMT +03:00', '2021-09-10 21:28:01', '2021-09-10 21:28:01'),
(213, 'Asia/Almaty', '+06:00', 'UTC/GMT +06:00', '2021-09-11 00:28:01', '2021-09-11 00:28:01'),
(214, 'Asia/Amman', '+03:00', 'UTC/GMT +03:00', '2021-09-10 21:28:01', '2021-09-10 21:28:01'),
(215, 'Asia/Anadyr', '+12:00', 'UTC/GMT +12:00', '2021-09-11 06:28:01', '2021-09-11 06:28:01'),
(216, 'Asia/Aqtau', '+05:00', 'UTC/GMT +05:00', '2021-09-10 23:28:01', '2021-09-10 23:28:01'),
(217, 'Asia/Aqtobe', '+05:00', 'UTC/GMT +05:00', '2021-09-10 23:28:02', '2021-09-10 23:28:02'),
(218, 'Asia/Ashgabat', '+05:00', 'UTC/GMT +05:00', '2021-09-10 23:28:02', '2021-09-10 23:28:02'),
(219, 'Asia/Atyrau', '+05:00', 'UTC/GMT +05:00', '2021-09-10 23:28:02', '2021-09-10 23:28:02'),
(220, 'Asia/Baghdad', '+03:00', 'UTC/GMT +03:00', '2021-09-10 21:28:02', '2021-09-10 21:28:02'),
(221, 'Asia/Bahrain', '+03:00', 'UTC/GMT +03:00', '2021-09-10 21:28:02', '2021-09-10 21:28:02'),
(222, 'Asia/Baku', '+04:00', 'UTC/GMT +04:00', '2021-09-10 22:28:02', '2021-09-10 22:28:02'),
(223, 'Asia/Bangkok', '+07:00', 'UTC/GMT +07:00', '2021-09-11 01:28:02', '2021-09-11 01:28:02'),
(224, 'Asia/Barnaul', '+07:00', 'UTC/GMT +07:00', '2021-09-11 01:28:02', '2021-09-11 01:28:02'),
(225, 'Asia/Beirut', '+03:00', 'UTC/GMT +03:00', '2021-09-10 21:28:02', '2021-09-10 21:28:02'),
(226, 'Asia/Bishkek', '+06:00', 'UTC/GMT +06:00', '2021-09-11 00:28:02', '2021-09-11 00:28:02'),
(227, 'Asia/Brunei', '+08:00', 'UTC/GMT +08:00', '2021-09-11 02:28:02', '2021-09-11 02:28:02'),
(228, 'Asia/Chita', '+09:00', 'UTC/GMT +09:00', '2021-09-11 03:28:02', '2021-09-11 03:28:02'),
(229, 'Asia/Choibalsan', '+08:00', 'UTC/GMT +08:00', '2021-09-11 02:28:02', '2021-09-11 02:28:02'),
(230, 'Asia/Colombo', '+05:30', 'UTC/GMT +05:30', '2021-09-10 23:58:02', '2021-09-10 23:58:02'),
(231, 'Asia/Damascus', '+03:00', 'UTC/GMT +03:00', '2021-09-10 21:28:02', '2021-09-10 21:28:02'),
(232, 'Asia/Dhaka', '+06:00', 'UTC/GMT +06:00', '2021-09-11 00:28:02', '2021-09-11 00:28:02'),
(233, 'Asia/Dili', '+09:00', 'UTC/GMT +09:00', '2021-09-11 03:28:02', '2021-09-11 03:28:02'),
(234, 'Asia/Dubai', '+04:00', 'UTC/GMT +04:00', '2021-09-10 22:28:02', '2021-09-10 22:28:02'),
(235, 'Asia/Dushanbe', '+05:00', 'UTC/GMT +05:00', '2021-09-10 23:28:03', '2021-09-10 23:28:03'),
(236, 'Asia/Famagusta', '+03:00', 'UTC/GMT +03:00', '2021-09-10 21:28:03', '2021-09-10 21:28:03'),
(237, 'Asia/Gaza', '+03:00', 'UTC/GMT +03:00', '2021-09-10 21:28:03', '2021-09-10 21:28:03'),
(238, 'Asia/Hebron', '+03:00', 'UTC/GMT +03:00', '2021-09-10 21:28:03', '2021-09-10 21:28:03'),
(239, 'Asia/Ho_Chi_Minh', '+07:00', 'UTC/GMT +07:00', '2021-09-11 01:28:03', '2021-09-11 01:28:03'),
(240, 'Asia/Hong_Kong', '+08:00', 'UTC/GMT +08:00', '2021-09-11 02:28:03', '2021-09-11 02:28:03'),
(241, 'Asia/Hovd', '+07:00', 'UTC/GMT +07:00', '2021-09-11 01:28:03', '2021-09-11 01:28:03'),
(242, 'Asia/Irkutsk', '+08:00', 'UTC/GMT +08:00', '2021-09-11 02:28:03', '2021-09-11 02:28:03'),
(243, 'Asia/Jakarta', '+07:00', 'UTC/GMT +07:00', '2021-09-11 01:28:03', '2021-09-11 01:28:03'),
(244, 'Asia/Jayapura', '+09:00', 'UTC/GMT +09:00', '2021-09-11 03:28:03', '2021-09-11 03:28:03'),
(245, 'Asia/Jerusalem', '+03:00', 'UTC/GMT +03:00', '2021-09-10 21:28:03', '2021-09-10 21:28:03'),
(246, 'Asia/Kabul', '+04:30', 'UTC/GMT +04:30', '2021-09-10 22:58:03', '2021-09-10 22:58:03'),
(247, 'Asia/Kamchatka', '+12:00', 'UTC/GMT +12:00', '2021-09-11 06:28:03', '2021-09-11 06:28:03'),
(248, 'Asia/Karachi', '+05:00', 'UTC/GMT +05:00', '2021-09-10 23:28:03', '2021-09-10 23:28:03'),
(249, 'Asia/Kathmandu', '+05:45', 'UTC/GMT +05:45', '2021-09-11 00:13:04', '2021-09-11 00:13:04'),
(250, 'Asia/Khandyga', '+09:00', 'UTC/GMT +09:00', '2021-09-11 03:28:04', '2021-09-11 03:28:04'),
(251, 'Asia/Kolkata', '+05:30', 'UTC/GMT +05:30', '2021-09-10 23:58:04', '2021-09-10 23:58:04'),
(252, 'Asia/Krasnoyarsk', '+07:00', 'UTC/GMT +07:00', '2021-09-11 01:28:04', '2021-09-11 01:28:04'),
(253, 'Asia/Kuala_Lumpur', '+08:00', 'UTC/GMT +08:00', '2021-09-11 02:28:04', '2021-09-11 02:28:04'),
(254, 'Asia/Kuching', '+08:00', 'UTC/GMT +08:00', '2021-09-11 02:28:04', '2021-09-11 02:28:04'),
(255, 'Asia/Kuwait', '+03:00', 'UTC/GMT +03:00', '2021-09-10 21:28:04', '2021-09-10 21:28:04'),
(256, 'Asia/Macau', '+08:00', 'UTC/GMT +08:00', '2021-09-11 02:28:04', '2021-09-11 02:28:04'),
(257, 'Asia/Magadan', '+11:00', 'UTC/GMT +11:00', '2021-09-11 05:28:04', '2021-09-11 05:28:04'),
(258, 'Asia/Makassar', '+08:00', 'UTC/GMT +08:00', '2021-09-11 02:28:04', '2021-09-11 02:28:04'),
(259, 'Asia/Manila', '+08:00', 'UTC/GMT +08:00', '2021-09-11 02:28:04', '2021-09-11 02:28:04'),
(260, 'Asia/Muscat', '+04:00', 'UTC/GMT +04:00', '2021-09-10 22:28:04', '2021-09-10 22:28:04'),
(261, 'Asia/Nicosia', '+03:00', 'UTC/GMT +03:00', '2021-09-10 21:28:04', '2021-09-10 21:28:04'),
(262, 'Asia/Novokuznetsk', '+07:00', 'UTC/GMT +07:00', '2021-09-11 01:28:04', '2021-09-11 01:28:04'),
(263, 'Asia/Novosibirsk', '+07:00', 'UTC/GMT +07:00', '2021-09-11 01:28:04', '2021-09-11 01:28:04'),
(264, 'Asia/Omsk', '+06:00', 'UTC/GMT +06:00', '2021-09-11 00:28:04', '2021-09-11 00:28:04'),
(265, 'Asia/Oral', '+05:00', 'UTC/GMT +05:00', '2021-09-10 23:28:04', '2021-09-10 23:28:04'),
(266, 'Asia/Phnom_Penh', '+07:00', 'UTC/GMT +07:00', '2021-09-11 01:28:04', '2021-09-11 01:28:04'),
(267, 'Asia/Pontianak', '+07:00', 'UTC/GMT +07:00', '2021-09-11 01:28:04', '2021-09-11 01:28:04'),
(268, 'Asia/Pyongyang', '+09:00', 'UTC/GMT +09:00', '2021-09-11 03:28:05', '2021-09-11 03:28:05'),
(269, 'Asia/Qatar', '+03:00', 'UTC/GMT +03:00', '2021-09-10 21:28:05', '2021-09-10 21:28:05'),
(270, 'Asia/Qostanay', '+06:00', 'UTC/GMT +06:00', '2021-09-11 00:28:05', '2021-09-11 00:28:05'),
(271, 'Asia/Qyzylorda', '+05:00', 'UTC/GMT +05:00', '2021-09-10 23:28:05', '2021-09-10 23:28:05'),
(272, 'Asia/Riyadh', '+03:00', 'UTC/GMT +03:00', '2021-09-10 21:28:05', '2021-09-10 21:28:05'),
(273, 'Asia/Sakhalin', '+11:00', 'UTC/GMT +11:00', '2021-09-11 05:28:05', '2021-09-11 05:28:05'),
(274, 'Asia/Samarkand', '+05:00', 'UTC/GMT +05:00', '2021-09-10 23:28:05', '2021-09-10 23:28:05'),
(275, 'Asia/Seoul', '+09:00', 'UTC/GMT +09:00', '2021-09-11 03:28:05', '2021-09-11 03:28:05'),
(276, 'Asia/Shanghai', '+08:00', 'UTC/GMT +08:00', '2021-09-11 02:28:05', '2021-09-11 02:28:05'),
(277, 'Asia/Singapore', '+08:00', 'UTC/GMT +08:00', '2021-09-11 02:28:05', '2021-09-11 02:28:05'),
(278, 'Asia/Srednekolymsk', '+11:00', 'UTC/GMT +11:00', '2021-09-11 05:28:05', '2021-09-11 05:28:05'),
(279, 'Asia/Taipei', '+08:00', 'UTC/GMT +08:00', '2021-09-11 02:28:05', '2021-09-11 02:28:05'),
(280, 'Asia/Tashkent', '+05:00', 'UTC/GMT +05:00', '2021-09-10 23:28:06', '2021-09-10 23:28:06'),
(281, 'Asia/Tbilisi', '+04:00', 'UTC/GMT +04:00', '2021-09-10 22:28:06', '2021-09-10 22:28:06'),
(282, 'Asia/Tehran', '+04:30', 'UTC/GMT +04:30', '2021-09-10 22:58:06', '2021-09-10 22:58:06'),
(283, 'Asia/Thimphu', '+06:00', 'UTC/GMT +06:00', '2021-09-11 00:28:06', '2021-09-11 00:28:06'),
(284, 'Asia/Tokyo', '+09:00', 'UTC/GMT +09:00', '2021-09-11 03:28:06', '2021-09-11 03:28:06'),
(285, 'Asia/Tomsk', '+07:00', 'UTC/GMT +07:00', '2021-09-11 01:28:06', '2021-09-11 01:28:06'),
(286, 'Asia/Ulaanbaatar', '+08:00', 'UTC/GMT +08:00', '2021-09-11 02:28:06', '2021-09-11 02:28:06'),
(287, 'Asia/Urumqi', '+06:00', 'UTC/GMT +06:00', '2021-09-11 00:28:06', '2021-09-11 00:28:06'),
(288, 'Asia/Ust-Nera', '+10:00', 'UTC/GMT +10:00', '2021-09-11 04:28:06', '2021-09-11 04:28:06'),
(289, 'Asia/Vientiane', '+07:00', 'UTC/GMT +07:00', '2021-09-11 01:28:06', '2021-09-11 01:28:06'),
(290, 'Asia/Vladivostok', '+10:00', 'UTC/GMT +10:00', '2021-09-11 04:28:06', '2021-09-11 04:28:06'),
(291, 'Asia/Yakutsk', '+09:00', 'UTC/GMT +09:00', '2021-09-11 03:28:06', '2021-09-11 03:28:06'),
(292, 'Asia/Yangon', '+06:30', 'UTC/GMT +06:30', '2021-09-11 00:58:06', '2021-09-11 00:58:06'),
(293, 'Asia/Yekaterinburg', '+05:00', 'UTC/GMT +05:00', '2021-09-10 23:28:06', '2021-09-10 23:28:06'),
(294, 'Asia/Yerevan', '+04:00', 'UTC/GMT +04:00', '2021-09-10 22:28:06', '2021-09-10 22:28:06'),
(295, 'Atlantic/Azores', '+00:00', 'UTC/GMT +00:00', '2021-09-10 18:28:06', '2021-09-10 18:28:06'),
(296, 'Atlantic/Bermuda', '-03:00', 'UTC/GMT -03:00', '2021-09-10 15:28:06', '2021-09-10 15:28:06'),
(297, 'Atlantic/Canary', '+01:00', 'UTC/GMT +01:00', '2021-09-10 19:28:06', '2021-09-10 19:28:06'),
(298, 'Atlantic/Cape_Verde', '-01:00', 'UTC/GMT -01:00', '2021-09-10 17:28:07', '2021-09-10 17:28:07'),
(299, 'Atlantic/Faroe', '+01:00', 'UTC/GMT +01:00', '2021-09-10 19:28:07', '2021-09-10 19:28:07'),
(300, 'Atlantic/Madeira', '+01:00', 'UTC/GMT +01:00', '2021-09-10 19:28:07', '2021-09-10 19:28:07'),
(301, 'Atlantic/Reykjavik', '+00:00', 'UTC/GMT +00:00', '2021-09-10 18:28:07', '2021-09-10 18:28:07'),
(302, 'Atlantic/South_Georgia', '-02:00', 'UTC/GMT -02:00', '2021-09-10 16:28:07', '2021-09-10 16:28:07'),
(303, 'Atlantic/St_Helena', '+00:00', 'UTC/GMT +00:00', '2021-09-10 18:28:07', '2021-09-10 18:28:07'),
(304, 'Atlantic/Stanley', '-03:00', 'UTC/GMT -03:00', '2021-09-10 15:28:07', '2021-09-10 15:28:07'),
(305, 'Australia/Adelaide', '+09:30', 'UTC/GMT +09:30', '2021-09-11 03:58:07', '2021-09-11 03:58:07'),
(306, 'Australia/Brisbane', '+10:00', 'UTC/GMT +10:00', '2021-09-11 04:28:07', '2021-09-11 04:28:07'),
(307, 'Australia/Broken_Hill', '+09:30', 'UTC/GMT +09:30', '2021-09-11 03:58:07', '2021-09-11 03:58:07'),
(308, 'Australia/Currie', '+10:00', 'UTC/GMT +10:00', '2021-09-11 04:28:07', '2021-09-11 04:28:07'),
(309, 'Australia/Darwin', '+09:30', 'UTC/GMT +09:30', '2021-09-11 03:58:07', '2021-09-11 03:58:07'),
(310, 'Australia/Eucla', '+08:45', 'UTC/GMT +08:45', '2021-09-11 03:13:07', '2021-09-11 03:13:07'),
(311, 'Australia/Hobart', '+10:00', 'UTC/GMT +10:00', '2021-09-11 04:28:07', '2021-09-11 04:28:07'),
(312, 'Australia/Lindeman', '+10:00', 'UTC/GMT +10:00', '2021-09-11 04:28:07', '2021-09-11 04:28:07'),
(313, 'Australia/Lord_Howe', '+10:30', 'UTC/GMT +10:30', '2021-09-11 04:58:07', '2021-09-11 04:58:07'),
(314, 'Australia/Melbourne', '+10:00', 'UTC/GMT +10:00', '2021-09-11 04:28:08', '2021-09-11 04:28:08'),
(315, 'Australia/Perth', '+08:00', 'UTC/GMT +08:00', '2021-09-11 02:28:08', '2021-09-11 02:28:08'),
(316, 'Australia/Sydney', '+10:00', 'UTC/GMT +10:00', '2021-09-11 04:28:08', '2021-09-11 04:28:08'),
(317, 'Europe/Amsterdam', '+02:00', 'UTC/GMT +02:00', '2021-09-10 20:28:08', '2021-09-10 20:28:08'),
(318, 'Europe/Andorra', '+02:00', 'UTC/GMT +02:00', '2021-09-10 20:28:08', '2021-09-10 20:28:08'),
(319, 'Europe/Astrakhan', '+04:00', 'UTC/GMT +04:00', '2021-09-10 22:28:08', '2021-09-10 22:28:08'),
(320, 'Europe/Athens', '+03:00', 'UTC/GMT +03:00', '2021-09-10 21:28:08', '2021-09-10 21:28:08'),
(321, 'Europe/Belgrade', '+02:00', 'UTC/GMT +02:00', '2021-09-10 20:28:08', '2021-09-10 20:28:08'),
(322, 'Europe/Berlin', '+02:00', 'UTC/GMT +02:00', '2021-09-10 20:28:08', '2021-09-10 20:28:08'),
(323, 'Europe/Bratislava', '+02:00', 'UTC/GMT +02:00', '2021-09-10 20:28:08', '2021-09-10 20:28:08'),
(324, 'Europe/Brussels', '+02:00', 'UTC/GMT +02:00', '2021-09-10 20:28:08', '2021-09-10 20:28:08'),
(325, 'Europe/Bucharest', '+03:00', 'UTC/GMT +03:00', '2021-09-10 21:28:08', '2021-09-10 21:28:08'),
(326, 'Europe/Budapest', '+02:00', 'UTC/GMT +02:00', '2021-09-10 20:28:08', '2021-09-10 20:28:08'),
(327, 'Europe/Busingen', '+02:00', 'UTC/GMT +02:00', '2021-09-10 20:28:08', '2021-09-10 20:28:08'),
(328, 'Europe/Chisinau', '+03:00', 'UTC/GMT +03:00', '2021-09-10 21:28:08', '2021-09-10 21:28:08'),
(329, 'Europe/Copenhagen', '+02:00', 'UTC/GMT +02:00', '2021-09-10 20:28:08', '2021-09-10 20:28:08'),
(330, 'Europe/Dublin', '+01:00', 'UTC/GMT +01:00', '2021-09-10 19:28:08', '2021-09-10 19:28:08'),
(331, 'Europe/Gibraltar', '+02:00', 'UTC/GMT +02:00', '2021-09-10 20:28:08', '2021-09-10 20:28:08'),
(332, 'Europe/Guernsey', '+01:00', 'UTC/GMT +01:00', '2021-09-10 19:28:09', '2021-09-10 19:28:09'),
(333, 'Europe/Helsinki', '+03:00', 'UTC/GMT +03:00', '2021-09-10 21:28:09', '2021-09-10 21:28:09'),
(334, 'Europe/Isle_of_Man', '+01:00', 'UTC/GMT +01:00', '2021-09-10 19:28:09', '2021-09-10 19:28:09'),
(335, 'Europe/Istanbul', '+03:00', 'UTC/GMT +03:00', '2021-09-10 21:28:09', '2021-09-10 21:28:09'),
(336, 'Europe/Jersey', '+01:00', 'UTC/GMT +01:00', '2021-09-10 19:28:09', '2021-09-10 19:28:09'),
(337, 'Europe/Kaliningrad', '+02:00', 'UTC/GMT +02:00', '2021-09-10 20:28:09', '2021-09-10 20:28:09'),
(338, 'Europe/Kiev', '+03:00', 'UTC/GMT +03:00', '2021-09-10 21:28:09', '2021-09-10 21:28:09'),
(339, 'Europe/Kirov', '+03:00', 'UTC/GMT +03:00', '2021-09-10 21:28:09', '2021-09-10 21:28:09'),
(340, 'Europe/Lisbon', '+01:00', 'UTC/GMT +01:00', '2021-09-10 19:28:09', '2021-09-10 19:28:09'),
(341, 'Europe/Ljubljana', '+02:00', 'UTC/GMT +02:00', '2021-09-10 20:28:10', '2021-09-10 20:28:10'),
(342, 'Europe/London', '+01:00', 'UTC/GMT +01:00', '2021-09-10 19:28:10', '2021-09-10 19:28:10'),
(343, 'Europe/Luxembourg', '+02:00', 'UTC/GMT +02:00', '2021-09-10 20:28:10', '2021-09-10 20:28:10'),
(344, 'Europe/Madrid', '+02:00', 'UTC/GMT +02:00', '2021-09-10 20:28:10', '2021-09-10 20:28:10'),
(345, 'Europe/Malta', '+02:00', 'UTC/GMT +02:00', '2021-09-10 20:28:10', '2021-09-10 20:28:10'),
(346, 'Europe/Mariehamn', '+03:00', 'UTC/GMT +03:00', '2021-09-10 21:28:10', '2021-09-10 21:28:10'),
(347, 'Europe/Minsk', '+03:00', 'UTC/GMT +03:00', '2021-09-10 21:28:10', '2021-09-10 21:28:10'),
(348, 'Europe/Monaco', '+02:00', 'UTC/GMT +02:00', '2021-09-10 20:28:10', '2021-09-10 20:28:10'),
(349, 'Europe/Moscow', '+03:00', 'UTC/GMT +03:00', '2021-09-10 21:28:10', '2021-09-10 21:28:10'),
(350, 'Europe/Oslo', '+02:00', 'UTC/GMT +02:00', '2021-09-10 20:28:10', '2021-09-10 20:28:10'),
(351, 'Europe/Paris', '+02:00', 'UTC/GMT +02:00', '2021-09-10 20:28:10', '2021-09-10 20:28:10'),
(352, 'Europe/Podgorica', '+02:00', 'UTC/GMT +02:00', '2021-09-10 20:28:10', '2021-09-10 20:28:10'),
(353, 'Europe/Prague', '+02:00', 'UTC/GMT +02:00', '2021-09-10 20:28:10', '2021-09-10 20:28:10'),
(354, 'Europe/Riga', '+03:00', 'UTC/GMT +03:00', '2021-09-10 21:28:10', '2021-09-10 21:28:10'),
(355, 'Europe/Rome', '+02:00', 'UTC/GMT +02:00', '2021-09-10 20:28:11', '2021-09-10 20:28:11'),
(356, 'Europe/Samara', '+04:00', 'UTC/GMT +04:00', '2021-09-10 22:28:11', '2021-09-10 22:28:11'),
(357, 'Europe/San_Marino', '+02:00', 'UTC/GMT +02:00', '2021-09-10 20:28:11', '2021-09-10 20:28:11'),
(358, 'Europe/Sarajevo', '+02:00', 'UTC/GMT +02:00', '2021-09-10 20:28:11', '2021-09-10 20:28:11'),
(359, 'Europe/Saratov', '+04:00', 'UTC/GMT +04:00', '2021-09-10 22:28:11', '2021-09-10 22:28:11'),
(360, 'Europe/Simferopol', '+03:00', 'UTC/GMT +03:00', '2021-09-10 21:28:11', '2021-09-10 21:28:11'),
(361, 'Europe/Skopje', '+02:00', 'UTC/GMT +02:00', '2021-09-10 20:28:11', '2021-09-10 20:28:11'),
(362, 'Europe/Sofia', '+03:00', 'UTC/GMT +03:00', '2021-09-10 21:28:11', '2021-09-10 21:28:11'),
(363, 'Europe/Stockholm', '+02:00', 'UTC/GMT +02:00', '2021-09-10 20:28:11', '2021-09-10 20:28:11'),
(364, 'Europe/Tallinn', '+03:00', 'UTC/GMT +03:00', '2021-09-10 21:28:11', '2021-09-10 21:28:11'),
(365, 'Europe/Tirane', '+02:00', 'UTC/GMT +02:00', '2021-09-10 20:28:11', '2021-09-10 20:28:11'),
(366, 'Europe/Ulyanovsk', '+04:00', 'UTC/GMT +04:00', '2021-09-10 22:28:11', '2021-09-10 22:28:11'),
(367, 'Europe/Uzhgorod', '+03:00', 'UTC/GMT +03:00', '2021-09-10 21:28:11', '2021-09-10 21:28:11'),
(368, 'Europe/Vaduz', '+02:00', 'UTC/GMT +02:00', '2021-09-10 20:28:11', '2021-09-10 20:28:11'),
(369, 'Europe/Vatican', '+02:00', 'UTC/GMT +02:00', '2021-09-10 20:28:12', '2021-09-10 20:28:12'),
(370, 'Europe/Vienna', '+02:00', 'UTC/GMT +02:00', '2021-09-10 20:28:12', '2021-09-10 20:28:12'),
(371, 'Europe/Vilnius', '+03:00', 'UTC/GMT +03:00', '2021-09-10 21:28:12', '2021-09-10 21:28:12'),
(372, 'Europe/Volgograd', '+04:00', 'UTC/GMT +04:00', '2021-09-10 22:28:12', '2021-09-10 22:28:12'),
(373, 'Europe/Warsaw', '+02:00', 'UTC/GMT +02:00', '2021-09-10 20:28:12', '2021-09-10 20:28:12'),
(374, 'Europe/Zagreb', '+02:00', 'UTC/GMT +02:00', '2021-09-10 20:28:12', '2021-09-10 20:28:12'),
(375, 'Europe/Zaporozhye', '+03:00', 'UTC/GMT +03:00', '2021-09-10 21:28:12', '2021-09-10 21:28:12'),
(376, 'Europe/Zurich', '+02:00', 'UTC/GMT +02:00', '2021-09-10 20:28:12', '2021-09-10 20:28:12'),
(377, 'Indian/Antananarivo', '+03:00', 'UTC/GMT +03:00', '2021-09-10 21:28:12', '2021-09-10 21:28:12'),
(378, 'Indian/Chagos', '+06:00', 'UTC/GMT +06:00', '2021-09-11 00:28:12', '2021-09-11 00:28:12'),
(379, 'Indian/Christmas', '+07:00', 'UTC/GMT +07:00', '2021-09-11 01:28:12', '2021-09-11 01:28:12'),
(380, 'Indian/Cocos', '+06:30', 'UTC/GMT +06:30', '2021-09-11 00:58:12', '2021-09-11 00:58:12'),
(381, 'Indian/Comoro', '+03:00', 'UTC/GMT +03:00', '2021-09-10 21:28:12', '2021-09-10 21:28:12'),
(382, 'Indian/Kerguelen', '+05:00', 'UTC/GMT +05:00', '2021-09-10 23:28:13', '2021-09-10 23:28:13'),
(383, 'Indian/Mahe', '+04:00', 'UTC/GMT +04:00', '2021-09-10 22:28:13', '2021-09-10 22:28:13'),
(384, 'Indian/Maldives', '+05:00', 'UTC/GMT +05:00', '2021-09-10 23:28:13', '2021-09-10 23:28:13'),
(385, 'Indian/Mauritius', '+04:00', 'UTC/GMT +04:00', '2021-09-10 22:28:13', '2021-09-10 22:28:13'),
(386, 'Indian/Mayotte', '+03:00', 'UTC/GMT +03:00', '2021-09-10 21:28:13', '2021-09-10 21:28:13'),
(387, 'Indian/Reunion', '+04:00', 'UTC/GMT +04:00', '2021-09-10 22:28:13', '2021-09-10 22:28:13'),
(388, 'Pacific/Apia', '+13:00', 'UTC/GMT +13:00', '2021-09-11 07:28:13', '2021-09-11 07:28:13'),
(389, 'Pacific/Auckland', '+12:00', 'UTC/GMT +12:00', '2021-09-11 06:28:13', '2021-09-11 06:28:13'),
(390, 'Pacific/Bougainville', '+11:00', 'UTC/GMT +11:00', '2021-09-11 05:28:13', '2021-09-11 05:28:13'),
(391, 'Pacific/Chatham', '+12:45', 'UTC/GMT +12:45', '2021-09-11 07:13:13', '2021-09-11 07:13:13'),
(392, 'Pacific/Chuuk', '+10:00', 'UTC/GMT +10:00', '2021-09-11 04:28:13', '2021-09-11 04:28:13'),
(393, 'Pacific/Easter', '-05:00', 'UTC/GMT -05:00', '2021-09-10 13:28:13', '2021-09-10 13:28:13'),
(394, 'Pacific/Efate', '+11:00', 'UTC/GMT +11:00', '2021-09-11 05:28:13', '2021-09-11 05:28:13'),
(395, 'Pacific/Enderbury', '+13:00', 'UTC/GMT +13:00', '2021-09-11 07:28:13', '2021-09-11 07:28:13'),
(396, 'Pacific/Fakaofo', '+13:00', 'UTC/GMT +13:00', '2021-09-11 07:28:13', '2021-09-11 07:28:13'),
(397, 'Pacific/Fiji', '+12:00', 'UTC/GMT +12:00', '2021-09-11 06:28:13', '2021-09-11 06:28:13'),
(398, 'Pacific/Funafuti', '+12:00', 'UTC/GMT +12:00', '2021-09-11 06:28:13', '2021-09-11 06:28:13'),
(399, 'Pacific/Galapagos', '-06:00', 'UTC/GMT -06:00', '2021-09-10 12:28:14', '2021-09-10 12:28:14'),
(400, 'Pacific/Gambier', '-09:00', 'UTC/GMT -09:00', '2021-09-10 09:28:14', '2021-09-10 09:28:14'),
(401, 'Pacific/Guadalcanal', '+11:00', 'UTC/GMT +11:00', '2021-09-11 05:28:14', '2021-09-11 05:28:14'),
(402, 'Pacific/Guam', '+10:00', 'UTC/GMT +10:00', '2021-09-11 04:28:14', '2021-09-11 04:28:14'),
(403, 'Pacific/Honolulu', '-10:00', 'UTC/GMT -10:00', '2021-09-10 08:28:14', '2021-09-10 08:28:14'),
(404, 'Pacific/Kiritimati', '+14:00', 'UTC/GMT +14:00', '2021-09-11 08:28:14', '2021-09-11 08:28:14'),
(405, 'Pacific/Kosrae', '+11:00', 'UTC/GMT +11:00', '2021-09-11 05:28:14', '2021-09-11 05:28:14'),
(406, 'Pacific/Kwajalein', '+12:00', 'UTC/GMT +12:00', '2021-09-11 06:28:14', '2021-09-11 06:28:14'),
(407, 'Pacific/Majuro', '+12:00', 'UTC/GMT +12:00', '2021-09-11 06:28:14', '2021-09-11 06:28:14'),
(408, 'Pacific/Marquesas', '-09:30', 'UTC/GMT -09:30', '2021-09-10 08:58:14', '2021-09-10 08:58:14'),
(409, 'Pacific/Midway', '-11:00', 'UTC/GMT -11:00', '2021-09-10 07:28:14', '2021-09-10 07:28:14'),
(410, 'Pacific/Nauru', '+12:00', 'UTC/GMT +12:00', '2021-09-11 06:28:14', '2021-09-11 06:28:14'),
(411, 'Pacific/Niue', '-11:00', 'UTC/GMT -11:00', '2021-09-10 07:28:14', '2021-09-10 07:28:14'),
(412, 'Pacific/Norfolk', '+11:00', 'UTC/GMT +11:00', '2021-09-11 05:28:14', '2021-09-11 05:28:14'),
(413, 'Pacific/Noumea', '+11:00', 'UTC/GMT +11:00', '2021-09-11 05:28:14', '2021-09-11 05:28:14'),
(414, 'Pacific/Pago_Pago', '-11:00', 'UTC/GMT -11:00', '2021-09-10 07:28:14', '2021-09-10 07:28:14'),
(415, 'Pacific/Palau', '+09:00', 'UTC/GMT +09:00', '2021-09-11 03:28:15', '2021-09-11 03:28:15'),
(416, 'Pacific/Pitcairn', '-08:00', 'UTC/GMT -08:00', '2021-09-10 10:28:15', '2021-09-10 10:28:15'),
(417, 'Pacific/Pohnpei', '+11:00', 'UTC/GMT +11:00', '2021-09-11 05:28:15', '2021-09-11 05:28:15'),
(418, 'Pacific/Port_Moresby', '+10:00', 'UTC/GMT +10:00', '2021-09-11 04:28:15', '2021-09-11 04:28:15'),
(419, 'Pacific/Rarotonga', '-10:00', 'UTC/GMT -10:00', '2021-09-10 08:28:15', '2021-09-10 08:28:15'),
(420, 'Pacific/Saipan', '+10:00', 'UTC/GMT +10:00', '2021-09-11 04:28:15', '2021-09-11 04:28:15'),
(421, 'Pacific/Tahiti', '-10:00', 'UTC/GMT -10:00', '2021-09-10 08:28:15', '2021-09-10 08:28:15'),
(422, 'Pacific/Tarawa', '+12:00', 'UTC/GMT +12:00', '2021-09-11 06:28:15', '2021-09-11 06:28:15'),
(423, 'Pacific/Tongatapu', '+13:00', 'UTC/GMT +13:00', '2021-09-11 07:28:15', '2021-09-11 07:28:15'),
(424, 'Pacific/Wake', '+12:00', 'UTC/GMT +12:00', '2021-09-11 06:28:15', '2021-09-11 06:28:15'),
(425, 'Pacific/Wallis', '+12:00', 'UTC/GMT +12:00', '2021-09-11 06:28:15', '2021-09-11 06:28:15'),
(426, 'UTC', '+00:00', 'UTC/GMT +00:00', '2021-09-10 18:28:15', '2021-09-10 18:28:15');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stripe_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_last_four` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `stripe_id`, `pm_type`, `pm_last_four`, `trial_ends_at`) VALUES
(1, 'Earl Parisian', 'rice.kassandra@example.org', '2021-09-10 18:27:45', '$2y$10$GvepQcybF.fI3WSmrzPMsO4FB6wuZraSwHqZcwXCRYSYorKs3uoSO', 'rglqH3K3NuY2B6QBJ1Y0TL7s6B2FsK0j1KKBVIahuzWr8NEZjaBc9cKMQAhS', '2021-09-10 18:27:48', '2021-09-13 17:12:41', 'cus_KDp2qmX73MuoDG', 'visa', '1111', NULL),
(2, 'Miss Aylin Kautzer Sr.', 'grace51@example.com', '2021-09-10 18:27:45', '$2y$10$vO/d2SanRQoO2DZGF62ryusSjhI5M4cOJxpoQ/uc68u62kXWSQezu', 'x6URvImFTL', '2021-09-10 18:27:48', '2021-09-10 18:27:48', NULL, NULL, NULL, NULL),
(3, 'Janae Emmerich', 'koch.carley@example.net', '2021-09-10 18:27:45', '$2y$10$EYB/BXM3iJOymudLD74VDuJv38qYvYx7X8Rmsj4w6ykttkwX.ijkK', 'r7z3p9ZxD9', '2021-09-10 18:27:48', '2021-09-10 18:27:48', NULL, NULL, NULL, NULL),
(4, 'Miss Neva Blick MD', 'tillman.zora@example.net', '2021-09-10 18:27:46', '$2y$10$pyFbTethxYc1wpm2wO8GYO8Bew5F4FIjrE6kG3.abj/WyOYhp9RZm', '5JyB3dC95N8v71j5eUYsP67lVS95Qri7fELXJHk2b4MqTjEnL3rqt9EauhDV', '2021-09-10 18:27:48', '2021-09-10 18:27:48', NULL, NULL, NULL, NULL),
(5, 'Ayana Tillman', 'shayna85@example.net', '2021-09-10 18:27:46', '$2y$10$WNY8OQ47461pwEDIU6arqePI8.ARYYYKHxmNvwmnEiaVI07x8cPuu', 'crTQ6yzBGu', '2021-09-10 18:27:48', '2021-09-10 18:27:48', NULL, NULL, NULL, NULL),
(6, 'Marques Hoppe', 'elisha.batz@example.com', '2021-09-10 18:27:46', '$2y$10$mQ08tohqpxYFCkHFnh72C.EojtKIwOzkO/PoMuzlgrYzTYk2NRPo2', 'GqMQHfb5By', '2021-09-10 18:27:48', '2021-09-10 18:27:48', NULL, NULL, NULL, NULL),
(7, 'Giovanna Abshire', 'qstroman@example.net', '2021-09-10 18:27:46', '$2y$10$mdHEIulNRyyq9SaEbRJFQOBwb4POTS/f2/fvHIQqtHX96QmKVWqua', 'SN6uk6Fj0F', '2021-09-10 18:27:48', '2021-09-10 18:27:48', NULL, NULL, NULL, NULL),
(8, 'Dr. Hermann Wintheiser PhD', 'greenholt.evans@example.com', '2021-09-10 18:27:46', '$2y$10$.wHpSFehUf1R9SHC5XtQ8efAJyurPgyJFlgO1/QXQk/dbGW81STVu', 'pzUO8hnPnj', '2021-09-10 18:27:48', '2021-09-10 18:27:48', NULL, NULL, NULL, NULL),
(9, 'Wilhelm McDermott', 'debert@example.net', '2021-09-10 18:27:46', '$2y$10$3fowntHYETzC8yfYlgukVuAO1kBM3gVvhHmeDg8L88ylwqRBo2Sd2', '7L8s5U6nHO', '2021-09-10 18:27:48', '2021-09-10 18:27:48', NULL, NULL, NULL, NULL),
(10, 'Prof. Prudence Hackett DDS', 'bode.anabelle@example.org', '2021-09-10 18:27:46', '$2y$10$6W/KOoUjGkYoH6R3nhat/uh3HCacq2VBCbNJ04ec4Qw8CW5Ci7kZm', '2V5YBVXDLD', '2021-09-10 18:27:48', '2021-09-10 18:27:48', NULL, NULL, NULL, NULL),
(11, 'Sonya Bailey', 'yhand@example.org', '2021-09-10 18:27:46', '$2y$10$Kc5zPqZu4yWUVrQJZulkmulh0amK0e88xghX4yWwX4OcuvwmpaipS', 'AQbztf8MpQ', '2021-09-10 18:27:48', '2021-09-10 18:27:48', NULL, NULL, NULL, NULL),
(12, 'Glennie Carroll', 'pschaden@example.com', '2021-09-10 18:27:46', '$2y$10$uIlKH9EOWL9Ul1Yad7OzQuHO96212MIyeShgGtMAxnTovb3G0hnqO', 'LsOjDCkyEg', '2021-09-10 18:27:48', '2021-09-10 18:27:48', NULL, NULL, NULL, NULL),
(13, 'Prof. Geo O\'Keefe', 'shane.wiza@example.com', '2021-09-10 18:27:47', '$2y$10$iA42FGz2i8Vob/UJOZX1R.31ACENivg7za74ACptxoUuzQNi8Eof6', 'WY3vEv9L9u', '2021-09-10 18:27:48', '2021-09-10 18:27:48', NULL, NULL, NULL, NULL),
(14, 'Kirstin Bins', 'wgrimes@example.com', '2021-09-10 18:27:47', '$2y$10$tYivciciL3/Y3ASpUYj1NOw94Uvc3CdpfS6tipXL727ywGCfmVPoa', 'RIOdwUTccn', '2021-09-10 18:27:48', '2021-09-10 18:27:48', NULL, NULL, NULL, NULL),
(15, 'Mr. Clovis Spencer DVM', 'iankunding@example.net', '2021-09-10 18:27:47', '$2y$10$sdvugfPhkV9O0VN8m719..ybzgXUbyTjTkPMlHsfh8.OmQJMnh/Hu', 'NcMqbPEgjy', '2021-09-10 18:27:48', '2021-09-10 18:27:48', NULL, NULL, NULL, NULL),
(16, 'Mrs. Gertrude Koch', 'vernie09@example.com', '2021-09-10 18:27:47', '$2y$10$DELheamM4YkjpVK35ElaSOlc9BR6cT0kwMgZIkZmMNFOxyTKW59Ry', 'Cd8AhLcVWK', '2021-09-10 18:27:48', '2021-09-10 18:27:48', NULL, NULL, NULL, NULL),
(17, 'Mr. Oren Koch DDS', 'fquitzon@example.org', '2021-09-10 18:27:47', '$2y$10$tjlmFgdrpLi8LjTTvn/xK.L1Sq2zgfYIWt9WJc3nLizGqW89Xvvzq', 'nsJSHMWD4g', '2021-09-10 18:27:48', '2021-09-10 18:27:48', NULL, NULL, NULL, NULL),
(18, 'Santiago Schoen', 'oberbrunner.hollis@example.net', '2021-09-10 18:27:47', '$2y$10$IZ2pwPwB/kWRVFqKjJfenuoljaGhVR/vpdpd6r5Sz3iDSK/AIw/46', 'dP90KUsWpL', '2021-09-10 18:27:48', '2021-09-10 18:27:48', NULL, NULL, NULL, NULL),
(19, 'Sasha Mante', 'crist.pat@example.com', '2021-09-10 18:27:47', '$2y$10$KANtvt2v7QyMxXytFPIo1OFmrTDe1Itm2c2nwezuN4b8J14R4EAO.', 'oq3qs9otb3', '2021-09-10 18:27:49', '2021-09-10 18:27:49', NULL, NULL, NULL, NULL),
(20, 'Prof. Matilda Runolfsdottir', 'enrico49@example.org', '2021-09-10 18:27:47', '$2y$10$MYPx/.HBBzUvJhTn96AMB.Hru0WZowSvZsaajHJeIFJwNI44XPD2y', 'EZue53sV3U', '2021-09-10 18:27:49', '2021-09-10 18:27:49', NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `organizations`
--
ALTER TABLE `organizations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plans_slug_unique` (`slug`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscriptions_stripe_id_unique` (`stripe_subscription_id`),
  ADD KEY `subscriptions_user_id_stripe_status_index` (`created_by`,`stripe_status`);

--
-- Indexes for table `timezones`
--
ALTER TABLE `timezones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_stripe_id_index` (`stripe_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banks`
--
ALTER TABLE `banks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `organizations`
--
ALTER TABLE `organizations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `timezones`
--
ALTER TABLE `timezones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=427;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
