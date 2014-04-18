<?php
class typeahead extends CI_Controller {
	function __construct() {
		parent::__construct();
	}
	
	function index() {
		$action = (!empty($_GET['action'])) ? $_GET['action'] : '';
		unset($_GET['action']);
		
		if (empty($_GET['namelike'])) {
			echo json_encode(array());
			exit;
		}
		
		$array = array();
		if ($action == 'biodata') {
			$array = $this->biodata_model->get_array($_GET);
		} else if ($action == 'index_surat') {
			$array = $this->index_surat_model->get_array($_GET);
		} else if ($action == 'skpd') {
			$array = $this->skpd_model->get_array($_GET);
		}
		
		echo json_encode($array);
		exit;
	}
}