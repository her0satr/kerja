-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 11, 2014 at 07:19 PM
-- Server version: 5.1.41
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sygaas_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `absensi_kosong`
--

CREATE TABLE IF NOT EXISTS `absensi_kosong` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `biodata_id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `status_kosong` varchar(50) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `upload_file` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `absensi_kosong`
--


-- --------------------------------------------------------

--
-- Table structure for table `absensi_masuk`
--

CREATE TABLE IF NOT EXISTS `absensi_masuk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `biodata_id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `waktu_01` time NOT NULL,
  `status_01` varchar(50) NOT NULL,
  `waktu_02` time NOT NULL,
  `status_02` varchar(50) NOT NULL,
  `waktu_03` time NOT NULL,
  `status_03` varchar(50) NOT NULL,
  `waktu_04` time NOT NULL,
  `status_04` varchar(50) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `absensi_masuk`
--


-- --------------------------------------------------------

--
-- Table structure for table `agama`
--

CREATE TABLE IF NOT EXISTS `agama` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `agama`
--

INSERT INTO `agama` (`id`, `title`) VALUES
(1, 'Islam'),
(2, 'Kristen'),
(3, 'Protestan'),
(4, 'Hindu'),
(5, 'Budha'),
(6, 'Konghucu');

-- --------------------------------------------------------

--
-- Table structure for table `biodata`
--

CREATE TABLE IF NOT EXISTS `biodata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agama_id` int(11) NOT NULL,
  `status_perkawinan_id` int(11) NOT NULL,
  `jenis_kepegawaian_id` int(11) NOT NULL,
  `status_kepegawaian_id` int(11) NOT NULL,
  `nip` varchar(50) NOT NULL,
  `nama` varchar(150) NOT NULL,
  `kelamin` varchar(50) NOT NULL,
  `tempat_lahir` varchar(150) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `karpeg` varchar(50) NOT NULL,
  `kartu_nikah` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `biodata`
--

INSERT INTO `biodata` (`id`, `agama_id`, `status_perkawinan_id`, `jenis_kepegawaian_id`, `status_kepegawaian_id`, `nip`, `nama`, `kelamin`, `tempat_lahir`, `tanggal_lahir`, `karpeg`, `kartu_nikah`) VALUES
(2, 1, 2, 2, 2, '2', 'Namanya 2', 'Laki Laki', '4', '2014-03-05', '2014/03/11/20140311_190001_1854.png', '2014/03/11/20140311_190055_5799.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `biodata_detail`
--

CREATE TABLE IF NOT EXISTS `biodata_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `biodata_id` int(11) NOT NULL,
  `jabatan` varchar(50) NOT NULL,
  `pangkat` varchar(50) NOT NULL,
  `golongan_ruang` varchar(50) NOT NULL,
  `tmt_pangkat` varchar(50) NOT NULL,
  `tmt_masa_kerja` varchar(50) NOT NULL,
  `tmt_tahun` varchar(50) NOT NULL,
  `tmt_bulan` varchar(50) NOT NULL,
  `hp` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `cpns` varchar(50) NOT NULL,
  `pns` varchar(50) NOT NULL,
  `non_pns` varchar(50) NOT NULL,
  `unit_kerja` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `biodata_detail`
--


-- --------------------------------------------------------

--
-- Table structure for table `jenis_kegiatan`
--

CREATE TABLE IF NOT EXISTS `jenis_kegiatan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `biodata_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `jenis_kegiatan`
--


-- --------------------------------------------------------

--
-- Table structure for table `jenis_kepegawaian`
--

CREATE TABLE IF NOT EXISTS `jenis_kepegawaian` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `jenis_kepegawaian`
--

INSERT INTO `jenis_kepegawaian` (`id`, `title`) VALUES
(1, 'PNS Pusat'),
(2, 'PNS Daerah');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_skp`
--

CREATE TABLE IF NOT EXISTS `jenis_skp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `biodata_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `jenis_skp`
--


-- --------------------------------------------------------

--
-- Table structure for table `kegiatan_lain`
--

CREATE TABLE IF NOT EXISTS `kegiatan_lain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `biodata_id` int(11) NOT NULL,
  `jenis_kegiatan_id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `kegiatan_lain`
--


-- --------------------------------------------------------

--
-- Table structure for table `kegiatan_skp`
--

CREATE TABLE IF NOT EXISTS `kegiatan_skp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `biodata_id` int(11) NOT NULL,
  `jenis_skp_id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `kegiatan_skp`
--


-- --------------------------------------------------------

--
-- Table structure for table `riwayat_diklat`
--

CREATE TABLE IF NOT EXISTS `riwayat_diklat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `biodata_id` int(11) NOT NULL,
  `no_sertifikat` varchar(50) NOT NULL,
  `tahun` int(11) NOT NULL,
  `upload_file` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `riwayat_diklat`
--


-- --------------------------------------------------------

--
-- Table structure for table `riwayat_mutasi`
--

CREATE TABLE IF NOT EXISTS `riwayat_mutasi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `biodata_id` int(11) NOT NULL,
  `no_sk` varchar(50) NOT NULL,
  `tahun` int(11) NOT NULL,
  `upload_file` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `riwayat_mutasi`
--


-- --------------------------------------------------------

--
-- Table structure for table `riwayat_pendidikan`
--

CREATE TABLE IF NOT EXISTS `riwayat_pendidikan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `biodata_id` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `no_ijazah` varchar(50) NOT NULL,
  `upload_file` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `riwayat_pendidikan`
--


-- --------------------------------------------------------

--
-- Table structure for table `skpd`
--

CREATE TABLE IF NOT EXISTS `skpd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `skpd`
--

INSERT INTO `skpd` (`id`, `title`) VALUES
(9, 'Malang'),
(10, 'Bandung');

-- --------------------------------------------------------

--
-- Table structure for table `status_kepegawaian`
--

CREATE TABLE IF NOT EXISTS `status_kepegawaian` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `status_kepegawaian`
--

INSERT INTO `status_kepegawaian` (`id`, `title`) VALUES
(1, 'PNS'),
(2, 'CPNS'),
(3, 'Kontrak');

-- --------------------------------------------------------

--
-- Table structure for table `status_perkawinan`
--

CREATE TABLE IF NOT EXISTS `status_perkawinan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `status_perkawinan`
--

INSERT INTO `status_perkawinan` (`id`, `title`) VALUES
(1, 'Menikah'),
(2, 'Belum Menikah'),
(3, 'Duda / Janda');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_type_id` int(11) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `fullname` varchar(100) NOT NULL,
  `passwd` varchar(100) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `is_active` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `user_type_id`, `email`, `fullname`, `passwd`, `address`, `thumbnail`, `is_active`) VALUES
(2, 1, 'her0satr@yahoo.com', 'Herry', 'fe30fa79056939db8cbe99c8d601de74', '-', '2014/03/11/20140311_131431_5821.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

CREATE TABLE IF NOT EXISTS `user_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `user_type`
--

INSERT INTO `user_type` (`id`, `title`) VALUES
(1, 'Administrator'),
(2, 'Tata Usaha'),
(3, 'Pegawai');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
