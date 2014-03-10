<?php

class stock_kendaraan extends DEALER_Controller {
	function __construct() {
		parent::__construct();
	}
	
	function index() {
		$this->load->view( 'panel/report/stock_kendaraan');
	}
	
	function grid() {
		$_POST['is_edit'] = 1;
		$_POST['column'] = array( 'jenis_unit_name', 'jenis_warna_name', 'total' );
		
		$array = $this->Kendaraan_model->get_summary($_POST);
		$count = $this->Kendaraan_model->get_count();
		$grid = array( 'sEcho' => $_POST['sEcho'], 'aaData' => $array, 'iTotalRecords' => $count, 'iTotalDisplayRecords' => $count );
		
		echo json_encode($grid);
	}
}