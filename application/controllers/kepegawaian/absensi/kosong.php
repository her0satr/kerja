<?php

class kosong extends SYGAAS_Controller {
	function __construct() {
		parent::__construct();
	}
	
	function index() {
		$this->load->view( 'kepegawaian/absensi/kosong');
	}
	
	/*
	function grid() {
		$_POST['grid_type'] = 'absensi_pegawai';
		$_POST['column'] = array( 'tanggal', 'waktu_01', 'waktu_02', 'waktu_03', 'waktu_04' );
		
		// button
		$_POST['is_custom']  = '<button class="btn btn-xs btn-detail btn-success" data-original-title="Detail"><i class="fa fa-book"></i></button> ';
		
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
			// make sure only one date every staff
			$row_check = $this->absensi_masuk_model->get_by_id(array( 'biodata_id' => $_POST['biodata_id'], 'tanggal' => $_POST['tanggal'] ));
			if (count($row_check) > 0) {
				$result['status'] = 0;
				$result['message'] = 'Anda sudah absen hari ini.';
				echo json_encode($result);
				exit;
			}
			
			// absensi #1
			if (empty($_POST['id'])) {
				$_POST['waktu_01'] = $this->config->item('current_time');
			}
			
			$result = $this->absensi_masuk_model->update($_POST);
		} else if ($action == 'update_waktu') {
			if (in_array($_POST['absensi'], array( 'waktu_02', 'waktu_03', 'waktu_04' ))) {
				$param_update['id'] = $_POST['id'];
				$param_update[$_POST['absensi']] = $this->config->item('current_time');
				$result = $this->absensi_masuk_model->update($param_update);
			}
		} else if ($action == 'get_by_id') {
			$result = $this->absensi_masuk_model->get_by_id($_POST);
		}
		
		echo json_encode($result);
	}
	/*	*/
}