<?php

class combo extends CI_Controller {
	function __construct() {
		parent::__construct();
	}
	
	function index() {
		$action = (!empty($_POST['action'])) ? $_POST['action'] : '';
		
		if ($action == 'jenis_warna') {
			$array = $this->Jenis_Warna_model->get_array($_POST);
		}
		
		echo ShowOption(array( 'Array' => $array ));
		exit;
	}
}