-- MySql Data Dump

-- Database : sygaas_db 

-- Dumping started at : 2014-03-26-11-15-38

-- Dumping finished at : 2014-03-26-11-15-38

-- Dumping data of sygaas_db took : 0.025001049041748 Sec

-- --------------------------------------------------------

-- Dumping data for table : absensi_kosong

INSERT INTO absensi_kosong VALUES (2,3,'2014-03-14','Cuti','123 55','2014/03/13/20140313_134928_8276.png');
INSERT INTO absensi_kosong VALUES (4,4,'2014-03-18','Ijin','Ijin saja','');


-- Dumping data for table : absensi_masuk

INSERT INTO absensi_masuk VALUES (1,3,'2014-03-13','Tepat Waktu','11:55:43','','12:26:52','','13:00:00','','15:00:00','','--');
INSERT INTO absensi_masuk VALUES (2,2,'2014-03-14','Tepat Waktu','09:54:06','','00:00:00','','00:00:00','','00:00:00','','');
INSERT INTO absensi_masuk VALUES (3,4,'2014-03-17','Tepat Waktu','15:01:14','','00:00:00','','15:19:09','','15:19:07','','');
INSERT INTO absensi_masuk VALUES (4,4,'2014-03-18','Tepat Waktu','08:01:46','','00:00:00','','15:19:10','','15:19:08','','');
INSERT INTO absensi_masuk VALUES (6,3,'2014-03-19','Tepat Waktu','13:56:36','','13:56:40','','13:56:37','','00:00:00','','');


-- Dumping data for table : agama

INSERT INTO agama VALUES (1,'Islam');
INSERT INTO agama VALUES (2,'Kristen');
INSERT INTO agama VALUES (3,'Protestan');
INSERT INTO agama VALUES (4,'Hindu');
INSERT INTO agama VALUES (5,'Budha');
INSERT INTO agama VALUES (6,'Konghucu');


-- Dumping data for table : agenda_rapat

INSERT INTO agenda_rapat VALUES (5,'Peringatan Acara',12,123,159,'2014-03-13 20:00:00','2014-03-30','','','Catatan','',0);
INSERT INTO agenda_rapat VALUES (6,'Acara Umum',13,13,13,'2014-03-13 21:40:57','2014-03-28','','','','',1);
INSERT INTO agenda_rapat VALUES (7,'Acara Kementrian',11,12,13,'2014-03-17 10:06:52','2014-03-31',1,'','','',1);


-- Dumping data for table : agenda_skpd

INSERT INTO agenda_skpd VALUES (4,9,5);
INSERT INTO agenda_skpd VALUES (3,12,5);
INSERT INTO agenda_skpd VALUES (7,9,6);
INSERT INTO agenda_skpd VALUES (6,10,5);
INSERT INTO agenda_skpd VALUES (8,10,6);


-- Dumping data for table : biodata

INSERT INTO biodata VALUES (2,2,1,2,2,2,2,'Namanya 2','Laki Laki',4,'2014-03-05','2014/03/11/20140311_190001_1854.png','2014/03/11/20140311_190055_5799.jpg');
INSERT INTO biodata VALUES (3,3,5,0,0,0,111,'1asdasd','Perempuan','asdasd','2014-03-12','2014/03/17/20140317_081249_7215.jpg','2014/03/17/20140317_081256_4679.jpg');
INSERT INTO biodata VALUES (4,2,1,1,1,1,0123456789,'Herry Satrio','Laki Laki','Malang','1984-10-15','2014/03/17/20140317_144509_1322.jpg','2014/03/17/20140317_144542_7033.jpg');


-- Dumping data for table : biodata_detail

