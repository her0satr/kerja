-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 13, 2014 at 04:18 PM
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `absensi_kosong`
--

INSERT INTO `absensi_kosong` (`id`, `biodata_id`, `tanggal`, `status_kosong`, `keterangan`, `upload_file`) VALUES
(2, 3, '2014-03-14', 'Cuti', '123 55', '2014/03/13/20140313_134928_8276.png');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `absensi_masuk`
--

INSERT INTO `absensi_masuk` (`id`, `biodata_id`, `tanggal`, `label`, `waktu_01`, `status_01`, `waktu_02`, `status_02`, `waktu_03`, `status_03`, `waktu_04`, `status_04`, `keterangan`) VALUES
(1, 3, '2014-03-13', 'Tepat Waktu', '11:55:43', '', '12:26:52', '', '13:00:00', '', '15:00:00', '', '--');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `biodata`
--

INSERT INTO `biodata` (`id`, `agama_id`, `status_perkawinan_id`, `jenis_kepegawaian_id`, `status_kepegawaian_id`, `nip`, `nama`, `kelamin`, `tempat_lahir`, `tanggal_lahir`, `karpeg`, `kartu_nikah`) VALUES
(2, 1, 2, 2, 2, '2', 'Namanya 2', 'Laki Laki', '4', '2014-03-05', '2014/03/11/20140311_190001_1854.png', '2014/03/11/20140311_190055_5799.jpg'),
(3, 5, 0, 0, 0, '111', '1asdasd', 'Perempuan', 'asdasd', '2014-03-12', '', '');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `biodata_detail`
--

INSERT INTO `biodata_detail` (`id`, `biodata_id`, `jabatan`, `pangkat`, `golongan_ruang`, `tmt_pangkat`, `tmt_masa_kerja`, `tmt_tahun`, `tmt_bulan`, `hp`, `email`, `cpns`, `pns`, `non_pns`, `unit_kerja`) VALUES
(1, 0, '', '', '', '', '', '', '', '', '', '', '', '', ''),
(2, 2, '1', '2', '3', '4', '5', '6', '7', '8', '99', '2014/03/12/20140312_085653_2812.jpg', '2014/03/12/20140312_085655_5830.jpg', '2014/03/12/20140312_085656_1866.jpg', '2014/03/12/20140312_085658_9446.jpg');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `jenis_kegiatan`
--

INSERT INTO `jenis_kegiatan` (`id`, `biodata_id`, `title`, `jumlah`, `satuan`) VALUES
(2, 3, 'Lain 01', 1, 'm'),
(3, 3, 'Lain 02', 2, 'm');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `jenis_skp`
--

INSERT INTO `jenis_skp` (`id`, `biodata_id`, `title`, `jumlah`, `satuan`) VALUES
(3, 3, 'Jenis SKP 1', 1, 'cm'),
(4, 3, 'Jenis SKP 2', 2, 'cm');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `kegiatan_skp`
--

INSERT INTO `kegiatan_skp` (`id`, `biodata_id`, `jenis_skp_id`, `kegiatan_lain_id`, `tanggal`, `type_row`) VALUES
(3, 0, 3, 0, '2014-03-01', 1),
(4, 0, 4, 0, '2014-03-02', 1),
(5, 0, 0, 2, '2014-03-03', 2),
(6, 0, 0, 3, '2014-03-04', 2);

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Table structure for table `sifat_arsip`
--

CREATE TABLE IF NOT EXISTS `sifat_arsip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

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
  `surat_dari` varchar(50) NOT NULL,
  `perihal` varchar(255) NOT NULL,
  `tanggal_surat` date NOT NULL,
  `tanggal_terima` datetime NOT NULL,
  `catatan` varchar(255) NOT NULL,
  `file_surat` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `surat_masuk`
--

INSERT INTO `surat_masuk` (`id`, `sifat_arsip_id`, `sifat_surat_id`, `no_urut`, `no_surat`, `surat_dari`, `perihal`, `tanggal_surat`, `tanggal_terima`, `catatan`, `file_surat`) VALUES
(9, 0, 1, '123', 'No Surat Asli', '123', 'Isi Perihal', '2014-03-13', '2014-03-13 16:47:00', 'Catatan', ''),
(8, 0, 2, '11', '22', '3', '454', '2014-03-05', '2014-03-13 10:38:00', '2', '2014/03/13/20140313_093826_1183.jpg');

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
