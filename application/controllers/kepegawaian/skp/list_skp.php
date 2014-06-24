<?php

class list_skp extends SYGAAS_Controller {
	function __construct() {
		parent::__construct();
	}
	
	function index() {
		$this->load->view( 'kepegawaian/skp/list_skp');
	}
	
	function grid() {
		// user
		$user = $this->user_model->get_session();
		
		if (in_array($user['user_type_id'], array(USER_ID_TU, USER_ID_ADMINISTRATOR, USER_ID_PENILAI))) {
			$_POST['view_type'] = 'validate';
			$_POST['column'] = array( 'tanggal', 'waktu', 'biodata_text', 'title', 'kuan', 'kual' );
		} else {
			$_POST['is_custom'] = '&nbsp;';
			$_POST['column'] = array( 'tanggal', 'waktu', 'biodata_text', 'title', 'kuan', 'kual' );
		}
		
		$array = $this->kegiatan_skp_model->get_array($_POST);
		$count = $this->kegiatan_skp_model->get_count();
		$grid = array( 'sEcho' => $_POST['sEcho'], 'aaData' => $array, 'iTotalRecords' => $count, 'iTotalDisplayRecords' => $count );
		
		echo json_encode($grid);
	}
	
	function action() {
		$action = (isset($_POST['action'])) ? $_POST['action'] : '';
		unset($_POST['action']);
		
		$result = array();
		if ($action == 'update') {
			$result = $this->kegiatan_skp_model->update($_POST);
		} else if ($action == 'validate') {
			$result = $this->kegiatan_skp_model->update($_POST);
		} else if ($action == 'get_by_id') {
			$result = $this->kegiatan_skp_model->get_by_id(array( 'id' => $_POST['id'] ));
		} else if ($action == 'delete') {
			$result = $this->kegiatan_skp_model->delete($_POST);
		}
		
		echo json_encode($result);
	}
}