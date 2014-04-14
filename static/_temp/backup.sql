-- MySql Data Dump

-- Database : sygaas_db 

-- Dumping started at : 2014-04-14-10-08-12

-- Dumping finished at : 2014-04-14-10-08-12

-- Dumping data of sygaas_db took : 0.019001007080078 Sec

-- --------------------------------------------------------

-- Dumping data for table : absensi_kosong

INSERT INTO absensi_kosong VALUES (2,3,'2014-03-14','Cuti','123 55','2014/03/13/20140313_134928_8276.png');
INSERT INTO absensi_kosong VALUES (4,4,'2014-03-18','Ijin','Ijin saja','');


-- Dumping data for table : absensi_masuk

INSERT INTO absensi_masuk VALUES (1,3,'2014-03-13','Tepat Waktu','11:55:43','','12:26:52','','13:00:00','','15:00:00','','--');
INSERT INTO absensi_masuk VALUES (3,4,'2014-03-17','Tepat Waktu','15:01:14','','15:31:05','','15:19:09','','15:19:07','','');
INSERT INTO absensi_masuk VALUES (4,4,'2014-03-18','Tepat Waktu','08:01:46','','15:31:05','','15:19:10','','15:19:08','','');
INSERT INTO absensi_masuk VALUES (7,4,'2014-04-08','Tepat Waktu','14:32:31','','00:00:00','','00:00:00','','00:00:00','',456);
INSERT INTO absensi_masuk VALUES (8,0,'0000-00-00','','00:00:00','','00:00:00','','00:00:00','','00:00:00','','');


-- Dumping data for table : agama

INSERT INTO agama VALUES (1,'Islam');
INSERT INTO agama VALUES (2,'Kristen');
INSERT INTO agama VALUES (3,'Protestan');
INSERT INTO agama VALUES (4,'Hindu');
INSERT INTO agama VALUES (5,'Budha');
INSERT INTO agama VALUES (6,'Konghucu');


-- Dumping data for table : agenda_rapat

INSERT INTO agenda_rapat VALUES (5,0,'Peringatan Acara','Sektor','No 001','Balai RW','2014-03-13 20:00:00','2014-03-30','','','Catatan','',0);
INSERT INTO agenda_rapat VALUES (6,0,'Acara Umum',13,13,13,'2014-03-13 21:40:57','2014-03-28','','','','',1);
INSERT INTO agenda_rapat VALUES (7,0,'Acara Kementrian',11,12,13,'2014-03-17 10:06:52','2014-03-31',1,'','','',1);


-- Dumping data for table : agenda_skpd

INSERT INTO agenda_skpd VALUES (4,9,5);
INSERT INTO agenda_skpd VALUES (3,12,5);
INSERT INTO agenda_skpd VALUES (7,9,6);
INSERT INTO agenda_skpd VALUES (6,10,5);
INSERT INTO agenda_skpd VALUES (8,10,6);


-- Dumping data for table : biodata

INSERT INTO biodata VALUES (2,10,1,2,2,2,2,'Namanya 2','Laki Laki','','',4,'2014-03-05','','2014/03/11/20140311_190001_1854.png','2014/03/11/20140311_190055_5799.jpg');
INSERT INTO biodata VALUES (3,9,5,0,0,0,111,'1asdasd','Perempuan',123,987,'asdasd','2014-03-12','2014/04/08/20140408_140727_6639.png','2014/03/17/20140317_081249_7215.jpg','2014/03/17/20140317_081256_4679.jpg');
INSERT INTO biodata VALUES (4,12,1,1,1,1,0123456789,'Herry Satrio','Laki Laki','','','Malang','1984-10-15','2014/04/08/20140408_140926_2002.jpg','2014/03/17/20140317_144509_1322.jpg','2014/03/17/20140317_144542_7033.jpg');


-- Dumping data for table : biodata_detail

INSERT INTO biodata_detail VALUES (1,0,0,0,'','','','','','','','','','','',0);
INSERT INTO biodata_detail VALUES (2,3,1,9,'','','','','','','-','','','','',123456);
INSERT INTO biodata_detail VALUES (3,4,0,2014,'Programmer','III/A','-','5 Tahun 2 Bulan','5 Tahun','2 Bulan',0856355402,'her0satr@yahoo.com','2014/03/17/20140317_144553_8586.jpg','2014/03/17/20140317_144555_4644.jpg','2014/03/17/20140317_144557_7781.jpg',1500000);
INSERT INTO biodata_detail VALUES (4,5,0,0,'','','','','','',111111,'','','','',0);


-- Dumping data for table : disposisi

