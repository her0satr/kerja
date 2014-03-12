<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

define('FILE_READ_MODE', 0644);
define('FILE_WRITE_MODE', 0666);
define('DIR_READ_MODE', 0755);
define('DIR_WRITE_MODE', 0777);

define('FOPEN_READ',							'rb');
define('FOPEN_READ_WRITE',						'r+b');
define('FOPEN_WRITE_CREATE_DESTRUCTIVE',		'wb'); // truncates existing file data, use with care
define('FOPEN_READ_WRITE_CREATE_DESTRUCTIVE',	'w+b'); // truncates existing file data, use with care
define('FOPEN_WRITE_CREATE',					'ab');
define('FOPEN_READ_WRITE_CREATE',				'a+b');
define('FOPEN_WRITE_CREATE_STRICT',				'xb');
define('FOPEN_READ_WRITE_CREATE_STRICT',		'x+b');

define('SHA_SECRET',							'OraNgerti');

define('USER_ID_ADMINISTRATOR',					1);
define('USER_ID_TU',							2);
define('USER_ID_PEGAWAI',						3);

define('AGAMA',									'agama');
define('BIODATA',								'biodata');
define('BIODATA_DETAIL',						'biodata_detail');
define('JENIS_KEPEGAWAIAN',						'jenis_kepegawaian');
define('RIWAYAT_DIKLAT',						'riwayat_diklat');
define('RIWAYAT_MUTASI',						'riwayat_mutasi');
define('RIWAYAT_PENDIDIKAN',					'riwayat_pendidikan');
define('SKPD',									'skpd');
define('STATUS_PERKAWINAN',						'status_perkawinan');
define('STATUS_KEPEGAWAIAN',					'status_kepegawaian');
define('USER',									'user');
define('USER_TYPE',								'user_type');
define('ABSENSI_MASUK',							'absensi_masuk');