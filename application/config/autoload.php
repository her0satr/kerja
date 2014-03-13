<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

$autoload['packages'] = array();
$autoload['libraries'] = array( 'database', 'session' );
$autoload['helper'] = array( 'date', 'common', 'url', 'mcrypt' );
$autoload['config'] = array();
$autoload['language'] = array();
$autoload['model'] = array(
	'user_model', 'user_type_model', 'skpd_model', 'biodata_model', 'agama_model', 'jenis_kepegawaian_model', 'status_perkawinan_model',
	'status_kepegawaian_model', 'kelamin_model', 'biodata_detail_model', 'riwayat_pendidikan_model', 'riwayat_diklat_model', 'riwayat_mutasi_model',
	'absensi_masuk_model', 'absensi_kosong_model', 'jenis_skp_model', 'jenis_kegiatan_model', 'kegiatan_skp_model', 'surat_masuk_model', 'surat_keluar_model',
	'agenda_rapat_model', 'nota_dinas_model', 'sifat_surat_model', 'sifat_arsip_model', 'jam_absensi_model', 'disposisi_model'
);