INSERT INTO disposisi VALUES (1,19,1,'2014-04-07 21:19:00','');
INSERT INTO disposisi VALUES (3,19,2,'2014-04-07 21:28:16',556);
INSERT INTO disposisi VALUES (4,19,3,'2014-04-07 21:28:25',9);
INSERT INTO disposisi VALUES (5,20,1,'2014-04-09 07:12:31','');
INSERT INTO disposisi VALUES (6,21,1,'2014-04-09 11:56:40','');
INSERT INTO disposisi VALUES (7,22,1,'2014-04-09 11:56:40','');


-- Dumping data for table : divisi

INSERT INTO divisi VALUES (1,'Tata Usaha');
INSERT INTO divisi VALUES (2,'Kepegawaian');
INSERT INTO divisi VALUES (3,'Divisi 1');
INSERT INTO divisi VALUES (4,'Divisi 2');


-- Dumping data for table : index_surat

INSERT INTO index_surat VALUES (2,001,'Organisasi');
INSERT INTO index_surat VALUES (3,002,'Pengumuman');
INSERT INTO index_surat VALUES (4,003,'Agenda Rapat');


-- Dumping data for table : jam_absensi

INSERT INTO jam_absensi VALUES (1,1,7,10);
INSERT INTO jam_absensi VALUES (2,2,10,13);
INSERT INTO jam_absensi VALUES (3,3,13,15);
INSERT INTO jam_absensi VALUES (4,4,15,16);


-- Dumping data for table : jenis_kegiatan

INSERT INTO jenis_kegiatan VALUES (2,3,'Lain 01',1,'m');
INSERT INTO jenis_kegiatan VALUES (3,3,'Lain 02',2,'m');
INSERT INTO jenis_kegiatan VALUES (5,4,'Kegiatan Lain 01',0,'');
INSERT INTO jenis_kegiatan VALUES (6,4,'Kegiatan Lain 02',0,'');


-- Dumping data for table : jenis_kepegawaian

INSERT INTO jenis_kepegawaian VALUES (1,'PNS Pusat');
INSERT INTO jenis_kepegawaian VALUES (2,'PNS Daerah');


-- Dumping data for table : jenis_skp

INSERT INTO jenis_skp VALUES (3,3,'Jenis SKP 1',1,'cm');
INSERT INTO jenis_skp VALUES (4,3,'Jenis SKP 2',2,'cm');
INSERT INTO jenis_skp VALUES (6,4,'Herry Jenis SKP 01',1,'unit');
INSERT INTO jenis_skp VALUES (7,4,'Herry Jenis SKP 02',2,'unit');


-- Dumping data for table : kegiatan_skp

INSERT INTO kegiatan_skp VALUES (1,3,3,0,0,'2014-03-14','00:00:00',1,'','');
INSERT INTO kegiatan_skp VALUES (2,3,0,2,0,'2014-03-15','00:00:00',2,'','');
INSERT INTO kegiatan_skp VALUES (8,4,6,0,0,'2014-04-07','20:00:00',1,'','Isi SKP');
INSERT INTO kegiatan_skp VALUES (5,3,3,0,0,'2014-03-16','00:00:00',1,'','Keterangan 01');
INSERT INTO kegiatan_skp VALUES (9,4,0,5,0,'2014-04-07','10:00:00',2,'','Isi Kegiatan Lain 01');
INSERT INTO kegiatan_skp VALUES (10,4,6,0,1,'2014-04-14','08:00:00',1,'Kendala 1','No urut 1 Jam 8');
INSERT INTO kegiatan_skp VALUES (11,4,7,0,2,'2014-04-14','09:00:00',1,'Kendala 2','No urut 2 Jam 9');


-- Dumping data for table : kop_surat

INSERT INTO kop_surat VALUES (1,'<div style="text-align: center;"><font size="4"><span style="font-weight: bold;">PEMERINTAH KABUPATEN MALANG</span></font><br>BAGIAN TATA USAHA SETDA KAB. MALANG<br>Jl. Merdeka Timur No. 3 Malang Telp. (0341) 362209<br>Email : bag-tu@malangkab.go.id<br><span style="text-decoration: underline;">MALANG</span><br></div>');


-- Dumping data for table : nota_dinas

INSERT INTO nota_dinas VALUES (5,1,2,3,4,5,6,'0000-00-00','2014-03-17','0000-00-00 00:00:00','','2014/03/17/20140317_082031_2967.jpg');
INSERT INTO nota_dinas VALUES (6,1,1,1,1,1,1,'2014-03-17','2014-03-17','2014-03-17 10:06:36','','');
INSERT INTO nota_dinas VALUES (7,11111,11111,11111,11111,11111,11111,'2014-03-17','2014-03-17','0000-00-00 00:00:00','','');


-- Dumping data for table : pangkat

