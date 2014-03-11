<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

$autoload['packages'] = array();
$autoload['libraries'] = array( 'database', 'session' );
$autoload['helper'] = array( 'date', 'common', 'url', 'mcrypt' );
$autoload['config'] = array();
$autoload['language'] = array();
$autoload['model'] = array(
	'user_model', 'user_type_model', 'skpd_model'
);
