<?php

class skpd extends SYGAAS_Controller {
	function __construct() {
		parent::__construct();
	}
	
	function index() {
		$this->load->view( 'master/skpd');
	}
	
	function grid() {
		// grid type
		if (isset($_POST['grid_type']) && $_POST['grid_type'] == 'search') {
			$_POST['column'] = array( 'title', 'kepala', 'instansi' );
			$_POST['is_custom'] = '<button class="btn btn-xs btn-add" data-original-title="Tambah"><img src="'.base_url('static/img/icons/icon-edit.png').'" /></button> ';
		} else {
			$_POST['is_edit'] = 1;
			$_POST['column'] = array( 'title', 'kepala', 'instansi', 'hp' );
		}
		
		$array = $this->skpd_model->get_array($_POST);
		$count = $this->skpd_model->get_count();
		$grid = array( 'sEcho' => $_POST['sEcho'], 'aaData' => $array, 'iTotalRecords' => $count, 'iTotalDisplayRecords' => $count );
		
		echo json_encode($grid);
	}
	
	function action() {
		$action = (isset($_POST['action'])) ? $_POST['action'] : '';
		unset($_POST['action']);
		
		$result = array();
		if ($action == 'update') {
			$result = $this->skpd_model->update($_POST);
		} else if ($action == 'get_by_id') {
			$result = $this->skpd_model->get_by_id(array( 'id' => $_POST['id'] ));
		} else if ($action == 'delete') {
			$result = $this->skpd_model->delete($_POST);
		}
		
		echo json_encode($result);
	}
}