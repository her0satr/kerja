<?php

class agenda extends CI_Controller {
	function __construct() {
		parent::__construct();
	}
	
	function index() {
		$this->load->view( 'rekap/agenda');
	}
	
	function grid() {
		$action = (isset($_POST['action'])) ? $_POST['action'] : '';
		unset($_POST['action']);
		
		$_POST['column'] = array( 'title', 'kepala', 'instansi' );
		
		$array = $this->agenda_skpd_model->get_array($_POST);
		$count = $this->agenda_skpd_model->get_count();
		$grid = array( 'sEcho' => $_POST['sEcho'], 'aaData' => $array, 'iTotalRecords' => $count, 'iTotalDisplayRecords' => $count );
		
		echo json_encode($grid);
	}
}