-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 09, 2020 at 09:22 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_perusahaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `gaji`
--

CREATE TABLE `gaji` (
  `id_gaji` int(11) NOT NULL,
  `id_pegawai` varchar(10) NOT NULL,
  `jumlah_anak` int(11) NOT NULL,
  `total_gaji` double NOT NULL,
  `tgl_input` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gaji`
--

INSERT INTO `gaji` (`id_gaji`, `id_pegawai`, `jumlah_anak`, `total_gaji`, `tgl_input`) VALUES
(12, 'P01', 0, 8000000, '2020-06-25 18:16:52');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `locationid` int(11) NOT NULL,
  `latitude` varchar(50) NOT NULL,
  `longitude` varchar(50) NOT NULL,
  `locationName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`locationid`, `latitude`, `longitude`, `locationName`) VALUES
(1, '-0.848534', '100.361166', 'Cabang pusat'),
(2, '-0.898883', '100.351461', 'Cabang UNP'),
(3, '-0.939808', '100.384397', 'Cabang andalas'),
(4, '-0.959378', '100.359209', 'Cabang pondok'),
(5, '-0.943740', '100.354356', 'Cabang purus');

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `id_pegawai` varchar(11) NOT NULL,
  `bagian` varchar(25) NOT NULL,
  `nama` varchar(75) NOT NULL,
  `jekel` varchar(15) NOT NULL,
  `tgl_lahir` varchar(10) NOT NULL,
  `daerah_asal` varchar(20) NOT NULL,
  `status` varchar(10) NOT NULL,
  `foto` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`id_pegawai`, `bagian`, `nama`, `jekel`, `tgl_lahir`, `daerah_asal`, `status`, `foto`) VALUES
('P01', 'Surveyor', 'Beni', 'Laki-laki', '06-06-2000', 'Padang', 'Single', 'https://avatars0.githubusercontent.com/u/67430854?s=460&u=8952f75a76646bf897747ba61df0fdb51e5b6f97&v=4'),
('P02', 'Accounting', 'beni', 'Laki-laki', '06-06-2000', 'Padang', 'Status', 'https://avatars0.githubusercontent.com/u/67430854?s=460&u=8952f75a76646bf897747ba61df0fdb51e5b6f97&v=4');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL,
  `harga` int(11) NOT NULL,
  `gambar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `nama`, `deskripsi`, `harga`, `gambar`) VALUES
(1, 'Ram Gskill TridentZ neo RGB 32GB', 'Memory Type\r\nDDR4\r\nCapacity\r\n32GB (8GBx4)\r\nMulti-Channel Kit\r\nDual/Quad Channel Kit\r\nTested Speed\r\n3200MHz', 3199000, 'https://www.gskill.com/_upload/images/156283885813.png'),
(2, 'Processor AMD Ryzen 9 3950x', '# of CPU Cores\r\n16\r\n# of Threads\r\n32\r\nBase Clock\r\n3.5GHz\r\nMax Boost Clock \r\nUp to 4.7GHz\r\nTotal L1 Cache\r\n1MB\r\nTotal L2 Cache\r\n8MB\r\nTotal L3 Cache\r\n64MB\r\nUnlocked \r\nYes\r\nCMOS\r\nTSMC 7nm FinFET', 12999000, 'https://www.amd.com/system/files/styles/496px/private/2019-11/312735--ryzen-3950x-pib-left-facing-wof-1260x709.png?itok=tdx79EeF'),
(3, 'SSD AORUS NVMe Gen4 SSD 1TB', 'Form Factor: M.2 2280\r\nInterface: PCI-Express 4.0 x4, NVMe 1.3\r\nTotal Capacity: 1000GB*\r\nSequential Read Speed : up to 5000 MB/s**\r\nSequential Write speed : up to 4400 MB/s**', 4300000, 'https://static.gigabyte.com/Product/54/6925/2019052810574348cf755f2ad9f73507df92358db6a2530f_m.png'),
(4, 'PSU Seasonic Prime Ultra Titanium 750w', '80 PLUS Titanium certified\r\nMicro Tolerance Load Regulation (0.5 %)\r\nCable-free Connection Design\r\nPremium Hybrid Fan Control - Fanless until 40 % load\r\nMulti-GPU setup\r\nGold plated connectors\r\n12 years warranty', 2940000, 'https://outervision.com/img/articles/psu/2017/Seasonic/SSR-650TD/seasonic-prime-650-titanium-1.jpg'),
(5, 'Motherboard ROG X750 Crosshair VIII Hero', 'AMD Ryzen processors and up to two M.2 drives, USB 3.2?Gen2,?and AMD?StoreMI?to maximize connectivity and speed, Comprehensive thermal design: Active PCH heatsink, M.2 aluminum heatsink and ROG Cooling Zone.', 11499000, 'https://www.asus.com/media/global/products/et5ltylSSHb6bOGK/P_setting_000_1_90_end_500.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gaji`
--
ALTER TABLE `gaji`
  ADD PRIMARY KEY (`id_gaji`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`locationid`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gaji`
--
ALTER TABLE `gaji`
  MODIFY `id_gaji` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `gaji`
--
ALTER TABLE `gaji`
  ADD CONSTRAINT `gaji_ibfk_1` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
