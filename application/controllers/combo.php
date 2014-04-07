<?php

class combo extends CI_Controller {
	function __construct() {
		parent::__construct();
	}
	
	function index() {
		$action = (!empty($_POST['action'])) ? $_POST['action'] : '';
		
		// set limit
		$_POST['limit'] = 50;
		
		$array = array();
		if ($action == 'jenis_kegiatan') {
			$array = $this->jenis_kegiatan_model->get_array($_POST);
		} else if ($action == 'jenis_skp') {
			$array = $this->jenis_skp_model->get_array($_POST);
		}
		
		echo ShowOption(array( 'Array' => $array ));
		exit;
	}
}