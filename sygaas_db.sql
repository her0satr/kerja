-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 04, 2014 at 03:01 PM
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `absensi_masuk`
--

INSERT INTO `absensi_masuk` (`id`, `biodata_id`, `tanggal`, `label`, `waktu_01`, `status_01`, `waktu_02`, `status_02`, `waktu_03`, `status_03`, `waktu_04`, `status_04`, `keterangan`) VALUES
(1, 3, '2014-03-13', 'Tepat Waktu', '11:55:43', '', '12:26:52', '', '13:00:00', '', '15:00:00', '', '--'),
(3, 4, '2014-03-17', 'Tepat Waktu', '15:01:14', '', '15:31:05', '', '15:19:09', '', '15:19:07', '', ''),
(4, 4, '2014-03-18', 'Tepat Waktu', '08:01:46', '', '15:31:05', '', '15:19:10', '', '15:19:08', '', ''),
(7, 4, '2014-04-08', 'Tepat Waktu', '14:32:31', '', '00:00:00', '', '00:00:00', '', '00:00:00', '', '456'),
(11, 5, '2014-05-04', '', '00:00:00', '', '00:00:00', '', '14:00:29', '', '00:00:00', '', ''),
(12, 5, '2014-05-05', 'Tepat Waktu', '00:00:00', '', '00:00:00', '', '00:00:00', '', '00:00:00', '', ''),
(13, 2, '2014-05-04', '', '00:00:00', '', '00:00:00', '', '00:00:00', '', '00:00:00', '', '');

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
-- Table structure for table `agenda_rapat`
--

CREATE TABLE IF NOT EXISTS `agenda_rapat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `skpd_id` int(11) NOT NULL,
  `acara` varchar(255) NOT NULL,
  `leading_sektor` varchar(255) NOT NULL,
  `no_surat` varchar(50) NOT NULL,
  `tempat` varchar(255) NOT NULL,
  `tanggal_ajuan` datetime NOT NULL,
  `tanggal_undangan` datetime NOT NULL,
  `pimpinan_rapat` varchar(255) NOT NULL,
  `pakaian` varchar(50) NOT NULL,
  `catatan` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `rahasia` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `agenda_rapat`
--

INSERT INTO `agenda_rapat` (`id`, `skpd_id`, `acara`, `leading_sektor`, `no_surat`, `tempat`, `tanggal_ajuan`, `tanggal_undangan`, `pimpinan_rapat`, `pakaian`, `catatan`, `keterangan`, `rahasia`) VALUES
(5, 0, 'Peringatan Acara', 'Sektor', 'No 001', 'Balai RW', '2014-03-13 20:00:00', '2014-03-30 00:00:00', '', '', 'Catatan', '', 0),
(6, 0, 'Acara Umum', '13', '13', '13', '2014-03-13 21:40:57', '2014-03-28 00:00:00', '', '', '', '', 1),
(7, 0, 'Acara Kementrian', '11', '12', '13', '2014-03-17 10:06:52', '2014-03-10 11:00:00', '1', '', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `agenda_skpd`
--

CREATE TABLE IF NOT EXISTS `agenda_skpd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `skpd_id` int(11) NOT NULL,
  `agenda_rapat_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `agenda_skpd`
--

INSERT INTO `agenda_skpd` (`id`, `skpd_id`, `agenda_rapat_id`) VALUES
(4, 9, 5),
(3, 12, 5),
(7, 9, 6),
(6, 10, 5),
(8, 10, 6),
(9, 10, 7),
(10, 9, 7),
(11, 12, 7);

-- --------------------------------------------------------

--
-- Table structure for table `biodata`
--

CREATE TABLE IF NOT EXISTS `biodata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `skpd_id` int(11) NOT NULL,
  `agama_id` int(11) NOT NULL,
  `status_perkawinan_id` int(11) NOT NULL,
  `jenis_kepegawaian_id` int(11) NOT NULL,
  `status_kepegawaian_id` int(11) NOT NULL,
  `nip` varchar(50) NOT NULL,
  `nama` varchar(150) NOT NULL,
  `kelamin` varchar(50) NOT NULL,
  `gelar_depan` varchar(50) NOT NULL,
  `gelar_belakang` varchar(50) NOT NULL,
  `tempat_lahir` varchar(150) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `photo` varchar(50) NOT NULL,
  `karpeg` varchar(50) NOT NULL,
  `kartu_nikah` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `biodata`
