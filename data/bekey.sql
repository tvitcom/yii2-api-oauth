-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Май 12 2020 г., 02:19
-- Версия сервера: 10.1.44-MariaDB-0ubuntu0.18.04.1
-- Версия PHP: 7.2.30-1+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `bekey`
--

-- --------------------------------------------------------

--
-- Структура таблицы `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1589236323),
('m130524_201442_init', 1589236328),
('m190124_110200_add_verification_token_column_to_user_table', 1589236329);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `verification_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`, `verification_token`) VALUES
(1, 'admin', 'admin', '$2y$13$7IMZULwF3Ii1aRs3bOdpReFUAGWSjELI1JmCumAZBqqx/HqSKKNki', 'adminreset', 'admin@mai.ruru', 10, 12342521, 123512351, 'admintocken');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(21) UNSIGNED NOT NULL,
  `name` varchar(24) NOT NULL,
  `email` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  `status` varchar(12) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `status`) VALUES
(0, 'Admin', 'admin@mail.ruru', 'savepasswords!234', 'one'),
(1, 'Admin0', 'admin0@mail.ruru', 'savepasswords!234', 'five'),
(2, 'Moderator', 'moderator@mail.ruru', 'passwords!123', 'one'),
(3, 'Admin3', 'admin3@mail.ruru', 'savepasswords!234', 'four'),
(4, 'Admin1', 'admin1@mail.ruru', 'savepasswords!234', 'one'),
(5, 'Moderator1', 'moderator1@mail.ruru', 'passwords!123', 'one'),
(6, 'Admin4', 'admin4@mail.ruru', 'savepasswords!234', 'one'),
(7, 'Moderator11', 'moderator2@mail.ruru', 'passwords!123', 'one'),
(8, 'Admin5', 'admin5@mail.ruru', 'savepasswords!234', 'one'),
(9, 'Admin6', 'admin6@mail.ruru', 'savepasswords!234', 'two'),
(10, 'Moderator111', 'moderator3@mail.ruru', 'passwords!123', 'one'),
(11, 'Admin7', 'admin7@mail.ruru', 'savepasswords!234', 'one'),
(12, 'Admin8', 'admin8@mail.ruru', 'savepasswords!234', 'zero'),
(13, 'Moderator4', 'moderator4@mail.ruru', 'passwords!123', 'one'),
(14, 'Admin9', 'admin9@mail.ruru', 'savepasswords!234', 'two'),
(15, 'Admin10', 'admin10@mail.ruru', 'savepasswords!234', 'one'),
(16, 'Moderator5', 'moderator5@mail.ruru', 'passwords!123', 'four'),
(17, 'Admin11', 'admin11@mail.ruru', 'savepasswords!234', 'one'),
(18, 'Admin12', 'admin12@mail.ruru', 'savepasswords!234', 'one'),
(19, 'Moderator6', 'moderator6@mail.ruru', 'passwords!123', 'one'),
(20, 'Admin13', 'admin13@mail.ruru', 'savepasswords!234', 'five'),
(21, 'Admin14', 'admin14@mail.ruru', 'savepasswords!234', 'one'),
(22, 'Moderator7', 'moderator7@mail.ruru', 'passwords!123', 'one'),
(23, 'Admin15', 'admin15@mail.ruru', 'savepasswords!234', 'three'),
(24, 'Admin16', 'admin16@mail.ruru', 'savepasswords!234', 'one'),
(25, 'Moderator8', 'moderato8r@mail.ruru', 'passwords!123', 'one'),
(26, 'Moderator9', 'moderator9@mail.ruru', 'passwords!123', 'adm');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
