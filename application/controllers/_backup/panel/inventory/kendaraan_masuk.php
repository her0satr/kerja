<?php

class kendaraan_masuk extends DEALER_Controller {
	function __construct() {
		parent::__construct();
	}
	
	function index() {
		$this->load->view( 'panel/inventory/kendaraan_masuk');
	}
	
	function grid() {
		$_POST['column'] = array( 'stock_date', 'jenis_unit_text', 'jenis_warna_name', 'stock_update', 'stock_total' );
		
		$array = $this->Kendaraan_model->get_array($_POST);
		$count = $this->Kendaraan_model->get_count();
		$grid = array( 'sEcho' => $_POST['sEcho'], 'aaData' => $array, 'iTotalRecords' => $count, 'iTotalDisplayRecords' => $count );
		
		echo json_encode($grid);
	}
	
	function action() {
		$action = (isset($_POST['action'])) ? $_POST['action'] : '';
		unset($_POST['action']);
		
		$result = array();
		if ($action == 'update') {
			$result = $this->Kendaraan_model->update_total($_POST);
		}
		
		echo json_encode($result);
	}
}