-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2014 at 12:08 PM
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `absensi_kosong`
--

INSERT INTO `absensi_kosong` (`id`, `biodata_id`, `tanggal`, `status_kosong`, `keterangan`, `upload_file`) VALUES
(2, 3, '2014-03-14', 'Cuti', '123 55', '2014/03/13/20140313_134928_8276.png'),
(4, 4, '2014-03-18', 'Ijin', 'Ijin saja', ''),
(5, 5, '2014-05-01', 'Ijin', 'sdf', ''),
(6, 2, '2014-04-01', 'Ijin', 'asdfsf', ''),
(7, 5, '2014-05-08', 'Cuti', '-', ''),
(8, 8, '2014-05-14', 'MPP', '-', '');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=30 ;

--
-- Dumping data for table `absensi_masuk`
--

INSERT INTO `absensi_masuk` (`id`, `biodata_id`, `tanggal`, `label`, `waktu_01`, `status_01`, `waktu_02`, `status_02`, `waktu_03`, `status_03`, `waktu_04`, `status_04`, `keterangan`) VALUES
(28, 8, '2014-05-07', '', '09:24:10', '', '00:00:00', '', '00:00:00', '', '00:00:00', '', ''),
(27, 5, '2014-05-07', 'Tepat Waktu', '09:03:40', '', '00:00:00', '', '00:00:00', '', '00:00:00', '', 'apel dulu'),
(24, 5, '2014-05-05', '', '00:00:00', '', '00:00:00', '', '14:14:32', '', '00:00:00', '', ''),
(25, 2, '2014-05-05', '', '00:00:00', '', '00:00:00', '', '00:00:00', '', '00:00:00', '', ''),
(26, 3, '2014-05-07', '', '00:00:00', '', '00:00:00', '', '00:00:00', '', '00:00:00', '', ''),
(23, 3, '2014-05-05', '', '00:00:00', '', '00:00:00', '', '14:14:04', '', '00:00:00', '', ''),
(29, 5, '2014-05-14', '', '00:00:00', '', '00:00:00', '', '00:00:00', '', '00:00:00', '', '');

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
  `tanggal_undangan` date NOT NULL,
  `pimpinan_rapat` varchar(255) NOT NULL,
  `pakaian` varchar(50) NOT NULL,
  `catatan` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `rahasia` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `agenda_rapat`
--

INSERT INTO `agenda_rapat` (`id`, `skpd_id`, `acara`, `leading_sektor`, `no_surat`, `tempat`, `tanggal_ajuan`, `tanggal_undangan`, `pimpinan_rapat`, `pakaian`, `catatan`, `keterangan`, `rahasia`) VALUES
(5, 0, 'Peringatan Acara', 'Sektor', 'No 001', 'Balai RW', '2014-03-13 20:00:00', '2014-03-30', '', '', 'Catatan', '', 0),
(6, 0, 'Acara Umum', '13', '13', '13', '2014-03-13 21:40:57', '2014-03-28', '', '', '', '', 1),
(7, 0, 'Acara Kementrian', 'Bagian TU', '12', '13', '2014-05-23 10:06:52', '2014-05-24', '0', '', '', '', 1),
(8, 0, 'Rakor', 'Bagian TU', '1212', 'RR. Asisten', '2014-05-08 08:27:07', '2014-05-09', 'Sekda', '', '', '', 0),
(9, 0, 'fasfasf', '', '1325655', 'bmnhbhl', '0000-00-00 00:00:00', '0000-00-00', '', '', '', '', 0);

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `biodata`
--

INSERT INTO `biodata` (`id`, `skpd_id`, `agama_id`, `status_perkawinan_id`, `jenis_kepegawaian_id`, `status_kepegawaian_id`, `nip`, `nama`, `kelamin`, `gelar_depan`, `gelar_belakang`, `tempat_lahir`, `tanggal_lahir`, `photo`, `karpeg`, `kartu_nikah`) VALUES
(2, 10, 1, 2, 2, 2, '2', 'Namanya 2', 'Laki Laki', '', '', '4', '2014-03-05', '', '2014/03/11/20140311_190001_1854.png', '2014/03/11/20140311_190055_5799.jpg'),
(3, 10, 5, 0, 0, 0, '111', '1asdasd', 'Perempuan', '123', '987', 'asdasd', '2014-03-12', '2014/04/08/20140408_140727_6639.png', '2014/03/17/20140317_081249_7215.jpg', '2014/03/17/20140317_081256_4679.jpg'),
(5, 10, 1, 0, 0, 0, '0123456789', 'Ferry Cahyono', 'Laki Laki', '', '', '-', '2014-04-21', '', '', ''),
(6, 10, 1, 2, 2, 1, '39284208', 'Ferry Cahyono  non admin', 'Laki Laki', 'Drs.', 'M.Si', 'Malang', '2014-04-23', '', '', ''),
(7, 10, 1, 0, 0, 0, '4343', 'asfsaf', 'Laki Laki', 'aa', 'aa', 'kk', '2014-04-07', '', '', ''),
(8, 10, 1, 0, 0, 0, '46356565656', 'Wudi Yulianto', 'Laki Laki', '', '', 'fdsfsd', '2014-05-07', '', '', '');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

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
(20, 23, 3, '2014-05-01 13:17:37', 1),
(21, 24, 1, '2014-04-26 09:03:01', 0),
(22, 358, 3, '0000-00-00 00:00:00', 0),
(23, 358, 2, '2014-05-07 09:45:31', 1390445131),
(24, 358, 4, '2014-05-07 09:51:19', 348),
(25, 359, 1, '2014-05-08 16:34:35', 0),
(26, 359, 3, '0000-00-00 00:00:00', 0),
(27, 359, 4, '0000-00-00 00:00:00', 0),
(28, 360, 1, '2014-05-14 10:20:28', 0);

-- --------------------------------------------------------

--
-- Table structure for table `divisi`
--

CREATE TABLE IF NOT EXISTS `divisi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=472 ;

--
-- Dumping data for table `index_surat`
--

INSERT INTO `index_surat` (`id`, `code`, `title`) VALUES
(1, '140', 'Pemerintahan Desa'),
(2, '190', 'Hubungan Luar Negeri'),
(3, '336', 'Surat Kaleng'),
(4, '000', 'Batu'),
(5, '001.1', 'Garuda'),
(6, '001.2', 'Bendera Kebangsaan'),
(7, '001.31', 'Provinsi'),
(8, '002', 'Penghargaan'),
(9, '002.2', 'Satya Lencana'),
(10, '002.3', 'Daerah'),
(11, '002.4', 'Monumen'),
(12, '002.6', 'Penghargaan Lainnya'),
(13, '003', 'Hari Besar'),
(14, '003.1', 'Hari Besar Nasional'),
(15, '003.2', 'Hari Raya Keagamaan'),
(16, '003.3', 'HUT'),
(17, '004', 'Ucapan'),
(18, '004.1', 'Ucapan Terima Kasih'),
(19, '004.2', 'Ucapan Selamat'),
(20, '004.3', 'Ucapan Belasungkawa'),
(21, '004.4', 'Ucapan Lainnya'),
(22, '010', 'Urusan Dalam'),
(23, '011', 'Gedung/Kantor'),
(24, '012', 'Rumah Dinas'),
(25, '016', 'Telepon'),
(26, '018', 'Kebersihan Kantor'),
(27, '019', 'Protokol'),
(28, '019.1', 'Upacara Bendera'),
(29, '019.3', 'Audiensi'),
(30, '019.4', 'Alamat Kantor dan Pejabat'),
(31, '020', 'Peralatan'),
(32, '020.1', 'Penawaran'),
(33, '021', 'Alat Tulis'),
(34, '022', 'Mesin Kantor'),
(35, '023', 'Perabot Kantor'),
(36, '024', 'Alat Angkutan'),
(37, '025', 'Pakaian Dinas'),
(38, '026', 'Senjata'),
(39, '027', 'Pengadaan'),
(40, '028', 'Inventaris'),
(41, '030', 'Kekeyaan Daerah'),
(42, '031', 'Sumber daya alam'),
(43, '032', 'Aset Daerah'),
(44, '040', 'Perpustakaan/dokumentasi/kearsipan/sandi'),
(45, '041', 'Perpustakaan'),
(46, '041.1', 'Umum'),
(47, '041.2', 'Khusus'),
(48, '041.4', 'Sekolah'),
(49, '041.5', 'keliling'),
(50, '0413', 'Perguruan Tinggi'),
(51, '042', 'Dokumen'),
(52, '045', 'Kearsipan'),
(53, '045.1', 'Pola Klasifikasi'),
(54, '045.2', 'Surat Pengantar'),
(55, '045.3', 'Penyusutan Arsip'),
(56, '045.33', 'Penilaian Arsip'),
(57, '045.34', 'Pemusnahan Arsip'),
(58, '045.35', 'Penyerahan Arsip'),
(59, '045.36', 'Berita Acara Penyusutan Arsip'),
(60, '045.4', 'Pembinaan Kearsipan'),
(61, '045.5', 'Pemeliharaan/perawatan arsip'),
(62, '046', 'Sandi'),
(63, '050', 'Perencanaan'),
(64, '050.31', 'RENSTRA'),
(65, '060', 'Organisasi/Ketatalaksanaan'),
(66, '060.1', 'Program Kerja'),
(67, '061', 'Organisasi Instansi Pemerintah/Struktur Organisasi'),
(68, '061.1', 'Susunan dan Tata Kerja'),
(69, '061.2', 'Tata Tertib Kantor,Jam Kerja di Bulan Puasa'),
(70, '065', 'Ketatalaksanaan'),
(71, '070', 'Penelitian'),
(72, '071', 'Riset'),
(73, '072', 'Survey'),
(74, '073', 'Kajian'),
(75, '074', 'kerjasama Penelitian'),
(76, '074.1', 'Kerjasama dg perguruan tinggi negeri/swasta'),
(77, '074.2', 'Kerjasama Instansi Pemerintah,BUMN,BUMD'),
(78, '074.3', 'Kerjasama dg Swasta,perorangan'),
(79, '080', 'Konperensi'),
(80, '074.4', 'Kerjasama dg Lembaga Swadaya Masyarakat'),
(81, '090', 'Perjalanan Dinas'),
(82, '091', 'Perj.Presiden/Wapres'),
(83, '092', 'Perj.Menteri'),
(84, '093', 'Perj.Pejabat Tinggi'),
(85, '094', 'Perjalanan Pegawai'),
(86, '098', 'Perj.Pejabat Tinggi ke Luar Negeri'),
(87, '099', 'Perj.Pegawai ke Luar Negeri'),
(88, '100', 'Pemerintahan'),
(89, '110', 'Pemerintahan Pusat'),
(90, '120', 'pemerintah Propinsi'),
(91, '120.1', 'Koordinasi'),
(92, '121', 'Pengangkatan/pelantikan Kepala Daerah'),
(93, '126', 'Pembagian Wilayah'),
(94, '130', 'Pemerintah Kabupaten'),
(95, '131', 'Kepala Daerah'),
(96, '136', 'Pembagian Wilayah'),
(97, '135', 'Pembentukan/Pemekaran Wilayah'),
(98, '138', 'Pemerintah Wilayah Kecamatan'),
(99, '138.04', 'Laporan Camat'),
(100, '140', 'Pemerintah Desa/Kel'),
(101, '141', 'Pamong Desa'),
(102, '143', 'Kekayaan Desa'),
(103, '170', 'DPRD Kabupaten'),
(104, '171', 'Keanggotaan'),
(105, '171.2', 'Pengangkatan anggota DPRD'),
(106, '172', 'Persidangan'),
(107, '172.1', 'reses'),
(108, '180', 'Hukum'),
(109, '181.4', 'Notariat'),
(110, '182', 'pidana'),
(111, '182.1', 'PPNS'),
(112, '185', 'Imigrasi'),
(113, '187', 'Kejaksaan'),
(114, '188', 'Peraturan Perundang-Undangan'),
(115, '188.3', 'Peraturan Perundangan'),
(116, '188.31', 'Peraturan Pemerintah'),
(117, '188.32', 'Peraturan Menteri'),
(118, '188.34', 'Peraturan Daerah'),
(119, '188.4', 'Keputusan'),
(120, '188.41', 'Keputusan Presiden'),
(121, '188.42', 'Keputusan Menteri'),
(122, '188.44', 'Keputusan Gubernur'),
(123, '188.45', 'Keputusan Bupati'),
(124, '193', 'Kerjasama dengan negara asing'),
(125, '200', 'Politik'),
(126, '210', 'Kepartaian'),
(127, '220', 'Ormas'),
(128, '221.2', 'DHC 45'),
(129, '221.3', 'Veteran'),
(130, '222.1', 'PEPABRI'),
(131, '222.2', 'Wreda Tama'),
(132, '236', 'KORPRI'),
(133, '270', 'Pemilu'),
(134, '300', 'Keamanan'),
(135, '320', 'Kemiliteran'),
(136, '321', 'Latihan Militer'),
(137, '331.1', 'Pol PP'),
(138, '332', '332Demonstrasi'),
(139, '333', 'Senjata Api/Tajam'),
(140, '334', 'Bahan Peledak'),
(141, '335', 'Perjudian'),
(142, '337', 'Pengaduan'),
(143, '340', 'Linmas'),
(144, '350', 'Kejahatan'),
(145, '352', 'Pembunuhan'),
(146, '353', 'Penganiayaan/pencurian/perampasan'),
(147, '354', 'Penyelundupan/Narkotika'),
(148, '355', 'Pemalsuan'),
(149, '355.3', 'Kejahatan pemalsuan lainya'),
(150, '356', 'Korupsi/penyelewengan/penyalahgunaan jabatan'),
(151, '357', 'Perkosaan/perbuatan cabul'),
(152, '358', 'Kenakalan'),
(153, '359', 'Kejahatan lainnya'),
(154, '360', 'Bencana'),
(155, '361', 'Gempa Bumi'),
(156, '362', 'Banjir'),
(157, '363', 'Angin Topan'),
(158, '364', 'Kebakaran'),
(159, '365', 'Kekeringan'),
(160, '366', 'Tsunami'),
(161, '367', 'Bancana Gunung Berapi'),
(162, '368', 'Gerakan Tanah/Tanah Longsor'),
(163, '370', 'Kecelakaan'),
(164, '371', 'Kecelakaan Darat'),
(165, '372', 'Kecelakaan Udara'),
(166, '373', 'Kecelakaan Laut'),
(167, '400', 'Kesra'),
(168, '401', 'Keluarga Miskin'),
(169, '410', 'Pembangunan Desa'),
(170, '411', 'Pembinaan Usaha Gotong Royong'),
(171, '411.1', 'Swadaya Gotong Royong'),
(172, '411.11', 'Penataran Gotong Royong'),
(173, '411.2', 'Lembaga Sosial Desa/LKMD/LPMD'),
(174, '411.32', 'KKN'),
(175, '411.4', 'PKK'),
(176, '411.43', 'Kegiatan'),
(177, '411.8', 'Pemberdayaan Perempuan'),
(178, '424', 'Tenaga Pengajar/Guru'),
(179, '425', 'Sarana Pendidikan'),
(180, '425.1', 'Gedung Sekolah'),
(181, '426', 'Keolahragaan'),
(182, '426.1', 'Cabang Olahraga'),
(183, '426.22', 'Stadion'),
(184, '426.24', 'Kolam Renang'),
(185, '426.3', 'Pesta Olahraga'),
(186, '426.4', 'KONI'),
(187, '427', 'Kepemudaan'),
(188, '428', 'Kepramukaan'),
(189, '430', 'Kebudayaan'),
(190, '431', 'Kesenian'),
(191, '432', 'Kepurbakalaan'),
(192, '436', 'Penghayat kepercayaan'),
(193, '440', 'Kesehatan'),
(194, '441.1', 'Gizi'),
(195, '441.5', 'UKS'),
(196, '442', 'Obat-obatan'),
(197, '443', 'Penyakit menular'),
(198, '443.32', 'Imunisasi'),
(199, '443.33', 'Survailance'),
(200, '443.41', 'Malaria'),
(201, '444', 'Gizi'),
(202, '444.5', 'PMT-AS'),
(203, '445', 'Rumah Sakit/ Puskesmas'),
(204, '446', 'Tenaga Medis'),
(205, '450', 'Agama'),
(206, '451', 'Islam'),
(207, '451.12', 'Zakat'),
(208, '451.15', 'MTQ'),
(209, '452', 'Protestan'),
(210, '452.1', 'Tempat Peribadatan'),
(211, '453', 'Katholik'),
(212, '454', 'Hindu'),
(213, '456', 'Haji'),
(214, '456.1', 'ONH'),
(215, '456.2', 'Manasik'),
(216, '460', 'Sosial'),
(217, '462', 'Tuna susila'),
(218, '463', 'Kesejahteraan Keluarga'),
(219, '463.1', 'Anak Putus Sekolah'),
(220, '465', 'Kesejahteraan Sosial'),
(221, '465.1', 'Lanjut Usia'),
(222, '466', 'Sumbangan Sosial'),
(223, '466.1', 'Bantuan Bencana'),
(224, '468', 'PMI'),
(225, '469', 'Makam'),
(226, '470', 'Kependudukan'),
(227, '472.1', 'Kematian,Kelahiran dan advokasi'),
(228, '474.1', 'Kelahiran'),
(229, '474.2', 'NTCR'),
(230, '474.3', 'Kematian'),
(231, '474.4', 'KTP'),
(232, '476', 'KB'),
(233, '478', 'Akte'),
(234, '478.2', 'Akte Kelahiran'),
(235, '480', 'Media Masa'),
(236, '481', 'Penerbitan'),
(237, '481.1', 'Surat Kabar'),
(238, '481.2', 'Majalah'),
(239, '481.3', 'Buku'),
(240, '482', 'Radio'),
(241, '482.1', 'RRI'),
(242, '483', 'Televisi'),
(243, '484', 'film'),
(244, '485', 'Pers'),
(245, '485.11', 'Wawancara'),
(246, '489', 'Humas'),
(247, '500', 'Perekonomian'),
(248, '501', 'Pengadaan Pangan'),
(249, '503', 'Perizinan'),
(250, '510', 'Perdagangan'),
(251, '510.12', 'Iklan'),
(252, '510.13', 'Pameran'),
(253, '510.2', 'Pelelangan'),
(254, '510.3', 'Tera'),
(255, '511', 'Pemasaran'),
(256, '511.1', 'Sembako'),
(257, '511.2', 'Pasar'),
(258, '511.3', 'PKL'),
(259, '512', 'Ekspor'),
(260, '513', 'Impor'),
(261, '518', 'Koperasi'),
(262, '520', 'Pertanian'),
(263, '521', 'Tanaman Pangan'),
(264, '521.32', 'Pembibitan Pertanian'),
(265, '521.31', 'Peralatan Pertanian'),
(266, '521.33', 'Pupuk'),
(267, '521.62', 'Kelompok Tani'),
(268, '521.63', 'KTNA'),
(269, '522', 'Kehutanan'),
(270, '522.21', 'Kayu'),
(271, '522.4', 'Penghijauan'),
(272, '523', 'Perikanan'),
(273, '523.42', 'Pelabuhan perikanan'),
(274, '524', 'Peternakan'),
(275, '524.21', 'Pembibitan'),
(276, '524.3', 'Kesehatan Hewan'),
(277, '525', 'Perkebunan'),
(278, '525.24', 'Tebu'),
(279, '530', 'Perindustrian'),
(280, '540', 'Pertambangan'),
(281, '541', 'Minyak Bumi/Bensin'),
(282, '542', 'Gas Bumi'),
(283, '543', 'Logam Mulia'),
(284, '545', 'Aneka Tambang'),
(285, '546', 'Geologi'),
(286, '546.1', 'Vulkanologi'),
(287, '546.2', 'Sumur Artesis'),
(288, '550', 'Perhubungan'),
(289, '551', 'Perhubungan Darat'),
(290, '551.11', 'Rambu-rambu/keamanan lalu lintas'),
(291, '551.22', 'Terminal'),
(292, '551.24', 'Pengujian Kendaraan Bermotor'),
(293, '552', 'Perhubungan Laut'),
(294, '553', 'Perhubungan Udara'),
(295, '554', 'Pos'),
(296, '555', 'Telekomunikasi'),
(297, '556', 'Pariwisata'),
(298, '556.2', 'Sarana Pariwisata'),
(299, '556.5', 'Sumberdaya Pariwisata '),
(300, '557', 'Meteorologi'),
(301, '557.1', 'Curah Hujan'),
(302, '557.2', 'Ramalan Cuaca'),
(303, '560', 'Tenaga Kerja'),
(304, '560.1', 'Pengangguran'),
(305, '561', 'Upah'),
(306, '562', 'TKI'),
(307, '563', 'Latihan kerja'),
(308, '565', 'Perselisihan Perburuhan'),
(309, '566', 'Keselamatan Kerja'),
(310, '567', 'PHK'),
(311, '568', 'Kesejahteraan Buruh'),
(312, '570', 'Permodalan'),
(313, '580', 'Perbankan'),
(314, '581', 'Kredit'),
(315, '585', 'Asuransi'),
(316, '590', 'Agraria'),
(317, '593', 'Pengurusan hak-hak tanah'),
(318, '594.3', 'Sertifikat'),
(319, '594.4', 'PPAT'),
(320, '595', 'Transmigrasi'),
(321, '600', 'Pekerjaan Umum'),
(322, '601', 'Bangunan Konstruksi'),
(323, '602', 'Kontraktor'),
(324, '604.2', 'Aspal'),
(325, '605.3', 'Instalasi air/sanitasi'),
(326, '610', 'Pengairan'),
(327, '611', 'Irigasi'),
(328, '611.11', 'Bendungan'),
(329, '611.13', 'Pelimpahan banjir'),
(330, '614.17', 'Cek dam'),
(331, '620', 'Jalan'),
(332, '620.04', 'Laporan pembangunan jalan'),
(333, '621.11', 'Tanah untuk jalan'),
(334, '621.5', 'Drainase'),
(335, '621.92', 'Lampu Penerangan'),
(336, '622.52', 'gorong -gorong'),
(337, '630', 'Jembatan'),
(338, '631.72', 'Bronjong'),
(339, '640', 'Bangunan'),
(340, '641', 'Bangunan Pemerintahan'),
(341, '642', 'Bangunan Pendidikan'),
(342, '644', 'Bangunan Perdagangan'),
(343, '645', 'Bangunan pelayanan umum'),
(344, '645.1', 'MCK'),
(345, '645.7', 'Terminal angkutan darat'),
(346, '645.8', 'Bangunan Keagamaan'),
(347, '648', 'Bangunan Tempat Tinggal'),
(348, '648.3', 'REI'),
(349, '650', 'Tata Kota'),
(350, '653', 'Daerah Perumahan'),
(351, '657.212', 'Sampah'),
(352, '658.1', 'Persampahan'),
(353, '6581', 'Persampahan'),
(354, '660', 'Tata Lingkungan'),
(355, '660.1', 'Lingkungan Hidup'),
(356, '660.2', 'Kebersihan Lingkungan'),
(357, '660.3', 'Pencemaran'),
(358, '660.31', 'Pencemaran Air'),
(359, '660.4', 'AMDAL'),
(360, '670', 'Ketenagaan'),
(361, '671', 'Listrik'),
(362, '671.2', 'Pembangkit Tenaga Listrik'),
(363, '671.21', 'PLTA'),
(364, '674', 'tenaga gas'),
(365, '679', 'Energi lainnya'),
(366, '690', 'Air Minum'),
(367, '700', 'Pemeriksaan'),
(368, '780', 'pengawasan bidang kepegawaian'),
(369, '810', 'Pengadaan /Lamaran'),
(370, '811', 'Lamaran'),
(371, '812', 'Pengujian Kesehatan'),
(372, '813', 'Pengangkatan Calon Pegawai'),
(373, '814', 'Tenaga Lepas/Kontrak'),
(374, '820', 'Pengangkatan dan Mutasi'),
(375, '821.1', 'Pengangkatan Menjadi PNS'),
(376, '821.2', 'Pengangkatan dalam jabatan'),
(377, '821.29', 'Mutasi Jabatan'),
(378, '822', 'Kenaikan Gaji Berkala'),
(379, '823', 'Kenaikan Pangkat'),
(380, '824', 'Pemindahan'),
(381, '824.2', 'Mutasi Gol. II'),
(382, '824.3', 'Mutasi Gol III'),
(383, '824.4', 'Mutasi Gol IV'),
(384, '840', 'Kesejahteraan Pegawai'),
(385, '841', 'Tunjangan'),
(386, '841.1', 'Tunjangan Jabatan'),
(387, '841.3', 'Tunjangan Kematian'),
(388, '841.4', 'Tunjangan Hari Raya'),
(389, '842.1', 'Taspen'),
(390, '842.3', 'Asuransi'),
(391, '843', 'Perawatan Kesehatan'),
(392, '845', 'Perumahan/Tanah'),
(393, '845.4', 'BAPETARUM'),
(394, '847', 'Rekreasi'),
(395, '848', 'Dispensasi'),
(396, '848.1', 'Izin Belajar'),
(397, '850', 'Cuti'),
(398, '851', 'Cuti Tahunan'),
(399, '852', 'Cuti Besar'),
(400, '853', 'Cuti Sakit'),
(401, '854', 'Cuti Hamil'),
(402, '855', 'Cuti Naik Haji'),
(403, '856', 'Cuti diLuar Tanggungan Negara'),
(404, '857', 'Cuti Alasan Lain'),
(405, '860', 'Penilaian'),
(406, '861', 'Penghargaan Pegawai'),
(407, '862', 'Hukuman'),
(408, '863', 'Konduite'),
(409, '864', 'Ujian Dinas'),
(410, '875.2', 'Specimen tanda tangan'),
(411, '876', 'Penggajian'),
(412, '876.1', 'SKPP Pensiun'),
(413, '877', 'Sumpah Pegawai'),
(414, '882', 'Pensiun'),
(415, '883', 'Karena meninggal'),
(416, '890', 'Pendidikan Pegawai'),
(417, '892', 'Pendidikan Reguler'),
(418, '892.1', 'IIP'),
(419, '892.2', 'STPDN'),
(420, '893', 'Pendidikan Reguler'),
(421, '893.3', 'Diklat'),
(422, '895.4', 'Study Banding'),
(423, '896.2', 'Permintaan Tenaga Pengajar'),
(424, '900', 'Keuangan'),
(425, '900.04', 'Laporan keuangan'),
(426, '902', 'APBN'),
(427, '903', 'APBD'),
(428, '910', 'Anggaran'),
(429, '930', 'Verifikasi'),
(430, '931', 'SPM Rutin'),
(431, '936', 'Nota Pemeriksaan'),
(432, '950', 'Perbendaharaan'),
(433, '953', 'pengangkatan/pemberhentian Bendahara '),
(434, '963', 'Laporan Bendahara'),
(435, '970', 'Pendapatan'),
(436, '973', 'Pajak'),
(437, '974', 'Retribusi'),
(438, '975', 'Bea'),
(439, '976', 'Cukai'),
(440, '978.4', 'Bantuan Bupati'),
(441, '980', 'Dana Bagi Hasil'),
(442, '990', 'Bendaharawan'),
(443, 'x.700', 'Pengawasan'),
(444, 'X.780', 'Pengawasan Bidang Kepegawaian'),
(445, '524.2', 'Sarana usaha Peternakan'),
(446, '441', 'Pembinaan Kesehatan'),
(447, '676', 'Tenaga Nuklir'),
(448, '800', 'Kepegawaian'),
(449, '014', 'Rumah Susun / Apartemen'),
(450, '033', 'Tanah Ex Bengkok'),
(451, '043', 'Notulen'),
(452, '979', 'Hibah'),
(453, '815', 'Permohonan panitia barang/jasa'),
(454, '663', 'Daerah Permukiman'),
(455, '646.4', 'Rumah tradisioanal/ Rumah khas malanagan'),
(456, '648.11', 'Inti /Sederhana'),
(457, '586', 'Alat pembayaran, cek, giro, wesel, transfer'),
(458, '978.2', 'Bantuan Menteri'),
(459, '075', 'Departemen'),
(460, '870', 'Tata Usaha Kepegawaian'),
(461, '912', 'Dokumen Pelaksanaan Anggaran (DPA)'),
(462, '602.1', 'Tender'),
(463, '978', 'Bantuan Presiden, Menteri & Bantuan lainnya'),
(464, '828', 'Mutasi pegawai ke instasi lain'),
(465, '029', 'LCD'),
(466, '130.4', 'Laporan Daerah'),
(467, '414.4', 'Lomba desa'),
(468, '411.81', 'TOR dan GBS'),
(469, '015', 'Penerangan Listrik / Jasa Listrik'),
(470, '005', 'Undangan'),
(471, '000', 'Surabaya');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `jenis_kegiatan`
--

INSERT INTO `jenis_kegiatan` (`id`, `biodata_id`, `title`, `jumlah`, `satuan`, `point`) VALUES
(2, 3, 'Lain 01', 1, 'm', ''),
(3, 3, 'Lain 02', 2, 'm', ''),
(5, 4, 'Kegiatan Lain 01', 1, '2', '3'),
(6, 4, 'Kegiatan Lain 02', 11, '22', '33'),
(7, 5, 'Kegiatan Lain 01', 1, 'lembar', '1'),
(8, 5, 'Kegiatan Lain 02', 1, 'lembar', '1'),
(9, 2, 'Fotokopi', 1, 'lembar', '0');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `jenis_skp`
--

INSERT INTO `jenis_skp` (`id`, `biodata_id`, `title`, `jumlah`, `satuan`, `point`) VALUES
(3, 3, 'Jenis SKP 1', 1, 'cm', 0),
(4, 3, 'Jenis SKP 2', 2, 'cm', 0),
(6, 4, 'Herry Jenis SKP 01', 1, 'unit', 0),
(7, 4, 'Herry Jenis SKP 02', 2, 'unit', 0),
(8, 5, 'Jenis SKP 01', 1440, 'unit', 1),
(9, 5, 'Jenis SKP 02', 1, 'unit', 1),
(10, 2, 'Mendeteksi kerusakan jaringan', 1, 'unit', 0),
(11, 5, 'Membuat Nodin', 1, 'lembar', 0),
(12, 5, 'Membuat Nota Dinas', 60, 'Naskah', 0);

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
  `kual` int(11) NOT NULL,
  `kendala` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `kegiatan_skp`
--

INSERT INTO `kegiatan_skp` (`id`, `biodata_id`, `jenis_skp_id`, `jenis_kegiatan_id`, `no_urut`, `tanggal`, `waktu`, `type_row`, `kual`, `kendala`, `keterangan`) VALUES
(18, 2, 10, 0, 1, '2014-05-05', '14:45:13', 1, 0, '', ''),
(19, 2, 0, 9, 2, '2014-05-05', '14:51:38', 2, 0, '', ''),
(20, 5, 8, 0, 1, '2014-05-07', '09:39:19', 1, 0, '', ''),
(21, 5, 0, 8, 2, '2014-05-07', '13:39:19', 2, 0, '', '');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `nota_dinas`
--

INSERT INTO `nota_dinas` (`id`, `no_urut`, `no_surat`, `surat_dari`, `disposisi_kepada`, `perihal`, `posisi`, `tanggal_disposisi`, `tanggal_surat`, `tanggal_terima`, `catatan`, `file_surat`) VALUES
(5, 1, '2', '3', '4', '5', '6', '0000-00-00', '2014-03-17', '0000-00-00 00:00:00', '', '2014/03/17/20140317_082031_2967.jpg'),
(6, 2, '1', '1', '1', '1', '1', '2014-03-17', '2014-03-17', '2014-03-17 10:06:36', '', ''),
(10, 4, '123', '123', '', '123', '', '0000-00-00', '2014-04-15', '0000-00-00 00:00:00', '', ''),
(9, 3, '11111', '111', '', '11111', '', '0000-00-00', '2014-04-01', '0000-00-00 00:00:00', '', ''),
(11, 5, '989898', 'adfa', 'bhjbhjbh', 'hjbhjhjb', 'seesese', '0000-00-00', '2014-05-07', '2014-05-07 09:54:04', '', '');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `nota_dinas_disposisi`
--

INSERT INTO `nota_dinas_disposisi` (`id`, `nota_dinas_id`, `nota_dinas_kepada_id`, `waktu`, `waktu_diff`) VALUES
(3, 9, 1, '2014-04-14 13:41:02', ''),
(8, 9, 3, '2014-04-14 13:54:43', '821'),
(9, 9, 2, '2014-04-14 13:54:48', '5'),
(10, 10, 1, '2014-04-14 13:54:24', ''),
(11, 10, 3, '2014-04-14 13:54:45', '21'),
(12, 10, 2, '2014-04-14 13:54:51', '6'),
(13, 11, 1, '2014-05-07 09:55:07', ''),
(14, 11, 3, '2014-05-07 09:55:35', '28');

-- --------------------------------------------------------

--
-- Table structure for table `nota_dinas_kepada`
--

CREATE TABLE IF NOT EXISTS `nota_dinas_kepada` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `hidden` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

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
-- Table structure for table `perilaku_kerja`
--

CREATE TABLE IF NOT EXISTS `perilaku_kerja` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `no_urut` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=59 ;

--
-- Dumping data for table `skpd`
--

INSERT INTO `skpd` (`id`, `title`, `kepala`, `instansi`, `hp`, `email`, `keterangan`) VALUES
(1, 'ASISTEN ADMINISTRASI', '', 'ASISTEN ADMINISTRASI', '', '', ''),
(2, 'BAGIAN TATA PEMERINTAHAN DESA', '', 'BAGIAN TATA PEMERINTAHAN DESA', '', '', ''),
(3, 'BAGIAN HUKUM', '', 'BAGIAN HUKUM', '', '', ''),
(4, 'BAGIAN PERTANAHAN', '', 'BAGIAN PERTANAHAN', '', '', ''),
(5, 'ASISTEN PEREKONOMIAN & PEMBANGUNAN', '', 'ASISTEN PEREKONOMIAN & PEMBANGUNAN', '', '', ''),
(6, 'BAGIAN PEREKONOMIAN', '', 'BAGIAN PEREKONOMIAN', '', '', ''),
(7, 'BAGIAN KERJASAMA', '', 'BAGIAN KERJASAMA', '', '', ''),
(8, 'BAGIAN ADMINISTRASI PEMBANGUNAN', '', 'BAGIAN ADMINISTRASI PEMBANGUNAN', '', '', ''),
(9, 'BAGIAN PDE', '', 'BAGIAN PDErgr', '', '', ''),
(10, 'BAGIAN TATA USAHA', '', 'BAGIAN TATA USAHA', '', '', ''),
(11, 'BAGIAN UMUM & PROTOKOL', '', 'BAGIAN UMUM & PROTOKOL', '', '', ''),
(12, 'ASISTEN PEREKONOMIAN & PEMBANGUNAN', '', 'ASISTEN PEREKONOMIAN & PEMBANGUNAN', '', '', ''),
(13, 'BAGIAN HUMAS', '', 'BAGIAN HUMAS', '', '', ''),
(14, 'BAGIAN ORGANISASI', '', 'BAGIAN ORGANISASI', '', '', ''),
(15, 'ASISTEN PEREKONOMIAN & PEMBANGUNAN', '', 'ASISTEN PEREKONOMIAN & PEMBANGUNAN', '', '', ''),
(16, 'BAGIAN KESRA', '', 'BAGIAN KESRA', '', '', ''),
(17, 'DPRD KABUPATEN MALANG', '', 'SEKWAN DPR', '', '', ''),
(18, 'SEKRETARIAT DPRD', '', 'SEKRETARIAT DPRD', '', '', ''),
(19, 'DINAS PENDIDIKAN', '', 'DINAS PENDIDIKAN', '', '', ''),
(20, 'DINAS PEMUDA DAN OLAHRAGA', '', 'DINAS PEMUDA DAN OLAHRAGA', '', '', ''),
(21, 'DINAS KESEHATAN', '', 'DINAS KESEHATAN', '', '', ''),
(22, 'DINAS SOSIAL', '', 'DINAS SOSIAL', '', '', ''),
(23, 'DISNAKER & TRANSMIGRASI', '', 'DISNAKER & TRANSMIGRASI', '', '', ''),
(24, 'DISHUB & KOMINFO', '', 'DISHUB & KOMINFO', '', '', ''),
(25, 'DISPENDUK & CAPIL', '', 'DISPENDUK & CAPIL', '', '', ''),
(26, 'DINAS KEBUDAYAAN & PARIWISATA', '', 'DINAS KEBUDAYAAN & PARIWISATA', '', '', ''),
(27, 'DINAS BINA MARGA', '', 'DINAS BINA MARGA', '', '', ''),
(28, 'DINAS PENGAIRAN', '', 'DINAS PENGAIRAN', '', '', ''),
(29, 'DINAS CIPTA KARYA & TATA RUANG', '', 'DINAS CIPTA KARYA & TATA RUANG', '', '', ''),
(30, 'DINAS KOPERASI & UMKM', '', 'DINAS KOPERASI & UMKM', '', '', ''),
(31, 'DISPERINDAG & PASAR', '', 'DISPERINDAG & PASAR', '', '', ''),
(32, 'DINAS PERTANIAN & PERKEBUNAN', '', 'DINAS PERTANIAN & PERKEBUNAN', '', '', ''),
(33, 'DINAS KELAUTAN & PERIKANAN', '', 'DINAS KELAUTAN & PERIKANAN', '', '', ''),
(34, 'DINAS KEHUTANAN', '', 'DINAS KEHUTANAN', '', '', ''),
(35, 'DINAS ENERGI & SDM', '', 'DINAS ENERGI & SDM', '', '', ''),
(36, 'DINAS PETERNAKAN', '', 'DINAS PETERNAKAN', '', '', ''),
(37, 'DPPKA', '', 'DPPKA', '', '', ''),
(38, 'INSPEKTORAT', '', 'INSPEKTORAT', '', '', ''),
(39, 'BKD', '', 'BKD', '', '', ''),
(40, 'BAPPEKAB', '', 'BAPPEKAB', '', '', ''),
(41, 'BALITBANG', '', 'BALITBANG', '', '', ''),
(42, 'BAKESBANGPOL', '', 'BAKESBANGPOL', '', '', ''),
(43, 'BADAN LH', '', 'BADAN LH', '', '', ''),
(44, 'BADAN KETAHANAN PANGAN & PP', '', 'BADAN KETAHANAN PANGAN & PP', '', '', ''),
(45, 'BADAN PEMBERDAYAAN MASYARAKAT', '', 'BADAN PEMBERDAYAAN MASYARAKAT', '', '', ''),
(46, 'BANDIKLAT', '', 'BANDIKLAT', '', '', ''),
(47, 'BADAN KELUARGA BERENCANA', '', 'BADAN KELUARGA BERENCANA', '', '', ''),
(48, 'BADAN PERPUS, ARSIP & DOKUMENTASI', '', 'BADAN PERPUS, ARSIP & DOKUMENTASI', '', '', ''),
(49, 'KANTOR PENANAMAN MODAL', '', 'KANTOR PENANAMAN MODAL', '', '', ''),
(50, 'KANTOR PEMBERDAYAAN PEREMPUAN & PA', '', 'KANTOR PEMBERDAYAAN PEREMPUAN & PA', '', '', ''),
(51, 'KANTOR PERUMAHAN', '', 'KANTOR PERUMAHAN', '', '', ''),
(52, 'RSUD KANJURUHAN', '', 'RSUD KANJURUHAN', '', '', ''),
(53, 'SATPOL PP & LINMAS', '', 'SATPOL PP & LINMAS', '', '', ''),
(54, 'UPT PERIJINAN', '', 'UPT PERIJINAN', '', '', ''),
(55, 'PD JASA YASA', '', 'PD JASA YASA', '', '', ''),
(56, 'PDAM', '', 'PDAM', '', '', ''),
(57, 'SEKRETARIAT KOMISI PEMILIHAN UMUM', '', 'SEKRETARIAT KOMISI PEMILIHAN UMUM', '', '', ''),
(58, 'BAGIAN TATA PEMERINTAHAN UMUM', '', 'xxx', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `skp_kreativitas`
--

CREATE TABLE IF NOT EXISTS `skp_kreativitas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `biodata_id` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `perhitungan` varchar(50) NOT NULL,
  `nilai_capaian` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `skp_pejabat`
--

CREATE TABLE IF NOT EXISTS `skp_pejabat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `biodata_id` int(11) NOT NULL,
  `pangkat_id` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `posisi` varchar(100) NOT NULL COMMENT 'Pejabat Penilai / Atasan Pejabat Penilai',
  `nama` varchar(100) NOT NULL,
  `nip` varchar(50) NOT NULL,
  `jabatan` varchar(255) NOT NULL,
  `unit_kerja` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `skp_perilaku_kerja`
--

CREATE TABLE IF NOT EXISTS `skp_perilaku_kerja` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `biodata_id` int(11) NOT NULL,
  `perilaku_kerja_id` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `nilai` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `skp_realisasi`
--

CREATE TABLE IF NOT EXISTS `skp_realisasi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `biodata_id` int(11) NOT NULL,
  `skp_sasaran_kerja_id` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `waktu_nilai` int(11) NOT NULL,
  `waktu_satuan` varchar(50) NOT NULL,
  `biaya` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `skp_sasaran_kerja`
--

CREATE TABLE IF NOT EXISTS `skp_sasaran_kerja` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `biodata_id` int(11) NOT NULL,
  `jenis_skp_id` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `ak` int(11) NOT NULL,
  `kuant_nilai` int(11) NOT NULL,
  `kual` int(11) NOT NULL,
  `waktu_nilai` int(11) NOT NULL,
  `waktu_satuan` varchar(50) NOT NULL,
  `biaya` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `skp_summary`
--

CREATE TABLE IF NOT EXISTS `skp_summary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `biodata_id` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `tanggal_pembuatan` date NOT NULL,
  `tanggal_penilaian` date NOT NULL,
  `keberatan` varchar(255) NOT NULL,
  `tanggal_keberatan` date NOT NULL,
  `tanggapan` varchar(255) NOT NULL,
  `tanggal_tanggapan` date NOT NULL,
  `keputusan` varchar(255) NOT NULL,
  `tanggal_keputusan` date NOT NULL,
  `rekomendasi` varchar(255) NOT NULL,
  `tanggal_dibuat` date NOT NULL,
  `tanggal_diterima_pns` date NOT NULL,
  `tanggal_diterima_atasan` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `skp_tugas_tambahan`
--

CREATE TABLE IF NOT EXISTS `skp_tugas_tambahan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `biodata_id` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `perhitungan` varchar(50) NOT NULL,
  `nilai_capaian` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  `order_no` int(11) NOT NULL,
  `hidden` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `surat_destination`
--

INSERT INTO `surat_destination` (`id`, `title`, `order_no`, `hidden`) VALUES
(1, 'Surat diterima', 0, 1),
(2, 'Kasubag Keu. & Kepeg.', 3, 0),
(3, 'Kasubag AE', 1, 0),
(4, 'Kasubag Sanditel', 2, 0);

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1386 ;

--
-- Dumping data for table `surat_keluar`
--

INSERT INTO `surat_keluar` (`id`, `index_surat_id`, `no_urut`, `no_surat`, `pengolah`, `tujuan`, `tanggal_surat`, `lampiran`, `perihal`, `catatan`, `file_surat`) VALUES
(1, 85, 2, '094/015/421.206/2013', 'BADAN LH', 'Surat Keluar ', '2014-01-03', '-', 'Surat Tugas ', '', 'D:\\Hasil Scan\\IMG_20140107_0011.jpg'),
(2, 297, 3, '556/014/421.3108/2013', '3108', 'Surat Keluar ', '2014-01-03', '-', 'Surat Tugas ', '', 'D:\\Hasil Scan\\IMG_20140107_0012.jpg'),
(3, 85, 4, '094/013/421.051/2013', 'SEKRETARIAT DPRD', 'Surat Keluar ', '2014-01-03', '-', 'Surat Tugas ', '', 'D:\\Hasil Scan\\IMG_20140107_0013.jpg'),
(4, 85, 5, '094/011/421.111/2013', 'DINAS CIPTA KARYA & TATA RUANG', 'Surat Keluar ', '2014-01-03', '-', 'Surat Tugas ', '', 'D:\\Hasil Scan\\IMG_20140107_0015.jpg'),
(5, 85, 6, '094/012/421.111/2013', 'DINAS CIPTA KARYA & TATA RUANG', 'Surat Keluar ', '2014-01-03', '-', 'Surat Tugas ', '', 'D:\\Hasil Scan\\IMG_20140107_0014.jpg'),
(6, 88, 7, '100/009/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NPKND', '2014-01-03', '-', 'Penjelasan Perpanjangan HGU Perkebunan PTPN XII (Persero) Kalibakar ', '', 'D:\\Hasil Scan\\IMG_20140107_0016.jpg'),
(7, 88, 8, '100/006/421.011/2013', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Nota Dinas ', '2014-01-03', '-', 'Pelaksanaan Kegiatan Bina Desa di Bulan Januari 2014', '', 'D:\\Hasil Scan\\IMG_20140107_0017.jpg'),
(8, 88, 9, '100/005/421.011/2013', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NPKND ', '2014-01-03', '-', 'Pelaksanaan Kegiatan Bina Desa di Bulan Januari 2014', '', 'D:\\Hasil Scan\\IMG_20140107_0018.jpg'),
(9, 70, 10, '065/037/421.034/2014', 'BAGIAN ORGANISASI', 'Surat Keluar ', '2014-01-07', '-', 'Penyusunan SOP di Lingkungan Sekretariat Daerah Kabupaten Malang ', '', 'D:\\Hasil Scan\\IMG_20140107_0001.jpg'),
(10, 65, 11, '060/036/421.034/2014', 'BAGIAN ORGANISASI', 'Surat Keluar ', '2014-01-07', '-', 'Peningkatan Kualitas Pelayanan Kepada Masyarakat ', '', 'D:\\Hasil Scan\\IMG_20140107_0002.jpg'),
(11, 88, 12, '100/034/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Nota Dinas ', '2014-01-07', '-', 'Rakor Pelaksanaan Bina Desa di Desa Sukoanyar Kec. Pakis ', '', 'D:\\Hasil Scan\\IMG_20140107_0003.jpg'),
(12, 88, 13, '100/033/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Nota Dinas ', '2014-01-07', '-', 'laporan Hasil Evaluasi dan Pendataan Sarana Prasarana Kec. Dalam Rangka Pelayanan Admin Terpadu Kec. (PATEN) ', '', 'D:\\Hasil Scan\\IMG_20140107_0004.jpg'),
(13, 88, 14, '100/029/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NPKND ', '2014-01-07', '-', 'Pelaksanaan Kegiatan Bina Desa di Desa Sukoanyar Kec. Pakis ', '', 'D:\\Hasil Scan\\IMG_20140107_0005.jpg'),
(14, 88, 15, '100/028/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NPKND ', '2014-01-07', '-', 'Pelaksanaan Kegiatan Bina Desa di Desa Sukoanyar Kec Pakis ', '', 'D:\\Hasil Scan\\IMG_20140107_0006.jpg'),
(15, 88, 16, '100/027/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NPKND ', '2014-01-07', '-', 'Permohonan Untuk Tidak Dilakukan Pemadaman Listrik ', '', 'D:\\Hasil Scan\\IMG_20140107_0007.jpg'),
(16, 246, 17, '489/026/421.033/2014', 'BAGIAN HUMAS', 'Surat Keluar ', '2014-01-07', '-', 'Usulan Tema Talk Show  ', '', 'D:\\Hasil Scan\\IMG_20140107_0008.jpg'),
(17, 206, 18, '451/023/421.042/2014', 'BAGIAN BINTAL', 'Nota Dinas ', '2014-01-07', '-', 'Usulan Peringatan Maulid Nabi Muhammad SAW Tingkat Kabupaten Malang Tahun 1435 H/2014M ', '', 'D:\\Hasil Scan\\IMG_20140107_0009.jpg'),
(18, 206, 19, '451/022/421.042/2014', 'Bagian Bintal ', 'NPKND ', '2014-01-07', '-', 'Usulan Peringatan Maulid Nabi Muhammad SAW Tingkat Kabupaten Malang Tahun 1435 H/2014M ', '', 'D:\\Hasil Scan\\IMG_20140107_0010.jpg'),
(19, 316, 20, '590/117/421.014/2014', 'BAGIAN PERTANAHAN', 'Nota Dinas ', '2014-01-13', '-', 'Laporan Tindak Lanjut Pengadaan Tanah yang Digunakan untuk Pembangunan Jalan Tol Pandaan-Malang ', '', 'D:\\Hasil Scan\\IMG_20140116_0015.jpg'),
(20, 280, 21, '540/116/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Nota Dinas ', '2014-01-13', '-', 'Telaah Permasalahan Perijinan Pertambangan Ijin Usaha Pertambangan (IUP) Operasi Produksi PT. Mamora ', '', 'D:\\Hasil Scan\\IMG_20140116_0014.jpg'),
(21, 280, 22, '540/115/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NPKND ', '2014-01-13', '-', 'Telaah Permasalahan Perijinan Pertambangan Ijin Usaha Pertambangan (IUP) Operasi Produksi PT. Mamora ', '', 'D:\\Hasil Scan\\IMG_20140116_0013.jpg'),
(22, 280, 23, '562.1/112/421.105/2014', 'DISNAKER & TRANSMIGRASI', 'Surat Keluar ', '2014-01-13', '-', 'Surat Ijin Memperkerjakan Tenaga Kerja Asing Perpanjangan Diwilayah Kabupaten Malang ', '', 'D:\\Hasil Scan\\IMG_20140116_0004.jpg'),
(23, 85, 24, '094/110/421.214/2014', 'KANTOR PERUMAHAN', 'Surat Keluar ', '2014-01-13', '-', 'Surat Tugas ', '', 'D:\\Hasil Scan\\IMG_20140116_0005.jpg'),
(24, 85, 25, '094/111/421.214/2014', 'KANTOR PERUMAHAN', 'Surat Keluar ', '2014-01-13', '-', 'Surat Tugas ', '', 'D:\\Hasil Scan\\IMG_20140116_0006.jpg'),
(25, 85, 26, '094/109/421.214/2014', 'KANTOR PERUMAHAN', 'Surat Keluar ', '2014-01-13', '-', 'Surat Tugas ', '', 'D:\\Hasil Scan\\IMG_20140116_0007.jpg'),
(26, 88, 27, '100/107/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NPKND', '2014-01-13', '1 Berkas', 'Persiapan Kegiatan Bina Desa (Bhakti Sosial Menata Desa) di Desa Sukoanyar Kec.Pakis', '', 'D:\\Hasil Scan\\IMG_20140116_0009.jpg'),
(27, 88, 28, '100/108/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Nota Dinas', '2014-01-13', '1 Berkas', 'Persiapan Kegiatan Bina Desa (Bhakti Sosial Menata Desa) di Desa Sukoanyar Kec.Pakis', '', 'D:\\Hasil Scan\\IMG_20140116_0008.jpg'),
(28, 85, 29, '094/126/421.201/2014', 'INSPEKTORAT', 'Surat Keluar ', '2014-01-15', '-', 'Surat Tugas ', '', 'D:\\Hasil Scan\\IMG_20140127_0002.jpg'),
(29, 85, 30, '539/121/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Surat Keluar ', '2014-01-15', '-', 'Pelaksanaan Rapat Umum Pemegang Saham (RUPS) Lainnya PT. BPR Artha Kanjuruhan ', '', ''),
(30, 85, 31, '539/120/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Nota Dinas ', '2014-01-15', '-', 'Pembahasan Rencana Kerja dan Anggaran Perusahaan (RKAP) PDAM dan PD. Jasa Yasa Kabupaten Malang Tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140116_0005.jpg'),
(31, 85, 32, '539/118/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NPKND ', '2014-01-15', '-', 'Telaah Terkait Rencana Kerjasama antara PDAM dengan PD. Jasa Yasa untuk Pemanfaatan Lahan dan Sumber Air di Pemandian Metro Kepanjen ', '', 'D:\\Hasil Scan\\IMG_20140116_0006.jpg'),
(32, 85, 33, '539/119/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Nota Dinas', '2014-01-15', '4 berkas', 'Telaah Terkait Kerjasama antara PDAM dengan PD. Jasa Yasa Pemanfaatan Lahan Dan Sumber Air di Pemandian Metro Kepanjen', '', 'D:\\Hasil Scan\\IMG_20140116_0007.jpg'),
(33, 81, 34, '090/123/421.052/2013', '052', 'Surat Tugas ', '2014-01-15', '-', 'Menghadiri Peringatan Hari Kesetiakawanan Sosial Nasional pada Hari Sabtu tgl 28 Desember 2013 di Lap.Kawi Ds.Jatiguwi Kec.Sumberpucung', '', 'D:\\Hasil Scan\\IMG_20140116_0008.jpg'),
(34, 297, 35, '556/013/421.108/2014', 'DINAS KEBUDAYAAN & PARIWISATA', 'Telaah Staf', '2014-01-15', '1 berkas', 'Laporan Telaah Atas Proposal Investasi dengan Pola Build-Operate-Transfer Aset Milik Pem.Kab.Malang yg Berlokasi Di Taman Wisata Air Wendit', '', ''),
(35, 316, 36, '590/068/421.014/2014', 'BAGIAN PERTANAHAN', 'NPKND', '2014-01-15', '1 Berkas', 'Penerbitan Keputusan Bupati MALANG Tentang Tim Tukar Menukar Kawasan Hutan Kab.Malang', '', 'D:\\Hasil Scan\\IMG_20140116_0009.jpg'),
(36, 316, 37, '590/069/421.014/2014', 'BAGIAN PERTANAHAN', 'Nota Dinas ', '2014-01-15', '1 Berkas ', 'Penerbitan Keputusan Bupati MALANG Tentang  Tim Tukar Menukar Kawasan Hutan Kab.Malang', '', 'D:\\Hasil Scan\\IMG_20140116_0010.jpg'),
(37, 448, 38, '800/039/421.215/2014', 'RSUD KANJURUHAN', 'Surat Perintah Tugas ', '2014-01-15', '-', 'Menjadi Peserta Kegiatan Seminar Nasional ''Bayang-bayang Risiko Hukum,Fraud dan Abuse dalam Pelaksanaan JKN'' Pada tanggal 10 Januari 2014 di Hotel Menara Peninsula, Jl.Letjend.S Parman, Kav. 93-94 Slipi Jakarta', '', 'D:\\Hasil Scan\\IMG_20140116_0011.jpg'),
(38, 81, 39, '090/044/421.052/2013', '052', 'Surat Tugas', '2014-01-15', '-', 'Menghadiri Peringatan Hari Kesetiakawanan Sisoal Nasional pada Hari Sabtu tgl 28 Desember 2013 di Lap.Kawi Ds.Jatiguwi Kec.Sumberpucung', '', 'D:\\Hasil Scan\\IMG_20140116_0012.jpg'),
(39, 88, 40, '100/047/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', '-', '2014-01-15', '-', 'Permohonan Untuk Tidak Di Lakukan Pemadaman Listrik ', '', 'D:\\Hasil Scan\\IMG_20140116_0013.jpg'),
(40, 88, 41, '100/046/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', '-', '2014-01-15', '-', 'Kegiatan Bina Desa Di Ds.Sukoanyar Kec.Pakis', '', 'D:\\Hasil Scan\\IMG_20140116_0014.jpg'),
(41, 88, 42, '100/045/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', '-', '2014-01-15', '1 Berkas', 'Kegiatan Bina Desa Ke-21 di Desa Sukoanyar Kec.Pakis', '', 'D:\\Hasil Scan\\IMG_20140116_0015.jpg'),
(42, 316, 43, '590/055/421.014/2014', 'BAGIAN PERTANAHAN', 'NPKND', '2014-01-15', '1 Berkas', 'Surat Tugas Dalam Rangka Menindaklanjuti Proses Tukar Menukar Kawasan Hutan dan Perubahan Fungsi Kawasan Hutan lindung menjadi Hutan Produksi di PPI Pondok Dadap', '', 'D:\\Hasil Scan\\IMG_20140116_0014.jpg'),
(43, 316, 44, '590/054/421.014/2014', 'BAGIAN PERTANAHAN', 'NPKND', '2014-01-15', '1 Berkas', 'Penanganan Masalah Tanah Negara Yang Dikelola oleh PT. Perkebunan Nusantara XII (Persero) Kebun Kalibakar Kec.Tirtoyudo Kab.Malang', '', 'D:\\Hasil Scan\\IMG_20140116_0015.jpg'),
(44, 316, 45, '590/056/421.014/2014', 'BAGIAN PERTANAHAN', 'NPKND', '2014-01-15', '1 Berkas', 'Rencana Pelaksana Pengadaan Tanah Tahun Anggaran 2014', '', 'D:\\Hasil Scan\\IMG_20140127_0006.jpg'),
(45, 296, 46, '555/058/421.024/2014', 'BAGIAN PDE', 'NPKND', '2014-01-15', '2 Berkas', 'Pengajuan Naskah Kesepakatan Bersama Antara PT.Telkom Pem.Kab.Malang', '', 'D:\\Hasil Scan\\IMG_20140116_0016.jpg'),
(46, 296, 47, '555/059/421.014/2014', 'BAGIAN PERTANAHAN', 'Nota Dinas', '2014-01-15', '3 Berkas', 'Pengajuan Naskah Kesepakatan Bersama Antara PT.Telkom dgn Pem.Kab.Malang', '', 'D:\\Hasil Scan\\IMG_20140116_0013.jpg'),
(47, 250, 48, '510/060/421.113/2014', 'DISPERINDAG & PASAR', '-', '2014-01-15', '-', 'Dukungan Untuk Menjadi Distibutor Pupuk Bersubsidi di Kab.Malang', '', 'D:\\Hasil Scan\\IMG_20140116_0012.jpg'),
(48, 63, 49, '050/072/421.203/2014', 'BAPPEKAB', 'Telaah Staf', '2014-01-15', '-', 'Kepindahan Kantor BAPPEDA Kab.Malang ke Kepanjen', '', 'D:\\Hasil Scan\\IMG_20140116_0010.jpg'),
(49, 416, 50, '890/061/421.023/2014', 'BAGIAN ADMINISTRASI PEMBANGUNAN', '-', '2014-01-15', '1 Bendel', 'Sertifikat Ahli Pengadaan Barang atau Jasa Pemerintah', '', 'D:\\Hasil Scan\\IMG_20140116_0011.jpg'),
(50, 63, 51, '050/064/421.023/2014', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'Surat Keluar', '2014-01-15', '-', 'Permintaan Data Anggota Tim Penyusun Standart Harga Satuan Dan Pedoman Pelaksanaan APBD TA 2015', '', 'D:\\Hasil Scan\\IMG_20140116_0009.jpg'),
(51, 88, 52, '100/063/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NPKND', '2014-01-15', '1 Berkas', 'Penyampaian Data Laporan Penyelenggaraan Pemerintah Daerah Tahun 2013', '', 'D:\\Hasil Scan\\IMG_20140116_0008.jpg'),
(52, 63, 53, '050/062/421.023/2014', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'Surat Keluar', '2014-01-15', '', 'Permintaan Data Harga Perkiraan Sendiri (HPS) Tahun Anggaran 2015', '', 'D:\\Hasil Scan\\IMG_20140116_0005.jpg'),
(53, 316, 54, '590/065/421.014/2014', 'BAGIAN PERTANAHAN', 'NPKND', '2014-01-15', '1 Berkas', 'Laporan Hasil Pengadaan Tanah Untuk Kepentingan Pembangunan Tahun Anggaran 2013', '', 'D:\\Hasil Scan\\IMG_20140116_0007.jpg'),
(54, 316, 55, '590/066/421.014/2014', 'BAGIAN PERTANAHAN', 'Nota Dinas', '2014-01-15', '1 Berkas', 'Laporan Hasil Pengadaan Tanah Untuk Kepentingan Pembangunan Tahun Anggaran 2013', '', 'D:\\Hasil Scan\\IMG_20140116_0006.jpg'),
(55, 40, 56, '028/067/421.119/2014', 'DPPKA', 'Surat Edaraan', '2014-01-15', ' 2 Lembar', 'Rencana Kebutuhan Barang Unit dan Rencana Kebutuhan Pemelihara Barang Unit Tahun Anggaran 2014', '', 'D:\\Hasil Scan\\IMG_20140116_0004.jpg'),
(56, 85, 57, '094/084/421.014/2014', 'BAGIAN PERTANAHAN', 'Surat Tugas ', '2014-01-15', '-', 'Koordinasi dan Konsultasi Tindaklanjut Proses Tukar Menukar Kawasan Hutan Serta Tindaklanjut Perubahan Fungsi Kawasan Hutan Lindung Menjadi Hutan Produksi ke Direktorat Jenderal Planologi Kehutanan Kementrian Kehutanan di Jakarta selama 2 hari Kamis tgl 9', '', 'D:\\Hasil Scan\\IMG_20140116_0003.jpg'),
(57, 85, 58, '539/099/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Nota Dinas', '2014-01-15', '4 Berkas', 'Telaah Terkait Rencana Kerjasama antara PDAM dengan PD.Jasa Yasa untuk Pemanfaatan Lahan dan Sumber Air di Pemandian Metro Kepanjen', '', 'D:\\Hasil Scan\\IMG_20140116_0002.jpg'),
(58, 85, 59, '539/098/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NPKND', '2014-01-15', '4 Berkas', 'Telaah Terkait Rencana Kerjasama antara PDAM dengan PD.Jasa Yasa untuk Pemanfaatan Lahan dan Sumber Air di Pemandian Metro Kepanjen', '', 'D:\\Hasil Scan\\IMG_20140116_0001.jpg'),
(59, 22, 60, '010/076/421.023/2014', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'Nota Dinas', '2014-01-15', '1 Berkas', 'Laporan Data Kegiatan Fisik Per Kecamatan Program SKPD dan Swakelola Masyarakat Tahun Anggaran 2013', '', 'D:\\Hasil Scan\\IMG_20140116_0002.jpg'),
(60, 382, 61, '824.3/7246/421.202/2013', 'BKD', '', '2014-01-15', '1 Berkas', 'Permohonan Pindah Pekerjaan a.n Kuntari ', '', ''),
(61, 266, 62, '521.33/097/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NPKND', '2014-01-15', '-', 'Laporan Hasil Pemantauan dan Pengawasan Pupuk Bersubsidi Kab.Malang', '', 'D:\\Hasil Scan\\IMG_20140116_0003.jpg'),
(62, 40, 63, '028/02/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Surat Keluar', '2014-01-15', '-', 'Berita Acara Serah Terima Barang dan Ruangan', '', ''),
(63, 468, 64, '411.81/0048/421.2013/2014', '2013', 'Surat Keluar', '2014-01-15', '1 Lembar', 'Penyusun GBS dan TOR', '', ''),
(64, 436, 65, '973/44/421.119/2014', 'DPPKA', 'Telaah Staf', '2014-01-16', '1 Berkas', 'Permohonan Keringanan Pajak Reklame', '', ''),
(65, 436, 66, '973/36/421.119/2014', 'DPPKA', 'Telaah Staf', '2014-01-16', '1 Berkas', 'Permohonan Pembebasan Pembayaran Pajak Reklame ', '', ''),
(66, 43, 67, '032/45/421.119/2014', 'DPPKA', 'NPKND', '2014-01-16', '2 Berkas', 'Berita Acara Kendaraan Dinas Roda 4 Pem.Kab.Malang', '', ''),
(67, 43, 68, 'X.764/124/421.201/2014', 'INSPEKTORAT', '', '2014-01-16', '1 Berkas', 'Penegasan Atas Hasil Evaluasi Akuntabilitas Kinerja Dinas Perindustrian,Perdagangan dan Pasar Kab.Malang Tahun 2012', '', 'D:\\Hasil Scan\\IMG_20140116_0001.jpg'),
(68, 134, 69, '300/068/421.301/2014', 'SATPOL PP & LINMAS', 'NPKND', '2014-01-16', '1 Berkas', 'Surat Usulan Penyesuaian atau Perpanjangan KTP PPNS ', '', ''),
(69, 266, 70, '521.33/127/421.021/2014', 'BAGIAN PEREKONOMIAN', '', '2014-01-16', '-', 'Laporan Hasil Pemantauan Dan Pengawasan Pupuk Bersubsidi Di Kab.Malang', '', 'D:\\Hasil Scan\\IMG_20140116_0003.jpg'),
(70, 266, 71, '521.33/128/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Nota Dinas', '2014-01-16', '-', 'Laporan Rapat Koordinasi Membahasan Alokasi Pupuk Bersubsidi Kab.Malang Tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140116_0002.jpg'),
(71, 470, 72, '005/113/421.032/2014', 'BAGIAN TATA USAHA', 'Surat Keluar', '2014-01-16', '-', 'Undangan ', '', ''),
(72, 470, 73, '539/125/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Surat Keluar -', '2014-01-16', '-', 'Pelaksanaan rapat Umum Pemegang Saham (RUPS) Lainnya PT. BPR Artha Kanjuruhan ', '', 'D:\\Hasil Scan\\IMG_20140116_0004.jpg'),
(73, 468, 74, '411.81/048/421.213/2014', 'KANTOR PEMBERDAYAAN PEREMPUAN & PA', 'Surat Keluar ', '2014-01-16', '-', 'Penyusunan GBS dan TOR', '', 'D:\\Hasil Scan\\IMG_20140116_0001.jpg'),
(74, 43, 75, '032/042/421.119/2014', 'DPPKA', 'Surat Keluar ', '2014-01-16', '-', 'Pemutakhiran Simbada Tahun Anggaran 2013', '', 'D:\\Hasil Scan\\IMG_20140116_0010.jpg'),
(75, 40, 76, '028/041/421.119/2013', 'DPPKA', 'Surat Keluar -', '2014-01-16', '-', 'Berita Acara Serah Terima Kendaraan Dinas Roda 4', '', 'D:\\Hasil Scan\\IMG_20140116_0011.jpg'),
(76, 40, 77, '028/043/421.119/2013', 'DPPKA', 'Surat Keluar ', '2014-01-16', '-', 'Berita Acara Serah Terima Kendaraan Dinas Roda 4', '', 'D:\\Hasil Scan\\IMG_20140116_0012.jpg'),
(77, 40, 78, '539/130/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Nota Dinas', '2014-01-17', '-', 'Permohonan Waktu Rapat Koordinasi antara Dewan Komisaris dengan Direksi PT.BPR Artha Kanjuruhan Pem.Kab.Malang untuk Persiapan RUPS lainnya', '', 'D:\\Hasil Scan\\IMG_20140127_0001.jpg'),
(78, 40, 79, '539/129/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Nota Dinas', '2014-01-17', '-', 'Permohonan Waktu Rapat Koordinasi Membahas Laporan Keuangan PT.Kigumas', '', 'D:\\Hasil Scan\\IMG_20140127_0002.jpg'),
(79, 350, 80, '653/142/421.214/2014', 'KANTOR PERUMAHAN', 'Surat Edaran', '2014-01-17', '-', 'Pemberitahuan Kembali Untuk Pendaftaran Perumahan PNS Kab.Malang', '', 'D:\\Hasil Scan\\IMG_20140127_0003.jpg'),
(80, 40, 81, '028/141/421.119/2014', 'DPPKA', 'Surat Keluar', '2014-01-17', '-', 'Berita Acra Serah Terima Kendaraan Dinas Roda 4 (Empat)', '', 'D:\\Hasil Scan\\IMG_20140127_0004.jpg'),
(81, 383, 82, '824.4/149/421.202/2014', 'BKD', 'Surat Keluar', '2014-01-21', '-', 'Persetujuan Pindah Antar Instansi ', '', 'D:\\Hasil Scan\\IMG_20140127_0008.jpg'),
(82, 381, 83, '824.2/150/421.202/2014', 'BKD', 'Surat Keluar', '2014-01-21', '-', 'Persetujuan Pindah Bekerja', '', 'D:\\Hasil Scan\\IMG_20140127_0006.jpg'),
(83, 382, 84, '824.3/151/421.202/2014', 'BKD', 'Surat Keluar', '2014-01-21', '-', 'Persetujuan Pindah Bekerja', '', 'D:\\Hasil Scan\\IMG_20140127_0007.jpg'),
(84, 381, 85, '824.2/152/421.202/2014', 'BKD', 'Surat Keluar', '2014-01-21', '-', 'Menghadapkan PNS a.n SITI SAADAH ', '', 'D:\\Hasil Scan\\IMG_20140127_0009.jpg'),
(85, 448, 86, '800/153/421.202/2014', 'BKD', 'Surat Keluar', '2014-01-21', '-', 'Penerimaan dr.Ken Ayu Larasati', '', 'D:\\Hasil Scan\\IMG_20140127_0010.jpg'),
(86, 448, 87, '822.4/154/421.202/2014', 'BKD', 'Surat Keluar', '2014-01-21', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140127_0001.jpg'),
(87, 448, 88, '822.3/155/421.202/2014', 'BKD', 'Surat Keluar', '2014-01-21', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140127_0002.jpg'),
(88, 448, 89, '822.3/156/421.202/2014', 'BKD', 'Surat Keluar ', '2014-01-21', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140127_0003.jpg'),
(89, 448, 90, '822.4/157/421.202/2014', 'BKD', 'Surat Keluar', '2014-01-21', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140127_0004.jpg'),
(90, 448, 91, '822.3/158/421.202/2014', 'BKD', 'Surat Keluar', '2014-01-21', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140127_0005.jpg'),
(91, 448, 92, '822.4/159/421.202/2014', 'BKD', 'Surat Keluar', '2014-01-21', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140127_0006.jpg'),
(92, 448, 93, '822.4/160/421.202/2014', 'BKD', 'Surat Keluar', '2014-01-21', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140127_0007.jpg'),
(93, 448, 94, '822.4/161/421.202/2014', 'BKD', 'Surat Keluar', '2014-01-21', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140127_0008.jpg'),
(94, 448, 95, '822.4/162/421.202/2014', 'BKD', 'Surat Keluar', '2014-01-21', '-', 'Kenaikan Gaji Berkala.', '', 'D:\\Hasil Scan\\IMG_20140127_0009.jpg'),
(95, 448, 96, '822.4/163/421.202/2014', 'BKD', 'Surat Keluar', '2014-01-21', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140127_0010.jpg'),
(96, 448, 97, '822.4/164/421.202/2014', 'BKD', 'Surat Keluar', '2014-01-21', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140127_0011.jpg'),
(97, 396, 98, '848.1/165/421.202/2014', 'BKD', 'Surat Keluar', '2014-01-21', '-', 'Izin Belajar PNS', '', 'D:\\Hasil Scan\\IMG_20140127_0012.jpg'),
(98, 396, 99, '851.1/166/421.202/2014', 'BKD', 'Surat Keluar', '2014-01-21', '-', 'Izin Cuti Tahunan', '', ''),
(99, 398, 100, '851/167/421.202/2014', 'BKD', 'Surat Keluar', '2014-01-21', '-', 'Surat Izin Cuti Tahunan', '', 'D:\\Hasil Scan\\IMG_20140127_0014.jpg'),
(100, 401, 101, '854/168/421.202/2014', 'BKD', 'Surat Keluar', '2014-01-21', '-', 'Surat Izin Cuti Bersalin', '', 'D:\\Hasil Scan\\IMG_20140127_0015.jpg'),
(101, 398, 102, '851/169/421.202/2014', 'BKD', 'Surat Keluar', '2014-01-21', '-', 'Surat Izin Cuti Tahunan', '', 'D:\\Hasil Scan\\IMG_20140127_0001.jpg'),
(102, 22, 103, '010/147/421.023/2014', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'Nota Dinas', '2014-01-21', '1 Berkas', 'Rencana Kegiatan Siremonial Peresmian Proyek Tahun Anggaran 2013 di Setiap Kecamatan', '', 'D:\\Hasil Scan\\IMG_20140127_0002.jpg'),
(103, 22, 104, '539/185/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NPKND', '2014-01-21', '-', '1.Undangan Kedua Rapat Koordinasi Pembahasan RKAP PD.JASA YASA Thn.2014\r\n2. Surat Tugas Kepada Asisten Perekonomian dan Pembanguna  Untuk Meminta Penjelasan Terkait Kehadiran Atau Absensi Direksi PD.JASA YASA ', '', 'D:\\Hasil Scan\\IMG_20140127_0003.jpg'),
(104, 22, 105, '539/186/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Surat Tugas', '2014-01-21', '-', 'Surat Tugas a.n NURMAN RAMDANSYAH Dan a.n MADE ARYA WEDANTHARA ', '', 'D:\\Hasil Scan\\IMG_20140127_0004.jpg'),
(105, 470, 106, '005/187/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Surat Keluar', '2014-01-21', '-', 'Undangan Kedua Rapat Koordinasi Pembahasan RKAP PD.JASA YASA Tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140127_0005.jpg'),
(106, 448, 107, '800/184/421.215/2014', 'RSUD KANJURUHAN', 'Surat Perintah Tugas', '2014-01-21', '-', 'Surat Tugas a.n HARRY HARTANTO Untuk Melaksanakan Konsultasi Ke Kementrian Kesehatan Mengenai ''Tindaklanjut Tentang Perubahan Permintaan Tambahan Peserta JAMKESMAS berkenaan dengan BPJS-JKN', '', 'D:\\Hasil Scan\\IMG_20140127_0006.jpg'),
(107, 316, 108, '590/176/421.014/2014', 'BAGIAN PERTANAHAN', 'NPKND', '2014-01-21', '-', 'Pelaksanaan Tata Batas Kawasan Hutan ', '', 'D:\\Hasil Scan\\IMG_20140127_0005.jpg'),
(108, 316, 109, '590/177/421.014/2014', 'BAGIAN PERTANAHAN', 'Nota Dinas', '2014-01-21', '1 Berkas', 'Pelaksanaan Tata Batas Kawasan Hutan', '', 'D:\\Hasil Scan\\IMG_20140127_0004.jpg'),
(109, 316, 110, '590/174/421.014/2014', 'BAGIAN PERTANAHAN', 'NPKND', '2014-01-21', '1 Berkas ', 'Tukar Menukar Kawasan Hutan di Dusun Sukorejo Desa Pondokagung Kecamatan Kasembon', '', 'D:\\Hasil Scan\\IMG_20140127_0003.jpg'),
(110, 316, 111, '590/175/421.014/21014', 'BAGIAN PERTANAHAN', 'Nota Dinas', '2014-01-21', '1 Berkas ', 'Tukar Menukar Kawasan Hutan di Dusun Sukorejo Desa Pondokagung Kecamatan Kasembon ', '', 'D:\\Hasil Scan\\IMG_20140127_0002.jpg'),
(111, 296, 112, '555/173/421.024/2014', 'BAGIAN PDE', 'TELAAH STAF', '2014-01-21', '1 Berkas ', 'Telaah Staf Penawaran Website Personal Profil Dari CV.Airlangga Media Informatika', '', 'D:\\Hasil Scan\\IMG_20140127_0001.jpg'),
(112, 296, 113, '555/172/421.024/2014', 'BAGIAN PDE', 'NPKND', '2014-01-21', '1 Berkas ', 'Telaah Staf Penawaran Website Personal Profil CV.Airlangga Media Informatika ', '', 'D:\\Hasil Scan\\IMG_20140127_0010.jpg'),
(113, 398, 114, '851/104/421.202/2014', 'BKD', 'Surat Keluar', '2014-01-21', '-', 'Izin Cuti Tahunan a.n INDRA SETYAWAN ', '', 'D:\\Hasil Scan\\IMG_20140127_0009.jpg'),
(114, 448, 115, '800/103/421.202/2014', 'BKD', 'Surat Keluar ', '2014-01-21', '74 Berkas ', 'Penyampaian Berkas DPCP Serta Usulan Kenaikan Pangkat Pengabdian dan Pemberhentian Dengan Hormat Sebagai Pegawai Negeri Sipil Dengan Hak Pensiun Atas Nama Sdr. TINA ANAH', '', 'D:\\Hasil Scan\\IMG_20140127_0001.jpg'),
(115, 381, 116, '824.2/102/421.202/2014', 'BKD', 'Surat Keluar ', '2014-01-21', '-', 'Persetujuan Pindah Antar Instansi', '', 'D:\\Hasil Scan\\IMG_20140127_0008.jpg'),
(116, 383, 117, '824.4/100/421.202/2014', 'BKD', 'Surat Keluar', '2014-01-21', '-', 'Menghadapkan PNS a.n  ZULFA YAZID', '', 'D:\\Hasil Scan\\IMG_20140127_0007.jpg'),
(117, 448, 118, '800/074/421.202/2014', 'BKD', 'Surat Keluar ', '2014-01-21', '-', 'SURAT PERINTAH Memerintahkan a.n SUSANTO', '', 'D:\\Hasil Scan\\IMG_20140127_0006.jpg'),
(118, 382, 119, '824.3/073/421.202/2014', 'BKD', 'Surat Keluar ', '2014-01-21', '-', 'Persetujuan Pindah Kerja ', '', 'D:\\Hasil Scan\\IMG_20140127_0005.jpg'),
(119, 448, 120, '800/101/421.202/2014', 'BKD', 'Surat Keluar', '2014-01-21', '-', 'Surat Perintah MEMERINTAHKAN a.n ATSALIS SUPRIYANTO ', '', 'D:\\Hasil Scan\\IMG_20140127_0004.jpg'),
(120, 401, 121, '854/105/421.202/2014', 'BKD', 'Surat Keluar ', '2014-01-21', '-', 'IZIN CUTI BERSALIN Mengizinkan a.n YENI RAHMAWATI ', '', 'D:\\Hasil Scan\\IMG_20140127_0003.jpg'),
(121, 85, 122, '094/126/421.201/2013', 'INSPEKTORAT', 'Surat Tugas ', '2014-01-21', '-', 'Melakukan Opname Kas Bendahara Umum Daerah Pemerintah Kabupaten Malang Tahun Anggaran 2013 Pada Dinas Pendapatan , Pengelolaan , Keuangan Dan Asset Kabupaten Malang ', '', ''),
(122, 426, 123, '902/197/421.119/2014', 'DPPKA', 'Surat Keluar', '2014-01-21', '1 Set', 'Penyampaian Laporan Tentang APBD Pemerintah Kab.malang TA 2014', '', ''),
(123, 316, 124, '590/196/421.014/2014', 'BAGIAN PERTANAHAN', 'Nota Dinas ', '2014-01-21', '1 Berkas ', 'Mohon Memimpin Sosialisasi Pengadaan Tanah Untuk Kepentingan Pembangunan Jalan Tol Pandaan-Malang', '', 'D:\\Hasil Scan\\IMG_20140127_0001.jpg'),
(124, 88, 125, '100/195/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Nota Dinas', '2014-01-21', '1 Daftar', 'Penerimaan Kunjungan Kerja DPRD Kab.Tuban Provinsi Jawa Timur Ke Pemerintahan Kab. Malang Provinsi Jawa Timur', '', 'D:\\Hasil Scan\\IMG_20140127_0006.jpg'),
(125, 316, 126, '590/188/P2T/421.014/2014', 'P2', 'Surat Keluar ', '2014-01-21', '1 Berkas ', 'Hasil Penilaian Tanaman dan Bangunan Pada Trase Jalan Tol Pandaan Malang ', '', 'D:\\Hasil Scan\\IMG_20140127_0007.jpg'),
(126, 316, 127, '141/209/421.012/21014', 'BAGIAN TATA PEMERINTAHAN DESA', 'Surat Keluar', '2014-01-22', '1 Berkas', 'TindakLanjut Hasil Pemeriksaan Inspektorat Provinsi Jawa Timur', '', 'D:\\Hasil Scan\\IMG_20140127_0003.jpg'),
(127, 316, 128, '141/201/421.012/2014', 'BAGIAN TATA PEMERINTAHAN DESA', 'Nota Dinas ', '2014-01-22', '1 Berkas ', 'Laporan Pengiriman Surat Sekretaris Daerah Tentang Penundaan Pelaksanaan Pemilihan Kepala Desa', '', 'D:\\Hasil Scan\\IMG_20140127_0002.jpg'),
(128, 316, 129, '9021/115/421.119/2014', 'DPPKA', 'NPKND', '2014-01-22', '1 Set', 'Tata Cara Penyampaian Infomatika Keuangan Daerah ', '', ''),
(129, 316, 130, '800/108/421.202/2014', 'BKD', 'NPKND', '2014-01-22', '1 Berkas', 'Perpanjangan Perjanjian Kontrak kerja Terhitung Mulai Tanggal 1 Januari 2014 Sampai Dengan Tanggal 30 juni 2014 ', '', 'D:\\Hasil Scan\\IMG_20140127_0005.jpg'),
(130, 316, 131, '539/207/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NPKND', '2014-01-22', '4 Berkas', 'Telaah Terkait Permohonan Izin Pemanfaatan Lahan Dan Sumber Air di Pemandian Metro Kepanjen Untuk di Kerjasamakan Dengan PDAM Kab. Malang', '', 'D:\\Hasil Scan\\IMG_20140127_0012.jpg'),
(131, 470, 132, '005/227/421.032/2014', 'BAGIAN TATA USAHA', 'Surat Keluar', '2014-01-23', '1 Lembar', 'Undangan', '', ''),
(132, 316, 133, '590/233/421.014/2014', 'BAGIAN PERTANAHAN', 'Nota Dinas ', '2014-01-23', '1 Berkas', 'Penerbitan Keputusan Bupati Malang Tentang Tim Tukar Menukar Kawasan Hutan Kab.Malang', '', 'D:\\Hasil Scan\\IMG_20140127_0001.jpg'),
(133, 461, 134, '912/76/421.119/2014', 'DPPKA', 'NPKND', '2014-01-23', '13 Berkas', 'Penyampaian Dokumen Pelaksanaan  Anggaran Tahun Anggaran 2014', '', ''),
(134, 316, 135, '590/238/421.014/2014', 'BAGIAN PERTANAHAN', 'Nota Dinas', '2014-01-23', '1 Berkas', 'Sosialisasi Pengadaan Tanah Jalan  Untuk Pembangunan TOL Pandaan-Malang Di Desa Dengkol dan Desa Baturetno Kec.Singosari', '', 'D:\\Hasil Scan\\IMG_20140127_0005.jpg'),
(135, 461, 136, '912/75/421.119/2014', 'DPPKA', 'NPKND', '2014-01-23', '11 Berkas', 'Penyampaian Dokumen Pelaksanaan Anggaran Tahun Anggaran 2014', '', 'D:\\Hasil Scan\\IMG_20140127_0007.jpg'),
(136, 316, 137, '590/054/421.014/2014', 'BAGIAN PERTANAHAN', 'NPKND', '2014-01-23', '1 berkas', 'Penangan Masalah Tanah Negara Yag Dikelola Oleh PT.Perkebunan Nusantara XII (Perserro) Kebun Kalibakar Kec.Tirtoyudo Kab.Malang', '', ''),
(137, 88, 138, '100/231/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NPKND', '2014-01-23', '1 Berkas ', 'Agenda Pertemuan Bapak Bupati Malang Tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140127_0002.jpg'),
(138, 88, 139, '100/232/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Nota Dinas', '2014-01-23', '-', 'Agenda Pertemuan Bapak Bupati Malang Tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140127_0003.jpg'),
(139, 296, 140, '555/237/421.024/2014', 'BAGIAN PDE', 'Telaah Staf', '2014-01-23', '1 Berkas', 'Telaah Staf Pernyataan Menerima Hibah Aset Telecenter', '', 'D:\\Hasil Scan\\IMG_20140127_0004.jpg'),
(140, 246, 141, '489/241/421.033/2014', 'BAGIAN HUMAS', 'Surat Keluar', '2014-01-23', '1 Lembar', 'Permintaan Materi Talk Show', '', 'D:\\Hasil Scan\\IMG_20140127_0008.jpg'),
(141, 167, 142, '400/244/421.032/2014', 'BAGIAN TATA USAHA', 'Surat Keterangan', '2014-01-24', '', 'Surat Keterangan a.n H.UMAR ANSORI Dan a.n ERNI SUPRIATI', '', 'D:\\Hasil Scan\\IMG_20140127_0006.jpg'),
(142, 246, 143, '489/245/421.033/2014', 'BAGIAN HUMAS', 'Surat Keluar', '2014-01-24', '-', 'Pemberitahuan\r\n', '', 'D:\\Hasil Scan\\IMG_20140127_0009.jpg'),
(143, 246, 144, '119/249/421.022/2014', 'BAGIAN KERJASAMA', 'Nota Dinas', '2014-01-24', '1 Berkas', 'Laporan Rencana Penandatanganan Kesepakatan Bersama Antara Pem.Kab.Malang dengan PT.Telekomunikasi Indonesia,Tbk', '', 'D:\\Hasil Scan\\IMG_20140127_0010.jpg'),
(144, 88, 145, '100/257/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NPKND', '2014-01-24', '1 Berkas ', 'Laporan Ideologi , Politik , Ekonomi , Sosial, Budaya , Pertahanan dan Keamanan Bulan Desember 2013', '', 'D:\\Hasil Scan\\IMG_20140128_0001.jpg'),
(145, 88, 146, '100/258/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Nota Dinas', '2014-01-24', '1 Berkas ', 'Laporan Ideologi , Politik , Ekonomi , Sosial , Budaya , Pertahanan dan Keamanan Bulan Desember 2013', '', 'D:\\Hasil Scan\\IMG_20140128_0002.jpg'),
(146, 88, 147, '100/256/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Nota Di', '2014-01-24', '1 Berkas ', 'Permohonan Sosialisasi Jaminan Kesehatan Nasional ( JKN)', '', 'D:\\Hasil Scan\\IMG_20140128_0001.jpg'),
(147, 88, 148, '100/254/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Nota Dinas ', '2014-01-24', '1 Daftar', 'Penerimaan Kunjungan Kerja Pansus III DPRD Kab.Lingga Provinsi Kepulauan Riau Ke Pemerintah Kab.Malang ProV.jatim', '', 'D:\\Hasil Scan\\IMG_20140128_0009.jpg'),
(148, 471, 149, '000/052/421.032/2014', 'BAGIAN TATA USAHA', 'Surat Keluar', '2014-01-24', '-', 'Berita Acara Sejarah Terima a.n Aniswaty Aziz, SE, M.Si dan Ibu Rusman Effendi', '', ''),
(149, 471, 150, '119/251/421.022/2014', 'BAGIAN KERJASAMA', 'Nota Dinas', '2014-01-24', '1 Berkas', 'Rencana Penantangan Naskah Perjanjian Kerja Sama Antara PT.Bank Tabungan Negara (Persero) tbk Dengan Satuan Kerja Perangkat Daerah ( SKPD) Di Lingkungan Pemerintah Kab.Malang', '', 'D:\\Hasil Scan\\IMG_20140128_0003.jpg'),
(150, 255, 151, '511/206/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Surat Keluar', '2014-01-27', '-', 'Penawaran Dukungan dan Partisipasi Kegiatan Pameran Tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140127_0008.jpg'),
(151, 88, 152, '100/202/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NPKND', '2014-01-27', '-', 'Himbauan Netralitas PNS di Lingkungan Pemerintah Kabupaten Malang dan Pegawai di Lingkungan BUMD', '', 'D:\\Hasil Scan\\IMG_20140127_0009.jpg'),
(152, 205, 153, '450/203/421.042/2014', 'Bagian Bintal', 'Surat Keluar ', '2014-01-27', '-', 'Permohonan Data Kasus Perceraian Kabupaten Malang Tahun 2013', '', 'D:\\Hasil Scan\\IMG_20140127_0010.jpg'),
(153, 88, 154, '100/204/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NPKND', '2014-01-27', '-', 'Alternatif Pelaksanaan Kegiatan Bina Desa di Bulan Februari 2014', '', 'D:\\Hasil Scan\\IMG_20140127_0011.jpg'),
(154, 398, 155, '851/166/421.202/2014', 'BKD', 'Surat Keluar ', '2014-01-27', '-', 'Ijin Cuti Tahunan ', '', 'D:\\Hasil Scan\\IMG_20140127_0013.jpg'),
(155, 40, 156, '028/064/421.032/2013', 'BAGIAN TATA USAHA', 'Surat Pengantar', '2014-01-28', '2 Berkas', 'Rencana Kebutuhan Barang Unit (RKBU) dan Rencana Kebutuhan Pemeliharaan Barang Unit (RKPBU) RA 2014', '', ''),
(156, 316, 157, '590/279/421.014/2014', 'BAGIAN PERTANAHAN', 'Surat Keluar', '2014-01-28', '-', 'Permasalahan Permohonan Perpanjangan HGU PT.Perkebunan Nusantara XII Kebun Kalibakar Kec.Tirtoyudo Kab.Malang Prov.Jatim', '', 'D:\\Hasil Scan\\IMG_20140128_0008.jpg'),
(157, 193, 158, '440/278/421.041/2014', 'BAGIAN KESRA', 'Nota Dinas', '2014-01-28', '6 Berkas', 'Penyampaian Materi Rapat Koordinasi Dengan Camat Dan Kepala DXesa Se Kab.Malang', '', 'D:\\Hasil Scan\\IMG_20140128_0007.jpg'),
(158, 81, 160, '090/274/421.052/2013', '052', 'Surat Tugas', '2014-01-28', '', 'Surat Tugas Untuk Menghadiri  Bina Desa pada Hari Rabu s.d Kamis tanggal 15-16 Januari 2014 di Desa Sukoanyar Kec.Pakis', '', 'D:\\Hasil Scan\\IMG_20140128_0005.jpg'),
(159, 81, 161, '045/253/421.211/2014', 'BADAN PERPUS, ARSIP & DOKUMENTASI', 'Surat Keluar', '2014-01-28', '1 berkas', 'Prosedur Administrasi Pengelolaan Arsip Di Lingkungan Pem.Kab.Malang', '', ''),
(160, 43, 162, '032/275/421.119/2014', 'DPPKA', 'Surat Keluar', '2014-01-28', '1 berkas', 'Perjanjian Pinjam Pakai Barang Milik Negara', '', 'D:\\Hasil Scan\\IMG_20140128_0002.jpg'),
(161, 85, 163, '094/276/421.206/2014', 'BADAN LH', 'Surta Tugas', '2014-01-28', '-', 'Surat Tugas Untuk Menyampaikan Isian Data Sistem Manajemen ADIPURA Periode Tahun 2013-2014 dan Berkonsultasi ke kantor Pusat Pengelolaan Ekoregion Jawa (PPEJ) Jogjakarta pada tanggal 20 Januari 2014', '', 'D:\\Hasil Scan\\IMG_20140128_0001.jpg'),
(162, 193, 164, '440/277/421.041/2014', 'BAGIAN KESRA', 'NPKND', '2014-01-28', '1 berkas', 'Penyampaian Materi Rapat Koordinasi dengan Camat dan Kepala Desa se Kab.Malang', '', ''),
(163, 193, 165, 'X.717/260/421.201/2014', 'INSPEKTORAT', 'Surat Keluar', '2014-01-28', '1 berkas', 'Hasil Pemeriksaan Inspektorat Kab.Malang Pada Sekretariat Dewan Perwakilan Rakyat Daerah Kab.Malang\r\n', '', 'D:\\Hasil Scan\\IMG_20140128_0003.jpg'),
(164, 88, 166, '100/257/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NPKND', '2014-01-28', '1 berkas', 'Laporan IPOLEKSOSBUD HANKAM Bulan Desember 2013', '', ''),
(165, 88, 167, '100/258/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Nota Dinas', '2014-01-28', '1 berkas', 'Laporan IPOLEKSOSBUD HANKAM Bulan Desember 2013', '', ''),
(166, 88, 168, '119/251/421.022/2014', 'BAGIAN KERJASAMA', 'Nota Dinas', '2014-01-28', '1 berkas', 'Rencana Penandatangan Naskah Perjanjian Kerja Sama Antara PT.Bank Tabung Negara (persero) tbk dengan Satuan Kerja Perangkatan Daerah (SKPD) di Lingkungan Pem.kab.Malang', '', ''),
(167, 88, 169, '100/254/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Nota Dinas', '2014-01-28', '1 daftar', 'Penerimaan Kunjungan Keja Pansus III DPRD Kab.Lingga Prov.Kepulauan Riau Ke Pem.kab.Malang Prov.Jatim', '', ''),
(168, 88, 170, '892.4/210/421.202/2014', 'BKD', 'Surat Tugas Belajar', '2014-01-28', '', 'Melaksanakan Surat Tugas Belajar Program Megister Pendidikan Bahasa Indonesia pada Universitas Negeri Malang a.n KASMADI', '', 'D:\\Hasil Scan\\IMG_20140128_0008.jpg'),
(169, 88, 171, '892.4/211/421.202/2014', 'BKD', 'Surat Tugas Belajar', '2014-01-28', '', 'Melaksanakan Tugas Belajar Program Megister Pendidikan Matematika pada Universitas Negeri Malang a.n SUNARTI', '', 'D:\\Hasil Scan\\IMG_20140128_0007.jpg'),
(170, 88, 172, '892.4/212/421.202/2014', 'BKD', 'Surat Tugas Belajar', '2014-01-28', '', 'Surat Tugas Belajar Program Megister Pendidikan Matematika pada Universitas Negeri Malang a.n ARI KURNIAWATI ', '', 'D:\\Hasil Scan\\IMG_20140128_0006.jpg'),
(171, 396, 173, '848.1/213/421.202/2014', 'BKD', 'Surat Tugas Belajar', '2014-01-28', '', 'Menempuh Program Pasca Sarjana (S-2) Megister Pengelolaan Sumberdaya Lingkungan pada Program Pascasarjana Universitas Brawijaya Malang a.n SATRIA WIBAWA', '', 'D:\\Hasil Scan\\IMG_20140128_0005.jpg'),
(172, 396, 174, '848.1/214/421.202/2014', 'BKD', 'Surat Izin Bupati Malang', '2014-01-28', '', 'Izin Belajar Pegawai Negeri Sipil a.n MOCHAMMAD YEKTI PRACOYO', '', 'D:\\Hasil Scan\\IMG_20140128_0004.jpg'),
(173, 396, 175, '848.1/215/421.202/2014', 'BKD', 'Surat Izin Bupati Malang', '2014-01-28', '', 'Izin Belajar Pegawai Negeri Sipil a.n KODERI', '', 'D:\\Hasil Scan\\IMG_20140128_0012.jpg'),
(174, 396, 176, '848.1/216/421.202/2014', 'BKD', 'Surat Izin Belajar Bupati', '2014-01-28', '', 'Izin  Belajar PNS a.n MAHYUDIN', '', 'D:\\Hasil Scan\\IMG_20140128_0011.jpg'),
(175, 396, 177, '848.1/217/421.202/2014', 'BKD', 'Surat Izin Bupati Malang', '2014-01-28', '', 'Izin Belajar PNS a.n HASAN BIYANTO', '', 'D:\\Hasil Scan\\IMG_20140128_0010.jpg'),
(176, 396, 178, '848.1/218/421.202/2014', 'BKD', 'Surat Izin Bupati Malang', '2014-01-28', '', 'Izin Belajar PNS a.n ARRIZA NUR AVIVA ', '', 'D:\\Hasil Scan\\IMG_20140128_0009.jpg'),
(177, 396, 179, '848.1/219/421.202/2014', 'BKD', 'Surat Izin Bupati MALANG', '2014-01-28', '', 'Izin Belajar PNBS a.n ABDUL ROKHIM', '', 'D:\\Hasil Scan\\IMG_20140128_0008.jpg'),
(178, 396, 180, '848.1/202/421.202/2014', 'BKD', 'Surat Izin Bupati MALANG', '2014-01-28', '', 'Izin Belajar PNS a.n KASMIYATUN', '', ''),
(179, 382, 181, '824.3/221/421.202/2014', 'BKD', 'Surat Keluar', '2014-01-28', '1 berkas', 'Permohonan Pindah Bekerja a.n LUKMAN HIDAYAT', '', ''),
(180, 448, 182, '800/222/421.202/2014', 'BKD', 'Surat Keluar', '2014-01-28', '', 'Perjanjian Kontrak Pegawai Tidak Tetap', '', ''),
(181, 398, 183, '851/223/421.202/2014', 'BKD', 'Surat Izin Bupati Malang', '2014-01-28', '', 'Izin Cuti Tahunan a.nn SUPIYAN', '', ''),
(182, 398, 184, '851/224/421.202/2014', 'BKD', 'Surat Izin Bupati Malang', '2014-01-28', '', 'Izin Cuti Tahunan a.n NUNUK SURYANDARI', '', ''),
(183, 398, 185, '851/225/421.202/2014', 'BKD', 'Surat Izin Bupati Malang', '2014-01-28', '', 'Izin Cuti Tahunan a.n Erna Kristantina', '', ''),
(184, 88, 186, '100/256/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Nota Dinas', '2014-01-28', '1 berkas', 'Permohonan Sosialisasi Jaminan Kesehatan Nasioanal (JKN)', '', ''),
(185, 396, 187, '848.1/220/421.202/2014', 'BKD', 'Surat Izin Bupati Malang', '2014-01-28', '', 'Izin Belajar PNS a.n KASMIYATUN', '', 'D:\\Hasil Scan\\IMG_20140128_0007.jpg'),
(186, 396, 188, '045.021/253/421.211/2014', 'BADAN PERPUS, ARSIP & DOKUMENTASI', 'Surat Keluar', '2014-01-28', '1 berkas', 'Prosedur Administrasi Pengelolaan Arsip di Lingkungan Pemerintah Kabupaten Malang', '', 'D:\\Hasil Scan\\IMG_20140128_0004.jpg'),
(187, 85, 189, '094/273/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Surat Tugas', '2014-01-28', '-', 'Surat Tugas Untuk Mengikuti Badan Anggaran DPRD Kab.Malang Melaksanakan Konsultasi Ke Dirjen ', '', 'D:\\Hasil Scan\\IMG_20140128_0006.jpg'),
(188, 85, 191, '119/307/421.022/2014', 'BAGIAN KERJASAMA', 'Nota Dinas', '2014-01-28', '1 berkas', 'Telaah Staf Terhadap Surat Dari Universitas Brawijaya Tentang Pemberitahuan Kerjasama', '', 'D:\\Hasil Scan\\IMG_20140128_0011.jpg'),
(189, 85, 192, '119/305/421.022/2014', 'BAGIAN KERJASAMA', 'Nota Dinas', '2014-01-28', '1 berkas', 'Telaah Staf Tentang Permohonan Ikatan Kerjasama Antara Pem.Kab.Malang dengan (STIKES) Surya Mitra Husada Kediri', '', 'D:\\Hasil Scan\\IMG_20140128_0012.jpg'),
(190, 85, 193, '119/303/421.022/2014', 'BAGIAN KERJASAMA', 'Nota Dinas', '2014-01-28', '1 berkas', 'Laporan Rencana Penandatangan Naskah Perjanjian Kerjasama Antara PT.BANK TABUNGAN NEGARA (persero) tbk dengan Satuan Kerja Perangkat Daerah (SKPD) Di Lingkungan Pem.Kab.Malang', '', 'D:\\Hasil Scan\\IMG_20140128_0013.jpg'),
(191, 88, 194, '100/295/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NPKND', '2014-01-28', '-', 'Pelaksanaan Kegiatan Bina Desa di Desa Jatisari Kec.Pakisaji', '', 'D:\\Hasil Scan\\IMG_20140128_0019.jpg'),
(192, 88, 195, '100/296/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Surat Keluar', '2014-01-28', '-', 'Kegiatan  Bina Desa Di Desa Jatisari Kec.Pakisaji pada Hari Kamis,13 Februari 2014 ', '', 'D:\\Hasil Scan\\IMG_20140128_0018.jpg'),
(193, 88, 196, '100/298/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NPKND', '2014-01-28', '1 lembar', 'Pelaksanaan Kegiatan Bina Desa (Bhakti Sosial Menata Desa) di Ds.Jatisari Kec.Pakisaji', '', 'D:\\Hasil Scan\\IMG_20140128_0017.jpg'),
(194, 88, 197, '100/299/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Surat Keluar', '2014-01-28', '1 berkas', 'Kegiatan Bina Desa Ke-22 Di Desa Jatisari Kec.Pakisaji Hari Rabu-Kamis, 12-13 Februari 2014', '', 'D:\\Hasil Scan\\IMG_20140128_0016.jpg'),
(195, 88, 198, '100/300/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NPKND', '2014-01-28', '-', 'Permohonan Untuk Tidak Dilakukan Pemadaman Listrik', '', 'D:\\Hasil Scan\\IMG_20140128_0015.jpg'),
(196, 88, 199, '100/301/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Surat Keluar ', '2014-01-28', '-', 'Permohonan Untuk Tidak Di lakukan Pemadaman Listrik\r\n', '', 'D:\\Hasil Scan\\IMG_20140128_0014.jpg'),
(197, 85, 200, '094/294/421.051/2014', 'SEKRETARIAT DPRD', 'Surat Tugas', '2014-01-28', '-', 'Surat Tugas Untuk Mengikuti Pimpinan DPRD Kab.Malang Melaksanaakan Koordinasi Ke DPRD Kab.Kudus a.n NURCAHYO', '', 'D:\\Hasil Scan\\IMG_20140128_0020.jpg'),
(198, 193, 201, '440/288/421.041/2014', 'BAGIAN KESRA', 'Nota Dinas', '2014-01-28', '1 berkas', 'Penyampaian Materi Rapat koordinasi Dengan Kepala Desa Dan Lurah Se Kab.Malang ', '', 'D:\\Hasil Scan\\IMG_20140128_0021.jpg'),
(199, 193, 202, '440/287/421.041/2014', 'BAGIAN KESRA', 'NPKND', '2014-01-28', '3 berkas', 'Penyampaian Materi Rapat Koordinasi Dengan Camat Dan Kepala Desa se Kab.Malang', '', 'D:\\Hasil Scan\\IMG_20140128_0022.jpg'),
(200, 316, 203, '590/311/421.014/2014', 'BAGIAN PERTANAHAN', 'Surat Keluar', '2014-01-28', '1 berkas', 'Penataan Batas Kawasan Hutan ', '', 'D:\\Hasil Scan\\IMG_20140128_0010.jpg'),
(201, 206, 204, '451/318/421.042/2014', '042', 'NPKND', '2014-01-30', '1 Bendel', 'Tindaklanjut Penanganan Masalah Masjid KH.Ahmad Dahlan Perum Asrikaton Indah Pakis ', '', 'D:\\Hasil Scan\\IMG_20140130_0001.jpg'),
(202, 206, 205, '541/318/421.042/2014', '042', 'Nota Dinas', '2014-01-30', '1 bendel ', 'Perkembangan Penanganana Permasalahan Keberadaan Masjid KH.Ahmad Dahlan Perum Asrikaton Indah Jl.Kebun Cengkeh Blok.E -4 No.4 Rt.04/Rw. 09 Kec.Pakis', '', ''),
(203, 206, 206, '539/319/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NPKND', '2014-01-30', ' 2 Berkas', 'Laporan Hasil Rapat Kordinasi Pembahasan Rencana Kerja Dan Anggaran Perusahaan (RKAP) PDAM Kab.Malang Tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140203_0013.jpg'),
(204, 206, 207, '539/320/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Nota Dinas', '2014-01-30', '2 berkas', 'Laporan Hasil Rapat Koordinasi Rencana Kerja Dan Anggaran Perusahaan (RKAP) PDAM Kab.Malang Tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140203_0001.jpg'),
(205, 206, 208, 'X.734/330/421.201/2014', 'INSPEKTORAT', 'Surat Keluar', '2014-01-30', '1 berkas', 'Hasil Pemeriksaan Inspektorat Kab.MALANG pada Badan Pelayanan Perizinan Terpadu kab.Malang ', '', 'D:\\Hasil Scan\\IMG_20140203_0003.jpg'),
(206, 266, 209, '521.33/339/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Nota Dinas', '2014-01-30', '', 'Laporan Peninjauan Lapangan Pupuk Di Duga Palsu yang di amankan oleh KAPOLREK Ngajum \r\n', '', 'D:\\Hasil Scan\\IMG_20140203_0004.jpg'),
(207, 297, 210, '556/337/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Nota Dinas', '2014-01-30', '1 berkas', 'Telaah Atas Permohona Ahli Tugas Kepala UPTD Taman Wisata Air Wendit dan Permohonana Perubahan Peraturan Bupati Malang No.57 Tahun 2008 Tentang UPTD Taman Pemandian Wendit', '', 'D:\\Hasil Scan\\IMG_20140203_0005.jpg'),
(208, 88, 211, '100/331/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NPKND', '2014-01-30', '1 lembar', 'Himbauan Netralitas PNS di Lingkungan Pemkab.Malang dan Pegawai Di Lingkungan BUMD ', '', 'D:\\Hasil Scan\\IMG_20140203_0006.jpg'),
(209, 316, 212, '590/335/421.014/2014', 'BAGIAN PERTANAHAN', 'Nota Dinas', '2014-01-30', '1 berkas', 'Tindaklanjut Hasil Pengadaan Tanah TA 2013', '', 'D:\\Hasil Scan\\IMG_20140130_0012 - Copy.jpg'),
(210, 316, 213, '539/332/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Surat Keluar', '2014-01-30', '', 'Kerjasama Pemanfaatan Lahan Dan Sumber Air di Pemandian Metro Kepanjen ', '', 'D:\\Hasil Scan\\IMG_20140203_0007.jpg'),
(211, 22, 214, '010/334/421.023/2014', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'Nota Dinas', '2014-01-30', '1 bendel', 'Laporan akhir kegiatan bagian administrasi pembangunan setda kab.Malang TA 2013', '', 'D:\\Hasil Scan\\IMG_20140203_0008.jpg'),
(212, 22, 215, '010/333/421.023/2014', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'Nota Dinas', '2014-01-30', '1 berkas', 'Laporan Realisasi Belanja Langsung (Program dan Kegiatan Triwulan IV TA 2013', '', 'D:\\Hasil Scan\\IMG_20140203_0009.jpg'),
(213, 85, 216, '094/325/421.113/2014', 'DISPERINDAG & PASAR', 'Surat Perintah Tugas', '2014-01-30', '', 'Surat Perintah Tugas a.n HELIJANTI KOENTARI ', '', 'D:\\Hasil Scan\\IMG_20140203_0010.jpg'),
(214, 85, 217, '414.56/326/421.208/2014', 'BADAN PEMBERDAYAAN MASYARAKAT', 'Surat Keluar ', '2014-01-30', '1 berkas', 'Usulan Nama Pejabat Kuasa Penguna Anggaran (KPA) Dan Bendahara Pengeluaran PNPM ', '', 'D:\\Hasil Scan\\IMG_20140203_0011.jpg'),
(215, 206, 218, '451/318/421.042/2014', '042', 'Nota Dinas', '2014-01-30', '1 bendel', 'Perkembanagan Penanganan Permaslahan Keberadaan Masjid KH.Ahmad Dahlan Perum Asrikaton', '', 'D:\\Hasil Scan\\IMG_20140203_0012.jpg'),
(216, 316, 219, '590/335/421.014/2014', 'BAGIAN PERTANAHAN', 'Nota Dinas ', '2014-02-03', '-', 'Tindak Lanjut Hasil Pengadaan Tanah Tahun Anggaran 2013', '', 'D:\\Hasil Scan\\IMG_20140203_0002.jpg'),
(217, 85, 220, '094/383/421.051/2014', 'SEKRETARIAT DPRD', 'Surat Tugas', '2014-02-04', '', 'Surat Tugas a.n NURCAHYO Untuk Mengikuti Kegiatan Penyusunan Rencana Kerja DPRD 11s/d12 Okt.13''', '', 'D:\\Hasil Scan\\IMG_20140217_0006.jpg'),
(218, 85, 221, '094/382/421.051/2014', 'SEKRETARIAT DPRD', 'Surat Tugas', '2014-02-04', '', 'Surat Tugas a.n NURCAHYO Untuk Mengikuti Rapat Forum Komunikasi Sek.DPRD Tgl 21 Agustus 2013', '', 'D:\\Hasil Scan\\IMG_20140217_0005.jpg'),
(219, 85, 222, '094/381/421.051/2014', 'SEKRETARIAT DPRD', 'Surat Tugas', '2014-02-04', '', 'Surat Tugas a,n Nurcahyo untuk mengikuti Pimpinan DPRD Melaksanakan Konsultasi DPRD Tgl 15-16 Des.2013', '', 'D:\\Hasil Scan\\IMG_20140217_0004.jpg'),
(220, 85, 223, '094/384/421.051/2014', 'SEKRETARIAT DPRD', 'Surat Tugas', '2014-02-04', '', 'Surat Tugas a.n Nurcahyo untuk mengikuti Badan Musyawarah DPRD Melaksanakan Koordinasi Ke DPRD Kab.Blitar Tgl 17-18 Nov.2013', '', 'D:\\Hasil Scan\\IMG_20140217_0003.jpg'),
(221, 88, 224, '100/366/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NPKND', '2014-02-04', '1 Berkas', 'Pertemuan Tingkat Tinggi Walikota Untuk Kota Inklusif ', '', 'D:\\Hasil Scan\\IMG_20140217_0002.jpg'),
(222, 88, 225, '100/365/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Nota Dinas', '2014-02-04', '', 'Pertemuan Tingkat Tinggi Walikota Untuk Kota Inklusif ', '', 'D:\\Hasil Scan\\IMG_20140217_0001.jpg'),
(223, 88, 226, '100/364/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Nota Dinas', '2014-02-04', '', 'Rapat Koordinasi Pelaksanaan Bina Desa Di Desa Jatisari Kec.Pakisaji ', '', 'D:\\Hasil Scan\\IMG_20140217_0010.jpg'),
(224, 88, 227, '100/232/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Nota Dinas', '2014-02-04', '', 'Agenda Pertemuan Bapak Bupati Malang Tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140204_0007.jpg'),
(225, 88, 228, '539/371/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Surat Keluar', '2014-02-04', '', 'Rencana Pembentukkan Tim Teknis Rencana Kerjasama Pengelolahan Pemandian Air Panas Dan Hotel Songgoriti', '', 'D:\\Hasil Scan\\IMG_20140217_0008.jpg'),
(226, 367, 229, '700/385/421.201/2014', 'INSPEKTORAT', 'Surat Tugas', '2014-02-04', '', 'Surat Tugas a.n Didik Budi Muljono DKK Untuk Melakukan Reviu Lpaoran Keuanagan Pemerintah Daerah Kab.Malang TA 2013', '', 'D:\\Hasil Scan\\IMG_20140217_0004.jpg'),
(227, 367, 230, '539/394/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Nota Dinas', '2014-02-04', '7 berkas', 'Laporan Hasil Evaluasi Kinerja Direktur Utsms PD.JASA YASA Kab.Malang ', '', 'D:\\Hasil Scan\\IMG_20140217_0007.jpg'),
(228, 367, 231, '119/392/421.022/2014', 'BAGIAN KERJASAMA', 'Nota Dinas', '2014-02-04', '1 berkas', 'Penundaan Renacana Penandatanganan Kesepakatan Bersama Antar Pem.Kab.Malang dgn PT.Telekomunikasi Indonesia Tbk.', '', 'D:\\Hasil Scan\\IMG_20140217_0006.jpg'),
(229, 88, 232, '100/392/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NPKND', '2014-02-04', '1 berkas', 'Lpaoran Hasil Pelaksanaan Kegiatan Bina Desa (Bhakti Sosial Menata Desa) Bulan Januari 2014', '', 'D:\\Hasil Scan\\IMG_20140217_0005.jpg'),
(230, 88, 233, '100/393/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Nota Dinas', '2014-02-04', '1 berkas', 'Laporan Hasil Pelaksanaan Bina Desa (Bhakti Sosial Menata Desa) Bulan Januari 2014', '', 'D:\\Hasil Scan\\IMG_20140217_0008.jpg'),
(231, 206, 234, '451/440/421.042/2014', '042', 'NPKND', '2014-02-06', '-', 'Usulan kenaikan nominal pemberian hibah kepada masing - masing tempat ibadah dan pondok pesantren diwilayah kab.malang 2014', '', 'D:\\Hasil Scan\\IMG_20140206_0006.jpg'),
(232, 206, 235, '451/441/421.042/2014', '042', 'Nota Dinas', '2014-02-06', '1 berkas', 'Usulan kenaikan nominal pemberian hibah kepada masing - masing tempat ibadah dan pondok pesantren diwilayah kab.malang tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140206_0002.jpg'),
(233, 32, 236, '020.1/439/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Nota Dinas', '2014-02-06', '-', 'Telaah atas penawaran produk asuransi jiwa bersama bumiputera (AJB) Bumiputera 1912', '', 'D:\\Hasil Scan\\IMG_20140206_0004.jpg'),
(234, 32, 237, '020.1/424/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NPKND', '2014-02-06', '-', 'Telaah atas penawaran produk asuransi jiwa bersama Bumiputera (AJB) Bumiputera 2014', '', 'D:\\Hasil Scan\\IMG_20140206_0005.jpg'),
(235, 247, 238, '500/427/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Surat Tugas', '2014-02-06', '-', 'Koordinasi dan sosialisasi bidang mineral dan mineral dan batubara,maka seketaris daerah kab.malang a.n. RACHMAT HARDIJONO', '', 'D:\\Hasil Scan\\IMG_20140206_0003.jpg'),
(236, 247, 239, '500/425/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NPKND', '2014-02-06', '-', 'Surat tugas kegiatan koordinasi dan sosialisasi bidang mineral dan batubara a.n. IR TOMIE HERAWANTO,MP dan RACHMAT HARDIJONO', '', 'D:\\Hasil Scan\\IMG_20140206_0002.jpg');
INSERT INTO `surat_keluar` (`id`, `index_surat_id`, `no_urut`, `no_surat`, `pengolah`, `tujuan`, `tanggal_surat`, `lampiran`, `perihal`, `catatan`, `file_surat`) VALUES
(237, 424, 240, '900/438/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NOTA DINAS', '2014-02-06', '-', 'Telaah atas penawaran produk dan kerjasama dari PT.Bank Bukopin,Tbk. cabang malang', '', 'D:\\Hasil Scan\\IMG_20140206_0001.jpg'),
(238, 424, 241, '900/423/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NPKND', '2014-02-06', '-', 'Telaah atas penawaran produk dan kerjasama PT.Bank Bukopin,Tbk.Cabang malang ', '', 'D:\\Hasil Scan\\IMG_20140206_0008.jpg'),
(239, 470, 242, '055/436/421.032/2014', 'BAGIAN TATA USAHA', 'Surat Keluar', '2014-02-06', '-', 'UNDANGAN', '', ''),
(240, 448, 243, '800/435/421.103/2014', 'DINAS KESEHATAN', 'Surat Tugas', '2014-02-06', '-', 'Menghadiri workshop nasional pada kamis s.d sabtu,tgl 06s/d 08 Februari 2014,bertempat di hotel lumire Jl.senen raya jakarta pusat', '', 'D:\\Hasil Scan\\IMG_20140206_0006.jpg'),
(241, 289, 244, '551/68/421.106/2014', 'DISHUB & KOMINFO', 'TELAAH STAF', '2014-02-06', '1 Berkas', 'Penutupan perlintasan sebidang tanpa ijin', '', 'D:\\Hasil Scan\\IMG_20140206_0005.jpg'),
(242, 367, 245, '700/081/421.032/2014', 'BAGIAN TATA USAHA', 'Surat Keluar', '2014-02-06', '1 berkas', 'Penyampaian laporan keuangan tahun anggaran 2013 bagian tata usaha setda kab.malang', '', 'D:\\Hasil Scan\\IMG_20140206_0004.jpg'),
(243, 367, 246, '119/420/421.022/2014', 'BAGIAN KERJASAMA', 'NOTA DINAS', '2014-02-06', '1 Berkas', 'Laporan tindak lanjut perjanjian kerjasama antara PD Jasa Yasa kab.malang dengan PDAM Kab.malang', '', 'D:\\Hasil Scan\\IMG_20140206_0007.jpg'),
(244, 101, 247, '141/31/421.012/2014', 'BAGIAN TATA PEMERINTAHAN DESA', 'NPKND', '2014-02-06', '-', 'Klarifikasi permasalahan perangkat desa senggreng kec.sumberpucung', '', 'D:\\Hasil Scan\\IMG_20140206_0003.jpg'),
(245, 101, 248, '141/416/421.012/2014', 'BAGIAN TATA PEMERINTAHAN DESA', 'NOTA DINAS', '2014-02-06', '1 Berkas', 'Klarifikasi permasalahan perangkat desa senggreng kec.sumberpucung', '', 'D:\\Hasil Scan\\IMG_20140206_0002.jpg'),
(246, 448, 249, '800/414/421.103/2014', 'DINAS KESEHATAN', 'Surat Tugas', '2014-02-06', '-', 'Menghadiri Undangan Pertemuan Konsolidasi & penyusun implementation plan AIPD Jatim', '', 'D:\\Hasil Scan\\IMG_20140206_0001.jpg'),
(247, 88, 250, '100/397/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Surat Keluar', '2014-02-06', '-', 'Himbauan Netralitas PNS Dalam Pemilihan Umum Tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140206_0013.jpg'),
(248, 448, 251, '800/434/421.210/2014', 'BADAN KELUARGA BERENCANA', 'Surat Keluar', '2014-02-06', '-', 'RAKERNAS Tahun 2014 dan Sosiolisasi DAK Bidang KB Tahun 2014 pada Tanggal 11 s/d 13 Februari 2014 di JCC ( Jakarta Convention Center ) MENUGASKAN a.n HADI PUSPITA', '', 'D:\\Hasil Scan\\IMG_20140206_0012.jpg'),
(249, 85, 252, '094/399/421.032/2014', 'BAGIAN TATA USAHA', 'Nota Dinas', '2014-02-06', '1 Surat', 'Permohonan Ijin Menghadiri Acara Kegiatan Koordinasi dan Sosialisasi Bidang Mineral dan Batubara', '', 'D:\\Hasil Scan\\IMG_20140206_0011.jpg'),
(250, 22, 253, '010/422/421.023/2014', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'Nota Dinas', '2014-02-06', '1 Berkas ', 'Pointers Kegiatan Bina Desa di Desa Jatisari Kec.Pakisaji', '', 'D:\\Hasil Scan\\IMG_20140206_0010.jpg'),
(251, 85, 254, '094/433/421.214/2014', 'KANTOR PERUMAHAN', 'Surat Perintah Tugas', '2014-02-06', '-', 'RAKERNAS Tahun 2014 dan Sosialisasi DAK Bidang KB Tahun 2014 Pada Tanggal 11 s/d 13 Februari 2014 di  JCC (  Jakarta Convention Center) Menugaskan a.n HADI PUSPITA', '', 'D:\\Hasil Scan\\IMG_20140206_0009.jpg'),
(252, 462, 255, '602.1/420/421.023/2014', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'Surat Keluar', '2014-02-06', '1 CD', 'Klasifikasi dan Kualifikasi Usaha Jasa Konstruksi', '', ''),
(253, 247, 256, '500/427/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Surat Tugas', '2014-02-06', '-', 'Mendampingi Bapak Sekretaris Daerah Kab.Malang Dalam Acara Kegiatan Koordinasi dan Sosialisasi Bidang Mineral dan  Batu Bara pada hari Kamis, 6 Februari 2014 Bertempat di Ruang Birawa Kompleks Hotel Bidakara Jl. Gatot Subroto MENUGASKAN a.n Rachmat Hardij', '', ''),
(254, 247, 257, '500/426/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Surat Tugas ', '2014-02-06', '-', 'Mendampingi Bpk.Bupati Malang dalam acara kegiatan koordinasi dan sosialisasi bidang mineral batu bara pada hari kamis, 6 Februari 2014 bertempatan di ruang birawa kompleks hotel bidadari Jl.Gatot Subroto MENUGASKAN a.n TOMIE HERAWANTO', '', 'D:\\Hasil Scan\\IMG_20140206_0015.jpg'),
(255, 448, 258, '800/378/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-06', '6 Berkas ', 'Penyampaian berkas pensiun janda/duda dan kenaikan pangkat pengabdian ', '', 'D:\\Hasil Scan\\IMG_20140206_0014.jpg'),
(256, 401, 259, '854/377/421.202/2014', 'BKD', 'Surat Izin Bersalin ', '2014-02-06', '-', 'Surat Permintaan Cuti Bersalin Dari Kepala Dinas Kelautan dan Perikanan MENGIZINKAN a.n  Sdr.YUSTINA WAHYU LITASARI', '', ''),
(257, 401, 260, '867/359/421.202/2014', 'BKD', 'Surat Keluar ', '2014-02-06', '-', 'PENETAPAN ANGKAT KREDIT JABATAN PENYULUHAN PERTANIAN', '', 'D:\\Hasil Scan\\IMG_20140206_0013.jpg'),
(258, 401, 261, '867/360/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-06', '-', 'PENETAPAN ANGKA KREDIT JABATAN PENYULUHAN PERTANIAN ', '', 'D:\\Hasil Scan\\IMG_20140206_0012.jpg'),
(259, 401, 262, '867/361/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-06', '-', 'PENETAPAN ANGKA KREDIT JABATAN PENYULUH PERTANIAN', '', 'D:\\Hasil Scan\\IMG_20140206_0010.jpg'),
(260, 401, 263, '867/362/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-06', '-', 'PENETAPAN ANGKA KREDIT JABATAN PENYULUH PERTANIAN', '', 'D:\\Hasil Scan\\IMG_20140206_0009.jpg'),
(261, 401, 264, '867/363/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-06', '-', 'PENETAPAN ANGKA KREDIT JABATAN PENYULUH PERTANIAN', '', 'D:\\Hasil Scan\\IMG_20140206_0008.jpg'),
(262, 396, 265, '848.1/396/421.202/2014', 'BKD', 'Surat Rekomendasi', '2014-02-06', '-', 'Mengikuti Seleksi pada program pendidikan dokter spesialisasi 1 program studi ilmu kesehatan kulit dan kelamin pada fakultas kedokteran Universitas Brawijaya Malang Tanggal 4 Oktober 2012', '', 'D:\\Hasil Scan\\IMG_20140206_0007.jpg'),
(263, 396, 266, '892.4/397/421.202/2014', 'BKD', 'Surat Tugas Belajar', '2014-02-06', '-', 'Melaksanakan Tugas Belajar program magister pendidikan dasar pada universitas negeri malang dengan pembiaya oleh direktorat pembinaan pedidik dan tenaga kependidikan ', '', 'D:\\Hasil Scan\\IMG_20140206_0006.jpg'),
(264, 396, 267, '892.4/398/421.202/2014', 'BKD', 'Surat Tugas Belajar', '2014-02-06', '-', 'Melaksanakan tugas program magister pendidikan dasar ilmu pengetahuan alam pada universitas negeri malang', '', 'D:\\Hasil Scan\\IMG_20140206_0005.jpg'),
(265, 396, 268, '892.4/399/421.202/2014', 'BKD', 'Surat Tugas Belajar', '2014-02-06', '-', 'Melaksanakan tugas belajar program magister pendidikan matematika pada universitas negeri malang dengan pembiaya direktorat pembinaan pendidikan dan tenaga kependidikan ', '', 'D:\\Hasil Scan\\IMG_20140206_0004.jpg'),
(266, 396, 269, '892.4/400/421.202/2014', 'BKD', 'Surat Tugas Belajar', '2014-02-06', '-', 'Melaksanakan Tugas Belajar program magister pendidikan matematika pada universitas negeri malang', '', 'D:\\Hasil Scan\\IMG_20140206_0011.jpg'),
(267, 396, 270, '892.4/401/421.202/2014', 'BKD', 'Surat Tugas Belajar', '2014-02-06', '-', 'Melaksanakan tugas belajar program magister pendidikan bahasa indonesia pada universitas negeri malang dengan a.n NUR KHOIRI,S.pd.', '', 'D:\\Hasil Scan\\IMG_20140206_0010.jpg'),
(268, 396, 271, '892.4/402/421.202/2014', 'BKD', 'Surat Tugas Belajar', '2014-02-06', '-', 'Melaksanakan tugas belajar program magister pendidikan bahasa inggris pada universitas negeri malang dengan a.n NAILUN NAJA,S.pd.', '', 'D:\\Hasil Scan\\IMG_20140206_0009.jpg'),
(269, 396, 272, '892.4/403/421.202/2014', 'BKD', 'Surat Tugas Belajar', '2014-02-06', '-', 'Melaksanakan tugas belajar program magister pendidikan bahasa inggris pada universitas negeri malang dengan a.n WIJI INDAYATI,Spd.', '', 'D:\\Hasil Scan\\IMG_20140206_0008.jpg'),
(270, 396, 273, '892.4/404/421.202/2014', 'BKD', 'Surat tugas belajar', '2014-02-06', '-', 'Melaksanakan tugas belajar program magister pendidikan Sains pada universitas negeri surabaya dengan a.n EKO SULISTYAWAN', '', 'D:\\Hasil Scan\\IMG_20140206_0007.jpg'),
(271, 396, 274, '892.4/405/421.202/2014', 'BKD', 'surat tugas belajar', '2014-02-06', '-', 'Melaksanakan tugas belajar program magister pendidikan dasar ilmu pengetahuan sosial pada universitas negeri malang dengan a.n DINI ARIYANTI,S.pd', '', 'D:\\Hasil Scan\\IMG_20140206_0006.jpg'),
(272, 396, 275, '892.4/406/421.202/2014', 'BKD', 'Surat tugas belajar', '2014-02-06', '-', 'Melaksanakan  tugas belajar program magister pendidikann dasar ilmu pengetahuan sosial pada universitas negeri malang dengan a.n EVI NURUL QOMARYAH,S.pd ', '', 'D:\\Hasil Scan\\IMG_20140206_0005.jpg'),
(273, 396, 276, '892.4/407/421.202/2014', 'BKD', 'Surat tugas belajar', '2014-02-06', '-', 'Melaksanakan tugas belajar program magister pendidikan dasar ilmu pengetahuan alam pada universitas negeri malang dengan a.n SLAMET AGUS HARIANTO,Spd.', '', 'D:\\Hasil Scan\\IMG_20140206_0004.jpg'),
(274, 396, 277, '892.4/408/421.202/2014', 'BKD', 'Surat tugas belajar', '2014-02-06', '-', 'Melaksanakan tugas belajar program magister pendidikan dasar ilmu pengetahuan alam pada universitas negeri malang dengan a.n RUSTIANA YULIATI ANDRYANI,S.pd.', '', 'D:\\Hasil Scan\\IMG_20140206_0003.jpg'),
(275, 396, 278, '892.4/409/421.202/2014', 'BKD', 'Surat tugas belajar', '2014-02-06', '-', 'Melaksanakan tugas belajar program magister pendidikan ilmu pengetahuan alam pada universitas negeri malang dengan a.n DWI RETNO WIDAYANTI,S.pd', '', 'D:\\Hasil Scan\\IMG_20140206_0001.jpg'),
(276, 462, 279, '602.1/430/421.023/2014', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'Surat Keluar ', '2014-02-06', '-', 'Klasifikasi dan Kualifikasi Usaha Jasa Konstruksi ', '', 'D:\\Hasil Scan\\IMG_20140206_0002.jpg'),
(277, 298, 280, '556.2/444/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NOTA DINAS', '2014-02-07', '1 Lembar', 'Permohonan waktu rapat koordinasi rencana kerjasama PD. Jasa yasa dengan pihak ketiga untuk pengelolaan unit pemandian air panas dan hotel songgoriti', '', 'D:\\Hasil Scan\\IMG_20140217_0019.jpg'),
(278, 396, 281, '848.1/410/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-07', '-', 'Izin Belajar Pegawai Negeri sipil', '', 'D:\\Hasil Scan\\IMG_20140217_0018.jpg'),
(279, 396, 282, '848.1/411/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-07', '-', 'Izin Belajar Pegawai Negeri Sipil', '', 'D:\\Hasil Scan\\IMG_20140217_0017.jpg'),
(280, 382, 283, '824.3/412/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-07', '-', 'Persetujuan Pindah Antar Instansi', '', 'D:\\Hasil Scan\\IMG_20140217_0016.jpg'),
(281, 448, 284, '800/340/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-07', '-', 'Surat Perintah', '', ''),
(282, 448, 285, '800/341/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-07', '-', 'Surat Perintah ', '', 'D:\\Hasil Scan\\IMG_20140217_0015.jpg'),
(283, 448, 286, '800/342/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-07', '-', 'Surat Perintah', '', 'D:\\Hasil Scan\\IMG_20140217_0014.jpg'),
(284, 448, 287, '800/343/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-07', '-', 'Surat Perintah Memerintahkan SITI YASIKAH', '', 'D:\\Hasil Scan\\IMG_20140217_0013.jpg'),
(285, 382, 288, '824.3/344/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-07', '1 Bendel', 'Permohonan Pindah Bekerja a.n. Sdr.ARIF RAHMADI,S.pi.', '', 'D:\\Hasil Scan\\IMG_20140217_0012.jpg'),
(286, 382, 289, '824.3/345/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-07', '-', 'Menghadap PNS a.n.Sdr.HARTATOK SUPENO,SE NIP.19851122 201101 1004', '', 'D:\\Hasil Scan\\IMG_20140217_0011.jpg'),
(287, 382, 290, '824.3/346/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-07', '-', 'Menghadap PNS an.Sdr.ANIS WIDYASTUTI,S.pd.', '', 'D:\\Hasil Scan\\IMG_20140217_0010.jpg'),
(288, 381, 291, '824.2/347/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-07', '-', 'Persetujuan Pindah Antar Instansi', '', 'D:\\Hasil Scan\\IMG_20140217_0008.jpg'),
(289, 382, 292, '824.3/348/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-07', '-', 'Persetujuan Pindah Antar Instansi', '', 'D:\\Hasil Scan\\IMG_20140217_0007.jpg'),
(290, 381, 293, '824.2/349/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-07', '-', 'Persetujuan Pindah Antar Instansi', '', 'D:\\Hasil Scan\\IMG_20140217_0006.jpg'),
(291, 448, 294, '800/350/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-07', '6 Berkas', 'Penyampaian Berkas Pensiun Janda/Duda dan Kenaikan Perangkat Pengabdian', '', 'D:\\Hasil Scan\\IMG_20140217_0005.jpg'),
(292, 396, 295, '848.1/351/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-07', '-', 'Izin Belajar Pegawai Negeri Sipil Memberi Izin MOHAMAD SYAIFUDIN', '', 'D:\\Hasil Scan\\IMG_20140217_0004.jpg'),
(293, 396, 296, '848.1/352/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-07', '-', 'Izin Belajar Pegawai Negeri Sipil Memberi Izin SUGENG HARIYANTO', '', 'D:\\Hasil Scan\\IMG_20140217_0003.jpg'),
(294, 398, 297, '851/353/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-07', '-', 'Izin Cuti Tahunan Mengizinkan Ir.KHOIRUL ANWAR', '', 'D:\\Hasil Scan\\IMG_20140217_0002.jpg'),
(295, 398, 298, '851/354/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-07', '-', 'Izin Cuti Tahunan Mengizinkan MASRUR KHOLILI', '', 'D:\\Hasil Scan\\IMG_20140217_0001.jpg'),
(296, 398, 299, '851/355/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-07', '-', 'Izin Cuci Tahunan Mengizinkan NANIK ENDANG MUKTI RAHAYU,SE', '', 'D:\\Hasil Scan\\IMG_20140217_0009.jpg'),
(297, 396, 301, '848.1/374/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-07', '-', 'Izin Belajar Pegawai Negeri Sipil Mengizinkan ALIM', '', 'D:\\Hasil Scan\\IMG_20140217_0014.jpg'),
(298, 396, 302, '848.1/373/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-07', '-', 'Izin Belajar Pegawai Negeri Sipil Mengizinkan MISTRIANI', '', 'D:\\Hasil Scan\\IMG_20140217_0015.jpg'),
(299, 396, 303, '848.1/376/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-07', '-', 'Izin Belajar Pegawai Negeri Sipil Memberi Izin SOKEMAD', '', 'D:\\Hasil Scan\\IMG_20140217_0016.jpg'),
(300, 396, 304, '848.1/375/421.202/2014', 'BKD', 'Surat Keluar ', '2014-02-07', '-', 'Izin Belajar Pegawai Negeri Sipil Memberi Izin ISMARIONO', '', 'D:\\Hasil Scan\\IMG_20140217_0013.jpg'),
(301, 401, 305, '854/356/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-07', '-', 'Izin Cuti Bersalin Mengizinkan YUSHINTA ARMAYANI,A.Md.Keb', '', 'D:\\Hasil Scan\\IMG_20140217_0012.jpg'),
(302, 401, 306, '854/357/421.202/2014', 'BKD', 'Surat Keluar ', '2014-02-07', '-', 'Izin Cuti Bersalin Mengizinkan REINIS DWI FEBRIANITA,A.Md.Kep', '', 'D:\\Hasil Scan\\IMG_20140217_0011.jpg'),
(303, 401, 307, '854/358/421.202/2014', 'BKD', 'Surat Keluar ', '2014-02-07', '-', 'Izin Cuti Bersalin Mengizinkan LULUK LUHURININGTYAS', '', 'D:\\Hasil Scan\\IMG_20140217_0010.jpg'),
(304, 193, 308, '440/452/421.103/2013', 'DINAS KESEHATAN', 'Surat Keluar', '2014-02-10', '-', 'Piagam Penghargaan Bupati Malang Tentang Pelaksanaan Kegiatan Kesatuan Gerak Pemberdayaan dan Kesejahteraan Keluarga Berencana dan Kesehatan Tingkat Kab.Malang Tahun 2013', '', 'D:\\Hasil Scan\\IMG_20140217_0007.jpg'),
(305, 63, 309, '050.454/421.023/2014', 'INSPEKTORAT', 'Nota Dinas ', '2014-02-10', '1 Bendel', 'Laporan Kegiatan Sosialisasi Sistem Monitoring TEPPA ( SISMONTEP)', '', ''),
(306, 85, 310, '094/383/421.051/2014', 'SEKRETARIAT DPRD', 'Surat Tugas', '2014-02-10', '-', 'Mengikuti Kegiatan Penyusunan Rencana Kerja DPRD Kab.Malang Tahun 2014 Pada Tanggal 11 s.d 12 Oktober 2013 Menugaskan a.n NURCAHYO ', '', ''),
(307, 85, 311, '094/382/421.051/2014', 'SEKRETARIAT DPRD', 'Surat Tugas', '2014-02-10', '-', 'Mengikuti Rapat Forum Komunikasi Sekretaris DPRD Kabupaten/Kota se-Jawa Timur Pada Tanggal 21 Agustus 2013 Menugaskan a.n NURCAHYO', '', ''),
(308, 85, 312, '094/381/421.051/2014', 'SEKRETARIAT DPRD', 'Surat Tugas', '2014-02-10', '-', 'Mengikuti Pimpinan DPRD Kab.Malang Melaksanakan Konsultasi ke DPRD Prov.Jatim di Surabaya Pada Tanggal 15 s.d 16 Desember 2013 Menugaskan NURCAHYO', '', ''),
(309, 85, 313, '094/384/421.051/2014', 'SEKRETARIAT DPRD', 'Surat Tugas', '2014-02-10', '-', 'Mengikuti Badan Musyawarah DPRD Kab.Malang Melaksanakan Koordinasi ke DPRD Kab.Blitar  Pada Tanggal 17 s.d 18 November 2013 Menugaskan NURCAHYO', '', ''),
(310, 88, 314, '100/366/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NPKND', '2014-02-10', '1 Berkas ', 'Pertemuan Tingkat Tinggi Walikota Untuk Kota Inklusif', '', ''),
(311, 88, 315, '100/365/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Nota Dinas ', '2014-02-10', '-', 'Pertemuan Tingkat Tinggi Walikota Untuk Kota Inklusif', '', ''),
(312, 88, 316, '100/364/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Nota Dinas', '2014-02-10', '-', 'Rapat Koordinasi Pelaksanaan Bina Desa di Desa Jatisari Kec.Pakisaji', '', ''),
(313, 367, 317, '700/385/421.201/2014', 'INSPEKTORAT', 'Surat Tugas', '2014-02-10', '-', 'Melakukan Reviu Laporan Keuangan Pemerintah Daerah Kab.Malang Tahun Anggaran 2013 ', '', ''),
(314, 367, 318, '539/371/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Surat Keluar ', '2014-02-10', '2 Lembar ', 'Rencana Pembentukan Tim Teknis Rencana Kerjasama Pengelolaan Pemandian Air Panas dan Hotel Songgoriti', '', ''),
(315, 367, 319, '539/394/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Nota Dinas', '2014-02-10', '7 Berkas ', 'Laporan Hasil Evaluasi Kinerja Direktur Utama PD.Jasa Yasa Kab.Malang', '', ''),
(316, 367, 320, '119/392/421.022/2014', 'BAGIAN KERJASAMA', 'Nota Dinas ', '2014-02-10', '1 Berkas', 'Penundaan Rencana Penandatanganan Kesepakatan Bersama Antara Pemerintah Kab.Malang Dengan PT.Telekomunikasi Indonesia, Tbk.', '', ''),
(317, 88, 321, '100/392/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NPKND', '2014-02-10', '1 Berkas', 'Laporan Hasil Pelaksanaan Kegiatan Bina Desa ( Bhakti Sosial Menata Desa) Bulan Januari 2014', '', ''),
(318, 88, 322, '100/393/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Nota Dinas', '2014-02-10', '1 Berkas ', 'Laporan Hasil Pelaksanaan Kegiatan Bina Desa ( Bakti Sosial Menata Desa) Bulan Januari 2014', '', ''),
(319, 85, 323, '094/467/421.116/2014', 'DINAS KEHUTANAN', 'Surat Tugas', '2014-02-11', '-', 'Menghadiri Tugas Koordinasi Antara Panitia Penyelenggara Pusat , Panitia Pelaksana Provinsi dan Kab.Malang Penas Petani Nelayan XIV Tahun 2014 Menugaskan WARDHANA', '', 'D:\\Hasil Scan\\IMG_20140217_0004.jpg'),
(320, 167, 324, '400/475/421.041/2014', 'BAGIAN KESRA', 'Surat Keluar ', '2014-02-11', '-', 'Bimbingan Motivasi dan Pelatihan Ketrampilan Bagi Gender', '', 'D:\\Hasil Scan\\IMG_20140217_0003.jpg'),
(321, 316, 325, '590/465/421.014/2014', 'BAGIAN PERTANAHAN', 'Surat Keluar', '2014-02-11', '-', 'Pencatatan Peralihan Hak Atas Tanah Kepada Pemkab.Malang', '', ''),
(322, 470, 326, '005/468/421.032/2014', 'BAGIAN TATA USAHA', 'Surat Keluar ', '2014-02-11', '-', 'Undangan', '', ''),
(323, 85, 327, '094/467/421.116/2014', 'DINAS KEHUTANAN', 'Surat Tugas', '2014-02-11', '-', 'Menghadiri Rapat Koordinasi Antara Panitia Penyelenggara Pusat, Panitia Pelaksana Provinsi dan Kab.Malang Penas Petani Nelayan XIV Tahun 2014 Menugaskan a.n Wardhana', '', ''),
(324, 154, 328, '360/466/421.034/2014', 'BAGIAN ORGANISASI', 'Surat Keluar ', '2014-02-11', '-', 'Himbauan Pencegahan Terhadap Bencana ', '', ''),
(325, 316, 329, '590/464/421.014/2014', 'BAGIAN PERTANAHAN', 'Surat Keluar ', '2014-02-11', '-', 'Penetapan Status Pengguna Barang Milik Daerah', '', 'D:\\Hasil Scan\\IMG_20140217_0002.jpg'),
(326, 100, 330, '140/460/421.012/2014', 'BAGIAN TATA PEMERINTAHAN DESA', 'Surat Keluar ', '2014-02-11', '-', 'Penyampaian Berkas Laporan Pertanggungjawaban Bantuan Keuangan Desa Tahun 2013', '', 'D:\\Hasil Scan\\IMG_20140217_0001.jpg'),
(327, 167, 331, '400/522/421.041/2014', 'BAGIAN KESRA', 'Nota Dinas', '2014-02-12', '-', 'Pelaksanaan Bimbingan Motivasi dan Pelatihan Ketrampilan Dalam Rangka Peningkatan dan Penyiapan Kerja Bagi Gender di Kab.Malang', '', 'D:\\Hasil Scan\\IMG_20140217_0011.jpg'),
(328, 22, 332, '010/62/421.023/2014', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'Nota Dinas', '2014-02-12', '-', 'Surat Keputusan Kepala Unit Layanan Pengadaan Barang/Jasa (UTP) Tentang Standar Operasional Prosedur Unit Layanan Pengadaan Barang/Jasa ', '', 'D:\\Hasil Scan\\IMG_20140217_0002.jpg'),
(329, 154, 333, '360/520/421.109/2014', 'DINAS BINA MARGA', 'Surat Keluar ', '2014-02-12', '-', 'Surat Pernyataan ', '', 'D:\\Hasil Scan\\IMG_20140217_0001.jpg'),
(330, 88, 334, '100/519/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Nota Dinas', '2014-02-12', '-', 'Persiapan Kegiatan Bina Desa (Bhakti Sosial Menata Desa) di Desa Jatisari Kec.Pakisaji', '', 'D:\\Hasil Scan\\IMG_20140217_0014.jpg'),
(331, 88, 335, '100/517/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NPKND', '2014-02-12', '-', 'Persiapan Kegiatan Bina Desa ( Bhakti Sosial Menata Desa) di Desa Jatisari Kec.Pakisaji', '', 'D:\\Hasil Scan\\IMG_20140217_0003.jpg'),
(332, 22, 336, '010/515/421.023/2014', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'NPKND', '2014-02-12', '-', 'Penyampaian Laporan Akhir DAK Bidang Pertanian Tahun 2013', '', 'D:\\Hasil Scan\\IMG_20140217_0004.jpg'),
(333, 22, 337, '822.4/475/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-12', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140217_0005.jpg'),
(334, 22, 338, '822.4/476/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-12', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140217_0006.jpg'),
(335, 22, 339, '822.4/477''/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-12', '-', 'Kenaikan Gaji Berkala ', '', 'D:\\Hasil Scan\\IMG_20140217_0007.jpg'),
(336, 22, 340, '822.4/478/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-12', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140217_0008.jpg'),
(337, 22, 341, '822.4/479/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-12', '-', 'Kenaikan Gaji Berkala ', '', 'D:\\Hasil Scan\\IMG_20140217_0009.jpg'),
(338, 22, 342, '822.4/480/421.202/2014', 'BKD', 'Surat Keluar ', '2014-02-12', '-', 'Kenaikan Gaji Berkala\r\n', '', 'D:\\Hasil Scan\\IMG_20140217_0001.jpg'),
(339, 22, 343, '822.3/481/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-12', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140217_0002.jpg'),
(340, 22, 344, '822.3/482/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-12', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140217_0003.jpg'),
(341, 22, 345, '822.4/483/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-12', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140217_0004.jpg'),
(342, 22, 346, '822.4/484/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-12', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140217_0005.jpg'),
(343, 22, 347, '822.4/485/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-12', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140217_0007.jpg'),
(344, 22, 348, '822.4/486/421.202/2014', 'BKD', 'Surat Keluar ', '2014-02-12', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140217_0008.jpg'),
(345, 22, 349, '822.4/487/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-12', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140217_0009.jpg'),
(346, 22, 350, '822.4/488/421.202/2014', 'BKD', 'Surat Keluar ', '2014-02-12', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140217_0010.jpg'),
(347, 22, 351, '822.4/489/421.202/2014', 'BKD', 'Surat Keluar ', '2014-02-12', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140217_0011.jpg'),
(348, 22, 352, '822.4/490/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-12', '-', 'Keniakan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140217_0012.jpg'),
(349, 22, 353, '822.3/.491/421.202/2014', 'BKD', 'Surat Keluar ', '2014-02-12', '- ', 'Kenaikan Gaji Berkala', '', ''),
(350, 22, 354, '822.4/492/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-12', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140217_0014.jpg'),
(351, 22, 355, '822.4/493/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-12', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140217_0015.jpg'),
(352, 22, 356, '822.3/494/421.202/2014', 'BKD', 'Surat Keluar ', '2014-02-12', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140217_0006.jpg'),
(353, 22, 357, '822.4/495/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-12', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140217_0001.jpg'),
(354, 22, 358, '822.4/496/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-12', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140217_0002.jpg'),
(355, 22, 359, '822.4/497/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-12', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140217_0003.jpg'),
(356, 22, 360, '822.4/498/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-12', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140217_0004.jpg'),
(357, 22, 361, '822.3/499/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-12', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140217_0005.jpg'),
(358, 22, 362, '422.4/500/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-12', '-', 'Kenaikan Gaji Berkala', '', ''),
(359, 22, 363, '822.3/501/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-12', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140217_0007.jpg'),
(360, 22, 364, '822.4/502/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-12', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140217_0008.jpg'),
(361, 22, 365, '822.3/503/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-12', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140217_0009.jpg'),
(362, 22, 366, '822.4/504/421.202/2014', 'BKD', 'Surat Keluar ', '2014-02-12', '-', 'Kenaikan Gaji Berkala', '', ''),
(363, 22, 367, '543.1/523/421.117/2014', 'DINAS ENERGI & SDM', 'Surat Keluar', '2014-02-12', '-', 'Pengiriman Berkas Draf Wilayah Pertambangan (WP) Kab.Malang', '', 'D:\\Hasil Scan\\IMG_20140217_0006.jpg'),
(364, 22, 368, '541.3/524/421.117/2014', 'DINAS ENERGI & SDM', 'Surat Keluar', '2014-02-12', '-', 'Konsultasi Penetapan Wilayah Pertambangan Rakyat (WPR) Kab.Malang', '', 'D:\\Hasil Scan\\IMG_20140217_0005.jpg'),
(365, 396, 369, '848.1/505/421.202/2014', 'BKD', 'Surat Izin Bupati Malang', '2014-02-12', '-', 'Izin Belajar Pegawai Negri Sipil Memberi Izin a.n SITI ROMELAH', '', 'D:\\Hasil Scan\\IMG_20140217_0013.jpg'),
(366, 396, 370, '848.1/506/421.202/2014', 'BKD', 'Surat Izin Bupati Malang', '2014-02-12', '-', 'Izin Belajar Pegawai Negri Sipil Memberi Izin a.n SUMARMI', '', 'D:\\Hasil Scan\\IMG_20140217_0012.jpg'),
(367, 396, 371, '848.1/507/421.202/2014', 'BKD', 'Surat Izin Bupati Malang', '2014-02-12', '-', 'Izin Belajar Pegawai Negri Sipil Memberi Izin a.n PURWATI', '', 'D:\\Hasil Scan\\IMG_20140217_0011.jpg'),
(368, 396, 372, '848.1/508/421.202/2014', 'BKD', 'Surat Izin Bupati Malang', '2014-02-12', '-', 'Izin Belajar Pegawai Negeri Sipil a.n  BETTY NUR ASIKIN', '', ''),
(369, 396, 373, '848.1/509/421.202/2014', 'BKD', 'Surat Izin Bupati Malang', '2014-02-12', '-', 'Izin Belajar Pegawai Negeri Sipil a.n MUJIATI', '', 'D:\\Hasil Scan\\IMG_20140217_0001.jpg'),
(370, 396, 374, '848.1/510/421.202/2014', 'BKD', 'Surat Izin Bupati Malang', '2014-02-12', '-', 'Izin BeLajar Pegawai Negeri Sipil Memberi Izin RATNA MASI TRIESTI', '', 'D:\\Hasil Scan\\IMG_20140217_0003.jpg'),
(371, 448, 375, '800/532/421.110/2014', 'DINAS PENGAIRAN', 'NPKND', '2014-02-13', '-', 'Surat Perintah Perjalanan Dinas Ir.Agus Priyanto ', '', ''),
(372, 85, 376, '094/533/421.110/2014', 'DINAS PENGAIRAN', 'Surat Keluar', '2014-02-13', '-', 'Surat Tugas MENUGASKAN a.n Agus Priyanto', '', ''),
(373, 297, 377, '556/526/421.108/2014', 'DINAS KEBUDAYAAN & PARIWISATA', 'Surat Keluar ', '2014-02-13', '-', 'Tanda Daftar Usaha Pariwisata ( TDUP)', '', ''),
(374, 297, 378, '421.03/527/421.213/2014', 'KANTOR PEMBERDAYAAN PEREMPUAN & PA', 'Surat Kantor', '2014-02-13', '-', 'Permintaan Data Kegiatan Untuk Penilaian KLA', '', ''),
(375, 297, 379, '421.03/528/421.213/2014', 'KANTOR PEMBERDAYAAN PEREMPUAN & PA', 'Surat Keluar', '2014-02-13', '-', 'Permintaan Data Kegiatan Untuk Penilaian KLA', '', ''),
(376, 297, 380, 'X.539/536/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Nota Dinas', '2014-02-13', '-', 'Laporan Badan Pengawas PD. Jasa Yasa Terkait Hasil Evaluasi Kinerja Direktur Utama PD. Jasa Yasa Kab.Malang', '', 'D:\\Hasil Scan\\IMG_20140217_0008.jpg'),
(377, 297, 381, 'X.539/535/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NPKND', '2014-02-13', '-', 'Laporan Badan Pengawas PD. Jasa Yasa Terkait Hasil Evaluasi Kinerja Direktur Utama PD.Jasa Yasa Kab.Malang', '', ''),
(378, 448, 382, '800/70/421.108/2014', 'DINAS KEBUDAYAAN & PARIWISATA', 'NPKND', '2014-02-13', '-', 'Bantuan Menghadirkan Pelaku Seni dan Budaya Yang Ada di Wilayah Masing-Masing (Daftar Terlampir)', '', ''),
(379, 448, 383, '217/539/421.023/2014', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'Surat Keluar', '2014-02-13', '-', 'Penyampaian Laporan Akhir DAK Bidang Pertanian Tahun 2013', '', 'D:\\Hasil Scan\\IMG_20140217_0006.jpg'),
(380, 154, 384, '360/538/421.216/2014', '216', 'Surat Keluar', '2014-02-14', '-', 'Permintaan Bantuan Bronjong\r\n', '', 'D:\\Hasil Scan\\IMG_20140217_0014.jpg'),
(381, 316, 385, '590/541/421.014/2014', 'BAGIAN PERTANAHAN', 'Nota Dinas', '2014-02-14', '-', 'Mohon Memimpin Sosialisasi Pengadaaan Tanah Untuk Pembangunan Jalan Tol Pandaan-Malang di Desa Banjararum Kec.Singosari', '', 'D:\\Hasil Scan\\IMG_20140217_0013.jpg'),
(382, 421, 386, '893.3/525/421.209/2014', 'BANDIKLAT', 'Surat Keluar', '2014-02-14', '-', 'Permohonan Usulan Calon Peserta Diklat Pin II , III Dan IV Tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140217_0011.jpg'),
(383, 421, 387, '421.03/527/421.213/2014', 'KANTOR PEMBERDAYAAN PEREMPUAN & PA', 'Surat Keluar ', '2014-02-14', '-', 'Permintaan Data Kegiatan Untuk Penilaian KLA', '', 'D:\\Hasil Scan\\IMG_20140217_0012.jpg'),
(384, 421, 388, 'X.769/532/421.201/2014', 'INSPEKTORAT', 'Surat Keluar', '2014-02-14', '-', 'Hasil Pemeriksaan Inspektorat Kab.Malang Pada Perusahaan Daerah Air Minum Kab.Malang', '', 'D:\\Hasil Scan\\IMG_20140217_0007.jpg'),
(385, 297, 389, '556/526/421.108/2014', 'DINAS KEBUDAYAAN & PARIWISATA', 'Surat Keluar', '2014-02-14', '-', 'Tanda Daftar Usaha Pariwisata ( TDUP)', '', 'D:\\Hasil Scan\\IMG_20140217_0012.jpg'),
(386, 297, 390, 'X.757/531/421.201/2014', 'INSPEKTORAT', 'Surat Keluar', '2014-02-14', '-', 'Hasil Evaluasi Akuntabilitas Kinerja Instansi Pemerintah (AKIP) Dinas Bina Marga Kab.Malang Tahun 2012', '', 'D:\\Hasil Scan\\IMG_20140217_0011.jpg'),
(387, 297, 391, 'X.539/535/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NPKND', '2014-02-14', '-', 'Laporan Badan Pengawas PD.Jasa Yasa Terkait Hasil Evaluasi Kinerja Direktur Utama PD.Jasa Yasa Kab.Malang', '', ''),
(388, 297, 392, 'X.539/536/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Nota Dinas', '2014-02-14', '-', 'Laporan Badan Pengawas PD.Jasa Yasa Terkait Hasil Evaluasi Kinerja Direktur Utama PD.Jasa Yasa Kab.Malang', '', ''),
(389, 297, 393, '421.03/528/421.213/2014', 'KANTOR PEMBERDAYAAN PEREMPUAN & PA', 'Surat Keluar', '2014-02-14', '-', 'Permintaan Data Kegiatan Untuk Penilaian KLA', '', 'D:\\Hasil Scan\\IMG_20140217_0007.jpg'),
(390, 297, 394, '217/539/421.023/2014', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'Surat Keluar', '2014-02-14', '-', 'Penyampaian Laporan Akhir DAK Bidang Pertanian Tahun 2013', '', ''),
(391, 297, 395, 'X.756/530/421.201/2014', 'INSPEKTORAT', 'Surat Keluar', '2014-02-14', '-', 'Hasil Pemeriksaan Inspektorat Kab.Malang Pada Dinas Tenaga Kerja dan Transmigrasi Kab.Malang', '', 'D:\\Hasil Scan\\IMG_20140217_0010.jpg'),
(392, 448, 396, '800/532/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NPKND', '2014-02-14', '-', 'Surat Perintah Perjalanan Dinas a.n Agus Priyanto', '', 'D:\\Hasil Scan\\IMG_20140217_0004.jpg'),
(393, 85, 397, '094/533/421.110/2014', 'DINAS PENGAIRAN', 'Surat Tugas', '2014-02-14', '-', 'Menghadiri Rapat Persiapan Kegiatan Pekan Nasional (PENAS) Petani Nelayan XIV Tahun 2014 Menugaskan a.n AGUS PRIYANTO', '', 'D:\\Hasil Scan\\IMG_20140217_0005.jpg'),
(394, 85, 398, '119/596/421.022/2014', 'BAGIAN KERJASAMA', 'Nota Dinas', '2014-02-17', '-', 'Permohonan Surat Kuasa Penandatanganan Pada Perjanjian Sewa Menyewa Antara Pemerintah Kab.Malang Dengan PT. BAKRIE TELECOM Tbk', '', 'D:\\Hasil Scan\\IMG_20140217_0003.jpg'),
(395, 85, 399, '119/594/421.022/2014', 'BAGIAN KERJASAMA', 'Nota Dinas', '2014-02-17', '-', 'Laporan Rencana Penandatanganan Kesepakatan Bersama Antara Pemerintah Kab.Malang Dengan PT.Telekomunikasi Indonesia , Tbk.', '', 'D:\\Hasil Scan\\IMG_20140217_0001.jpg'),
(396, 155, 400, '361/592/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Surat Keluar', '2014-02-17', '-', 'Permohonan Penggunaan Cadangan Beras Pemerintah Akibat Erupsi Gunung Kelud', '', 'D:\\Hasil Scan\\IMG_20140217_0008.jpg'),
(397, 155, 401, '361/591/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NPKND', '2014-02-17', '-', 'Permohonan Penggunaan Cadangan Beras Pemerintah Akibat Erupsi Gunung Kelud', '', 'D:\\Hasil Scan\\IMG_20140217_0007.jpg'),
(398, 261, 402, '518/602/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Nota Dinas', '2014-02-17', '-', 'Pelaksanaan Program RASKIN Tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140217_0006.jpg'),
(399, 316, 403, '590/541/421.014/2014', 'BAGIAN PERTANAHAN', 'Nota Dinas', '2014-02-17', '-', 'Mohon Memimpin Sosialisasi Pengadaan Tanah Untuk Pembangunan Jalan Tol Pandaan-Malang di Desa Banjararum Kec.Singosari', '', ''),
(400, 316, 404, '590/82/421.014/2014', 'BAGIAN PERTANAHAN', 'NPKND', '2014-02-17', '-', 'Mohon Memimpin Sosialisasi Pengadaan Tanah Untuk Kepentingan Pembangunan Jalan Tol Pandaan-Malang Desa Banjararum Kec.Singosari', '', ''),
(401, 88, 405, '100/603/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Nita Dinas', '2014-02-17', '-', 'Penerimaan Kunjungan Kerja Pemerintah Kab.Jember Prov. Jawa Timur ke Pemerntah Kab.Malang Prov.Jatim', '', 'D:\\Hasil Scan\\IMG_20140220_0014.jpg'),
(402, 85, 406, '094/608/421.116/2014', 'DINAS KEHUTANAN', 'Surat Tugas', '2014-02-17', '-', 'Menghadiri Rapat Koordinasi Bidang Sinkronisasi Program Pembangunan Pertanian Pusat dan Daerah MENUGASKAN a.n WARDHANA W', '', 'D:\\Hasil Scan\\IMG_20140217_0004.jpg'),
(403, 101, 407, '141/597/421.012/2014', 'BAGIAN TATA PEMERINTAHAN DESA', 'NPKND', '2014-02-17', '-', 'Permohonan Langkah dan Tindakan Kepada Kepala Desa Sumbermanjing Wetan Atas Nama Saudara Sudirman', '', 'D:\\Hasil Scan\\IMG_20140217_0003.jpg'),
(404, 43, 408, '032/605/421.119/2014', 'DPPKA', 'Surat Keluar', '2014-02-17', '-', 'Dokumen Perjanjian Sewa Kios TWA Wendit', '', 'D:\\Hasil Scan\\IMG_20140217_0001.jpg'),
(405, 81, 409, '090/604/421.301/2014', 'SATPOL PP & LINMAS', 'Surat Perintah Tugas', '2014-02-17', '-', 'Menghadiri Rapat Finalitas Upacara Perngatan HUT Satpol PP ke 64 dan HUT Satlinmas Ke 52 Tahun 2014 Serta Rakornas Pol PP Seluruh Indonesia Tahun 2014 Memerintahkan a.n SIGIT YUNIARTO', '', 'D:\\Hasil Scan\\IMG_20140217_0002.jpg'),
(406, 63, 410, '050/454/421.023/2014', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'Nota Dinas', '2014-02-17', '-', 'Laporan Kegiatan Sosialisasi Sistem Monitoring TEPPA ( SISMONTEP)', '', 'D:\\Hasil Scan\\IMG_20140217_0010.jpg'),
(407, 63, 411, '822.3/491/421.202/2014', 'BKD', 'Surat Keluar ', '2014-02-17', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140217_0013.jpg'),
(408, 63, 412, '822.4/500/421.202/2014', 'BKD', 'Surat Keluar ', '2014-02-17', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140217_0006.jpg'),
(409, 63, 413, '539/641/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Nota Dinas', '2014-02-18', '-', 'Rencana Pembentukan Tim Teknis Kerjasama Pengelolaan Pemandian Air Panas dan Hotel Songgoriti', '', 'D:\\Hasil Scan\\IMG_20140220_0004.jpg'),
(410, 103, 414, '170/614/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Surat Keluar', '2014-02-18', '-', 'Laporan Berita Acara Pengucapan Sumpah Atau Janji Anggota DPRD Kab.Malang Pengganti Antar Waktu (PAW) a.n Sdri FAHLIYATUN NISA', '', 'D:\\Hasil Scan\\IMG_20140220_0011.jpg'),
(411, 97, 415, '135/615/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Surat Keluar', '2014-02-18', '-', 'Pemberitahuan Pelaksanaan Kegiatan Dengan Swakelola', '', ''),
(412, 448, 416, '800/636/421.205/2014', 'BAKESBANGPOL', 'Surat Tugas', '2014-02-18', '-', 'Menghadiri Kegiatan Rapat Koordinasi Penyelenggaraan Pemilu 2014 Yang  Akan Diselenggarakan Pada Hari Senin 12 Februari 2014 MENUGASKAN a.n KUKUH BANENDRO', '', ''),
(413, 85, 417, '094/639/421.051/2014', 'SEKRETARIAT DPRD', 'Surat Tugas', '2014-02-18', '-', 'Mengkoordinasi Pelaksanaan Bimbingan Teknis ''Peningkatan Kapabilitas DPRD Dalam Pengawasan Pengelolaan Keuangan Daerah Serta Permendagri No.23 Tahun 2013 MENUGASKAN a.n NURCAHYO ', '', 'D:\\Hasil Scan\\IMG_20140220_0006.jpg'),
(414, 88, 418, '100/603/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Nota Dinas ', '2014-02-18', '-', 'Penerimaan Kunjungan Kerja Pemerintah Kabupaten Jember Provinsi Jawa Timur Ke Pemerintah Kab.Malang Prov.Jatim', '', ''),
(415, 63, 419, '050/620/421.203/2014', 'BAPPEKAB', 'Surat Keluar', '2014-02-18', '-', 'Permohonan Jadwal Penyampaian LKPJ Bupati Malang Tahun 2013', '', 'D:\\Hasil Scan\\IMG_20140220_0008.jpg'),
(416, 246, 420, '489/619/421.033/2014', 'BAGIAN HUMAS', 'Surat Keluar', '2014-02-18', '-', 'Permintaan Materi Talk Show', '', 'D:\\Hasil Scan\\IMG_20140220_0009.jpg'),
(417, 361, 421, '671/607/421.117/2014', 'DINAS ENERGI & SDM', 'Surat Keluar', '2014-02-18', '-', 'Rencana Pendirian Pembangkit Listrik Tenaga Mini Hydro (PLTM) di Kab.Malang', '', 'D:\\Hasil Scan\\IMG_20140220_0013.jpg'),
(418, 424, 422, '900/640/421.119/2014', 'DPPKA', 'Surat Keluar', '2014-02-18', '-', 'Surat Pernyataan Pembayaran Gaji Bulan Januari 2014 Untuk Pejabat Negara (Bupati dan Wakil Bupati ) Kab.Malang', '', 'D:\\Hasil Scan\\IMG_20140220_0005.jpg'),
(419, 261, 423, '518/611/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Surat Keluar', '2014-02-18', '-', 'P elaksanaan Program RASKIN Tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140220_0012.jpg'),
(420, 40, 424, '028/637/421.119/2014', 'DPPKA', 'Surat Keluar', '2014-02-18', '-', 'Berita Acara Serah Terima Kendaraan Dinas Roda 2 (Dua)', '', 'D:\\Hasil Scan\\IMG_20140220_0007.jpg'),
(421, 448, 425, '800/003/421.202/2013', 'BKD', 'Surat Keluar ', '2014-01-03', '-', 'Penyusunan Sasaran Kerja (SKP) PNS ', '', 'D:\\Hasil Scan\\IMG_20140107_0019.jpg'),
(422, 88, 426, '100/652/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Surat Keluar', '2014-02-19', '1 Berkas', 'Permohonan Cuti Bupati Dalam Rangka Kampanye Pemilu Anggota DPR,DPD,dan DPRD Kab.Malang', '', 'D:\\Hasil Scan\\IMG_20140220_0011.jpg'),
(423, 43, 427, '032/229/421.119/22014', 'DPPKA', 'Surat Keluar', '2014-02-19', '-', 'Pemutakhiran Data Kendaraan Dinas Pada SIMBADA', '', 'D:\\Hasil Scan\\IMG_20140220_0005.jpg'),
(424, 43, 428, 'X.710/261/421.201/2014', 'INSPEKTORAT', 'Surat Keluar', '2014-02-19', '-', 'Hasil Pemeriksaan Inspektorat Kabupaten Malang Pada Kecamatan Ngajum Kab.Malang', '', 'D:\\Hasil Scan\\IMG_20140220_0004.jpg'),
(425, 43, 429, 'X.747/262/421.201/2014', 'INSPEKTORAT', 'Surat Keluar', '2014-02-19', '-', 'Hasil Pemeriksaan Inspektorat Kabupaten Malang Pada Badan Keluarga Berencana Kab.Malang', '', 'D:\\Hasil Scan\\IMG_20140220_0003.jpg'),
(426, 444, 430, 'X.780/263/421.201/2014', 'INSPEKTORAT', 'Surat Keluar', '2014-02-19', '-', 'Penekanan Pelaksanaan Tugas', '', 'D:\\Hasil Scan\\IMG_20140220_0002.jpg'),
(427, 444, 431, 'X.734/447/421.201/2014', 'INSPEKTORAT', 'Surat Keluar', '2014-02-19', '-', 'Hasil Pemeriksaan Inspektorat Kabupaten Malang Pada Dinas Kelautan dan Perikanan Kab.Malang', '', 'D:\\Hasil Scan\\IMG_20140220_0001.jpg'),
(428, 444, 432, 'X.700/446/421.201/2014', 'INSPEKTORAT', 'Surat Keluar', '2014-02-19', '-', 'Peringatan', '', 'D:\\Hasil Scan\\IMG_20140220_0002.jpg'),
(429, 316, 433, '590/649/421.014/2014', 'BAGIAN PERTANAHAN', 'NPKND', '2014-02-19', '-', 'Penerbitan Keputusan Bupati Malang Tentang Tim Validasi Tanah Asset Kab.Malang', '', 'D:\\Hasil Scan\\IMG_20140220_0013.jpg'),
(430, 316, 434, '590/650/421.014/2014', 'BAGIAN PERTANAHAN', 'Nota Dinas', '2014-02-19', '-', 'Penerbitan Keputusan Bupati Malang Tentang Tim Validasi Tanah Asset Daerah Kab.Malang', '', 'D:\\Hasil Scan\\IMG_20140220_0012.jpg'),
(431, 85, 435, '094/644/421.113/2014', 'DISPERINDAG & PASAR', 'Surat Tugas', '2014-02-19', '-', 'Menghadiri Rapat Koordinasi,Pembentukan Daerah Tertib Ukuran dan Pasar Tertib Ukur Tahun 2014 ,Pada Hari Selasa s.d Jum''at Tanggal 18 s.d 21 Pebruari 2014 MEMERINTAHKAN HELIJANTI KOENTARI  ', '', 'D:\\Hasil Scan\\IMG_20140220_0002.jpg'),
(432, 448, 437, '800/665/421.103/2014', 'DINAS KESEHATAN', 'Surat Tugas', '2014-02-20', '-', 'Menghadiri Konsultasi Perubahan Kedua atas Peraturan Daerah Nomor 10 Tahun 2010 Tentang Restribusi Jasa Umum MENUGASKAN a.n MURSYIDAH', '', 'D:\\Hasil Scan\\IMG_20140220_0002.jpg'),
(433, 155, 438, '361/663/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Nota Dinas', '2014-02-20', '-', 'Penggunaan Cadangan Beras Pemerintah (CBP) Akibat Erupsi Gunung Kelud', '', 'D:\\Hasil Scan\\IMG_20140220_0001.jpg'),
(434, 88, 439, '100/661/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NPKND', '2014-02-20', '-', 'Pelaksanaan Kerjasama Swakelola', '', 'D:\\Hasil Scan\\IMG_20140220_0004.jpg'),
(435, 96, 440, '136/662/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Nota Dinas', '2014-02-20', '-', 'Pelaksanaan Kerjasama Swakelola', '', 'D:\\Hasil Scan\\IMG_20140220_0003.jpg'),
(436, 85, 441, '094/660/421.032/2014', 'BAGIAN TATA USAHA', 'Nota Dinas', '2014-02-20', '-', 'Permohonan Ijin Menghadiri Rapat Monitoring dan Evaluasi Percepatan Penyelesaian Batas Daerah Antar Kabupaten/Kota', '', 'D:\\Hasil Scan\\IMG_20140220_0005.jpg'),
(437, 88, 442, '100/659/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Nota Dinas', '2014-02-20', '-', 'Laporan Hasil Rapat Koordinasi Dalam Rangka Percepatan Pelayanan Administrasi Terpaduan Kecamatan (PATEN) Tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140220_0006.jpg'),
(438, 448, 443, '800/658/421.103/2014', 'DINAS KESEHATAN', 'Surat Tugas', '2014-02-20', '-', 'Konsultasi Perubahan Kedua atas Peraturan Daerah Nomor 10 Tahun 2010 Tentang Retribusi Jasa Umum MENUGASKAN a.n MURSYIDAH', '', 'D:\\Hasil Scan\\IMG_20140220_0007.jpg'),
(439, 439, 444, '976/653/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NPKND', '2014-02-20', '-', 'Laporan Evaluasi Penggunaan Dana Bagi Hasil Cukai Hasil Tembakau Tahun Anggaran 2013', '', 'D:\\Hasil Scan\\IMG_20140220_0010.jpg'),
(440, 439, 445, '976/654/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Nota Dinas', '2014-02-20', '-', 'Laporan Evaluasi Penggunaan Dana Bagi Hasil Cukai Hasil Tembakau (DBHCHT) Tahun Anggaran 2013', '', 'D:\\Hasil Scan\\IMG_20140220_0009.jpg'),
(441, 255, 446, '511/655/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Surat Keluar', '2014-02-20', '-', 'Rencana Pelaksanaan Rapat Koordinasi dan Sosialisasi Program RASKIN 2014', '', 'D:\\Hasil Scan\\IMG_20140220_0008.jpg'),
(442, 167, 447, '400/625/421.040/2014', 'ASISTEN PEREKONOMIAN & PEMBANGUNAN', 'Nota Dinas', '2014-02-20', '-', 'Laporan Hasil Rapat Koordinasi Penanganan Masalah Sosial Korban Bencana Gunung Kelud', '', 'D:\\Hasil Scan\\IMG_20140220_0003.jpg'),
(443, 88, 448, '100/647/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Surat Keluar', '2014-02-20', '-', 'Surat Kuputusan Bupati Malang dan Surat Kepala Perwakilan Bank Indonesia Wilayah VI Surabaya ', '', 'D:\\Hasil Scan\\IMG_20140220_0014.jpg'),
(444, 261, 449, '518/666/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Nota Dinas', '2014-02-20', '-', 'Laporan Tindak Lanjut Persiapan Pelaksanaan Program RASKIN Tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140220_0001.jpg'),
(445, 154, 450, '360/643/421.032/2014', 'BAGIAN TATA USAHA', 'Surat Keluar ', '2014-02-20', '-', 'Jadwal Petugas Piket Posko Sekretariat Penanggulangan Bencana Gunung Kelud', '', 'D:\\Hasil Scan\\IMG_20140220_0003.jpg'),
(446, 96, 451, '136/615/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Surat Keluar ', '2014-02-20', '-', 'Pemberitahuan Pelaksanaan Kegiatan Dengan Swakelola', '', 'D:\\Hasil Scan\\IMG_20140220_0010.jpg'),
(447, 96, 452, '539/672/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Surat Keluar ', '2014-02-21', '-', 'Pembentukan Tim Teknis Rencana Kerjasama Pengelolaan Kawasan Hotel dan Pemandian Air Panas Songgoriti Dengan Pihak Ketiga ', '', 'D:\\Hasil Scan\\IMG_20140225_0004.jpg'),
(448, 154, 453, '360/683/421.109/2014', 'DINAS BINA MARGA', 'Surat Keluar ', '2014-02-21', '-', 'Surat Pernyataan Bupati Malang Tentang Bencana Alam', '', 'D:\\Hasil Scan\\IMG_20140225_0001.jpg'),
(449, 439, 454, '976/682/421.301/2014', 'SATPOL PP & LINMAS', 'Surat Keluar', '2014-02-21', '-', 'Penyampaian Data Informasi Adanya Peredaran Rokok Ilegal Bulan Oktober s/d Desember 2013', '', 'D:\\Hasil Scan\\IMG_20140225_0003.jpg'),
(450, 439, 455, '539/672/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Surat Keluar', '2014-02-21', '-', 'Pembentukan Tim Teknis Rencana Kerjasama Pengelolaan Kawasan Hotel dan pemandian Air Panas Songgoriti Dengan Pihak Ketiga', '', ''),
(451, 349, 456, '650/673/421.111/2014', 'DINAS CIPTA KARYA & TATA RUANG', 'Surat Keluar', '2014-02-21', '-', 'Permohonan Persetujuan Substansi RDTR Kawasan Perdesaan Singosari - Lawang Kab.Malang', '', 'D:\\Hasil Scan\\IMG_20140225_0009.jpg'),
(452, 167, 457, '400/670/421.041/2014', 'BAGIAN KESRA', 'NPKND', '2014-02-21', '-', 'Pelaksanaan Bimbingan Motivasi dan Pelantikan Ketrampilan Dalam Rangka Peningkatan dan Penyiapan nKerja Bagi Gender di Kab.Malang', '', 'D:\\Hasil Scan\\IMG_20140225_0005.jpg'),
(453, 167, 458, '400/671/421.041/2014', 'BAGIAN KESRA', 'Nota Dinas', '2014-02-21', '-', 'Pelaksanaan Bimbingan Motivasi dan Pelantikan Ketrampilan Dalam Rangka Peningkatan dan Penyiapan Kerja Bagi Gender di Kab.Malang', '', 'D:\\Hasil Scan\\IMG_20140225_0006.jpg'),
(454, 154, 459, '360/612/421.216/2014', 'BPBD', 'Surat Keluar', '2014-02-21', '-', 'Permohonan Bantuan Kedaruratan Bencana Erupsi Gunung Kelud Kab.Malang', '', 'D:\\Hasil Scan\\IMG_20140225_0007.jpg'),
(455, 88, 460, '100/686/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Nota Dinas', '2014-02-21', '-', 'Penerimaan Kunjungan Kerja DPRD Kabupaten Tapin Provinsi Kalimantan Selatan Ke Pemerintah Kab.Malang', '', 'D:\\Hasil Scan\\IMG_20140225_0010.jpg'),
(456, 154, 461, '360/648/421.216/2014', 'BPBD', 'Surat Keluar', '2014-02-21', '-', 'Surat Pernyataan Bupati Malang Tentang Bencana Alam Gunung Meletus', '', 'D:\\Hasil Scan\\IMG_20140225_0008.jpg'),
(457, 154, 462, '119/700/421.022/2014', 'BAGIAN KERJASAMA', 'Surat Keluar', '2014-02-24', '-', 'Pelaksanaan Kerjasama Daerah', '', 'D:\\Hasil Scan\\IMG_20140225_0009.jpg'),
(458, 154, 463, '119/699/421.022/2014', 'BAGIAN KERJASAMA', 'Surat Keluar', '2014-02-24', '-', 'Pemberitauan Kerja Sama', '', 'D:\\Hasil Scan\\IMG_20140225_0008.jpg'),
(459, 43, 464, '032/696/421.032/2014', 'BAGIAN TATA USAHA', 'Nota Dinas', '2014-02-24', '-', 'Permohonan Memimpin Rapat Koordinasi Membahas Tentang Pengelolaan Barang Milik Negara (BMN) Yang Berasal dari Dana Dekonsentrasi dan Tugas Pembantuan Sebelum Tahun Anggaran 2011', '', 'D:\\Hasil Scan\\IMG_20140225_0007.jpg'),
(460, 43, 465, '539/691/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NPKND', '2014-02-24', '-', 'Laporan Hasil Pembahasan Rencana kerja dan Anggaran perusahaan (RKAP) PD.jasa yasa kab.malang tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140225_0005.jpg'),
(461, 43, 466, '539/692/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Nota Dinas', '2014-02-24', '-', 'Laporan Hasil Pembahasan Rencana Kerja dan Anggaran Perusahaan (RKAP) PD. Jasa yasa kab.malang Tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140225_0006.jpg'),
(462, 424, 467, '900/693/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NPKND', '2014-02-24', '-', 'Jawaban atas Penawaran Produk dan Kerjasama', '', 'D:\\Hasil Scan\\IMG_20140225_0004.jpg'),
(463, 274, 468, '524/687/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NPKND', '2014-02-24', '-', 'Laporan Pelaksanaan Inseminasi Buatan Bulan Januari s.d Desember 2013 di Kab.Malang', '', 'D:\\Hasil Scan\\IMG_20140225_0003.jpg'),
(464, 274, 469, '524/688/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Nota Dinas', '2014-02-24', '-', 'Laporan Pelaksanaan Inseminasi Buatan (IB) Bulan Januari s.d Desember 2013 di Kab.Malang', '', 'D:\\Hasil Scan\\IMG_20140225_0002.jpg'),
(465, 274, 470, '119/687/421.022/2014', 'BAGIAN KERJASAMA', 'Surat Keluar', '2014-02-24', '-', 'Jawaban Penawaran Kerjasama', '', 'D:\\Hasil Scan\\IMG_20140225_0001.jpg'),
(466, 85, 471, '094/701/421.051/2014', 'SEKRETARIAT DPRD', 'Surat Tugas', '2014-02-24', '-', 'Untuk mengikuti Workshop Nasional dengan tema "Optimalisasi Peran Sekretariat DPRD terhadapa Pertanggung Jawaban Keuangan MENUGASKAN a.n NURCAHYO ', '', 'D:\\Hasil Scan\\IMG_20140225_0009.jpg'),
(467, 123, 472, '188.45/694/421.216/2014', 'BPBD ', 'NPKND ', '2014-02-25', '-', 'Permohonan Dana Tanggap Darurat Erupsi Gunung Kelud ', '', 'D:\\Hasil Scan\\IMG_20140225_0008.jpg'),
(468, 154, 473, '360/638/421.216/2014', 'BPBD ', 'Surat Pernyataan ', '2014-02-25', '-', 'Surat Pernyataan Bupati Malang tentang Bencana', '', 'D:\\Hasil Scan\\IMG_20140225_0007.jpg'),
(469, 154, 474, '360/684/421.109/2014', 'DINAS BINA MARGA', 'Surat Pernyataan ', '2014-02-25', '-', 'Surat Pernyataan Bupati Malang tentang Bencana', '', 'D:\\Hasil Scan\\IMG_20140225_0006.jpg'),
(470, 443, 475, 'x.700/674/421.201/2014', 'INSPEKTORAT', 'Surat Keluar ', '2014-02-25', '-', 'Penyelesaian Tunggakan Tindak Lanjut Rekomendasi Temuan Hasil Pemeriksaan BPK RI terkait Pengelolaan Tanah', '', 'D:\\Hasil Scan\\IMG_20140225_0005.jpg'),
(471, 443, 476, 'x.780/675/421.201/2014', 'INSPEKTORAT', 'Surat Keluar ', '2014-02-25', '-', 'Hasil Pemeriksaan Inspektorat Kabupaten Malang pada Badan Kepegawaian Daerah ', '', 'D:\\Hasil Scan\\IMG_20140225_0004.jpg'),
(472, 443, 477, 'x.713/676/421.201/2014', 'INSPEKTORAT', 'Surat Keluar ', '2014-02-25', '-', 'Hasil Pemeriksaan Inspektorat Kabupaten Malang pada Kec. Sumberpucung Kabupaten Malang ', '', 'D:\\Hasil Scan\\IMG_20140225_0003.jpg'),
(473, 443, 478, 'x.713/677/421.201/2014', 'INSPEKTORAT', 'Surat Keluar ', '2014-02-25', '-', 'Hasil Pemeriksaan Inspektorat Kabupaten Malang pada Kec. Pakisaji ', '', 'D:\\Hasil Scan\\IMG_20140225_0002.jpg'),
(474, 443, 479, 'x.764/678/421.201/2014', 'INSPEKTORAT', 'Surat Keluar ', '2014-02-25', '-', 'Hasil Evaluasi Akuntabilitas Kinerja Dinas Cipta Karya dan Tata Ruang Kabupaten Malang Tahun 2012', '', 'D:\\Hasil Scan\\IMG_20140225_0001.jpg');
INSERT INTO `surat_keluar` (`id`, `index_surat_id`, `no_urut`, `no_surat`, `pengolah`, `tujuan`, `tanggal_surat`, `lampiran`, `perihal`, `catatan`, `file_surat`) VALUES
(475, 261, 480, '518/117/421.112/2014', 'DINAS KOPERASI & UMKM', 'NPKND', '2014-02-26', '-', 'Permohonan Tanda Tangan Surat Tugas Menghadiri Undangan Rakorda Pemberdayaan Koperasi dan UMKM Prov.Jatim Tahun 2014', '', ''),
(476, 63, 481, '050/711/421.203/2014', 'BAPPEKAB', 'Nota Dinas', '2014-02-26', '-', 'Laporan Keterangan Pertanggung jawaban (LKPJ) Kepala Daerah Kab.Malang Tahun 2013', '', 'D:\\Hasil Scan\\IMG_20140317_0035.jpg'),
(477, 81, 482, '090/262/421.301/2014', 'SATPOL PP & LINMAS', 'NPKND', '2014-02-26', '-', 'Konsep Naskah Surat Tugas', '', ''),
(478, 316, 483, '590/727/421.014/2014', 'BAGIAN PERTANAHAN', 'NPKND', '2014-02-26', '-', 'Surat Tugas Koordinasi dan Konsultasi Percepatan Penataan Batas Tukar Menukar Kawasan Hutan (BATM) Ke Balai Pemantapan Kawasan Hutan Wilayah XI Jawa Madura, di Yogyakarta ', '', 'D:\\Hasil Scan\\IMG_20140317_0023.jpg'),
(479, 101, 484, '141/723/421.012/2014', 'BAGIAN TATA PEMERINTAHAN DESA', 'NPKND', '2014-02-26', '-', 'Laporan Hasil Rapat Koordinasi Terkait Permasalahan Kades Sumbermanjing Wetan', '', 'D:\\Hasil Scan\\IMG_20140317_0026.jpg'),
(480, 101, 485, '141/724/421.012/2014', 'BAGIAN TATA PEMERINTAHAN DESA', 'Nota Dinas ', '2014-02-26', '-', 'laporan Hasil Rapat Koordinasi Terkait Permasalahan Kepala Desa Sumbermanjing Wetan Kec.Sumbermanjing Wetan', '', 'D:\\Hasil Scan\\IMG_20140317_0025.jpg'),
(481, 88, 486, '100/725/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Nota Dinas', '2014-02-26', '-', 'Laporan Sosialisasi Penyusunan (LPPD) Kabupaten/Kota di Prov.Jawa Timur Tahun 2013', '', 'D:\\Hasil Scan\\IMG_20140317_0024.jpg'),
(482, 436, 487, '973/712/421.119/2014', 'DPPKA', 'Surat Keluar', '2014-02-26', '-', 'Percepatan Penyusunan dan Penetapan Perda PBB P-2', '', 'D:\\Hasil Scan\\IMG_20140317_0034.jpg'),
(483, 22, 488, '010/718/421.023', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'NPKND', '2014-02-26', '-', 'Laporan Rapat Koordinasi Pengembangan Perumahan PT.Unicora Agung Desa Ngijo Kec.Karangploso', '', 'D:\\Hasil Scan\\IMG_20140317_0028.jpg'),
(484, 88, 489, '100/715/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Nota Dinas', '2014-02-26', '-', 'Penerimaan Kunjungan Kerja Pemerintah Kab.Klaten Prov.Jateng ke Pemerintah Kab.Malang Prov.Jatim', '', 'D:\\Hasil Scan\\IMG_20140317_0031.jpg'),
(485, 63, 490, '050/717/421.023/2014', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'Nota Dinas', '2014-02-26', '-', 'Laporan Hasil Rapat Koordinasi Tim Pembina Jasa Konstruksi', '', 'D:\\Hasil Scan\\IMG_20140317_0029.jpg'),
(486, 296, 491, '555/716/421.024/2014', 'BAGIAN PDE', 'Nota Dinas', '2014-02-26', '-', 'Pembiayaan Pemakaian Bulanan Telepon Gedung Sekretaris Block Office Kepanjen', '', 'D:\\Hasil Scan\\IMG_20140317_0030.jpg'),
(487, 101, 492, '141/720/421.012/2014', 'BAGIAN TATA PEMERINTAHAN DESA', 'NPKND', '2014-02-26', '-', 'Telaah Staf Terkait Bantuan Keuangan Bagi Desa Penyelenggara Pemilihan Kepala Desa Tahun 2013', '', 'D:\\Hasil Scan\\IMG_20140317_0027.jpg'),
(488, 101, 493, '420/706/421.034/2014', 'BAGIAN ORGANISASI', 'NPKND', '2014-02-26', '-', 'Penguatan Unit Pelaksana Teknis (UPT) PAUDNI', '', 'D:\\Hasil Scan\\IMG_20140317_0038.jpg'),
(489, 101, 494, '119/708/421.022/2014', 'BAGIAN KERJASAMA', 'Nota Dinas', '2014-02-26', '-', 'Permohonan Surat Kuasa Penandatanganan pada Perjanjjian Sewa Menyewa Antara Pemerintah Kabupaten Malang dengan PT. BAKRIE TELECOME Tbk.', '', 'D:\\Hasil Scan\\IMG_20140317_0037.jpg'),
(490, 85, 495, '094/704/421.032/2014', 'BAGIAN TATA USAHA', 'Nota Dinas', '2014-02-26', '-', 'Permohonan Ijin Menghadiri Rapat Koordinasi Nasional Formasi PNS Tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140317_0039.jpg'),
(491, 88, 496, '100/703/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NPKND', '2014-02-26', '-', 'Rapat Monitoreng dan Evaluasi Percepatan Penyelesaian Batas Daerah antar Kab/Kota', '', 'D:\\Hasil Scan\\IMG_20140317_0041.jpg'),
(492, 45, 497, '041/705/421.211/2014', 'BADAN PERPUS, ARSIP & DOKUMENTASI', 'Surat Keluar', '2014-02-26', '-', 'Permohonan Bantuan Buku Untuk Menunjang Pokjanal Posyandu Tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140317_0040.jpg'),
(493, 45, 498, 'X.742/20/421.201/2014', 'INSPEKTORAT', 'NPKND', '2014-02-26', '-', 'Hasil Pemeriksaan Inspektorat Kabupaten Malang pada Dinas Pendidikan Kab.Malang', '', ''),
(494, 45, 499, 'X.755/21/421.201/2014', 'INSPEKTORAT', 'NPKND', '2014-02-26', '-', 'Hasil Pemeriksaan Inspektorat Kabupaten Malang Pada Dinas Perhubungan,Komunikasi dan Informatika Kab.Malang', '', ''),
(495, 85, 500, '094/776/421.014/2014', 'BAGIAN PERTANAHAN', 'Surat Tugas', '2014-02-27', '-', 'Melaksanakan Koordinasi dan Konsultasi tindak lanjut Percepatan penataan Batas Tukar Menukar Kawasan Hutan yang dimohon Pemerintah Kab. Malang pada Hari Kamis- Jum''at Tanggal 27-28 Pebruari 2014 MENUGASKAN a.n MARDIYANTO Dan SUBUR HUTAGALUNG', '', 'D:\\Hasil Scan\\IMG_20140317_0003.jpg'),
(496, 262, 501, '520/773/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Nota Dinas', '2014-02-27', '-', 'Permohonan untuk Menerima Audiensi PT. DuPont Indonesia', '', 'D:\\Hasil Scan\\IMG_20140317_0004.jpg'),
(497, 88, 502, '100/771/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NPKND', '2014-02-27', '-', 'Permohonan Ijin Bupati Malang Prov. Jawa Timur', '', 'D:\\Hasil Scan\\IMG_20140317_0005.jpg'),
(498, 88, 503, '100/772/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NPKND', '2014-02-27', '-', 'Permohonan Ijin Bupati Malang Prov. Jawa Timur', '', 'D:\\Hasil Scan\\IMG_20140317_0006.jpg'),
(499, 88, 504, '539/768/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NPKND', '2014-02-27', '-', 'Evaluasi Terhadap Laporan Keuangan Tahun 2013 (Unaudited) PT. BPR Artha Kanjuruhan Pemerintahan Kab. Malang', '', 'D:\\Hasil Scan\\IMG_20140317_0009.jpg'),
(500, 88, 505, '539/769/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NOTA DINAS', '2014-02-27', '-', 'Evaluasi Terhadap Laporan Keuangn Tahun 2013 (Unaudited) PT. BPR Artha Kanjuruhan Pemerintah Kab. Malang', '', 'D:\\Hasil Scan\\IMG_20140317_0008.jpg'),
(501, 88, 506, '539/767/421.021/2014', 'BAGIAN PEREKONOMIAN', 'N\\OTA DINAS', '2014-02-27', '-', 'Telaah Terhadap Permohonan Persetujuan Ketua DPRD Melalui Pemerintah Kab. Malang untuk Proses Kerjasama Pengelola Pemandian Air Panas dan Hotel Songgoriti', '', 'D:\\Hasil Scan\\IMG_20140317_0010.jpg'),
(502, 88, 507, '539/770/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NOTA DINAS', '2014-02-27', '-', 'Laporan Tindak Lanjut atas Penyusula Laporan Keuangan PT. Kigumas', '', 'D:\\Hasil Scan\\IMG_20140317_0007.jpg'),
(503, 63, 508, '050/730/421.041/2014', 'BAGIAN KESRA', 'NPKND', '2014-02-27', '-', 'Peserta Diklat Penyusunan Rencana Strategis ( Renstra) SKPD Angkatan I Tahun 2014', '', ''),
(504, 88, 509, '100/763/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NOTA DINAS', '2014-02-27', '-', 'Penerimaan akunjungan Kerja Kerja Kabupaten Jembara Prov. Bali ke Pemerintah Kab. Malang', '', 'D:\\Hasil Scan\\IMG_20140317_0012.jpg'),
(505, 22, 510, '010/779/421.023/2014', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'NPKND', '2014-02-27', '-', 'Nota Dinas Hibah Kepada Lembaga Pendidikan Swasta Di Kab.Malang Tahap I Tahun Anggaran 2014', '', 'D:\\Hasil Scan\\IMG_20140317_0001.jpg'),
(506, 22, 511, '010/778/421.023/2014', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'NPKND', '2014-02-27', '-', 'Permintaan Untuk Menjadi Nara Sumber', '', 'D:\\Hasil Scan\\IMG_20140317_0002.jpg'),
(507, 206, 512, '451/709/421.042/2014', 'BAGIAN ADMINISTRASI', 'Nota Dinas', '2014-02-27', '-', 'Laporan Hasil Mengikuti Dialog Ulama Dan Umaro Se Jawa Timur Tentang Pembinaan dan Pengawasan Aliran Keagamaan di Jawa Timur Tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140317_0036.jpg'),
(508, 424, 513, '900/702/421.119/2014', 'DPPKA', 'Surat Keluar', '2014-02-27', '-', 'Surat Pernyataan Tanggung Jawab ', '', 'D:\\Hasil Scan\\IMG_20140317_0042.jpg'),
(509, 88, 514, '100/763/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Nota Dinas  ', '2014-02-27', '-', 'Penerimaan Kunjungan Kerja Kab.Jembrana Prov.Bali ke Pemerintah Kab.Malang', '', ''),
(510, 247, 515, '500/731/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Surat Keluar', '2014-02-27', '-', 'Surat Pengantar ', '', 'D:\\Hasil Scan\\IMG_20140317_0022.jpg'),
(511, 448, 516, '800/764/421.202/2014', 'BKD', 'Surat Keluar ', '2014-02-27', '-', 'Surat Tugas ', '', 'D:\\Hasil Scan\\IMG_20140317_0011.jpg'),
(512, 63, 517, '050/711/421.203/2014', 'BAPPEKAB', 'Nota Dinas ', '2014-02-27', '-', 'Laporan Keterangan Pertanggungjawaban (LKPJ) Kerpala Daerah Kabupaten Malang Tahun 2013', '', ''),
(513, 404, 518, '857/713/421.202/2014', 'BKD', 'Surat Keluar ', '2014-02-27', '--', 'Surat Ijin Cuti Karena Alasan Penting ', '', 'D:\\Hasil Scan\\IMG_20140317_0033.jpg'),
(514, 401, 519, '854/714/421.202/2014', 'BKD', 'Surat Keluar ', '2014-02-27', '-', 'Surat Ijin Cuti Bersalin ', '', 'D:\\Hasil Scan\\IMG_20140317_0032.jpg'),
(515, 401, 520, '867/738/421.202/2014', 'BKD', 'Surat Keluar ', '2014-02-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Dokter ', '', 'D:\\Hasil Scan\\IMG_20140317_0021.jpg'),
(516, 401, 521, '867/739/421.202/2014', 'BKD', 'Surat Keluar ', '2014-02-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140317_0020.jpg'),
(517, 401, 522, '867/740/421.202/2014', 'BKD', 'Surat Keluar ', '2014-02-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan ', '', 'D:\\Hasil Scan\\IMG_20140317_0019.jpg'),
(518, 401, 523, '867/741/421.202/2014', 'BKD', 'Surat Keluar ', '2014-02-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140317_0018.jpg'),
(519, 401, 524, '867/742/421.202/2014', 'BKD', 'Surat Keluar ', '2014-02-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140317_0017.jpg'),
(520, 401, 525, '867/743/421.202/2014', 'BKD', 'Surat Keluar ', '2014-02-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Perawat', '', 'D:\\Hasil Scan\\IMG_20140317_0016.jpg'),
(521, 401, 526, '867/744/421.202/2014', 'BKD', 'Surat Keluar ', '2014-02-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Perawat Gigi', '', 'D:\\Hasil Scan\\IMG_20140317_0015.jpg'),
(522, 401, 527, '867/745/421.202/2014', 'BKD', 'Surat Keluar ', '2014-02-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Perawat', '', 'D:\\Hasil Scan\\IMG_20140317_0014.jpg'),
(523, 401, 528, '867/746/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140317_0013.jpg'),
(524, 401, 529, '867/747/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan ', '', 'D:\\Hasil Scan\\IMG_20140317_0054.jpg'),
(525, 401, 530, '867/748/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Nutrisionis ', '', 'D:\\Hasil Scan\\IMG_20140317_0055.jpg'),
(526, 401, 531, '867/749/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Perawat\r\n', '', 'D:\\Hasil Scan\\IMG_20140317_0056.jpg'),
(527, 401, 532, '867/750/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional  Pranata Laboratorium Kesehatan', '', 'D:\\Hasil Scan\\IMG_20140317_0057.jpg'),
(528, 401, 533, '867/751/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Perawat', '', 'D:\\Hasil Scan\\IMG_20140317_0058.jpg'),
(529, 401, 534, '867/752/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Sanitarian', '', 'D:\\Hasil Scan\\IMG_20140317_0059.jpg'),
(530, 401, 535, '867/753/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Perawat Gigi', '', 'D:\\Hasil Scan\\IMG_20140317_0060.jpg'),
(531, 401, 536, '867/754/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Sanitarian', '', 'D:\\Hasil Scan\\IMG_20140317_0061.jpg'),
(532, 401, 537, '867/755/421.202/2014', 'BKD', 'Surat Keluar ', '2014-02-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Sanitarian', '', 'D:\\Hasil Scan\\IMG_20140317_0062.jpg'),
(533, 401, 538, '867/756/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Perawat', '', 'D:\\Hasil Scan\\IMG_20140317_0063.jpg'),
(534, 401, 539, '867/757/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Perawat', '', 'D:\\Hasil Scan\\IMG_20140317_0064.jpg'),
(535, 401, 540, '867/758/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Nutrisionis', '', 'D:\\Hasil Scan\\IMG_20140317_0065.jpg'),
(536, 401, 541, '867/759/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Sanitarian', '', 'D:\\Hasil Scan\\IMG_20140317_0066.jpg'),
(537, 401, 542, '867/760/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140317_0067.jpg'),
(538, 401, 543, '867/761/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Sanitarian', '', 'D:\\Hasil Scan\\IMG_20140317_0068.jpg'),
(539, 401, 544, '867/762/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140317_0069.jpg'),
(540, 401, 545, '867/732/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Dokter', '', 'D:\\Hasil Scan\\IMG_20140317_0053.jpg'),
(541, 401, 546, '867/733/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Epidemiolog', '', 'D:\\Hasil Scan\\IMG_20140317_0052.jpg'),
(542, 401, 547, '867/734/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Apoteker', '', 'D:\\Hasil Scan\\IMG_20140317_0051.jpg'),
(543, 401, 548, '867/735/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140317_0050.jpg'),
(544, 401, 549, '867/736/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140317_0049.jpg'),
(545, 401, 550, '867/737/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140317_0048.jpg'),
(546, 381, 551, '824.2/542/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-27', '-', 'Persetujuan Pindah Antar Instansi', '', 'D:\\Hasil Scan\\IMG_20140317_0047.jpg'),
(547, 382, 552, '824.3/543/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-27', '-', 'Menghadapkan PNS a.n. Sdr.Kuntari, S.ST.,M.Agr', '', 'D:\\Hasil Scan\\IMG_20140317_0046.jpg'),
(548, 464, 553, '828/544/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-27', '-', 'Permohonan Pindah Bekerja a.n Sdr.drg. BERTY PRAMATIKA', '', 'D:\\Hasil Scan\\IMG_20140317_0045.jpg'),
(549, 464, 554, '828/545/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-27', '-', 'Permohonan Pindah Bekerja a.n Sdr.IKA NURHANDAYANI, A.Md ', '', 'D:\\Hasil Scan\\IMG_20140317_0044.jpg'),
(550, 285, 555, '822.4/546/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-27', '-', 'Kenaikan Gaji Berkala', '-', 'D:\\Hasil Scan\\IMG_20140317_0043.jpg'),
(551, 285, 556, '822.4/547/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-27', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140317_0042.jpg'),
(552, 285, 557, '822.3/548/421.202/2014', 'BKD', 'Surat Masak', '2014-02-27', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140317_0041.jpg'),
(553, 285, 558, '822.3/549/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-27', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140317_0040.jpg'),
(554, 285, 559, '822.4/550/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-27', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140317_0039.jpg'),
(555, 285, 560, '822.4/551/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-27', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140317_0038.jpg'),
(556, 285, 561, '822.4/552/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-27', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140317_0037.jpg'),
(557, 285, 562, '822.3/553/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-27', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140317_0036.jpg'),
(558, 285, 563, '822.4/554/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-27', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140317_0035.jpg'),
(559, 285, 564, '822.4/555/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-27', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140317_0034.jpg'),
(560, 285, 565, '822.4/556/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-27', '-', 'Kenaikan Gaji Berhala', '', 'D:\\Hasil Scan\\IMG_20140317_0033.jpg'),
(561, 285, 566, '822.4/557/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-27', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140317_0032.jpg'),
(562, 285, 567, '822.4/558/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-27', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140317_0031.jpg'),
(563, 285, 568, '822.4/559/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-27', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140317_0030.jpg'),
(564, 396, 569, '848.1/560/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-27', '-', 'Surat Izin Belajar Pegawai Negeri Sipil MENGIZINKAN a.n NURUL HUDA', '', 'D:\\Hasil Scan\\IMG_20140317_0029.jpg'),
(565, 396, 570, '848.1/561/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-27', '-', 'Surat Izin Belajar Pegawai Negeri Sipil MENGIZINKAN a.n ABDUL MUNTHOLIB', '', 'D:\\Hasil Scan\\IMG_20140317_0028.jpg'),
(566, 396, 571, '848.1/562/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-27', '-', 'Surat Izin Belajar Pegawai Negeri Sipil MENGIZINKAN a.n KUSWARI', '', 'D:\\Hasil Scan\\IMG_20140317_0027.jpg'),
(567, 401, 572, '854/563/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-27', '-', 'Surat Izin Cuti Bersalin MENGIZINKAN a.n NUZUL WAHYUNI', '', 'D:\\Hasil Scan\\IMG_20140317_0026.jpg'),
(568, 398, 573, '851/564/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-27', '-', 'Surat Izin Cuti Tahunan MENGIZINKAN a.n LELY TRIANOVITA', '', 'D:\\Hasil Scan\\IMG_20140317_0025.jpg'),
(569, 398, 574, '851/565/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-27', '-', 'Surat Izin Cuti Tahunan MENGIZINKAN a.n ASRI TRI RAHAYU', '', 'D:\\Hasil Scan\\IMG_20140317_0024.jpg'),
(570, 396, 575, '848.1/567/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-27', '-', 'Surat Izin Belajar Pegawai Negeri Sipil MEMBERI IZIN a.n LELY ZULAIKAH', '', 'D:\\Hasil Scan\\IMG_20140317_0023.jpg'),
(571, 396, 576, '848.1/566/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-27', '-', 'Surat Izin Belajar Pegawai Negeri Sipil MEMBERI IZIN a.n MISENAN', '', 'D:\\Hasil Scan\\IMG_20140317_0022.jpg'),
(572, 396, 577, '848.1/568/421.202/2014', 'BKD', 'Surat Tugas', '2014-02-27', '-', 'Surat Izin Belajar Pegawai Negeri Sipil MEMBERI IZIN a.n SULISTIONO', '', 'D:\\Hasil Scan\\IMG_20140317_0021.jpg'),
(573, 396, 578, '848.1/569/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-27', '-', 'Surat Izin Belajar Pegawai Negeri Sipil MEMBERI IZIN a.n LEGINEM', '', 'D:\\Hasil Scan\\IMG_20140317_0020.jpg'),
(574, 396, 579, '848.1/570/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-28', '-', 'Surat Izin  Belajar Pegawai Negeri Sipil MEMBERI IZIN a.n ENY PUJI LESTARI', '', 'D:\\Hasil Scan\\IMG_20140317_0019.jpg'),
(575, 396, 580, '848.1/571/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-28', '-', 'Surat Izin Belajar Pegawai Negeri Sipil MEMBERI IZIN a.n DARWASIH', '', 'D:\\Hasil Scan\\IMG_20140317_0018.jpg'),
(576, 396, 581, '848.1/572/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-28', '-', 'Surat Izin Belajar Pegawai Negeri Sipil MEMBERI IZIN a.n RIRIN ENDAH TRESNOWATI', '', 'D:\\Hasil Scan\\IMG_20140317_0017.jpg'),
(577, 396, 582, '848.1/573/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-28', '-', 'Surat Izin Belajar Pegawai Negeri Sipil MEMBERI IZIN a.n ENDAH MINARTI', '', 'D:\\Hasil Scan\\IMG_20140317_0016.jpg'),
(578, 448, 583, '800/574/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-28', '-', 'Penyampaian Berkas Pemberhatian dengan hormat sebagai Pegawai Negeri Sipil dengan hak pensiun atas permintaan sendiri', '', 'D:\\Hasil Scan\\IMG_20140317_0015.jpg'),
(579, 448, 584, '867/575/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-28', '-', 'Penetapan Angka Kredit Jabatan Penyuluh Pertanian', '', 'D:\\Hasil Scan\\IMG_20140317_0014.jpg'),
(580, 448, 585, '867/576/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-28', '-', 'Penetapan Angka Kredit Jabatan Penyuluh Pertanian', '', 'D:\\Hasil Scan\\IMG_20140317_0013.jpg'),
(581, 448, 586, '867/577/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-28', '-', 'Penetapan Angka Kredit Jabatan Penyuluh Pertanian', '', 'D:\\Hasil Scan\\IMG_20140317_0012.jpg'),
(582, 448, 587, '867/578/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-28', '-', 'Penetapan Angka Kredit Jabatan Penyuluh Pertanian', '', 'D:\\Hasil Scan\\IMG_20140317_0011.jpg'),
(583, 448, 588, '867/579/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-28', '-', 'Penetapan Angka Kredit Jabatan Penyuluh Pertanian', '', 'D:\\Hasil Scan\\IMG_20140317_0010.jpg'),
(584, 448, 589, '867/580/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-28', '-', 'Penetapan Angka Kredit Jabatan Penyuluh Pertanian', '', 'D:\\Hasil Scan\\IMG_20140317_0009.jpg'),
(585, 448, 590, '867/581/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-28', '-', 'Penetapan Angka Kredit Jabatan Penyuluh Pertanian', '', 'D:\\Hasil Scan\\IMG_20140317_0008.jpg'),
(586, 448, 591, '867/582/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-28', '-', 'Penetapan Angka Kredit Jabatan Penyuluh Pertanian', '', 'D:\\Hasil Scan\\IMG_20140317_0007.jpg'),
(587, 448, 592, '867/583/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-28', '-', 'Penetapan Angka Kredit Jabatan Penyuluh Pertanian', '', 'D:\\Hasil Scan\\IMG_20140317_0006.jpg'),
(588, 448, 593, '867/584/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-28', '-', 'Penetapan Angka Kredit Jabatan Penyuluh Pertanian', '', 'D:\\Hasil Scan\\IMG_20140317_0005.jpg'),
(589, 448, 594, '867/585/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-28', '-', 'Penetapan Angka Kredit Jabatan Penyuluh Pertanian', '', 'D:\\Hasil Scan\\IMG_20140317_0004.jpg'),
(590, 448, 595, '867/586/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-28', '-', 'Penetapan Angka Kredit Jabatan Penyuluh Pertanian', '', 'D:\\Hasil Scan\\IMG_20140317_0003.jpg'),
(591, 448, 596, '867/587/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-28', '-', 'Penetapan Angka Kredit Jabatan Penyuluh Pertanian', '', 'D:\\Hasil Scan\\IMG_20140317_0002.jpg'),
(592, 448, 597, '867/588/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-28', '-', 'Penetapan Angka Kredit Jabatan Penyuluh Pertanian', '', 'D:\\Hasil Scan\\IMG_20140317_0001.jpg'),
(593, 448, 598, '800/621/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-28', '-', 'Permohonan Penjatuhan Hukuman Disiplin Bagi PNS Kab.Malang atasv Nama Sdr. Drs.Imam Sahroni ', '', 'D:\\Hasil Scan\\IMG_20140317_0015.jpg'),
(594, 448, 599, '822.4/622/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-28', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140317_0014.jpg'),
(595, 448, 600, '822.4/623/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-28', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140317_0013.jpg'),
(596, 448, 601, '822.4/624/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-28', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140317_0012.jpg'),
(597, 448, 602, '822.4/625/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-28', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140317_0011.jpg'),
(598, 448, 603, '822.4/626/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-28', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140317_0010.jpg'),
(599, 448, 604, '822.4/627/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-28', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140317_0009.jpg'),
(600, 448, 605, '822.4/628/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-28', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140317_0008.jpg'),
(601, 448, 606, '822.4/629/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-28', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140317_0007.jpg'),
(602, 396, 607, '848.1/630/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-28', '-', 'Surat Izin Belajar Pegawai Negeri Sipil MEMBERI IZINB a.n DODIK BAMBANG PURWIDODO', '', 'D:\\Hasil Scan\\IMG_20140317_0006.jpg'),
(603, 396, 608, '848.1/631/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-28', '-', 'Surat Izin Belajar P-egawai Negeri Sipil MEMBERI IZIN a.n LILIK YULIASTINI', '', 'D:\\Hasil Scan\\IMG_20140317_0005.jpg'),
(604, 396, 609, '848.1/632/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-28', '-', 'Surat Izin Belajar P-egawai Negeri Sipil MEMBERI IZIN a.n ROVIA KURNIAWATI', '', 'D:\\Hasil Scan\\IMG_20140317_0004.jpg'),
(605, 396, 610, '848.1/633/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-28', '-', 'Surat Izin Belajar P-egawai Negeri Sipil MEMBERI IZIN a.n ANIK SUNARTI', '', 'D:\\Hasil Scan\\IMG_20140317_0003.jpg'),
(606, 396, 611, '848.1/634/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-28', '-', 'Surat Izin Belajar P-egawai Negeri Sipil MEMBERI IZIN a.n AWANG SYAHRIAL', '', 'D:\\Hasil Scan\\IMG_20140317_0002.jpg'),
(607, 398, 612, '851/635/421.202/2014', 'BKD', 'Surat Keluar', '2014-02-28', '-', 'Surat Izin Cuti Tahunan MENGIZINKAN a.n ENDANG RETNOWATI', '', 'D:\\Hasil Scan\\IMG_20140317_0001.jpg'),
(608, 398, 613, 'X.710/802/421.201/2014', 'INSPEKTORAT', 'Surat Keluar', '2014-03-03', '-', 'Hasil Pemeriksaan Inspektorat Kab.Malang Pada Kecamatan Ngantang Kab.Malng', '', 'D:\\Hasil Scan\\IMG_20140313_0005.jpg'),
(609, 398, 614, '539/816/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NPKND', '2014-03-03', '-', 'Evaluasi Laporan Keuangan Perusahaan Daerah Air Minum (PDAM) Kab.Malang Tahun 2013 ', '', 'D:\\Hasil Scan\\IMG_20140313_0003.jpg'),
(610, 81, 615, '090/262/421.301/2014', 'SATPOL PP & LINMAS', 'NPKND', '2014-03-03', '-', 'Konsep Naskah Surat Tugas', '', ''),
(611, 263, 616, '521/883/421.032/2014', 'BAGIAN TATA USAHA', 'NOTA DINAS', '2014-03-06', '-', 'Inventarisasi Undangan Pembukaan dan Penutupan PENAS Petani Nelayan XIV Tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140313_0018.jpg'),
(612, 263, 617, '521/152/421.032/2014', 'BAGIAN TATA USAHA', 'NPKND', '2014-03-06', '-', 'Inventarisasi Undangan Pembukaan dan Penutupan PENAS Petani Nelayan XIV Tahun 2014', '', ''),
(613, 70, 618, '065/882/421.034/2014', 'BAGIAN ORGANISASI', 'NOTA DINAS', '2014-03-06', '-', 'Pembuatan Makalah Inovasi Pelayanan Publik', '', 'D:\\Hasil Scan\\IMG_20140313_0019.jpg'),
(614, 81, 619, '090/880/421.052/2014', 'Staf Ahli Bupati', 'Surat Keluar', '2014-03-06', '-', 'Surat Tugas MENUGASKAN a.n NAZARUDIN', '', 'D:\\Hasil Scan\\IMG_20140313_0020.jpg'),
(615, 440, 620, '978.4/879/421.022/2014', 'BAGIAN KERJASAMA', 'NOTA DINAS', '2014-03-06', '-', 'Telaah Belanja Hibah Bidang Pendidikan Kepada 8 (Delapan) Kegiatan di Wilayah Kabupaten Malang Yang Dilaksanakan Oleh Perguruan Tinggi', '', 'D:\\Hasil Scan\\IMG_20140313_0001.jpg'),
(616, 440, 621, '119/878/421.022/2014', 'BAGIAN KERJASAMA', 'NOTA DINAS', '2014-03-06', '-', 'Laporan Hasil Monitoring Dan Evaluasi Pelaksanaan Kerjasama Tahun 2013', '', 'D:\\Hasil Scan\\IMG_20140313_0002.jpg'),
(617, 448, 622, '800/866/421.101/2014', 'DINAS PENDIDIKAN', 'surat Keluar', '2014-03-06', '-', 'Surat Tugas MENUGASKAN a.n BUDI ISWOYO', '', 'D:\\Hasil Scan\\IMG_20140313_0007.jpg'),
(618, 448, 623, '044/865/421.031/2014', 'BAGIAN UMUM & PROTOKOL', 'Surat Keluar', '2014-03-06', '-', 'Permohonan Izin Sub Bagian Protokol Bagian Umum dan Protokol setda Kabupaten Malang Untuk Melaksanakan Gathering ke Pulau Bali', '', 'D:\\Hasil Scan\\IMG_20140313_0010.jpg'),
(619, 448, 624, '541.3/2620/421.117/2014', 'DINAS ENERGI & SDM', 'Surat Keluar', '2014-03-06', '-', 'Pengiriman Pengesahan Penetapan Wilayah Pertembangan Rakyat (WPR) Kab.Malang', '', ''),
(620, 88, 625, '100/86/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NPKND', '2014-03-06', '-', 'Laporan Hasil Pelaksanaan Kegiatan Bina Desa (Bhakti Sosial Menata Desa) Bulan Februari 2014', '', ''),
(621, 88, 626, '100/857/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Surat Keluar', '2014-03-06', '-', 'Permohonan Ijin Bupati Malang Prov.Jatim', '', 'D:\\Hasil Scan\\IMG_20140313_0001.jpg'),
(622, 424, 627, '900/876/421.119/2014', 'DPPKA', 'Surat Keluar', '2014-03-06', '-', 'Surat Pernyataan Tanggung Jawab', '', 'D:\\Hasil Scan\\IMG_20140313_0003.jpg'),
(623, 88, 628, '100/860/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NPKND', '2014-03-06', '-', 'Permohonan Izin Bupati Malang', '', 'D:\\Hasil Scan\\IMG_20140313_0012.jpg'),
(624, 88, 629, '100/230/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Surat Keluar', '2014-03-06', '-', 'Permohonan Cuti Bupati Dalam Rangka Kampanye Pemilu Anggota DPR,DPD,dan DPRD Kab.Malang', '', ''),
(625, 88, 630, '539/839/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NOTA DINAS', '2014-03-06', '-', 'Materi/ Substansi Draff Peraturan Bupati Malang Tentang Pedoman Pengelolaan PDAM Kab.Malang', '', 'D:\\Hasil Scan\\IMG_20140313_0008.jpg'),
(626, 316, 631, '590/834/421.014/2014', 'BAGIAN PERTANAHAN', 'NOTA DINAS', '2014-03-06', '-', 'Penerbitan Keputusan Bupati Malang Tentang Tim Validasi Tanah Asset Daerah Kab.Malang', '', 'D:\\Hasil Scan\\IMG_20140313_0009.jpg'),
(627, 246, 632, '489/833/421.033/2014', 'BAGIAN HUMAS', 'Surat Keluar', '2014-03-06', '-', 'Permintaan Materi Talk Show', '', 'D:\\Hasil Scan\\IMG_20140313_0010.jpg'),
(628, 63, 633, '050/829/421.023/2014', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'NOTA DINAS', '2014-03-06', '-', 'Laporan Hasil Penilaian Performance / Kemampuan Kontraktor Kegiatan Fisik Tahun Anggaran 2013', '', 'D:\\Hasil Scan\\IMG_20140313_0012.jpg'),
(629, 448, 634, '800/827/421.207/2014', 'BADAN KETAHANAN PANGAN & PP', 'Surat Keluar', '2014-03-06', '-', 'Surat Perintah Tugas MENUGASKAN a.n MARHENDRAJAYA ', '', 'D:\\Hasil Scan\\IMG_20140313_0013.jpg'),
(630, 432, 635, '950/58/421.119/2014', 'DPPKA', 'NOTA DINAS', '2014-03-06', '-', 'Laporan Hasil Rapat Pembahasan Perkembangan Penyelesaian Tuntutan Perbendaharaan dan Tuntutan Ganti Rugi (TP - TGR) Oleh Tim Seketariat Majelis Pertimbangan TP - TGR', '', ''),
(631, 462, 636, '602.1/818/421.023/2014', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'Surat Keluar', '2014-03-06', '-', 'Klasifikasi dan Kualifikasi Usaha Jasa Konstruksi', '', 'D:\\Hasil Scan\\IMG_20140313_0001.jpg'),
(632, 448, 637, '800/837/421.041/2014', 'BAGIAN KESRA', 'NPKND', '2014-03-06', '-', 'Menghadiri Rapat Koordinasi Dalam Rangka Pelaksanaan Program Jmainan Kesehatan Nasional (JKN) Melalui  Badan Penyelenggara Jaminan Sosial (BPJS) Kesehatan di Jawa Timur Tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140313_0006.jpg'),
(633, 63, 638, '050/836/421.041/2014', 'BAGIAN KESRA', 'Surat Keluar', '2014-03-06', '-', 'Peserta Diklat Penyusunan Rencana Strategis (Renstra) SKPD Angkatan I Tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140313_0007.jpg'),
(634, 424, 639, '900/875/421.119/2014', 'DPPKA', 'Surat Keluar', '2014-03-06', '-', 'Surat Pernyataan Pertanggung Jawab ', '', 'D:\\Hasil Scan\\IMG_20140313_0004.jpg'),
(635, 448, 640, '800/886/421.109/2014', 'DINAS BINA MARGA', 'Surat Keluar', '2014-03-06', '-', 'Surat Perintah Tugas MEMERINTAHKAN a.n MOCHAMAD ANWAR', '', 'D:\\Hasil Scan\\IMG_20140313_0017.jpg'),
(636, 448, 641, '800/855/421.041/2014', 'BAGIAN KESRA', 'Surat Keluar', '2014-03-06', '-', 'Surat Perintah Tugas MENUGASKAN a.n TAUFIQ HIDAYAT', '', 'D:\\Hasil Scan\\IMG_20140313_0002.jpg'),
(637, 448, 642, '800/850/421.211/2014', 'BADAN PERPUS, ARSIP & DOKUMENTASI', 'Surat Keluar', '2014-03-06', '-', 'Surat Perintah MENUGASKAN a.n ENDANG RETNOWATI', '', 'D:\\Hasil Scan\\IMG_20140313_0005.jpg'),
(638, 448, 643, '800/854/421.211/2014', 'BADAN PERPUS, ARSIP & DOKUMENTASI', 'Surat Keluar', '2014-03-06', '-', 'Surat Perintah MEMERINTAHKAN a.n ENDANG RETNOWATI', '', 'D:\\Hasil Scan\\IMG_20140313_0003.jpg'),
(639, 101, 644, '141/916/421.012/2014', 'BAGIAN TATA PEMERINTAHAN DESA', 'NPKND', '2014-03-07', '-', 'Telaah Staf Terkait Bnatuan Keuangan Bagi Desa Penyelenggara Pemilihan Kepala Desa Tahun 2013', '', 'D:\\Hasil Scan\\IMG_20140313_0004.jpg'),
(640, 85, 645, '094/914/421.113/2014', 'DISPERINDAG & PASAR', 'Surat Keluar', '2014-03-07', '-', 'Surat Perintah Tugas MEMERINTAHKAN a.n HELIJANTI KOENTARI', '', 'D:\\Hasil Scan\\IMG_20140313_0006.jpg'),
(641, 85, 646, '539/910/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NOTA DINAS', '2014-03-07', '-', 'Telaah Terhadap Permohonan Persetujuan Ketua DPRD Melalui Pemerintah Kabupaten Malang Untuk Proses Kerjasama Pengelolaan Pemandian Air Panas Dan Hotel Songgoriti', '', 'D:\\Hasil Scan\\IMG_20140313_0008.jpg'),
(642, 85, 647, '539/909/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NPKND', '2014-03-07', '-', 'Telaah Terhadap Permohonan Persetujuan Ketua DPRD Melalui Pemerintah Kabupaten Malang Untuk Proses Kerjasama Pengelolaan Pemandian Air Panas dan Hotel Songgoriti', '', 'D:\\Hasil Scan\\IMG_20140313_0009.jpg'),
(643, 439, 648, '976/911/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NOTA DINAS', '2014-03-07', '-', 'Telaah Terhadap Permohonan Penjelasan Untuk Penentuan Lokasi Kegiatan DBHCHT Tahun Anggaran 2014', '', 'D:\\Hasil Scan\\IMG_20140313_0007.jpg'),
(644, 85, 649, '094/904/421.216/2014', 'BPBD', 'Surat Keluar', '2014-03-07', '-', 'Surat Tugas MENUGASKAN a.n HAFI LUTFI', '', 'D:\\Hasil Scan\\IMG_20140313_0010.jpg'),
(645, 316, 650, '590/867/421.014/2014', 'BAGIAN PERTANAHAN', 'NOTA DINAS', '2014-03-07', '-', 'Laporan Hasil Koordinasi Dan Konsultasi Persiapan Pelaksanaan Tata Batas Obyek Tukar Menukar Kawasan Hutan (TMKH) Ke Bali Pemantapan Kawasan Hutan Wilayah XI Jawa - Madura', '', 'D:\\Hasil Scan\\IMG_20140313_0006.jpg'),
(646, 85, 651, '094/128/421.216/2014', 'BPBD', 'Surat Keluar', '2014-03-07', '-', 'Permohona Ijin', '', ''),
(647, 88, 652, '100/873/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Surat Keluar', '2014-03-07', '-', 'Permohonan Izin Bupati Malang', '', 'D:\\Hasil Scan\\IMG_20140313_0005.jpg'),
(648, 88, 653, '044/866/421.031/2014', 'BAGIAN UMUM & PROTOKOL', 'Surat Keluar', '2014-03-07', '-', 'Permohonan Izin Sub Bagian Protokol Bagian Umum Dan Protokol Setda Kabupaten Malang Untuk Melaksanakan Gathering Ke Pulau Bali', '', 'D:\\Hasil Scan\\IMG_20140313_0008.jpg'),
(649, 88, 654, '044/865/421.031/2014', 'BAGIAN UMUM & PROTOKOL', 'NPKND', '2014-03-07', '-', 'Permohonan Izin Sub Bagian Protokol Bagian Umum Dan Protokol Setda Kabupaten Malang Unutuk Melaksanakan Gathering Ke Pulau Bali', '', ''),
(650, 85, 655, '094/902/421.206/2014', 'BADAN LH', 'Surat Keluar', '2014-03-07', '-', 'Surat Tugas MENUGASKAN a.n TRIDIYAH MAISTUTI', '', 'D:\\Hasil Scan\\IMG_20140313_0012.jpg'),
(651, 448, 656, '800/903/421.210/2014', 'BADAN KELUARGA BERENCANA', 'Surat Keluar', '2014-03-07', '-', 'Surat Tugas MENUGASKAN a.n HADI PUSPITA', '', 'D:\\Hasil Scan\\IMG_20140313_0011.jpg'),
(652, 88, 657, '100/896/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NOTA DINAS', '2014-03-07', '-', 'Penerimaan Kunjungan Kerja Pemerintah Kabupaten Jembrana Provinsi Bali Ke Pemerintah Kab.Malang', '', 'D:\\Hasil Scan\\IMG_20140313_0014.jpg'),
(653, 88, 658, '100/888/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NOTA DINAS', '2014-03-07', '-', 'Rapat Koordinasi Pembentukan Tim Desk Pemilihan Umum Anggota Dewan Perwakilan Rakyat ,DPD,Dan DPRD Tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140313_0016.jpg'),
(654, 154, 659, '360/800/421.216/2014', '216', 'Surat Keluar', '2014-03-07', '-', 'Menyatakan Bahwa Telah Terjadi Bencana Erupsi Gunung Kelud Dan Lahar Hujan Di Wilayah Kabupaten Malang Tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140313_0006.jpg'),
(655, 206, 660, '451/1266/421.042/2014', 'Bagian Bintal', 'NOTA DINAS', '2014-03-11', '-', 'Telaah Belanja Hibah Pada 25 Masjid Tahab I di Wilayah Kabupaten Malang Tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140313_0002.jpg'),
(656, 206, 661, '451/1265/421.042/2014', 'Bagian Bintal', 'NPKND', '2014-03-11', '-', 'Telaah Belanja Hibah 25 Masjid Tahab I di Wilayah Kabupaten Malang Tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140313_0003.jpg'),
(657, 206, 662, '451/1256/421.042/2014', 'Bagian Bintal', 'NOTA DINAS', '2014-03-11', '-', 'Telaah Belanja Hibah Pada 33 Tempat Ibadah Yang Terkena Erupsi Gunung Kelud di Kecamatan Ngantang dan Kecamatan KKasembon Kabupaten Malang Tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140313_0004.jpg'),
(658, 206, 663, '451/1255/421.042/2014', 'Bagian Bintal', 'NPKND', '2014-03-11', '-', 'Telaah Belanja Hibah Pada 33 Tempat Ibadah Yang Terkena Eruupsi Gunung Kelud Di kecamatan Ngantang Dan Kasembon Kabupaten Malang Tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140313_0005.jpg'),
(659, 206, 664, '451/1254/421.042/2014', 'Bagian Bintal', 'NOTA DINAS', '2014-03-11', '-', 'Telaah Permohonan Bantuan Dana Untuk Kegiatan Keagamaan Tahab II', '', 'D:\\Hasil Scan\\IMG_20140313_0006.jpg'),
(660, 206, 665, '451/1253/421.042/2014', 'Bagian Bintal', 'NPKND', '2014-03-11', '-', 'Telaah Permohonan Bantuan  Dana Untuk Kegiatan Keagamaan Tahab II', '', 'D:\\Hasil Scan\\IMG_20140313_0007.jpg'),
(661, 206, 666, '451/1252/421.042/12//2014', 'Bagian Bintal', 'NOTA DINAS', '2014-03-11', '-', 'Telaah Permohonan Bnatuuan Dana Untuk Kegiatan Keagamaan Tahab I', '', 'D:\\Hasil Scan\\IMG_20140313_0008.jpg'),
(662, 206, 667, '451/1251/421.042/2014', 'Bagian Bintal', 'NPKND', '2014-03-11', '-', 'Telaah Permohonan  Bantuan Dana Untuk Kegiatan Dan Keagamaan Tahab I', '', 'D:\\Hasil Scan\\IMG_20140313_0009.jpg'),
(663, 88, 668, '100/1248/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NOTA DDINAS', '2014-03-11', '-', 'Penerimaan Kunjungan Kerja Kabupaten Lombok Barat Provinsi Nusa Tenggara Barat Ke Pemerintah Kab.Malang', '', 'D:\\Hasil Scan\\IMG_20140313_0010.jpg'),
(664, 88, 669, '913/1234/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NOTA DINAS', '2014-03-11', '-', 'Telaah Terhadap P ermohonan Bantuan dan Tambahan Anggaran Belanja Untuk Pekan Dan Pelayan Kesehatan Ternak Sapi Akibat Erupsi Gunung Kelud', '', 'D:\\Hasil Scan\\IMG_20140313_0001.jpg'),
(665, 439, 670, '976/1236/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NOTA DINAS', '2014-03-11', '-', 'Telaah Terhadap Perubahan Lokasi Rehabilitas Puskesmas Akibat Erupsi Gunung Kelud Dengan Sumber Dana Bagi Hasil Cukai Hasil Tembakau (DBHCHT) Tahun Anggaran 2014', '', 'D:\\Hasil Scan\\IMG_20140313_0010.jpg'),
(666, 297, 671, '556/1230/421.108/2014', 'DINAS KEBUDAYAAN & PARIWISATA', 'Surat Keluar', '2014-03-11', '-', 'Mohon Dukungan Polling Sms Duta Wisata Raka - Raki Jatim Tahun Anggaran 2014', '', 'D:\\Hasil Scan\\IMG_20140313_0005.jpg'),
(667, 448, 672, '800/1231/421.103/2014', 'DINAS KESEHATAN', 'Surat Keluar', '2014-03-11', '-', 'Surat Tugas MENUGASKAN a.n MURSYIDAH', '', 'D:\\Hasil Scan\\IMG_20140313_0004.jpg'),
(668, 85, 673, '094/1229/421.209/2014', 'BANDIKLAT', 'Surat Keluar', '2014-03-11', '-', 'Surat Tugas MENUGASKAN a.n HOLIDIN', '', 'D:\\Hasil Scan\\IMG_20140313_0006.jpg'),
(669, 85, 674, '094/1232/421.051/2014', 'SEKRETARIAT DPRD', 'Surat Keluar', '2014-03-11', '-', 'Surat Tugas MENUGASKAN a.n NURCAHYO', '', 'D:\\Hasil Scan\\IMG_20140313_0003.jpg'),
(670, 85, 675, '411.82/1228.213/2014', 'INSPEKTORAT', 'Surat Keluar', '2014-03-11', '-', 'Bantuan KIE/ Poster', '', 'D:\\Hasil Scan\\IMG_20140313_0002.jpg'),
(671, 448, 676, '800/1227/421.041/2014', 'BAGIAN KESRA', 'NPKND', '2014-03-11', '-', 'Mengikuti Diklat Penyusunan Rencana Strategis (Renstra) SKPD Angkatan I Tahun 2014 Selam 5 (lima) Hari Kerja. ', '', 'D:\\Hasil Scan\\IMG_20140313_0003.jpg'),
(672, 448, 677, '1225/421.023/2014', 'INSPEKTORAT', 'Surat Keluar', '2014-03-11', '-', 'Evaluasi Dan Maukan Terhadap Peraturan Bupati Nomor 30 Tahun 2013', '', ''),
(673, 33, 678, '500/1212/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Surat Pengantar', '2014-03-11', '-', 'Surat Keputusan Bupati Malang Nomor : 188.45/153/KEP/421.013/2014 Tentang Tim Monitoring dan Evaluasi Pelaksanaan Sistem Distribusi Tertutup.', '', 'D:\\Hasil Scan\\IMG_20140313_0005.jpg'),
(674, 33, 679, '55/1211/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Surat Keluar', '2014-03-11', '-', 'Pembentukan Tim Pengendalian Inflasi Daerah \r\n(TPID)', '', ''),
(675, 33, 680, '361/1208/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NPKND', '2014-03-11', '-', 'Perlakuan Khusus Bagi Debitur Korban Bencana Erupsi Gunung Kelud', '', 'D:\\Hasil Scan\\IMG_20140313_0007.jpg'),
(676, 35, 681, '800/1201/421.023/2014', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'Nota Dinas', '2014-03-11', '-', 'Telaah Staf Terhadap Pelaksanaan Penyesuaian (Inpassing) Jabatan Fungsional Pengelola Pengadaan Barang/Jasa', '', 'D:\\Hasil Scan\\IMG_20140313_0008.jpg'),
(677, 34, 682, '119/920/421.022/2014', 'BAGIAN KERJASAMA', 'Nota Dinas', '2014-03-11', '-', 'Laporan Rencana Penandatanganan Kesepakatan Bersama Antara Pemerintah Kab.Malang Dengan PT. Telekomunikasi Indonesia ,Tbk .', '', 'D:\\Hasil Scan\\IMG_20140313_0001.jpg'),
(678, 23, 683, '100/919/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NPKND', '2014-03-11', '-', 'Pelaksanaan Kerjasama Swakelola', '', 'D:\\Hasil Scan\\IMG_20140313_0002.jpg'),
(679, 35, 684, '602/918/421.023/2014', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'Surat Keluar', '2014-03-11', '-', 'Rencana Umum Pengadaan Barang/Jasa Tahun 2014', '', ''),
(680, 154, 685, '360/915/421.111/2014', 'DINAS CIPTA KARYA & TATA RUANG', 'Surat Keluar', '2014-03-11', '-', 'Dukungan Sarana Keciptakaryaan Untuk Penanggulangan Tanggap Darurat Bencana Erupsi Gunung Kelud Di Kab.Malang', '', 'D:\\Hasil Scan\\IMG_20140313_0005.jpg'),
(681, 96, 686, '136/921/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Nota Dinas ', '2014-03-11', '-', 'Pelaksanaan Kerjasama Swakelola', '', 'D:\\Hasil Scan\\IMG_20140313_0010.jpg'),
(682, 85, 687, '094/1198/421.032/2014', 'BAGIAN TATA USAHA', 'Nota Dinas', '2014-03-11', '-', 'Permohonan Ijin Menghadiri Rapat Koordinasi Nasional Penanggulangan Bencana Tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140313_0009.jpg'),
(683, 316, 688, '590/895/421.014/2014', 'BAGIAN PERTANAHAN', 'Surat Keluar', '2014-03-11', '-', 'Pelaksanaan Tata Batas Obyek Tukar Menukar Kawasan Hutan', '', 'D:\\Hasil Scan\\IMG_20140313_0015.jpg'),
(684, 424, 689, '900/765/421.119/2014', 'DPPKA', 'Surat Keluar', '2014-03-11', '-', 'Surat Pernyataan Tanggung Jawab', '', 'D:\\Hasil Scan\\IMG_20140313_0026.jpg'),
(685, 424, 690, '900/856/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Surat Keluar', '2014-03-11', '-', 'Produk Asuransi Jiwa Bersama (AJB) Bumiputera 1912', '', 'D:\\Hasil Scan\\IMG_20140313_0013.jpg'),
(686, 154, 691, '360/915/421.111/2014', 'DINAS CIPTA KARYA & TATA RUANG', 'Surat Keluar', '2014-03-11', '-', 'Dukungan Sarana Keciptakaryaan Untuk Penanggulangan Tanggap Darurat Bencana Erupsi Gunung Kelud Di Kab.Malang', '', ''),
(687, 427, 692, '903/1268/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Surat Keluar', '2014-03-11', '-', 'Informasi Perda Kab.Malang Tentang APBD Tahun Anggaran 2014', '', 'D:\\Hasil Scan\\IMG_20140313_0001.jpg'),
(688, 154, 693, '360/798/421.216/2014', 'BPBD', 'Surat Keluar', '2014-03-11', '-', 'Permohonan Dana Siap Pakai', '', 'D:\\Hasil Scan\\IMG_20140313_0008.jpg'),
(689, 40, 694, '028/1233/421.119/2014', 'DPPKA', 'Surat Keluar', '2014-03-11', '-', 'Surat Perjanjian Pinjam Pakai Kendaraan Dinas Bermotor Roda 4 ( Empat ) a.n Dr.Abdul Malik dan Edward Harris Sinaga', '', 'D:\\Hasil Scan\\IMG_20140313_0002.jpg'),
(690, 40, 695, '028/1237/421.119/2014', 'DPPKA', 'Surat Keluar', '2014-03-11', '-', 'Surat Perjanjian Pinjam Pakai Kendaraan Dinas Bermotor Roda 4 ( Empat ) ', '', 'D:\\Hasil Scan\\IMG_20140313_0009.jpg'),
(691, 40, 696, '028/1238/421.119/2014', 'DPPKA', 'Surat Keluar ', '2014-03-11', '-', 'Surat Perjanjian Pinjam Pakai Kendaraan Dinas Bermotor Roda 4 ( Empat ) a.n Abdul Malik dan Reky .s.e lumentut', '', 'D:\\Hasil Scan\\IMG_20140313_0008.jpg'),
(692, 40, 697, '028/1239/421.119/2014', 'DPPKA', 'Surat Keluar', '2014-03-11', '-', 'Surat Perjanjian Pinjam Kendaraan Dinas Bermotor Roda 4 ( Empat ) ', '', 'D:\\Hasil Scan\\IMG_20140313_0007.jpg'),
(693, 40, 698, '028/1240/421.119/2014', 'DPPKA', 'Surat Keluar', '2014-03-11', '-', 'Surat Perjanjian Pinjam Pakai Kendaraan Dinas Bermotor Roda 4 ( Empat ) ', '', 'D:\\Hasil Scan\\IMG_20140313_0006.jpg'),
(694, 40, 699, '028/1241/421.119/2014', 'DPPKA', 'Surat Keluar ', '2014-03-11', '-', 'Surat Perjanjian Pinjam Pakai Kendaraan Dinas Bermotor Roda 4 Milik Pemkab. Malang ', '', 'D:\\Hasil Scan\\IMG_20140313_0005.jpg'),
(695, 40, 700, '028/1242/421.119/2014', 'DPPKA', 'Surat Keluar ', '2014-03-11', '-', 'Surat Perjanjian Pinjam Pakai Kendaraan Dinas Bermotor Roda 4 Milik Pemkab. Malang ', '', 'D:\\Hasil Scan\\IMG_20140313_0004.jpg'),
(696, 40, 701, '028/1243/421.119/2014', 'DPPKA', 'Surat Keluar ', '2014-03-11', '-', 'Surat Perjanjian Pinjam Pakai Kendaraan Dinas Bermotor Roda 4 Milik Pemkab. Malang ', '', 'D:\\Hasil Scan\\IMG_20140313_0003.jpg'),
(697, 40, 702, '028/1244/421.119/2014', 'DPPKA', 'Surat Keluar ', '2014-03-11', '-', 'Surat Perjanjian Pinjam Pakai Kendaraan Dinas Bermotor Roda 4 Milik Pemkab. Malang ', '', 'D:\\Hasil Scan\\IMG_20140313_0002.jpg'),
(698, 40, 703, '028/1245/421.119/2014', 'DPPKA', 'Surat Keluar ', '2014-03-11', '-', 'Surat Perjanjian Pinjam Pakai Kendaraan Dinas Bermotor Roda 4 Milik Pemkab. Malang ', '', 'D:\\Hasil Scan\\IMG_20140313_0001.jpg'),
(699, 40, 704, '614/1246/421.110/2014', 'DINAS PENGAIRAN', 'Surat Keluar ', '2014-03-11', '-', 'Usulan Pembangunan Sabo Dam Pengendali Lahar Gunung Kelud di Kabupaten Malang ', '', 'D:\\Hasil Scan\\IMG_20140313_0001.jpg'),
(700, 40, 705, '913/1234/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Nota Dinas ', '2014-03-11', '-', 'Telaah Terhadap Permohonan Bantuan dan Tambahan Anggaran Belanja untuk Pakan dan Pelayanan Kesehatan Ternak Sapi  Akibat Erupsi Gunung Kelud ', '', ''),
(701, 40, 706, '360/799/421.216/2014', 'BPBD', 'Surat Keluar ', '2014-03-11', '-', 'Permohonan Dana Rehabilitasi dan Rekonstruksi ', '', 'D:\\Hasil Scan\\IMG_20140313_0007.jpg'),
(702, 448, 707, '800/901/421.217/2014', 'RSUD Lawang ', 'Surat Keluar ', '2014-03-11', '-', 'Surat Tugas', '', 'D:\\Hasil Scan\\IMG_20140313_0013.jpg'),
(703, 154, 708, '360/853/421.216/2014', 'BPBD ', 'Surat Keluar ', '2014-03-11', '-', 'Permohonan dana Tanggap Darurat Erupsi Gunung Kelud', '', 'D:\\Hasil Scan\\IMG_20140313_0004.jpg'),
(704, 81, 709, '090/811/421.301/2014', 'SATPOL PP & LINMAS', 'Surat Keluar ', '2014-03-11', '-', 'Surat Tugas ', '', 'D:\\Hasil Scan\\IMG_20140313_0004.jpg'),
(705, 81, 710, '539/817/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Nota Dinas', '2014-03-11', '-', 'Evaluasi Laporan Keuangan Perusahaan Daerah Air Minum (PDAM) Kab upaten Malang Tahun 2013', '', 'D:\\Hasil Scan\\IMG_20140313_0002.jpg'),
(706, 13, 711, '003/825/421.032/2014', 'BAGIAN TATA USAHA', 'Surat Keluar ', '2014-03-11', '-', 'Surat Pengantar tentang Pelaksanaan dan Panitia Pelaksana Pekan Nasional ', '', 'D:\\Hasil Scan\\IMG_20140313_0014.jpg'),
(707, 13, 712, '822.4/785/421.202/2014', 'BKD', 'Surat Keluar ', '2014-03-11', '-', 'Kenaikan Gaji Berkala ', '', 'D:\\Hasil Scan\\IMG_20140313_0020.jpg'),
(708, 13, 713, '822.4/786/421.202/2014', 'BKD', 'Surat Keluar ', '2014-03-11', '-', 'Kenaikan Gaji Berkala ', '', 'D:\\Hasil Scan\\IMG_20140313_0019.jpg'),
(709, 13, 714, '822.4/787/421.202/2014', 'BKD', 'Surat Keluar ', '2014-03-11', '-', 'Kenaikan Gaji Berkala ', '', 'D:\\Hasil Scan\\IMG_20140313_0018.jpg'),
(710, 13, 715, '822.4/788/421.202/2014', 'BKD', 'Surat Keluar ', '2014-03-11', '-', 'Kenaikan Gaji Berkala ', '', 'D:\\Hasil Scan\\IMG_20140313_0017.jpg'),
(711, 13, 716, '822.4/789/421.202/2014', 'BKD', 'Surat Keluar ', '2014-03-11', '-', 'Kenaikan Gaji Berkala ', '', 'D:\\Hasil Scan\\IMG_20140313_0016.jpg'),
(712, 13, 717, '822.3/790/421.202/2014', 'BKD', 'Surat Keluar ', '2014-03-11', '-', 'Kenaikan Gaji Berkala ', '', 'D:\\Hasil Scan\\IMG_20140313_0015.jpg'),
(713, 13, 718, '822.4/791/421.202/2014', 'BKD', 'Surat Keluar ', '2014-03-11', '-', 'Kenaikan Gaji Berkala ', '', 'D:\\Hasil Scan\\IMG_20140313_0014.jpg'),
(714, 13, 719, '822.4/792/421.202/2014', 'BKD', 'Surat Keluar ', '2014-03-11', '-', 'Kenaikan Gaji Berkala ', '', 'D:\\Hasil Scan\\IMG_20140313_0013.jpg'),
(715, 13, 720, '822.4/793/421.202/2014', 'BKD', 'Surat Keluar ', '2014-03-11', '-', 'Kenaikan Gaji Berkala ', '', 'D:\\Hasil Scan\\IMG_20140313_0012.jpg'),
(716, 13, 721, '822.4/794/421.202/2014', 'BKD', 'Surat Keluar ', '2014-03-11', '-', 'Kenaikan Gaji Berkala ', '', 'D:\\Hasil Scan\\IMG_20140313_0011.jpg'),
(717, 13, 722, '822.4/795/421.202/2014', 'BKD', 'Surat Keluar ', '2014-03-11', '-', 'Kenaikan Gaji Berkala ', '', 'D:\\Hasil Scan\\IMG_20140313_0010.jpg'),
(718, 13, 723, '822.4/796/421.202/2014', 'BKD', 'Surat Keluar ', '2014-03-11', '-', 'Kenaikan Gaji Berkala ', '', 'D:\\Hasil Scan\\IMG_20140313_0009.jpg'),
(719, 448, 724, '800/780/421.202/2014', 'BKD', 'Surat Keluar ', '2014-03-11', '-', 'Penyampaian Berkas Pemberhentian dengan hormat sebagai PNS dengan Hak Pensiun atas Permintaan Sendiri ', '', 'D:\\Hasil Scan\\IMG_20140313_0025.jpg'),
(720, 401, 725, '854/783/421.202/2014', 'BKD', 'Surat Keluar ', '2014-03-11', '-', 'Surat Ijin Cuti Bersalin ', '', 'D:\\Hasil Scan\\IMG_20140313_0022.jpg'),
(721, 401, 726, '854/784/421.202/2014', 'BKD', 'Surat Keluar ', '2014-03-11', '-', 'Surat Ijin Cuti Bersalin ', '', 'D:\\Hasil Scan\\IMG_20140313_0021.jpg'),
(722, 398, 727, '851/781/421.202/2014', 'BKD', 'Surat Keluar ', '2014-03-11', '-', 'Surat Ijin Tahunan ', '', 'D:\\Hasil Scan\\IMG_20140313_0024.jpg'),
(723, 398, 728, '851/782/421.202/2014', 'BKD', 'Surat Keluar ', '2014-03-11', '-', 'Surat ijin Cuti Tahunan ', '', 'D:\\Hasil Scan\\IMG_20140313_0023.jpg'),
(724, 424, 729, '900/1225/421.023/2014', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'Surat Keluar ', '2014-03-13', '-', 'Evaluasi dan Masukan Terhadap Perbup Nomor 30 Tahun 2013', '', 'D:\\Hasil Scan\\IMG_20140313_0004.jpg'),
(725, 247, 730, '500/1211/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Surat Keluar', '2014-03-13', '-', 'Pembentukan Tim Pengendalian Inflasi \r\nDaerah (TPID)', '', 'D:\\Hasil Scan\\IMG_20140328_0045.jpg');
INSERT INTO `surat_keluar` (`id`, `index_surat_id`, `no_urut`, `no_surat`, `pengolah`, `tujuan`, `tanggal_surat`, `lampiran`, `perihal`, `catatan`, `file_surat`) VALUES
(726, 462, 731, '602.1/918/421.023/2014', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'Surat Keluar ', '2014-03-13', '-', 'Rencana Umum Pengadaan Barang/Jasa Tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140313_0003.jpg'),
(727, 88, 732, '100/861/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Nota Dinas ', '2014-03-13', '-', 'Laporan Hasil Pelaksanaan Kegiatan Bina Desa ', '', 'D:\\Hasil Scan\\IMG_20140313_0011.jpg'),
(728, 88, 733, '100/830/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Surat Keluar', '2014-03-13', '-', 'Permohonan Cuti Bupati Malang dalam Rangka Kampanye Pemilu Anggota DPR, DPD, dan DPRD Kabupaten Malang ', '', 'D:\\Hasil Scan\\IMG_20140313_0011.jpg'),
(729, 36, 734, '024/1411/421.032/2014', 'BAGIAN TATA USAHA', 'NPKND', '2014-03-18', '-', 'Permohonan Pinjam Pakai Kendaraan Dinas Staf Ahli Bupati Malang', '', 'D:\\Hasil Scan\\IMG_20140318_0001.jpg'),
(730, 424, 735, '900/1409/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NPKND', '2014-03-18', '-', 'Telaah atas Penawaran Produk dan Kerjasama dari PT.Bank Indonesia (Persero) Tbk. Cabang Kepanjen', '', 'D:\\Hasil Scan\\IMG_20140318_0002.jpg'),
(731, 247, 736, '500/1408/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NPKND', '2014-03-18', '-', 'Surat Tugas Mengikuti Rapat Koordinasi kegiatan Implementasi Good Corporate Governance (GCG) dab Pemantapan Budaya Kerja BUMD ', '', 'D:\\Hasil Scan\\IMG_20140318_0001.jpg'),
(732, 85, 737, '094/1403/421.032/2014', 'BAGIAN TATA USAHA', 'NOTA DINAS', '2014-03-18', '-', 'Permohonan Ijin  Menhadiri Rapat Koordinasi Kementrian Perumahan Rakyat (RAKORPERA) Tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140318_0003.jpg'),
(733, 22, 738, '010/1399/421.023/2014', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'NPKND', '2014-03-18', '-', 'Penyampaian Surat Keputusan Bupati Malang Nomor: 188.45/89/KEP/421.013/2014 Tentang Verifikator Tekhnis Belanja Hibah,Belanja Bantuan Sosial Tahun Anggaran 2014', '', 'D:\\Hasil Scan\\IMG_20140318_0004.jpg'),
(734, 470, 739, '005/1396/421.032/2014', 'BAGIAN TATA USAHA', 'Surat Keluar', '2014-03-18', '-', 'UNDANGAN', '', 'D:\\Hasil Scan\\IMG_20140318_0005.jpg'),
(735, 470, 740, '094/1395/421.022/2014', 'BAGIAN KERJASAMA', 'Surat Keluar', '2014-03-18', '-', 'Surat Tugas MENUGASKAN a.n ABDUL HARIS', '', 'D:\\Hasil Scan\\IMG_20140328_0043.jpg'),
(736, 193, 741, '440/1392/421.041/2014', 'BAGIAN KESRA', 'NOTA DINAS', '2014-03-18', '-', 'Pelaksanaan Kegiatan Sosialisasi HIV/AIDS di Wilayah Kab.Malang', '', 'D:\\Hasil Scan\\IMG_20140318_0007.jpg'),
(737, 22, 742, '010/1390/421.023/2014', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'NPKND', '2014-03-18', '-', 'Laporan Koordinasi Sharing Program Kegiatan Penanggulangan Bencana Alam', '', 'D:\\Hasil Scan\\IMG_20140318_0008.jpg'),
(738, 22, 743, '010/1389/421.023/2014', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'NPKND', '2014-03-18', '-', 'Laporan Rapat Koordinasi Pengembangan Perumahan PT UNICORA AGUNG Desa Ngijo Kec.Karangploso', '', 'D:\\Hasil Scan\\IMG_20140318_0009.jpg'),
(739, 65, 744, '060/1388/421.034/2014', 'BAGIAN ORGANISASI', 'NOTA DINAS', '2014-03-18', '-', 'Penetapan / Peningkatan Kelas C Rumah Sakit Umum Daerah Lawang', '', 'D:\\Hasil Scan\\IMG_20140318_0010.jpg'),
(740, 167, 745, '400/1387/421.041/2014', 'BAGIAN KESRA', 'NPKND', '2014-03-18', '-', 'Pelaksanaan Kegiatan Sosialisasi HIV/AIDS di Wilayah Kab.Malang', '', 'D:\\Hasil Scan\\IMG_20140318_0011.jpg'),
(741, 85, 746, '094/1386/421.032/2014', 'BAGIAN TATA USAHA', 'NPKND', '2014-03-18', '-', 'Menhadiri Rapat Koordinasi Nasional Penanggulangan Bencana Tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140318_0012.jpg'),
(742, 52, 747, '045/1384/421.211/2014', 'BADAN PERPUS, ARSIP & DOKUMENTASI', 'Surat Keluar', '2014-03-18', '-', 'Permohonan Bantuan Kendaraan Sadar Arsip Dalam Menunjang Program Arsip Masuk Desa (AMD) di Wilayh Kab.Malang', '', 'D:\\Hasil Scan\\IMG_20140318_0013.jpg'),
(743, 85, 748, '094/1383/421.112/2014', 'DINAS KOPERASI & UMKM', 'Surat Keluar', '2014-03-18', '-', 'Surat Tugas MENUGASKAN a.n SUKOWIYONO ', '', 'D:\\Hasil Scan\\IMG_20140318_0014.jpg'),
(744, 85, 749, '094/1382/421.112/2014', 'DINAS KOPERASI & UMKM', 'Surat Keluar', '2014-03-18', '-', 'Surat Tugas MENUGASKAN a.n SUKOWIYONO', '', 'D:\\Hasil Scan\\IMG_20140318_0015.jpg'),
(745, 85, 750, '552.4/1381/421.111/2014', 'DINAS CIPTA KARYA & TATA RUANG', 'Surat Keluar', '2014-03-18', '-', 'Lokasi Taman Untuk Program Pengembangan Kota Hijau (P2KH) 2014', '', 'D:\\Hasil Scan\\IMG_20140318_0016.jpg'),
(746, 85, 751, '119/1380/421.022/2014', 'BAGIAN KERJASAMA', 'NOTA DINAS', '2014-03-18', '-', 'Laporan Rencana Pendatanganan kesepakatan Bersama Antar Pemerintah Kabupaten Malang Dengan PT. Telekomunikasi Indonesia,Tbk.', '', 'D:\\Hasil Scan\\IMG_20140318_0017.jpg'),
(747, 206, 752, '451/1378/421.042/2014', 'BAGIAN BINTAL', 'NPKND', '2014-03-18', '-', 'Telaah Belanja Bantuan Keuangan Kepada 10 Tempat Ibadah Tahap I di Wilayah Kab.Malang Tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140318_0018.jpg'),
(748, 206, 753, '451/1377/421.042/2014', 'BAGIAN BINTAL', 'NPKND', '2014-03-18', '-', 'Telaah Belanja Bantuan  Keuangan Kepada 20 Pondok Pesantren Tahap I di wilayah Kab.Malang Tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140318_0019.jpg'),
(749, 206, 754, '451/1376/421.042/2014', 'BAGIAN BINTAL', 'NPKND', '2014-03-18', '-', 'Telaah Belanja Hibah Kepada 25 Musholla/Langgar Tahap I di wilayah Kab.Malang Tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140318_0020.jpg'),
(750, 296, 755, '555/1375/421.024/2014', 'BAGIAN PDE', 'NPKND', '2014-03-18', '-', 'Nota Dinas Permohonan Tanda Tangan Pada Angket Potret Digitalisasi Dalam Rangka Indonesia Digital Society Award (IDSA) Tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140318_0021.jpg'),
(751, 470, 756, '005/1373/421.032/2014', 'BAGIAN TATA USAHA', 'Surat Keluar', '2014-03-18', '-', 'UNDANGAN', '', 'D:\\Hasil Scan\\IMG_20140318_0022.jpg'),
(752, 278, 757, '525.24/1371/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NOTA DINAS', '2014-03-18', '-', 'Telaah Terhadap Permohonan Kelengkapan Persyaratan Rekomendasi Teknis Dalam Rangka Penanaman Modal di bidang Usaha Perkebunan Dari PT.Duta Plantatioon Nusantara Kepada Pemerintah Kab.Malang', '', 'D:\\Hasil Scan\\IMG_20140318_0023.jpg'),
(753, 246, 758, '489/1363/421.033/2014', 'BAGIAN HUMAS', 'Surat Keluar', '2014-03-18', '-', 'Permintaan Materi Talk Show', '', 'D:\\Hasil Scan\\IMG_20140318_0024.jpg'),
(754, 246, 759, '100/1361/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NPKND', '2014-03-18', '-', 'Revisi Permohonan Cuti Bupati Dalam Rangka Kampanye Pemilu Anggota DPR,DPD,Dan DPRD Kab.Malang', '', 'D:\\Hasil Scan\\IMG_20140318_0026.jpg'),
(755, 88, 760, '100/1361/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NPKND', '2014-03-18', '-', 'Revisi Permohonan Cuti Bupati Dalam Rangka Kampanye Pemilu Anggota DPR,DPD,Dan DPRD Kab.Malang', '', ''),
(756, 193, 761, '440/1360/421.031/2014', 'BAGIAN UMUM & PROTOKOL', 'Surat Keluar', '2014-03-18', '-', 'Permohonan Pinjam Pakai Kendaraan', '', 'D:\\Hasil Scan\\IMG_20140318_0027.jpg'),
(757, 296, 762, '555/1359/421.024/2014', 'BAGIAN PDE', 'NPKND', '2014-03-18', '-', 'Surat Pengembangan  SIM atau Aplikasi', '', 'D:\\Hasil Scan\\IMG_20140328_0044.jpg'),
(758, 169, 763, '410/1358/421.032/2014', 'BAGIAN TATA USAHA', 'NOTA DINAS', '2014-03-18', '-', 'Mitra Percepatan Pembangunan Desa', '', 'D:\\Hasil Scan\\IMG_20140318_0029.jpg'),
(759, 316, 764, '590/1355/421.014/2014', 'BAGIAN PERTANAHAN', 'NOTA DINAS', '2014-03-18', '-', 'Mohon Ijin Mengikuti Diklat Penaganan Konflik Pertanahan Bagi Pejabat Strategis', '', 'D:\\Hasil Scan\\IMG_20140318_0030.jpg'),
(760, 448, 765, '800/1354/421.215/2014', 'RSUD KANJURUHAN', 'Surat Keluar', '2014-03-18', '-', 'Surat Tugas MEMERINTAHKAN a.n HARRY HARTANTO', '', 'D:\\Hasil Scan\\IMG_20140318_0031.jpg'),
(761, 448, 766, '800/1353/421.204/2014', 'BALITBANG', 'Surat Keluar', '2014-03-18', '-', 'Surat Tugas MENUGASKAN a.n KHOIRUL FATHONI', '', 'D:\\Hasil Scan\\IMG_20140318_0032.jpg'),
(762, 40, 767, '028/1352/421.119/2014', 'DPPKA', 'Surat Keluar', '2014-03-18', '-', 'Rencana Tahunan Barang dan Rencana Tahunan Pemeliharaan Barang Tahunan Anggaran 2014', '', 'D:\\Hasil Scan\\IMG_20140318_0033.jpg'),
(763, 436, 768, '973/1351/421.119/2014', 'DPPKA', 'Surat Keluar', '2014-03-18', '-', 'Usulan Nama Petugas Khusus PBB Tingkat Kecamatan Tahun Anggaran 2014', '', 'D:\\Hasil Scan\\IMG_20140318_0034.jpg'),
(764, 85, 769, '094/1349/421.032/2014', 'BAGIAN TATA USAHA', 'Surat Keluar', '2014-03-18', '-', 'Surat Tugas MEMERINTAHKAN a.n BAMBANG SUMANTRI', '', 'D:\\Hasil Scan\\IMG_20140318_0035.jpg'),
(765, 247, 770, '500/1347/421.021/2013', 'BAGIAN PEREKONOMIAN', 'NOTA DINAS', '2014-03-18', '-', 'Laporan Mengikuti Rapat Koordinasi Bidang Perekonomian Provinsi Seluruh Indonesia Dengan Tema Peningkatan Ketahanan Ekonomi Nasional Yang Tangguh dan Berkelanjutan Berbasis Ekonomi Provinsi', '', 'D:\\Hasil Scan\\IMG_20140319_0007.jpg'),
(766, 247, 771, '905/1362/421.119/2014', 'DPPKA', 'Surat Keluar ', '2014-03-18', '-', 'Surat Pernyataan Penyediaan Dana Pendamping ', '', 'D:\\Hasil Scan\\IMG_20140318_0025.jpg'),
(767, 470, 772, '005/1420/421.032/2014', 'BAGIAN TATA USAHA', 'Surat Keluar', '2014-03-18', '-', 'UNDANGAN', '', 'D:\\Hasil Scan\\IMG_20140319_0001.jpg'),
(768, 436, 773, '973/1419/421.119/2014', 'DPPKA', 'Surat Keluar', '2014-03-18', '-', 'Pembayaran PBB Tahun 2014 Bagi PNS dan Perangkat Desa', '', 'D:\\Hasil Scan\\IMG_20140319_0002.jpg'),
(769, 448, 774, '800/1418/421.041/2014', 'BAGIAN KESRA', 'NPKND', '2014-03-18', '-', 'Mengikuti Rapat Kerja Usaha Kesehatan Sekolah Yang Dilaksanakan Pada Hari Selasa - Kamis Tanggal 18 - 20 Maret 2014', '', 'D:\\Hasil Scan\\IMG_20140319_0003.jpg'),
(770, 88, 775, '100/1417/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NPKND', '2014-03-18', '-', 'Rapat Koordinasi Pelaksanaan Pemilihan Umum Anggota DPR,DPD,Dan DPRD Tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140319_0004.jpg'),
(771, 316, 776, '590/1416/421.014/2014', 'BAGIAN PERTANAHAN', 'NPKND', '2014-03-18', '-', 'Rencana Pelaksanaan Pengadaan Tanah Tahun Anggaran 2014', '', 'D:\\Hasil Scan\\IMG_20140319_0005.jpg'),
(772, 428, 777, '910/1415/421.023/2014', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'Surat Keluar', '2014-03-18', '-', 'Permintaan Laporan Triwulan I Tahun Anggaran 2014', '', 'D:\\Hasil Scan\\IMG_20140319_0006.jpg'),
(773, 70, 778, '065/087/421.034/2014', 'BAGIAN ORGANISASI', 'NPKND', '2014-03-18', '-', 'Hasil Evaluasi Inovasi Pelayanan Publik Tahun 2014', '', ''),
(774, 247, 779, '500/1347/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NOTA DINAS', '2014-03-18', '-', 'Laporan Mengikuti Rapat Koordinasi Bidang Perekonomian Provinsi Seluruh Indonesia Dengan Tema Peningkatan Ketahanan Ekonomi Nasionala Yang Tangguh dan Berkelanjutan Berbasisi Ekonomi Provinsi', '', ''),
(775, 247, 780, '119/1346/421.022/2014', 'BAGIAN KERJASAMA', 'Surat Keluar', '2014-03-18', '-', 'Tata Cara Pelaksanaan Kerjasama Daerah', '', 'D:\\Hasil Scan\\IMG_20140319_0008.jpg'),
(776, 470, 781, '005/1345/421.032/2014', 'BAGIAN TATA USAHA', 'NPKND', '2014-03-18', '-', 'Permohonan Memimpin Rapat Koordinasi Membahas Draft Keputusan Bupati Malang Tentang Penyelenggara Peringatan Hari - Hari Besar di Lingkungan Pemerintah Kab.Malang', '', 'D:\\Hasil Scan\\IMG_20140319_0009.jpg'),
(777, 470, 782, '005/1344/421.040/2014', 'ASISTEN PEREKONOMIAN & PEMBANGUNAN', 'NOTA DINAS', '2014-03-18', '-', 'Permohonan Memimpin Rapat Koordinasi Membahas Draftt Keputusanj Bupati Malang Tentang Penyelenggara Peringatan Hari - Hari Besar Lingkungan Pemerintah Kab.Malang Tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140319_0010.jpg'),
(778, 398, 783, '851/1343/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Surat Izin Cuti Tahunan MENGIZINKAN a.n SAIKONI ', '', 'D:\\Hasil Scan\\IMG_20140319_0011.jpg'),
(779, 398, 784, '851/1342/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Surat Izin Cuti Tahunan MENGIZINKAN a.n SUSILOWATI', '', 'D:\\Hasil Scan\\IMG_20140319_0012.jpg'),
(780, 404, 785, '857/1341/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Surat Izin Cuti Karena Alasan Penting MENGIZINKAN a.n YANTI ARISNA', '', 'D:\\Hasil Scan\\IMG_20140319_0013.jpg'),
(781, 247, 786, '500/1328/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Surat Keluar', '2014-03-18', '-', 'Untuk Mendapatkan Tindak Lanjut dan Dimanfaatkan Sesuai Ketentuan Yang Berlaku Sebahagi Sasaran Promosi Potensi / Produk Unggulan Kab.Malang', '', 'D:\\Hasil Scan\\IMG_20140319_0025.jpg'),
(782, 247, 787, '539/41327/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Penyusunan Dan Penyampaian Laporan Keuangan Perusahaan Tahun 2014', '', ''),
(783, 262, 788, '520/1326/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NPKND', '2014-03-18', '-', 'Laporan Penerimaan Audiensi dan Diskusi Demgam PT.Dupont Indonesia', '', 'D:\\Hasil Scan\\IMG_20140319_0027.jpg'),
(784, 23, 789, '011/1325/421.024/2014', 'BAGIAN PDE', 'NPKND', '2014-03-18', '-', 'Nota Dinas Permkohonan Pinjam Ruang Rapat Tohjoyo', '', 'D:\\Hasil Scan\\IMG_20140319_0028.jpg'),
(785, 23, 790, '539/1324/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NPKND', '2014-03-18', '-', 'Rencana Pemenuhan Kebutuhhan Air Bersih Di bandara Abdulrachman Saleh', '', 'D:\\Hasil Scan\\IMG_20140319_0029.jpg'),
(786, 155, 791, '361/1323/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Surat Keluar', '2014-03-18', '-', 'Permohonan Peenanggunaan Cadangan Beras Pemerintah Untuk Tanggap Darurat Bencana Erupsi Gunung kelud', '', 'D:\\Hasil Scan\\IMG_20140319_0030.jpg'),
(787, 155, 792, '361/1322/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NOTA DINAS', '2014-03-18', '-', 'Penggunaan Cadangan Beras Pemerintah (CBP) Unuk Tanggap Darurat nBencana Srupsi Gunung kelud', '', 'D:\\Hasil Scan\\IMG_20140319_0031.jpg'),
(788, 155, 793, '539/1321/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Surat Keluar', '2014-03-18', '-', 'Pemberitahuan Kegiatan "INDONESI water forum 2014"', '', 'D:\\Hasil Scan\\IMG_20140319_0032.jpg'),
(789, 470, 794, '005/1320/421.032/2014', 'BAGIAN TATA USAHA', 'Surat Keluar', '2014-03-18', '-', 'UNDANGAN', '', 'D:\\Hasil Scan\\IMG_20140319_0033.jpg'),
(790, 470, 795, '005/1319/421.032/2014', 'BAGIAN TATA USAHA', 'Surat Keluar', '2014-03-18', '-', 'UNDANGAN', '', ''),
(791, 88, 796, '100/1318/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NOTA DINAS', '2014-03-18', '-', 'Laporan Kegiatan Diseminasi Hak Sipil Politik Masyarakat Yang Relevan Bagi Perlindungan HAM Dalam Rangka Pemilu di Jatim', '', 'D:\\Hasil Scan\\IMG_20140319_0034.jpg'),
(792, 88, 797, '100/1317/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NPKND', '2014-03-18', '-', 'Laporan Kegiatan Diseminasi Hak Sipil Politik Masyarakat Yang Relevan Bagi Perlindungan HAM Dalam Rangka Pemilu di Jawa Timur', '', 'D:\\Hasil Scan\\IMG_20140319_0036.jpg'),
(793, 470, 798, '005/1316/421.032/2014', 'BAGIAN TATA USAHA', 'Surat Keluar', '2014-03-18', '-', 'UNDANGAN', '', 'D:\\Hasil Scan\\IMG_20140319_0035.jpg'),
(794, 470, 799, '005/1319/421.032/2014', 'BAGIAN TATA USAHA', 'Surat Keluar', '2014-03-18', '-', 'UNDANGAN', '', ''),
(795, 85, 800, '094/1314/421.032/2014', 'BAGIAN TATA USAHA', 'Surat Keluar', '2014-03-18', '-', 'Surat Tugas MEMERINTAHKAN a.n ABDUL MALIK', '', 'D:\\Hasil Scan\\IMG_20140319_0038.jpg'),
(796, 470, 801, '005/1311/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Surat Keluar', '2014-03-18', '-', 'UNDANGAN', '', 'D:\\Hasil Scan\\IMG_20140319_0039.jpg'),
(797, 470, 802, '005/1311/421.032/2014', 'BAGIAN TATA USAHA', 'Surat Keluar', '2014-03-18', '-', 'UNDANGAN\r\n', '', ''),
(798, 470, 803, '005/1310/421.032/2014', 'BAGIAN TATA USAHA', 'Surat Keluar', '2014-03-18', '-', 'UNDANGAN', '', 'D:\\Hasil Scan\\IMG_20140319_0040.jpg'),
(799, 88, 804, '100/1309/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NPKND', '2014-03-18', '-', 'Rapat Koordinasi Pelaksanaan Pemilihan Umum Anggota DPR,DPD,Dan DPRD dan Pemilihan Umum Presiden Dan Wakil Presiden', '', 'D:\\Hasil Scan\\IMG_20140319_0041.jpg'),
(800, 470, 805, '005/1308/421.032/2014', 'BAGIAN TATA USAHA', 'Surat Keluar', '2014-03-18', '-', 'UNDANGAN\r\n', '', 'D:\\Hasil Scan\\IMG_20140319_0042.jpg'),
(801, 436, 806, '973/1295/421.032/2014', 'BAGIAN TATA USAHA', 'Surat Keluar', '2014-03-18', '-', 'Himbauan Penyampaian SPT Tahunan Tahun Pajak 2013 Memulai E-FILING', '', 'D:\\Hasil Scan\\IMG_20140318_0004.jpg'),
(802, 396, 807, '848.1/1340/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Surat Izin Belajar Pegawai Negeri Sipil MEMBERI IZIN a.n ABDUL HAFID', '', 'D:\\Hasil Scan\\IMG_20140319_0014.jpg'),
(803, 448, 808, '800/1339/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Penyampaian Berkas Pemberhentian Dengan Hormat Sebagai Pegawai Negeri Sipil Dengan Hak Pensiun atas Permintaan sendiri', '', 'D:\\Hasil Scan\\IMG_20140319_0015.jpg'),
(804, 448, 809, '800/1338/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Penyampaian Berkas DPCP Serta Usulan kenaikan Pangkat Pengabdian dan pemberhentian dengan hormat sebagai pegawai Negeri Sipil Dengan Hak Pensiun a.n Sdr. MATSAMRI', '', 'D:\\Hasil Scan\\IMG_20140319_0016.jpg'),
(805, 396, 810, '848.1/1337/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Surat Izin Belajar Pegawai Negeri Sipil MEMBERI IZIN a.n SEGENG BUDI SUNARKO', '', 'D:\\Hasil Scan\\IMG_20140319_0017.jpg'),
(806, 448, 811, '800/1336/421.202/2014', 'BKD', ' Surat Keluar', '2014-03-18', '-', 'Penyampaian Pejabat Yang Wajib Melaporkan Harta Kekayaan di Pemerintah Kab.Malang', '', 'D:\\Hasil Scan\\IMG_20140319_0018.jpg'),
(807, 448, 812, '822.4/1335/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140319_0019.jpg'),
(808, 448, 813, '822.4/1334/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140319_0020.jpg'),
(809, 448, 814, '822.4/1333/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140319_0021.jpg'),
(810, 448, 815, '822.3/1332/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140319_0022.jpg'),
(811, 448, 816, '822.4/1331/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140319_0023.jpg'),
(812, 448, 817, '800/1330/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Surat Perintah Tugas MEMERINTAHKAN a.n SUWANDI', '', 'D:\\Hasil Scan\\IMG_20140319_0024.jpg'),
(813, 448, 818, '821.2/1305/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Permohonan Penerbitan Kembali Surat Keputusan Pengangkatan Pegawai Negeri Sipil Daerah a.n Sdr.SULISTYORINI', '', 'D:\\Hasil Scan\\IMG_20140319_0044.jpg'),
(814, 401, 819, '854/1304/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Surat Izin Cuti Bersalin MENGIZINKAN a.n RENY WAHYU WIJAYANTI', '', 'D:\\Hasil Scan\\IMG_20140319_0045.jpg'),
(815, 401, 820, '854/1303/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Surat Izin Cuti Bersalin MENGIZINKAN a.n LILEY SAFITRI INDRA LESTARI', '', 'D:\\Hasil Scan\\IMG_20140319_0046.jpg'),
(816, 401, 821, '854/1302/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Surat Izin Cuti Bersalin MENGIZINKAN a.n MEIRIA NURAINI', '', 'D:\\Hasil Scan\\IMG_20140319_0047.jpg'),
(817, 382, 822, '824.3/1301/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Menghadapkan PNS a.n Sdr. AGUS DWI PRASETYO', '', 'D:\\Hasil Scan\\IMG_20140319_0048.jpg'),
(818, 380, 823, '824/1300/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Persetujuan Pindah Bekerja', '', ''),
(819, 380, 824, '822.4/1299/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140318_0001.jpg'),
(820, 380, 825, '822.4/1298/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140318_0002.jpg'),
(821, 380, 826, '822.4/1297/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140318_0003.jpg'),
(822, 404, 827, '857/1224/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Surat Izin Cuti Karena Alasan Penting MENGIZINKAN a.n BAGUS KURNIA RAHMADI', '', 'D:\\Hasil Scan\\IMG_20140318_0025.jpg'),
(823, 398, 828, '851/1223/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Surat Izin Cuti Tahunan MENGIZINKAN a.n IRWANTORO', '', 'D:\\Hasil Scan\\IMG_20140318_0026.jpg'),
(824, 398, 829, '822.4/1222/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Kenaikan Gji Berkala', '', 'D:\\Hasil Scan\\IMG_20140318_0027.jpg'),
(825, 398, 830, '822.4/1221/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140318_0028.jpg'),
(826, 398, 831, '822.4/1220/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140318_0029.jpg'),
(827, 398, 832, '822.4/1219/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140318_0030.jpg'),
(828, 398, 833, '822.4/1218/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140318_0031.jpg'),
(829, 398, 834, '822.4/1217/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140318_0032.jpg'),
(830, 398, 835, '822.4/1216/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140318_0033.jpg'),
(831, 398, 836, '822.4/1215/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140318_0034.jpg'),
(832, 398, 837, '822.4/1214/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Kenaikan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140318_0035.jpg'),
(833, 398, 838, '851/893/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Surat Izin Cuti Tahunan MENGIZINKAN a.n NISA SUCI MAHARANI', '', 'D:\\Hasil Scan\\IMG_20140318_0036.jpg'),
(834, 396, 839, '848.1/892/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Surat Izin Belajar Pegawai Negeri Sipil MEMBERI IZIN a.n YOSEP PRIANTO', '', 'D:\\Hasil Scan\\IMG_20140318_0037.jpg'),
(835, 396, 840, '892.4/891/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Surat Tugas Belajar MENUGASKAN a.n LILYS KARSIANTI', '', 'D:\\Hasil Scan\\IMG_20140318_0038.jpg'),
(836, 448, 841, '800/844/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Surat Perintah MEMERINTAHKAN a.n hadarsono', '', 'D:\\Hasil Scan\\IMG_20140318_0039.jpg'),
(837, 448, 842, '800/843/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Surat Perintah MEMERINTAHKAN a.n AGUS PRAJITNO', '', 'D:\\Hasil Scan\\IMG_20140318_0040.jpg'),
(838, 448, 843, '800/842/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Surat Perintah MEMERINTAHKAN a.n AINUR ROFIQ MANSUR', '', 'D:\\Hasil Scan\\IMG_20140318_0041.jpg'),
(839, 448, 844, '867/1277/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Penetapan Angka Kredit Jabatan Fungsional Pranata Laboratium Kesehatan', '', 'D:\\Hasil Scan\\IMG_20140318_0024.jpg'),
(840, 448, 846, '867/1275/421.2202/2014', '2202', 'Surat Keluar', '2014-03-18', '-', 'Penetapan Angka Kredit Jabatan Fungsional Dokter', '', 'D:\\Hasil Scan\\IMG_20140318_0022.jpg'),
(841, 448, 847, '867/1276/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140318_0023.jpg'),
(842, 448, 848, '867/1274/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140318_0021.jpg'),
(843, 448, 849, '867/1273/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140318_0020.jpg'),
(844, 448, 850, '867/1272/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Penetapan Angka Kredit Jabatan Fungsional  Dokter', '', 'D:\\Hasil Scan\\IMG_20140318_0019.jpg'),
(845, 448, 851, '867/1278/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140318_0018.jpg'),
(846, 448, 852, '867/1289/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140318_0017.jpg'),
(847, 448, 853, '867/1288/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140318_0016.jpg'),
(848, 448, 854, '867/1287/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140318_0015.jpg'),
(849, 448, 855, '867/1286/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140318_0014.jpg'),
(850, 448, 856, '867/1285/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', '`Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140318_0013.jpg'),
(851, 448, 857, '867/1284/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140318_0012.jpg'),
(852, 448, 858, '867/1283/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140318_0011.jpg'),
(853, 448, 859, '867/1282/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140318_0010.jpg'),
(854, 448, 860, '867/1281/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140318_0009.jpg'),
(855, 448, 861, '867/1280/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140318_0008.jpg'),
(856, 448, 862, '867/1279/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140318_0007.jpg'),
(857, 448, 863, '867/1290/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140318_0006.jpg'),
(858, 448, 864, '867/1291/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-18', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140318_0005.jpg'),
(859, 154, 865, '360/1307/421.109/2014', 'DINAS BINA MARGA', 'Surat Keluar', '2014-03-18', '-', 'Surat Pernyataan Tentang Bencana Alam', '', 'D:\\Hasil Scan\\IMG_20140319_0043.jpg'),
(860, 154, 866, '539/1327/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Surat Keluar ', '2014-03-19', '-', 'Penyusunan dan Penyampaian Laporan Keuangan Perusahaan Tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140319_0026.jpg'),
(861, 470, 867, '005/1315/421.032/2014', 'BAGIAN TATA USAHA', 'Surat Keluar ', '2014-03-19', '-', 'Undangan ', '', 'D:\\Hasil Scan\\IMG_20140319_0037.jpg'),
(862, 381, 868, '824.2/1300/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-19', '-', 'Persetujuan Pindah Bekerja', '', 'D:\\Hasil Scan\\IMG_20140319_0049.jpg'),
(863, 43, 869, '032/1521/421.119/2014', 'DPPKA', 'Surat Keluar', '2014-03-19', '-', 'Surat Pernyataan ', '', 'D:\\Hasil Scan\\IMG_20140324_0011.jpg'),
(864, 247, 870, '500/1520/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Surat Keluar', '2014-03-19', '-', 'Pengukuran Kinerja Koordoinasi Pengelolaan Inflasi di Kab.Malang 2013', '', 'D:\\Hasil Scan\\IMG_20140324_0010.jpg'),
(865, 206, 871, '451/1519/421.042/2014', 'Bagian Bintal', 'NOTA DINAS', '2014-03-19', '-', 'Telaah Belanja Hibah Kepada Badan/Lembaga / Organisasi Bidang Keagamaan Tahun Anggaran 2014', '', 'D:\\Hasil Scan\\IMG_20140324_0009.jpg'),
(866, 65, 872, '060/1443/421.034/2014', 'BAGIAN ORGANISASI', 'Surat Keluar', '2014-03-19', '-', 'Hasil Evaluasi Kompetisi Inovasi Pelayanan Publik Tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140324_0008.jpg'),
(867, 448, 873, '800/1440/421.202/2014', 'BKD', 'NOTA DINAS', '2014-03-19', '-', 'Laporan Hasil Rapat Koordinasi Permkasalahan Kepegawaian A.n Andi Hamzah P.AMd.,Kep.', '', 'D:\\Hasil Scan\\IMG_20140324_0007.jpg'),
(868, 85, 874, '094/1436/421.032/2014', 'BAGIAN TATA USAHA', 'Surat Keluar', '2014-03-19', '-', 'Surat Tugas MENUGASKAN a.n EKO SUWANTO', '', 'D:\\Hasil Scan\\IMG_20140324_0012.jpg'),
(869, 193, 875, '440/1435/421.041/2014', 'BAGIAN KESRA', 'NOTA DINAS', '2014-03-19', '-', 'Laporan Hasil Rapat Koordinasi Membahas Proposal Pembantu BSPO (BPJSTK SERVICE POINT OFFICE) Pada Badan Pelayanan Perizinan Terpadu Kab.Malang', '', 'D:\\Hasil Scan\\IMG_20140324_0025.jpg'),
(870, 193, 876, '440/1434/421.041/2014', 'BAGIAN KESRA', 'NPKND', '2014-03-19', '-', 'Laporan Hasil Rapat Koordinasi Membahas Proposal Pembantu BSPO (BPJSTK SERVICE POINT OFFICE) Pada Badan Pelayanan Perizinan Terpadu Kab.Malang', '', 'D:\\Hasil Scan\\IMG_20140324_0024.jpg'),
(871, 448, 877, '800/1433/421.117/2014', 'DINAS ENERGI & SDM', 'Surat Keluar', '2014-03-19', '-', 'Surat Tugas MENUGASKAN a.n BAMBANG SUMANTRI', '', 'D:\\Hasil Scan\\IMG_20140324_0027.jpg'),
(872, 88, 878, '100/1432/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NOTA DINAS', '2014-03-19', '-', 'Laporan Hasil Rapat Koordinasi Pembentukan Tim Desk Pemilihan Umum Anggota Dewan Perwakilan Rakyat,Dewan Perwakilan Daerah,Dan Dewan Perwakilan Rakyat Daerah Tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140324_0023.jpg'),
(873, 88, 879, '100/1431/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NPKND', '2014-03-19', '-', 'Laporan Hasil Rapat Koordinasi Pembentukan Tim Desk Pemilihan Umum Anggota Dewan Perwakilan Rakyat,Dewan Perwakilan Daerah,Dan Dewan Perwakilan Rakyat Daerah Tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140324_0022.jpg'),
(874, 88, 880, 'X.718/1430/421.201/2014', 'INSPEKTORAT', 'Surat Keluar', '2014-03-19', '-', 'Hasil Pemeriksaan Inspektorat Kabupaten Malang Pada Bagian Hukum Seketarriat Daerah Kab.Malang', '', 'D:\\Hasil Scan\\IMG_20140324_0006.jpg'),
(875, 88, 881, 'X.714/1429/421.201/2014', 'INSPEKTORAT', 'Surat Keluar', '2014-03-19', '-', 'Hasil Pemeriksaan Inspektorat Kabupaten Malang Pada Kec.Kalipare Kab.Malang', '', 'D:\\Hasil Scan\\IMG_20140324_0005.jpg'),
(876, 88, 882, 'X.743/1426/421.201/2014', 'INSPEKTORAT', 'Surat Keluar', '2014-03-19', '-', 'Hasil Pemeriksana Inspektorat Kabupaten Malang Pada Dinas Kebudayaan Dan Pariwisata Kab.Malang', '', ''),
(877, 88, 883, '119/1427/421.022/2014', 'BAGIAN KERJASAMA', 'NOTA DINAS', '2014-03-19', '-', 'Telaah Staf Terhadap Surat Drai Politeknis Kesehatan Rumah Sakit dr. Soepranoen Mlaang Tentang Surat Pengantar MOU', '', 'D:\\Hasil Scan\\IMG_20140324_0002.jpg'),
(878, 167, 884, '400/1426/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NOTA DINAS', '2014-03-19', '-', 'Penyampaian Bahan/ Materi Dialog (Talkshow) Pembangunan Manusia dan Ketimpangan di Indonesia', '', 'D:\\Hasil Scan\\IMG_20140324_0003.jpg'),
(879, 262, 885, '520/1425/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NPKND', '2014-03-19', '-', 'Telaah Terhadap Kerjasama Dalam Rangka Ketahanan Pangan Daerah', '', 'D:\\Hasil Scan\\IMG_20140324_0001.jpg'),
(880, 85, 886, '094/1424/421.014/2014', 'BAGIAN PERTANAHAN', 'Surat Keluar', '2014-03-19', '-', 'Surat Tugas MENUGASKAN a.n MARDIYANTO', '', 'D:\\Hasil Scan\\IMG_20140324_0021.jpg'),
(881, 247, 887, '500/1423/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NPKND', '2014-03-19', '-', 'Surat Perintah Tugas Mengikuti Rapat Koordinasi Kegiatan Sosialisasi Roadmap Pembangunan Ekonomi K reatif Jatim 2014 - 2018', '', 'D:\\Hasil Scan\\IMG_20140324_0026.jpg'),
(882, 247, 888, '552.4/1412/421.111/2014', 'DINAS CIPTA KARYA & TATA RUANG', ' Surat Keluar', '2014-03-19', '-', 'Lokasi Taman Untuk Program  Pengembangan Kota Hijau (P2KH) 2014', '', 'D:\\Hasil Scan\\IMG_20140324_0020.jpg'),
(883, 85, 889, '094/1405/421.032/2014', 'BAGIAN TATA USAHA', 'NOTA DINAS', '2014-03-19', '-', 'Permohonan Ijin Mengahadiri Rapat Koordinasi Persiapan Pelaksanaan Pemilu Anggota DPR,DPD,Dan DPRD Tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140324_0019.jpg'),
(884, 382, 890, '824.3/1370/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-19', '-', 'Mengahdap PNS a.n Adr. I GEDE SUDARSANA ', '', 'D:\\Hasil Scan\\IMG_20140324_0018.jpg'),
(885, 382, 891, '824.3/1369/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-19', '-', 'Permohonan Pindah Bekerja a.n Sdr. MOCHAMAD ANUGRAH SATRIYO KUNCORO', '', 'D:\\Hasil Scan\\IMG_20140324_0017.jpg'),
(886, 382, 892, '824.3/1368/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-19', '-', 'Persetujuan Pindah  Bekerja', '', 'D:\\Hasil Scan\\IMG_20140324_0016.jpg'),
(887, 383, 893, '824.4/1367/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-19', '-', 'Persetujuan Pindah Antar Instansi', '', 'D:\\Hasil Scan\\IMG_20140324_0015.jpg'),
(888, 383, 894, '822.4/1366/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-19', '-', 'Kenaikaan Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140324_0014.jpg'),
(889, 383, 895, '822.4/1331/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-19', '-', 'Kenaiakan  Gaji Berkala', '', 'D:\\Hasil Scan\\IMG_20140324_0013.jpg'),
(890, 383, 896, 'x.743/1428/421.201/2014', 'INSPEKTORAT', 'Surat Keluar ', '2014-03-24', '-', 'Hasil Pemeriksaan Inspektorat Kabupaten Malang pada Dinas Kebudayaan dan Pariwisata', '', 'D:\\Hasil Scan\\IMG_20140324_0004.jpg'),
(891, 278, 897, '525.24/1600/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NOTA DINAS', '2014-03-25', '-', 'Telaah Terhadap Permohonan Kelengkapan Persyaratan Rekomendasi Teknis Dalam Rangka Penanaman Modal Di Bidang Usaha Perkebunan Dari PT. Duta Plantation Nusantara Kepada pemerintah Kab.Malang', '', 'D:\\Hasil Scan\\IMG_20140328_0040.jpg'),
(892, 278, 898, '525.24/1599/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NPKND', '2014-03-25', '-', 'Telaah Terhadap Permohonan Kelengkapan Persyaratan Rekomendasi Teknis Dalam Rangka Penanaman Modal Bidang Usaha Perkebunan Dari PT. Duta Platation Nusantara Kepada Pemerintah Kab.Malang', '', 'D:\\Hasil Scan\\IMG_20140328_0041.jpg'),
(893, 262, 899, '520/1598/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Surat Keluar', '2014-03-25', '-', 'Hasil Audiensi Dan Diskusi Dengan PT.DuPont Indonesia', '', 'D:\\Hasil Scan\\IMG_20140328_0042.jpg'),
(894, 470, 900, '005/1596/421.032/2014', 'BAGIAN TATA USAHA', 'Surat Keluar', '2014-03-25', '-', 'UNDANGAN', '', 'D:\\Hasil Scan\\IMG_20140328_0043.jpg'),
(895, 169, 901, '410/1595/421.208/2014', 'BADAN PEMBERDAYAAN MASYARAKAT', 'Surat Keluar', '2014-03-25', '-', 'Surat Tugas MEMERINTAH a.n ABDUL RACHMAN FIRDAUS', '', 'D:\\Hasil Scan\\IMG_20140328_0044.jpg'),
(896, 169, 902, '094/1594/421.302/2014', 'UPT PERIJINAN', 'Surat Keluar', '2014-03-25', '-', 'Surat Tugas MENUGASKAN a.n DJAKA RITAMTAMA', '', 'D:\\Hasil Scan\\IMG_20140328_0045.jpg'),
(897, 262, 903, '520/1593/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Surat Keluar', '2014-03-25', '-', 'Kerja Sama Dalam Rangka Ketahanan Pangan Daerah', '', 'D:\\Hasil Scan\\IMG_20140328_0046.jpg'),
(898, 63, 904, '050/1591/421.032/2014', 'BAGIAN TATA USAHA', 'Suart Keluar', '2014-03-25', '-', 'Laporan Sharing Program/ Kegiatan Penanggulangan Bencana Alam', '', 'D:\\Hasil Scan\\IMG_20140328_0047.jpg'),
(899, 424, 905, '900/1590/421.023/2014', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'Surat Keluar', '2014-03-25', '-', 'Penyampaian Surat Keputuan Bupati Malang', '', 'D:\\Hasil Scan\\IMG_20140328_0048.jpg'),
(900, 88, 906, '100/15889/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NPKND', '2014-03-25', '-', 'Mitra Percepatan Pembangunan Desa', '', ''),
(901, 88, 907, '539/1588/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Surat Keluar', '2014-03-25', '-', 'Kewenangan Terkait Rencana Kerjasama Perusahaan Daerah Dengan Pihak Ketiga', '', 'D:\\Hasil Scan\\IMG_20140328_0050.jpg'),
(902, 448, 908, '800/1574/421.041/2014', 'BAGIAN KESRA', 'NPKND', '2014-03-25', '-', 'SPPD Bagian Administrasi Kesejahteraan Rakyat Seketariat Daerah Kabupaten Malang Dalam Rangka Mengikuti Rapat Koordinasi Penanaganan Penutupan Lokalisasi Dan Pasca Penutupan  Lokalisasi WTS Di Jatim Tahun 2014', '', ''),
(903, 424, 909, '900/1573/421.041/2014', 'BAGIAN KESRA', 'NPKND', '2014-03-25', '-', 'Surat Perintah Tugas Mengikuti Rapat Koordianasi Penanganan Penutupan Lokalisasi Dan Pasca Penutupan Lokalisasi WTS Di Jatim Tahun 2014', '', ''),
(904, 424, 910, '539/1571/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NPKND', '2014-03-25', '-', 'Telaah Terkait Permohonan Izin Kerjasama PD. Jasa Yasa Dengan Pihak Ketiga Di Bidang Ticketing, Tour And Travel', '', 'D:\\Hasil Scan\\IMG_20140328_0052.jpg'),
(905, 280, 911, '540/1570/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NOTA DINAS', '2014-03-25', '-', 'Permohonan Untuk Memimpiin Rapat Koordinasi Membahas Tindak Lanjut Pengaduan Warga Desa Sengguruh Kec.Panjen', '', 'D:\\Hasil Scan\\IMG_20140328_0053.jpg'),
(906, 280, 912, '539/1569/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NOTA DINAS', '2014-03-21', '-', 'Telah Terkait Permohonan Izin Kerjasama PD. Jasa Yasa Dengan Pihak Ketiga di Bidang Tickrting, Taur and Travel', '', 'D:\\Hasil Scan\\IMG_20140328_0054.jpg'),
(907, 280, 913, '539/1568/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NPKND', '2014-03-25', '-', 'Telaah Terkait Permohonan Izin PD. Jasa Yasa Dengan Pihak Ketiga di Bidang Ticketing, Taur and Travel', '', 'D:\\Hasil Scan\\IMG_20140328_0055.jpg'),
(908, 470, 914, '005/1567/421.032/2014', 'BAGIAN TATA USAHA', 'NPKND', '2014-03-25', '-', 'Undangan Peluncuran Buku Jelajah Seribu Pantai', '', 'D:\\Hasil Scan\\IMG_20140328_0056.jpg'),
(909, 470, 915, '005/1566/421.032/2014', 'BAGIAN TATA USAHA', 'Surat Keluar', '2014-03-25', '-', 'UNDANGAN', '', 'D:\\Hasil Scan\\IMG_20140328_0057.jpg'),
(910, 470, 916, '005/1565/421.032/2014', 'BAGIAN TATA USAHA', 'Surat Keluar', '2014-03-25', '-', 'UNDANGAN', '', 'D:\\Hasil Scan\\IMG_20140328_0058.jpg'),
(911, 470, 917, '005/1564/421.032/2014', 'BAGIAN TATA USAHA', 'Surat Keluar', '2014-03-25', '-', 'UNDANGAN', '', 'D:\\Hasil Scan\\IMG_20140328_0059.jpg'),
(912, 167, 918, '400/1562/421.041/2014', 'BAGIAN KESRA', 'TELAAH STAF', '2014-03-25', '-', 'Telaah Permohonan Bantuan Sosial Kesejahteraan Sosial Untuk Anggota Masyarakat di Wilayah Kab. Malang', '', 'D:\\Hasil Scan\\IMG_20140328_0060.jpg'),
(913, 127, 919, '220/1561/421.041/2014', 'BAGIAN KESRA', 'TELAAH STAF', '2014-03-25', '-', 'Telaah Permohonan B', 'elanja Hibab Kepada Masyarakat Ilmu Pemerintahan Indonesia (PMI) Cabang Kab. Malang', 'D:\\Hasil Scan\\IMG_20140328_0061.jpg'),
(914, 395, 920, '848/1560/421.040/2014', 'ASISTEN PEREKONOMIAN & PEMBANGUNAN', 'NOTA DINAS', '2014-03-25', '-', 'Permohonan Izin Meninggalkan Wilayah Kab. Malang ', '', 'D:\\Hasil Scan\\IMG_20140328_0062.jpg'),
(915, 108, 921, '180/1559/421.119/2014', 'DPPKA', 'Surat Keluar', '2014-03-25', '-', 'Surat Kuasa Substitusi', '', 'D:\\Hasil Scan\\IMG_20140328_0063.jpg'),
(916, 424, 922, '900/1558/421.119/2014', 'DPPKA', 'Surat Keluar', '2014-03-25', '-', 'Surat Representasi Manajemen', '', 'D:\\Hasil Scan\\IMG_20140328_0064.jpg'),
(917, 470, 923, '005/1557/421.032/2014', 'BAGIAN TATA USAHA', 'Surat Keluar', '2014-03-25', '-', 'UNDANGAN', '', 'D:\\Hasil Scan\\IMG_20140328_0065.jpg'),
(918, 448, 924, '800/1556/421.032/2014', 'BAGIAN TATA USAHA', 'Surat Keluar', '2014-03-25', '-', 'Surat Keterangan', '', 'D:\\Hasil Scan\\IMG_20140328_0066.jpg'),
(919, 88, 925, '100/1553/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NPKND', '2014-03-25', '-', 'Finalisasi Penyusunan  Laporan Penyelenggaraan Pemerintah Daerah (LPPD) Kab. Malang Tahun 2013', '', 'D:\\Hasil Scan\\IMG_20140328_0068.jpg'),
(920, 424, 926, '900/1551/421.119/2014', 'DPPKA', 'Surat Keluar', '2014-03-25', '-', 'Penyampaian lAPORAN kEUANGAN pEMERINTAH Kab. Malang TA 2013 ', '', 'D:\\Hasil Scan\\IMG_20140328_0069.jpg'),
(921, 155, 927, '361/1550/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NOTA DINAS', '2014-03-25', '-', 'Perlakuan Khusus (Keringana) Bagi Debitur Korban Bencana Alam Erupsi Gunung Kelud', '', 'D:\\Hasil Scan\\IMG_20140328_0070.jpg'),
(922, 155, 928, '361/1549/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NPKND', '2014-03-25', '-', 'Perlakuan Khusus (Keringanan)  Bagi Debitur Korban Bencana Alam Erupsi Gunung Kelud', '', 'D:\\Hasil Scan\\IMG_20140328_0071.jpg'),
(923, 155, 929, '539/1548/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NOTA DINAS', '2014-03-25', '-', 'Laporan Perkemvbangan Tindak Lanjut Proses Penyelesaian PT. Kigumas', '', 'D:\\Hasil Scan\\IMG_20140328_0072.jpg'),
(924, 155, 930, '539/1547/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NPKND', '2014-03-25', '-', 'Laporan Perkembangan Tindak Lanjut Proses Penyelesaian PT. Kigumas', '', 'D:\\Hasil Scan\\IMG_20140328_0073.jpg'),
(925, 416, 931, '890/1546/421.023/2014', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'Surat Keluar', '2014-03-25', '-', 'Pelatihan Analisa Harga Satuan Pekerjaan Bidang Pekerjaan Umum Versi 2013', '', 'D:\\Hasil Scan\\IMG_20140328_0074.jpg'),
(926, 154, 932, '360/1544/421.041/2014', 'BAGIAN KESRA', 'NOTA DINAS', '2014-03-25', '-', 'Permohonan Memimpin Rapat Koordinasi  Membahas Manajemen Penanggulanagan Bencana di Kab. Malang ', '', 'D:\\Hasil Scan\\IMG_20140328_0075.jpg'),
(927, 36, 933, '024/1542/421.032/2014', 'BAGIAN TATA USAHA', 'NOTA DINAS', '2014-03-25', '-', 'Permohonan Kendaraan Dinas Roda 2 (Sepeda Motor) Bagi Adc.Asisten dan Staf Bagian Tata Usaha (Kurir) Sekertaris Daerah Kab. Malang', '', 'D:\\Hasil Scan\\IMG_20140328_0076.jpg'),
(928, 39, 934, '027/1541/421.031/2014', 'BAGIAN UMUM & PROTOKOL', 'Surat Keluar', '2014-03-25', '-', 'Pengadaan Sound System Untuk Kegiatan di Kantor Block Office Kepanjen', '', 'D:\\Hasil Scan\\IMG_20140328_0077.jpg'),
(929, 424, 935, '900/1450/421.119/2014', 'DPPKA', 'NPKND', '2014-03-25', '-', 'Pernyataan Tanggung Jawab Bupati Malang', '', ''),
(930, 424, 936, '900/1539/421.119/2014', 'DPPKA', 'NPKND', '2014-03-25', '-', 'Surat Representasi Manajemen Atas Laporan Keuangan Pemerintahan Kab. Malang Tahun Anggaran 2013 Yang Telah Direviu Oleh Inspektorat Kab. Malang Sebagai Kelengkapan Persyaratan Periksaan Oleh BPK RI Perwakilan Provinsi Jatim', '', 'D:\\Hasil Scan\\IMG_20140328_0079.jpg'),
(931, 470, 937, '005/1537/421.032/2014', 'BAGIAN TATA USAHA', 'NOTA DINAS', '2014-03-25', '-', 'Permohonan Membuka Sosialisasi Poyroll Gaji Melalui Bank Jatim', '', 'D:\\Hasil Scan\\IMG_20140328_0080.jpg'),
(932, 439, 938, '976/1535/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NOTA DINAS', '2014-03-25', '-', 'Permohonan Waktu Rapat Koordinasi Penggunaan Dana Bai Hasil Cukai Hasil Tembakau Tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140328_0081.jpg'),
(933, 23, 939, '011/1534/421.032/2014', 'BAGIAN TATA USAHA', 'NPKND', '2014-03-25', '-', 'Permohonan Pinjam Pendopo Kab. Malang Untuk Sosialisai Payroll Gaji Melalui Bank Jatim', '', 'D:\\Hasil Scan\\IMG_20140328_0082.jpg'),
(934, 23, 940, '055/1533/421.032/2014', 'BAGIAN TATA USAHA', 'NPKND', '2014-03-25', '-', 'Penandatanganna Kesepakatan Bersama Antara Pemerintah Kab. Malang Dengan PT. Telekomunikasi Indonesia Tbk', '', ''),
(935, 316, 941, '590/1532/421.014/2014', 'BAGIAN PERTANAHAN', 'NOTA DINAS', '2014-03-25', '-', 'Laporan Hasil Rapat Koordinasi Evaluasi Dan Progres Tukar Menukar Kawasan  Hutan (TMKH) Di Kab. Malang', '', 'D:\\Hasil Scan\\IMG_20140328_0002.jpg'),
(936, 316, 942, '055/1531/421.032/2014', 'BAGIAN TATA USAHA', 'Surat Keluar', '2014-03-25', '-', 'UNDANGAN', '', ''),
(937, 316, 943, '539/1530/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NPKND', '2014-03-25', '-', 'Telaah Terhadap Permohonan Direksi PD. Jasa Yasa Untuk Perpanjangan Hak Pakai Atas Petak Usaha/Toko/Bedak di Unit Pemandian Dewi Sri Pujon', '', 'D:\\Hasil Scan\\IMG_20140328_0004.jpg'),
(938, 263, 944, '521/1529/421.032/2014', 'BAGIAN TATA USAHA', 'NOTA DINAS', '2014-03-25', '-', 'Laporan Hasil Rapat Koordinasi Panitia PENAS Petani Nelayan XIV Tahun 2014 Dengan Pihak Ketiga', '', 'D:\\Hasil Scan\\IMG_20140328_0005.jpg'),
(939, 247, 945, '500/1526/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NPKND', '2014-03-25', '-', 'Surat Perintah Tugas Mengikuti Rapat Koordinasi Kegiatan Sosialisasi Roadmap Pembangunan Ekonomi Kreatif Jawa Timur 2014-2018', '', 'D:\\Hasil Scan\\IMG_20140328_0006.jpg'),
(940, 155, 946, '361/1524/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NPKND', '2014-03-25', '-', 'Perlakuan  Khusus Bagi Debitur Korban Bencana Alam Erupsi Gunung Kelud', '', 'D:\\Hasil Scan\\IMG_20140328_0007.jpg'),
(941, 470, 947, '005/1523/421.032/2014', 'BAGIAN TATA USAHA', 'NPKND', '2014-03-25', '-', 'Rapat Paripurna Istimewa DPRD Kab.Malang', '', 'D:\\Hasil Scan\\IMG_20140328_0008.jpg'),
(942, 470, 948, '867/1518/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-25', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140328_0009.jpg'),
(943, 470, 949, '867/1517/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-25', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140328_0010.jpg'),
(944, 96, 950, '136/1627/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Surat Keluar', '2014-03-27', '-', 'Pemetaan Dan Survey Unsur Rupabumi', '', 'D:\\Hasil Scan\\IMG_20140328_0046.jpg'),
(945, 133, 951, '270/1625/421.205/2014', 'BAKESBANGPOL', 'Surat Keluar', '2014-03-27', '-', 'Pengawasan Penggunaan Fasilitas Pemerintah Dalam Kegiatan Politik Praktis Menjelang Pemilu 2014', '', 'D:\\Hasil Scan\\IMG_20140328_0047.jpg'),
(946, 85, 952, '094/1622/421.032/2014', 'BAGIAN TATA USAHA', 'NPKND', '2014-03-27', '-', 'Mengahadiri Rapat Koordinasi Hibah Program Pengembangan Kapasitas Penerapan Standar Pelayanan Minimal Pendidikan Dasar (PKP-SPM Diknas)', '', 'D:\\Hasil Scan\\IMG_20140328_0048.jpg'),
(947, 85, 953, '094/1621/421.032/2014', 'BAGIAN TATA USAHA', 'NPKND', '2014-03-27', '-', 'Undangan Mengahadiri Pembukaan Musabaqah Tilawatil Qur''an (MTQ) KORPRI Prov.Jatim Tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140328_0049.jpg'),
(948, 167, 954, '400/1620/421.041/2014', 'BAGIAN KESRA', 'NPKND', '2014-03-27', '-', 'Telaah Permohonan Bantuan Kesejahteraan Sosial Untuk Kegiatan Aswaja NU Center Kab.Malang', '', 'D:\\Hasil Scan\\IMG_20140328_0050.jpg'),
(949, 448, 955, '800/1618/421.031/2014', 'BAGIAN UMUM & PROTOKOL', 'Surat Keluar', '2014-03-27', '-', 'Surat Keterangan', '', 'D:\\Hasil Scan\\IMG_20140328_0051.jpg'),
(950, 448, 956, '800/1617/421.031/2014', 'BAGIAN UMUM & PROTOKOL', 'Surat Keluar', '2014-03-27', '-', 'Surat Keterangan ', '', 'D:\\Hasil Scan\\IMG_20140328_0052.jpg'),
(951, 88, 957, '100/1614/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NPKND', '2014-03-27', '-', 'Pemantauan Pemilihan Umum Anggota Dewan Perwakilan Rakyat,Dewan Perwakilan Daerah Dan Dewan Perwakilan Rakyat Daerah Tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140328_0053.jpg'),
(952, 155, 958, '361/1613/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Surat Keluar', '2014-03-27', '-', 'Perlakuan Khusus Bagi Debitur Korban Bencana Alam Erupsi Gunung Kelud', '', 'D:\\Hasil Scan\\IMG_20140328_0054.jpg'),
(953, 88, 959, '100/1607/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NPKND', '2014-03-27', '-', 'Laporan Penyelenggara Pemerintah Daerah (LPPD) Kab.Malang Tahun 2013', '', 'D:\\Hasil Scan\\IMG_20140328_0055.jpg'),
(954, 177, 960, '411.8/1606/421.213/2014', 'KANTOR PEMBERDAYAAN PEREMPUAN & PA', 'Surat Keluar', '2014-03-27', '-', 'Permohonan Nama Peserta Parenting Skill', '', 'D:\\Hasil Scan\\IMG_20140328_0056.jpg'),
(955, 65, 961, '060/1605/421.034/2014', 'BAGIAN ORGANISASI', 'Surat Keluar', '2014-03-27', '-', 'Penyampaian Dokumen Penetapan Kinerja Tahun 2014 Dan LAKIP Kab.Malang Tahun 2013', '', 'D:\\Hasil Scan\\IMG_20140328_0057.jpg'),
(956, 65, 962, '060/1604/421.034/2014', 'BAGIAN ORGANISASI', 'Surat Keluar', '2014-03-27', '-', 'Penyampaian Dokumen Penetapan Kinerja Tahun 2014 Dab LAKIP Kab.Malang Tahun 2013', '', 'D:\\Hasil Scan\\IMG_20140328_0058.jpg'),
(957, 247, 963, '500/1592/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Surat Keluar', '2014-03-27', '-', 'Surat Pengantar Tentang Majalah Galeria Media Dekranasda Jatim edisi : 16 Januari Pebruari 2014', '', 'D:\\Hasil Scan\\IMG_20140328_0059.jpg'),
(958, 247, 964, '867/1516/4211.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140328_0060.jpg'),
(959, 247, 965, '867/1515/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140328_0061.jpg'),
(960, 247, 966, '867/1514/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140328_0001.jpg'),
(961, 247, 967, '867/1513/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140328_0002.jpg'),
(962, 247, 968, '867/1512/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140328_0003.jpg'),
(963, 247, 969, '867/1511/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140328_0004.jpg'),
(964, 247, 970, '867/1510/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140328_0005.jpg'),
(965, 247, 971, '867/1509/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140328_0006.jpg'),
(966, 247, 972, '867/1508/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140328_0007.jpg'),
(967, 247, 973, '867/1507/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140328_0008.jpg'),
(968, 247, 974, '867/1506/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140328_0009.jpg'),
(969, 247, 975, '867/1505/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140328_0010.jpg'),
(970, 247, 976, '867/1504/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Perawat', '', 'D:\\Hasil Scan\\IMG_20140328_0011.jpg');
INSERT INTO `surat_keluar` (`id`, `index_surat_id`, `no_urut`, `no_surat`, `pengolah`, `tujuan`, `tanggal_surat`, `lampiran`, `perihal`, `catatan`, `file_surat`) VALUES
(971, 247, 977, '867/1503/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Perawat', '', 'D:\\Hasil Scan\\IMG_20140328_0012.jpg'),
(972, 247, 978, '867/1502/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Asisten Apoteker', '', 'D:\\Hasil Scan\\IMG_20140328_0013.jpg'),
(973, 247, 980, '867/1500/421.202/2014', 'BKD', ' Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140328_0015.jpg'),
(974, 247, 981, '867/1499/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140328_0016.jpg'),
(975, 247, 982, '867/1498/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Perawat', '', 'D:\\Hasil Scan\\IMG_20140328_0017.jpg'),
(976, 247, 983, '867/1497/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140328_0018.jpg'),
(977, 247, 984, '867/1496/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140328_0019.jpg'),
(978, 247, 985, '867/1495/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Perawat', '', 'D:\\Hasil Scan\\IMG_20140328_0020.jpg'),
(979, 247, 986, '867/1494/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Perawat', '', 'D:\\Hasil Scan\\IMG_20140328_0021.jpg'),
(980, 247, 987, '867/1493/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Perawat', '', 'D:\\Hasil Scan\\IMG_20140328_0022.jpg'),
(981, 247, 988, '867/1492/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Perawat', '', 'D:\\Hasil Scan\\IMG_20140328_0023.jpg'),
(982, 247, 989, '867/1501/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140328_0014.jpg'),
(983, 247, 990, '867/1491/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140328_0024.jpg'),
(984, 247, 991, '867/1490/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Perawat', '', 'D:\\Hasil Scan\\IMG_20140328_0025.jpg'),
(985, 247, 992, '867/1489/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140328_0026.jpg'),
(986, 247, 993, '867/1488/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140328_0027.jpg'),
(987, 247, 994, '867/1487/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140328_0028.jpg'),
(988, 247, 995, '867/1486/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Perawat', '', 'D:\\Hasil Scan\\IMG_20140328_0029.jpg'),
(989, 247, 996, '867/1485/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140328_0030.jpg'),
(990, 247, 997, '867/1484/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140328_0031.jpg'),
(991, 247, 998, '867/1484/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', ''),
(992, 247, 999, '867/1483/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140328_0032.jpg'),
(993, 247, 1000, '867/1482/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140328_0033.jpg'),
(994, 247, 1001, '867/1481/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Pranata Laboratorium Kesehatan', '', 'D:\\Hasil Scan\\IMG_20140328_0034.jpg'),
(995, 247, 1002, '867/1480/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Pranata Laboratorium Kesehatan', '', 'D:\\Hasil Scan\\IMG_20140328_0035.jpg'),
(996, 247, 1003, '867/1479/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kretdit Jabatan Fungsionala Bidan', '', 'D:\\Hasil Scan\\IMG_20140328_0036.jpg'),
(997, 247, 1004, '867/1478/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Perawat', '', 'D:\\Hasil Scan\\IMG_20140328_0037.jpg'),
(998, 247, 1005, '867/1477/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Pranata Laboratorium Kesehatan', '', 'D:\\Hasil Scan\\IMG_20140328_0038.jpg'),
(999, 247, 1006, '867/1476/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Nutrsionis', '', 'D:\\Hasil Scan\\IMG_20140328_0039.jpg'),
(1000, 81, 1007, '090/1624/421.052/2013', 'SEKRETARIAT DPRD', 'Surat Keluar', '2014-03-27', '-', 'Surat Tugas MENUGASKAN a.n NAZARUDIN', '', 'D:\\Hasil Scan\\IMG_20140328_0001.jpg'),
(1001, 43, 1008, '032/1653/421.119/2014', 'DPPKA', 'Surat Keluar', '2014-03-27', '-', 'Laporan BMN Dari Dana Dekonsentrasi Dan Tugas Pembantuan', '', 'D:\\Hasil Scan\\IMG_20140328_0002.jpg'),
(1002, 354, 1009, '660/1652/421.111/2014', 'DINAS CIPTA KARYA & TATA RUANG', 'Surat Keluar', '2014-03-27', '-', 'Surat Minat Kegiatan Evaluasi Dan Pemberian Penghargaan Inovasi Manajemen Perkotaan (IMP) Bidang Pelayan Jasa Perkotaan Tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140401_0001.jpg'),
(1003, 354, 1010, '539/1631/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NPKND', '2014-03-27', '-', 'Rencana Kerjasama PD. Jasa Yasa Dengan Pihak Ketiga Di Bidang Ticketing,Tour And Travel', '', 'D:\\Hasil Scan\\IMG_20140328_0004.jpg'),
(1004, 354, 1011, '539/1630/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NPKND', '2014-03-27', '-', 'Kewenangan Terkait Penggunausahaan Petak Usaha/Toko/Bedak Yang Dikuasai PD.Jasa Yasa', '', 'D:\\Hasil Scan\\IMG_20140328_0005.jpg'),
(1005, 439, 1012, '976/1629/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NOTA DINAS', '2014-03-27', '-', 'Laporan Hasil Rapat Koordinasi Membahas Penggunaan DBHCHT Tahun Anggaran 2014', '', 'D:\\Hasil Scan\\IMG_20140328_0006.jpg'),
(1006, 439, 1013, '`539/1628/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NOTA DINAS', '2014-03-27', '-', 'Permohonan Waktu Rapat Badan Pengawas PD.Jasa Yasa Membahas Tindak Lanjut Keputusan Bupati Malang Tentang Pemberhentian Sementara Direktur Utama PD.Jasa Yasa', '', 'D:\\Hasil Scan\\IMG_20140328_0007.jpg'),
(1007, 439, 1014, '867/1475/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Perawat', '', 'D:\\Hasil Scan\\IMG_20140328_0008.jpg'),
(1008, 439, 1015, '867/1474/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Perawat', '', 'D:\\Hasil Scan\\IMG_20140328_0009.jpg'),
(1009, 439, 1016, '867/1473/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140328_0010.jpg'),
(1010, 439, 1017, '867/1472/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Asisten Apoteker', '', 'D:\\Hasil Scan\\IMG_20140328_0011.jpg'),
(1011, 439, 1018, '867/1471/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140328_0012.jpg'),
(1012, 439, 1019, '867/1470/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140328_0013.jpg'),
(1013, 439, 1020, '867/1469/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140328_0014.jpg'),
(1014, 439, 1021, '867/1468/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140328_0015.jpg'),
(1015, 439, 1022, '867/1467/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Perawat', '', 'D:\\Hasil Scan\\IMG_20140328_0016.jpg'),
(1016, 439, 1023, '867/1466/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Dokter Gigi', '', 'D:\\Hasil Scan\\IMG_20140328_0017.jpg'),
(1017, 439, 1024, '867/1465/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Dokter', '', 'D:\\Hasil Scan\\IMG_20140328_0018.jpg'),
(1018, 439, 1025, '867/1464/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Dokter', '', 'D:\\Hasil Scan\\IMG_20140328_0019.jpg'),
(1019, 439, 1026, '867/1463/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Dokter Gigi', '', 'D:\\Hasil Scan\\IMG_20140328_0020.jpg'),
(1020, 439, 1027, '867/1462/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140328_0021.jpg'),
(1021, 439, 1028, '867/1461/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Dokter Gigi', '', 'D:\\Hasil Scan\\IMG_20140328_0022.jpg'),
(1022, 439, 1029, '867/1460/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Dokter Gigi', '', 'D:\\Hasil Scan\\IMG_20140328_0023.jpg'),
(1023, 439, 1030, '867/1459/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Apoteker', '', 'D:\\Hasil Scan\\IMG_20140328_0024.jpg'),
(1024, 439, 1031, '867/1458/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Dokter', '', 'D:\\Hasil Scan\\IMG_20140328_0025.jpg'),
(1025, 439, 1032, '867/1457/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140328_0026.jpg'),
(1026, 439, 1033, '867/1456/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan\r\n', '', 'D:\\Hasil Scan\\IMG_20140328_0027.jpg'),
(1027, 439, 1034, '867/1455/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Bidan', '', 'D:\\Hasil Scan\\IMG_20140328_0028.jpg'),
(1028, 439, 1035, '867/1454/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Fungsional Perawat', '', 'D:\\Hasil Scan\\IMG_20140328_0029.jpg'),
(1029, 439, 1036, '867/1453/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Asisten Apoteker', '', 'D:\\Hasil Scan\\IMG_20140328_0030.jpg'),
(1030, 439, 1037, '867/14522/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Asisten Apoteker', '', 'D:\\Hasil Scan\\IMG_20140328_0031.jpg'),
(1031, 439, 1038, '867/1451/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Asisten Apoteker', '', 'D:\\Hasil Scan\\IMG_20140328_0032.jpg'),
(1032, 439, 1039, '867/1450/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Asisten Apoteker', '', 'D:\\Hasil Scan\\IMG_20140328_0033.jpg'),
(1033, 439, 1040, '867/1449/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Asisten Apoteker', '', 'D:\\Hasil Scan\\IMG_20140328_0034.jpg'),
(1034, 439, 1041, '867/1448/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Asisten Apoteker', '', 'D:\\Hasil Scan\\IMG_20140328_0035.jpg'),
(1035, 439, 1042, '867/1447/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Asisten Apoteker', '', 'D:\\Hasil Scan\\IMG_20140328_0036.jpg'),
(1036, 439, 1043, '867/1446/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Asisten Apoteker', '', 'D:\\Hasil Scan\\IMG_20140328_0037.jpg'),
(1037, 439, 1044, '867/1445/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Asisten Apoteker', '', 'D:\\Hasil Scan\\IMG_20140328_0038.jpg'),
(1038, 439, 1045, '867/1444/421.202/2014', 'BKD', 'Surat Keluar', '2014-03-27', '-', 'Penetapan Angka Kredit Jabatan Asisten Apoteker', '', 'D:\\Hasil Scan\\IMG_20140328_0039.jpg'),
(1039, 127, 1046, '220/1440/421.205/2014', 'BAKESBANGPOL', 'Surat Keluar', '2014-03-27', '-', 'Penyampaian Laporan RANHAM Tahun 2013', '', 'D:\\Hasil Scan\\IMG_20140328_0040.jpg'),
(1040, 470, 1047, '005/1439/421.023/2014', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'NOTA DINAS', '2014-03-27', '-', 'Permohonan Memimpin Rapat Koordinasi Pelaksanaan Penyesuaian Jabatan Fungsional Pengelola Pengadaan Barang/Jasa', '', 'D:\\Hasil Scan\\IMG_20140328_0041.jpg'),
(1041, 448, 1048, '800/1403/421.012/2014', 'BAGIAN TATA PEMERINTAHAN DESA', 'Surat Keluar', '2014-03-27', '-', 'Surat Tugas MENUGASKAN a.n Edi Suyono', '', 'D:\\Hasil Scan\\IMG_20140328_0042.jpg'),
(1042, 85, 1049, '094/1395/421.022/2014', 'BAGIAN KERJASAMA', 'Surat Keluar', '2014-03-27', '-', 'Surat Tugas MENUGASKAN a.n ABDUL HARIS', '', ''),
(1043, 296, 1050, '555/1359/421.024/2014', 'BAGIAN PDE', 'NPKND', '2014-03-27', '-', 'Surat Pengembangan SIM atau APlikasi', '', ''),
(1044, 247, 1051, '500/1211/421.021/2014`', 'BAGIAN PEREKONOMIAN', 'Surat Keluar', '2014-03-27', '-', 'Pembentuan Tim  Pengendalian Inflasi Daerah (TPID)', '', ''),
(1045, 424, 1052, '900/1540/421.119/2014', 'DPPKA', 'NPKND', '2014-03-28', '-', 'Pernyataan Tanggung Jawab Bupati Malang ', '', 'D:\\Hasil Scan\\IMG_20140328_0078.jpg'),
(1046, 88, 1053, '100/1589/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NPKND ', '2014-03-28', '-', 'Mitra Percepatan Pembangunan Desa ', '', 'D:\\Hasil Scan\\IMG_20140328_0049.jpg'),
(1047, 448, 1054, '800/1573/421.041/2014', 'BAGIAN KESRA', 'NPKND', '2014-03-28', '-', 'Surat Tugas Mengikuti Rakor Penanganan Penutupan Lokalisasi ', '', 'D:\\Hasil Scan\\IMG_20140328_0051.jpg'),
(1048, 470, 1055, '005/1533/421.032/2014', 'BAGIAN TATA USAHA', 'NPKND', '2014-03-28', '-', 'Pengajuan Undangan ', '', 'D:\\Hasil Scan\\IMG_20140328_0001.jpg'),
(1049, 470, 1056, '005/1531/421.032/2014', 'BAGIAN TATA USAHA', 'Surat Keluar ', '2014-03-28', '-', 'Undangan Rapat Paripurna Istimewa', '', 'D:\\Hasil Scan\\IMG_20140328_0003.jpg'),
(1050, 436, 1057, '973/1687/421.119', 'DPPKA', 'Surat Keluar ', '2014-04-01', '-', 'Pengiriman Data Perubahan Pendapatan 2014 dan Rencana Pendapatan 2015', '', 'D:\\Hasil Scan\\IMG_20140401_0001.jpg'),
(1051, 85, 1058, '094/1686/421.302', 'UPT PERIJINAN', 'Surat keluar', '2014-04-01', '-', 'Surat tugas ke Bandung', '', 'D:\\Hasil Scan\\IMG_20140401_0001.jpg'),
(1052, 85, 1059, '978.3/1685/421.119', 'DPPKA', 'NPKND', '2014-03-27', '', 'Pencairan dana bantuan keuangan khusus Prov. Jatim th.2014', '', 'D:\\Hasil Scan\\IMG_20140401_0001.jpg'),
(1053, 316, 1060, '590/1684/421.014', 'BAGIAN PERTANAHAN', 'Nota dinas', '2014-03-28', '', 'Mohon memimpin sosialisasi pengadaan tanah untuk kepentingan pembangunan jalan tol Pandaan-Malang', '', 'D:\\Hasil Scan\\IMG_20140401_0001.jpg'),
(1054, 439, 1061, '976/1680/421.021', 'BAGIAN PEREKONOMIAN', 'Nota dinas ', '2014-03-26', '', 'Laporan hasil rakor membahas penggunaan DBHCHT TA.2014', '', 'D:\\Hasil Scan\\IMG_20140401_0001.jpg'),
(1055, 439, 1062, '539/1683/421.021', 'BAGIAN PEREKONOMIAN', 'Surat keluar', '2014-03-28', '', 'Undangan ', '', 'D:\\Hasil Scan\\IMG_20140401_0001.jpg'),
(1056, 63, 1063, '050/1679/421.023', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'Nota dinas', '2014-03-28', '', 'Telaah staf terhadap penawaran kerjasama penyelenggaraan bimtek persiapan ujian sertifikasi ahli pengadaan barang / jasa pemerintah ', '', 'D:\\Hasil Scan\\IMG_20140401_0001.jpg'),
(1057, 22, 1064, '010/1678/421.023', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'NPKND', '2014-03-28', '', 'Telaah staf terhadap penawaran kerjasama penyelenggaraan bimtek persiapan ujian sertifikasi ahli pengadaan barang/jasa pemerintah', '', 'D:\\Hasil Scan\\IMG_20140401_0001.jpg'),
(1058, 22, 1065, '539/1677/421.021', 'BAGIAN PEREKONOMIAN', 'Surat keluar ', '2014-04-01', '', 'kewenangan terkait penggunausahaan petak usaha/toko/ bedak yg dikuasai PD. Jasa Yasa ', '', 'D:\\Hasil Scan\\IMG_20140401_0001.jpg'),
(1059, 22, 1066, '539/1676/421.021', 'BAGIAN PEREKONOMIAN', 'Surat keluar ', '2014-04-01', '', 'Rencana kerjasama PD. Jasa Yasa dengan pihak ketiga di bidang ticketing, tour & travel ', '', 'D:\\Hasil Scan\\IMG_20140401_0001.jpg'),
(1060, 123, 1067, '188.45/1673/421.216', 'BPBD', 'NPKND', '2014-03-27', '', 'Surat pernyataan bencana alam angin puting beliung Kec. Donomulyo & Kec. Poncokusumo Kab. Malang ', '', 'D:\\Hasil Scan\\IMG_20140401_0001.jpg'),
(1061, 65, 1068, '060/1604/421.034/2014', 'BAGIAN ORGANISASI', 'Surat keluar ', '2014-04-01', '', 'Susunan organisasi RSUD Lawang kelas C', '', 'D:\\Hasil Scan\\IMG_20140401_0001.jpg'),
(1062, 88, 1069, '100/1672/421.011', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Surat keluar ', '2014-04-01', '', 'Mitra percepatan pembangunan desa ', '', 'D:\\Hasil Scan\\IMG_20140401_0001.jpg'),
(1063, 88, 1070, '100/1671/421.011', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Surat keluar ', '2014-04-01', '', 'Laporan penyelenggaraan pemerintahan daerah (LPPD) Kab. Malang th.2013', '', 'D:\\Hasil Scan\\IMG_20140401_0001.jpg'),
(1064, 316, 1071, '590/1669/421.014', 'BAGIAN PERTANAHAN', 'Surat keluar', '2014-03-28', '', 'Penilaian tanaman & bangunan pd trase jalan tol Pandaan-Malang', '', 'D:\\Hasil Scan\\IMG_20140401_0001.jpg'),
(1065, 470, 1072, '005/1660/421.032', 'BAGIAN TATA USAHA', 'Surat keluar ', '2014-03-27', '', 'Undangan rakor', '', 'D:\\Hasil Scan\\IMG_20140401_0001.jpg'),
(1066, 350, 1073, '653/1651/421.214', 'KANTOR PERUMAHAN', 'NPKND', '2014-04-01', '', 'Lokasi pelaksanaan DAK Bidang perumahan & kawasan permukiman th.2014 di Kab. Malang ', '', 'D:\\Hasil Scan\\IMG_20140401_0001.jpg'),
(1067, 350, 1074, 'x.752/1654/421.201', 'INSPEKTORAT', 'Surat keluar ', '2014-04-01', '', 'Penegasan atas hasil evaluasi AKIP Dinas Pertanian & Perkebunan Kab. Malang th.2012', '', 'D:\\Hasil Scan\\IMG_20140401_0001.jpg'),
(1068, 124, 1075, '193/1665/421.022', 'BAGIAN KERJASAMA', 'Nota dinas ', '2014-03-27', '', 'Laporan bimbingan teknis dengan tema Kerjasama Antar Negara sebagai Alternatif Percepatan Pembangunan di Daerah', '', 'D:\\Hasil Scan\\IMG_20140401_0001.jpg'),
(1069, 296, 1076, '555/1662/421.032', 'BAGIAN TATA USAHA', 'NPKND', '2014-03-27', '', 'Laporan hasil tinjau lapangan dalam rangka kesiapan perangkat radio komunikasi Jaring Amarta, kondisi & permasalahannya ', '', 'D:\\Hasil Scan\\IMG_20140401_0001.jpg'),
(1070, 448, 1077, '800/1659/421.021', 'BAGIAN PEREKONOMIAN', 'Surat keluar ', '2014-04-01', '', 'Surat keterangan an. Sri Wahyuni, SE', '', 'D:\\Hasil Scan\\IMG_20140401_0001.jpg'),
(1071, 448, 1078, '800/1658/421.021', 'BAGIAN PEREKONOMIAN', 'Surat keluar ', '2014-04-01', '', 'Surat keterangan an. Hardy Dharmawan P, SE', '', 'D:\\Hasil Scan\\IMG_20140401_0001.jpg'),
(1072, 354, 1079, '660/1652/421.111', 'DINAS CIPTA KARYA & TATA RUANG', 'Surat keluar ', '2014-04-01', '', 'Surat minat kegiatan evaluasi & pemberian penghargaan inovasi manajemen perkotaan (IMP) bidang pelayanan jasa perkotaan th.2014', '', ''),
(1073, 206, 1080, '451/1700/421.042/2014', 'Bagian Bintal', 'Nota dinas', '2014-04-01', '', 'Laporan hasil mengikuti Musabaqoh Tilawatil Qur''an (MTQ) KORPRI Tingkat Prov. Jatim th.2014', '', 'D:\\Hasil Scan\\IMG_20140401_0001.jpg'),
(1074, 206, 1081, 'x.744/1655/421.201/2014', 'INSPEKTORAT', 'Surat keluar', '2014-04-01', '', 'Hasil pemeriksaan Inspektorat Kab. Malang pada Dinas Kesehatan Kab. Malang ', '', 'D:\\Hasil Scan\\IMG_20140401_0001.jpg'),
(1075, 206, 1082, 'x.790/1656/421.201/2014', 'INSPEKTORAT', 'Surat keluar', '2014-04-01', '', 'Hasil pemeriksaan Inspektorat Kab. Malang pada DPPKA Kab. Malang ', '', 'D:\\Hasil Scan\\IMG_20140401_0001.jpg'),
(1076, 206, 1083, 'x.714/1657/421.201/2014', 'INSPEKTORAT', 'Surat keluar ', '2014-04-01', '', 'Hasil pemeriksaan Inspektorat Kab. Malang pada Kec. Kepanjen ', '', 'D:\\Hasil Scan\\IMG_20140401_0001.jpg'),
(1077, 290, 1084, '551.11/1707/421.106/2014', 'DISHUB & KOMINFO', 'Surat keluar ', '2014-03-28', '', 'Data isian kegiatan penghargaan Wahana Tata Nugraha tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140402_0001.jpg'),
(1078, 266, 1085, '521.33/1699/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Nota dinas', '2014-04-01', '', 'Telaah terhadap draft tim verifikasi pupuk bersubsidi tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140402_0001.jpg'),
(1079, 88, 1086, '100/1703/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Nota dinas', '2014-04-01', '', 'Rakor petugas keamanan dari unsur Linmas dalam rangka Pemilu anggota DPR, DPD & DPRD Tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140402_0001.jpg'),
(1080, 448, 1087, '800/1702/421.023/2014', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'Nota dinas', '2014-04-01', '', 'Laporan hasil rakor pelaksanaan penyesuaian (inpassing) jabatan fungsional pengelola pengadaan barang/jasa', '', 'D:\\Hasil Scan\\IMG_20140402_0001.jpg'),
(1081, 266, 1088, '521.33/1693/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Nota dinas ', '2014-04-01', '', 'Telaah terhadap permintaan dukungan pengawalan pelaksanaan kebijakan subsidi pupuk ', '', 'D:\\Hasil Scan\\IMG_20140402_0001.jpg'),
(1082, 261, 1089, '518/1692/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NPKND', '2014-04-01', '', 'Permintaan alokasi Raskin bulan Februari tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140402_0001.jpg'),
(1083, 85, 1090, '094/1694/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NPKND', '2014-04-01', '', 'Permohonan ijin sebagai narasumber pada kegiatan dialog interaktif', '', 'D:\\Hasil Scan\\IMG_20140402_0001.jpg'),
(1084, 350, 1091, '653/1690/421.214/2014', 'KANTOR PERUMAHAN', 'Surat keluar', '2014-04-02', '', 'Lokasi pelaksanaan DAK Bidang perumahan & kawasan permukiman tahun 2014 di Kab. Malang ', '', 'D:\\Hasil Scan\\IMG_20140402_0001.jpg'),
(1085, 436, 1092, '973/1691/421.119/2014', 'DPPKA', 'Surat keluar ', '2014-04-02', '', 'Penanganan SPPT PBB Tahun pajak 2014', '', 'D:\\Hasil Scan\\IMG_20140402_0001.jpg'),
(1086, 88, 1094, '100/1663/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NPKND', '2014-04-02', '', 'Alternatif pelaksanaan kegiatan bina desa di bulan April, Mei & Juni 2014', '', 'D:\\Hasil Scan\\IMG_20140402_0001.jpg'),
(1087, 88, 1095, '100/1708/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NPKND ', '2014-04-02', '', 'Rapat sinkronisasi & fasilitasi kebijakan penyelenggaraan urusan pemda', '', 'D:\\Hasil Scan\\IMG_20140402_0001.jpg'),
(1088, 88, 1096, '100/1709/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NPKND', '2014-04-02', '', 'Pemantauan Pemilu anggota DPR, DPD & DPRD Tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140402_0001.jpg'),
(1089, 88, 1097, '100/1664/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Nota dinas ', '2014-04-02', '', 'Alternatif pelaksanaan kegiatan bina desa di bulan April, Mei & Juni 2014', '', 'D:\\Hasil Scan\\IMG_20140402_0001.jpg'),
(1090, 396, 1098, '848.1/1575/421.202/2014', 'BKD', 'Surat Keluar ', '2014-04-03', '-', 'Ijin Belajar Pegawai Negeri Sipil ', '', ''),
(1091, 396, 1099, '822.4/1576/421.202/2014', 'BKD', 'Surat Keluar ', '2014-04-03', '-', 'Kenaikan Gaji Berkala ', '', ''),
(1092, 396, 1100, '822.4/1577/421.202/2014', 'BKD', 'Surat Keluar ', '2014-04-03', '-', 'Kenaikan Gaji Berkala ', '', ''),
(1093, 396, 1101, '822.4/1578/421.202/2014', 'BKD', 'Surat Keluar ', '2014-04-03', '-', 'Kenaikan Gaji Berkala ', '', ''),
(1094, 383, 1102, '824.4/1579/421.202/2014', 'BKD', 'Surat Keluar ', '2014-04-03', '-', 'Persetujuan Pindah Bekerja ', '', ''),
(1095, 381, 1103, '824.2/1580/421.202/2014', 'BKD', 'Surat Keluar ', '2014-04-03', '-', 'Menghadapkan PNS a.n Sdr. Ika Nur Handayani, A.Md', '', ''),
(1096, 382, 1104, '824.3/1581/421.202/2014', 'BKD', 'Surat Keluar ', '2014-04-03', '-', 'Permohonan Pindah Bekerja ', '', ''),
(1097, 448, 1105, '800/1582/421.202/2014', 'BKD', 'Surat Keluar ', '2014-04-03', '-', 'Penyampaian Berkas Pensiun Janda/Duda dan Kenaikan Pangkat Pengabdian ', '', ''),
(1098, 396, 1106, '848.1/1583/421.202/2014', 'BKD', 'Surat Keluar ', '2014-04-03', '-', 'Ijin Belajar PNS ', '', ''),
(1099, 396, 1107, '848.1/1584/421.202/2014', 'BKD', 'Surat Keluar ', '2014-04-03', '-', 'Ijin Belajar Pegawai Negeri Sipil ', '', ''),
(1100, 396, 1108, '848.1/1585/421.202/2014', 'BKD', 'Surat Keluar ', '2014-04-03', '-', 'Ijin Belajar Pegawai Negeri Sipil ', '', ''),
(1101, 396, 1109, '848.1/1586/421.202/2014', 'BKD', 'Surat Keluar ', '2014-04-03', '-', 'Ijin Belajar Negeri Sipil ', '', ''),
(1102, 396, 1110, '848.1/1587/421.202/2014', 'BKD', 'Surat Keluar ', '2014-04-03', '-', 'Ijin Belajar Pegawai Negeri Sipil ', '', ''),
(1103, 396, 1111, '822.4/1640/421.202/2014', 'BKD', 'Surat Keluar ', '2014-04-03', '-', 'Kenaikan Gajji Berkala ', '', ''),
(1104, 381, 1112, '824.2/1641/421.202/2014', 'BKD', 'Surat Keluar ', '2014-04-03', '-', 'Permohonan Pindah Bekerja', '', ''),
(1105, 382, 1113, '824.3/1642/421.202/2014', 'BKD', 'Surat Keluar ', '2014-04-03', '-', 'Permohonan Pindah Bekerja', '', ''),
(1106, 396, 1114, '848.1/1643/421.202/2014', 'BKD', 'Surat Keluar ', '2014-04-03', '-', 'Ijin Belajar PNS ', '', ''),
(1107, 396, 1115, '848.1/1644/421.202/2014', 'BKD', 'Surat Keluar ', '2014-04-03', '-', 'Ijin  Belajar PNS', '', ''),
(1108, 398, 1116, '851/1645/421.202/2014', 'BKD', 'Surat Keluar ', '2014-04-03', '-', 'Ijin Cuti Tahunan ', '', ''),
(1109, 401, 1117, '854/1646/421.202/2014', 'BKD', 'Surat Keluar', '2014-04-03', '-', 'Ijin Cuti Bersalin ', '', ''),
(1110, 401, 1118, '854/1647/421.202/2014', 'BKD', 'Surat Keluar ', '2014-04-03', '-', 'Ijin Cuti Bersalin ', '', ''),
(1111, 401, 1119, '854/1648/421.202/2014', 'BKD', 'Surat Keluar ', '2014-04-03', '-', 'Ijin Cuti Bersalin ', '', ''),
(1112, 401, 1120, '854/1649/421.202/2014', 'BKD', 'Surat Keluar ', '2014-04-03', '-', 'Ijin Cuti Bersalin ', '', ''),
(1113, 398, 1121, '851/1650/421.202/2014', 'BKD', 'Surat Keluar ', '2014-04-03', '-', 'Ijin Cuti Bersalin ', '', ''),
(1114, 154, 1122, '360/1723/421.216/2014', 'BPBD', 'Surat keluar', '2014-03-27', '', 'Surat pernyataan bencana', '', 'D:\\Hasil Scan\\IMG_20140403_0001.jpg'),
(1115, 278, 1123, '525.24/1717/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Nota dinas', '2014-04-02', '', 'Permohonan untuk memimpin rakor klarifikasi atas permohonan kelengkapan persyaratan rekomendasi teknis dalam rangka penanaman modal di bidang usaha perkebunan dari PT. Duta Plantation Nusantara kepada Pemkab Malang ', '', 'D:\\Hasil Scan\\IMG_20140403_0001.jpg'),
(1116, 280, 1124, '540/1718/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Nota dinas ', '2014-04-02', '', 'Tindaklanjut terhadap penanganan pengaduan warga Desa Sengguruh Kec. Kepanjen', '', 'D:\\Hasil Scan\\IMG_20140403_0001.jpg'),
(1117, 88, 1125, '100/1716/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NPKND', '2014-04-03', '', 'Sosialisasi Pemilu DPR, DPD & DPRD Th.2014', '', 'D:\\Hasil Scan\\IMG_20140403_0001.jpg'),
(1118, 249, 1126, '503/1714/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Nota dinas', '2014-04-02', '', 'Permohonan untuk memimpin rakor membahas permohonan penjelasan & advis penyelesaian perijinan pertambangan dari Direktur Pembinaan Pengusahaan Mineral Dirjen Mineral & Batubara Kementerian ESDM ', '', 'D:\\Hasil Scan\\IMG_20140403_0001.jpg'),
(1119, 249, 1127, '414.56/1689/421.208/2014', 'BADAN PEMBERDAYAAN MASYARAKAT', 'Surat keluar', '2014-04-03', '', 'Surat pernyataan bersedia menerima hibah barang milik negara (BMN)', '', 'D:\\Hasil Scan\\IMG_20140403_0001.jpg'),
(1120, 123, 1128, '188.45/1713/421.040/2014', 'ASISTEN KESEJAHTERAAN RAKYAT', 'Nota dinas ', '2014-03-02', '', 'Penyampaian draft SK Bupati Malang tentang penyelenggara peringatan hari-hari besar di lingkungan Pemkab Malang th.2014', '', 'D:\\Hasil Scan\\IMG_20140403_0001.jpg'),
(1121, 470, 1129, '005/1712/421.032/2014', 'BAGIAN TATA USAHA', 'Surat keluar', '2014-04-02', '', 'Undangan kegiatan parenting skill bagi PNS, Guru & orang tua', '', 'D:\\Hasil Scan\\IMG_20140403_0001.jpg'),
(1122, 470, 1130, '005/1711/421.032/2014', 'BAGIAN TATA USAHA', 'Surat keluar', '2014-04-02', '', 'Undangan rapat badan pengawas PD. Jasa Yasa membahas tindaklanjut SK Bupati Malang tentang pemberhentian sementara Dirut PD. Jasa Yasa ', '', 'D:\\Hasil Scan\\IMG_20140403_0001.jpg'),
(1123, 470, 1131, '005/1710/421.032/2014', 'BAGIAN TATA USAHA', 'Surat keluar ', '2014-04-02', '', 'Undangan rakor petugas operator kecamatan dalam pelaksanaan Pemilu anggota DPR, DPD & DPRD Tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140403_0001.jpg'),
(1124, 470, 1132, '420/1637/421.101/2014', 'DINAS PENDIDIKAN', 'Surat keluar', '2014-03-27', '', 'Usulan pembangunan USB SMKN 1 Wonosari Kab. Malang ', '', 'D:\\Hasil Scan\\IMG_20140403_0001.jpg'),
(1125, 70, 1133, '065/1733/421.032/2014', 'BAGIAN TATA USAHA', 'Nota dinas ', '2014-04-04', '', 'Laporan implementasi ketatausahaan pada Bagian Tata Usaha Setda Kab. Malang tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140404_0001.jpg'),
(1126, 70, 1134, '539/1732/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NPKND', '2014-04-03', '', 'Evaluasi laporan keuangan PD. Jasa Yasa Kab. Malang tahun 2013', '', 'D:\\Hasil Scan\\IMG_20140404_0001.jpg'),
(1127, 85, 1135, '094/1730/421.032/2014', 'BAGIAN TATA USAHA', 'NPKND', '2014-04-03', '', 'Menghadiri high level FGD Pengelolaan keuangan daerah & penajaman analisis fiskal menuju pertumbuhan ekonomi yang mandiri & berkelanjutan', '', 'D:\\Hasil Scan\\IMG_20140404_0001.jpg'),
(1128, 85, 1136, '094/1731/421.032/2014', 'BAGIAN TATA USAHA', 'NPKND', '2014-04-03', '', 'Menghadiri rakor dengan Asisten Ekbang Prov. Jatim tentang sewa lahan pertanian di wilayah Desa Tegalsari & Desa Kedungpedaringan Kec. Kepanjen Kab. Malang untuk kegiatan PENAS Petani & nelayan ke-XIV Tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140404_0001.jpg'),
(1129, 266, 1137, '521.33/1728/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Surat keluar', '2014-04-03', '', 'Pengawalan pelaksanaan kebijakan subsidi pupuk ', '', 'D:\\Hasil Scan\\IMG_20140404_0001.jpg'),
(1130, 424, 1138, '900/1727/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Surat keluar', '2014-04-03', '', 'Penawaran kerjasama dari PT. BRI (Persero) Tbk Cabang Kepanjen ', '', 'D:\\Hasil Scan\\IMG_20140404_0001.jpg'),
(1131, 22, 1139, '010/1725/421.023/2014', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'NPKND', '2014-04-03', '', 'Permintaan untuk menjadi nara sumber', '', 'D:\\Hasil Scan\\IMG_20140404_0001.jpg'),
(1132, 316, 1140, '590/1619/421.014/2014', 'BAGIAN PERTANAHAN', 'Surat keluar', '2014-03-26', '', 'Tindaklanjut tukar menukar kawasan hutan masyarakat Dusun Sukorejo Desa Pondokagung Kab. Malang ', '', 'D:\\Hasil Scan\\IMG_20140407_0001.jpg'),
(1133, 247, 1141, '500/1761/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Nota dinas', '2014-04-04', '', 'Laporan mengikuti undangan high level FGD pengelolaan keuangan daerah & penajaman analisis fiskal menuju pertumbuhan ekonomi yang mandiri & berkelanjutan', '', 'D:\\Hasil Scan\\IMG_20140407_0001.jpg'),
(1134, 85, 1142, '094/1757/421.117/2014', 'DINAS ENERGI & SDM', 'Surat keluar', '2014-04-07', '', 'Surat tugas ', '', 'D:\\Hasil Scan\\IMG_20140407_0001.jpg'),
(1135, 85, 1143, '094/1759/421.032/2014', 'BAGIAN TATA USAHA', 'Surat keluar', '2014-04-07', '', 'Surat tugas', '', 'D:\\Hasil Scan\\IMG_20140407_0001.jpg'),
(1136, 85, 1144, '094/1758/421.117/2014', 'DINAS ENERGI & SDM', 'Surat keluar ', '2014-04-07', '', 'Surat tugas', '', 'D:\\Hasil Scan\\IMG_20140407_0001.jpg'),
(1137, 448, 1145, '800/1753/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Surat keluar', '2014-04-07', '', 'Surat tugas', '', 'D:\\Hasil Scan\\IMG_20140407_0001.jpg'),
(1138, 88, 1146, '100/1752/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Surat keluar', '2014-04-04', '', 'Sosialisasi Pemilu DPR, DPD & DPRD Tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140407_0001.jpg'),
(1139, 448, 1147, '800/1750/421.024/2014', 'BAGIAN PDE', 'Surat keluar', '2014-04-07', '', 'Surat keterangan an. Akhmad Yudha Prasetia, Amd.Kom', '', 'D:\\Hasil Scan\\IMG_20140407_0001.jpg'),
(1140, 133, 1148, '270/1789/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Surat keluar', '2014-04-07', '', 'Penetapan hari pemungutan suara Pemilu anggota DPR, DPD & DPRD Th.2014 sebagai hari libur nasional ', '', 'D:\\Hasil Scan\\IMG_20140408_0032.jpg'),
(1141, 22, 1149, '010/1783/421.023/2014', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'Nota dinas ', '2014-04-07', '', 'Laporan realisasi penyerapan anggaran TA. 2014 Pemkab Malang s/d tri wulan I melalui TEPPA', '', 'D:\\Hasil Scan\\IMG_20140408_0031.jpg'),
(1142, 22, 1150, '010/1782/421.023/2014', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'NPKND', '2014-04-07', '', 'Laporan realisasi penyerapan anggaran TA.2014 Pemkab Malang s/d triwulan I melalui TEPPA', '', 'D:\\Hasil Scan\\IMG_20140408_0030.jpg'),
(1143, 297, 1151, '556/1786/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NPKND', '2014-04-07', '', 'Telaah atas laporan hasil keikutsertaan dalam Internationale Tourismus Borse (ITB) di Berlin - Jerman th.2014', '', 'D:\\Hasil Scan\\IMG_20140408_0029.jpg'),
(1144, 297, 1152, '822.4/1741/421.202/2014', 'BKD', 'Surat keluar ', '2014-04-08', '', 'Kenaikan gaji berkala an. Drs. Nanang Sugianto', '', 'D:\\Hasil Scan\\IMG_20140408_0027.jpg'),
(1145, 297, 1153, '822.4/1742/421.202/2014', 'BKD', 'Surat keluar', '2014-04-08', '', 'Kenaikan gaji berkala an. Raden Ayu Sari Ratih Mala Dewi, SE', '', 'D:\\Hasil Scan\\IMG_20140408_0026.jpg'),
(1146, 297, 1154, '822.4/1743/421.202/2014', 'BKD', 'Surat keluar', '2014-04-08', '', 'Kenaikan gaji berkala an. drg. Dessy Deliyanti', '', 'D:\\Hasil Scan\\IMG_20140408_0025.jpg'),
(1147, 396, 1155, '848.1/1744/421.202/2014', 'BKD', 'Surat keluar', '2014-04-08', '', 'Ijin belajar PNS an. Laily Kurniawati Dewi, SE', '', 'D:\\Hasil Scan\\IMG_20140408_0024.jpg'),
(1148, 396, 1156, '848.1/1745/421.202/2014', 'BKD', 'Surat keluar', '2014-04-08', '', 'Ijin belajar PNS an. Fandi Akhmad Firmansyah', '', 'D:\\Hasil Scan\\IMG_20140408_0023.jpg'),
(1149, 396, 1157, '848.1/1746/421.202/2014', 'BKD', 'Surat keluar', '2014-04-08', '', 'Ijin belajar PNS an. Mochamad Ramli', '', 'D:\\Hasil Scan\\IMG_20140408_0022.jpg'),
(1150, 401, 1158, '854/1747/421.202/2014', 'BKD', 'Surat keluar', '2014-04-08', '', 'Ijin cuti bersalin an. Nurul Khayati, SE', '', 'D:\\Hasil Scan\\IMG_20140408_0021.jpg'),
(1151, 401, 1159, '854/1748/421.202/2014', 'BKD', 'Surat keluar', '2014-04-08', '', 'Ijin cuti bersalin an. Dyah Ayu Nawang Wulan, SE', '', 'D:\\Hasil Scan\\IMG_20140408_0020.jpg'),
(1152, 401, 1160, '822.4/1740/421.202/2014', 'BKD', 'Surat keluar ', '2014-04-08', '', 'Kenaikan gaji berkala an. Mochamad Shonhadji, SH', '', 'D:\\Hasil Scan\\IMG_20140408_0019.jpg'),
(1153, 401, 1161, '822.4/1739/421.202/2014', 'BKD', 'Surat keluar', '2014-04-08', '', 'Kenaikan gaji berkala an. Drs. Eru Suprijambodo, MSi', '', 'D:\\Hasil Scan\\IMG_20140408_0018.jpg'),
(1154, 401, 1162, '822.4/1738/421.202/2014', 'BKD', 'Surat keluar ', '2014-04-08', '', 'Kenaikan gaji berkala an. Drs. Ichwan Machnuni, MSi', '', 'D:\\Hasil Scan\\IMG_20140408_0017.jpg'),
(1155, 401, 1163, '822.4/1737/421.202/2014', 'BKD', 'Surat keluar', '2014-04-08', '', 'Kenaikan gaji berkala an. Ir. Dwi Siswahyudi, MT', '', 'D:\\Hasil Scan\\IMG_20140408_0016.jpg'),
(1156, 401, 1164, '822.4/1736/421.202/2014', 'BKD', 'Surat keluar', '2014-04-08', '', 'Kenaikan gaji berkala an. Ir. R. Taufiq Hidayat', '', 'D:\\Hasil Scan\\IMG_20140408_0015.jpg'),
(1157, 383, 1165, '824.4/1735/421.202/2014', 'BKD', 'Surat keluar', '2014-03-28', '', 'Persetujuan pindah antar instansi an. Dra. Sri Winarti', '', 'D:\\Hasil Scan\\IMG_20140408_0014.jpg'),
(1158, 382, 1166, '824.3/1734/421.202/2014', 'BKD', 'Surat keluar', '2014-03-28', '', 'Persetujuan pindah antar instansi an. Cintia Agustin Puspitasari, SE', '', 'D:\\Hasil Scan\\IMG_20140408_0013.jpg'),
(1159, 321, 1167, '600/1780/421.023/2014', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'Surat keluar', '2014-04-08', '', 'Permintaan untuk menjadi nara sumber', '', 'D:\\Hasil Scan\\IMG_20140408_0012.jpg'),
(1160, 43, 1168, '032/1775/421.119/2014', 'DPPKA', 'Surat keluar ', '2014-04-08', '', 'Surat pernyataan SDN Gubugklakah 1 Poncokusumo', '', 'D:\\Hasil Scan\\IMG_20140408_0011.jpg'),
(1161, 43, 1169, '032/1774/421.119/2014', 'DPPKA', 'Surat keluar', '2014-04-08', '', 'Surat pernyataan SDN Gubugklakah 2 Poncokusumo ', '', 'D:\\Hasil Scan\\IMG_20140408_0010.jpg'),
(1162, 43, 1170, '032/1773/421.119/2014', 'DPPKA', 'Surat keluar', '2014-04-08', '', 'Surat pernyataan SDN Ngadas 1 Poncokusumo', '', 'D:\\Hasil Scan\\IMG_20140408_0009.jpg'),
(1163, 43, 1171, '032/1772/421.119/2014', 'DPPKA', 'Surat keluar', '2014-04-08', '', 'Surat pernyataan SDN Sumberejo 1 Poncokusumo ', '', 'D:\\Hasil Scan\\IMG_20140408_0008.jpg'),
(1164, 43, 1172, '032/1771/421.119/2014', 'DPPKA', 'Surat keluar', '2014-04-08', '', 'Surat pernyataan SDN Dawuhan 4 Poncokusumo', '', 'D:\\Hasil Scan\\IMG_20140408_0007.jpg'),
(1165, 43, 1173, '032/1770/421.119/2014', 'DPPKA', 'Surat keluar', '2014-04-08', '', 'Surat pernyataan SDN Dawuhan 3 Poncokusumo ', '', 'D:\\Hasil Scan\\IMG_20140408_0006.jpg'),
(1166, 43, 1174, '032/1769/421.119/2014', 'DPPKA', 'Surat keluar', '2014-04-08', '', 'Surat pernyataan SDN Sumberejo 3 Poncokusumo ', '', 'D:\\Hasil Scan\\IMG_20140408_0005.jpg'),
(1167, 43, 1175, '032/1768/421.119/2014', 'DPPKA', 'Surat keluar', '2014-04-08', '', 'Surat pernyataan SDN Sumberejo 2 Poncokusumo ', '', 'D:\\Hasil Scan\\IMG_20140408_0004.jpg'),
(1168, 43, 1176, '032/1767/421.119/2014', 'DPPKA', 'Surat keluar', '2014-04-08', '', 'Surat pernyataan SDN Dawuhan 1 Poncokusumo ', '', 'D:\\Hasil Scan\\IMG_20140408_0003.jpg'),
(1169, 43, 1177, '032/1766/421.119/2014', 'DPPKA', 'Surat keluar', '2014-04-08', '', 'Surat pernyataan SDN Ngadas 2 Poncokusumo ', '', 'D:\\Hasil Scan\\IMG_20140408_0002.jpg'),
(1170, 85, 1178, '094/1776/421.051/2014', 'SEKRETARIAT DPRD', 'Surat keluar', '2014-04-08', '', 'Surat tugas', '', 'D:\\Hasil Scan\\IMG_20140408_0001.jpg'),
(1171, 448, 1179, '800/1777/421.210/2014', 'BADAN KELUARGA BERENCANA', 'Surat keluar', '2014-04-07', '', 'Surat tugas', '', 'D:\\Hasil Scan\\IMG_20140408_0001.jpg'),
(1172, 85, 1180, '094/1778/421.216/2014', 'BPBD', 'Surat keluar', '2014-04-07', '', 'Surat tugas', '', 'D:\\Hasil Scan\\IMG_20140408_0001.jpg'),
(1173, 85, 1181, '094/1779/421.216/2014', 'BPBD', 'Surat keluar ', '2014-04-07', '', 'Surat tugas', '', 'D:\\Hasil Scan\\IMG_20140408_0001.jpg'),
(1174, 470, 1182, '005/1790/421.032/2014', 'BAGIAN TATA USAHA', 'Surat Keluar ', '2014-04-08', '-', 'Undangan ', '', 'D:\\Hasil Scan\\IMG_20140408_0001.jpg'),
(1175, 470, 1183, '614/1818/421.110/2014', 'DINAS PENGAIRAN', 'Surat keluar ', '2014-04-10', '', 'Usulan penanganan darurat kerusakan infrastruktur irigasi & sarana air bersih pasca erupsi Gunung Kelud di Kab. Malang ', '', 'D:\\Hasil Scan\\IMG_20140410_0001.jpg'),
(1176, 316, 1184, '590/1788/421.014/2014', 'BAGIAN PERTANAHAN', 'Nota dinas ', '2014-04-08', '', 'Mohon ijin mengikuti diklat tata cara pengadaan tanah berdasarkan UU No. 2 tahun 2012', '', 'D:\\Hasil Scan\\IMG_20140410_0001.jpg'),
(1177, 316, 1186, 'x.742/1802/421.201/2014', 'INSPEKTORAT', 'Surat keluar ', '2014-04-10', '', 'Hasil pemeriksaan Inspektorat Kab. Malang pada UPTD SMPN  2 Jabung Kab. Malang ', '', 'D:\\Hasil Scan\\IMG_20140410_0001.jpg'),
(1178, 316, 1187, 'x.710/1801/421.201/2014', 'INSPEKTORAT', 'Surat keluar ', '2014-04-10', '', 'Hasil pemeriksaan inspektorat Kab. Malang pada Dinas Bina Marga Kab. Malang ', '', 'D:\\Hasil Scan\\IMG_20140410_0001.jpg'),
(1179, 316, 1188, 'x.742/1803/421.201/2014', 'INSPEKTORAT', 'Surat keluar ', '2014-04-10', '', 'Hasil pemeriksaan Inspektorat Kab. Malang pada UPTD SMPN 1 Pujon Kab. Malang ', '', 'D:\\Hasil Scan\\IMG_20140410_0001.jpg'),
(1180, 316, 1189, 'x.765/1804/421.201/2014', 'INSPEKTORAT', 'Surat keluar ', '2014-04-10', '', 'Hasil pemeriksaan Inspektorat Kab. Malang pada Dinas Cipta Karya TR Kab. Malang ', '', 'D:\\Hasil Scan\\IMG_20140410_0001.jpg'),
(1181, 443, 1190, 'x.700/1805/421.201/2014', 'INSPEKTORAT', 'Surat keluar ', '2014-04-10', '', 'Pemberitahuan data perkembangan tindak lanjut hasil pemeriksaan BPKRI di Kab. Malang ', '', 'D:\\Hasil Scan\\IMG_20140410_0001.jpg'),
(1182, 436, 1191, '973/1806/421.119/2014', 'DPPKA', 'Surat keluar', '2014-04-08', '', 'Penyampaian data & informasi sesuai PMK No. 132/PMK.03/ 2013', '', 'D:\\Hasil Scan\\IMG_20140410_0001.jpg'),
(1183, 382, 1192, '824.3/1808/421.031/2014', 'BAGIAN UMUM & PROTOKOL', 'Nota dinas ', '2014-04-08', '', 'Mutasi PNS gol III an. Sri Ratna Agustin, SP dari Pemkab Malang ke Pemkot Malang ', '', 'D:\\Hasil Scan\\IMG_20140410_0001.jpg'),
(1184, 382, 1193, '824.3/1807/421.031/2014', 'BAGIAN UMUM & PROTOKOL', 'NPKND', '2014-04-08', '', 'Permohonan mutasi PNS gol III an. Sri Ratna Agustin, SP dari Pemkab Malang ke Pemkot Malang ', '', 'D:\\Hasil Scan\\IMG_20140410_0001.jpg'),
(1185, 382, 1194, 'x.714/1814/421.201/2014', 'INSPEKTORAT', 'Surat keluar ', '2014-04-08', '', 'Hasil pemeriksaan Inspektorat Kab. Malang pada Kec. Tirtoyudo Kab. Malang ', '', 'D:\\Hasil Scan\\IMG_20140410_0001.jpg'),
(1186, 382, 1195, 'x.761/1813/421.201/2014', 'INSPEKTORAT', 'Surat keluar ', '2014-04-08', '', 'Hasil pemeriksaan Inspektorat Kab. Malang pada Dinas Pengairan Kab. Malang ', '', 'D:\\Hasil Scan\\IMG_20140410_0001.jpg'),
(1187, 382, 1196, 'x.742/1812/421.201/2014', 'INSPEKTORAT', 'Surat keluar ', '2014-04-08', '', 'Hasil pemeriksaan Inspektorat Kab. Malang pada UPTD SMPN 2 Pagak Kab. Malang ', '', 'D:\\Hasil Scan\\IMG_20140410_0001.jpg'),
(1188, 470, 1197, '005/1817/421.032/2014', 'BAGIAN TATA USAHA', 'Nota dinas ', '2014-04-08', '', 'Permohonan memimpin rakor membahas penetapan tambahan penghasilan / beban kerja ', '', 'D:\\Hasil Scan\\IMG_20140410_0001.jpg'),
(1189, 470, 1198, 'x.539/1815/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NPKND', '2014-04-10', '', 'Laporan Badan Pengawas PD. Jasa Yasa terkait tindak lanjut SK Bupati Malang No. 188.45/193/KEP/421.013/2014 tentang pemberhentian sementara Dirut PD. Jasa Yasa Kab. Malang ', '', 'D:\\Hasil Scan\\IMG_20140410_0001.jpg'),
(1190, 470, 1199, 'x.539/1816/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Nota dinas ', '2014-04-10', '', 'Laporan badan pengawas PD. Jasa Yasa terkait tindak lanjut SK Bupati Malang No. 188.45/196/KEP/421.013/2014 tentang pemberhentian sementara Ditur PD. Jasa Yasa Kab. Malang ', '', 'D:\\Hasil Scan\\IMG_20140410_0001.jpg'),
(1191, 85, 1200, '094/1810/421.111/2014', 'DINAS CIPTA KARYA & TATA RUANG', 'Surat keluar ', '2014-04-10', '', 'Surat tugas', '', 'D:\\Hasil Scan\\IMG_20140410_0001.jpg'),
(1192, 85, 1201, '094/1811/421.051/2014', 'SEKRETARIAT DPRD', 'Surat keluar ', '2014-04-10', '', 'Surat tugas', '', 'D:\\Hasil Scan\\IMG_20140410_0001.jpg'),
(1193, 85, 1202, '905/1809/421.210/2014', 'BADAN KELUARGA BERENCANA', 'Surat keluar ', '2014-04-10', '', 'Perubahan alokasi / distribusi penggunaan DAK bidang KB Tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140410_0001.jpg'),
(1194, 321, 1203, '600/1785/421.109/2014', 'DINAS BINA MARGA', 'Surat keluar ', '2014-04-07', '', 'Permohonan bantuan keuangan bidang kebinamargaan Prov. Jatim TA.2014 (perubahan) ', '', 'D:\\Hasil Scan\\IMG_20140410_0001.jpg'),
(1195, 278, 1204, '525.24/1784/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Surat keluar ', '2014-04-07', '', 'Kelengkapan persyaratan rekomendasi teknis dalam rangka penanaman modal di bidang usaha perkebunan', '', 'D:\\Hasil Scan\\IMG_20140410_0001.jpg'),
(1196, 133, 1205, '270/1781/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NPKND ', '2014-04-07', '', 'Penetapan hari pemungutan suara Pemilu anggota DPR, DPD & DPRD Tahun  2014 sebagai hari libur nasional ', '', 'D:\\Hasil Scan\\IMG_20140410_0001.jpg'),
(1197, 133, 1206, '119/1765/421.022/2014', 'BAGIAN KERJASAMA', 'Nota dinas ', '2014-04-07', '', 'Penyelesaian masa penggunaan kantor milik Pemkab Malang oleh program BIRU HIVOS ROSEA ', '', 'D:\\Hasil Scan\\IMG_20140410_0001.jpg'),
(1198, 448, 1207, '800/1764/421.022/2014', 'BAGIAN KERJASAMA', 'Nota dinas ', '2014-04-07', '', 'Permohonan penerbitan SK uang duka & laporan kematian PNS an. Dra. Liestuhayu Kusumawardani ', '', 'D:\\Hasil Scan\\IMG_20140410_0001.jpg'),
(1199, 448, 1208, '800/1787/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Surat keluar ', '2014-04-07', '', 'Surat tugas ', '', 'D:\\Hasil Scan\\IMG_20140410_0001.jpg'),
(1200, 448, 1209, '800/1788/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Surat keluar ', '2014-04-07', '', 'Surat tugas ', '', 'D:\\Hasil Scan\\IMG_20140410_0001.jpg'),
(1201, 470, 1210, '005/1824/421.032/2014', 'BAGIAN TATA USAHA', 'Surat keluar ', '2014-04-10', '', 'Undangan rakor membahas materi workshop & deklarasi koalisi untuk advokasi & transparansi (KUAT) anggaran Kab. Malang ', '', 'D:\\Hasil Scan\\IMG_20140411_0001.jpg'),
(1202, 316, 1211, '590/1831/421.014/2014', 'BAGIAN PERTANAHAN', 'Nota dinas ', '2014-04-10', '', 'Mohon ijin mengikuti diklat tata cara pengadaan tanah berdasarkan UU No.2 tahun 2012', '', 'D:\\Hasil Scan\\IMG_20140411_0001.jpg'),
(1203, 316, 1212, '590/1829/421.014/2014', 'BAGIAN PERTANAHAN', 'Nota dinas ', '2014-04-10', '', 'Rencana koordinasi tindaklanjut pengadaan tanah untuk kompensasi kawasan hutan yang digunakan untuk pembangunana JLS di Kab. Bondowoso ', '', 'D:\\Hasil Scan\\IMG_20140411_0001.jpg'),
(1204, 280, 1213, '540/1822/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Nota dinas ', '2014-04-10', '', 'Tindak lanjut penjelasan & advis penyelesaian permasalahan perijinan pertambangan direktur pembinaan pengusahaan mineral, dirjen mineral & batu bara, Kementerian ESDM ', '', 'D:\\Hasil Scan\\IMG_20140411_0001.jpg'),
(1205, 280, 1214, '540/1821/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NPKND ', '2014-04-10', '', 'Tindak lanjut penjelasan & advis penyelesaian permasalahan perijinan pertambangan direktur pembinaan pengusahaan mineral, dirjen mineral & batu bara, Kementerian ESDM ', '', 'D:\\Hasil Scan\\IMG_20140411_0001.jpg'),
(1206, 470, 1215, '005/1817/421.032/2014', 'BAGIAN TATA USAHA', 'Nota dinas ', '2014-04-08', '', 'Permohonan memimpin rakor membahas penetapan tambahan penghasilan / beban kerja ', '', 'D:\\Hasil Scan\\IMG_20140411_0001.jpg'),
(1207, 88, 1216, '100/1859/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NPKND', '2014-04-14', '', 'Laporan sementara perolehan suara pada Pemilu 2014', '', 'D:\\Hasil Scan\\IMG_20140415_0001.jpg'),
(1208, 88, 1217, '100/1860/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Nota dinas ', '2014-04-14', '', 'Laporan sementara perolehan suara pada Pemilu 2014', '', 'D:\\Hasil Scan\\IMG_20140415_0001.jpg'),
(1209, 63, 1218, '050/1861/421.214/2014', 'KANTOR PERUMAHAN', 'NPKND', '2014-04-14', '', 'Rekomendasi rencana pembangunan rumah susun sewa Ponpes Mambaul Ulum Ds. Bantur Kec. Bantur ', '', 'D:\\Hasil Scan\\IMG_20140415_0001.jpg'),
(1210, 316, 1219, '590/1858/421.014/2014', 'BAGIAN PERTANAHAN', 'NPKND', '2014-04-14', '', 'Data Tanah Kas Desa (TKD) untuk pembangunan jalan tol di Kab. Malang ', '', 'D:\\Hasil Scan\\IMG_20140415_0001.jpg'),
(1211, 316, 1220, '119/1856/421.022/2014', 'BAGIAN KERJASAMA', 'Nota dinas ', '2014-04-14', '', 'Laporan rencana penandatanganan kesepakatan bersama antara Pemkab Malang dengan PT. Telkom Indonesia Tbk ', '', 'D:\\Hasil Scan\\IMG_20140415_0001.jpg'),
(1212, 22, 1221, '010/1855/421.023/2014', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'NPKND', '2014-04-14', '', 'Rakor pembangunan jalan alternatif di Bendungan Selorejo Kec. Ngantang Kab. Malang ', '', 'D:\\Hasil Scan\\IMG_20140415_0001.jpg'),
(1213, 85, 1222, '094/1840/421.033/2014', 'BAGIAN HUMAS', 'Surat keluar ', '2014-04-15', '', 'Surat tugas ', '', 'D:\\Hasil Scan\\IMG_20140415_0001.jpg'),
(1214, 448, 1223, '800/1851/421.103/2014', 'DINAS KESEHATAN', 'Surat keluar ', '2014-04-14', '', 'Surat tugas ', '', 'D:\\Hasil Scan\\IMG_20140415_0001.jpg'),
(1215, 70, 1224, '065/1848/421.032/2014', 'BAGIAN TATA USAHA', 'Surat keluar ', '2014-04-14', '', 'Penyampaian laporan ketatausahaan pimpinan Pemda', '', 'D:\\Hasil Scan\\IMG_20140415_0001.jpg'),
(1216, 224, 1225, '468/1844/421.041/2014', 'BAGIAN KESRA', 'NPKND', '2014-04-11', '', 'Permohonan ijin pelaksanaan bulan dana PMI tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140415_0001.jpg'),
(1217, 224, 1226, '468/1845/421.041/2014', 'BAGIAN KESRA', 'Telaah staf ', '2014-04-11', '', 'Telaah staf tentang permohonan ijin pelaksanaan bulan dana PMI tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140415_0001.jpg'),
(1218, 22, 1227, '010/1854/421.023/2014', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'Nota dinas ', '2014-04-15', '', 'Laporan rencana kegiatan peningkatan kapasitas SDM Pokja ULP & Pokja LPSE Kab. Malang ', '', 'D:\\Hasil Scan\\IMG_20140415_0001.jpg'),
(1219, 22, 1228, '552.4/1850/421.111/2014', 'DINAS CIPTA KARYA & TATA RUANG', 'Surat keluar ', '2014-04-14', '', 'Usulan pejabat inti satker satuan non vertikal tertentu Program Pengembangan Kota Hijau (PKH) TA. 2014 Kab. Malang ', '', 'D:\\Hasil Scan\\IMG_20140415_0001.jpg'),
(1220, 470, 1229, '005/1870/421.032/2014', 'BAGIAN TATA USAHA', 'Surat keluar ', '2014-04-15', '', 'Undangan kunker Menteri Pertanian dalam rangka meninjau lokasi pertanian yang terkena erupsi Gunung Kelud', '', 'D:\\Hasil Scan\\IMG_20140416_0001.jpg'),
(1221, 280, 1230, '540/1871/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Surat keluar ', '2014-04-15', '', 'Surat pengantar ', '', 'D:\\Hasil Scan\\IMG_20140416_0001.jpg'),
(1222, 316, 1231, '590/1869/421.014/2014', 'BAGIAN PERTANAHAN', 'Nota dinas ', '2014-04-15', '', 'Telaah staf permasalahan tanah yang diatasnya berdiri bangunan Kantor Puskesmas & KUA Desa Ngajum Kec. Ngajum yang di klaim oleh ahli waris Alm. Munawar P Warsini ', '', 'D:\\Hasil Scan\\IMG_20140416_0001.jpg'),
(1223, 43, 1232, '032/1866/421.119/2014', 'DPPKA', 'Surat keluar ', '2014-04-15', '', 'Permohonan nomor rahasia / khusus ', '', 'D:\\Hasil Scan\\IMG_20140416_0001.jpg');
INSERT INTO `surat_keluar` (`id`, `index_surat_id`, `no_urut`, `no_surat`, `pengolah`, `tujuan`, `tanggal_surat`, `lampiran`, `perihal`, `catatan`, `file_surat`) VALUES
(1224, 284, 1233, '545/1868/421.117/2014', 'DINAS ENERGI & SDM', 'Surat keluar ', '2014-04-15', '', 'Permohonan hibah pemboran air tanah & sarana air bersih ', '', 'D:\\Hasil Scan\\IMG_20140416_0001.jpg'),
(1225, 284, 1234, '545/1867/421.117/2014', 'DINAS ENERGI & SDM', 'Surat keluar ', '2014-04-15', '', 'Ijin pengeboran air tanah ', '', 'D:\\Hasil Scan\\IMG_20140416_0001.jpg'),
(1226, 280, 1235, '540/1865/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Surat keluar ', '2014-04-15', '', 'Tindaklanjut pengaduan warga Desa Sengguruh Kec. Kepanjen ', '', 'D:\\Hasil Scan\\IMG_20140416_0001.jpg'),
(1227, 448, 1236, '800/1863/421.032/2014', 'BAGIAN TATA USAHA', 'Surat keluar ', '2014-04-16', '', 'Disiplin PNS (pelaksanaan apel pagi) ', '', 'D:\\Hasil Scan\\IMG_20140416_0001.jpg'),
(1228, 63, 1237, '050/1861/421.023/2014', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'Nota dinas ', '2014-04-15', '', 'Laporan kegiatan sosialisasi partisipasi masyarakat dalam pengelolaan anggaran daerah ', '', 'D:\\Hasil Scan\\IMG_20140416_0001.jpg'),
(1229, 88, 1238, '100/1888/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NPKND', '2014-04-16', '', 'Perbaikan proses politik yang beretika politik bagai aparatur & masyarakat ', '', ''),
(1230, 101, 1239, '141/1887/421.012/2014', 'BAGIAN TATA PEMERINTAHAN DESA', 'Surat keluar ', '2014-04-16', '', 'Permintaan data tanah kas desa (TKD) ', '', ''),
(1231, 154, 1240, '360/1886/421.041/2014', 'BAGIAN KESRA', 'NPKND', '2014-04-16', '', 'Laporan hasil rakor membahas manajemen penanggulangan bencana di Kab. Malang ', '', ''),
(1232, 154, 1241, '539/1884/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Surat keluar ', '2014-04-16', '', 'Evaluasi laporan keuangan PD. Jasa Yasa tahun 2013 (unaudited)', '', ''),
(1233, 316, 1242, '590/1883/421.014/2014', 'BAGIAN PERTANAHAN', 'Surat keluar ', '2014-04-16', '', 'Data tanah kas dea (TKD) untuk pembangunan jalan tol di Kab. Malang ', '', ''),
(1234, 316, 1243, '590/1882/P2T/421.014/2014', 'Bagian Pertanahan ', 'Surat keluar ', '2014-04-16', '', 'Perubahan personil P2T & Satgas P2T', '', ''),
(1235, 316, 1244, 'x.761/1875/421.201/2014', 'INSPEKTORAT', 'Surat keluar ', '2014-04-15', '', 'Hasil pemeriksaan Inspektorat Kab. Malang pada Dinas Pengairan Kab. Malang', '', ''),
(1236, 316, 1245, 'x.742/1872/421.201/2014', 'INSPEKTORAT', 'Surat keluar ', '2014-04-15', '', 'Hasil pemeriksaan Inspektorat Kab. Malang pada UPTD SMPN 2 Jabung Kab. Malang ', '', ''),
(1237, 316, 1246, 'x.714/1874/421.201/2014', 'INSPEKTORAT', 'Surat keluar ', '2014-04-15', '', 'Hasil pemeriksaan Inspektorat Kab. Malang pada Kec. Tirtoyudo Kab. Malang ', '', ''),
(1238, 316, 1247, 'x.742/1873/421.201/2014', 'INSPEKTORAT', 'Surat keluar ', '2014-04-15', '', 'Hasil pemeriksaan Inspektorat Kab. Malang pada UPTD SMPN 2 Pagak Kab. Malang ', '', ''),
(1239, 316, 1248, 'x.764/1876/421.201/2014', 'INSPEKTORAT', 'Surat keluar ', '2014-04-15', '', 'Penegasan atas hasil evaluasi akuntabilitas kinerja BPM Kab. Malang tahun 2012', '', ''),
(1240, 88, 1249, '100/1877/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Nota dinas ', '2014-04-15', '', 'Penerimaan kunker Pemkab Pelalawan Prov. Riau ', '', ''),
(1241, 167, 1250, '400/1936/421.041/2014', 'BAGIAN KESRA', 'NPKND', '2014-04-21', '', 'Telaah permohonan bantuan kesejahteraan sosial untuk Jama''ah Diba'' Akbar Bumi Sholawat Ds. Sumberejo Kec. Pagak ', '', 'D:\\Hasil Scan\\IMG_20140422_0013.jpg'),
(1242, 167, 1251, '400/1935/421.041/2014', 'BAGIAN KESRA', 'NPKND ', '2014-04-21', '', 'Telaah permohonan bantuan kesejahteraan sosial untuk kegiatan launching & bedah majalah Pentara News (Pena Nusantara News)', '', 'D:\\Hasil Scan\\IMG_20140422_0012.jpg'),
(1243, 167, 1252, '400/1934/421.041/2014', 'BAGIAN KESRA', 'NPKND ', '2014-04-21', '', 'Telaah staf tentang permohonan bantuan biaya pendidikan ', '', 'D:\\Hasil Scan\\IMG_20140422_0011.jpg'),
(1244, 167, 1253, '400/1933/421.041/2014', 'BAGIAN KESRA', 'NPKND ', '2014-04-21', '', 'Rencana pelaksanaan kegiatan penyiapan kerja bagi anak yatim melalui bimbingan motivasi & pelatihan pengurus panti asuhan di Kab. Malang ', '', 'D:\\Hasil Scan\\IMG_20140422_0010.jpg'),
(1245, 88, 1254, '100/1936/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Nota dinas ', '2014-04-22', '', 'Penerimaan kunker Pemkab Buleleng Prov. Bali ', '', 'D:\\Hasil Scan\\IMG_20140422_0009.jpg'),
(1246, 88, 1255, '100/1900/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NPKND ', '2014-04-21', '', 'Laporan hasil akhir penghitungan perolehan suara sementara Pemilu legislatif th.2014', '', 'D:\\Hasil Scan\\IMG_20140422_0008.jpg'),
(1247, 88, 1256, '100/1901/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Nota dinas ', '2014-04-21', '', 'Laporan hasil akhir penghitungan perolehan suara sementara Pemilu legislatif th.2014', '', 'D:\\Hasil Scan\\IMG_20140422_0007.jpg'),
(1248, 23, 1257, '011/1935/421.024/2014', 'BAGIAN PDE', 'Surat keluar ', '2014-04-21', '', 'Pemasangan perangkat kipas exhaust', '', 'D:\\Hasil Scan\\IMG_20140422_0007.jpg'),
(1249, 88, 1258, '100/1902/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Nota dinas ', '2014-04-21', '', 'Penerimaan kunker Pemkab Bengkulu Utara Prov. Bengkulu ', '', 'D:\\Hasil Scan\\IMG_20140422_0016.jpg'),
(1250, 167, 1259, '400/1933/421.041/2014', 'BAGIAN KESRA', 'Telaah staf ', '2014-04-21', '', 'Telaah permohonan bantuan kesejahteraan sosial untuk kegiatan launching & bedah majalah Pentara News (Pena Nusantara News) ', '', 'D:\\Hasil Scan\\IMG_20140422_0015.jpg'),
(1251, 448, 1260, '800/1934/421.041/2014', 'BAGIAN KESRA', 'Surat keluar ', '2014-04-21', '', 'Surat perintah tugas an. Ir. R. Taufiq Hidayat', '', 'D:\\Hasil Scan\\IMG_20140422_0014.jpg'),
(1252, 22, 1261, '010/1932/421.023/2014', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'NPKND ', '2014-04-21', '', 'Telaah laporan hasil pembangunan bidang kepariwisataan di Dinas Kebudayaan & Pariwisata TA.2013', '', 'D:\\Hasil Scan\\IMG_20140422_0013.jpg'),
(1253, 316, 1262, '590/1929/421.014/2014', 'BAGIAN PERTANAHAN', 'Nota dinas ', '2014-04-21', '', 'Laporan hasil pensertipikatan tanah asset Pemkab Malang TA.2013', '', 'D:\\Hasil Scan\\IMG_20140422_0012.jpg'),
(1254, 63, 1263, '050/1922/421.023/2014', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'Nota dinas ', '2014-04-17', '', 'Laporan kegiatan technical asistance penguatan kelompok kerja (Pokja) ULP/LPSE Kab. Malang ', '', 'D:\\Hasil Scan\\IMG_20140422_0011.jpg'),
(1255, 428, 1264, '910/1921/421.023/2014', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'NPKND ', '2014-04-21', '', 'Percepatan realisasi penyerapan anggaran TA.2014', '', 'D:\\Hasil Scan\\IMG_20140422_0010.jpg'),
(1256, 428, 1265, 'x.742/1891/421.201/2014', 'INSPEKTORAT', 'Surat keluar ', '2014-04-17', '', 'Hasil pemeriksaan Inspektorat Kab. Malang pada UPTD SMPN 3 Singosari Kab. Malang ', '', 'D:\\Hasil Scan\\IMG_20140422_0009.jpg'),
(1257, 85, 1266, '094/1836/421.014/2014', 'BAGIAN PERTANAHAN', 'Surat keluar  ', '2014-04-22', '', 'Surat tugas an. Drs. Mardiyanto', '', 'D:\\Hasil Scan\\IMG_20140422_0008.jpg'),
(1258, 316, 1267, '590/1837/421.014/2014', 'BAGIAN PERTANAHAN', 'Surat keluar ', '2014-04-22', '', 'Permohonan bantuan pelaksanaan pengukuran tanah ', '', 'D:\\Hasil Scan\\IMG_20140422_0007.jpg'),
(1259, 63, 1268, '050/1900/421.214/2014', 'KANTOR PERUMAHAN', 'NPKND ', '2014-04-17', '', 'Rekomendasi rencana pembangunan rumah susun sewa asrama pendidikan yayasan Ponpes Modern Al Rifa''ie Ds. Ketawang Kec. Gondanglegi ', '', 'D:\\Hasil Scan\\IMG_20140422_0016.jpg'),
(1260, 255, 1269, '511/1895/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Surat keluar ', '2014-04-17', '', 'Dukungan & partisipasi pameran potensi & peluang investasi daerah 2014 dalam rangka MTQ Nasional XXV Expo 2014', '', 'D:\\Hasil Scan\\IMG_20140422_0015.jpg'),
(1261, 278, 1270, '525.24/1894/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Nota dinas ', '2014-04-17', '', 'Perubahan waktu rakor klarifikasi atas permohonan kelengkapan persyaratan rekomendasi teknis dalam rangka penanaman modal di bidang usaha perkebunan dari PT. Duta Plantation Nusantara kepada Pemkab Malang ', '', 'D:\\Hasil Scan\\IMG_20140422_0014.jpg'),
(1262, 167, 1271, '400/1893/421.041/2014', 'BAGIAN KESRA', 'NPKND ', '2014-04-17', '', 'Telaah permohonan bantuan kesejahteraan sosial untuk sarana & prasarana Ponpes & rehabilitasi mental Az Zainy Kec. Tumpang ', '', 'D:\\Hasil Scan\\IMG_20140422_0007.jpg'),
(1263, 85, 1272, '094/1721/421.032/2014', 'BAGIAN TATA USAHA', 'NPKND', '2014-04-03', '', 'Menghadiri rakor dengan Asisten Ekbang Prov. Jatim tentang sewa lahan pertanian di wilayah Ds. tegalsari & Ds. Kedungpedaringan Kec. Kepanjen Kab. Malang untuk kegiatan PENAS Petani & nelayan ke-XIV Tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140422_0013.jpg'),
(1264, 36, 1273, '024/1892/421.032/2014', 'BAGIAN TATA USAHA', 'Surat keluar ', '2014-04-17', '', 'Permintaan kendaraan dinas roda 2 bagi adc asisten & staf kurir Bag TU Setda Kab. Malang ', '', 'D:\\Hasil Scan\\IMG_20140422_0012.jpg'),
(1265, 470, 1274, '005/1885/421.032/2014', 'BAGIAN TATA USAHA', 'Surat keluar ', '2014-04-16', '', 'Undangan kunker Pemkab Pelalawan Prov. Riau ', '', 'D:\\Hasil Scan\\IMG_20140422_0011.jpg'),
(1266, 470, 1275, '005/1889/421.032/2014', 'BAGIAN TATA USAHA', 'Surat keluar ', '2014-04-17', '', 'Undangan rakor tim seleksi peserta diklat instansional ', '', 'D:\\Hasil Scan\\IMG_20140422_0010.jpg'),
(1267, 190, 1276, '431/1878/421.010/2014', 'ASISTEN ADMINISTRASI', 'NPKND', '2014-04-15', '', 'Rencana koordinasi tindak lanjut pengadaan tanah untuk kompensasi kawasan hutan yang digunakan untuk pembangunan JLS di Kab. Bondowoso', '', 'D:\\Hasil Scan\\IMG_20140422_0009.jpg'),
(1268, 88, 1277, '100/1880/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NPKND', '2014-04-16', '', 'Alternatif pelaksanaan kegiatan bina desa bulan April 2014', '', 'D:\\Hasil Scan\\IMG_20140422_0008.jpg'),
(1269, 88, 1278, '100/1881/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Nota dinas ', '2014-04-16', '', 'Alternatif pelaksanaan kegiatan bina desa bulan april 2014', '', 'D:\\Hasil Scan\\IMG_20140422_0007.jpg'),
(1270, 448, 1279, '800/1835/421.202/2014', 'BKD', 'Surat keluar ', '2014-04-14', '', 'Pengisian & penyampaian laporan pajak-pajak pribadi (LP2P) Tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140422_0007.jpg'),
(1271, 448, 1280, '821.4/1791/421.202/2014', 'BKD', 'Surat keluar ', '2014-04-08', '', 'Pengangkatan dalam jabatan fungsional dokter utama & dokter gigi utama', '', 'D:\\Hasil Scan\\IMG_20140422_0005.jpg'),
(1272, 396, 1281, '848.1/1792/421.202/2014', 'BKD', 'Surat keluar ', '2014-04-22', '', 'Surat ijin Bupati tentang Ijin Belajar PNS an. Dherrys Tri Octaviani, SKom ', '', 'D:\\Hasil Scan\\IMG_20140422_0005.jpg'),
(1273, 381, 1282, '824.2/1793/421.202/2014', 'BKD', 'Surat keluar ', '2014-04-08', '', 'Persetujuan pindah antar instansi an. Ariana Kusuma Wardhani, Ama', '', 'D:\\Hasil Scan\\IMG_20140422_0004.jpg'),
(1274, 381, 1283, '824.2/1794/421.202/2014', 'BKD', 'Surat keluar ', '2014-04-08', '', 'Persetujuan pindah antar instansi an. Rika Dwi Rahayu, Ama', '', 'D:\\Hasil Scan\\IMG_20140422_0003.jpg'),
(1275, 382, 1284, '824.3/1795/421.202/2014', 'BKD', 'Surat keluar ', '2014-03-28', '', 'Permohonan pindah bekerja an. Endri Rosita Sari, ST ', '', 'D:\\Hasil Scan\\IMG_20140422_0002.jpg'),
(1276, 448, 1285, '800/1796/421.202/2014', 'BKD', 'Surat keluar ', '2014-04-22', '', 'Surat perintah kepada Yudhi Hindharto, ST, MSi ', '', 'D:\\Hasil Scan\\IMG_20140422_0001.jpg'),
(1277, 448, 1286, '800/1797/421.202/2014', 'BKD', 'Surat keluar ', '2014-04-08', '', 'Surat pernyataan tidak pernah dijatuhi hukuman disiplin an. Tridiyah Maistuti, SH, MSi ', '', 'D:\\Hasil Scan\\IMG_20140422_0001.jpg'),
(1278, 448, 1287, '800/1798/421.202/2014', 'BKD', 'Surat keluar ', '2014-04-08', '', 'Surat pernyataan tidak pernah dijatuhi hukuman disiplin an. Drs. Kukuh Banendro ', '', 'D:\\Hasil Scan\\IMG_20140422_0001.jpg'),
(1279, 398, 1288, '851/1799/421.202/2014', 'BKD', 'Surat keluar ', '2014-04-22', '', 'Surat ijin Bupati tentang Ijin cuti tahunan an. Dra. Dewi Kartikawati, MSi ', '', 'D:\\Hasil Scan\\IMG_20140422_0001.jpg'),
(1280, 398, 1289, '851/1800/421.202/2014', 'BKD', 'Surat keluar ', '2014-04-22', '', 'Surat ijin Bupati tentang ijin cuti tahunan an. dr. Benidiktus Setyo Untoro', '', 'D:\\Hasil Scan\\IMG_20140422_0001.jpg'),
(1281, 398, 1290, '539/1952/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Nota dinas ', '2014-04-22', '', 'Laporan rencana pelaksanaan rakor tindak lanjut hasil audit BPKP RI atas kinerja PDAM Kab. Malang tahun buku 2012', '', 'D:\\Hasil Scan\\IMG_20140423_0004.jpg'),
(1282, 85, 1291, '094/1950/421.207/2014', 'BADAN KETAHANAN PANGAN & PP', 'Surat keluar ', '2014-04-22', '', 'Surat tugas an. Ir. M. Nasri Abd. Wahid, M.Eng.Sc', '', 'D:\\Hasil Scan\\IMG_20140423_0003.jpg'),
(1283, 448, 1292, '800/1948/421.215/2014', 'RSUD KANJURUHAN', 'Surat keluar ', '2014-04-22', '', 'Surat tugas an. dr. Harry Hartanto, MM', '', 'D:\\Hasil Scan\\IMG_20140423_0001.jpg'),
(1284, 470, 1293, '005/1947/421.032/2014', 'BAGIAN TATA USAHA', 'Surat keluar ', '2014-04-22', '', 'Undangan penandatanganan kesepakatan bersama antara Pemkab Malang dengan PT. Telkom Ind Tbk', '', 'D:\\Hasil Scan\\IMG_20140423_0005.jpg'),
(1285, 448, 1294, '800/1944/421.103/2014', 'DINAS KESEHATAN', 'Surat keluar', '2014-04-23', '', 'Surat tugas an. Dra. Mursyidah, Apt.M.Kes', '', 'D:\\Hasil Scan\\IMG_20140423_0002.jpg'),
(1286, 448, 1295, '800/1946/421.041/2014', 'BAGIAN KESRA', 'Nota dinas', '2014-04-22', '', 'Permohonan ijin untuk melaksanakan koordinasi dengan Kementerian Koordinator bidang Kesra RI tentang program & kegiatan yang dapat dilaksanakan di Kab. Malang TA.2014 & 2015', '', ''),
(1287, 321, 1296, '600/1945/421.023/2014', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'NPKND', '2014-04-22', '', 'Hasil rakor pembangunan jalan alternatif di Bendungan Selorejo Kec. Ngantang Kab. Malang ', '', 'D:\\Hasil Scan\\IMG_20140423_0003.jpg'),
(1288, 280, 1297, '540/1941/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Surat keluar', '2014-04-22', '', 'Tindak lanjut penjelasan & advis penyelesaian permasalahan perijinan pertambangan ', '', 'D:\\Hasil Scan\\IMG_20140423_0002.jpg'),
(1289, 255, 1298, '511/1943/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Surat keluar ', '2014-04-22', '', 'Pameran Batam Agribusiness Matching & Expo 2014', '', 'D:\\Hasil Scan\\IMG_20140423_0001.jpg'),
(1290, 266, 1299, '521.33/1942/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Surat pengantar', '2014-04-22', '', 'Salinan surat dari Ketua Umum Jaringan Petani Pembuat & Pemakai Pupuk Organik (JP4O) Jatim ', '', 'D:\\Hasil Scan\\IMG_20140423_0002.jpg'),
(1291, 256, 1300, '511.1/1940/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Surat keluar ', '2014-04-22', '', 'Permintaan alokasi Raskin bulan November tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140423_0003.jpg'),
(1292, 123, 1301, '188.45/1937/KEP/421.119/2014', 'DPPKA', 'Surat keluar ', '2014-04-23', '', 'SK Sekda selaku pengelola barang milik daerah Kab. Malang tentang pejabat pengurus & penyimpan barang milik Pemkab Malang ', '', 'D:\\Hasil Scan\\IMG_20140423_0005.jpg'),
(1293, 85, 1302, '094/1939/421.205/2014', 'BAKESBANGPOL', 'Surat keluar ', '2014-04-23', '', 'Surat tugas an. Drs. Kukuh Banendro', '', 'D:\\Hasil Scan\\IMG_20140423_0004.jpg'),
(1294, 167, 1303, '400/1946/421.041/2014', 'BAGIAN KESRA', 'Nota dinas', '2014-04-22', '', 'Permohonan ijin untuk melaksanakan koordinasi dengan Kementerian Koordinator Bidang Kesejahteraan Rakyat RI tentang program & kegiatan yang dapat dilaksanakan di Kab. Malang TA.2014 & 2015', '', 'D:\\Hasil Scan\\IMG_20140423_0004.jpg'),
(1295, 256, 1304, '511.1/1975/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Nota dinas ', '2014-04-23', '', 'Laporan pelaksanaan pendistribusian raskin alokasi bulan januari & februari tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140424_0004.jpg'),
(1296, 256, 1305, '511.1/1974/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NPKND', '2014-04-23', '', 'Laporan pelaksanaan pendistribusian Raskin alokasi bulan Januari & Februari tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140424_0003.jpg'),
(1297, 256, 1306, '539/1973/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NPKND', '2014-04-23', '', 'Laporan pelaksanaan program Raskin triwulan I tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140424_0002.jpg'),
(1298, 256, 1307, '119/1971/421.022/2014', 'BAGIAN KERJASAMA', 'NPKND', '2014-04-23', '', 'Rencana pelaksanaan penandatanganan kesepakatan bersama antara Pemkab Malang dengan PT. Telkom Indonesia Tbk', '', 'D:\\Hasil Scan\\IMG_20140424_0005.jpg'),
(1299, 256, 1308, '119/1972/421.022/2014', 'BAGIAN KERJASAMA', 'Nota dinas ', '2014-04-23', '', 'Rencana pelaksanaan penandatanganan kesepakatan bersama antara Pemkab Malang dengan PT. Telkom Indonesia Tbk', '', 'D:\\Hasil Scan\\IMG_20140424_0004.jpg'),
(1300, 347, 1309, '648/1967/421.214/2014', 'KANTOR PERUMAHAN', 'Surat keluar ', '2014-04-23', '', 'Rekomendasi Bupati Malang tentang rencana pembangunan rumah susun sewa Ponpes Mambaul Ulum di Kec. Bantur ', '', 'D:\\Hasil Scan\\IMG_20140424_0003.jpg'),
(1301, 382, 1310, '824.3/1968/421.031/2014', 'BAGIAN UMUM & PROTOKOL', 'Nota dinas ', '2014-04-23', '', 'Mutasi PNS gol III an. Sri Ratna Agustin, SP dari Pemkab Malang ke Pemkot Malang', '', 'D:\\Hasil Scan\\IMG_20140424_0002.jpg'),
(1302, 448, 1311, '800/1966/421.103/2014', 'DINAS KESEHATAN', 'Surat keluar ', '2014-04-23', '', 'Surat tugas an. Dra. Mursyidah, Apt.M.Kes', '', 'D:\\Hasil Scan\\IMG_20140424_0001.jpg'),
(1303, 88, 1312, '100/1957/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NPKND', '2014-04-23', '', 'Persiapan upacara peringatan hari Otonomi Daerah ke XVIII Kab. Malang tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140424_0001.jpg'),
(1304, 448, 1313, '800/1960/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Surat keluar ', '2014-04-23', '', 'Surat tugas an. R. Ichwanul Muslimin, SH, MSi', '', 'D:\\Hasil Scan\\IMG_20140424_0002.jpg'),
(1305, 428, 1314, '910/1959/421.023/2014', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'Surat keluar', '2014-04-23', '', 'Percepatan realisasi penyerapan anggaran TA. 2014', '', 'D:\\Hasil Scan\\IMG_20140424_0003.jpg'),
(1306, 88, 1315, '100/1958/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Nota dinas ', '2014-04-23', '', 'Persiapan upacara peringatan hari Otonomi Daerah ke XVIII Kab. Malang tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140424_0001.jpg'),
(1307, 448, 1316, '800/1964/421.011/2014', 'TATA PEMERINTAHAN UMUM', 'NPKND', '2014-04-23', '', 'Permohonan ijin ibadah haji Bupati Malang ', '', 'D:\\Hasil Scan\\IMG_20140424_0004.jpg'),
(1308, 448, 1317, '800/1978/421.041/2014', 'BAGIAN KESRA', 'Surat keluar ', '2014-04-23', '', 'Surat tugas an. Ir. R. Taufiq Hidayat ', '', 'D:\\Hasil Scan\\IMG_20140424_0005.jpg'),
(1309, 347, 1318, '648/1990/421.214/2014', 'KANTOR PERUMAHAN', 'Surat keluar ', '2014-04-24', '', 'Rekomendasi Bupati Malang tentang rencana pembangunan rumah susun sewa asrama pendidikan Yayasan Ponpes Modern Al Rifai Ds. Ketawang Kec. Gondanglegi ', '', 'D:\\Hasil Scan\\IMG_20140425_0006.jpg'),
(1310, 427, 1319, '903/1995/421.119/2014', 'DPPKA', 'Surat keluar ', '2014-04-24', '', 'Penyampaian data realisasi APBD Kab. Malang triwulan I TA.2014', '', 'D:\\Hasil Scan\\IMG_20140425_0005.jpg'),
(1311, 297, 1320, '556/1994/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Surat keluar ', '2014-04-24', '', 'Tindak lanjut atas keikutsertaan pada Internatinale Tourismus Borse (ITB) Berlin 2014', '', 'D:\\Hasil Scan\\IMG_20140425_0004.jpg'),
(1312, 280, 1321, '540/1993/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Surat keluar ', '2014-04-24', '', 'Salinan surat dari Menteri Pertanian RI ', '', 'D:\\Hasil Scan\\IMG_20140425_0003.jpg'),
(1313, 123, 1322, '188.45/1992/421.216/2014', '216', 'NPKND', '2014-04-24', '', 'Surat pernyataan bencana alam tanah longsor di Ds. Bambang Kec. Wajak ', '', 'D:\\Hasil Scan\\IMG_20140425_0002.jpg'),
(1314, 88, 1323, '100/1980/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NPKND', '2014-04-24', '', 'Laporan ideologi, politik, ekonomi, sosial, budaya, pertahanan & keamanan bulan Januari 2014', '', 'D:\\Hasil Scan\\IMG_20140425_0001.jpg'),
(1315, 85, 1325, '094/2004/421.032/2014', 'BAGIAN TATA USAHA', 'Nota dinas ', '2014-04-25', '', 'Permohonan ijin menghadiri rakor dengan tema penguatan produksi distribusi & konektivitas mengantisipasi dampak badai elnino & kenaikan TDL', '', 'D:\\Hasil Scan\\IMG_20140428_0002.jpg'),
(1316, 316, 1326, '590/2003/421.014/2014', 'BAGIAN PERTANAHAN', 'Nota dinas ', '2014-04-25', '', 'Rencana musyawarah nilai Uang Ganti Rugi (UGR) Tanah, tanaman & bangunan yang terkena jalan tol Pandaan - Malang di Ds. Sumberporong & Ds. Mulyoarjo Kec. Lawang ', '', 'D:\\Hasil Scan\\IMG_20140428_0003.jpg'),
(1317, 316, 1327, '119/2001/421.022/2014', 'BAGIAN KERJASAMA', 'Nota dinas ', '2014-04-25', '', 'Laporan perubahan acara penandatanganan kesepakatan bersama antara Pemkab Malang dengan PT. Telkom Indonesia Tbk', '', 'D:\\Hasil Scan\\IMG_20140428_0004.jpg'),
(1318, 316, 1328, '539/1996/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NPKND', '2014-04-24', '', 'Tindak lanjut SK Bupati Malang No : 188.45/250/KEP/ 421.013/2014', '', 'D:\\Hasil Scan\\IMG_20140428_0008.jpg'),
(1319, 316, 1329, '539/1997/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Nota dinas ', '2014-04-24', '', 'Tindak lanjut SK Bupati Malang No : 188.45/250/KEP/ 421.013/2014 tentang pemberhentian Dirut PD. Jasa Yasa Kab. Malang ', '', 'D:\\Hasil Scan\\IMG_20140428_0007.jpg'),
(1320, 256, 1330, '511.1/1999/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Surat keluar ', '2014-04-25', '', 'Laporan pelaksanaan program Raskin triwulan I tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140428_0006.jpg'),
(1321, 76, 1331, '074.1/2000/421.022/2014', 'BAGIAN KERJASAMA', 'Surat keluar ', '2014-04-24', '', 'Nota kesepahaman antara Bupati Malang dengan Rektor Unmer Malang ', '', 'D:\\Hasil Scan\\IMG_20140428_0001.jpg'),
(1322, 193, 1332, '440/2007/421.103/2014', 'DINAS KESEHATAN', 'Surat keluar ', '2014-04-28', '', 'Permohonan bantuan keuangan provinsi untuk alat kesehatan ', '', 'D:\\Hasil Scan\\IMG_20140429_0009.jpg'),
(1323, 193, 1333, '539/2017/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Surat keluar ', '2014-04-28', '', 'Tindak lanjut atas laporan keuangan PT. Kigumas (proforma) per 31-12-2011, 2010 & 2009 serta laporan keuangan PT. Kigumas (unaudited) per 31-12-2013 & 2012', '', 'D:\\Hasil Scan\\IMG_20140429_0008.jpg'),
(1324, 65, 1334, '060/2018/421.034/2014', 'BAGIAN ORGANISASI', 'NPKND', '2014-04-29', '', 'Perubahan Perbup Malang No.32 Tahun 2011 tentang UPTD Metrologi legal pada Dinas Perindag Pasar Kab. Malang ', '', 'D:\\Hasil Scan\\IMG_20140429_0007.jpg'),
(1325, 65, 1335, '060/2020/421.034/2014', 'BAGIAN ORGANISASI', 'Nota dinas ', '2014-04-29', '', 'Perubahan Perbup Malang No.32 Tahun 2011 tentang UPTD Metrologi legal pada Dinas Perindag Pasar Kab. Malang ', '', 'D:\\Hasil Scan\\IMG_20140429_0006.jpg'),
(1326, 247, 1336, '500/2019/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NPKND', '2014-04-28', '', 'Undangan rakor penguatan produksi distribusi & konektifitas mengantisipasi dampak badai elnino & kenaikan TDL ', '', 'D:\\Hasil Scan\\IMG_20140429_0005.jpg'),
(1327, 167, 1337, '400/2014/421.041/2014', 'BAGIAN KESRA', 'NPKND ', '2014-04-28', '', 'Telaah permohonan bantuan sosial untuk kesejahteraan sosial di wilayah Kab. Malang ', '', 'D:\\Hasil Scan\\IMG_20140429_0004.jpg'),
(1328, 316, 1338, '590/2011/421.014/2014', 'BAGIAN PERTANAHAN', 'Surat keluar ', '2014-04-28', '', 'Pertimbangan teknis BPN lahan rumput Wajak ', '', 'D:\\Hasil Scan\\IMG_20140429_0003.jpg'),
(1329, 316, 1339, '045.021/2012/421.211/2014', 'BADAN PERPUS, ARSIP & DOKUMENTASI', 'Surat keluar ', '2014-04-28', '', 'Penyerahan arsip statis yang tercipta di setiap SKPD di lingkungan Pemkab Malang ', '', 'D:\\Hasil Scan\\IMG_20140429_0002.jpg'),
(1330, 85, 1340, '094/2009/421.206/2014', 'BADAN LH', 'Surat keluar ', '2014-04-28', '', 'Surat tugas an. Tridiyah Maistuti, SH, MSi ', '', 'D:\\Hasil Scan\\IMG_20140429_0001.jpg'),
(1331, 85, 1341, '094/2022/421.111/2014', 'DINAS CIPTA KARYA & TATA RUANG', 'Surat keluar ', '2014-04-29', '', 'Surat tugas an. Ir. Romdhoni ', '', 'D:\\Hasil Scan\\IMG_20140430_0004.jpg'),
(1332, 297, 1342, '556/2023/421.108/2014', 'DINAS KEBUDAYAAN & PARIWISATA', 'Surat keluar ', '2014-04-30', '', 'Surat pernyataan Bupati Malang ', '', 'D:\\Hasil Scan\\IMG_20140430_0003.jpg'),
(1333, 448, 1343, '80/2024/421.108/2014', 'DINAS KEBUDAYAAN & PARIWISATA', 'Surat keluar ', '2014-04-29', '', 'Surat tugas an. Made Arya Wedanthara, SH, MSi ', '', ''),
(1334, 427, 1344, '903/2025/421.119/2014', 'DPPKA', 'Surat keluar ', '2014-04-29', '', 'Penyampaian data LRA & Neraca APBD Kab. Malang TA.2013 (unaudited)', '', 'D:\\Hasil Scan\\IMG_20140430_0001.jpg'),
(1335, 427, 1345, '903/2026/421.119/2014', 'DPPKA', 'Surat keluar ', '2014-04-29', '', 'Penyampaian data realisasi APBD Kab. Malang triwulan I TA. 2014', '', 'D:\\Hasil Scan\\IMG_20140430_0010.jpg'),
(1336, 88, 1346, '100/2027/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NPKND', '2014-04-29', '', 'Kegiatan bina desa ke-23 di Desa Urek-urek Kec. Gondanglegi ', '', 'D:\\Hasil Scan\\IMG_20140430_0009.jpg'),
(1337, 88, 1347, 'x.714/2033/421.201/2014', 'INSPEKTORAT', 'Surat keluar ', '2014-04-29', '', 'Hasil pemeriksaan Inspektorat Kab. Malang pada Kec. Donomulyo Kab. Malang ', '', 'D:\\Hasil Scan\\IMG_20140430_0008.jpg'),
(1338, 88, 1348, 'x.714/2034/421.201/2014', 'INSPEKTORAT', 'Surat keluar ', '2014-04-29', '', 'Hasil pemeriksaan Inspektorat Kab. Malang pada Kec. Pakis Kab. Malang ', '', 'D:\\Hasil Scan\\IMG_20140430_0007.jpg'),
(1339, 88, 1349, 'x.714/2035/421.201/2014', 'INSPEKTORAT', 'Surat keluar ', '2014-04-29', '', 'Hasil pemeriksaan Inspektorat Kab. Malang pada Kec. Tumpang Kab. Malang ', '', 'D:\\Hasil Scan\\IMG_20140430_0006.jpg'),
(1340, 278, 1350, '525.24/2036/421.021/2014', 'BAGIAN PEREKONOMIAN', 'NPKND ', '2014-04-29', '', 'Klarifikasi terhadap permohonan kelengkapan persyaratan rekomendasi teknis dalam rangka penanaman modal di bidang usaha perkebunan PT. Duta Plantation Nusantara ', '', 'D:\\Hasil Scan\\IMG_20140430_0005.jpg'),
(1341, 278, 1351, '525.24/2037/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Nota dinas ', '2014-04-29', '', 'Klarifikasi terhadap permohonan kelengkapan persyaratan rekomendasi teknis dalam rangka penanaman modal di bidang usaha perkebunan PT. Duta Plantation Nusantara ', '', 'D:\\Hasil Scan\\IMG_20140430_0005.jpg'),
(1342, 297, 1352, '556/2052/421.111/2014', 'DINAS CIPTA KARYA & TATA RUANG', 'Surat keluar ', '2014-04-29', '', 'Permohonan perpanjangan pasport an. Ir. Romdhoni ', '', 'D:\\Hasil Scan\\IMG_20140430_0004.jpg'),
(1343, 167, 1353, '400/2063/421.041/2014', 'BAGIAN KESRA', 'Surat keluar ', '2014-04-29', '', 'Undangan bimbingan motivasi bagi pengurus panti asuhan di Kab. Malang ', '', 'D:\\Hasil Scan\\IMG_20140430_0003.jpg'),
(1344, 167, 1354, '400/2062/421.041/2014', 'BAGIAN KESRA', 'NPKND ', '2014-04-29', '', 'Undangan kegiatan bimbingan motivasi bagi pengurus panti asuhan di Kab. Malang ', '', 'D:\\Hasil Scan\\IMG_20140430_0002.jpg'),
(1345, 167, 1355, '400/2060/421.041/2014', 'BAGIAN KESRA', 'NPKND', '2014-04-29', '', 'Permohonan bantuan narasumber kegiatan penyiapan kerja bagi anak yatim melalui bimbingan motivasi kepada pengurus panti asuhan di Kab. Malang ', '', 'D:\\Hasil Scan\\IMG_20140430_0001.jpg'),
(1346, 167, 1356, '400/2061/421.041/2014', 'BAGIAN KESRA', 'Surat keluar ', '2014-04-29', '', 'Permohonan bantuan narasumber ', '', 'D:\\Hasil Scan\\IMG_20140430_0010.jpg'),
(1347, 339, 1357, '640/2059/421.023/2014', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'Nota dinas ', '2014-04-29', '', 'Telaah staf terhadap proposal permohonan rehab gedung TK DWP 02 Donomulyo ', '', 'D:\\Hasil Scan\\IMG_20140430_0009.jpg'),
(1348, 22, 1358, '010/2058/421.031/2014', 'BAGIAN UMUM & PROTOKOL', 'Nota dinas', '2014-04-29', '', 'Telaah terkait penawaran pelatihan MC dari RRI Malang ', '', 'D:\\Hasil Scan\\IMG_20140430_0008.jpg'),
(1349, 8, 1359, '002/2057/421.210/2014', 'BADAN KELUARGA BERENCANA', 'Surat keluar ', '2014-04-29', '', 'Piagam penghargaan an. Suroto, SH, MM ', '', 'D:\\Hasil Scan\\IMG_20140430_0007.jpg'),
(1350, 85, 1360, '094/2055/421.051/2014', 'SEKRETARIAT DPRD', 'Surat keluar ', '2014-04-30', '', 'Surat tugas an. Nurcahyo, SH, MHum ', '', 'D:\\Hasil Scan\\IMG_20140430_0006.jpg'),
(1351, 321, 1361, '600/2053/421.023/2014', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'Surat keluar ', '2014-04-29', '', 'Permintaan untuk menjadi narasumber Pembinaan jasa konstruksi ', '', 'D:\\Hasil Scan\\IMG_20140430_0005.jpg'),
(1352, 321, 1362, '600/2059/421.023/2014', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'Surat keluar ', '2014-04-29', '', 'Permintaan untuk menjadi narasumber pembinaan jasa konstruksi ', '', 'D:\\Hasil Scan\\IMG_20140430_0004.jpg'),
(1353, 448, 1363, '800/2049/421.101/2014', 'DINAS PENDIDIKAN', 'Surat keluar ', '2014-04-29', '', 'Piagam penghargaan kategori pengawas SMA/SMK an. Drs. Dwi Tjahjono W, MSi ', '', 'D:\\Hasil Scan\\IMG_20140430_0003.jpg'),
(1354, 448, 1364, '800/2050/421.101/2014', 'DINAS PENDIDIKAN', 'Surat keluar ', '2014-04-29', '', 'Piagam penghargaan kategori pengawas SMP an. Drs. Endi Joko Sumartono ', '', 'D:\\Hasil Scan\\IMG_20140430_0002.jpg'),
(1355, 448, 1365, '800/2051/421.101/2014', 'DINAS PENDIDIKAN', 'Surat keluar ', '2014-04-29', '', 'Piagam penghargaan kategoro pengawas TK/SD an. Drs. Totok Indrianto ', '', 'D:\\Hasil Scan\\IMG_20140430_0001.jpg'),
(1356, 448, 1366, '800/2044/421.101/2014', 'DINAS PENDIDIKAN', 'Surat keluar ', '2014-04-29', '', 'Piagam penghargaan kategori guru SMA an. Anis Farida, SPd, MPd', '', 'D:\\Hasil Scan\\IMG_20140430_0010.jpg'),
(1357, 448, 1367, '800/2045/421.101/2014', 'DINAS PENDIDIKAN', 'Surat keluar ', '2014-04-29', '', 'Piagam penghargaan kategori guru SMK an. Hari Kusrini, SPd, MM ', '', 'D:\\Hasil Scan\\IMG_20140430_0009.jpg'),
(1358, 448, 1368, '800/2046/421.101/2014', 'DINAS PENDIDIKAN', 'Surat keluar ', '2014-04-29', '', 'Piagam penghargaan kategori Kasek SMP an. Drs. Abdul Rozaq, MPd', '', 'D:\\Hasil Scan\\IMG_20140430_0008.jpg'),
(1359, 448, 1369, '800/2047/421.101/2014', 'DINAS PENDIDIKAN', 'Surat keluar ', '2014-04-29', '', 'Piagam penghargaan kategori Kasek SMA an. Dra. Lilik Wahyuni ', '', 'D:\\Hasil Scan\\IMG_20140430_0007.jpg'),
(1360, 448, 1370, '800/2048/421.101/2014', 'DINAS PENDIDIKAN', 'Surat keluar ', '2014-04-29', '', 'Piagam penghargaan kategori Kasek SMK an. Sali Rochani, SPd, MPd', '', 'D:\\Hasil Scan\\IMG_20140430_0006.jpg'),
(1361, 448, 1371, '800/2039/421.101/2014', 'DINAS PENDIDIKAN', 'Surat keluar ', '2014-04-29', '', 'Piagam penghargaan kategori guru TK an. Al Istiqomah, SP.d ', '', 'D:\\Hasil Scan\\IMG_20140430_0005.jpg'),
(1362, 448, 1372, '800/2040/421.101/2014', 'DINAS PENDIDIKAN', 'Surat keluar ', '2014-04-29', '', 'Piagam penghargaan kategori guru SD an. Ribut Kusmiwati, MPd', '', 'D:\\Hasil Scan\\IMG_20140430_0004.jpg'),
(1363, 448, 1373, '800/2041/421.101/2014', 'DINAS PENDIDIKAN', 'Surat keluar ', '2014-04-29', '', 'Piagam penghargaan kategori Kasek TK an. Rini Sumariani, SPd ', '', 'D:\\Hasil Scan\\IMG_20140430_0003.jpg'),
(1364, 448, 1374, '800/2042/421.101/2014', 'DINAS PENDIDIKAN', 'Surat keluar ', '2014-04-29', '', 'Piagam penghargaan kategori Kasek SD an. Drs. Saturi ', '', 'D:\\Hasil Scan\\IMG_20140430_0002.jpg'),
(1365, 448, 1375, '800/2043/421.101/2014', 'DINAS PENDIDIKAN', 'Surat keluar ', '2014-04-29', '', 'Piagam penghargaan kategori guru SMP an. Dra. Martina Lona Jusita, MPd', '', 'D:\\Hasil Scan\\IMG_20140430_0001.jpg'),
(1366, 448, 1376, '800/2024/421.108/2014', 'DINAS KEBUDAYAAN & PARIWISATA', 'Surat keluar ', '2014-04-29', '', 'Surat tugas an. Made Arya Wedanthara, SH, MSi ', '', 'D:\\Hasil Scan\\IMG_20140430_0002.jpg'),
(1367, 88, 1377, '100/2077/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Surat keluar ', '2014-04-30', '', 'Kegiatan bina desa ke-23 di Desa Urek-urek Kec. Gondanglegi ', '', 'D:\\Hasil Scan\\IMG_20140502_0002.jpg'),
(1368, 154, 1378, '360/2078/421.216/2014', 'BPBD', 'Surat keluar ', '2014-04-23', '', 'Surat pernyataan bencana ', '', 'D:\\Hasil Scan\\IMG_20140502_0001.jpg'),
(1369, 321, 1379, '600/2068/421.023/2014', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'Surat keluarv ', '2014-04-30', '', 'Penilaian kinerja Pemda PU (PKPD-PU) Bidang penataan ruang tahun 2014', '', 'D:\\Hasil Scan\\IMG_20140502_0003.jpg'),
(1370, 321, 1380, '119/2105/421.022/2014', 'BAGIAN KERJASAMA', 'Nota dinas ', '2014-05-02', '', 'Laporan bintek mengenai tata cara pengusulan program / proyek PHLN ke dalam blue book ', '', ''),
(1371, 63, 1381, '050/2104/421.023/2014', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'Nota dinas ', '2014-05-02', '', 'Laporan hasil sosialisasi Peraturan Gubernur Jatim No.20 Tahun 2014 tentang petunjuk teknis persiapan pengadaan tanah bagi pembangunan untuk kepentingan umum ', '', ''),
(1372, 470, 1382, '005/2099/421.032/2014', 'BAGIAN TATA USAHA', 'Surat keluar ', '2014-05-02', '', 'Undangan rapat penetapan daftar kebutuhan barang milik daerah & daftar kebutuhan pemeliharaan barang milik daerah TA.2014', '', ''),
(1373, 470, 1383, '005/2100/421.032/2014', 'BAGIAN TATA USAHA', 'Surat keluar ', '2014-05-02', '', 'Undangan rakor pemberian penghargaan cinta karya bangsa tahun 2014', '', ''),
(1374, 470, 1384, '005/2101/421.032/2014', 'BAGIAN TATA USAHA', 'Surat keluar ', '2014-05-02', '', 'Undangan rakor tindak lanjut hasil audit BPKP RI atas kinerja PDAM Kab. Malang tahun buku 2012', '', ''),
(1375, 470, 1385, '005/2103/421.032/2014', 'BAGIAN TATA USAHA', 'Surat keluar ', '2014-05-02', '', 'Undangan rakor finalisasi usulan program pusat layanan usaha terpadu (PLUT) ', '', ''),
(1376, 470, 1386, '005/2102/421.034/2014', 'BAGIAN ORGANISASI', 'sURAT KELUAR ', '2014-04-30', '', 'Permintaan data standar pelayanan publik (SPP) & Indeks Kepuasan Masyarakat (IKM) Tahun 2014', '', ''),
(1377, 88, 1387, '100/2098/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NPKND ', '2014-05-02', '', 'Permohonan untuk tidak dilakukan pemadaman listrik ', '', ''),
(1378, 88, 1388, '100/2097/421.011/2014', 'BAGIAN TATA PEMERINTAHAN UMUM', 'NPKND ', '2014-05-02', '', 'Kegiatan bina desa di Desa Urek-urek Kec. Gondanglegi ', '', ''),
(1379, 22, 1389, '010/2094/421.023/2014', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'Nota dinas ', '2014-05-02', '', 'Laporan realisasi belanja langsung (program & kegiatan) triwulan I TA.2014', '', ''),
(1380, 22, 1390, '010/2093/421.023/2014', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'NPKND ', '2014-05-02', '', 'Lasporan realisasi belanja langsung (program & kegiatan) triwulan I TA. 2014', '', ''),
(1381, 439, 1391, '976/2092/421.021/2014', 'BAGIAN PEREKONOMIAN', 'Surat keluar ', '2014-04-30', '', 'Penyusunan RKA PAPBD Program / kegiatan DBHCHT TA.2014', '', ''),
(1382, 101, 1392, '141/2082/421.012/2014', 'BAGIAN TATA PEMERINTAHAN DESA', 'Nota dinas ', '2014-04-30', '', 'Laporan hasil koordinasi wilayah terkait pengaduan adanya praktek ketidakadilan di Desa Gedokwetan Kec. Turen ', '', ''),
(1383, 101, 1393, '141/2081/421.012/2014', 'BAGIAN TATA PEMERINTAHAN DESA', 'NPKND', '2014-04-30', '', 'Laporan hasil koordinasi wilayah terkait pengaduan adanya praktek ketidakadilan di Desa Gedokwetan Kec. Turen ', '', ''),
(1384, 101, 1394, '141/2083/421.012/2014', 'BAGIAN TATA PEMERINTAHAN DESA', 'Nota dinas ', '2014-04-30', '', 'Agenda penyelenggaraan diseminasi informasi bagi masyarakat desa pada program & kegiatan Bagian Tapemdes Setda Kab. Malang TA. 2014', '', ''),
(1385, 85, 1395, '094/2086/421.206/2014', 'BADAN LH', 'Surat keluar ', '2014-04-30', '', 'Surat tugas an. Tridiyah Maistuti, SH, MSi ', '', '');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=361 ;

--
-- Dumping data for table `surat_masuk`
--

INSERT INTO `surat_masuk` (`id`, `sifat_arsip_id`, `sifat_surat_id`, `no_urut`, `no_surat`, `no_agenda`, `surat_dari`, `perihal`, `tanggal_surat`, `tanggal_terima`, `catatan`, `file_surat`) VALUES
(1, 1, 2, 1, '005/7264/4211.032/2013', '', 'BAGIAN TATA USAHA', 'Undangan Lunch Meeting pada hari kamis  2  Januari 2014 Pkl. 12.00 Wib Tempat Ruang Anusapati  Lantai II Jl. Merdeka Timur No.3 Malang ', '2013-12-31', '2014-01-02 13:23:00', 'Hadir Tgl 4 Januari 2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(2, 1, 2, 2, '180/150/4121.013/2013', '', 'BAGIAN HUKUM', 'Penerbitan Produk Hukum Daerah ', '2013-12-16', '2014-01-02 14:25:00', 'Nota dinas satu pintu coba dipelajari untuk bisa menjadi produk hukum', 'E:\\SCAN SURAT\\IMG.jpg'),
(3, 1, 2, 3, '900/21356/4211.119/21013', '', 'DPPKA', 'Pengamanan Target Penerimaan Negara Tahun Anggaran 21013.', '2014-01-02', '2014-01-02 14:27:00', 'Untuk dipedomani', 'E:\\SCAN SURAT\\IMG.jpg'),
(4, 1, 2, 4, '489/1121/4211.033/2013', '', 'BAGIAN HUMAS', 'Penyampaian Jadwal Ketua Kelompok Apel Pagi Bulan Januari dan Pebruari 2014.', '2014-01-31', '2014-01-02 14:29:00', 'Untuk diperhatikan dan dilaksanakan sesuai jadwal', 'E:\\SCAN SURAT\\IMG.jpg'),
(5, 1, 2, 5, '-', '', 'Sekretariat  Daerah Kab.  Malang ', 'Menyambut Tahun Baru 2014.', '2014-01-29', '2014-01-02 14:32:00', 'File', 'E:\\SCAN SURAT\\IMG.jpg'),
(6, 1, 4, 6, '005/4105/4211.050/12013', '', 'DPRD KABUPATEN MALANG', 'Permohonan Bantuan Menugaskan Pada Study Banding  Komisi A dan D DPRD Kab. Lumajang  ke DPRD Kab Malang.', '2013-12-24', '2014-01-02 14:35:00', 'File Tgl 4 Januari 2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(7, 1, 2, 7, '003/ADM/DP-APKASI - APEKSI/XII/2013', '', 'APKASI - APEKSI JAKARTA ', 'Undangan Rakornas II Apkasi dan Apeksi  tentang Potensi Permasalahan Hukum Yang di hadapi Kepala Daerah dan Pernyataan Sikap Terhadap RUU Pilkades', '2014-01-02', '2014-01-02 14:38:00', 'Koordinasi dengan Adc. Wabup', 'E:\\SCAN SURAT\\IMG.jpg'),
(8, 1, 1, 8, '005/07/4211.032/2013', '', 'BAGIAN TATA USAHA', 'Rapat Koordinasi Pembahasan Naskah Kesepakatan Bersama Antara Pemerintah Kab. Malang  Dengan  PT. Telkom ', '2014-01-03', '2014-01-03 11:06:00', 'Saya Hadir', 'E:\\SCAN SURAT\\IMG.jpg'),
(9, 1, 2, 9, '005/6138/107.121/2013', '', 'Dinas Kebudayaan Dan Pariwisata  Prov. Jatim', 'Undangan Penerimaan Penghargaan Pengelolaan Pantai ', '2014-01-03', '2014-01-03 14:09:00', 'File', 'E:\\SCAN SURAT\\IMG.jpg'),
(10, 1, 2, 10, '-', '', 'Gubernur Jatim ', 'Undangan Peringatan Hari Ibu ( PHI ) Ke 86 Hari Kesetiakawanan Sosial Nasional ( HKSN) Hari Disabilitas Internasional  ( HDI ) dan Hari Nusantara ke 13 Prov Jatim  2013 Bersama Gubernur Jatim.', '2013-12-23', '2014-01-03 14:22:00', 'File', 'E:\\SCAN SURAT\\IMG.jpg'),
(11, 1, 4, 11, '005/4123/421.050/2013', '', 'DPRD KABUPATEN MALANG', 'Pemberitahuan Penundaan Rapat Paripurna DPRD Kab. Malang ', '2013-12-27', '2014-01-06 09:24:00', 'File, UMP Tgl 6 Januari 2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(12, 1, 4, 12, '1180/PGS/SMK I/I/21014', '', 'SMK ISLAM DONOMULYO ', 'Surat Tugas ', '2014-01-06', '2014-01-06 09:50:00', 'Untuk diatur bebas tugasnya masing-masing personal', 'E:\\SCAN SURAT\\IMG.jpg'),
(13, 1, 2, 13, '060/571/4211.034/21014', '', 'BAGIAN ORGANISASI', 'Penyampaian Laporan Akuntabilitas  Kinerja Intansi Pemerintah ( Lakip ) Tahun 2013  Penetapan Kinerja ( Tapkin ) Tahun 2014.', '2014-01-06', '2014-01-06 13:04:00', '', ''),
(14, 1, 2, 14, '005/0210/4211.032/21014', '', 'BAGIAN TATA USAHA', 'Talk Swow Pada Hari Selasa Tgl. 7 Januari 2014 Pkl. 05.30 Wib  Tempat Peringgitan Pendopo Agung Kab. Malang Jl. KH. Agus Salim No. 7 Malang', '2014-01-06', '2014-01-06 13:25:00', 'Saya hadir', 'E:\\SCAN SURAT\\IMG.jpg'),
(15, 1, 3, 15, 'S.03/II.1.1/2013', '', 'Televisi Republik Indonesia Stasiun Jawa Timur', 'Pemberitahuan Sebagai  Narasumber dalam Talk Show Acara Semanggi  pada   Hari  Rabu 8 Januari 21014 Pkl. 17.30 -19.00 Wib di Studio II TVRI No. 124 Surabaya ', '2014-01-06', '2014-01-06 13:21:00', '', ''),
(16, 1, 3, 16, '800/016/4211.032/21014', '', 'BAGIAN TATA USAHA', 'Laporan Kehadiran Apel Pagi Kasryawan /Karyawati Sekretariat Daerah Kab. Malang', '2014-01-03', '2014-01-07 10:36:00', '', ''),
(17, 1, 1, 17, 'UND-6/WPJ.121/KP.11/2014', '', 'Dirjen Pajak Kantor Pelayanan Pajak Pratama Kepanj', 'Undangan Sosialisasi Per  14/PJ/12013 Pada Hari Kamis Tgl. 16 Januari 2014  Tempat Aula Kantor Pelayanan Pajak Pratama Kepanjen Jl. Raya Kepanjen Pakisaji  Km 4 Pkl. 13.00 Wib ', '2014-01-07', '2014-01-07 10:00:00', '', ''),
(18, 1, 2, 18, '2/Skr/PKK. Kab /I/12014', '', 'PKK  TIM PENGGERAK KABUPATEN MALANG ', 'Pengajian Rutin Majelis Ta''lim Khoirun  Nisa Tim Penggerak PKK Kab. Malang  Pada  Hari Jumat Tgl 10 Januari 2014 Pkl. 08.00 Wib  Tempat Peringgitan Pendopo Agung Kab. Malang ', '2014-01-07', '2014-01-07 11:23:00', 'Saya Hadir', 'E:\\SCAN SURAT\\IMG.jpg'),
(19, 1, 3, 19, '005/050/4121.032/12014', '', 'BAGIAN TATA USAHA', 'Upacara Pembukaan Kursus  Mahir Tingkat Dasar ( KMD ) pada Hari Kamis Tgl. 9 Januari 2014 Pkl. 08.00 Wib Tempat Pendopo Kab. Malang di Kepanjen Jl. Raden Panji No. 158 Kepanjen  Pakaian Pramuka.', '2014-01-08', '2014-01-08 12:12:00', 'Saya hadir', 'E:\\SCAN SURAT\\IMG.jpg'),
(20, 1, 3, 20, '065/037/4211.034/2014', '', 'BAGIAN ORGANISASI', 'Penyusunan SOP di Lingkungan Sekretariat Daerah Kab. Malang', '2014-01-07', '2014-01-08 12:17:00', 'Untuk dievakuasi  SOP masing-masing Subag', 'E:\\SCAN SURAT\\IMG.jpg'),
(21, 1, 3, 21, '176/1216/4211.050/21014', '', 'DPRD KABUPATEN MALANG', 'Permohonan Penugasan pada acara Kunjungan Kerja pada tanggal 7 Januari 2014.', '2014-01-06', '2014-01-08 12:19:00', 'Untuk dibuatkan undangan ', 'E:\\SCAN SURAT\\IMG.jpg'),
(22, 1, 3, 22, '005/11/4121.119/2014', '', 'DPPKA', 'Undangan Rekonsiliasi Laporan Keuangan SKPD dengan Laporan Keuangan Pemerintah Kab. Malang Malang Pada Senin  s/d Jumat tgl. 13 s/d 17 Januari 2014 Pkl. 08.30 Wib s/d Selesai  Tempat Bidang Akuntansi dan Pelaporan   ( Lt. II ) DPPKA Kab. Malang ', '2014-01-06', '2014-01-08 12:21:00', 'Tugaskan staf ', 'E:\\SCAN SURAT\\IMG.jpg'),
(23, 1, 3, 23, '100/045/421.011/2014', '', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Kegiatan Bina Desa ke 21 di Desa Sukoanyar Kec. Pakis.', '2014-01-08', '2014-01-08 13:55:00', 'File di Undangan Kabag tgl 13 Januari 2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(24, 1, 3, 24, '15/1307-A', '', 'Gerakan Pramuka Kwarcab Kabupaten Malang ', 'Permohonan Undangan Upacara Pembukaan Kursus Mahir Tingkat  Dasar Kamis 9 Januari 2014 Pkl. 07.00 Wib di Pendopo Kabupaten Malang di Kepanjen.', '2014-01-09', '2014-01-06 10:20:00', 'Buat undangn', 'E:\\SCAN SURAT\\IMG.jpg'),
(25, 1, 3, 25, '176/36/421.050/2014', '', 'DPRD KABUPATEN MALANG', 'Permohonan Penugasan Pada Kunjungan Kerja Komisi A, B, C dan D DPRD Kab. Malang Kamis 9 Januari 21014 Pkl. 10.00 Wib di RSUD Lawang Kec. Dau dan Tajinan ', '2014-01-09', '2014-01-09 10:28:00', 'Buatkan undangan', 'E:\\SCAN SURAT\\IMG.jpg'),
(26, 1, 4, 26, '890/061/4211.023/2014', '', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'Sertifikat Ahli Pengadaan Barang/Jasa Pemerintah.', '2014-01-09', '2014-01-09 10:34:00', '', 'D:\\Hasil Scan\\IMG_20140109_0001.jpg'),
(27, 1, 2, 27, '0321/42/421.119/2013', '', 'DPPKA', 'Pemutakhiran Simbada Tahun Anggaran  21013', '2014-01-09', '2014-01-09 11:09:00', '', 'D:\\Hasil Scan\\IMG_20140109_0004.jpg'),
(28, 1, 2, 28, '005/075/421.032/2014', '', 'BAGIAN TATA USAHA', 'Rapat Koordinasi Pelaksanaan Bina Desa ( Bhakti Sosial Menata Desa ) Di Desa Sukoanyar Kecamatan Pakis Pada Hari  Jumat Tgl. 10 Januari 2014 Pkl. 08.30 Wib Tempat  Ruang Anusapati ( Lantai II ) Jl. Merdeka Timur No.3 Malang', '2014-01-09', '2014-01-09 12:40:00', 'Saya hadir', 'D:\\Hasil Scan\\IMG_20140113_0001.jpg'),
(29, 1, 2, 29, '075/080/4211.203/21014', '', 'BAPPEKAB', 'Data Bahan LKPJ Bupati  Tahun 21013', '2014-01-09', '2014-01-13 08:59:00', '', ''),
(30, 1, 2, 30, '005/082/4211.032/2013', '', 'BAGIAN TATA USAHA', 'Pengambilan Sumpah Jabatan dan Pelantikan Pejabat Struktural  Eselon II, III  Dan  IV di Lingkungan Pemerintah Kab. Malang', '2014-01-13', '2014-01-13 09:03:00', 'File diundangan Kabag', 'E:\\SCAN SURAT\\IMG.jpg'),
(31, 1, 2, 31, '060/096/4211.034/2014', '', 'BAGIAN ORGANISASI', 'Peningkatan Kualitas Pelayanan Kepada Masyarakat', '2014-01-07', '2014-01-13 09:07:00', 'File khusus aturan-aturan yang dibuat sekda', 'E:\\SCAN SURAT\\IMG.jpg'),
(32, 1, 2, 32, '005/083/421.032/2014', '', 'BAGIAN TATA USAHA', 'Bina Desa ( Bhakti Sosial  Menata Desa ) Pada Hari  Rabu - Kamis  Tgl. 15 -16 Januari 2014 Pkl. 14 Wib  s/d Selesai  Tempat  Desa Sukoanyar Kecamatan Pakis Kab. Malang  Pakaian Olah Raga ', '2014-01-13', '2014-01-13 09:11:00', 'File diundangan kabag', 'E:\\SCAN SURAT\\IMG.jpg'),
(33, 1, 2, 33, '093/27722/012/2013', '', 'Gubernur Jawa Timur ', 'Kunjungan Ke Luar Negeri ', '2014-01-07', '2014-01-13 09:20:00', 'Surat Asli Di Bu Yuli    ( Ada Parap Bpk Sekda  ).  ', 'E:\\SCAN SURAT\\IMG.jpg'),
(34, 1, 3, 34, '005/113/421.032/21014', '', 'BAGIAN TATA USAHA', 'Serah Terima Pejabat Eselon II di Lingkungan Pemerintah Kab. Malang Tahun 2014. pada Hari Senin Tgl.               13 Januari 2014  Jam 14.30 Wib Tempat Ruang Rapat Anusopati ( Lantai II ) Pakaian Dinas Harian ( PDH )', '2014-01-13', '2014-01-13 11:55:00', 'Hadir\r\nFile satu diundangan Kabag', 'E:\\SCAN SURAT\\IMG.jpg'),
(35, 1, 2, 35, '-', '', 'Drs. Abdul Fatah Ismail Sekda Kab. Lumajang ', 'Mohon Doa Restu Untuk Pamit Undur Diri Sebagai Sekdsa Kab. Lumajang.', '2014-01-10', '2014-01-13 13:51:00', 'File di bukukan untuk copy (untuk contoh)', 'E:\\SCAN SURAT\\IMG_0001.jpg'),
(36, 1, 4, 36, '0218/067/4211.119/2014', '', 'DPPKA', 'Rencana Kebutuhan Barang Unit ( RKBU ) Dan Rencana Kebutuhan Pemeliharaan Barang Unit ( RKPBU ) Tahun Anggaran 2014', '2014-01-08', '2014-01-13 14:07:00', '', ''),
(37, 1, 4, 37, '522/2767/117.03/2013', '', 'Gubernur Jatim  ', 'Rekomendasi Perubahan Fungsi Kawasan Hutan di Kab. Malang  ( Tembusan ).', '2013-12-23', '2014-01-13 14:17:00', 'Surat Asli ada di Bu Yuli 10/1 2014        File Sekda', 'E:\\SCAN SURAT\\IMG.jpg'),
(38, 1, 4, 38, '193/167/SJ', '', 'Sekretaris Jendral Kementrian Dalam Negeri  RI', 'Tawaran Kerjasama Sister City Province  dan Informasi Perjalanan Dinas Luar Negeri ', '2014-01-09', '2014-01-15 08:49:00', 'Untuk di file khusus di aturan-aturan', 'D:\\Hasil Scan\\IMG_20140115_0001.jpg'),
(39, 1, 2, 39, 'T. 1068/LSN/DI/PD.01.02/12/2013', '', 'Lemsaneg  RI', 'Penyampaian Hasil Kegiatan Spikotes Personil Sandi dfi Wilayah Prov. Jatim Tahun 2013', '2013-12-27', '2014-01-15 09:21:00', 'File khusus dan tersendiri (Walau ini staf santel)\r\nTaruh dilemari saya', 'D:\\Hasil Scan\\IMG_20140115_0002.jpg'),
(40, 1, 3, 40, '877/60/421.202/2014', '', 'BKD', 'Serah Terima Jabatan Eselon II Senin 14.30 Januari 2014 Pkl. 14.30 Wib di Anusapati', '2014-01-13', '2014-01-15 09:31:00', 'File khusus ajuan undangan', 'D:\\Hasil Scan\\IMG_20140115_0002.jpg'),
(41, 1, 3, 41, '0218/067/421.119/21014', '', 'DPPKA', 'Rencana Kebutuhan Barang Unit ( RKBU ) dan Rencana Kebutuhan Pemeliharaan Barang Unit ( RKPBU ) Tahun Anggaran 2014', '2014-01-08', '2014-01-15 09:40:00', 'Keu  Rencana Pemeliharaan Barang \r\nLaporkan DPPKA      ( FITRI )', 'D:\\Hasil Scan\\IMG_20140115_0001.jpg'),
(42, 1, 3, 42, '005/122/421.032/2014', '', 'BAGIAN TATA USAHA', 'Tahlil  Rutin  Pada Hari Kamis Tanggal 16 Januari 2014 Jam 17.00 Tempat Peringgitan Pendopo Agung Kab. Malang Jl. Kh. Agus Salim No. 7 Malang  Pakaian Busana  Muslim  ( Warna Putih )', '2014-01-15', '2014-01-15 10:17:00', 'Sudah terlaksana, File', 'D:\\Hasil Scan\\IMG_20140115_0005.jpg'),
(43, 1, 3, 43, '-', '', ' Romadhanul khotim', 'Lamaran Pekerjaan ', '2014-01-17', '2014-01-17 09:51:00', '', ''),
(44, 1, 3, 44, '950/38/4211.119/2014', '', 'DPPKA', 'Kekurangan Tunjangan Beras Tahun 12013', '2014-01-17', '2014-01-17 09:54:00', '', 'D:\\Hasil Scan\\IMG_20140117_0001.jpg'),
(45, 1, 3, 45, '176/13/414.040/2014', '', 'DPRD  Kab. Tuban', 'Kunker Komisi C DPRD Kab.  Tuban  Pada Hari Kamis Tgl.  23 Januari 2014 Jam 10.00 Wib Tempat Kantor Pemerintah Kab. Malang ', '2014-01-17', '2014-01-13 10:02:00', 'Sudah terlaksana, File', 'D:\\Hasil Scan\\IMG_20140117_0001.jpg'),
(46, 1, 3, 46, '05/PH/PKG/KTMP/1/2014', '', 'Karang Taruna " Mitra Pemuda " Ds. Tamanharjo Sing', 'Permohonan Kerjasama /Bantuan Acara Penyuluhan Bahaya Narkoba ', '2014-01-17', '2014-01-17 10:05:00', 'Untuk diteruskan ke BNN  Tgl 17 Januari 2014', 'D:\\Hasil Scan\\IMG_20140117_0001.jpg'),
(47, 1, 3, 47, '800/72179/421.202/2013', '', 'BKD', 'Penyusunan  Sasaran Kerja  ( SKP ) PNS ', '2014-01-17', '2014-01-17 10:11:00', 'Untuk di Sosialisasikan pada semua Staf', 'D:\\Hasil Scan\\IMG_20140117_0001.jpg'),
(48, 1, 3, 48, '141/16/421.632/2014', '', 'Paguyuban Camat Sekabupaten Malang', 'Permohonan Sosialisasi Jaminan  Kesehatan Nasional ( JKN )', '2014-01-08', '2014-01-17 10:16:00', 'Buat Undangan', 'D:\\Hasil Scan\\IMG_20140117_0001.jpg'),
(49, 1, 3, 49, '005/203/206/2014', '', 'BPM Prov Jatim ', 'Bantuan Menugaskan acara Sosialisasi Bulan Bhakti Gotong royong XI dan HKG-PKK Ke 42 Provinsi Jawa Timur Tahun 2014 Hari Selasa - Kamis  21-23 Januari 2014 di Ollino Garden Hatel Malang ', '2014-01-15', '2014-01-17 14:29:00', 'Untuk diteruskan, ke BPM', 'D:\\Hasil Scan\\IMG_20140117_0003.jpg'),
(50, 1, 4, 50, '005/148/421.032/2014', '', 'BAGIAN TATA USAHA', 'Rancangan Rencana Kerja Pembangunan Daerah ( RKPD ) Kab. Malang Tahun 2015  Pada hari Rabu Tgl, 22 Januari  2014  Januari  2014 Waktu  08.00 Wib s/d Selesai Tempat  Hotel Solaris Malang Jl. Raya Karanglo no.69 Singosari Malang      ', '2014-01-20', '2014-01-20 13:53:00', 'Sudah dihadiri oleh Kasubag Kepegawaian File', 'D:\\Hasil Scan\\IMG_20140120_0001.jpg'),
(51, 1, 4, 51, '005/128/421.050/2014', '', 'DPRD KABUPATEN MALANG', 'Permohonan Bantuan Menugaskan pada acara Kunjungan Kerja Komisi A DPRD Kab. Pamekasan ke Pemkab Malang Pada Hari Senin  20 Januari  2014 di RR Serbaguna DPRD Kab. Malang ', '2014-01-20', '2014-01-20 14:08:00', 'File', 'D:\\Hasil Scan\\IMG_20140120_0001.jpg'),
(52, 1, 4, 52, '005/584/023/2014', '', 'Sekda Prov Jatim ', 'Rapat Koordinasi PENAS Petani Nelayan XIV Pada Hari Selasa Tgl. 21  Januari   2014  Jam 09.00 Wib s/d Selesai  Tempat Shangrila Hotel. Jl. Mayjend Sungkono No. 120 Surabaya ', '2014-01-20', '2014-01-20 14:24:00', 'Kasubag Keu & Kepeg \r\n- Disiapkan  SPPD   26/1   2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(53, 1, 3, 53, '17.01/panpel.penas/kab.mlg/1/21014', '', 'Panpel PENAS petani nelayan XIV Th.2014 Kab.malang', 'Undangan Rapat Koordinasi Antara Panitia Penyelengaraan Pusat , Panitia Pelaksanaan Provinsi dan Kabupaten Malang Penas Petani Nelayan XIV Tahun 2014 Selasa, 21 Januari 2014 .', '2014-01-21', '2014-01-21 12:03:00', '', ''),
(54, 1, 3, 54, '51/VII.05/0114', '', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Penyerahan Kartu Peserta BPJS Kesehatan Pada Hari Kamis, 23 Januari 2014 di Pendopo Kab. Malang (Kepanjen)', '2014-01-21', '2014-01-21 12:13:00', 'Acara Ditunda Sambil Menunggu Radiogram Gubernur 22/1 2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(55, 1, 3, 55, '005/584/023/2014', '', 'Panpel Penas Petani Nelayan XIV Tahun 2014 Kab, Ma', 'Rapat Koordinasi PENAS Petani Nelayan XVI,Selasa, 21 Januari 2014, Jam 09:00 WIB Disangrila Hotel - Surabaya', '2014-01-21', '2014-01-21 12:16:00', 'Kasubag Ae\r\nUntuk Di File Khusus Kepanitiaan \r\nTakut Sewaktu Waktu Diperlukan    22/1   2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(56, 1, 3, 56, '005/530/043/2014', '', '04', 'Undangan Penutupan Parade Pangan Nusantara 2014 Minggu 19 Januari 2014 Pkl.18:30 WIB Dilapangan Rampal Malang', '2014-01-21', '2014-01-21 12:19:00', '', ''),
(57, 1, 3, 57, '055/148/421.032/2014', '', 'BAGIAN TATA USAHA', 'UNDANGAN', '2014-01-21', '2014-01-21 12:21:00', '', ''),
(58, 1, 3, 58, '005/178/421.032/2014', '', 'BAGIAN TATA USAHA', 'UNDANGAN', '2014-01-21', '2014-01-21 12:22:00', '', ''),
(59, 1, 3, 59, '005/133/421.050/2014', '', 'DPRD KABUPATEN MALANG', 'Permohonan Penugasan pada Rapat Kerja Komisi C dan D DPRD Kab. Malang Rabu, 22 Januari 2014 di RR Komisi C dan D DPRD Kab. Malang  ', '2014-01-17', '2014-01-20 13:54:00', 'File     20/1   2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(60, 1, 3, 60, '10/007/PT-KA/DIR/I/2014', '', 'PT. BPR Artha Kanjuruhan Pemkab. Malang', 'Undangan Rapat Umum Pemegang Saham Luar Biasa PT.BPR Artha Kanjuruhan Pemkab.Malang Rabu, 22 Januari 2014 Pkl 13.00 Wib di Ruang Rapat Kartanegara Kab. Malang', '2014-01-17', '2014-01-20 11:40:00', 'File     20/1    2014\r\n', 'E:\\SCAN SURAT\\IMG.jpg'),
(61, 1, 3, 61, '100/082/421.011/2014', '', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Laporan Rencana Audiensi Ka BPSDMP Kementan dan Panitia PENAS Ke-14 ', '2014-01-20', '2014-01-20 08:40:00', '', ''),
(62, 1, 3, 62, '10/008/PT-AK/DIR/I/2014', '', 'PT-A', 'Undangan Rapat Umum Pemegam Saham Luar Biasa PT.BPR Artha Kanjuruhan Pemkab.Malang Rabu, 22 Januari 2014 Pkl 13.00 Wib di Ruang Rapat Kertanegara Kab. Malang', '2014-01-17', '2014-01-20 11:40:00', '', ''),
(63, 1, 3, 63, '055/134/421.050/2014', '', 'DPRD KABUPATEN MALANG', 'Permohonan Penugasan Pada Rapat Kerja Komisi C dan D DPRD Kab. Malang Kamis 23 Januari 2014 di RR Komisi C dan D DPRD Kab.Malang-TEMBUSAN', '2014-01-17', '2014-01-20 13:57:00', 'File      20/1   2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(64, 1, 3, 64, '012/UA-MLG/Dir/2014', '', 'PT.Unicora Agung', 'Pemberitahuan dan Permohonan ', '2014-01-16', '2014-01-17 10:52:00', '', ''),
(65, 1, 3, 65, '900/54/421.119/2014', '', 'DPPKA', 'Surat Pengantar dan Data Laporan Program Kegiatan dan Pelaksanaan Pekerjaan Triwulan IV DPPKA TA 2014', '2014-01-20', '2014-01-22 08:36:00', '', ''),
(66, 1, 3, 66, '040/022/421.211/2014', '', 'BADAN PERPUS, ARSIP & DOKUMENTASI', 'Laporan Pelaksanaan Kegiatan Bina Desa ', '2014-01-20', '2014-01-21 10:24:00', '', ''),
(67, 1, 3, 67, '503/0223/421.302/2014', '', 'UPT PERIJINAN', 'Data yang Terkait dengan Pelaksanaan Kegiatan Bina Desa Sukoanyar Kec. Pakis 15-16 Januari 2013 ', '2014-01-17', '2014-01-21 10:58:00', '', ''),
(68, 1, 3, 68, '055/26/421.607/2014', '', 'Camat Pakisaji Kab. Malang', 'Laporan Kegiatan Camat Pakisaji Bagian Bulan Desembar Tahun 2013', '2014-01-10', '2014-01-21 11:32:00', '', ''),
(69, 1, 3, 69, '331.1/140/Diklat', '', 'Plt. Badan Diklat Kementrian Dalam Negeri RI', 'Diklat Peningkatan Kapasitas Camat', '2014-01-13', '2014-01-20 12:24:00', '', ''),
(70, 1, 3, 70, '100/029/421.214/2014', '', 'KANTOR PERUMAHAN', 'Laporan Hasil Pelaksanaan Bina Desa di Desa Sukoanyar Kec. Pakis', '2014-01-21', '2014-01-21 14:24:00', '', ''),
(71, 1, 3, 71, '300/33/421.607/2014', '', 'Camat Pakisaji Kab. Malang', 'Laporan Kejadian Kriminal Wilayah Kec.Pakisaji Bagian Bulan Desember Tahun 2013', '2014-01-16', '2014-01-16 16:30:00', '', ''),
(72, 1, 3, 72, '511.1/31/421.607/2014', '', 'Camat Pakisaji Kab. Malang', 'Laporan NTCR Bagian Bulan Desember 2013 Kec. Pakisaji', '2014-01-17', '2014-01-21 13:34:00', '', ''),
(73, 1, 3, 73, '003/BPD.SP/I/2014', '', 'Pemerintah Kab. Malang Kec. Sumbermanjing Wetan ', 'Laporan Peristiwa Kerusuhan di Balai Desa Sumbermanjing Wetan Tgl 13 Januari 014', '2014-01-13', '2014-01-17 11:43:00', '', ''),
(74, 1, 3, 74, '012/UA-MLG/Dir/2014', '', 'PT.Unicora Agung', 'Pemberitahuan dan Permohonan', '2014-01-16', '2014-01-17 10:52:00', '', ''),
(75, 1, 3, 75, '900/54/421.119/2014', '', 'DPPKA', 'Surat Pengantar dan Data Laporan Program Kegiatan dan Pelaksanaan Pekerjaan Triwulan IV DPPKA Tahun Anggaran 2014', '2014-01-20', '2014-01-22 08:36:00', '', ''),
(76, 1, 3, 76, '140/132/Diklat', '', 'Plt.Badan Diklat Kementrian Dalam Negeri RI', 'Diklat Pembinaan Manajemen Pemerintah Desa ', '2014-01-13', '2014-01-20 12:24:00', '', ''),
(77, 1, 3, 77, '141/18/421.602/2014', '', 'Camat Pujon Kabh. Malang', 'Penundaan Pelaksanaan Pemilihan Kepala Desa ', '2014-01-17', '2014-01-21 12:24:00', '', ''),
(78, 1, 3, 78, '-', '', 'Rosari Nawang Savitrie, SH, M.Kn Notaris Kab. Mala', 'Penyampaian Keputusan Menteri Hukum dan HAM RI No.AHU 716.AHA.02.01 Tahun 2013 Tentang Pengangkatan Notaris ', '2014-01-15', '2014-01-21 09:24:00', '', ''),
(79, 1, 3, 79, '05/I/AN/2014', '', 'Anies Ambarwati, SH,M.Kn - Notaris PPAT', 'Berita Acara Sumpah', '2014-01-11', '2014-01-21 13:40:00', '', ''),
(80, 1, 3, 80, '096/FH-UB/D/XII/2013', '', ' Fakultas Hukum Universitas Borobudur Jakarta', 'Sosialisasi Naskah Akademik Rapenda Kawasan Tanpa Rokok', '2013-12-12', '2014-01-20 14:24:00', '', ''),
(81, 1, 3, 81, '482.1/247/421.032/2014', '', 'BAGIAN TATA USAHA', 'Himbauan Mendengarkan Talk Show', '2014-01-24', '2014-01-24 14:35:00', 'File khusus Talk Show ', 'E:\\SCAN SURAT\\IMG.jpg'),
(82, 1, 3, 82, '800/93/421.202/2014', '', 'BKD', 'Permohonan  Data Formasi PNS Tahun 2014', '2014-01-24', '2014-01-24 14:38:00', 'Untuk dicukupi sesuai isi surat\r\nTerakhir 7 Februari 2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(83, 1, 3, 83, '032/229/421.119/2014', '', 'DPPKA', 'Pemutakhiran Data  Kendaraan Dinas Pada SIMBADA ', '2014-01-24', '2014-01-24 14:49:00', 'Untuk dicukupi (Termasuk Sepeda Motor )\r\nKoordinasikan juga untuk Kendaraan N 11,12,13,14 Pemeliharaannya di TU tapi kepemilikannya di Umum\r\nWaktu 7 Hari dari Sekarang', 'E:\\SCAN SURAT\\IMG.jpg'),
(84, 1, 3, 84, '100/40/421.011/2014', '', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Penyampaian Data Laporan Penyelenggara Pemerintah Daerah ( LPPD ) Tahun  2013', '2014-01-24', '2014-01-24 14:56:00', 'Untuk dicukupi sesuai Form (Form bisa di sesuaikan)\r\nKirim melalui E-mail (disertai data pendukung)\r\nTerakhir tanggal 27 Januari 2014 (Surat diterima 24 Januari 2014 untuk disesuaikan dg koordinasi Tapum)', 'E:\\SCAN SURAT\\IMG.jpg'),
(85, 1, 3, 85, '005/143/421.032/2014', '', 'BAGIAN TATA USAHA', 'Undangan Peringatan Maulid Nabi Muhmammad SAW Tingkat Kab. Malang Tahun 1435H/2014 M, Hari Selasa,4 Februari 2014 Pukul 08.30 WIB di Pendopo Kab. Malang Jl.Raden Panji No 58- Kepanjen ', '2014-01-27', '2014-01-27 12:50:00', 'Ajak Staf mengikuti acara dimaksud', 'E:\\SCAN SURAT\\IMG.jpg'),
(86, 1, 2, 86, '180/17/421.013/2014', '', 'BAGIAN HUKUM', 'Penanganan Masalah Hukum Bidang Perdata dan Tata Usaha Negara', '2014-01-27', '2014-01-27 12:56:00', 'File Khusus di aturan- aturan (Kerjasama)', 'E:\\SCAN SURAT\\IMG.jpg'),
(87, 1, 3, 87, '005/280/421.032/2014', '', 'BAGIAN TATA USAHA', 'Undangan Rapat Koordinasi Persiapan Penas Petani Nelayan Ke-XIV Tahun 2014, Hari Selasa,28 Januari 2014 Oukul 13.00 WIB di Ruang Rapat Sekretaris Daerah ( Lantai II ) Jl.Merdeka Timur No 3 Malang', '2014-01-27', '2014-01-27 13:14:00', 'Saya Hadir   27/1   2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(88, 1, 3, 88, '800/084/421.118/2014', '', 'DINAS PETERNAKAN', 'Kalender Kegiatan Promosi', '2014-01-27', '2014-01-27 13:56:00', '', ''),
(89, 1, 4, 89, '005/227/421.032/2014', '', 'BAGIAN TATA USAHA', 'Undangan Sosialisasi dan Pelatihan Sistem Informasi Rencana Umum Pengadaan (SIRUP), Hari Selasa,28 s/d 29 Januari 2014 Pukul 08.00 WIB di Hotel Haris Jl. A. Yani Utara Riverside Blok C-1- Malang', '2014-01-27', '2014-01-27 14:26:00', 'Untuk Dihadiri Ajak Staf Yang Terkait Pengadaan    27/1 2014 ', ''),
(90, 1, 3, 90, '653/142/421.214/2014', '', 'KANTOR PERUMAHAN', 'Surat Edaran tentang Pemberitahuan Kembali untuk Pendaftaran Perumahan Pegawai Negeri Sipil (PNS) Kabupaten Malang', '2014-01-17', '2014-01-28 10:09:00', 'Sosialisasikan pada Staf     30/1   2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(91, 1, 3, 91, '0094/02.06.2B/UTD/I/2014', '', 'PMI Kabupatem Malang ', 'Permohonan Rekomendasi Penyesuaian Tarif Biaya Pengganti  Pengolahan DARAH ( bppd ) PMI Kab. Malang', '2014-01-22', '2014-01-28 13:31:00', '', 'E:\\SCAN SURAT\\IMG.jpg'),
(92, 1, 3, 92, '017/Pms-MLG/Penawaran /I/2014', '', 'BRANCH MANAGER PRODIO- MALANG ', 'Penawaran Kerjasama .', '2014-01-23', '2014-01-28 13:36:00', 'Buat Surat ke SKPD Untuk Bisa Menggunakan  Prodio. Sifatnya hanya Hibauan   30/1   2014', ''),
(93, 1, 3, 93, '005/316/421.032/2014', '', 'BAGIAN TATA USAHA', 'Rapat  Koordinasi Bidang Kepanitiaan Penas Petani Nelayan  XIV Tahun 2014  Pada Hari Rabu  29 Januari 2014 Jam  09.00 WIB Tempat Ruang Anusapati ', '2014-01-29', '2014-01-29 08:00:00', 'File    30/1   2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(94, 1, 3, 94, '877/253/421.202/2014', '', 'BKD', 'Pelantikan Pejabat Struktural Eselon III', '2014-01-29', '2014-01-29 08:57:00', 'Disiapkan Undangannnya    2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(95, 1, 3, 96, '800/93/421.202/2014', '', 'BKD', 'Permohonan Data Formasi  Pns Tahun 2014.', '2014-01-29', '2014-01-29 09:49:00', 'Surat Asli di Keu dan Kepeg         30/1   2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(96, 1, 3, 97, '005/321/421.032/2014', '', 'BAGIAN TATA USAHA', 'Undangan Rapat Paripurna, Hari Kamis,30 Januari 2014 Pukul 13.00 WIB s/d Selesai Tempat Ruang Rapat Paripurna  DPRD Kab. Malang Jl.Panji No 119 Kepanjen', '2014-01-29', '2014-01-29 11:07:00', 'Untuk Dihadiri       30/1 2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(97, 1, 3, 98, '005/315/421.032/2014', '', 'BAGIAN TATA USAHA', 'Undangan Launching Pemain Arema Cronus, Hari Rabu,29 Januari 2014 Pukul 18.00 WIB di Stadion Kanjuruhan Jl. Trunojoyo- Kepanjen', '2014-01-29', '2014-01-29 11:12:00', 'File   30/1   2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(98, 1, 3, 99, '005/326/421.032/2014', '', 'BAGIAN TATA USAHA', 'Undangan Menerima Konvoi Arema Cronus, Hari Rabu,29 Januari Pukul 15.30 WIB di Pendopo Kepanjen Kab. Malang Jl. Panji 158- Kepanjen', '2014-01-28', '2014-01-29 11:18:00', 'File   30/1   2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(99, 1, 3, 100, '005/314/421.032/2014', '', 'BAGIAN TATA USAHA', 'Undangan Pengambilan Sumpah Jabatan dan Pelantikan Penjabat Struktural Eselon III di Lingkungan Pemerintah Kab.Malang Hari Rabu,29 Januari 2014 Pukul 08.00 WIB di Ruang Anosapati (Lantai II) Jl. Merdeka Timur No 3 Malang', '2014-01-28', '2014-01-29 11:20:00', 'File    20/1   2014\r\n', 'E:\\SCAN SURAT\\IMG.jpg'),
(100, 1, 3, 101, '001/Ex.S.Undangan/AREMA/I/2014', '', 'AREMA', 'Undangan Launching Pemain Arema yang akan mengikuti Kompetisi Rabu,29 Januari 2014 Pkl. 18.30 WIB di Stadion Kanjuruhan Kepanjen', '2014-01-28', '2014-01-28 11:24:00', 'File   30/1   2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(101, 1, 3, 102, '005/172/421.050/2014', '', 'DPRD KABUPATEN MALANG', 'Permohonan Bantuan Menugaskan Rapat Paripurna DPRD Kamis,30 Januari 2014 Pkl.13.00 di RR Paripurna DPRD Kab. Malang', '2014-01-24', '2014-01-28 11:28:00', 'Buat Undangan  Ybs Sesuai Permohonan  20/1  2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(102, 1, 4, 103, '005/161/421.050/2014', '', 'DPRD KABUPATEN MALANG', 'Permohonan Penugasan Paeda Rapat Komisi  A DPRD Kab. Malang Kamis 30 Januari 2014 Pkl. 09.00 Wib di RR Komisi DPRD Kab Malang', '2014-01-23', '2014-01-29 13:59:00', 'File   30/1 2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(103, 1, 3, 104, '021/Pan.Dies?PPL-MLG/I/2014', '', 'Panitia Dies Natalis Papala''s Malang ', 'Undangan Penanaman 1000 Pohon Penghijauan Bersama Masyarakat Desa Pandansari Pada hari Minggu 2 Pebruari 2014 Pkl. 08.00 Wib ', '2014-01-29', '2014-01-29 14:21:00', 'Kordinasi Dengan Bag. Umum   Segera Karena Tanggal 2 Pelaksanaannya     30/1    2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(104, 1, 3, 105, '800/156/212/2014 ', '', 'Sekda Provinsi Jawa Timur ', 'Bantuan Menugaskan Sekda Pada Rapat Koordinasi Kepegawaian Se Jatim Tahun 2014 ada Hari Selasa Rabu 21 - 22 Januari 2014 di Hotel Singhasana Surabaya ', '2014-01-29', '2014-01-29 14:38:00', 'File    20/1 2014', ''),
(105, 1, 3, 106, '005/151/421.050/2014', '', 'DPRD KABUPATEN MALANG', 'Bantuan Menugaskan Pada Acara Rapat Kerja dengan DPRD Kab. Malang  Pada Hari Senin 27 Januari 2014 Pkl. 10.00 di  RR Komisi DPRD Kab. Malang ', '2014-01-22', '2014-01-29 14:42:00', 'File      30/1    2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(106, 1, 4, 107, '005/160/421.050/2014', '', 'DPRD KABUPATEN MALANG', 'Permohonan Penugasan Pada Rapat Kerja Komisi A,B,C Dan D DPRD  Kab Malang   Rabu  29 Januari 2014 Pkl. 09.00 Wib Di RR Komisi  A,B,C dan D DPRD Kab. Malang', '2014-01-23', '2014-01-29 14:47:00', 'File      30/1    2014\r\n', 'E:\\SCAN SURAT\\IMG.jpg'),
(107, 1, 4, 108, '005/158/421.050/2014', '', 'DPRD KABUPATEN MALANG', 'Permohonan Bantuan Menugaskan pada Kunjungan Kerja DPRD Kota Madiun ke DPRD Kab. Malang  Jumat 24 Januari 2014 Pkl. 09.00 Wib di RR serbaguna DPRD Kab. Malang ', '2014-01-23', '2014-01-29 14:53:00', 'File  20/1    2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(108, 1, 3, 109, '100/299/421.011/2014', '', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Kegiatan Bina Desa ke 22 di Desa Jatisari Kec. Pakisaji pada hari  Rabu- Kamis Tgl. 12-13  Februari 2014 Tempat Desa Jatisari Kec. Pakisaji', '2014-01-28', '2014-01-30 09:04:00', 'Untuk Disiapkan Jika ada Rakor\r\nKoordinasi Tapum  30/1  2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(109, 1, 3, 110, '-', '', 'DPRD Kab. Malang ', 'Rapat Paripurna Istimewa DPRD Kab. Malang  Pada Hari Kamis Tanggal 30 Januari 2014 Pkl. 10.00 Wib Tempat Ruang Rapat Paripurna DPRD Kab. Malang Jl. Panji No. 119 Kepanjen', '2014-01-29', '2014-01-29 09:46:00', 'File      30/1   2014', ''),
(110, 1, 3, 111, '005/369/421.032/2014', '', 'BAGIAN TATA USAHA', 'Rakor Persiapan Penyelenggaraan Pekan Nasional  ( PENAS ) Petani Nelayan XIV Tahun 2014 Yang dihadiri Oleh Menteri Pertanian RI pada Hari Senin  Tgl. 3 Pebruari 2014 Waktu 07.30 Tempat Pendopo Agung Kab, Malang ', '2014-01-30', '2014-01-30 14:11:00', 'File Undangan    4/2   2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(111, 1, 3, 112, '005/370/421.032/2014', '', 'BAGIAN TATA USAHA', 'Pengukuhan Guru yang diberi Tugas Tambahan Sebagai Kepala Sekolah Pada Dinas Pendidikan dan Dokter/Dokter Gigi Yang Diberi Tugas Tambahan SEbagai Kepala UPTD Puskesmas Pada Dinas Kesehatan Di Lingkungan Pemerintah  Kab. Malang.', '2014-01-30', '2014-01-30 14:18:00', 'File Undangan   4/2 2014\r\n', 'E:\\SCAN SURAT\\IMG.jpg'),
(112, 1, 4, 114, '800/283/421.110/2014', '', 'DINAS PENGAIRAN', 'Kalender Tahun 2014 Dari Dinas Pengairan Kab. Malang', '2014-02-03', '2014-02-03 10:17:00', 'Kalender Sudah Diterima Pak Ubet Yahya Tgl   03/2   2014    \r\n 200 Exp File Khusus  " Setor Kalender   4/2   2014', ''),
(113, 1, 3, 115, '041/028/421.211/2014', '', 'BADAN PERPUS, ARSIP & DOKUMENTASI', 'Bintek Pendampingan Bagi Pengelola Perpusdes/Kelurahan Tahun 2014', '2014-01-27', '2014-01-30 11:04:00', 'File Perjalanan Dinas Sekda    4/2   2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(114, 1, 3, 116, '050/037/DPKP/JT-I/2014', '', 'Dewan Pengurus KORPRI Provinsi Jawa Timur', 'Undangan Rapat Sosialisasi MTQ KORPRI Tahun 2014 Tgl. 4 - 5 Pebruari 2014  Pkl. 14,00 -17.00 Wib di Hotel Satelit - Surabaya', '2014-02-03', '2014-02-03 15:07:00', 'Untuk Dicukupi Ke Bintal & Bag Humas    dan Kemeneg Kab. Malang', 'E:\\SCAN SURAT\\IMG.jpg'),
(115, 1, 3, 117, '440/304/421.103/2014', '', 'DINAS KESEHATAN', 'Permohonan Untuk Penyerahan Ambulance 14 Unit Untuk Puskesmas Sumber Dana APBD 2013  Oleh Bapak Bupati ', '2014-02-03', '2014-02-04 07:53:00', 'Untuk Dikoordinasikan Dengan Umum  dan Tapemdes  Untuk Pelaksanaannya    4/2   2014  \r\nAe. Saya Sudah Koordinasi Dengan Bagian Umum       ', 'E:\\SCAN SURAT\\IMG_0001.jpg'),
(116, 1, 3, 118, '700/66/421.201/2014', '', 'INSPEKTORAT', 'Permintaan Laporan Keuangan Ta. 2013', '2014-01-27', '2014-02-04 11:21:00', '', ''),
(117, 1, 3, 119, '877/357/421.202/2014', '', 'BKD', 'Pengukuhan Guru Yang diberi Tugas Tambahan Sebagai Kepala Sekolah Pada Dinas Pendidikan dan Dokter/Dokter Gigi Yang Diberi Tugas Tambahan Sebagai Kepala UPTD Puskesmas Pada Dinas Kesehatan di Lingkungan Pemkab. Malang', '2014-02-04', '2014-02-04 13:22:00', 'File', ''),
(118, 1, 3, 120, '005/171/421.050/2014', '', 'DPRD KABUPATEN MALANG', 'Undangan Rapat Paripurna DPRD Kamis 30 Januari 2014 Pkl. 13,00 Wib di RR Paripurna DPRD Kab. Malang ', '2014-02-03', '2014-02-03 09:27:00', 'File Undangan   4/12    2014', ''),
(119, 1, 4, 122, '005/225/021/2014', '', 'Kepala Biro Administrasi Perekonomian Jatim ', 'Peraturan PresidenNo. 74 Tahun 2013 Tentang Pengawasan Dan Pengendalian  Minuman Berakohol. ', '2014-02-04', '2014-02-04 14:27:00', 'Surat Asli Di Bu Yuli    ( Paraf Pak Sek )   13/1 2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(120, 1, 4, 123, '470/327/Sj', '', 'Mendagri RI', 'Perubahan Kebijakan Dalam Penyelenggaraan Administrasi Kependudukan ', '2014-02-04', '2014-02-04 14:34:00', 'Surat Asli Di Bu Yuli    29/ 1    2014    ( Ada Paraf Pak Sekda )', 'E:\\SCAN SURAT\\IMG.jpg'),
(121, 1, 4, 124, '900/326/SJ', '', 'Mendagri RI', 'Larangan Pungutan Uang Dalam Dalam Memberikan Pelayanan Administrasi Kependudukan   ', '2014-02-04', '2014-02-04 14:37:00', 'Surat Asli Di Bu Yuli Ada Parab Bpk Sekda     29/1   2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(122, 1, 2, 125, '700/66/421.201/2014', '', 'INSPEKTORAT', 'Permintaan Laporan Keuangan Tahun Anggaran 2013', '2014-01-27', '2014-02-05 09:34:00', 'Untuk Disiapkan', 'E:\\SCAN SURAT\\IMG.jpg'),
(123, 1, 3, 126, '005/427/421.032/2014', '', 'BAGIAN TATA USAHA', 'Undangan Rapat  Koordinasi Pelaksanaan Bina Desa (Bhakti Sosial Menata Desa) di Desa Jatisari Kec. Pakisaji Hari Kamis,6 Februari 2014 Pukul 09.00 WIB di Ruang Anusapati Lantai II Jl. Merdeka Timur No 3 Malang', '2014-02-05', '2014-02-05 13:09:00', 'File', ''),
(124, 1, 3, 127, '306/III.4.AU/C-11/2014', '', 'Kepala Sekolah SMK Muhammadiyah 1 Kepanjen', 'Undangan Peresmian Gedung Baru Dan Peletakan Batu Pembangunan Kampus II Pada Hari Kamis, 13 Pebruari 2014 Pkl. 09.00 di Halaman SMK Muhammadiyah Kepanjen.', '2014-03-03', '2014-02-06 11:32:00', 'Acara Ditunda pada Hari Selasa,18 Februari 2014 Pkl. 09.00 WIB', 'E:\\SCAN SURAT\\IMG_0063.jpg'),
(125, 1, 3, 128, '032/431/421.119/2014', '', 'DPPKA', 'Pensertifikatan Tanah Asset Pemerintah Kab, Malang ', '2014-01-30', '2014-02-06 14:21:00', 'Jika ada Isi  form yang telah di sediakan  7/2    2014', 'E:\\SCAN SURAT\\IMG_0002.jpg'),
(126, 1, 3, 129, '0071/Media Redaksi/II/2014', '', 'Redaksi Selalu Pas di Hati', 'Penawaran Iklan', '2014-02-03', '2014-02-07 11:27:00', '', ''),
(127, 1, 3, 130, '700/76/421.201/2014', '', 'INSPEKTORAT', 'Pemeriksaan Reguler (PKPT) Tahun 2014 Inspektorat Kab. Malang', '2014-02-05', '2014-02-07 11:29:00', 'Untuk Disiapkan    7/2   2013', 'E:\\SCAN SURAT\\IMG_0002.jpg'),
(128, 1, 3, 131, '005/436/421.032/2014', '', 'BAGIAN TATA USAHA', 'Undangan Bina Desa (Bhakti Sosial Menata Desa) Hari Rabu,12-13 Februari 2014 Pukul 14.00 WIB di Desa Jatisari Kec. Pakisaji', '2014-02-07', '2014-02-07 11:30:00', 'saya Hadir', 'E:\\SCAN SURAT\\IMG_0002.jpg'),
(129, 1, 3, 132, '440/445/421.032/2014', '', 'BAGIAN TATA USAHA', 'Penawaran Labotarium Klinik Prodia sebagai Laboratorium Perujuk dalam Melayani Jasa Pemeriksaan ', '2014-02-07', '2014-02-07 11:34:00', 'Untuk Disosialisasikan pada Staf   7/2   2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(130, 1, 3, 133, '034/l.07/U.II/PK/2014', '', 'Rektor Unisma ', 'Permohonan Kunjungan Silaturahmi Kamis, 27 Pebruari 2014 Pkl. 10.00 Wib', '2014-02-03', '2014-02-07 13:49:00', 'Koordinasi Dengan Bagian Hukum dan Kerjasama ', 'E:\\SCAN SURAT\\IMG.jpg'),
(131, 1, 3, 134, '005/451/421.032/2014', '', 'BAGIAN TATA USAHA', 'Rapat Paripurna Pada Hari Senin Tgl. 10 Pebruari 2014 Jam 10.00 Wib  Tempat Ruang Rapat Paripurna DPRD Kab. Malang. di Kepanjen ', '2014-02-07', '2014-02-07 14:13:00', 'Saya Hadir ', 'E:\\SCAN SURAT\\IMG.jpg'),
(132, 1, 3, 135, 'B/23/II/2014/BNNK', '', 'BNN Kabupaten  Malang', 'Ucapan Terima Kasih  Telah Menempatkan PNS Untuk Dipekerjakan Pada BNN Kab. Malang', '2014-02-10', '2014-02-10 09:24:00', 'File Khusus BNN', 'E:\\SCAN SURAT\\IMG.jpg'),
(133, 1, 3, 137, '045.021/253/421.211/2014', '', 'BADAN PERPUS, ARSIP & DOKUMENTASI', 'Prosedur Administrasi Pengelolaan Arsip di Lingkungan Pemerintah Kab. Malang', '2014-02-10', '2014-02-10 10:31:00', 'Bisa Dimanfaatkan Peluang untuk melakukan penyusutan Arsip\r\nKopikan untuk Kabag\r\nKita Pelajari sama-sama Arsip yang bagaimana yang bisa disusutkan', 'E:\\SCAN SURAT\\IMG_0002.jpg'),
(134, 1, 3, 138, '482.1/456/421.032/2014', '', 'BAGIAN TATA USAHA', 'Himbauan Mendengarkan Talk Sho ', '2014-02-10', '2014-02-10 12:45:00', 'File\r\nSosialisasi Staf agar Ikut Mendengarkan', 'E:\\SCAN SURAT\\IMG_0019.jpg'),
(135, 1, 3, 139, 'B/289/II/2014', '', 'Kapolres Malang', 'Undangan Acara Apel Gelar Pasukan Ops Mantap Brata dan bertindakn sebagai Pimpinan Apel pada Hari Sabtu,8 Februari 2014 pkl 08.00 di Stadion Luar Kanjuruhan', '2014-02-05', '2014-02-06 14:24:00', 'Acara ditunda pada Tanggal 18 Februari 2014 Hari Selasa Pkl. 09.00 WIB', 'E:\\SCAN SURAT\\IMG.jpg'),
(136, 1, 3, 140, 'S-113/WKN.10/2014', '', 'Ditjen Kekayaan Negara Kantor Wilayah Jawa Timur', 'Pengelolaan BMN yang berasal dari Dana Dekonsentrasi dan Tugas Pembantuan sebelum Tahun Anggaran 2014', '2014-01-23', '2014-02-03 14:32:00', 'Surat Asli di B.Yuli ada Paraf Bpk. Sekda', 'E:\\SCAN SURAT\\IMG.jpg'),
(137, 1, 3, 141, 'B-106/01-15/01/2014', '', 'Komisi Pemberantasan Korupsi RI', 'Himbauan untuk tidak menggunankan anggaran program sosialisasi /publikasi,iklan/promosi dan kampanye di Kementrian /Lembaga/ Pemerintah Daerah untuk kepentingan pribadi/kelompok', '2014-01-17', '2014-02-11 09:30:00', 'Surat di File Khusus Bu. Yuli', 'E:\\SCAN SURAT\\IMG.jpg'),
(138, 1, 3, 142, '005/225/021/2014', '', 'Kepala Biro Administrasi Perekonomian Jatim', 'Peraturan Presiden RI No.74 Tahun 2013 tentang Pengawasan dan Pengendalian Minuman Berakohol', '2014-01-08', '2014-02-11 10:21:00', 'Surat ada di File Khusus Bu. Yuli', 'E:\\SCAN SURAT\\IMG.jpg'),
(139, 1, 3, 143, '424/13217/101.5/2013', '', 'Gubernur Jawa Timur', 'Surat Edaran Pelaksanaan Program JKN dan Jamkesda Tahun 2014', '2013-12-31', '2014-02-11 10:30:00', 'File Khusus di Bu. Yuli', 'E:\\SCAN SURAT\\IMG.jpg'),
(140, 1, 3, 144, '4547//C/LN/2013', '', 'Dirjen Pendidikan Dasar Kementrian Pendidikan dan ', 'Tawaran Hibah peningkatan kapasitas Kabupaten/Kota untuk Penerapan SPM Dikdas (Tembusan)', '2013-12-31', '2014-02-11 10:33:00', 'File Khusus di Bu. Yuli', 'E:\\SCAN SURAT\\IMG.jpg'),
(141, 1, 3, 145, '431/5724/218/2013', '', 'Kantor Perwakilan Pem.Prov. Jatim di Jakarta', 'Jadwal gelar seni budaya di Anjungan Jatim TMII Jakarta Tahun 2014', '2013-12-31', '2014-02-11 10:38:00', 'File Khusus di Bu. Yuli', 'E:\\SCAN SURAT\\IMG.jpg'),
(142, 1, 3, 146, '420/176/SJ', '', 'Menteri Dalam Negeri RI dan Menteri Pendidikan dan', 'Implementasi Kurikulum 2013', '2014-01-09', '2014-02-11 10:41:00', 'File Khusus di Bu.Yuli', 'E:\\SCAN SURAT\\IMG.jpg'),
(143, 1, 3, 147, 'K.26-30/V.1-1/99', '', 'Badan Kepegawaian Daerah', 'Pengadaan Calon PNS Formasi Tahun Anggaran 2013', '2013-12-24', '2014-02-11 10:46:00', 'File Khusus di Bu. Yuli', 'E:\\SCAN SURAT\\IMG.jpg'),
(144, 1, 3, 148, 'S.08/BPKH.XI-4/2014', '', 'Balai Pemantapan Kawasan Hutan Wilayah XI Jawa- Ma', 'Penataan Batas Kawasan Hutan terkait Proses TMKH an, Bupati Malang', '2014-01-08', '2014-02-11 10:49:00', 'File Khusus di Bu. Yuli', 'E:\\SCAN SURAT\\IMG.jpg'),
(145, 1, 3, 149, '414.1/201/206/2014', '', 'Badan Pemberdayaan Masyarakat Prov. Jatim', 'Teguran Pertama Laporan Pelaksanaan Kegiatan dan SPJ Bantuan Hibah Program/Kegiatan Tahun 2013', '2014-01-15', '2014-02-11 10:54:00', 'File Khusus di Bu. Yuli', 'E:\\SCAN SURAT\\IMG.jpg'),
(146, 1, 3, 150, '126/Permentan/OT.140/12/2013', '', 'Menteri Pertanian RI', 'Peraturan Menteri Pertanian RI tentang Penugasan Bupati/ Walikota dalam Pengelolaan Kegiatan dan Tanggung Jawab Dana Tugas Pembantuan Kab/Kota TA.2014', '2013-12-10', '2014-02-11 10:58:00', 'File Khusus di Bu. Yuli', 'E:\\SCAN SURAT\\IMG.jpg'),
(147, 1, 3, 151, 'B-14160/MENLH/PDAL/12/2013', '', 'Menteri Lingkungan Hidup RI', 'Arahan mengenai Pengecualian Penyusunan Dokumen Amdal Terhadap Lokasi Rencana Usaha dan/atau Kegiatan yang Berada Pada Kabupaten/ Kota yang telah Memiliki Rencana Detail Tata Ruang (RDTR) dan/atau Rencana Tata Ruang Kawasan Strategis ( RTRKS) Kabupat', '2013-12-27', '2014-02-11 11:03:00', 'File Khusus di Bu. Yuli', 'E:\\SCAN SURAT\\IMG.jpg'),
(148, 1, 3, 152, '470/327/SJ', '', 'MENDAGRI RI', 'Perubahan Kebijakan dalam Penyelenggaraan Administrasi Kependudukan', '2014-02-11', '2014-02-11 11:12:00', 'File Khusus di Bu. Yuli', 'E:\\SCAN SURAT\\IMG.jpg'),
(149, 1, 3, 153, '900/326/SJ', '', 'MENDAGRI RI', 'Larangan Pungutan Uang dalam Memberikan Pelayanan Administrasi Kependudukan', '2014-01-17', '2014-02-11 11:17:00', 'File Khusus di Bu. Yuli', 'E:\\SCAN SURAT\\IMG.jpg'),
(150, 1, 3, 154, '100/132/421.031/2014', '', 'BAGIAN UMUM & PROTOKOL', 'Laporan Kegiatan Rapat Koordinasi Nasional II APKASI dan APEKSI', '2014-02-11', '2014-01-16 11:22:00', '', 'E:\\SCAN SURAT\\IMG.jpg'),
(151, 1, 3, 155, '120/54/421.615/2014', '', 'Camat Gedangan Kab. Malang', 'Laporan Jumlah TPS dan DPT se Kecamatan Gedangan', '2014-02-07', '2014-02-11 11:27:00', 'Kasihkan yeni file khusus untuk bahan lunch meeting 11 februari 2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(152, 1, 3, 156, '100/397/421.011/2014', '', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Himbauan Netralitas PNS dalam Pemilihan Umum Tahun 2014', '2014-01-04', '2014-02-11 13:03:00', 'file 11 februari 2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(153, 1, 3, 157, '005/230/421.050/2014', '', 'DPRD KABUPATEN MALANG', 'Permohonan Bantuan Penugasan Rapat Kerja pada selasa, 11 Februari 2014 pkl 13.00 Wib di RR Paripurna DPRD Kab.Malang ', '2014-02-10', '2014-02-10 13:26:00', 'Buat Undangan 11,februari 2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(154, 1, 3, 158, '005/232/421.050/2014', '', 'DPRD KABUPATEN MALANG', 'Permohonan Bantuan Penugasan Rapat Kerja pada Selasa ,11 Pebruari 2014 pkl 13.00 Wib di R Serbaguna DPRD Kab.Malang ', '2014-02-10', '2014-02-10 13:30:00', 'Buat Undangan 11,februari 2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(155, 1, 3, 159, '0051/MANCHUNG/REKTOR/II/2014', '', 'Universitas Ma Chung', 'Undangan dan Mendampingi Bapak Kemenristek pada acara Sosialisasi Peran MRCPP Senin,17 Februari 2014 Pkl 08.30 WIB. digedung The Core RnD Center Universitas Ma Chung Malang', '2014-02-03', '2014-02-12 08:23:00', 'Koordinasi dengan mas dimas \r\nDewan Riset Ada di litbang ( Koordinasi litbang) Khoirul Fathoni 0817535124', 'E:\\SCAN SURAT\\IMG.jpg'),
(156, 1, 3, 161, '005/232/421.050/2014', '', 'DPRD KABUPATEN MALANG', 'Permohonan Bantuan Penugasan Rapat Kerja Pada Selasa,11 Februari 2014 Pkl 13.00 WIB di R Serbaguna DPRD Kab.Malang -  Tembusan', '2014-02-10', '2014-02-12 10:33:00', 'file', 'E:\\SCAN SURAT\\IMG.jpg'),
(157, 1, 3, 162, '900/146/421.119/2014', '', 'Kepala Dinas Pendapatan,Pengelolaan Keuangan & Ass', 'Permohonan Memimpin Rapat TAPD pada hari Rabu,12 Februari 2014 pkl 08.30 di Ruang Rapat Sekda', '2014-02-05', '2014-02-12 10:38:00', 'Koordinasi DPPKA\r\nFile 12 februari 2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(158, 1, 3, 163, '005/224/421.050/2014', '', 'DPRD KABUPATEN MALANG', 'Permohonan Bantuan Menugaskan Pada Rapat Paripurna DPRD Kab. Malang Senin 10. Pebruari 2014 Pkl. 10.00 Wib di RR Paripurna DPRD Kab. Malang', '2014-02-07', '2014-02-10 09:32:00', 'Untuk dibuat Undangan\r\nbupati,Gdw,Dw,Pkk,Wabup', 'E:\\SCAN SURAT\\IMG.jpg'),
(159, 1, 3, 164, '005/195/421.050/2014', '', 'DPRD KABUPATEN MALANG', 'Permohonan Bantuan Menugaskan Pada Rapat paripurna DPRD Kab.Malang Selasa,4 Februari 2014 Pkl 13.00 WIB di RR Paripurna DPRD Kab.Malang', '2014-02-03', '2014-02-12 10:47:00', '', ''),
(160, 1, 3, 165, '10/007/PT - AK/DIR/I/2014', '', 'PT.BPR.Artha Kanjuruhan pemkab.Malang', 'Undangan Rapat Umum Pemegang Saham Luar Biasa PT.BPR Artha Kanjuruhan Pemkab.Malang Rabu,22 Januari 2014 pkl 13.00 WIB di ruang Rapat Kertanegara Kab.Malang', '2014-01-17', '2014-02-12 10:52:00', '', 'E:\\SCAN SURAT\\IMG_0001.jpg'),
(161, 1, 3, 166, '005/227/421.050/2014', '', 'DPRD KABUPATEN MALANG', 'Permohonan Penugasan Pada Rapat kerja komisi A,D dan Komisi C DPRD Kab.Malang Selasa 11 Februari 2014 di RR komisi A,D dan komisi C DPRD Kab.Malang', '2014-02-10', '2014-02-12 10:28:00', 'File', 'E:\\SCAN SURAT\\IMG.jpg'),
(162, 1, 3, 167, '019.4/059/426.31/2014', '', 'Sekda Probolinggo', 'Pemberitahuan', '2014-01-22', '2014-02-12 12:08:00', '', 'E:\\SCAN SURAT\\IMG.jpg'),
(163, 1, 3, 168, '005/319/216.2/2014', '', 'Bakorwil Pemerintahan & Pembangunan Malang', 'Undangan Rapat Koordinasi Fasilitasi dan Pemantauan Bencana Alam se Wilker Bakorwil Pemerintahan dan Pembangunan Malang Pada Hari  Kamis, 13 Pebruari 2014 Pkl. 09.00 Wib di Ruang Arjuno Kantor BAKORWIL Malang ', '2014-02-06', '2014-02-12 13:28:00', 'Diantar ke Bersangkutan   12 Peb. 2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(164, 1, 3, 169, '176/234/421.050/2014', '', 'DPRD KABUPATEN MALANG', 'Permohonan Bantuan Mendampingi Komisi C & D DPRD Kab.Malang Pada Kunjungan Kerja Ke Turen & Puskesmas Singosari Hari Rabu,12 Februari 2014 Pkl 10.00 Wib', '2014-02-11', '2014-02-13 10:53:00', 'File Khusus Undangan DPRD Tanggal 15 Februari 2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(165, 1, 3, 170, '005/319/216.2/2014', '', 'Bakorwil Pemerintah & Pembangunan Malang', 'Undangan Rakor ,Fasilitasi dan Pemantauan Bencana Alam Se Wilker Bakorwil Pemerintah dan Pembangunan Malang,Kamis 13 Februari 2014 Pkl. 09.00 WIB di ruang Arjuna Kantor BAKORWIL Malang ,Jl . Simpang Ijen no. 2 Malang', '2014-02-06', '2014-02-13 10:59:00', 'Teruskan pada Penjabat/ Instansi yang di Undang tgl 15 Februari 2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(166, 1, 3, 171, '700/88/421.201/2014', '', 'INSPEKTORAT', 'Permintaan Dokumen Dalam Rangka Pemeriksaan Pendahuluan atas LKPD TA 2013 dan Pertanggungjawaban Dana Bantuan Kepada Partai Politik TA. 2013 Pada Penerintah Kab. Malang.', '2014-02-14', '2014-02-14 09:36:00', 'Untuk Disiapkan   7/2  2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(167, 1, 3, 172, '005/642/421.032/2014', '', 'BAGIAN TATA USAHA', 'Undangan Tahlil Rutin pada Hari Kamis,20 Februari 2014 Pukul 17.00 WIB di Peringgitan Pendopo Agung Kab. Malang', '2014-02-18', '2014-02-18 10:02:00', 'saya hadir   18/2   2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(168, 1, 3, 173, '02/DPD.KAB/II/2014', '', 'Dewan Pengurus KORPRI Kab. Malang', 'Bantuan KORPRI untuk Bencana Alam Gunung Kelud', '2014-02-14', '2014-02-18 10:08:00', 'Bisa Ditarik Sumbangan Kepada Staf Yang Mau Menyumbang  18/2    2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(169, 1, 3, 174, '005/268/421.050/2014', '', 'DPRD KABUPATEN MALANG', 'Bantuan Menugaskan Tim Raperda beserta Kepala SKPD pada Rapat Kerja dengan Pansus DPRD Kab. Malang pada Hari Senin,17 Februari 2014,Selasa 25 Februari 2014 dan Rabu 26 Februari 2014', '2014-02-14', '2014-02-18 10:12:00', '', 'E:\\SCAN SURAT\\IMG.jpg'),
(170, 1, 3, 175, '005/265/421.050/2014', '', 'DPRD KABUPATEN MALANG', 'Bantuan Menugaskan Tim Raperda beserta Kepala SKPD pada Rapat Kerja dengan Pansus DPRD Kab. Malang pada Hari Senin,17 Februari 2014,Jum''at 21 Februari 2014, dan Jum''at 28 Februari 2014', '2014-02-14', '2014-02-18 10:17:00', 'Foto kopi untuk yang diundang 18/2 2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(171, 1, 3, 176, '893.3/525/421.209/2014', '', 'BANDIKLAT', 'Permohonan Usulan Calon Peserta Diklat Pim I,II,III dan IV Tahun 2014', '2014-02-12', '2014-02-18 10:55:00', 'Yang Boleh diusulkan hanya Pajabat Usulan III Atau Pejabat  yang Pernah Test. Untuk di Tu Keduanya Belum ada    18/2   2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(172, 1, 3, 177, '322/PW/A-I/II/2014', '', 'Pengurus Wilayah NU Jawa Timur ', 'Permohonan Amal Jariah ', '2014-02-19', '2014-02-11 13:35:00', '', 'E:\\SCAN SURAT\\IMG.jpg'),
(173, 1, 3, 178, '800/1415/212.5/2014', '', 'Gubernur Jawa Timur ', 'Netralitas Pegawai Negeri Sipil dalam Pelaksanaan Pemilu Legeslatif, Presiden dan Wakil Presiden Tahun 2014', '2014-02-19', '2014-02-19 14:07:00', 'File surat khusus berparaf\r\nBuat Surat  SJPD tgl 19 Februari 2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(174, 1, 3, 179, '176/270/421.050/2014', '', 'DPRD KABUPATEN MALANG', 'Bantuan Menugaskan Kepala SKPD Pada Kunjungan Kerja DPRD Kab. Malang Pada Hari Selasa 18 Pebruari 2014', '2014-02-14', '2014-02-19 14:11:00', 'Teruskan pada yang bersangkutan tgl 19 februari 2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(175, 1, 3, 180, '176/272/421.050/2014', '', 'DPRD KABUPATEN MALANG', 'Bantuan Menugaskan Kepada Dinas Kesehatan pada acara Konsultasi ke Direktorat Bina Upaya Kesehatan Dasar Kementrian Kesehatan Pada Hari Jumat 21 Pebruari 2014 di Jakarta ', '2014-02-19', '2014-02-19 14:16:00', 'Teruskan ke dinas kesehatan tgl 19 februari 2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(176, 1, 3, 181, 'IN.05.03.43.02.14.607', '', 'Badan POM RI', 'Permohonan Pelaksanaan KIE POKJA Penanggulangan OT Mengandung BKO yang dilaksanakan pada hari minggu keempat bulan Pebruari 2014 ( Sekaligus Membuka acara Serta Menyampaikan Arahan )', '2014-02-06', '2014-02-19 14:20:00', '', 'E:\\SCAN SURAT\\IMG.jpg'),
(177, 1, 3, 182, '518/100/421.112/2014', '', 'DINAS KOPERASI & UMKM', 'Partisipasi Bencana Gunung  Kelud', '2014-02-19', '2014-02-19 14:34:00', 'File khusus lahan gunung kelud', 'E:\\SCAN SURAT\\IMG.jpg'),
(178, 1, 3, 183, '518/106/421.112/2014', '', 'DINAS KOPERASI & UMKM', 'Partisipasi Bencana Gunung Kelud ( Tembusan )', '2014-02-18', '2014-02-19 15:04:00', 'File khusus bantuan gunung kelud\r\nJadikan satu dengan posko di kab. malang yaiti surat pengantar dari dinas/ badan/ kantor yang mengirim bantuan', 'E:\\SCAN SURAT\\IMG.jpg'),
(179, 1, 3, 184, '903/546/SJ', '', 'MENDAGRI RI', 'Pengelolaan Hibah dan Bantuan Sosial Yang Bersumber dari APBD', '2014-02-19', '2014-02-19 15:09:00', 'Foto Copy (4)\r\n1. TU\r\n2. Bapedda\r\n3. Kesra\r\n4. Asli ke DPPKA tgl 19 Februari 2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(180, 1, 3, 185, '005/063/421.034/2014', '', 'BAGIAN ORGANISASI', 'Review Bintek ANJAB/ABK dan SKJ Berbasis Teknologi Informasi Tahun 2014', '2014-02-20', '2014-02-20 12:35:00', 'Untuk Dihadiri Ajak Staf yg Menangani    21/2   2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(181, 1, 3, 186, '482.1/681/421.032/2014', '', 'BAGIAN TATA USAHA', 'Himbauan Mendengarkan Talk Show pada hari Selasa  tanggal 25 Pebruari 2014 Waktu 06.00 S/d 07.00 Wib  ', '2014-02-21', '2014-02-21 09:24:00', 'sesekali mendengarkan radio agar mengerti tentang topik baru', 'E:\\SCAN SURAT\\IMG.jpg'),
(182, 1, 3, 187, '005/680/421.032/2014', '', 'BAGIAN TATA USAHA', 'Launcing Pendaerahan PBB P2 Kabupaten Malang dan Penyerahan SPPT PBB Serta Pekan Panutan Pembayaran PBB Tahun 2014', '2014-02-21', '2014-02-21 09:19:00', 'Saya Hadir   21/2 2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(183, 1, 3, 188, '176/292/421.050/2014', '', 'DPRD KABUPATEN MALANG', 'Bantuan Menugaskan Acara Koordinasi ke Pemerintah kab. Badung Provinsi Bali Pada Minggu - Selasa  2 3- 25 Pebruari  2014 ( tembusan )', '2014-02-21', '2014-02-21 09:35:00', 'Untuk Disiapkan SKPD As. I Ditanganni Dengan Baik  21/2 2014', '');
INSERT INTO `surat_masuk` (`id`, `sifat_arsip_id`, `sifat_surat_id`, `no_urut`, `no_surat`, `no_agenda`, `surat_dari`, `perihal`, `tanggal_surat`, `tanggal_terima`, `catatan`, `file_surat`) VALUES
(184, 1, 3, 189, '005/067/421.034/2014', '', 'BAGIAN ORGANISASI', 'Perubahan Jadwal Review Bintek ANJAB/ABK dan SKJ Berbasis Tehnologi Invormasi Tahun 2014', '2014-02-21', '2014-02-21 11:41:00', 'Ada Perubahan Jadwal   21/2 2014       Surat Asli di Kasubag Kepeg & Keu       Fitri   25/2    2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(185, 1, 4, 191, '903/546/SJ', '', 'Mendagri   RI ', 'Pengelolaan Hibah dan Bantuan Sosial yg  Bersumber dari APBD ', '2014-02-21', '2014-02-21 00:00:00', 'surat asli di bu juli  ada tandatangannya pak sekda  21/2    2014', 'E:\\SCAN SURAT\\IMG_0001.jpg'),
(186, 1, 3, 193, '518/112/421.112/2014', '', 'DINAS KOPERASI & UMKM', 'Partisipasi Bencana Gunung Kelud', '2014-02-21', '2014-02-21 13:37:00', 'File Bantuan  21/2   2014', ''),
(187, 1, 3, 194, 'Und/2110/S.PAN - RB/02/2014', '', 'Kementrian Pendayagunaan Aparatur Negara Dan Refor', 'Undangan Rapat Koordinasi Nasional Formasi PNS Tahun 2014 Pada Hari, Tanggal kamis 27 Pebruari 2014 Waktu 08.00 Wib. Tempat Auditorium Manggala Wanabekti Jl. Jend.Gatot Subroto Jakarata', '2014-02-25', '2014-02-25 08:17:00', '', 'E:\\SCAN SURAT\\IMG_0001.jpg'),
(188, 1, 3, 195, '041/705/421.211/2014', '', 'BADAN PERPUS, ARSIP & DOKUMENTASI', 'Permohonan Bantuan Buku Untuk Menunjaang Pokjanal Posyandu  Tahun 2014', '2014-02-25', '2014-02-25 00:00:00', '', 'E:\\SCAN SURAT\\IMG_0001.jpg'),
(189, 1, 3, 196, '893/661/421.209/2014', '', 'BANDIKLAT', 'Diklat Penyusunan Rencana  Strategis  (Renstra )  SKPD Angkatan I Tahun 2014', '2014-02-21', '2014-02-21 13:27:00', 'Untuk Staf Atau Kasubag untuk mengikuti Diklat ini \r\nGunakan Kesempatan Belajar yg ditawarkan.', 'E:\\SCAN SURAT\\IMG.jpg'),
(190, 1, 3, 197, '-', '', 'Wahana Cendikia', 'Penawaran Training', '2014-02-25', '2014-02-25 11:25:00', '', 'E:\\SCAN SURAT\\IMG_0001.jpg'),
(191, 1, 3, 198, 'S-3867/WPJ.12/KP.11/2014', '', 'Kantor Pelayanan Pajak Pratama Kepanjen', 'Himbauan Penyampaian SPT Tahunan Tahun Pajak 2013 Melalui E-Filing', '2014-02-25', '2014-02-25 11:43:00', '', 'E:\\SCAN SURAT\\IMG_0015.jpg'),
(192, 1, 3, 199, '09/DST/PLP/11?2014', '', 'Diponegoro  Smart Solution ', 'Penawaran Pelatihan Dasar, Tingkat Menengah Dan Ujian Sertifikasi Pengadaan di Semarang , Solo dan Malang ', '2014-02-26', '2014-02-17 11:19:00', '', 'E:\\SCAN SURAT\\IMG_0002.jpg'),
(193, 1, 3, 200, '072/216/421.205/2014', '', 'BAKESBANGPOL', 'Surat Keterangan  Untuk Melakukan Survey/PKL  An. Prisma Dwi Novianti', '2014-02-26', '2014-02-04 12:21:00', '', 'E:\\SCAN SURAT\\IMG_0002.jpg'),
(194, 1, 3, 201, 'B/464/II/2014', '', 'Kapolres  Malang', 'Undangan Acara Silaturahmi Pelatihan Sispamkota dalam rangka Pengamanan Pemilu Tahun 2014 Kamis 27 Pebruari 2014', '2014-03-03', '2014-03-03 10:04:00', '', 'E:\\SCAN SURAT\\IMG.jpg'),
(195, 1, 3, 202, '003/825/421.032/2014', '', 'BAGIAN TATA USAHA', 'Keputusan Bupati Malang tentang Pelaksanaan dan Panitia Pelaksana Pekan Nasional Petani Nelayan XIV  Tahun 2014 di Kab. Malang', '2014-03-04', '2014-03-04 09:44:00', '', 'E:\\SCAN SURAT\\IMG.jpg'),
(196, 1, 3, 203, '466.1/84/421.608/2014', '', 'Camat Wagir Kab. Malang', 'Laporan Bantuan Dana Untuk Korban Erupsi Gunung Kelud dari Desa Pandan Landung Kec. Wagir', '2014-03-04', '2014-03-04 10:05:00', '', 'E:\\SCAN SURAT\\IMG.jpg'),
(197, 1, 3, 204, '-', '', 'Gubernur Jawa Timur', 'Rapat Kerja Daerah Pembangunan Kependudukan dan Keluarga berencana  Tahun 2014 Provinsi Jawa Timur', '2014-03-04', '2014-03-04 10:16:00', '', 'E:\\SCAN SURAT\\IMG.jpg'),
(198, 1, 3, 205, '367/107/421.214/2014', '', 'KANTOR PERUMAHAN', 'Bantuan Untuk Bencana Alam Gunung Kelud', '2014-03-04', '2014-03-04 10:32:00', '', 'E:\\SCAN SURAT\\IMG.jpg'),
(199, 1, 3, 206, '466.1/82/421.608/2014', '', 'Camat Wagir Kab. Malang ', 'Laporan Bantuan Dampak Erupsi Gunung Kelud', '2014-03-04', '2014-03-04 10:36:00', '', 'E:\\SCAN SURAT\\IMG.jpg'),
(200, 1, 3, 207, 'B/464/II/2014', '', 'Kapolres Malang ', 'Undangan Acara Simulasi Pelatihan Sispamkota Dalam Rangka Pengamanan Pemilu Tahun 2014 Kamis, 27 Pebruari 2014', '2014-03-04', '2014-03-04 10:42:00', '', 'E:\\SCAN SURAT\\IMG.jpg'),
(201, 1, 3, 208, '005/815/421.032/2014', '', 'BAGIAN TATA USAHA', 'Upacara Peringatan HUT ke - 95 Pemadam Kebakaran Nasional Tahun 2014.', '2014-03-04', '2014-03-04 10:46:00', '', 'E:\\SCAN SURAT\\IMG.jpg'),
(202, 1, 3, 209, '005/814/421.032/2014', '', 'BAGIAN TATA USAHA', 'Rapat Paripurna  senin 3 Maret 2014, 08.00 Wib  Ruang Rapat Paripurna Kepanjen', '2014-03-04', '2014-03-04 10:51:00', '', 'E:\\SCAN SURAT\\IMG.jpg'),
(203, 1, 3, 210, '005/812/421.032/2014', '', 'BAGIAN TATA USAHA', 'Pembukaan Sosialisasi Hasil Rakorrnas Tentang Pemantapan Penyelenggaraan Pemilu Anggota DPR, DPD dan DPRD Tahun 2014 di Kab. Malang Oleh Bapak Bupati Malang', '2014-03-04', '2014-03-04 10:55:00', '', 'E:\\SCAN SURAT\\IMG.jpg'),
(204, 1, 3, 211, '005/2428/043/2014', '', 'Sekda Prov. Jatim', 'Ralat Undangan Rapat Evaluasi Pelaksanaan Tanggap Darurat Gunung Kelud yang semula Hari Kamis 27 Peb.2014 DIUBAH Hari Jumat 28 Peb.2014', '2014-03-04', '2014-03-04 12:05:00', '', 'E:\\SCAN SURAT\\IMG.jpg'),
(205, 1, 3, 212, '005/365/421.050/2014', '', 'DPRD KABUPATEN MALANG', 'permohonan bantuan menugaskan pada rapat paripurna DPRD Kab malang, senin 3 maret 2014, pukul 08.00 WIB ', '2014-02-13', '2014-03-04 12:26:00', '', 'E:\\SCAN SURAT\\IMG.jpg'),
(206, 1, 3, 213, '005/364/421.050/2014', '', 'DPRD KABUPATEN MALANG', 'Undangan Rapat Paripurna, senin 3 Maret 2014, pukul 08.00 WIB di RR. Paripurna DPRD Kab. Malang ', '2014-03-04', '2014-03-04 12:36:00', '', 'E:\\SCAN SURAT\\IMG.jpg'),
(207, 1, 3, 215, '180/234/421.013/2014', '', 'BAGIAN HUKUM', 'Lampiran SK Bupati tentang pembelian belanja hibah, bantuan sosial, bagi hasil, bantuan keuangan & tidak terduga', '2014-02-20', '2014-03-05 11:24:00', 'Untuk di pedomi  Tu Tidak ada Dana Hibas  5/3 2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(208, 1, 3, 216, '800/1033/421.202/2014', '', 'BKD', 'pengumuman kelulusan peserta seleksi CPNS Tahun 2013 dari tenaga honorer kategori II ', '2014-02-28', '2014-03-05 13:22:00', 'Untuk disampaikan dan dibantu  a/n Dimas Ap.   5/3 2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(209, 1, 3, 217, '005/074/421.034/2014', '', 'BAGIAN ORGANISASI', 'Review Bintek Anjab/ABK dan SKJ Berbasis Teknologi Informasi Tahun 2014', '2014-03-06', '2014-03-06 12:05:00', '', 'E:\\SCAN SURAT\\IMG_0004.jpg'),
(210, 1, 3, 218, '05/11/04/B.1/2014', '', 'Koperasi Pegawai Republik Indonesia', 'Undangan  Rapat Anggota  Sabtu 8 Maret 2014 di Aula Dinas Sosial Prov. Jatim Jl. Pangsud No. 93 Malang', '2014-03-06', '2014-03-06 13:23:00', '', 'E:\\SCAN SURAT\\IMG_0004.jpg'),
(211, 1, 4, 219, 'S-3145/WPJ.12/KP.11/2014', '', 'Kantor Pelayanan Pajak Pratama Kepanjen', 'Himbauan Penyampaian SPT Tahunan Tahun Pajak 2013 Melalui -Filling', '2014-03-06', '2014-03-06 14:51:00', '', 'E:\\SCAN SURAT\\IMG_0004.jpg'),
(212, 1, 4, 220, '005/377/421.050/2014', '', 'DPRD KABUPATEN MALANG', 'Permohonan bantuan penugasan rapat kerja dengan Pansus DPRD Kab. Malang, selasa 4 Maret 2014, pukul 13.00 WIB di RR. Serbaguna DPRD Kab. Malang ', '2014-03-04', '2014-03-04 12:45:00', '', 'E:\\SCAN SURAT\\IMG_0004.jpg'),
(213, 1, 3, 221, '003/825/421.032/2014', '', 'Sekretaris Daerah', 'SK  Bupati Malang ttg pelaksanaan & Panitia PENAS XIV Th.2014 di Kab. Malang ', '2014-02-28', '2014-03-07 09:57:00', '', 'E:\\SCAN SURAT\\IMG_0004.jpg'),
(214, 1, 3, 222, '304/A.1/PUSDIKLAT/II/2014', '', 'Pusdiklat Otonomi Daerah', 'Indangan Bintek Manajemen Keprotokolan Pemda ', '2014-02-07', '2014-03-07 10:44:00', '', 'E:\\SCAN SURAT\\IMG_0002.jpg'),
(215, 1, 2, 223, '482.1/913/421.032/2014', '', 'Asisten Administrasi', 'Himbauan Mendengarkan Talkshow', '2014-03-07', '2014-03-07 10:52:00', '', 'E:\\SCAN SURAT\\IMG_0002.jpg'),
(216, 1, 4, 224, '100.5/UGM/MAP/II/14', '', 'Ketua Pengelola Diklat MAP UGM ', 'Penawaran diklat Magister Administrasi Publik (MAP)', '2014-03-02', '2014-03-07 11:24:00', '', 'E:\\SCAN SURAT\\IMG_0002.jpg'),
(217, 1, 2, 225, '440/804/421.103/2014', '', 'DINAS KESEHATAN', 'Permohonan memimpin rakor lomba kesatuan gerak PKK-KB-Kes th.2013, kamis 13-3-2014', '2014-03-07', '2014-03-10 13:32:00', 'TU gak diundang?', 'E:\\Hasil Scan\\IMG_20140310_0001.jpg'),
(218, 1, 4, 226, '523/318/421.115/2014', '', 'DINAS KELAUTAN & PERIKANAN', 'Perubahan alamat kantor ', '2014-03-07', '2014-03-10 13:39:00', '', 'E:\\Hasil Scan\\IMG_20140310_0001.jpg'),
(219, 1, 2, 227, '900/1225/421.023/2014', '', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'Evaluasi & masukan terhadap Peraturan Bupati No. 30 Tahun 2013', '2014-03-10', '2014-03-11 09:41:00', '', 'E:\\Hasil Scan\\IMG_20140311_0001.jpg'),
(220, 1, 3, 228, '602.1/918/421.023/2014', '', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'Rencana umum pengadaan barang/jasa th.2014', '2014-03-07', '2014-03-11 09:47:00', '', 'E:\\Hasil Scan\\IMG_20140311_0001.jpg'),
(221, 1, 3, 229, '005/423/421.050/2014', '', 'DPRD KABUPATEN MALANG', 'Permohonan Bantuan Menugaskan Pada Rapat Kerja Pansus LKPJ DPRD Kab.Malang Senin,17 Maret 2014 Pkl 10.00 Wib di RR Pripurna DPRD Kab.Malang', '2014-03-12', '2014-03-12 08:51:00', '', ''),
(222, 1, 3, 231, '800/1165/421.202/2014', '', 'BKD', 'Pembaruan Tanda Pengenal ', '2014-03-11', '2014-03-13 09:08:00', 'Untuk Didata dan Dikoordinir dengan BKD 13/3 2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(223, 1, 3, 232, '005/1320/421.032/2014', '', 'BAGIAN TATA USAHA', 'Rapat Kerja Panitia Khusus LKPJ DPRD Kab.Malang', '2014-03-12', '2014-03-13 10:59:00', 'Kabag Saya Hadir   13/3 2014\r\n', 'E:\\SCAN SURAT\\IMG.jpg'),
(224, 1, 4, 233, '', '', '', '', '2014-03-13', '2014-03-13 00:00:00', '', ''),
(225, 1, 3, 234, '005/4266/043/2014', '', 'Gubenur Jatim', 'Rakor Bidang Perekonomian Provinsi Seluruh Indonesia dengan Tema Peningkatan Ketahanan Ekonomi Nasional yang Tangguh dan Berlanjutkan Berbasis Ekonomi Provinsi', '2014-03-13', '2014-03-13 08:56:00', 'Siapkan SPPD  13/3 2014\r\n', 'E:\\SCAN SURAT\\IMG.jpg'),
(226, 1, 3, 235, '05/DPD.KAB/III?2014', '', 'DP. KORPRI Kab. Malang ', 'Rekap Penerimaan Bantuan Korban Bencana Erupsi Gunung Kelud.', '2014-03-13', '2014-03-13 13:33:00', '', 'E:\\SCAN SURAT\\IMG_0002.jpg'),
(227, 1, 3, 236, '005/1320/421.032/2014', '', 'BAGIAN TATA USAHA', 'Undangan Rapat Kerja Panitia Khusus LPKJ DPRD Kab. Malang Senin, 17 Maret 2014 ,10.00 Wib  Ruang Rapat Paripurna  DPRD Kab. Malang Jl. Panji No. 119 Kepanjen', '2014-03-14', '2014-03-14 10:43:00', 'Saya Hadir   Ae. File 17/3 2014', 'E:\\SCAN SURAT\\IMG_0002.jpg'),
(228, 1, 3, 237, '556/1230/421.108/2014', '', 'DINAS KEBUDAYAAN & PARIWISATA', 'Mohon Dukungan Poling SMS Duta Wisata Raka-Riki Jatim  Tahun 2014 ', '2014-03-14', '2014-03-14 11:02:00', '', 'E:\\SCAN SURAT\\IMG_0002.jpg'),
(229, 1, 3, 239, '005/586/211.2/2014', '', 'Badan Pemberdayaan Perempuan  & Keluarga Berencana', 'Bantuan Menugaskan Pada Acara Fasilitasi Perlindungan Anak di Taman Posyandu Prov. Jatim Pada Rabu, 26 Maret  2014 di Hotel Cendana Surabaya', '2014-03-14', '2014-03-14 12:55:00', '', 'E:\\SCAN SURAT\\IMG_0019.jpg'),
(230, 1, 4, 240, '005/1406/421.032/2014', '', 'BAGIAN TATA USAHA', 'Kajian LKPJ Bupati Malang Malang Tahun 2013 pada Selasa, 18 Maret 2014, 14.00 Wib Tempat Grand Palace Hotel Lantai 3 Jl. Ade Irma Suryani no.23 Malang', '2014-03-18', '2014-03-18 06:42:00', 'Sudah Selesai   18/3 2014\r\n', 'E:\\SCAN SURAT\\IMG_0023.jpg'),
(231, 1, 3, 241, '440/930/421.103/2014', '', 'DINAS KESEHATAN', 'Permohonan Mengundang dalam Penilaian Lomba Kesatuan Gerak PKK-KB Kes Tahun 2013', '2014-03-18', '2014-03-18 07:37:00', 'File  18/3   2014', 'E:\\SCAN SURAT\\IMG_0025.jpg'),
(232, 1, 3, 242, '005/1396/421.032/2014', '', 'BAGIAN TATA USAHA', 'Penanaman Bibit Pohon di Taman Wisata Wendit dan Sekitarnya ( Bantaran Sungai ) Pada Jum"at, 21 Maret 2014, 06.00 Wib Tempat Taman Wisata Air Wendit Jl. Raya Mangliawan Kec. Pakis.', '2014-03-18', '2014-03-18 07:45:00', 'saya Hadir Untuk Ditemani Staf Linda dan Yeni 18/3 2014', 'E:\\SCAN SURAT\\IMG_0025.jpg'),
(233, 1, 2, 243, 'T.170/LSN/D1/PD.01.03/03/2014', '', 'Lembaga Sandi Negara ', 'Rencana Kegiatan Pengawasan dan Pengendalian Persandian Dalam Negara UTP Pemerintah Provinsi /kabupaten/Kota', '2014-03-18', '2014-03-18 07:55:00', 'Untuk Dicukupi Isi Surat \r\ndan Tim Survey dibantu dalam Pelaksanaan selama dKab. Malang \r\nTunjukkan Kinerja Sub Sandi yg baik siapkan Semuanya ( Data Personil dan Pendukung ) 18/3 2014', 'E:\\SCAN SURAT\\IMG_0024.jpg'),
(234, 1, 2, 244, '800/84/421.023/2014', '', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'Penyampaian Daftar Nama Karyawan karyawati Bagian Administrasi Pembangunan Untuk Mendapatkan Perincian Gaji Guna Pengisian SPT Tahunan', '2014-03-18', '2014-03-18 13:14:00', 'Untuk Di Buatkan pERINCIAN gAJI 18/3 2014', 'E:\\SCAN SURAT\\IMG_0007.jpg'),
(235, 1, 2, 245, '800/863/421.402/2014', '', 'PDAM', 'Bantuan Bencana Gunung Kelud', '2014-03-18', '2014-03-18 13:26:00', 'file kusus bantuan 18/3 2014', 'E:\\SCAN SURAT\\IMG_0007.jpg'),
(236, 1, 2, 246, '176/460/421.050/2014', '', 'DPRD KABUPATEN MALANG', 'Permohonan Penugasan Acara Kunjungan Kerja DPRD pada Kamis,20 Maret 2014, 10.00 wib', '2014-03-17', '2014-03-19 09:41:00', 'Teruskan pada yang bersangkutan File 19/3 2014', 'E:\\SCAN SURAT\\IMG_0029.jpg'),
(237, 1, 4, 247, '005/458/421.050/2014', '', 'DPRD KABUPATEN MALANG', 'Ralat Undangan  pada  selasa 18 maret 2014, jam 14.00 wib di grand palace Hotel Malang.', '2014-03-17', '2014-03-19 09:46:00', 'File Surat Dprd 19/3 2014', 'E:\\SCAN SURAT\\IMG_0030.jpg'),
(238, 1, 4, 248, '555/5178/042/2014', '', 'Gubernur Jawa Timur ', 'Bimbingan Teknis Operasional Peralatan Sandi , 25 Maret 2014 ,08.30 Wib di Hotel Satelit Jl. Mayjen Sungkono 139 Surabaya.', '2014-03-19', '2014-03-19 10:47:00', 'Untuk Hadir Koordinasi Dengan Kasubag Keuangan untuk SPPD dan Surat Tugas  19/3 2024', ''),
(239, 1, 4, 249, '045/1292/SJ', '', 'Kementrian Dalam Negeri RI', 'Laporan Pelaksanaan Ketatausahaan Pimpinan Pemerintah Daerah Prov. Kab. dan Kota', '2014-03-19', '2014-03-19 10:59:00', '', 'E:\\SCAN SURAT\\IMG_0031.jpg'),
(240, 1, 2, 250, '100/080/421.011/2014', '', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Pelaksanaan Pemilihan Umum Anggota Dewan Perwakilan Rakyat, Dewan Perwakilan Daerah , Dewan Perwakilan Rakyat Daerah Tahun 2014.', '2014-03-19', '2014-03-19 11:41:00', 'Untuk disiapakan  20/3 2014  \r\nSanditel Sudah Di Fax ', 'E:\\SCAN SURAT\\IMG_0030.jpg'),
(241, 1, 4, 251, '032/497/421.119/2014', '', 'DPPKA', 'Undangan  Pengurusan Barang pada kamis, 27 Maret 2014, 08.00 Wib Tempat Hotel Wisata Tidar Jl. Puncak Tidar Blok VE No. 1 Malang', '2014-03-19', '2014-03-19 12:11:00', 'Untuk dihadiri pengurus barang  20/3 2014', 'E:\\SCAN SURAT\\IMG_0032.jpg'),
(242, 1, 3, 252, '973/1295/421.032/2014', '', 'BAGIAN TATA USAHA', 'Himbauan Penyampaian SPT Tahunan Tahun Pajak 2013 melalui -Filing', '2014-03-14', '2014-03-14 11:06:00', '', 'E:\\SCAN SURAT\\IMG_0002.jpg'),
(243, 1, 4, 253, '910/1419/421.023/2014', '', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'Permintaan Laporan Triwulan 1 TA.. 2014', '2014-03-20', '2014-03-20 12:21:00', 'Kalau ada yg diusulkan bisa melalui ULP', 'E:\\SCAN SURAT\\IMG_0003.jpg'),
(244, 1, 4, 254, '005/477/421.050/2014', '', 'DPRD KABUPATEN MALANG', 'Permohonan Penugasan pada Rapat Kerja Komisi A,B,C dan D DPRD Kab. Malang Rabu, 26 Maret 2014 di RR Komisi A,B,C dan D DPRD Kab. Malang', '2014-03-20', '2014-03-20 12:26:00', 'Undang yg sesuai di maksud dalam Surat   20/3 2014', 'E:\\SCAN SURAT\\IMG_0003.jpg'),
(245, 1, 4, 255, '005/1531/421.032/2014', '', 'BAGIAN TATA USAHA', 'Undangan Rapat Paripurna Istimewa Jum''at, 21 Maret 2014, 13.00 Wib empat Ruang Rapat Paripurna DPRD Kab. Malang Jl. Panji No. 119 Kepanjen ', '2014-03-20', '2014-03-20 12:31:00', 'saya hadir 20/3 2014\r\n', 'E:\\SCAN SURAT\\IMG_0003.jpg'),
(246, 1, 4, 256, '176/475/421.050/2014', '', 'DPRD KABUPATEN MALANG', 'Permohonan Penugasan pada Kunjungan Kerja Komisi, A,B,C dan D DPRD Kab. Malang Selasa, 25 Maret 2014, 10.00 Wib di RS Ben Mari Pakisaji Kec. Singosari dan Pagelaran.', '2014-03-20', '2014-03-20 12:35:00', 'Untuk Diundang Yg Bersangtkutan   20/3 2014\r\n', 'E:\\SCAN SURAT\\IMG.jpg'),
(247, 1, 4, 257, '523/375/421.115/2014', '', 'DINAS KELAUTAN & PERIKANAN', 'Kepindahab Kantor Dinas Kelautan  & Perikanan Kab. Malang ( Tembusan )', '2014-03-18', '2014-03-20 12:43:00', 'Untuk Dicatat di buku alamat para Kepala Dinas 20/3 2014\r\n', 'E:\\SCAN SURAT\\IMG.jpg'),
(248, 1, 4, 258, '005/479/421.050/2014', '', 'DPRD KABUPATEN MALANG', 'Permohonan Penugasan pada Rapat Kerja Komisi A,B, C dan D DPRD Kab. Malang Jumat, 28 Maret 2014 di RR Komisi A,B,C dan D DPRD Kab. Malang', '2014-03-20', '2014-03-20 12:47:00', 'Undang yg Bersangkutan    20/3 2014\r\n', 'E:\\SCAN SURAT\\IMG.jpg'),
(249, 1, 4, 259, '973/1419/421.119/2014', '', 'DPPKA', 'Pembayaran PBB Tahun 2014 Bagi PNS dan Perangkat Desa ', '2014-03-18', '2014-03-20 12:51:00', 'untuk dihimbau kepada Semua Staf    20/3  2014\r\n', 'E:\\SCAN SURAT\\IMG_0003.jpg'),
(250, 1, 4, 260, '176/478/421.050/2014', '', 'DPRD KABUPATEN MALANG', 'Permohonan Menugaskan pada Kunjungan Kerja Komisi A, B dan D DPRD Kab. Malang Kamis, 27 Maret 2014 PKL. 10.00 Wib di Puskesmas Sumberpucung dan Kecamatan Gondanglegi.', '2014-03-20', '2014-03-20 12:57:00', 'Diteruskan ke yg bersangkutan    20/3 2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(251, 1, 2, 261, '005/1557/421.032/2014', '', 'BAGIAN TATA USAHA', 'Sosialisasi Payroll Gaji Untuk Karyawan/Karyawati di Lingkungan Sekretariat Daerah Kab. Malang Oleh Bank Jatim.', '2014-03-21', '2014-03-21 11:01:00', 'File   24/3 2014', 'E:\\SCAN SURAT\\IMG_0021.jpg'),
(252, 1, 4, 262, '052/246/PN/CKPJ/2014', '', 'Bank Jatim Cabang Kepanjen', 'Permohonan Sosialisasi Pauroll Gaji Senin , 24 Maret 2014 di Pendopo Kab. Malang Jalan Panji No. 158 Kepanjen', '2014-03-21', '2014-03-21 11:09:00', 'file    24/3   2014', 'E:\\SCAN SURAT\\IMG_0021.jpg'),
(253, 1, 3, 263, '460/6108/031/2014', '', 'Gubernur Jatim', 'Bantuan Menugaskan Kadin Sosial/yang membidangi Kesos , Kabag Kesra, Ketua MUI dan , TKSK   pada Rakor   Penanganan  Penutupan Lokalisasi dan Pasca Penutupan  Lokalisasi WTS di Jatim Tahun 2014. ', '2014-03-21', '2014-03-21 11:16:00', 'Untuk di teruskan pada yg di undang  24/3 2014', 'E:\\SCAN SURAT\\IMG_0021.jpg'),
(254, 1, 4, 264, '005/1566/421.032/2014', '', 'BAGIAN TATA USAHA', 'Peluncuran Buku Jelajah Seribu Pantai Oleh Bapak Bupati Malang pada Sabtu ,22 Maret 2014, 18.30 Wib Tempat Pendopo Agung Kab. Malang Jl. KH. Agus Salim No. 7 Malang', '2014-03-21', '2014-03-21 12:53:00', '', 'E:\\SCAN SURAT\\IMG_0021.jpg'),
(255, 1, 3, 265, '005/1420/421.032/2014', '', 'BAGIAN TATA USAHA', 'Musyawarah Perencanaan Pembangunan ( Musrembang ) Kab. Malang Tahun 2014', '2014-03-24', '2014-03-24 14:14:00', 'Saya Hadir      25/3   2014', 'E:\\SCAN SURAT\\IMG_0002.jpg'),
(256, 1, 3, 267, '005/489/421.050/2014', '', 'DPRD KABUPATEN MALANG', 'Undangan Rapat Paripurna Istimewa DPRD Kab. Malang  Jum ''at 21 Maret 2014 Pkl. 13.00 Wib di RR Paripurna DPRD. Kab. Jl. Panji Nomor 119 Kepanjen  Malang', '2014-03-24', '2014-03-24 14:32:00', 'File    25/3 2014\r\nSudah Dikoordinasikan ', 'E:\\SCAN SURAT\\IMG_0002.jpg'),
(257, 1, 4, 268, '900/544/421.119/2014', '', 'DPPKA', 'Permohonan Memimpin Rapat TPD Pada   Selasa, 25 Maret 2014 di Ruang Rapat Sekda Jl. Merdeka Timur No. 3 Malang', '2014-03-24', '2014-03-24 14:41:00', 'File dan Buat Undangan Surat Sekda \r\nSudah Dikoordinasikan ', 'E:\\SCAN SURAT\\IMG_0002.jpg'),
(258, 1, 4, 269, '075/854/421.051/2014', '', 'SEKRETARIAT DPRD', 'Keputusan DPRD Kab. Malang No. 11 Tahun 2014 Tentang Rekomendasi DPRD Kab. Malang Terhadap Laporan Keterangan Pertanggungjawaban Kepala Daerah Kab. Malang Tahun 2013', '2014-03-24', '2014-03-24 15:08:00', '', 'E:\\SCAN SURAT\\IMG.jpg'),
(259, 1, 3, 270, '877/401/421.202/2014', '', 'BKD', 'Pengambilan sumpah Jabatan dan Pelantilkan Pejabat Struktural Serta Pengukuhan Kepala Sekolah di Lingkungan Pemerintah Kab. Malang', '2014-03-24', '2014-03-25 08:25:00', 'Disiapkan Sesuai Pengajuan    25/3 2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(260, 1, 2, 271, '800/1336/421.202/2014', '', 'BKD', 'Penyampaian Pejabat Yang Wajib Melaporkan Harta Kekayaan di Lingkungan Kab. Malang ', '2014-03-12', '2014-03-25 08:37:00', 'Untuk di Cukupi Sesuai Form   25/3   2014  \r\n    Diterima fitri   26/3 2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(261, 1, 2, 272, '005/1602/421.032/2014', '', 'BAGIAN TATA USAHA', 'Seminar dengan tema Kesiapan Aparatur Dalam Menyambut Pelaksanaan Undang Undang No. 6 Tahun 2014 Tentang Desa "', '2014-03-25', '2014-03-25 08:42:00', 'Saya Hadir     25/3  Maret 2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(262, 1, 2, 273, '005/1601/421.032/2014', '', 'BAGIAN TATA USAHA', 'Tahlil Rutin  Pada kamis 27 Maret 2014, 17.00 wib Peringgitan Pendopo Agung Kab. Malang Jl. Agus  Salim no.7 Malang', '2014-03-25', '2014-03-25 08:46:00', 'Saya Hadir   25/3    2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(263, 1, 2, 274, '13/MIPI/SEK/2014', '', 'Masyarakat Ilmu Pemerintahan Indonesia ( MIPI ) Ca', 'Permohonan Bantuan ( Fasilitas ) Pada Penyelenggaraan Seminar Sehari.', '2014-03-24', '2014-03-26 09:03:00', '   Acara Sudah Selesai   ', 'E:\\SCAN SURAT\\IMG.jpg'),
(264, 1, 4, 275, '9/MIPI/SEK/2014', '', 'MIPI Cabang Malang ', 'Permohonan Membuka Acara Seminar MIPI, Sabtu, 29 Maret 2014 di Pendopo Agung Kab. Malang', '2014-03-26', '2014-03-26 09:10:00', 'saya hadir \r\nundangan sudah dibuat  26/3 2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(265, 1, 2, 276, '005/503/421.050/2014', '', 'DPRD KABUPATEN MALANG', 'Permohonan Bantuan Penugasan pada Rapat Kerja Panitia Khusus DPRD Kab. Malang rabu, 26 Maret 2014 di Ruang Serbaguna DPRD Kab. Malang dan Kajian PKL. 16.00 Wib di Hotel Best Westerem Malang. ', '2014-03-26', '2014-03-26 09:15:00', 'Untuk Di buiatkan Undangan     26/3     2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(266, 1, 4, 277, '13/MIPI/SEK/2014', '', 'Masyarakat Ilmu Pemerintahan Indonesia ( MIPI ) Ca', 'Permohonan Bantuan ( Fasilitas ) Pada Penyelenggaraan Seminar Sehari', '2014-03-26', '2014-03-26 09:58:00', '', 'E:\\SCAN SURAT\\IMG.jpg'),
(267, 1, 4, 278, '005/1668/421.032/2014', '', 'BAGIAN TATA USAHA', 'Silaturahmi Menteri Pendayagunaan Aparatur Negara dan Reformasi Birokrasi RI, Bapak Ir. H. AZWAR ABUBAKAR, MM Dengan Satuan Kerja Perangkat Daerah se Malang Raya', '2014-03-28', '2014-03-28 09:26:00', 'saya hadir  25/3  2014', 'E:\\SCAN SURAT\\IMG_0019.jpg'),
(268, 1, 4, 279, '411.8/1606/421.213/2014', '', 'KANTOR PEMBERDAYAAN PEREMPUAN & PA', 'Permohonan Nama Peserta Paranting Skill', '2014-03-28', '2014-03-28 09:38:00', '', 'E:\\SCAN SURAT\\IMG_0019.jpg'),
(269, 1, 4, 280, '270/1625/421.205/2014', '', 'BAKESBANGPOL', 'Pengawasan Penggunaan Fasilitas Pemerintah Dalam Kegiatan Politik Praktis Menjelang Pemilu 2014.', '2014-03-26', '2014-03-28 09:41:00', 'File Ump    28/3 2014', 'E:\\SCAN SURAT\\IMG_0019.jpg'),
(270, 1, 4, 281, '028/1352/421.119/2014', '', 'DPPKA', 'Rencana Tahunan Barang dan Rencana Tahunan Pemeliharaan Barang TA. 2014', '2014-03-13', '2014-03-28 09:45:00', 'Untuk dicukupi   28/3   2014', 'E:\\SCAN SURAT\\IMG_0019.jpg'),
(271, 1, 4, 282, '032/527/421.119/2014', '', 'DPPKA', 'Laporan BMD Tahun 2013', '2014-03-26', '2014-03-28 13:39:00', '', 'E:\\SCAN SURAT\\IMG_0020.jpg'),
(272, 1, 3, 283, '47/sKR/pkk.kABIv/2014', '', 'PKK KAB. MALANG', 'Undangan Pengajian Rutin  Majelis Ta''lim Khoirun Nisa Tim Penggerak PKK Kab. Malang', '2014-04-03', '2014-04-03 14:21:00', '', ''),
(273, 1, 3, 284, '480/028/421.117/2014', '', 'DINAS ENERGI & SDM', 'laporan Penyampaian Kalender Tahun 2014 ( Tembusan  Sebagai Laporan )', '2014-04-03', '2014-04-03 14:46:00', '', ''),
(274, 1, 3, 285, '005/1712/421.032/2014', '', 'BAGIAN TATA USAHA', 'Kegiatan Paranteng Skill Bagi PNS , Guru dan Orang Tua  pada  Senin  7 April 2014,  Pkl. 07.30 Wib  Pendopo Agung Kab. Malang', '2014-04-03', '2014-04-03 14:54:00', '', ''),
(275, 1, 3, 286, '05/Pan- Mus /PSSI- Kab. /III/2014', '', 'Pengcab PSSI Kab. Malang ', 'Undangan /Bantuan Menghadirkan Kepala Skpd dan Camat se Kab. Malang Pada acara Sosialisasi MUSCAB PSSI Kab. Malang ', '2014-04-04', '2014-04-04 09:33:00', '', 'E:\\SCAN SURAT\\IMG_0014.jpg'),
(276, 1, 3, 287, '005/1483/SJ', '', 'Kepala Pusat Adm Kerjasama Luar Negeri Kemendagri ', 'Bantuan Menugaskan Pejabat/Staf yang Menangani Pada Bintek Tata Cara Pengusulan Program PHLN ke dalam Blue Book Rabu s/d Jumat 23-25 April 2014 di milenium Sirih Jakarta Hotel.', '2014-04-04', '2014-04-04 09:41:00', '', 'E:\\SCAN SURAT\\IMG_0014.jpg'),
(277, 1, 3, 288, '019.4/1297/421.302/2014', '', 'UPT PERIJINAN', 'Pemberitahuan Perubahan Alamat  Badan Pelayanan Perizinan Terpadu Jl. Trunojoyo Kav.2 Kepanjen No. 396633  Fax 0341 396633', '2014-04-04', '2014-04-04 09:49:00', '', 'E:\\SCAN SURAT\\IMG_0014.jpg'),
(278, 1, 3, 289, '011/11/09/D.4/2014', '', 'KPRI ', 'Rekreasi Tour ke Pulau Dewata Bali ', '2014-03-25', '2014-04-04 10:12:00', 'Ditawarkan Syarat Bayar Sendiri 4/4   2014', 'E:\\SCAN SURAT\\IMG_0015.jpg'),
(279, 1, 2, 290, '005/1751/421.032/2014', '', 'BAGIAN TATA USAHA', 'Rapat koordinasi Membahas Tindak Lanjut Catatan Strategis DPRD Kab. Malang Atas LKPJ Kepala Daerah Kab. Malang Tahun 2013. pada Selasa 8 April 2014,  08.30 Wib  Ruang Anusapati Lantai II Jl Merdeka Timur No.3 Malang', '2014-04-04', '2014-04-04 11:14:00', 'FILE UNDANGAN    15/4 2014', 'E:\\SCAN SURAT\\IMG_0016.jpg'),
(280, 1, 3, 291, '005/1755/421.032/2014', '', 'BAGIAN TATA USAHA', ' Undangan Penyerahan Piala dan Hadiah Tim Juara Kompetisi Utama, Divisi Satu Serta Divisi Dua. Pada Minggu 6 April 2014, 18.30 Wib Pendopo Agung Kab. Malang Jl. KH Agus Salim N0. 7 Malang', '2014-04-04', '2014-04-04 11:22:00', '', 'E:\\SCAN SURAT\\IMG_0016.jpg'),
(281, 1, 3, 292, '800/1169/421.202/2014', '', 'BKD', 'Batas Usia Pensiun PNS Berdasarkan UU Nomor 5 Tahun 2014 tetang Aparatur Sipil Negara  ( ASN )', '2014-03-11', '2014-04-07 09:12:00', 'Untuk Disposisikan Pada Staf 8 April 2014', 'E:\\SCAN SURAT\\IMG_0017.jpg'),
(282, 1, 3, 293, '800/1565/421.202/2014', '', 'BKD', 'Penjelasan terhadap Pegawai Negeri Sipil ( PNS ) yg masih Bersedia / tidak bersedia lagi melaksanakan tugas.', '2014-04-02', '2014-04-07 09:18:00', 'Untuk Dipedoman 8 April 2014', 'E:\\SCAN SURAT\\IMG_0017.jpg'),
(283, 1, 3, 294, '482.1/1762/421.032/2014', '', 'BAGIAN TATA USAHA', 'HIMBAUAN MENDENGARKAN TALK SHOW', '2014-04-07', '2014-04-07 09:21:00', 'Untuk Ikut Mendengarkan 8 April 2014', 'E:\\SCAN SURAT\\IMG_0017.jpg'),
(284, 1, 3, 295, 'S-B46/WPJ,12/2014', '', 'Ka. Kanwil DJP Jawa Timur III ', 'Pemberitahuan Belum menyampaikan data dan Informasi Sesuai PMK Nomor 132/PMK.03/2013', '2014-03-25', '2014-04-07 09:34:00', 'File Khusus ( Pajak Daerah ) Untuk Sekda 8 April 2014', 'E:\\SCAN SURAT\\IMG_0004.jpg'),
(285, 1, 3, 296, '3/AIPD-EJ-MLG/IV/2014', '', 'AUSTRALIA INDONESIA PARTNERSHIP FOR DECENTRALISATI', 'Permohonan Melaunncing ', '2014-04-07', '2014-04-07 12:32:00', '-Sesuaiakan Jadwal Dengan Disposisi Pimpinan \r\nLakukan Koordinasi Dengan Penyelenggaraan ( Bapeda) .\r\n-Siapkan Undangan 10 April 2014', 'E:\\SCAN SURAT\\IMG_0002.jpg'),
(286, 1, 3, 297, '15/B.I/KTU.01.1/2014', '', 'Debuti  Bidang Kajian Kebijakan LAN RI', 'Undangan Seminar Nasional  Satu Dekade Implementasi UU N0.32 Tahun 2014 tentang Pemerintah Daerah  Rabu 23 April 2014 Pkl.    08.00 s/d   16.00 WIB di AUDITORIUM Makarti Bhakti Nagari Gd.B  Lt.8 Jakarta Pusat.', '2014-03-28', '2014-04-07 13:50:00', 'Untuk disiapkan Surat Tugas dan Kelengkapannya 10 April 2014', 'E:\\SCAN SURAT\\IMG_0002.jpg'),
(287, 1, 3, 298, '270/789/421.011/2014', '', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Penetapan Hari Pemungutan Suara Pemilihan Umum Anggota DPR, DPD dan DPRD Tahun 2014 sebagai Hari libur Nasional ', '2014-04-08', '2014-04-08 08:52:00', 'File Khusus Surat Edaran 10 April 2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(288, 1, 4, 299, '005/1787/421.032/2014', '', 'BAGIAN TATA USAHA', 'Rapat Koordinasi Penentuan Tambahan Penghasilan ( BK ) ', '2014-04-08', '2014-04-08 08:58:00', 'Saya Hadir 10 April 2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(289, 1, 3, 300, '800/1653/421.202/2014', '', 'BKD', 'Keterlibatan PNS Dalam Pemilu', '2014-04-07', '2014-04-10 10:45:00', 'File Surat Edaran  10/15 2014', 'E:\\SCAN SURAT\\IMG_0007.jpg'),
(290, 1, 3, 301, '005/1820/421.032/2014', '', 'BAGIAN TATA USAHA', 'Undangan Sosialisasi PPh Orang Pribadi Dalam Negeri ( OPDN) dan PPh Pasal 21 . Pada Hari Jum''at , 11 April 2014 ,07:30  Tempat di Hotel Pelangi .', '2014-04-10', '2014-04-10 10:50:00', '', 'E:\\SCAN SURAT\\IMG_0007.jpg'),
(291, 1, 3, 302, '176/587/421.050/2014', '', 'DPRD KABUPATEN MALANG', 'Permohonan Penugasan Pada Kunjungan Kerja DPRD Kab.Malang Pada Jum''at 11 April 2014 di Kantor Kec.Sumberpucung .', '2014-04-07', '2014-04-10 10:57:00', '', 'E:\\SCAN SURAT\\IMG_0007.jpg'),
(292, 1, 3, 303, '176/584/421.050/2014', '', 'DPRD KABUPATEN MALANG', 'Permohonan Penugasan ka SKPD Pada Kunjungan Kerja DPRD Kab.Malang Pada Kamis , 10 April 2014 Pkl.10.00 Wib', '2014-04-07', '2014-04-10 11:08:00', 'Untuk Diteruskan pada yg ditunjuk   8/4 2014', 'E:\\SCAN SURAT\\IMG_0007.jpg'),
(293, 1, 3, 304, '005/582/421.050/2014', '', 'DPRD KABUPATEN MALANG', 'Permohonan Penugasan ka SKPD Pada Rapat Kerja Dengan DPRD Kab.Malang Pada Selasa, 8 April 2014 di RR Komisi DPRD Kab.Malang', '2014-04-04', '2014-04-10 11:14:00', 'uNTUK DITERUSKAN  YG DITUNJUK 8/4 2014', 'E:\\SCAN SURAT\\IMG_0007.jpg'),
(294, 1, 3, 305, '556/172/421.108/2014', '', 'DINAS KEBUDAYAAN & PARIWISATA', 'Audiensi dan Pemaparan Bidang V Seksi Festival Kesenian Daerah Penas Petani Nelayan XIV , Selasa, 8 April 2014 Pukul 15.00 WIB', '2014-04-03', '2014-04-10 11:18:00', 'yeni  File surat Penas 15/4 2014', 'E:\\SCAN SURAT\\IMG_0007.jpg'),
(295, 1, 3, 306, '800/11978/120.23/2014', '', 'Dinas Pendapatan Provinsi Jatim', 'Sosialisasi pph OPDN dan pph Pasal 21, Jum''at , 11 April 2014 Pukul 08.00 WIB di Hotel Pelangi Malang', '2014-04-04', '2014-04-10 11:22:00', '', 'E:\\SCAN SURAT\\IMG_0007.jpg'),
(296, 1, 3, 307, '282/2452/203.3/2014', '', 'Gubernur Jatim ', 'Permohonan Penugasan pada kegiatan Perbaikan Proses Politik yang beretika politik bagi aparatur dan masyarakat  Selassa, 22 April 2014 di Hotel Tretes View Pasuruan.', '2014-04-10', '2014-04-10 13:54:00', 'Fotocopi  Kesbang, Satoil,Camat,Pkk, GOW   15/4 2014', 'E:\\SCAN SURAT\\IMG_0002.jpg'),
(297, 1, 3, 308, '050/783/421.203/2014', '', 'BAPPEKAB', 'Laporan Triwulan Program Penanggulangan Kemiskinan', '2014-04-10', '2014-04-14 09:42:00', 'Untuk di buat jawaban sesuai form       Nihil ', 'E:\\SCAN SURAT\\IMG_0002.jpg'),
(298, 1, 3, 309, '304/UND/JPIP/IV/2014', '', 'The Jawa Pos Institute Of Pro - Otonom (JPIP)', 'Permohonan Menjadi Narasumber Utama  Dan Deklarator KUAT Senin, 14 April 2014', '2014-04-01', '2014-04-14 09:46:00', 'file khusus     15/4  2014', 'E:\\SCAN SURAT\\IMG_0002.jpg'),
(299, 1, 3, 310, '104/PUSTAKAPEMDA/III/2014', '', 'Pusat Kajian Tata Kelola Keuangan Dan Pembangunan ', 'Bimbek Peningkatan Kapasitas Pegawai Di Lingkungan Pemerintah Daerah Dalam Bidang Perencanaan Dan Penyusuna Indikator Ekonomi Makro Daerah 2014 Pada Hari Kamis s.d Jumat 22 - 23 Mei 2014', '2014-03-23', '2014-04-14 09:52:00', 'File   15/4 2014', 'E:\\SCAN SURAT\\IMG_0002.jpg'),
(300, 1, 3, 311, '101/PUSTAKAPEMDA/III/2014', '', 'Kepala PUSTAKA PEMDA', 'Bimbingan Teknis Pengelolaan Barang Milik Negara Sebagai Pendukung Laporan Keuangan Pemerintah Daerah Dengan Opini Wajar Tanpa Pengecualian (WTP) Pada Hari Kamis - Jumat, 8 - 9 Mei 2014 Di Hotel Ibis Styles dan Tgl 13 - 14 Mei 2014 di Hotel Ibis Sby', '2014-03-24', '2014-04-14 10:01:00', 'File   15/4    2014', 'E:\\SCAN SURAT\\IMG_0002.jpg'),
(301, 1, 3, 312, '005/6925/023/2014', '', 'Gubenur Jawa Timur', 'Undangan Rapat Koordinasi Persiapan Pelaksanaan PENAS KTNA KE XIV Tahun 2014 Pukul 13,00 WIB di Meritus Hotel, Jl. Basuki Rachmad Surabaya', '2014-04-10', '2014-04-14 10:10:00', 'SPPD', 'E:\\SCAN SURAT\\IMG_0002.jpg'),
(302, 1, 3, 313, '005/1835/421.032/2014', '', 'BAGIAN TATA USAHA', 'UNDANGAN  RAPAT KOORDINASI PERSIAPAN PELAKSANAAN PENAS KTNA KE XIV TAHUN 2014', '2014-04-11', '2014-04-14 10:15:00', 'SPPD nya     15/4   2014', 'E:\\SCAN SURAT\\IMG_0002.jpg'),
(303, 1, 4, 314, '030/568/421.119/2014', '', 'DPPKA', 'Pendistribusian Barang Ke blok Office Kepanjen', '2014-04-08', '2014-04-14 13:21:00', 'Untuk dikoordinasi dg Bag. Umum\r\nUntuk dicatat Asetnya   15/4 2014', 'E:\\SCAN SURAT\\IMG_0002.jpg'),
(304, 1, 3, 315, '030/571/421.119/2014', '', 'DPPKA', 'Pendistribusian Kain Batik untuk Kader Posyandu, Guru PAUD dan Taman Kanak kanak.', '2014-04-08', '2014-04-14 13:25:00', '', 'E:\\SCAN SURAT\\IMG_0002.jpg'),
(305, 1, 2, 316, '030/568/421.119/2014', '', 'DPPKA', 'Pendistribusian Barang ke Blok Office Kepanjen.', '2014-04-15', '2014-04-15 09:24:00', '', 'E:\\SCAN SURAT\\IMG_0003.jpg'),
(306, 1, 4, 317, '-', '', 'Kartina Widiarini', 'Lamaran Pekerjaan', '2014-04-12', '2014-04-15 09:30:00', '', 'E:\\SCAN SURAT\\IMG_0003.jpg'),
(307, 1, 4, 318, '176/606/421.050/2014', '', 'DPRD KABUPATEN MALANG', 'Permohonan Penugasan pada Kunker Komisi A dan B DPRD Kab. Malang , Rabu 16 April 2014', '2014-04-15', '2014-04-15 09:33:00', 'Untuk di undang yg bersangkutan   15/4 2014', 'E:\\SCAN SURAT\\IMG_0003.jpg'),
(308, 1, 4, 319, '-', '', 'Panitia IRSA 2014', 'Surat Undangan Partisipasi pada ajang Indonesia Road Safety Award ( IRSA )', '2014-04-07', '2014-04-15 09:38:00', 'File         15/4   2014', 'E:\\SCAN SURAT\\IMG_0003.jpg'),
(309, 1, 3, 320, '13/KTNA-Nas/04/2014', '', 'Pengurus Kelompok Kontak Tani Nelayan Andalan Nasi', 'Undangan Pembukaan Pada Rembug Madya KTNA Nasional dalam Rangka Sosialisasi Juknis Penaas XIV Selasa 15 April 2014 Pkl. 08.00  -  09.45  di Gajahmada Graha Hotel Malang', '2014-04-15', '2014-04-15 09:42:00', 'Yeni     : File Khusus Penas   15/4   2014', 'E:\\SCAN SURAT\\IMG_0004.jpg'),
(310, 1, 4, 321, '176/621/421.050/2014', '', 'DPRD KABUPATEN MALANG', 'Permohonan Penugasan pada Kunjungan Kerja Komisi C dan D DPRD Kab. Malang Senin 21 April 2014 Pkl. 10.00 Wib di Kantor Kec. Pakis  dan Pagak ', '2014-04-15', '2014-04-15 09:56:00', 'UNTUK DI UNDANG SESUAI YBS DITUNJUK   15/4   2014', 'E:\\SCAN SURAT\\IMG_0003.jpg'),
(311, 1, 4, 322, '176/623/421.050/2014', '', 'DPRD KABUPATEN MALANG', 'Permohonan Penugasan pada kunjungan kerja komisi  A,B,C dan D DPRD Kab. Malang Selasa 22 April 2014 Pkl. 10.00 Wib di Pagak dan Jabung dan Donomulyo.', '2014-04-15', '2014-04-15 10:02:00', 'UNTUK DI UNDANG SESUAI ISI SURAT    15/4     2014', 'E:\\SCAN SURAT\\IMG_0003.jpg'),
(312, 1, 4, 323, '443.32/3746/101.2/2014', '', 'Dinas Kesehatan Provinsi Jatim ', 'Bantuan Menugaskan pada Undangan Peningkatan Ketrampilan dan Sosialisasi Mobilisasi Instruksi Vaksin Baru. Tk Propinsi Bagi Ketua TP PKK dan Pokja se Jatim pada Minggu - Selasa 13-15 April 2014 di Contry Herritage Hotel Surabaya.', '2014-04-04', '2014-04-15 10:06:00', 'FILE KHUSUS   15/4   2014', 'E:\\SCAN SURAT\\IMG_0003.jpg'),
(313, 1, 3, 324, '-', '', 'The British Institute ( TBI )', 'Undangan Grand Opening TBI Malang, Rabu 16 April 2014', '2014-04-17', '2014-04-17 07:49:00', 'kOORDINASI DENGAN pAK pRI', 'E:\\SCAN SURAT\\IMG_0037.jpg'),
(314, 1, 3, 325, '176/631/421.050/2014', '', 'DPRD KABUPATEN MALANG', 'Permohonan Penugasan acara kunjungan Kerja dengan anggota DPRD Kab. Malang ', '2014-04-15', '2014-04-17 08:19:00', 'uNTUK DICUKUPI uNDANGANNNYA  17/4  2014', 'E:\\SCAN SURAT\\IMG_0037.jpg'),
(315, 1, 4, 326, '060/350/220/2014', '', 'Sekretaris Dewan Pengurus KORPRI. Prov. Jatim ', 'Laporan Data & Kegiatan ', '2014-04-01', '2014-04-17 08:30:00', 'uNTUK DIBUAT DICUKUPI SESUAI FORM   17/4   2014', 'E:\\SCAN SURAT\\IMG_0037.jpg'),
(316, 1, 4, 327, '005/1862/421.032/2014', '', 'BAGIAN TATA USAHA', 'Launcing Buku Kajian Pengeluaran Dan Penerimaan Publik ( PERA ) Kab. Malang Oleh Bapak Bupati Malang', '2014-04-17', '2014-04-17 08:37:00', 'SUDAH SELESAI     17/4 2014', 'E:\\SCAN SURAT\\IMG_0037.jpg'),
(317, 1, 3, 328, '050/078/421.203/2014', '', 'BAPPEKAB', 'Penajaman Indikator Program dan Kegiatan Tahun 2015.pada Rabu-Kamis, 23-24 April 2014, 08.30 Wib Hotel Savana Jl. Letjen Sutoyo no. 32-34 Malang', '2014-04-17', '2014-04-17 12:23:00', 'Hadiri atau Tugaskan yg menguasaia Perencanaan   1   ', ''),
(318, 1, 3, 329, '2108/PDIKT', '', 'Setjen Kemendagri RI', 'Rencana Kegiatan Asitensi Teknis Pengelolaan Kunci SISSAN pada JKS Pemerintah Daerah Tahun 2014 Untuk Jatim tgl 21 s/d April 2014', '2014-04-17', '2014-04-17 13:07:00', 'Untuk Dihadiri   17/4   2014', 'E:\\SCAN SURAT\\IMG_0010.jpg'),
(319, 1, 4, 330, '005/04/042/2014', '', 'Gubernur Jatim', 'Bantuan Menugaskan Pada Kegiatan Asistensi Teknis Pengelolaan Kunci Sistem Sandi ( SISSAN ) Pada jaringan Komunikasi Sandi Pemerintah Daerah Thn 2014  Senin 21 April 2014 Pkl. 08.30 Wib di Hotel Sahid Surabaya ', '2014-04-17', '2014-04-17 13:25:00', 'Untuk dihadiri   17/4   2014', 'E:\\SCAN SURAT\\IMG_0011.jpg'),
(320, 1, 2, 331, '024/1892/421.032/2014', '', 'BAGIAN TATA USAHA', 'Permintaan Kendaraan Dinas Roda 2 ( Dua ) Bagi Adc. Asiten dan Staf Kurir Bagian Tata Usaha Sekretariat Daerah Kab.) Malang ( Tembusan Sebagai Laporan ', '2014-04-21', '2014-04-21 09:31:00', '', ''),
(321, 1, 4, 332, '800/1835/421.202/2014', '', 'BKD', 'Pengisian dan Penyampaian Laporan pajak - Pajak Pribadi ( LP2P) Tahun 2014', '2014-04-14', '2014-04-21 09:49:00', '', 'E:\\SCAN SURAT\\IMG_0012.jpg'),
(322, 1, 2, 333, '800/1835/421.202/2014', '', 'BKD', 'Pengisian dan Penyampoaian Laporan Pajak - Pajak Pribadi     ( LP2P ) Tahun 2014', '2014-04-14', '2014-04-21 09:53:00', '', 'E:\\SCAN SURAT\\IMG_0013.jpg'),
(323, 1, 4, 334, '800/1835/421.202/2014', '', 'BKD', 'Pengisian dan Penyampaian Laporan Pajak - Pajak Pribadi       ( LP2P ) Tahun 2014', '2014-04-14', '2014-04-21 12:31:00', 'File Surat Khusus   21/4   2014', 'E:\\SCAN SURAT\\IMG_0013.jpg'),
(324, 1, 2, 335, '893/211/421.209/2014', '', 'BANDIKLAT', 'Permohonan Memimpin Rapat ', '2014-04-21', '2014-04-21 12:41:00', 'Kegiatan Sudah dilaksanakan     21/4   2014', 'E:\\SCAN SURAT\\IMG_0013.jpg'),
(325, 1, 3, 336, '080/1888/SJ', '', 'Mendagri Ri', 'Undangan Rakor Biro Umum Seluruh Indonesia Tgl. 8 s/d 10 Mei 2014 di Hotel Harmoni One Kota Batam ', '2014-04-14', '2014-04-21 12:53:00', 'Koordinasi Dg Bagian Umum ', 'E:\\SCAN SURAT\\IMG_0013.jpg'),
(326, 1, 4, 337, '482.1/1928/421.032/2014', '', 'BAGIAN TATA USAHA', 'Himbauan Mendengarkan Talk Show pada Selasa 22 April 2014, Pkl. 06.00 s/d 07.oo Wib ', '2014-04-21', '2014-04-21 12:58:00', 'Dengarkan    21/4   2014', 'E:\\SCAN SURAT\\IMG_0011.jpg'),
(327, 1, 2, 338, 'R-268/Lan/Sm/PP.05-04/04/2014', '', 'Lembaga Sandi Negara', 'Distribusi Kunci Sistem  Sandi Pada Jaring Komunikasi Sandi Pemerintah Daerah Tahun 2014 pada tanggal 20 April 2014 s/d 26 Juni 2014 ', '2014-04-23', '2014-04-23 08:08:00', '', 'E:\\SCAN SURAT\\IMG_0022.jpg'),
(328, 1, 3, 339, '188.45/240/KEP/421.013/2014', '', 'Bupati Malang ', 'Tim Pemantauan Perkembangan Politik di Kabupaten Malang Tahun 2014', '2014-04-23', '2014-04-23 08:25:00', '', 'E:\\SCAN SURAT\\IMG_0023.jpg'),
(329, 1, 4, 340, '670/LSN/D1/DL.05.01/04/2014', '', 'Lembaga Sandi Negara RI', 'Penawaran Calon Peserta Diklat Fungsional Operator Transmisi Sandi TA. 2014', '2014-04-23', '2014-04-23 09:12:00', '', 'E:\\SCAN SURAT\\IMG.jpg'),
(330, 1, 4, 341, '910/1959/421.023/2014', '', 'BAGIAN ADMINISTRASI PEMBANGUNAN', 'Percepatan Realisasi Penyerapan Anggaran TA. 2014', '2014-04-23', '2014-04-23 13:23:00', '', 'E:\\SCAN SURAT\\IMG.jpg'),
(331, 1, 4, 342, '005/1947/421.032/2014', '', 'BAGIAN TATA USAHA', 'Undangan Penandatanganan Kesepakatan Bersama Antar Pemerintah Kab. Malang Dengan PT Telekomunikasi Indonesia Tbk', '2014-04-23', '2014-04-23 13:51:00', '', 'E:\\SCAN SURAT\\IMG.jpg'),
(332, 1, 3, 343, '003.3.3/1969/421.032/2014', '', 'BAGIAN TATA USAHA', 'Upacara Peringatan Hari Otonomi Daerah Ke XVIII Tahun 2014 pada Senin 28 April 2014, 07.00  Wib, Halaman Pendopo Agung Kab. Malang Jln. KH. Agus Salim No. 7 Malang', '2014-04-23', '2014-04-23 14:39:00', '', 'E:\\SCAN SURAT\\IMG.jpg'),
(333, 1, 4, 344, '005/1977/421.032/2014', '', 'BAGIAN TATA USAHA', 'Upacara Bendera Peringatan Hari Otonomi Daerah ke XVIII Tahun 2014', '2014-04-24', '2014-04-25 09:47:00', 'hadir     25/4  2014    \r\nFile        25/4   2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(334, 1, 4, 345, '476/515/421.210/2014', '', 'BADAN KELUARGA BERENCANA', 'Permohonan Undangan Peserta Rapat Kerja Daerah (Rakerda) Program KKB Tahun 2014           ', '2014-04-21', '2014-04-25 10:00:00', '', 'E:\\SCAN SURAT\\IMG.jpg'),
(335, 1, 4, 346, '800/1833/421.202/2014', '', 'BKD', 'Pendaftaran Diklat Kearsipan Tahun 2014', '2014-04-23', '2014-04-25 10:11:00', '', 'E:\\SCAN SURAT\\IMG.jpg'),
(336, 1, 4, 347, '045/181/421.211/2014', '', 'BADAN PERPUS, ARSIP & DOKUMENTASI', 'Permintaan Data Dokumen/Arsip Pemerintah Daerah ( Tembusan )', '2014-04-21', '2014-04-25 10:16:00', 'Untuk dipedomi dan ditugaskan Staf yg menangani  Arsip.    Ibu Selly    25/4 2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(337, 1, 4, 348, '176/668/421.050/2014', '', 'DPRD KABUPATEN MALANG', 'Permohonan Penugasan pada Kunjungan Kerja Komisi A,B,C dan D DPRD Kab. Malang Selasa, 29 April 2014 Pkl. 10.00 Wib di Gondanglegi Wonosari dan Singosari', '2014-04-23', '2014-04-25 10:26:00', '', 'E:\\SCAN SURAT\\IMG.jpg'),
(338, 1, 3, 349, '005/1989/421.032/2014', '', 'BAGIAN TATA USAHA', 'Rapat Sosialisasi Permohonan Izin Prinsip Untuk Kegiatan Survey Seismik 2D PT. Pertamina Ep Regional Lumajang Jawa Timur di Kabupaten Malang.', '2014-04-24', '2014-04-25 10:35:00', 'hadir       25/4     2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(339, 1, 3, 350, '176/666/421.050/2014', '', 'DPRD KABUPATEN MALANG', 'Permohonan Penugasan pada Kunjungan Kerja Komisi A,B,C dan D DPRD Kab. Malang Senin  28  April 2014, 10.Wib di Tajinan dan Pagak.', '2014-04-25', '2014-04-25 10:51:00', 'Buat Undangan Untuk yang bersangkutan    25/4   2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(340, 1, 3, 351, '065/ADM/DP-APKASI/III/2014', '', 'Asosiasi Pemerintah Kab. Malang Seluruh Indonesia ', 'Penundaan Bimtek Pembinaan APIP & Biro Hukum Dg Tema " Peningkatan Peran APIP dan Biro Hukum Dlm Meminimalisir Potensi Masalah & Pengadaan Barang/Jasa Pemerintah " Menjadi 08 Mei 2014, Bertempat di  singosari Ballroom Hotel Grand Sahid Jaya Jakarta.', '2014-04-25', '2014-04-25 10:55:00', 'UNTUK DITUNJUKAN  KE BAPAK SEKDA SURAT TERDAHULU.  25/4   2014    SURAT ASLI DI BAGIAN KEUANGAN  25/4   2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(341, 1, 4, 352, '530/7456/021/2014', '', 'Gubernur Jatim ', 'Bantuan Menugaskan pada Rakor Penguatan Produksi Distribusi dan Konektivitas Mengantisipasi Dampak Badai Elnino dan Kenaikan Tarif Dasar Listrik " Selasa 29 April 2014 09.00 Wib di Hotel Meritus Jl. Basuki Rahmat n0 67-74 Surabaya.', '2014-04-22', '2014-04-25 11:09:00', '', 'E:\\SCAN SURAT\\IMG.jpg'),
(342, 1, 3, 353, '414.4/427/421.208/2014', '', 'BADAN PEMBERDAYAAN MASYARAKAT', 'Persiapan Kegiatan Pencanangan BBGRM XI dan HKG-PKK ke  42   2014 di Integrasikan dengan Bina Desa.', '2014-04-25', '2014-04-25 13:47:00', 'Untuk diisi NIHIL Pada Format dan Dikirim ke BPM  25/4   2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(343, 1, 4, 354, '476/515/421.210/2014', '', 'BADAN KELUARGA BERENCANA', 'permohonan Undangan Peserta Rapat Kerja daerah ( Rakerda ) Program KKB Tahun 2014', '2014-04-28', '2014-04-28 09:11:00', 'Untuk dibuat Undangan yg bersangkutan   25/4   2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(344, 1, 3, 355, 'B-073/lPPM-UM/IV/2014', '', 'Universitas Merdeka Malang  ', 'Permohonan Untuk Menghadirkan Camat, Lurah/Kades Kadin Koperasi  & UMKM pada Acara Sosialisasi dan Koordinasi Pelaksanaan Program Sentral Kulaan Selasa 6 Mei 2014 Pkl. 13.00 Wib  RR L.2 Kantor Pusat Unmer Malang.', '2014-04-25', '2014-04-25 09:43:00', 'Untuk dibuat Undangannya ', 'E:\\SCAN SURAT\\IMG.jpg'),
(345, 1, 3, 356, '005/2029/421.032/2014', '', 'BAGIAN TATA USAHA', 'Rapat Paripurna DPRD Kab. Malang Rabu, 30 April 2014, Pkl. 13.00 Wib, Ruang Rapat Paripurna DPRD Kab. Malang Jl. Panji No. 119 Kepanjen ', '2014-04-29', '2014-04-29 10:00:00', 'Saya Hadir    29/4 2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(346, 1, 3, 357, '005/2030/421.032/2014', '', 'BAGIAN TATA USAHA', 'Rapat Koordinasi Persiapan  pelaksanaan Bina Desa ,BBGM  XI dan HKG-PKK ke 42Tahun  2014. Rabu,  30 April 2014 pKL 10.00 Wib  Ruang Anusapati ( Lantai  II ) Ruang  Anusapati ( Lantai II )  Jl. Merdeka  Timur No. 3 Malang', '2014-04-29', '2014-04-29 10:17:00', 'Hadir   29/4   2014', 'E:\\SCAN SURAT\\IMG.jpg'),
(347, 1, 3, 358, '005/2067/421.032/2014', '', 'BAGIAN TATA USAHA', 'Undangan TAHLIL pada  Kamis, 1 Mei 2014, 17 00 Wib  Pendopo Agung Kab. Malang  JL. KH. Agus Salim No. 7 Malang', '2014-04-30', '2014-04-30 09:49:00', '', ''),
(348, 1, 3, 359, '005/693/421.050/2014', '', 'DPRD KABUPATEN MALANG', 'Undangan Rapat Paripurna DPRD Pada hari Rabu, 30 April 2014 Pkl. 13.00 Wib di RR Paripurna DPRD Kab. Malang', '2014-04-28', '2014-04-30 10:01:00', '', 'E:\\SCAN SURAT\\IMG_0044.jpg'),
(349, 1, 3, 360, '045.021/2012/421.211/2014', '', 'BADAN PERPUS, ARSIP & DOKUMENTASI', 'Penyerahan Arsip Statis yg Tercipta di setiap Satuan Kerja Perangkat Daerah ( SKPD ) di Lingkungan Pemerintah Kab. Malang', '2014-04-28', '2014-04-30 11:02:00', '', 'E:\\SCAN SURAT\\IMG_0044.jpg'),
(350, 1, 3, 361, '050.2/187/421.211/2014', '', 'BADAN PERPUS, ARSIP & DOKUMENTASI', 'Permohonan Pindah Tempat Kedudukan Badan Perpustakaan , Arsip, dan Dokumentasi Kab. Malang dari Jl. P. Sudirman No. 19 Kepanjen Ke Jl. KH. Agus Salim No. 7 Malang', '2014-04-22', '2014-04-30 11:15:00', '', ''),
(351, 1, 3, 362, '713/LSN/01/DL.05.01/04/2014', '', 'Lembaga Sandi Negara Jakarta Selatan ', 'Rencana  Penyelenggaraan Diklat Sandiman Dasar Lembaga Sandi Negara Negara Ta. 2014', '2014-04-23', '2014-04-30 11:22:00', '', 'E:\\SCAN SURAT\\IMG_0044.jpg'),
(352, 1, 3, 363, '005/2073/421.032/2014', '', 'BAGIAN TATA USAHA', 'Upacara Peringatan Hari Pendidikan  Nasional Tahun 2014 Pada Jumat 2 Mei 2014,  07.30 Wib. Stadion Kanjuruhan ', '2014-04-30', '2014-04-30 13:20:00', '', 'E:\\SCAN SURAT\\IMG_0044.jpg'),
(353, 1, 3, 364, '973/087/421.603/2014', '', 'Camat Ngantang Kab. Malang ', 'Permohonanh Penundaan Jatuh Tempo Pembayaran PBB Kec. Ngantang Kab. Malang ', '2014-04-17', '2014-04-30 14:10:00', '', 'E:\\SCAN SURAT\\IMG_0044.jpg'),
(354, 1, 3, 365, '050/981/421.101/2014', '', 'DINAS PENDIDIKAN', 'Permohonan bantuan Mengundang Pada Rakor Persiapan Peringatan Hardiknas Tahun 2014 Rabu 30 April 2014 , 13.00 Wib  di RR Kertanegara Malang.', '2014-04-25', '2014-04-30 14:14:00', '', 'E:\\SCAN SURAT\\IMG_0006.jpg'),
(355, 1, 3, 366, '005/713/421.050/2014', '', 'DPRD KABUPATEN MALANG', 'Perubahan Materi Rapat Paripurna DPRD Kab. Malang Rabu, 30 April 2014 Pkl. 13.00 Wib di RR Paripuna DPRD Kab. Malang', '2014-04-29', '2014-04-30 14:20:00', '', ''),
(356, 1, 3, 367, '100/2077/421.011/2014', '', 'BAGIAN TATA PEMERINTAHAN UMUM', 'Kegiatan Bina Desa  ke 23  di Desa Urek - Urek Kec. Gondang Legi.', '2014-04-30', '2014-05-02 08:57:00', '', 'E:\\SCAN SURAT\\IMG_0044.jpg'),
(357, 1, 3, 368, '489/262/421.033/2014', '', 'BAGIAN HUMAS', 'Penyampaian Jadwal Ketua Kelompok Apel Pagi Bulan Mei dan Juni 2014', '2014-05-02', '2014-05-02 09:51:00', '', 'E:\\SCAN SURAT\\IMG_0044.jpg'),
(358, 1, 3, 369, '005/112/421.034/2014', '', 'BAGIAN ORGANISASI', 'Jadwal Audit Internal ', '2014-05-02', '2014-05-02 13:20:00', '', 'E:\\SCAN SURAT\\IMG_0001.jpg'),
(359, 2, 4, 370, '24442', 'oi', 'oi', 'oio', '2014-05-12', '2014-05-08 16:34:35', 'iu', ''),
(360, 2, 4, 371, 'Test', '1', '2', '5', '2014-05-14', '2014-05-14 10:20:28', '9', '');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `user_type_id`, `email`, `fullname`, `passwd`, `address`, `thumbnail`, `is_active`) VALUES
(2, 1, 'her0satr@yahoo.com', 'Herry', 'fe30fa79056939db8cbe99c8d601de74', '-', '2014/03/11/20140311_131431_5821.jpg', 1),
(5, 2, '111', '1asdasd', '5d408d848a029d6d3b333ee32469dda8', '', '', 1),
(6, 3, '2', 'Namanya 2', 'cb8eed4d556ba533cf5c6941d9eb5991', '', '', 1),
(12, 3, '4343', 'asfsaf', '58bdea2e9191d57af9f61e06e6d29990', '', '', 1),
(10, 1, '0123456789', 'Ferry Cahyono', '705f973c251b7e26e40f855739de2d87', '', '', 1),
(11, 3, '39284208', 'Ferry Cahyono', '675beb1e1b02db58af70302a2089fd96', '', '', 1),
(13, 3, '46356565656', 'Wudi Yulianto', 'f7c1912b8bff4c16d6e1f0ba198063c3', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_biodata`
--

CREATE TABLE IF NOT EXISTS `user_biodata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `biodata_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `user_biodata`
--

INSERT INTO `user_biodata` (`id`, `user_id`, `biodata_id`) VALUES
(1, 5, 3),
(2, 6, 2),
(4, 10, 5),
(5, 11, 6),
(6, 12, 7),
(7, 13, 8);

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `widget`
--

INSERT INTO `widget` (`id`, `title`, `alias`, `content`) VALUES
(1, 'Kepegawaian', 'pegawai', 'Isi Kepegawaian<br>'),
(2, 'Presensi', 'skp', 'Presensi<br>'),
(3, 'Kegiatan Harian PNS', 'absensi', 'Kegiatan Harian PNS<br>'),
(4, 'Laporan Kepegawaian', 'laporan-pegawai', 'Isi Laporan Kepegawaian'),
(5, 'Surat Masuk', 'surat-masuk', 'Isi Surat Masuk'),
(6, 'Surat Keluar', 'surat-keluar', 'Isi Surat Keluar'),
(7, 'Nota Dinas', 'nota-dinas', 'Isi Nota Dinas'),
(8, 'Agenda Rapat', 'agenda-rapat', 'Isi Agenda Rapat'),
(9, 'Rekap Surat', 'tambahan-surat', 'Rekap Surat<br>');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
