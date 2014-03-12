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
		
		$_POST['is_custom']  = '<button class="btn btn-xs btn-edit btn-success" data-original-title="Edit"><i class="fa fa-pencil"></i></button> ';
		$_POST['is_custom'] .= '<button class="btn btn-xs btn-file btn-success" data-original-title="File"><i class="fa fa-file"></i></button> ';
		$_POST['is_custom'] .= '<button class="btn btn-xs btn-delete btn-danger" data-original-title="Hapus"><i class="fa fa-times"></i></button> ';
		
		if ($action == 'riwayat_pendidikan') {
			$_POST['column'] = array( 'no_ijazah', 'tahun' );
			
			$array = $this->riwayat_pendidikan_model->get_array($_POST);
			$count = $this->riwayat_pendidikan_model->get_count();
		} else if ($action == 'riwayat_mutasi') {
			$_POST['column'] = array( 'no_sk', 'tahun' );
			
			$array = $this->riwayat_mutasi_model->get_array($_POST);
			$count = $this->riwayat_mutasi_model->get_count();
		} else if ($action == 'riwayat_diklat') {
			$_POST['column'] = array( 'no_sertifikat', 'tahun' );
			
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