-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 17, 2014 at 03:57 PM
-- Server version: 5.5.32
-- PHP Version: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sygaas_db`
--
CREATE DATABASE IF NOT EXISTS `sygaas_db` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `sygaas_db`;

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `absensi_kosong`
--

INSERT INTO `absensi_kosong` (`id`, `biodata_id`, `tanggal`, `status_kosong`, `keterangan`, `upload_file`) VALUES
(2, 3, '2014-03-14', 'Cuti', '123 55', '2014/03/13/20140313_134928_8276.png'),
(4, 4, '2014-03-18', 'Ijin', 'Ijin saja', '');

-- --------------------------------------------------------

--
-- Table structure for table `absensi_masuk`
--

CREATE TABLE IF NOT EXISTS `absensi_masuk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `biodata_id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `label` varchar(50) NOT NULL,
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `absensi_masuk`
--

INSERT INTO `absensi_masuk` (`id`, `biodata_id`, `tanggal`, `label`, `waktu_01`, `status_01`, `waktu_02`, `status_02`, `waktu_03`, `status_03`, `waktu_04`, `status_04`, `keterangan`) VALUES
(1, 3, '2014-03-13', 'Tepat Waktu', '11:55:43', '', '12:26:52', '', '13:00:00', '', '15:00:00', '', '--'),
(2, 2, '2014-03-14', 'Tepat Waktu', '09:54:06', '', '00:00:00', '', '00:00:00', '', '00:00:00', '', ''),
(3, 4, '2014-03-17', 'Tepat Waktu', '15:01:14', '', '00:00:00', '', '15:19:09', '', '15:19:07', '', ''),
(4, 4, '2014-03-18', 'Tepat Waktu', '08:01:46', '', '00:00:00', '', '15:19:10', '', '15:19:08', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `agama`
--

CREATE TABLE IF NOT EXISTS `agama` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

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
-- Table structure for table `agenda_rapat`
--

CREATE TABLE IF NOT EXISTS `agenda_rapat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `leading_sektor` varchar(255) NOT NULL,
  `no_surat` varchar(50) NOT NULL,
  `tempat` varchar(255) NOT NULL,
  `tanggal_ajuan` datetime NOT NULL,
  `tanggal_undangan` date NOT NULL,
  `pimpinan_rapat` varchar(255) NOT NULL,
  `pakaian` varchar(50) NOT NULL,
  `catatan` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `agenda_rapat`
--

