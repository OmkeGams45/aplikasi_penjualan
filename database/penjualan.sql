-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 06, 2026 at 08:57 AM
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
-- Database: `penjualan`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `kd_barang` varchar(10) NOT NULL,
  `nm_barang` varchar(100) NOT NULL,
  `jenis_barang` varchar(50) NOT NULL,
  `hg_jual` int(11) NOT NULL,
  `hg_beli` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`kd_barang`, `nm_barang`, `jenis_barang`, `hg_jual`, `hg_beli`) VALUES
('123', 'SuperStar', 'Makanan', 2500, 1800),
('125', 'Sukro', 'Makanan', 3000, 2500),
('126', 'Teh Pucuk', 'Minuman', 4000, 3000),
('127', 'Pepsi', 'Minuman', 3500, 2800);

-- --------------------------------------------------------

--
-- Table structure for table `isi`
--

CREATE TABLE `isi` (
  `idnota` varchar(15) NOT NULL,
  `kd_brg` varchar(10) NOT NULL,
  `hb` int(11) NOT NULL,
  `hj` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `isi`
--

INSERT INTO `isi` (`idnota`, `kd_brg`, `hb`, `hj`, `qty`) VALUES
('IN0002', '126', 4000, 3000, 4),
('IN0002', '123', 2500, 1800, 12),
('IN0003', '127', 3500, 2800, 3),
('IN0003', '126', 4000, 3000, 2),
('IN0003', '125', 3000, 2500, 12);

-- --------------------------------------------------------

--
-- Table structure for table `kasir`
--

CREATE TABLE `kasir` (
  `id_kasir` varchar(10) NOT NULL,
  `nm_kasir` varchar(100) NOT NULL,
  `jenis_kelamin` varchar(15) NOT NULL,
  `no_telepon` varchar(15) NOT NULL,
  `agama` varchar(15) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kasir`
--

INSERT INTO `kasir` (`id_kasir`, `nm_kasir`, `jenis_kelamin`, `no_telepon`, `agama`, `alamat`, `password`) VALUES
('123', 'Udin ', 'Laki - Laki', '0812345', 'Islam', 'Jakarta Tenggara', '1234567'),
('124', 'Siska', 'Perempuan', '0854321', 'Kristen', 'Jakarta Tengah', '98765'),
('125', 'Kanda', 'Laki - Laki', '081232', 'Islam', 'Jomborr ', '4321');

-- --------------------------------------------------------

--
-- Table structure for table `nota`
--

CREATE TABLE `nota` (
  `idnota` varchar(15) NOT NULL,
  `tglnota` date NOT NULL,
  `id_pelanggan` varchar(6) NOT NULL,
  `id_kasir` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nota`
--

INSERT INTO `nota` (`idnota`, `tglnota`, `id_pelanggan`, `id_kasir`) VALUES
('IN0002', '2026-06-24', '125', '124'),
('IN0003', '2026-07-06', '003', '123');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id` varchar(6) NOT NULL,
  `nmplg` varchar(25) NOT NULL,
  `jenis` varchar(20) NOT NULL,
  `telepon` varchar(20) NOT NULL,
  `alamat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id`, `nmplg`, `jenis`, `telepon`, `alamat`) VALUES
('003', 'Nasir Putra', 'Laki - Laki', '0888', 'Bandungan Timur'),
('123', 'Udin', 'Laki - Laki', '081234', 'Jakarta Tenggara'),
('125', 'Budi Santoso', 'Laki - Laki', '089999', 'Jakarta Selatan');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`kd_barang`);

--
-- Indexes for table `isi`
--
ALTER TABLE `isi`
  ADD KEY `idx_idnota` (`idnota`),
  ADD KEY `idx_kd_brg` (`kd_brg`);

--
-- Indexes for table `kasir`
--
ALTER TABLE `kasir`
  ADD PRIMARY KEY (`id_kasir`);

--
-- Indexes for table `nota`
--
ALTER TABLE `nota`
  ADD PRIMARY KEY (`idnota`),
  ADD KEY `idx_id_pelanggan` (`id_pelanggan`),
  ADD KEY `idx_id_kasir` (`id_kasir`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `isi`
--
ALTER TABLE `isi`
  ADD CONSTRAINT `fk_isi_barang` FOREIGN KEY (`kd_brg`) REFERENCES `barang` (`kd_barang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_isi_nota` FOREIGN KEY (`idnota`) REFERENCES `nota` (`idnota`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `nota`
--
ALTER TABLE `nota`
  ADD CONSTRAINT `fk_nota_kasir` FOREIGN KEY (`id_kasir`) REFERENCES `kasir` (`id_kasir`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_nota_pelanggan` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
