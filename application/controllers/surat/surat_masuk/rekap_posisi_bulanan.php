<?php

class rekap_posisi_bulanan extends SYGAAS_Controller {
	function __construct() {
		parent::__construct();
	}
	
	function index() {
		$this->load->view( 'surat/surat_masuk/rekap_posisi_bulanan');
	}
	
	function action() {
		$action = (isset($_POST['action'])) ? $_POST['action'] : '';
		unset($_POST['action']);
		
		$result = array();
		if ($action == 'chart_data') {
			list($month, $year) = explode('-', $_POST['date_select']);
			$result = $this->surat_masuk_model->get_chart_monthly(array( 'year' => $year, 'month' => $month ));
		}
		
		echo json_encode($result);
	}
}