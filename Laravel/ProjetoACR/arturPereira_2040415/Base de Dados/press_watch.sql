-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 27, 2020 at 02:18 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `press_watch`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `description`, `created_at`) VALUES
(2, 'artur', 'arturpe95@gmail.com', 'So para confirmar que a mensagem está a funcionar e o professor vai me dar 20 porque ninguem se deve ter dado ao trabalho de meter isto a funcionar, a ideia inicial era meter a enviar um email mas assim é mais simples o admin vai a BD e ve a mensagem.', '2020-12-27 00:24:27');

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
-- Table structure for table `genders`
--

CREATE TABLE `genders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `genders`
--

INSERT INTO `genders` (`id`, `name`) VALUES
(1, 'Action'),
(2, 'Comedy'),
(3, 'Drama'),
(4, 'Fantasy'),
(5, 'Horror'),
(6, 'Mystery'),
(7, 'Romance'),
(8, 'Thriller');

-- --------------------------------------------------------

--
-- Table structure for table `gender_movies`
--

CREATE TABLE `gender_movies` (
  `movie_id` bigint(20) UNSIGNED NOT NULL,
  `gender_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gender_movies`
--

INSERT INTO `gender_movies` (`movie_id`, `gender_id`) VALUES
(3, 3),
(3, 4),
(2, 1),
(2, 4),
(3, 2),
(4, 2),
(5, 1),
(5, 4),
(6, 1),
(6, 3),
(7, 1),
(7, 4),
(8, 1),
(8, 3),
(9, 1),
(9, 4),
(9, 6),
(10, 7),
(10, 1),
(10, 8),
(17, 6),
(17, 3),
(17, 4),
(3, 7),
(18, 2);

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_12_14_205650_genders', 1),
(5, '2020_12_14_205650_movies', 1),
(6, '2020_12_22_144134_create_roles_table', 1),
(7, '2020_12_22_144234_create_gender_movies_table', 1),
(8, '2020_12_22_144234_create_role_users_table', 1),
(9, '2020_12_14_205650_contacts', 2);

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int(11) NOT NULL,
  `release_year` year(4) NOT NULL,
  `movie_img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `movie_trailer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `name`, `rating`, `release_year`, `movie_img`, `description`, `movie_trailer`) VALUES
(2, 'Batman: O Cavaleiro das Trevas', 6, 2009, 'https://upload.wikimedia.org/wikipedia/pt/thumb/d/d1/The_Dark_Knight.jpg/250px-The_Dark_Knight.jpg', 'Quando a ameaça conhecida como o Joker causa estragos e caos sobre o povo de Gotham , o Cavaleiro das Trevas deve chegar a um acordo com um dos maiores testes psicológicos, a sua capacidade de lutar contra a injustiça', 'https://www.youtube.com/embed/a-PVBsmiB0Y'),
(3, 'Borat: Subsequent Moviefilm', 6, 2020, 'https://images-na.ssl-images-amazon.com/images/I/91By26xxHeL._RI_.jpg', 'Sequência do longa de sucesso Borat - O Segundo Melhor Repórter do Glorioso País Cazaquistão Viaja à América. O longa foi filmado na quarentena e conta mais uma história do icônico jornalista do Cazaquistão.', 'https://www.youtube.com/embed/HOwaypo3jC4'),
(4, 'Deadpool 2', 7, 2018, 'https://s7movie.com/storage/posts/May2019/QqdT2dZtUurv9dSQZh46.jpg', 'O mercenário mutante Foul-mouthed Wade Wilson (AKA. Deadpool), reúne uma equipe de colegas mutantes para proteger um menino com habilidades sobrenaturais do cyborg brutal e viajante do tempo, Cable.', 'https://www.youtube.com/embed/D86RtevtfrA'),
(5, 'Velocidade Furiosa 8', 6, 2017, 'https://mb.web.sapo.io/e94380c79e61171bd9891c0563bf95d57e2e4d13.jpg', 'Agora que Dom e Letty estão em lua-de-mel, e Brian e Mia afastaram-se e o resto do grupo foi exonerado, a equipa que corre o mundo encontrou algo semelhante a uma vida normal. Porém, quando uma misteriosa mulher seduz Dom para o mundo do crime, do qual pa', 'https://www.youtube.com/embed/Uem6VTKNnhc'),
(6, 'Joker', 9, 2019, 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSNRMy27b5icsvx1Amy3XAufQdqIFLimt7nuxCiIxhZ5IUZIvuW', 'Arthur Fleck é um homem que enfrenta a crueldade e o desprezo da sociedade, juntamente com a indiferença de um sistema que lhe permite passar da vulnerabilidade para a depravação. Durante o dia é um palhaço e à noite luta para se tornar um artista de stan', 'https://www.youtube.com/embed/zAGVQLHvwOY'),
(7, 'Vingadores: Guerra do Infinito', 8, 2018, 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcR0puCN49GDPSTTzbKbXGvj6ZmbyYpj5wI8gGxUC0vRqqkjJXBf', 'Homem de Ferro, Thor, Hulk e os Vingadores se reunem para combater o seu inimigo mais poderoso, o maligno Thanos. Em uma missão para obter todas as seis pedras infinitas, Thanos planeia usá-las para infligir a sua vontade maléfica sobre a realidade.', ''),
(8, 'O Padrinho', 9, 1972, 'https://m.media-amazon.com/images/M/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg', 'O patriarca de uma dinastia de crime organizado transfere o controlo do crime do seu império clandestino para seu filho relutante.', 'https://www.youtube.com/embed/sY1S34973zA'),
(9, 'O Senhor dos Anéis - O Regresso do Rei', 9, 2003, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRy7DZZXsbe4eHOeV2kZQH4q4jZx2pqELDaB_aAu-FCALwaMive', 'A batalha pela Terra-Média começou. Frodo e Sam, guiados por Gollum, continuam a sua perigosa missão em direcção aos fogos da Montanha da Condenação, para destruírem o Anel. Aragorn luta para cumprir o seu legado, enquanto lidera os seus seguidores contra', 'https://www.youtube.com/embed/GbR_udDNldI'),
(10, 'Tempo de Violência', 9, 1994, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgdnAx4RcqdeSRes2ziir-xst2CwO0G99WDZHHTe1a3bQzlsxw', 'Vincent Vega (John Travolta) e Jules Winnfield (Samuel L. Jackson) são dois assassinos profissionais trabalham fazendo cobranças para Marsellus Wallace (Ving Rhames), um poderosos gângster. Vega é forçado a sair com a garota do chefe, temendo passar dos l', 'https://www.youtube.com/embed/s7EdQ4FqbhY'),
(17, 'Harry Potter and the Sorcerers Stone', 8, 2001, 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSdwVoOmEiNcnFvB8Qcvp3UkKyNMLr6b1nZZBgdqKqUmp_QdX6r', 'Harry Potter um órfão que descobre que os seus pais eram feiticeiros e que ele também possui poderes mágicos. Harry Potter passou a maior parte do seu tempo debaixo da escada na casa dos Dursleys, seus tios que não gostam dele. Porém, quando é convidado para estudar na Escola de Feitiços e Magia Hogwart', 'https://www.youtube.com/embed/VyHV0BRtdxo'),
(18, 'Teste', 10, 2020, '/storage/movies/prod_1609027173.jpg', 'So para confirmar que ta a funcionar introduzindo a foto', 'Sem Trailer');

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
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'User', NULL, NULL),
(2, 'Admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_users`
--

