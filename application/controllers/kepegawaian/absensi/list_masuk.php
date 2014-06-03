<?php

class list_masuk extends SYGAAS_Controller {
	function __construct() {
		parent::__construct();
	}
	
	function index() {
		$this->load->view( 'kepegawaian/absensi/list_masuk');
	}
	
	function grid() {
		$_POST['grid_type'] = 'rekap_pegawai';
		
		// user
		$user = $this->user_model->get_session();
		
		if (in_array($user['user_type_id'], array(USER_ID_TU, USER_ID_ADMINISTRATOR))) {
			$_POST['is_edit']  = 1;
			$_POST['column'] = array( 'biodata_title', 'tanggal', 'waktu_01', 'waktu_02', 'waktu_03', 'waktu_04' );
		} else {
			$_POST['is_custom'] = '&nbsp;';
			$_POST['column'] = array( 'biodata_title', 'tanggal', 'waktu_01', 'waktu_02', 'waktu_03', 'waktu_04' );
		}
		
		$array = $this->absensi_masuk_model->get_array($_POST);
		$count = $this->absensi_masuk_model->get_count();
		$grid = array( 'sEcho' => $_POST['sEcho'], 'aaData' => $array, 'iTotalRecords' => $count, 'iTotalDisplayRecords' => $count );
		
		echo json_encode($grid);
	}
	
	function action() {
		$action = (isset($_POST['action'])) ? $_POST['action'] : '';
		unset($_POST['action']);
		
		$result = array();
		if ($action == 'update') {
			$result = $this->absensi_masuk_model->update($_POST);
		} else if ($action == 'get_by_id') {
			$result = $this->absensi_masuk_model->get_by_id($_POST);
		} else if ($action == 'delete') {
			$result = $this->absensi_masuk_model->delete($_POST);
		}
		
		echo json_encode($result);
	}
}