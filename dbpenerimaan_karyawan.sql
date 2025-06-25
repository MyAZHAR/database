-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2025 at 08:57 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbpenerimaan_karyawan`
--

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `nip` char(8) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `id_satuan_kerja` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`nip`, `nama`, `id_satuan_kerja`) VALUES
('10001', 'budi', 1),
('10021', 'faiz', 3),
('10032', 'dewi', 2),
('10044', 'dona', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pengajuan`
--

CREATE TABLE `pengajuan` (
  `id` int(11) NOT NULL,
  `nip` char(8) NOT NULL,
  `tanggal_awal` date NOT NULL,
  `tanggal_akhir` date NOT NULL,
  `status` enum('diterima','ditolak') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `pengajuan`
--

INSERT INTO `pengajuan` (`id`, `nip`, `tanggal_awal`, `tanggal_akhir`, `status`) VALUES
(1, '10001', '2020-01-01', '2020-01-03', 'ditolak'),
(2, '10001', '2020-01-15', '2020-01-17', 'diterima'),
(3, '10001', '2020-01-20', '2020-01-24', 'diterima'),
(4, '10001', '2020-02-03', '2020-02-04', 'ditolak'),
(5, '10001', '2020-03-08', '2020-03-10', 'ditolak'),
(6, '10001', '2020-04-05', '2020-04-05', 'diterima'),
(7, '10032', '2020-01-02', '2020-01-02', 'diterima'),
(8, '10032', '2020-02-04', '2020-02-07', 'diterima'),
(9, '10032', '2020-03-05', '2020-03-10', 'ditolak'),
(10, '10044', '2020-04-04', '2020-04-05', 'diterima'),
(11, '10021', '2020-02-17', '2020-02-19', 'ditolak'),
(12, '10021', '2020-03-23', '2020-03-28', 'diterima');

-- --------------------------------------------------------

--
-- Table structure for table `satuan_kerja`
--

CREATE TABLE `satuan_kerja` (
  `id` int(11) NOT NULL,
  `satuan_kerja` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `satuan_kerja`
--

INSERT INTO `satuan_kerja` (`id`, `satuan_kerja`) VALUES
(1, 'biro umum'),
(2, 'biro kepegawaian'),
(3, 'biro administrasi');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`nip`),
  ADD KEY `fk_karyawan_satuan_kerja1_idx` (`id_satuan_kerja`);

--
-- Indexes for table `pengajuan`
--
ALTER TABLE `pengajuan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pengajuan_karyawan_idx` (`nip`);

--
-- Indexes for table `satuan_kerja`
--
ALTER TABLE `satuan_kerja`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pengajuan`
--
ALTER TABLE `pengajuan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `satuan_kerja`
--
ALTER TABLE `satuan_kerja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD CONSTRAINT `fk_karyawan_satuan_kerja1` FOREIGN KEY (`id_satuan_kerja`) REFERENCES `satuan_kerja` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `pengajuan`
--
ALTER TABLE `pengajuan`
  ADD CONSTRAINT `fk_pengajuan_karyawan` FOREIGN KEY (`nip`) REFERENCES `karyawan` (`nip`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
