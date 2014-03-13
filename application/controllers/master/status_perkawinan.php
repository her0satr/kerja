<?php

class status_perkawinan extends SYGAAS_Controller {
	function __construct() {
		parent::__construct();
	}
	
	function index() {
		$this->load->view( 'master/status_perkawinan');
	}
	
	function grid() {
		$_POST['is_edit'] = 1;
		$_POST['column'] = array( 'title' );
		
		$array = $this->status_perkawinan_model->get_array($_POST);
		$count = $this->status_perkawinan_model->get_count();
		$grid = array( 'sEcho' => $_POST['sEcho'], 'aaData' => $array, 'iTotalRecords' => $count, 'iTotalDisplayRecords' => $count );
		
		echo json_encode($grid);
	}
	
	function action() {
		$action = (isset($_POST['action'])) ? $_POST['action'] : '';
		unset($_POST['action']);
		
		$result = array();
		if ($action == 'update') {
			$result = $this->status_perkawinan_model->update($_POST);
		} else if ($action == 'get_by_id') {
			$result = $this->status_perkawinan_model->get_by_id(array( 'id' => $_POST['id'] ));
		} else if ($action == 'delete') {
			$result = $this->status_perkawinan_model->delete($_POST);
		}
		
		echo json_encode($result);
	}
}