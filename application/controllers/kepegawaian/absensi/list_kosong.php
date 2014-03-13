<?php

class list_kosong extends SYGAAS_Controller {
	function __construct() {
		parent::__construct();
	}
	
	function index() {
		$this->load->view( 'kepegawaian/absensi/list_kosong');
	}
	
	function grid() {
		$_POST['grid_type'] = 'rekap_pegawai';
		$_POST['column'] = array( 'nama', 'tanggal', 'status_kosong', 'keterangan' );
		
		$_POST['is_custom']  = '<button class="btn btn-xs btn-edit btn-success" data-original-title="Edit"><i class="fa fa-pencil"></i></button> ';
		$_POST['is_custom'] .= '<button class="btn btn-xs btn-file btn-success" data-original-title="File"><i class="fa fa-file"></i></button> ';
		
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
		}
		
		echo json_encode($result);
	}
}