--

INSERT INTO `biodata` (`id`, `skpd_id`, `agama_id`, `status_perkawinan_id`, `jenis_kepegawaian_id`, `status_kepegawaian_id`, `nip`, `nama`, `kelamin`, `gelar_depan`, `gelar_belakang`, `tempat_lahir`, `tanggal_lahir`, `photo`, `karpeg`, `kartu_nikah`) VALUES
(2, 10, 1, 2, 2, 2, '2', 'Namanya 2', 'Laki Laki', '', '', '4', '2014-03-05', '', '2014/03/11/20140311_190001_1854.png', '2014/03/11/20140311_190055_5799.jpg'),
(3, 9, 5, 0, 0, 0, '111', '1asdasd', 'Perempuan', '123', '987', 'asdasd', '2014-03-12', '2014/04/08/20140408_140727_6639.png', '2014/03/17/20140317_081249_7215.jpg', '2014/03/17/20140317_081256_4679.jpg'),
(4, 12, 1, 1, 1, 1, '123456789', 'User Test', 'Laki Laki', '', '', 'Malang', '1984-10-15', '2014/04/08/20140408_140926_2002.jpg', '2014/03/17/20140317_144509_1322.jpg', '2014/03/17/20140317_144542_7033.jpg'),
(5, 12, 1, 0, 0, 0, '0123456789', 'Herry Satrio', 'Laki Laki', '', '', '-', '2014-04-21', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `biodata_detail`
--

CREATE TABLE IF NOT EXISTS `biodata_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `biodata_id` int(11) NOT NULL,
  `pangkat_id` int(11) NOT NULL,
  `unit_kerja_id` int(50) NOT NULL,
  `jabatan` varchar(50) NOT NULL,
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
  `gaji` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `biodata_detail`
--

INSERT INTO `biodata_detail` (`id`, `biodata_id`, `pangkat_id`, `unit_kerja_id`, `jabatan`, `golongan_ruang`, `tmt_pangkat`, `tmt_masa_kerja`, `tmt_tahun`, `tmt_bulan`, `hp`, `email`, `cpns`, `pns`, `non_pns`, `gaji`) VALUES
(1, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', 0),
(2, 3, 1, 9, '', '', '', '', '', '', '-', '', '', '', '', 123456),
(3, 4, 0, 2014, 'Programmer', 'III/A', '-', '5 Tahun 2 Bulan', '5 Tahun', '2 Bulan', '856355402', 'her0satr@yahoo.com', '2014/03/17/20140317_144553_8586.jpg', '2014/03/17/20140317_144555_4644.jpg', '2014/03/17/20140317_144557_7781.jpg', 1500000),
(4, 5, 0, 0, '', '', '', '', '', '', '111111', '', '', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `disposisi`
--

CREATE TABLE IF NOT EXISTS `disposisi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `surat_masuk_id` int(11) NOT NULL,
  `surat_destination_id` int(11) NOT NULL,
  `waktu` datetime NOT NULL,
  `waktu_diff` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `disposisi`
--

INSERT INTO `disposisi` (`id`, `surat_masuk_id`, `surat_destination_id`, `waktu`, `waktu_diff`) VALUES
(1, 19, 1, '2014-04-07 21:19:00', 0),
(3, 19, 2, '2014-04-07 21:28:16', 556),
(4, 19, 3, '2014-04-07 21:28:25', 9),
(5, 20, 1, '2014-04-09 07:12:31', 0),
(6, 21, 1, '2014-04-09 11:56:40', 0),
(7, 22, 1, '2014-04-09 11:56:40', 0),
(11, 20, 2, '2014-04-22 12:11:45', 795554),
(12, 20, 3, '2014-04-22 12:11:50', 5),
(13, 20, 3, '2014-04-22 12:12:13', 23),
(14, 21, 2, '2014-04-22 12:12:46', 778566),
(15, 21, 2, '2014-04-22 12:12:47', 1),
(16, 21, 3, '2014-04-22 12:12:48', 1),
(17, 21, 3, '2014-04-22 12:12:49', 1),
(18, 23, 1, '2014-05-01 13:17:35', 0),
(19, 23, 2, '2014-05-01 13:17:36', 1),
(20, 23, 3, '2014-05-01 13:17:37', 1);

-- --------------------------------------------------------

--
-- Table structure for table `divisi`
--

CREATE TABLE IF NOT EXISTS `divisi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `divisi`
--

INSERT INTO `divisi` (`id`, `title`) VALUES
(1, 'Tata Usaha'),
(2, 'Kepegawaian'),
(3, 'Divisi 1'),
(4, 'Divisi 2');

-- --------------------------------------------------------

--
-- Table structure for table `index_surat`
--

CREATE TABLE IF NOT EXISTS `index_surat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `index_surat`
--

INSERT INTO `index_surat` (`id`, `code`, `title`) VALUES
(2, '1', 'Organisasi'),
(3, '2', 'Pengumuman'),
(4, '3', 'Agenda Rapat');

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
  `point` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `jenis_kegiatan`
--

INSERT INTO `jenis_kegiatan` (`id`, `biodata_id`, `title`, `jumlah`, `satuan`, `point`) VALUES
(2, 3, 'Lain 01', 1, 'm', ''),
(3, 3, 'Lain 02', 2, 'm', ''),
(5, 4, 'Kegiatan Lain 01', 1, '2', '3'),
(6, 4, 'Kegiatan Lain 02', 11, '22', '33'),
(7, 5, 'Kegiatan Lain 01', 1, 'lembar', '1'),
(8, 5, 'Kegiatan Lain 02', 1, 'lembar', '1');

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
  `jumlah` int(11) NOT NULL,
  `satuan` varchar(10) NOT NULL,
  `point` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `jenis_skp`
--

INSERT INTO `jenis_skp` (`id`, `biodata_id`, `title`, `jumlah`, `satuan`, `point`) VALUES
(3, 3, 'Jenis SKP 1', 1, 'cm', 0),
(4, 3, 'Jenis SKP 2', 2, 'cm', 0),
(6, 4, 'Herry Jenis SKP 01', 1, 'unit', 0),
(7, 4, 'Herry Jenis SKP 02', 2, 'unit', 0),
(8, 5, 'Jenis SKP 01', 1, 'unit', 1),
(9, 5, 'Jenis SKP 02', 1, 'unit', 1);

-- --------------------------------------------------------

--
-- Table structure for table `kegiatan_skp`
--

CREATE TABLE IF NOT EXISTS `kegiatan_skp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `biodata_id` int(11) NOT NULL,
  `jenis_skp_id` int(11) NOT NULL,
  `jenis_kegiatan_id` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` time NOT NULL,
  `type_row` int(11) NOT NULL,
  `kendala` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `kegiatan_skp`
--

INSERT INTO `kegiatan_skp` (`id`, `biodata_id`, `jenis_skp_id`, `jenis_kegiatan_id`, `no_urut`, `tanggal`, `waktu`, `type_row`, `kendala`, `keterangan`) VALUES
(1, 3, 3, 0, 0, '2014-03-14', '00:00:00', 1, '', ''),
(2, 3, 0, 2, 0, '2014-03-15', '00:00:00', 2, '', ''),
(8, 4, 6, 0, 0, '2014-04-07', '20:00:00', 1, '', 'Isi SKP'),
(5, 3, 3, 0, 0, '2014-03-16', '00:00:00', 1, '', 'Keterangan 01'),
(9, 4, 0, 5, 0, '2014-04-07', '10:00:00', 2, '', 'Isi Kegiatan Lain 01'),
(10, 4, 6, 0, 1, '2014-04-14', '08:00:00', 1, 'Kendala 1', 'No urut 1 Jam 8'),
(11, 4, 7, 0, 2, '2014-04-14', '09:00:00', 1, 'Kendala 2', 'No urut 2 Jam 9'),
(12, 5, 8, 0, 1, '2014-04-21', '08:00:00', 1, 'Kendala 1', '-'),
(13, 5, 9, 0, 2, '2014-04-21', '09:00:00', 1, 'Kendala 2', '-'),
(14, 5, 0, 7, 3, '2014-04-21', '10:00:00', 2, 'kendala Kegiatan lain 1', ''),
(15, 5, 0, 8, 4, '2014-04-21', '12:58:46', 2, 'kendala Kegiatan lain 2', '-'),
(16, 5, 8, 0, 5, '2014-04-21', '14:40:30', 1, '', ''),
(17, 5, 0, 8, 6, '2014-04-21', '14:40:30', 2, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `kop_surat`
--

CREATE TABLE IF NOT EXISTS `kop_surat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `kop_surat`
--

INSERT INTO `kop_surat` (`id`, `content`) VALUES
(1, '<div style="text-align: center;"><font size="4"><span style="font-weight: bold;">PEMERINTAH KABUPATEN MALANG</span></font><br>BAGIAN TATA USAHA SETDA KAB. MALANG<br>Jl. Merdeka Timur No. 3 Malang Telp. (0341) 362209<br>Email : bag-tu@malangkab.go.id<br><span style="text-decoration: underline;">MALANG</span><br></div>');

-- --------------------------------------------------------

--
-- Table structure for table `nota_dinas`
--

CREATE TABLE IF NOT EXISTS `nota_dinas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no_urut` int(11) NOT NULL,
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `nota_dinas`
--

INSERT INTO `nota_dinas` (`id`, `no_urut`, `no_surat`, `surat_dari`, `disposisi_kepada`, `perihal`, `posisi`, `tanggal_disposisi`, `tanggal_surat`, `tanggal_terima`, `catatan`, `file_surat`) VALUES
(5, 1, '2', '3', '4', '5', '6', '0000-00-00', '2014-03-17', '0000-00-00 00:00:00', '', '2014/03/17/20140317_082031_2967.jpg'),
(6, 2, '1', '1', '1', '1', '1', '2014-03-17', '2014-03-17', '2014-03-17 10:06:36', '', ''),
(10, 4, '123', '123', '', '123', '', '0000-00-00', '2014-04-15', '0000-00-00 00:00:00', '', ''),
(9, 3, '11111', '111', '', '11111', '', '0000-00-00', '2014-04-01', '0000-00-00 00:00:00', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `nota_dinas_disposisi`
--

CREATE TABLE IF NOT EXISTS `nota_dinas_disposisi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nota_dinas_id` int(11) NOT NULL,
  `nota_dinas_kepada_id` int(11) NOT NULL,
  `waktu` datetime NOT NULL,
  `waktu_diff` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `nota_dinas_disposisi`
--

INSERT INTO `nota_dinas_disposisi` (`id`, `nota_dinas_id`, `nota_dinas_kepada_id`, `waktu`, `waktu_diff`) VALUES
(3, 9, 1, '2014-04-14 13:41:02', ''),
(8, 9, 3, '2014-04-14 13:54:43', '821'),
(9, 9, 2, '2014-04-14 13:54:48', '5'),
(10, 10, 1, '2014-04-14 13:54:24', ''),
(11, 10, 3, '2014-04-14 13:54:45', '21'),
(12, 10, 2, '2014-04-14 13:54:51', '6');

-- --------------------------------------------------------

--
-- Table structure for table `nota_dinas_kepada`
--

CREATE TABLE IF NOT EXISTS `nota_dinas_kepada` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `hidden` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `nota_dinas_kepada`
--

INSERT INTO `nota_dinas_kepada` (`id`, `title`, `hidden`) VALUES
(1, 'Surat dibuat', 1),
(2, 'Kepala', 0),
(3, 'Sektretaris', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pangkat`
--

CREATE TABLE IF NOT EXISTS `pangkat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pangkat` varchar(255) NOT NULL,
  `golongan` varchar(255) NOT NULL,
  `ruang` varchar(50) NOT NULL,
  `urutan` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `pangkat`
--

INSERT INTO `pangkat` (`id`, `pangkat`, `golongan`, `ruang`, `urutan`) VALUES
(1, 'Pembina', 'IV', 'A', 40),
(2, 'Pembina Tingkat I', 'IV', 'B', 41),
(3, 'Pembina Utama Muda', 'IV', 'C', 42),
(4, 'Pembina Utama Madya', 'IV', 'D', 43),
(5, 'Pembina Utama', 'IV', 'E', 44);

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
  `keterangan` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `riwayat_diklat`
--

INSERT INTO `riwayat_diklat` (`id`, `biodata_id`, `no_sertifikat`, `tahun`, `upload_file`, `keterangan`) VALUES
(1, 3, '111', 222, '', 'wqe');

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
  `keterangan` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `riwayat_mutasi`
--

INSERT INTO `riwayat_mutasi` (`id`, `biodata_id`, `no_sk`, `tahun`, `upload_file`, `keterangan`) VALUES
(3, 3, 'dsf', 0, '', '');

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
  `keterangan` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `riwayat_pendidikan`
--

INSERT INTO `riwayat_pendidikan` (`id`, `biodata_id`, `tahun`, `no_ijazah`, `upload_file`, `keterangan`) VALUES
(7, 3, 13, '112', '', '12355');

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
  `email` varchar(50) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `skpd`
--

INSERT INTO `skpd` (`id`, `title`, `kepala`, `instansi`, `hp`, `email`, `keterangan`) VALUES
(9, 'Malang', 'Alun Alun Bunder', 'Malang Kota', '', '', ''),
(10, 'Bandung', 'Dingin', 'Hujan', '123', 'her0satr@gmail.com', 'Keterangan 2'),
(12, 'Surabaya', 'Kepala Surabaya', 'Kota Surabaya', '', '', '');

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
-- Table structure for table `surat_destination`
--

CREATE TABLE IF NOT EXISTS `surat_destination` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `hidden` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `surat_destination`
--

INSERT INTO `surat_destination` (`id`, `title`, `hidden`) VALUES
(1, 'Surat dibuat', 1),
(2, 'Sekretaris', 0),
(3, 'Kepala Desa', 0);

-- --------------------------------------------------------

--
-- Table structure for table `surat_keluar`
--

CREATE TABLE IF NOT EXISTS `surat_keluar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `index_surat_id` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `no_surat` varchar(50) NOT NULL,
  `pengolah` varchar(255) NOT NULL,
  `tujuan` varchar(255) NOT NULL,
  `tanggal_surat` date NOT NULL,
  `lampiran` varchar(255) NOT NULL,
  `perihal` varchar(255) NOT NULL,
  `catatan` varchar(255) NOT NULL,
  `file_surat` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `surat_keluar`
--

INSERT INTO `surat_keluar` (`id`, `index_surat_id`, `no_urut`, `no_surat`, `pengolah`, `tujuan`, `tanggal_surat`, `lampiran`, `perihal`, `catatan`, `file_surat`) VALUES
(4, 2, 1, '3', '4', '', '2014-03-17', '', '11', '', '2014/03/17/20140317_081952_4904.jpg'),
(5, 3, 2, '2', '2', '', '2014-03-17', '2', '88', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `surat_masuk`
--

CREATE TABLE IF NOT EXISTS `surat_masuk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sifat_arsip_id` int(11) NOT NULL,
  `sifat_surat_id` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `no_surat` varchar(50) NOT NULL,
  `no_agenda` varchar(50) NOT NULL,
  `surat_dari` varchar(50) NOT NULL,
  `perihal` varchar(255) NOT NULL,
  `tanggal_surat` date NOT NULL,
  `tanggal_terima` datetime NOT NULL,
  `catatan` varchar(255) NOT NULL,
  `file_surat` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `surat_masuk`
--

INSERT INTO `surat_masuk` (`id`, `sifat_arsip_id`, `sifat_surat_id`, `no_urut`, `no_surat`, `no_agenda`, `surat_dari`, `perihal`, `tanggal_surat`, `tanggal_terima`, `catatan`, `file_surat`) VALUES
(12, 0, 2, 2, 'No Surat', 'No Agenda', 'Surat Dari', 'Perihal', '2014-03-17', '2014-03-14 10:56:00', 'Catatannya', '2014/03/17/20140317_081917_5920.jpg'),
(18, 0, 0, 1, '11111', '11111', '11111', '11111', '2014-03-17', '2014-03-17 15:38:00', '', ''),
(19, 2, 4, 3, 'XX-03-2014', 'No Agenda', '13', '21', '2014-04-07', '2014-04-07 21:19:00', 'Catatannya Kosong', ''),
(20, 2, 4, 4, 'No Surat 1', 'No Agenda', 'Surat Dari 2', 'Perihal', '2014-04-09', '2014-04-09 08:00:00', 'Catatan', '2014/04/09/20140409_071316_7455.jpg'),
(21, 2, 4, 5, 'No Surat 2', 'No Agenda', 'Surat Dari 2', 'Perihal', '2014-04-09', '2014-04-09 11:56:40', 'Catatan', ''),
(22, 0, 0, 6, 'No Surat 3', 'No Agenda 2', 'Surat Dari 2 2', 'Perihal', '2014-04-09', '2014-04-09 11:56:40', '', ''),
(23, 2, 4, 7, 'No Surat 7', 'No Agenda', 'Dari si no 7', '-', '2014-05-01', '2014-05-01 13:17:35', '', '');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `user_type_id`, `email`, `fullname`, `passwd`, `address`, `thumbnail`, `is_active`) VALUES
(2, 1, 'her0satr@yahoo.com', 'Herry', 'fe30fa79056939db8cbe99c8d601de74', '-', '2014/03/11/20140311_131431_5821.jpg', 1),
(5, 3, '111', '1asdasd', '5d408d848a029d6d3b333ee32469dda8', '', '', 1),
(6, 3, '2', 'Namanya 2', 'cb8eed4d556ba533cf5c6941d9eb5991', '', '', 1),
(9, 1, '123456789', 'Herry Satrio', '705f973c251b7e26e40f855739de2d87', '', '', 1),
(10, 1, '0123456789', 'Herry Satrio', '705f973c251b7e26e40f855739de2d87', '', '', 1);

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
(2, 6, 2),
(3, 9, 4),
(4, 10, 5);

-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

CREATE TABLE IF NOT EXISTS `user_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `user_type`
--

INSERT INTO `user_type` (`id`, `title`) VALUES
(1, 'Administrator'),
(2, 'Tata Usaha'),
(3, 'Pegawai');

-- --------------------------------------------------------

--
-- Table structure for table `widget`
--

CREATE TABLE IF NOT EXISTS `widget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `widget`
--

INSERT INTO `widget` (`id`, `title`, `alias`, `content`) VALUES
(1, 'Kepegawaian', 'pegawai', 'Isi Kepegawaian'),
(2, 'SKP', 'skp', 'Isi SKP'),
(3, 'Absensi', 'absensi', 'Isi Absensi'),
(4, 'Laporan Kepegawaian', 'laporan-pegawai', 'Isi Laporan Kepegawaian'),
(5, 'Surat Masuk', 'surat-masuk', 'Isi Surat Masuk'),
(6, 'Surat Keluar', 'surat-keluar', 'Isi Surat Keluar'),
(7, 'Nota Dinas', 'nota-dinas', 'Isi Nota Dinas'),
(8, 'Agenda Rapat', 'agenda-rapat', 'Isi Agenda Rapat'),
(9, 'Tambahan Surat', 'tambahan-surat', 'Silahkan update disini<br>');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
