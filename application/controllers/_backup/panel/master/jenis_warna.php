<?php

class jenis_warna extends DEALER_Controller {
	function __construct() {
		parent::__construct();
	}
	
	function index() {
		$this->load->view( 'panel/master/jenis_warna');
	}
	
	function grid() {
		$_POST['is_edit'] = 1;
		$_POST['column'] = array( 'jenis_unit_name', 'name' );
		
		$array = $this->Jenis_Warna_model->get_array($_POST);
		$count = $this->Jenis_Warna_model->get_count();
		$grid = array( 'sEcho' => $_POST['sEcho'], 'aaData' => $array, 'iTotalRecords' => $count, 'iTotalDisplayRecords' => $count );
		
		echo json_encode($grid);
	}
	
	function action() {
		$action = (isset($_POST['action'])) ? $_POST['action'] : '';
		unset($_POST['action']);
		
		$result = array();
		if ($action == 'update') {
			$result = $this->Jenis_Warna_model->update($_POST);
		} else if ($action == 'get_by_id') {
			$result = $this->Jenis_Warna_model->get_by_id(array( 'id' => $_POST['id'] ));
		} else if ($action == 'delete') {
			$result = $this->Jenis_Warna_model->delete($_POST);
		}
		
		echo json_encode($result);
	}
}