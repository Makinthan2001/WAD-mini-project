-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 13, 2025 at 04:42 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online_exam`
--

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `status` enum('pending','finished') NOT NULL DEFAULT 'pending',
  `visibility` enum('visible','hide') NOT NULL DEFAULT 'visible'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exams`
--

INSERT INTO `exams` (`id`, `title`, `subject`, `created_by`, `status`, `visibility`) VALUES
(28, 'Exam-1', 'java', 1, 'finished', 'hide'),
(29, 'Exam-2', 'php', 1, 'finished', 'hide'),
(40, 'exam4 ', 'gk', 1, 'finished', 'hide');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `exam_id` int(11) DEFAULT NULL,
  `question_text` text DEFAULT NULL,
  `option1` varchar(255) DEFAULT NULL,
  `option2` varchar(255) DEFAULT NULL,
  `option3` varchar(255) DEFAULT NULL,
  `option4` varchar(255) DEFAULT NULL,
  `correct_option` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `exam_id`, `question_text`, `option1`, `option2`, `option3`, `option4`, `correct_option`) VALUES
(48, 28, 'Which of the following is the correct syntax to print \"Hello World\" in Java?', 'System.out.println(\"Hello World\");', 'print(\"Hello World\");', 'echo(\"Hello World\");', 'Console.WriteLine(\"Hello World\");', 1),
(49, 28, 'What is the default value of an int variable in Java (instance variable)?', '0', 'null', 'undefined', 'NaN', 1),
(50, 28, ' Which of these is a valid data type in Java?', 'integer', 'String', 'real', 'num', 2),
(51, 28, 'Which keyword is used to create an object in Java?', 'new', 'create', 'object', 'make', 1),
(52, 28, 'Which method is the entry point for a Java application?', 'start()', 'main()', 'init()', 'run()', 2),
(53, 29, 'Which symbol is used to start a variable in PHP?', '%', '$ ', '# ', '@', 2),
(54, 29, 'Which function is used to display output in PHP?', 'print()', 'echo ', ' Both A and B', 'display()', 3),
(55, 29, 'What is the correct way to start a PHP block?', '<php>', '<?php', '<?', '<%php', 2),
(60, 29, 'What will strlen(\"Hello\") return in PHP?', '4', '5', 'Error', '6', 2),
(61, 29, 'Which superglobal variable is used to collect form data sent via POST method?\r\n', '$_POST', '$_GET', '$_FORM', '$_REQUEST', 1),
(64, 40, 'addition 1+1', '4', '2', '3', '5', 2),
(65, 40, 'subtraction 2-1', '2', '3', '1', '6', 3);

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `exam_id` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `results`
--

INSERT INTO `results` (`id`, `user_id`, `exam_id`, `score`, `created_at`) VALUES
(53, 11, 28, 1, '2025-08-10 17:56:18'),
(56, 2, 28, 5, '2025-08-11 00:50:23'),
(58, 19, 28, 2, '2025-08-11 00:51:05'),
(60, 20, 28, 3, '2025-08-11 00:51:47'),
(62, 21, 28, 3, '2025-08-11 00:52:22'),
(64, 22, 28, 4, '2025-08-11 00:53:03'),
(67, 11, 29, 2, '2025-08-11 03:06:17');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` enum('student','admin') DEFAULT 'student',
  `status` enum('active','disable') NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `status`) VALUES
(1, 'Admin User', 'admin@gmail.com', '$2y$10$gyRXc1z.ew6hH0IGwzvXZOK3jJBVn7gwbG5xNZf.tCkuKnK4CqaO.', 'admin', 'active'),
(2, 'madhan', 'mahinthan2001a@gmail.com', '$2y$10$u6OkteCJSW1wg.OmxmnUlOh0MmdgDT2Lz2jdkp9PBk6iqUhMkE0FO', 'student', 'disable'),
(11, 'madhan', 'madhan2001ana@gmail.com', '$2y$10$/TbV1Hl9Ktwg7Xy9cUCuceiHyqoBDXHD0IbJ2sz.dLp8BR1ZbkuO6', 'student', 'active'),
(19, 'lavakeesan', 'lavakeesan@gmail.com', '$2y$10$3oOKRcttSSswFU35TlObmeGlVwePBEIb19krxy3wY4yKaOdU4jamO', 'student', 'active'),
(20, 'abinath', 'abinath@gmail.com', '$2y$10$5O74yW8ZohFxy8XXLNKN7udRxdU3jbBX7bJw.nfqqN5rf6T26iSTy', 'student', 'active'),
(21, 'arultharshan', 'arultharshan@gmail.com', '$2y$10$iljKFbTWEUjUMAZBE39OTesi9Jq/Ktzh8seJbsDAJ8FUMhKE/7qga', 'student', 'active'),
(22, 'oshada', 'oshada@gmail.com', '$2y$10$Hm6LF.RQzlIv/1JzYPWdH.2.dSEIAgXrSI6Ix0BJQqVy6vFSwSZga', 'student', 'active'),
(24, 'gopeeshan', 'gopee@gmail.com', '$2y$10$7WEnArUn8iv.2kSPWe01mOf1stfxzkH3olGar6RcGSoC2G22.nmLC', 'student', 'active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_id` (`exam_id`);

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user_exam` (`user_id`,`exam_id`),
  ADD KEY `exam_id` (`exam_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `results`
--
ALTER TABLE `results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `exams`
--
ALTER TABLE `exams`
  ADD CONSTRAINT `exams_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `results`
--
ALTER TABLE `results`
  ADD CONSTRAINT `results_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `results_ibfk_2` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
