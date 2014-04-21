<?php

class home extends SYGAAS_Controller {
	function __construct() {
		parent::__construct();
	}
	
	function index() {
		$this->load->view( 'kepegawaian/skp/home');
	}
	
	function grid() {
		$_POST['is_edit'] = 1;
		$_POST['column'] = array( 'tanggal', 'waktu', 'no_urut', 'title', 'keterangan' );
		
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
		} else if ($action == 'get_next_no') {
			$result = $this->kegiatan_skp_model->get_next_no($_POST);
		} else if ($action == 'get_by_id') {
			$result = $this->kegiatan_skp_model->get_by_id(array( 'id' => $_POST['id'] ));
		} else if ($action == 'get_string_day') {
			$result['status'] = 1;
			$result['hari'] = GetFormatDate($_POST['tanggal'], array( 'FormatDate' => 'l', 'replace_indo' => true ));
		} else if ($action == 'delete') {
			$result = $this->kegiatan_skp_model->delete($_POST);
		}
		
		echo json_encode($result);
	}
	
	function cetak() {
		header("Content-type: application/vnd.ms-word");
		header("Content-Disposition: attachment;Filename=kegiatan_harian.doc");
	
		$content = $this->load->view( 'kepegawaian/skp/kegiatan_harian', array(), true );
		echo $content;
	}
}