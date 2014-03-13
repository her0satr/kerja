<?php

class sifat_surat extends SYGAAS_Controller {
	function __construct() {
		parent::__construct();
	}
	
	function index() {
		$this->load->view( 'master/sifat_surat');
	}
	
	function grid() {
		$_POST['is_edit'] = 1;
		$_POST['column'] = array( 'title' );
		
		$array = $this->sifat_surat_model->get_array($_POST);
		$count = $this->sifat_surat_model->get_count();
		$grid = array( 'sEcho' => $_POST['sEcho'], 'aaData' => $array, 'iTotalRecords' => $count, 'iTotalDisplayRecords' => $count );
		
		echo json_encode($grid);
	}
	
	function action() {
		$action = (isset($_POST['action'])) ? $_POST['action'] : '';
		unset($_POST['action']);
		
		$result = array();
		if ($action == 'update') {
			$result = $this->sifat_surat_model->update($_POST);
		} else if ($action == 'get_by_id') {
			$result = $this->sifat_surat_model->get_by_id(array( 'id' => $_POST['id'] ));
		} else if ($action == 'delete') {
			$result = $this->sifat_surat_model->delete($_POST);
		}
		
		echo json_encode($result);
	}
}