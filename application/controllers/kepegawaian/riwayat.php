<?php

class riwayat extends SYGAAS_Controller {
	function __construct() {
		parent::__construct();
	}
	
	function index() {
		$this->load->view( 'kepegawaian/riwayat');
	}
	
	function grid() {
		$action = (isset($_POST['action'])) ? $_POST['action'] : '';
		unset($_POST['action']);
		
		$_POST['is_custom']  = '<button class="btn btn-xs btn-edit" data-original-title="Edit"><img src="'.base_url('static/img/icons/icon-edit.png').'" /></button> ';
		$_POST['is_custom'] .= '<button class="btn btn-xs btn-file" data-original-title="File"><img src="'.base_url('static/img/icons/icon-detail.png').'" /></button> ';
		$_POST['is_custom'] .= '<button class="btn btn-xs btn-delete" data-original-title="Hapus"><img src="'.base_url('static/img/icons/icon-delete.png').'" /></button> ';
		
		if ($action == 'riwayat_pendidikan') {
			$_POST['column'] = array( 'no_ijazah', 'tahun', 'keterangan' );
			
			$array = $this->riwayat_pendidikan_model->get_array($_POST);
			$count = $this->riwayat_pendidikan_model->get_count();
		} else if ($action == 'riwayat_mutasi') {
			$_POST['column'] = array( 'no_sk', 'tahun', 'keterangan' );
			
			$array = $this->riwayat_mutasi_model->get_array($_POST);
			$count = $this->riwayat_mutasi_model->get_count();
		} else if ($action == 'riwayat_diklat') {
			$_POST['column'] = array( 'no_sertifikat', 'tahun', 'keterangan' );
			
			$array = $this->riwayat_diklat_model->get_array($_POST);
			$count = $this->riwayat_diklat_model->get_count();
		}
		
		$grid = array( 'sEcho' => $_POST['sEcho'], 'aaData' => $array, 'iTotalRecords' => $count, 'iTotalDisplayRecords' => $count );
		echo json_encode($grid);
	}
	
	function action() {
		$action = (isset($_POST['action'])) ? $_POST['action'] : '';
		unset($_POST['action']);
		
		$result = array();
		
		// pendidikan
		if ($action == 'pendidikan_update') {
			$result = $this->riwayat_pendidikan_model->update($_POST);
		} else if ($action == 'pendidikan_get_by_id') {
			$result = $this->riwayat_pendidikan_model->get_by_id(array( 'id' => $_POST['id'] ));
		} else if ($action == 'pendidikan_delete') {
			$result = $this->riwayat_pendidikan_model->delete($_POST);
		}
		
		// mutasi
		else if ($action == 'mutasi_update') {
			$result = $this->riwayat_mutasi_model->update($_POST);
		} else if ($action == 'mutasi_get_by_id') {
			$result = $this->riwayat_mutasi_model->get_by_id(array( 'id' => $_POST['id'] ));
		} else if ($action == 'mutasi_delete') {
			$result = $this->riwayat_mutasi_model->delete($_POST);
		}
		
		// diklat
		else if ($action == 'diklat_update') {
			$result = $this->riwayat_diklat_model->update($_POST);
		} else if ($action == 'diklat_get_by_id') {
			$result = $this->riwayat_diklat_model->get_by_id(array( 'id' => $_POST['id'] ));
		} else if ($action == 'diklat_delete') {
			$result = $this->riwayat_diklat_model->delete($_POST);
		}
		
		echo json_encode($result);
	}
}