<?php

class home extends SYGAAS_Controller {
	function __construct() {
		parent::__construct();
	}
	
	function index() {
		$this->load->view( 'surat/surat_keluar/home');
	}
	
	function grid() {
		$_POST['is_edit'] = 1;
		$_POST['column'] = array( 'no_surat', 'pengolah', 'tujuan', 'tanggal_surat' );
		
		$array = $this->surat_keluar_model->get_array($_POST);
		$count = $this->surat_keluar_model->get_count();
		$grid = array( 'sEcho' => $_POST['sEcho'], 'aaData' => $array, 'iTotalRecords' => $count, 'iTotalDisplayRecords' => $count );
		
		echo json_encode($grid);
	}
	
	function action() {
		$action = (isset($_POST['action'])) ? $_POST['action'] : '';
		unset($_POST['action']);
		
		$result = array();
		if ($action == 'update') {
			$result = $this->surat_keluar_model->update($_POST);
		} else if ($action == 'get_by_id') {
			$result = $this->surat_keluar_model->get_by_id(array( 'id' => $_POST['id'] ));
		} else if ($action == 'delete') {
			$result = $this->surat_keluar_model->delete($_POST);
		}
		
		echo json_encode($result);
	}
}