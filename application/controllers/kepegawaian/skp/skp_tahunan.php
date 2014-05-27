<?php

class skp_tahunan extends SYGAAS_Controller {
	function __construct() {
		parent::__construct();
	}
	
	function index() {
		$this->load->view( 'kepegawaian/skp/skp_tahunan');
	}
	
	function grid() {
		// action
		$action = (isset($_POST['action'])) ? $_POST['action'] : '';
		
		// user
		$user = $this->user_model->get_session();
		
		// grid selecetor
		if (in_array($action, array('skp_summary'))) {
			$_POST['is_edit'] = 1;
			$_POST['column'] = array( 'tanggal_pembuatan_text', 'tanggal_penilaian_text' );
			
			$model_name = $action.'_model';
			$array = $this->$model_name->get_array($_POST);
			$count = $this->$model_name->get_count();
		}
		
		$grid = array( 'sEcho' => $_POST['sEcho'], 'aaData' => $array, 'iTotalRecords' => $count, 'iTotalDisplayRecords' => $count );
		echo json_encode($grid);
	}
	
	function action() {
		
		$action = (isset($_POST['action'])) ? $_POST['action'] : '';
		unset($_POST['action']);
		
		// set result
		$result = array();
		
		// skp summary
		if ($action == 'skp_summary_update') {
			$result = $this->skp_summary_model->update($_POST);
		} else if ($action == 'skp_summary_get_by_id') {
			$result = $this->skp_summary_model->get_by_id(array( 'id' => $_POST['id'] ));
		} else if ($action == 'skp_summary_delete') {
			$result = $this->skp_summary_model->delete($_POST);
		}
		
		echo json_encode($result);
	}
}