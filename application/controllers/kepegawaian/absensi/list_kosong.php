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
		
		// user
		$user = $this->user_model->get_session();
		
		if (in_array($user['user_type_id'], array(USER_ID_TU, USER_ID_ADMINISTRATOR))) {
			$_POST['is_custom']  = '<button class="btn btn-xs btn-edit" data-original-title="Edit"><img src="'.base_url('static/img/icons/icon-edit.png').'" /></button> ';
			$_POST['is_custom'] .= '<button class="btn btn-xs btn-file" data-original-title="File"><img src="'.base_url('static/img/icons/icon-detail.png').'" /></button> ';
		} else {
			$_POST['is_custom'] = '&nbsp;';
		}
		
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