INSERT INTO biodata_detail VALUES (1,0,'','','','','','','','','','','','','',0);
INSERT INTO biodata_detail VALUES (2,3,'','','','','','','','-','','','','','',123456);
INSERT INTO biodata_detail VALUES (3,4,'Programmer','Senior','III/A','-','5 Tahun 2 Bulan','5 Tahun','2 Bulan',0856355402,'her0satr@yahoo.com','2014/03/17/20140317_144553_8586.jpg','2014/03/17/20140317_144555_4644.jpg','2014/03/17/20140317_144557_7781.jpg','2014/03/17/20140317_144559_5025.jpg',1500000);
INSERT INTO biodata_detail VALUES (4,5,'','','','','','','',111111,'','','','','',0);


-- Dumping data for table : disposisi

INSERT INTO disposisi VALUES (18,12,'Surat dibuat.','2014-03-14 10:56:00','');
INSERT INTO disposisi VALUES (19,12,'Kurir #1','2014-03-14 10:57:23',83);
INSERT INTO disposisi VALUES (20,12,'Kurir #2','2014-03-14 10:57:33',10);
INSERT INTO disposisi VALUES (32,18,'Surat dibuat.','2014-03-17 15:38:00','');
INSERT INTO disposisi VALUES (33,18,'Kurir #1','2014-03-17 15:38:44',44);
INSERT INTO disposisi VALUES (34,18,'Kurir #2','2014-03-17 15:38:45',1);


-- Dumping data for table : divisi

INSERT INTO divisi VALUES (1,'Tata Usaha');
INSERT INTO divisi VALUES (2,'Kepegawaian');
INSERT INTO divisi VALUES (3,'Divisi 1');
INSERT INTO divisi VALUES (4,'Divisi 2');


-- Dumping data for table : jam_absensi

INSERT INTO jam_absensi VALUES (1,1,7,10);
INSERT INTO jam_absensi VALUES (2,2,10,13);
INSERT INTO jam_absensi VALUES (3,3,13,15);
INSERT INTO jam_absensi VALUES (4,4,15,16);


-- Dumping data for table : jenis_kegiatan

INSERT INTO jenis_kegiatan VALUES (2,3,'Lain 01',1,'m');
INSERT INTO jenis_kegiatan VALUES (3,3,'Lain 02',2,'m');
INSERT INTO jenis_kegiatan VALUES (4,4,'Herry Kegiatan',1,'cm');


-- Dumping data for table : jenis_kepegawaian

INSERT INTO jenis_kepegawaian VALUES (1,'PNS Pusat');
INSERT INTO jenis_kepegawaian VALUES (2,'PNS Daerah');


-- Dumping data for table : jenis_skp

INSERT INTO jenis_skp VALUES (3,3,'Jenis SKP 1',1,'cm');
INSERT INTO jenis_skp VALUES (4,3,'Jenis SKP 2',2,'cm');
INSERT INTO jenis_skp VALUES (5,4,'Herry SKP 01',1,'cm');


-- Dumping data for table : kegiatan_skp

INSERT INTO kegiatan_skp VALUES (1,3,3,0,'2014-03-14',1,'');
INSERT INTO kegiatan_skp VALUES (2,3,0,2,'2014-03-15',2,'');
INSERT INTO kegiatan_skp VALUES (3,4,5,0,'2014-03-17',1,'');
INSERT INTO kegiatan_skp VALUES (4,4,0,4,'2014-03-19',2,'');
INSERT INTO kegiatan_skp VALUES (5,3,3,0,'2014-03-16',1,'Keterangan 01');
INSERT INTO kegiatan_skp VALUES (7,3,4,0,'2014-03-19',1,'as');


-- Dumping data for table : nota_dinas

INSERT INTO nota_dinas VALUES (5,1,2,3,4,5,6,'0000-00-00','2014-03-17','0000-00-00 00:00:00','','2014/03/17/20140317_082031_2967.jpg');
INSERT INTO nota_dinas VALUES (6,1,1,1,1,1,1,'2014-03-17','2014-03-17','2014-03-17 10:06:36','','');
INSERT INTO nota_dinas VALUES (7,11111,11111,11111,11111,11111,11111,'2014-03-17','2014-03-17','0000-00-00 00:00:00','','');