CREATE TABLE `role_users` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_users`
--

INSERT INTO `role_users` (`user_id`, `role_id`) VALUES
(1, 2),
(9, 1);

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
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'arturpe95@gmail.com', NULL, '$2y$10$EK/PJHVWpIV8HPYO5k38JOd.VBKzeilQ65Hv50Tu3M/j17KBlJrda', NULL, '2020-12-25 12:38:01', '2020-12-25 12:38:01'),
(9, 'userTeste', 'artolas_12@hotmail.com', NULL, '$2y$10$1temosiHCGWBaI.U0OdkI.D.jKqV7WHTzACIMlIWYOIvxaJZKBmr6', NULL, '2020-12-26 00:56:50', '2020-12-26 00:56:50');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `contacts_id_unique` (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `genders`
--
ALTER TABLE `genders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `genders_id_unique` (`id`);

--
-- Indexes for table `gender_movies`
--
ALTER TABLE `gender_movies`
  ADD KEY `gender_movies_movie_id_foreign` (`movie_id`),
  ADD KEY `gender_movies_gender_id_foreign` (`gender_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `movies_id_unique` (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_users`
--
ALTER TABLE `role_users`
  ADD KEY `role_users_user_id_foreign` (`user_id`),
  ADD KEY `role_users_role_id_foreign` (`role_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `genders`
--
ALTER TABLE `genders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `gender_movies`
--
ALTER TABLE `gender_movies`
  ADD CONSTRAINT `gender_movies_gender_id_foreign` FOREIGN KEY (`gender_id`) REFERENCES `genders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `gender_movies_movie_id_foreign` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_users`
--
ALTER TABLE `role_users`
  ADD CONSTRAINT `role_users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