INSERT INTO `agenda_rapat` (`id`, `leading_sektor`, `no_surat`, `tempat`, `tanggal_ajuan`, `tanggal_undangan`, `pimpinan_rapat`, `pakaian`, `catatan`, `keterangan`) VALUES
(5, '12', '123', '159', '2014-03-13 20:00:00', '0000-00-00', '', '', '', ''),
(6, '13', '13', '13', '2014-03-13 21:40:57', '0000-00-00', '', '', '', ''),
(7, '11', '12', '13', '2014-03-17 10:06:52', '2014-03-17', '1', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `agenda_skpd`
--

CREATE TABLE IF NOT EXISTS `agenda_skpd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `skpd_id` int(11) NOT NULL,
  `agenda_rapat_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `agenda_skpd`
--

INSERT INTO `agenda_skpd` (`id`, `skpd_id`, `agenda_rapat_id`) VALUES
(4, 9, 5),
(3, 12, 5),
(7, 9, 6),
(6, 10, 5),
(8, 10, 6);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `biodata`
--

INSERT INTO `biodata` (`id`, `agama_id`, `status_perkawinan_id`, `jenis_kepegawaian_id`, `status_kepegawaian_id`, `nip`, `nama`, `kelamin`, `tempat_lahir`, `tanggal_lahir`, `karpeg`, `kartu_nikah`) VALUES
(2, 1, 2, 2, 2, '2', 'Namanya 2', 'Laki Laki', '4', '2014-03-05', '2014/03/11/20140311_190001_1854.png', '2014/03/11/20140311_190055_5799.jpg'),
(3, 5, 0, 0, 0, '111', '1asdasd', 'Perempuan', 'asdasd', '2014-03-12', '2014/03/17/20140317_081249_7215.jpg', '2014/03/17/20140317_081256_4679.jpg'),
(4, 1, 1, 1, 1, '0123456789', 'Herry Satrio', 'Laki Laki', 'Malang', '1984-10-15', '2014/03/17/20140317_144509_1322.jpg', '2014/03/17/20140317_144542_7033.jpg');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `biodata_detail`
--

INSERT INTO `biodata_detail` (`id`, `biodata_id`, `jabatan`, `pangkat`, `golongan_ruang`, `tmt_pangkat`, `tmt_masa_kerja`, `tmt_tahun`, `tmt_bulan`, `hp`, `email`, `cpns`, `pns`, `non_pns`, `unit_kerja`) VALUES
(1, 0, '', '', '', '', '', '', '', '', '', '', '', '', ''),
(2, 2, '1', '2', '3', '4', '5', '6', '7', '8', '99', '2014/03/12/20140312_085653_2812.jpg', '2014/03/12/20140312_085655_5830.jpg', '2014/03/12/20140312_085656_1866.jpg', '2014/03/12/20140312_085658_9446.jpg'),
(3, 4, 'Programmer', 'Senior', 'III/A', '-', '5 Tahun 2 Bulan', '5 Tahun', '2 Bulan', '0856355402', 'her0satr@yahoo.com', '2014/03/17/20140317_144553_8586.jpg', '2014/03/17/20140317_144555_4644.jpg', '2014/03/17/20140317_144557_7781.jpg', '2014/03/17/20140317_144559_5025.jpg'),
(4, 5, '', '', '', '', '', '', '', '111111', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `disposisi`
--

CREATE TABLE IF NOT EXISTS `disposisi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `surat_masuk_id` int(11) NOT NULL,
  `kepada` varchar(100) NOT NULL,
  `waktu` datetime NOT NULL,
  `waktu_diff` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=35 ;

--
-- Dumping data for table `disposisi`
--

INSERT INTO `disposisi` (`id`, `surat_masuk_id`, `kepada`, `waktu`, `waktu_diff`) VALUES
(18, 12, 'Surat dibuat.', '2014-03-14 10:56:00', ''),
(19, 12, 'Kurir #1', '2014-03-14 10:57:23', '83'),
(20, 12, 'Kurir #2', '2014-03-14 10:57:33', '10'),
(32, 18, 'Surat dibuat.', '2014-03-17 15:38:00', ''),
(33, 18, 'Kurir #1', '2014-03-17 15:38:44', '44'),
(34, 18, 'Kurir #2', '2014-03-17 15:38:45', '1');

-- --------------------------------------------------------

--
-- Table structure for table `jam_absensi`
--

CREATE TABLE IF NOT EXISTS `jam_absensi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jam_ke` int(11) NOT NULL,
  `jam_awal` int(11) NOT NULL,
  `jam_akhir` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `jam_absensi`
--

INSERT INTO `jam_absensi` (`id`, `jam_ke`, `jam_awal`, `jam_akhir`) VALUES
(1, 1, 7, 10),
(2, 2, 10, 13),
(3, 3, 13, 15),
(4, 4, 15, 16);

-- --------------------------------------------------------

--
-- Table structure for table `jenis_kegiatan`
--

CREATE TABLE IF NOT EXISTS `jenis_kegiatan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `biodata_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `satuan` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `jenis_kegiatan`
--

INSERT INTO `jenis_kegiatan` (`id`, `biodata_id`, `title`, `jumlah`, `satuan`) VALUES
(2, 3, 'Lain 01', 1, 'm'),
(3, 3, 'Lain 02', 2, 'm'),
(4, 4, 'Herry Kegiatan', 1, 'cm');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_kepegawaian`
--

CREATE TABLE IF NOT EXISTS `jenis_kepegawaian` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

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
  `jumlah` int(11) NOT NULL,
  `satuan` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `jenis_skp`
--

INSERT INTO `jenis_skp` (`id`, `biodata_id`, `title`, `jumlah`, `satuan`) VALUES
(3, 3, 'Jenis SKP 1', 1, 'cm'),
(4, 3, 'Jenis SKP 2', 2, 'cm'),
(5, 4, 'Herry SKP 01', 1, 'cm');

-- --------------------------------------------------------

--
-- Table structure for table `kegiatan_skp`
--

CREATE TABLE IF NOT EXISTS `kegiatan_skp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `biodata_id` int(11) NOT NULL,
  `jenis_skp_id` int(11) NOT NULL,
  `kegiatan_lain_id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `type_row` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `kegiatan_skp`
--

INSERT INTO `kegiatan_skp` (`id`, `biodata_id`, `jenis_skp_id`, `kegiatan_lain_id`, `tanggal`, `type_row`) VALUES
(1, 3, 3, 0, '2014-03-14', 1),
(2, 3, 0, 2, '2014-03-15', 2),
(3, 4, 5, 0, '2014-03-17', 1),
(4, 4, 0, 4, '2014-03-19', 2);

-- --------------------------------------------------------

--
-- Table structure for table `nota_dinas`
--

CREATE TABLE IF NOT EXISTS `nota_dinas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no_urut` varchar(50) NOT NULL,
  `no_surat` varchar(50) NOT NULL,
  `surat_dari` varchar(255) NOT NULL,
  `disposisi_kepada` varchar(255) NOT NULL,
  `perihal` varchar(255) NOT NULL,
  `posisi` varchar(255) NOT NULL,
  `tanggal_disposisi` date NOT NULL,
  `tanggal_surat` date NOT NULL,
  `tanggal_terima` datetime NOT NULL,
  `catatan` varchar(255) NOT NULL,
  `file_surat` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `nota_dinas`
--

INSERT INTO `nota_dinas` (`id`, `no_urut`, `no_surat`, `surat_dari`, `disposisi_kepada`, `perihal`, `posisi`, `tanggal_disposisi`, `tanggal_surat`, `tanggal_terima`, `catatan`, `file_surat`) VALUES
(5, '1', '2', '3', '4', '5', '6', '0000-00-00', '2014-03-17', '0000-00-00 00:00:00', '', '2014/03/17/20140317_082031_2967.jpg'),
(6, '1', '1', '1', '1', '1', '1', '2014-03-17', '2014-03-17', '2014-03-17 10:06:36', '', ''),
(7, '11111', '11111', '11111', '11111', '11111', '11111', '2014-03-17', '2014-03-17', '0000-00-00 00:00:00', '', '');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `riwayat_diklat`
--

INSERT INTO `riwayat_diklat` (`id`, `biodata_id`, `no_sertifikat`, `tahun`, `upload_file`) VALUES
(1, 3, '111', 222, '');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `riwayat_mutasi`
--

INSERT INTO `riwayat_mutasi` (`id`, `biodata_id`, `no_sk`, `tahun`, `upload_file`) VALUES
(3, 3, 'dsf', 0, '');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `riwayat_pendidikan`
--

INSERT INTO `riwayat_pendidikan` (`id`, `biodata_id`, `tahun`, `no_ijazah`, `upload_file`) VALUES
(7, 3, 13, '112', '');

-- --------------------------------------------------------

--
-- Table structure for table `sifat_arsip`
--

CREATE TABLE IF NOT EXISTS `sifat_arsip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `sifat_arsip`
--

INSERT INTO `sifat_arsip` (`id`, `title`) VALUES
(1, 'Statis'),
(2, 'Dinamis');

-- --------------------------------------------------------

--
-- Table structure for table `sifat_surat`
--

CREATE TABLE IF NOT EXISTS `sifat_surat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `sifat_surat`
--

INSERT INTO `sifat_surat` (`id`, `title`) VALUES
(1, 'Penting'),
(2, 'Segera'),
(3, 'Rahasia'),
(4, 'Biasa');

-- --------------------------------------------------------

--
-- Table structure for table `skpd`
--

CREATE TABLE IF NOT EXISTS `skpd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `kepala` varchar(200) NOT NULL,
  `instansi` varchar(200) NOT NULL,
  `hp` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `skpd`
--

INSERT INTO `skpd` (`id`, `title`, `kepala`, `instansi`, `hp`) VALUES
(9, 'Malang', 'Alun Alun Bunder', 'Malang Kota', ''),
(10, 'Bandung', 'Dingin', 'Hujan', '123'),
(12, 'Surabaya', 'Kepala Surabaya', 'Kota Surabaya', '');

-- --------------------------------------------------------

--
-- Table structure for table `status_kepegawaian`
--

CREATE TABLE IF NOT EXISTS `status_kepegawaian` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `status_perkawinan`
--

INSERT INTO `status_perkawinan` (`id`, `title`) VALUES
(1, 'Menikah'),
(2, 'Belum Menikah'),
(3, 'Duda / Janda');

-- --------------------------------------------------------

--
-- Table structure for table `surat_keluar`
--

CREATE TABLE IF NOT EXISTS `surat_keluar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no_urut` varchar(50) NOT NULL,
  `index_surat` varchar(50) NOT NULL,
  `no_surat` varchar(50) NOT NULL,
  `pengolah` varchar(255) NOT NULL,
  `tujuan` varchar(255) NOT NULL,
  `tanggal_surat` date NOT NULL,
  `lampiran` varchar(255) NOT NULL,
  `perihal` varchar(255) NOT NULL,
  `catatan` varchar(255) NOT NULL,
  `file_surat` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `surat_keluar`
--

INSERT INTO `surat_keluar` (`id`, `no_urut`, `index_surat`, `no_surat`, `pengolah`, `tujuan`, `tanggal_surat`, `lampiran`, `perihal`, `catatan`, `file_surat`) VALUES
(4, '1', '2', '3', '4', '', '2014-03-17', '', '11', '', '2014/03/17/20140317_081952_4904.jpg'),
(5, '1', '2', '2', '2', '', '2014-03-17', '2', '88', '', ''),
(6, '11111', '11111', '11111', '11111', '11111', '2014-03-17', '', '11111', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `surat_masuk`
--

CREATE TABLE IF NOT EXISTS `surat_masuk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sifat_arsip_id` int(11) NOT NULL,
  `sifat_surat_id` int(11) NOT NULL,
  `no_urut` varchar(50) NOT NULL,
  `no_surat` varchar(50) NOT NULL,
  `no_agenda` varchar(50) NOT NULL,
  `surat_dari` varchar(50) NOT NULL,
  `perihal` varchar(255) NOT NULL,
  `tanggal_surat` date NOT NULL,
  `tanggal_terima` datetime NOT NULL,
  `catatan` varchar(255) NOT NULL,
  `file_surat` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `surat_masuk`
--

INSERT INTO `surat_masuk` (`id`, `sifat_arsip_id`, `sifat_surat_id`, `no_urut`, `no_surat`, `no_agenda`, `surat_dari`, `perihal`, `tanggal_surat`, `tanggal_terima`, `catatan`, `file_surat`) VALUES
(12, 0, 2, '123456', 'No Surat', 'No Agenda', 'Surat Dari', 'Perihal', '2014-03-17', '2014-03-14 10:56:00', 'Catatannya', '2014/03/17/20140317_081917_5920.jpg'),
(18, 0, 0, '11111', '11111', '11111', '11111', '11111', '2014-03-17', '2014-03-17 15:38:00', '', '');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `user_type_id`, `email`, `fullname`, `passwd`, `address`, `thumbnail`, `is_active`) VALUES
(2, 1, 'her0satr@yahoo.com', 'Herry', 'fe30fa79056939db8cbe99c8d601de74', '-', '2014/03/11/20140311_131431_5821.jpg', 1),
(5, 3, '111', '1asdasd', '5d408d848a029d6d3b333ee32469dda8', '', '', 1),
(6, 3, '2', 'Namanya 2', 'cb8eed4d556ba533cf5c6941d9eb5991', '', '', 1),
(7, 2, '0123456789', 'Herry Satrio', '705f973c251b7e26e40f855739de2d87', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_biodata`
--

CREATE TABLE IF NOT EXISTS `user_biodata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `biodata_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `user_biodata`
--

INSERT INTO `user_biodata` (`id`, `user_id`, `biodata_id`) VALUES
(1, 5, 3),
(2, 6, 2);

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
