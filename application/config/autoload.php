<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

$autoload['packages'] = array();
$autoload['libraries'] = array( 'database', 'session' );
$autoload['helper'] = array( 'date', 'common', 'url', 'mcrypt' );
$autoload['config'] = array();
$autoload['language'] = array();
$autoload['model'] = array(
	'user_model', 'user_type_model', 'skpd_model', 'biodata_model', 'agama_model', 'jenis_kepegawaian_model', 'status_perkawinan_model',
	'status_kepegawaian_model', 'kelamin_model'
);
