-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2020 at 01:47 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `testapmnt`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `apmnt_id` int(10) NOT NULL,
  `date` varchar(20) NOT NULL,
  `time` varchar(10) NOT NULL,
  `patient_id` int(10) NOT NULL,
  `doctor_id` int(10) NOT NULL,
  `hospital_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`apmnt_id`, `date`, `time`, `patient_id`, `doctor_id`, `hospital_id`) VALUES
(202, '2020-04-29', '12.30p.m.', 301, 401, 501),
(203, '2020-05-06', '11.30a.m.', 303, 402, 501),
(204, '2020-04-19', '2.30p.m.', 302, 401, 501),
(205, '2020-04-20', '12.30p.m', 302, 401, 501),
(206, '2020-04-19', '2.30p.m.', 302, 402, 502),
(207, '2020-04-10', '1.30p.m.', 302, 401, 502),
(210, '2020-05-01', '10.30', 301, 401, 501),
(211, '2020-05-04', '6.10p.m.', 302, 401, 502);

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `doctor_id` int(10) NOT NULL,
  `doctor_nic` varchar(45) COLLATE utf8_bin NOT NULL,
  `doctor_fname` varchar(45) COLLATE utf8_bin NOT NULL,
  `doctor_lname` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `doctor_email` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `doctor_gender` varchar(45) COLLATE utf8_bin NOT NULL,
  `specialization` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `doctor_phone` varchar(45) COLLATE utf8_bin NOT NULL,
  `doctor_fee` decimal(10,2) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`doctor_id`, `doctor_nic`, `doctor_fname`, `doctor_lname`, `doctor_email`, `doctor_gender`, `specialization`, `doctor_phone`, `doctor_fee`, `user_id`) VALUES
(401, '7865542347v', 'Nimal', 'Hapuhewa', 'nimal@gmail.com', 'male', 'cardiologist', '0774630433', '2000.00', 1102),
(402, '957673038v', 'sadun', 'wanaguru', 'sadun@gmail.com', 'male', 'dermatologist', '0714565785', '3000.00', 1103),
(403, '746942146v', 'hansamalie', 'nirmala', 'hansamalie@gmail.com', 'female', 'anesthesiologist', '0770809877', '2500.00', 1106);

-- --------------------------------------------------------

--
-- Table structure for table `hospital`
--

CREATE TABLE `hospital` (
  `hospital_id` int(10) NOT NULL,
  `hospital_name` varchar(30) NOT NULL,
  `hospital_address` varchar(100) NOT NULL,
  `hospital_email` varchar(30) NOT NULL,
  `hospital_phone` varchar(12) NOT NULL,
  `hospital_charge` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hospital`
--

INSERT INTO `hospital` (`hospital_id`, `hospital_name`, `hospital_address`, `hospital_email`, `hospital_phone`, `hospital_charge`) VALUES
(501, 'Nawaloka', 'Nawoloka hospital,Colombo', 'nawaloka@gmail.com', '0112345678', '2000.00'),
(502, 'Hemas', 'Hemas Hospital,Colombo', 'hemas@gmail.com', '0119876543', '1500.00');

-- --------------------------------------------------------

--
-- Table structure for table `hospital_doctor`
--

CREATE TABLE `hospital_doctor` (
  `hospital_id` int(10) NOT NULL,
  `doctor_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hospital_doctor`
--

INSERT INTO `hospital_doctor` (`hospital_id`, `doctor_id`) VALUES
(501, 401),
(501, 402),
(501, 403),
(502, 401),
(502, 402),
(502, 403);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patient_id` int(10) NOT NULL,
  `patient_fname` varchar(30) NOT NULL,
  `patient_lname` varchar(30) NOT NULL,
  `patient_age` int(3) NOT NULL,
  `patient_gender` varchar(6) NOT NULL,
  `patient_email` varchar(30) NOT NULL,
  `patient_phone` varchar(12) NOT NULL,
  `patient_address` varchar(100) NOT NULL,
  `user_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patient_id`, `patient_fname`, `patient_lname`, `patient_age`, `patient_gender`, `patient_email`, `patient_phone`, `patient_address`, `user_id`) VALUES
(301, 'Kamal', 'Bandara', 31, 'male', 'kamal@gmail.com', '0771722188', '1,main strret,homagama', 1101),
(302, 'amal', 'nandasiri', 56, 'male', 'amal@yahoo.com', '0773551855', '02,cross street,kurunegala', 1104),
(303, 'kosala', 'nirmanie', 25, 'female', 'nirmaniekoshila@gmail.com', '0703351855', '4,jetty stree, beach road,negombo', 1105);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(10) NOT NULL,
  `cardType` varchar(30) NOT NULL,
  `cardNo` varchar(16) NOT NULL,
  `cardHolderName` varchar(30) NOT NULL,
  `expiryDate` date NOT NULL,
  `time` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `totalAmount` decimal(10,2) NOT NULL,
  `patient_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `cardType`, `cardNo`, `cardHolderName`, `expiryDate`, `time`, `date`, `totalAmount`, `patient_id`) VALUES
(601, 'credit', '1234567891234567', 'Kamal', '2022-07-14', '10.30a.m.', '2020-04-15', '3500.00', 301);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(10) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `user_pwd` varchar(8) NOT NULL,
  `user_type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `user_pwd`, `user_type`) VALUES
(1101, 'Kamal', '1234', 'regPatient'),
(1102, 'Nimal', '5678', 'regDoctor'),
(1103, 'sadun', '4561', 'regDoctor'),
(1104, 'amal', '1111', 'regPatient'),
(1105, 'kosala', '5555', 'regPatient'),
(1106, 'hansamalie', '977678', 'regDoctor');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`apmnt_id`),
  ADD KEY `fk_appoinment_doctor1` (`doctor_id`),
  ADD KEY `fk_appoinment_hospital1` (`hospital_id`),
  ADD KEY `fk_appoinment_patient1` (`patient_id`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doctor_id`),
  ADD KEY `fk_doctor_user1` (`user_id`);

--
-- Indexes for table `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`hospital_id`);

--
-- Indexes for table `hospital_doctor`
--
ALTER TABLE `hospital_doctor`
  ADD PRIMARY KEY (`hospital_id`,`doctor_id`),
  ADD KEY `fk_hospital_doctor_doctor1` (`doctor_id`),
  ADD KEY `fk_hospital_doctor_hospital1` (`hospital_id`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patient_id`),
  ADD KEY `fk_patient_user` (`user_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `fk_payment_patient` (`patient_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `apmnt_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=212;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `doctor_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=404;

--
-- AUTO_INCREMENT for table `hospital`
--
ALTER TABLE `hospital`
  MODIFY `hospital_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=503;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `patient_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=304;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=602;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1107;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `fk_appoinment_doctor1` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_appoinment_hospital1` FOREIGN KEY (`hospital_id`) REFERENCES `hospital` (`hospital_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_appoinment_patient1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `fk_doctor_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hospital_doctor`
--
ALTER TABLE `hospital_doctor`
  ADD CONSTRAINT `fk_hospital_doctor_doctor1` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_hospital_doctor_hospital1` FOREIGN KEY (`hospital_id`) REFERENCES `hospital` (`hospital_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `fk_patient_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `fk_payment_patient` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