-- Dumping data for table : riwayat_diklat

INSERT INTO riwayat_diklat VALUES (1,3,111,222,'');


-- Dumping data for table : riwayat_mutasi

INSERT INTO riwayat_mutasi VALUES (3,3,'dsf',0,'');


-- Dumping data for table : riwayat_pendidikan

INSERT INTO riwayat_pendidikan VALUES (7,3,13,112,'');


-- Dumping data for table : sifat_arsip

INSERT INTO sifat_arsip VALUES (1,'Statis');
INSERT INTO sifat_arsip VALUES (2,'Dinamis');


-- Dumping data for table : sifat_surat

INSERT INTO sifat_surat VALUES (1,'Penting');
INSERT INTO sifat_surat VALUES (2,'Segera');
INSERT INTO sifat_surat VALUES (3,'Rahasia');
INSERT INTO sifat_surat VALUES (4,'Biasa');


-- Dumping data for table : skpd

INSERT INTO skpd VALUES (9,'Malang','Alun Alun Bunder','Malang Kota','','');
INSERT INTO skpd VALUES (10,'Bandung','Dingin','Hujan',123,'her0satr@gmail.com');
INSERT INTO skpd VALUES (12,'Surabaya','Kepala Surabaya','Kota Surabaya','','');


-- Dumping data for table : status_kepegawaian

INSERT INTO status_kepegawaian VALUES (1,'PNS');
INSERT INTO status_kepegawaian VALUES (2,'CPNS');
INSERT INTO status_kepegawaian VALUES (3,'Kontrak');


-- Dumping data for table : status_perkawinan

INSERT INTO status_perkawinan VALUES (1,'Menikah');
INSERT INTO status_perkawinan VALUES (2,'Belum Menikah');
INSERT INTO status_perkawinan VALUES (3,'Duda / Janda');


-- Dumping data for table : surat_keluar

INSERT INTO surat_keluar VALUES (4,1,2,3,4,'','2014-03-17','',11,'','2014/03/17/20140317_081952_4904.jpg');
INSERT INTO surat_keluar VALUES (5,1,2,2,2,'','2014-03-17',2,88,'','');
INSERT INTO surat_keluar VALUES (6,11111,11111,11111,11111,11111,'2014-03-17','',11111,'','');


-- Dumping data for table : surat_masuk

INSERT INTO surat_masuk VALUES (12,0,2,123456,'No Surat','No Agenda','Surat Dari','Perihal','2014-03-17','2014-03-14 10:56:00','Catatannya','2014/03/17/20140317_081917_5920.jpg');
INSERT INTO surat_masuk VALUES (18,0,0,11111,11111,11111,11111,11111,'2014-03-17','2014-03-17 15:38:00','','');


-- Dumping data for table : user

INSERT INTO user VALUES (2,1,'her0satr@yahoo.com','Herry','fe30fa79056939db8cbe99c8d601de74','-','2014/03/11/20140311_131431_5821.jpg',1);
INSERT INTO user VALUES (5,3,111,'1asdasd','5d408d848a029d6d3b333ee32469dda8','','',1);
INSERT INTO user VALUES (6,3,2,'Namanya 2','cb8eed4d556ba533cf5c6941d9eb5991','','',1);
INSERT INTO user VALUES (7,2,0123456789,'Herry Satrio','705f973c251b7e26e40f855739de2d87','','',1);


-- Dumping data for table : user_biodata

INSERT INTO user_biodata VALUES (1,5,3);
INSERT INTO user_biodata VALUES (2,6,2);


-- Dumping data for table : user_type

INSERT INTO user_type VALUES (1,'Administrator');
INSERT INTO user_type VALUES (2,'Tata Usaha');
INSERT INTO user_type VALUES (3,'Pegawai');
