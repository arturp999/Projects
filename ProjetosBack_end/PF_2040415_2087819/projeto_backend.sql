
CREATE DATABASE projeto_backend;
USE projeto_backend;

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `img_original_name` varchar(255) DEFAULT NULL,
  `img_location` varchar(255) DEFAULT NULL,
  `img_filename` varchar(255) DEFAULT NULL,
  `user_img_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `img_original_name`, `img_location`, `img_filename`, `user_img_id`) VALUES
(18, '2jnjs0.jpg', 'public\\images\\1592244534208-2jnjs0.jpg', '1592244534208-2jnjs0.jpg', 7),
(19, '3b4f55f606f04ed5300d1bcf589c010e.jpg', 'public\\images\\1592244534209-3b4f55f606f04ed5300d1bcf589c010e.jpg', '1592244534209-3b4f55f606f04ed5300d1bcf589c010e.jpg', 7),
(20, '089.jpg', 'public\\images\\1592244534210-089.jpg', '1592244534210-089.jpg', 7),
(21, '747083_b400ff589ebf474083386cff48221e9d_mv2.jpg', 'public\\images\\1592244534210-747083_b400ff589ebf474083386cff48221e9d_mv2.jpg', '1592244534210-747083_b400ff589ebf474083386cff48221e9d_mv2.jpg', 7),
(22, 'download.jpg', 'public\\images\\1592244534211-download.jpg', '1592244534211-download.jpg', 7);

-- --------------------------------------------------------

--
-- Table structure for table `uploaders`
--

CREATE TABLE `uploaders` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `uploaders`
--

INSERT INTO `uploaders` (`id`, `email`, `password`) VALUES
(2, 'admin', 'jaunnn'),
(3, 'user123', 'user1212341'),
(4, 'artur', 'joao'),
(6, 'jaunnn@lul.com', 'jaunnn'),
(7, 'a', 'a');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_img_id` (`user_img_id`);

--
-- Indexes for table `uploaders`
--
ALTER TABLE `uploaders`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `uploaders`
--
ALTER TABLE `uploaders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_ibfk_1` FOREIGN KEY (`user_img_id`) REFERENCES `uploaders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
