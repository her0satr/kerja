<?php

class biodata extends SYGAAS_Controller {
	function __construct() {
		parent::__construct();
	}
	
	function index() {
		$this->load->view( 'kepegawaian/biodata');
	}
	
	function grid() {
		$_POST['is_edit'] = 1;
		$_POST['column'] = array( 'nama', 'nip', 'tanggal_lahir_text', 'tempat_lahir' );
		
		// button
		$_POST['is_custom']  = '<button class="btn btn-xs btn-edit btn-success" data-original-title="Edit"><i class="fa fa-pencil"></i></button> ';
		$_POST['is_custom'] .= '<button class="btn btn-xs btn-detail btn-success" data-original-title="Hapus"><i class="fa fa-comments"></i></button> ';
		$_POST['is_custom'] .= '<button class="btn btn-xs btn-delete btn-danger" data-original-title="Hapus"><i class="fa fa-times"></i></button> ';
		
		$array = $this->biodata_model->get_array($_POST);
		$count = $this->biodata_model->get_count();
		$grid = array( 'sEcho' => $_POST['sEcho'], 'aaData' => $array, 'iTotalRecords' => $count, 'iTotalDisplayRecords' => $count );
		
		echo json_encode($grid);
	}
	
	function action() {
		$action = (isset($_POST['action'])) ? $_POST['action'] : '';
		unset($_POST['action']);
		
		$result = array();
		if ($action == 'update') {
			$result = $this->biodata_model->update($_POST);
		} else if ($action == 'get_by_id') {
			$result = $this->biodata_model->get_by_id(array( 'id' => $_POST['id'] ));
		} else if ($action == 'delete') {
			$result = $this->biodata_model->delete($_POST);
		}
		
		echo json_encode($result);
	}
}