INSERT INTO pangkat VALUES (1,'Pembina','IV','A',40);
INSERT INTO pangkat VALUES (2,'Pembina Tingkat I','IV','B',41);
INSERT INTO pangkat VALUES (3,'Pembina Utama Muda','IV','C',42);
INSERT INTO pangkat VALUES (4,'Pembina Utama Madya','IV','D',43);
INSERT INTO pangkat VALUES (5,'Pembina Utama','IV','E',44);


-- Dumping data for table : riwayat_diklat

INSERT INTO riwayat_diklat VALUES (1,3,111,222,'','wqe');


-- Dumping data for table : riwayat_mutasi

INSERT INTO riwayat_mutasi VALUES (3,3,'dsf',0,'','');


-- Dumping data for table : riwayat_pendidikan

INSERT INTO riwayat_pendidikan VALUES (7,3,13,112,'',12355);


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


-- Dumping data for table : surat_destination

INSERT INTO surat_destination VALUES (1,'Surat dibuat',1);
INSERT INTO surat_destination VALUES (2,'Sekretaris',0);
INSERT INTO surat_destination VALUES (3,'Kepala Desa',0);


-- Dumping data for table : surat_keluar

INSERT INTO surat_keluar VALUES (4,2,1,3,4,'','2014-03-17','',11,'','2014/03/17/20140317_081952_4904.jpg');
INSERT INTO surat_keluar VALUES (5,3,2,2,2,'','2014-03-17',2,88,'','');


-- Dumping data for table : surat_masuk

INSERT INTO surat_masuk VALUES (12,0,2,2,'No Surat','No Agenda','Surat Dari','Perihal','2014-03-17','2014-03-14 10:56:00','Catatannya','2014/03/17/20140317_081917_5920.jpg');
INSERT INTO surat_masuk VALUES (18,0,0,1,11111,11111,11111,11111,'2014-03-17','2014-03-17 15:38:00','','');
INSERT INTO surat_masuk VALUES (19,2,4,3,'XX-03-2014','No Agenda',13,21,'2014-04-07','2014-04-07 21:19:00','Catatannya Kosong','');
INSERT INTO surat_masuk VALUES (20,2,4,4,'No Surat 1','No Agenda','Surat Dari 2','Perihal','2014-04-09','2014-04-09 08:00:00','Catatan','2014/04/09/20140409_071316_7455.jpg');
INSERT INTO surat_masuk VALUES (21,2,4,5,'No Surat','No Agenda','Surat Dari 2','Perihal','2014-04-09','2014-04-09 11:56:40','Catatan','');
INSERT INTO surat_masuk VALUES (22,0,0,6,'No Surat 1','No Agenda 2','Surat Dari 2 2','Perihal','2014-04-09','2014-04-09 11:56:40','','');


-- Dumping data for table : user

INSERT INTO user VALUES (2,1,'her0satr@yahoo.com','Herry','fe30fa79056939db8cbe99c8d601de74','-','2014/03/11/20140311_131431_5821.jpg',1);
INSERT INTO user VALUES (5,3,111,'1asdasd','5d408d848a029d6d3b333ee32469dda8','','',1);
INSERT INTO user VALUES (6,3,2,'Namanya 2','cb8eed4d556ba533cf5c6941d9eb5991','','',1);
INSERT INTO user VALUES (9,1,0123456789,'Herry Satrio','705f973c251b7e26e40f855739de2d87','','',1);


-- Dumping data for table : user_biodata

INSERT INTO user_biodata VALUES (1,5,3);
INSERT INTO user_biodata VALUES (2,6,2);
INSERT INTO user_biodata VALUES (3,9,4);


-- Dumping data for table : user_type

INSERT INTO user_type VALUES (1,'Administrator');
INSERT INTO user_type VALUES (2,'Tata Usaha');
INSERT INTO user_type VALUES (3,'Pegawai');


-- Dumping data for table : widget

INSERT INTO widget VALUES (1,'Kepegawaian','pegawai','Isi Kepegawaian');
INSERT INTO widget VALUES (2,'SKP','skp','Isi SKP');
INSERT INTO widget VALUES (3,'Absensi','absensi','Isi Absensi');
INSERT INTO widget VALUES (4,'Laporan Kepegawaian','laporan-pegawai','Isi Laporan Kepegawaian');
INSERT INTO widget VALUES (5,'Surat Masuk','surat-masuk','Isi Surat Masuk');
INSERT INTO widget VALUES (6,'Surat Keluar','surat-keluar','Isi Surat Keluar');
INSERT INTO widget VALUES (7,'Nota Dinas','nota-dinas','Isi Nota Dinas');
INSERT INTO widget VALUES (8,'Agenda Rapat','agenda-rapat','Isi Agenda Rapat');
