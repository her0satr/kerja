<?php

class rekap_bulanan extends SYGAAS_Controller {
	function __construct() {
		parent::__construct();
	}
	
	function index() {
		$this->load->view( 'surat/nota_dinas/rekap_bulanan');
	}
	
	function action() {
		$action = (isset($_POST['action'])) ? $_POST['action'] : '';
		unset($_POST['action']);
		
		$result = array();
		if ($action == 'chart_data') {
			list($month, $year) = explode('-', $_POST['date_select']);
			$result = $this->nota_dinas_model->get_select_monthly(array( 'year' => $year, 'month' => $month ));
		}
		
		echo json_encode($result);
	}
}