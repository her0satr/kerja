<?php

class rekap_tahunan extends SYGAAS_Controller {
	function __construct() {
		parent::__construct();
	}
	
	function index() {
		$this->load->view( 'surat/surat_keluar/rekap_tahunan');
	}
	
	function action() {
		$action = (isset($_POST['action'])) ? $_POST['action'] : '';
		unset($_POST['action']);
		
		$result = array();
		if ($action == 'chart_data') {
			$result = $this->surat_keluar_model->get_select_yearly(array( 'year' => $_POST['year'] ));
		}
		
		echo json_encode($result);
	}
}