<?php

class kosong extends SYGAAS_Controller {
	function __construct() {
		parent::__construct();
	}
	
	function index() {
		$this->load->view( 'kepegawaian/absensi/kosong');
	}
	
	function grid() {
		$_POST['column'] = array( 'tanggal', 'status_kosong', 'keterangan' );
		
		// button
		$_POST['is_custom']  = '<button class="btn btn-xs btn-edit btn-success" data-original-title="Edit"><i class="fa fa-pencil"></i></button> ';
		$_POST['is_custom'] .= '<button class="btn btn-xs btn-file btn-success" data-original-title="File"><i class="fa fa-file"></i></button> ';
		$_POST['is_custom'] .= '<button class="btn btn-xs btn-delete btn-danger" data-original-title="Hapus"><i class="fa fa-times"></i></button> ';
		
		$array = $this->absensi_kosong_model->get_array($_POST);
		$count = $this->absensi_kosong_model->get_count();
		$grid = array( 'sEcho' => $_POST['sEcho'], 'aaData' => $array, 'iTotalRecords' => $count, 'iTotalDisplayRecords' => $count );
		
		echo json_encode($grid);
	}
	
	function action() {
		$action = (isset($_POST['action'])) ? $_POST['action'] : '';
		unset($_POST['action']);
		
		$result = array();
		if ($action == 'update') {
			$result = $this->absensi_kosong_model->update($_POST);
		} else if ($action == 'get_by_id') {
			$result = $this->absensi_kosong_model->get_by_id($_POST);
		} else if ($action == 'delete') {
			$result = $this->absensi_kosong_model->delete($_POST);
		}
		
		echo json_encode($result);
	}
}