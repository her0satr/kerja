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
		$_POST['is_custom']  = '<button class="btn btn-xs btn-edit" data-original-title="Edit"><img src="'.base_url('static/img/icons/icon-edit.png').'" /></i></button> ';
		$_POST['is_custom'] .= '<button class="btn btn-xs btn-file" data-original-title="File"><img src="'.base_url('static/img/icons/icon-detail.png').'" /></button> ';
		$_POST['is_custom'] .= '<button class="btn btn-xs btn-delete" data-original-title="Hapus"><img src="'.base_url('static/img/icons/icon-delete.png').'" /></button> ';
		
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