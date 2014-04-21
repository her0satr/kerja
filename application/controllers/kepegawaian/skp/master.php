<?php

class master extends SYGAAS_Controller {
	function __construct() {
		parent::__construct();
	}
	
	function index() {
		$this->load->view( 'kepegawaian/skp/master');
	}
	
	function grid() {
		$_POST['is_edit'] = 1;
		$action = (isset($_POST['action'])) ? $_POST['action'] : '';
		unset($_POST['action']);
		
		if ($action == 'jenis_skp') {
			$_POST['column'] = array( 'title', 'jumlah', 'satuan', 'point' );
			
			$array = $this->jenis_skp_model->get_array($_POST);
			$count = $this->jenis_skp_model->get_count();
		} else if ($action == 'jenis_kegiatan') {
			$_POST['column'] = array( 'title', 'jumlah', 'satuan', 'point' );
			
			$array = $this->jenis_kegiatan_model->get_array($_POST);
			$count = $this->jenis_kegiatan_model->get_count();
		}
		
		$grid = array( 'sEcho' => $_POST['sEcho'], 'aaData' => $array, 'iTotalRecords' => $count, 'iTotalDisplayRecords' => $count );
		echo json_encode($grid);
	}
	
	function action() {
		$action = (isset($_POST['action'])) ? $_POST['action'] : '';
		unset($_POST['action']);
		
		$result = array();
		
		// jenis skp
		if ($action == 'skp_update') {
			$result = $this->jenis_skp_model->update($_POST);
		} else if ($action == 'skp_get_by_id') {
			$result = $this->jenis_skp_model->get_by_id(array( 'id' => $_POST['id'] ));
		} else if ($action == 'skp_delete') {
			$result = $this->jenis_skp_model->delete($_POST);
		}
		
		// kegiatan
		else if ($action == 'kegiatan_update') {
			$result = $this->jenis_kegiatan_model->update($_POST);
		} else if ($action == 'kegiatan_get_by_id') {
			$result = $this->jenis_kegiatan_model->get_by_id(array( 'id' => $_POST['id'] ));
		} else if ($action == 'kegiatan_delete') {
			$result = $this->jenis_kegiatan_model->delete($_POST);
		}
		
		echo json_encode($result);
	}
}