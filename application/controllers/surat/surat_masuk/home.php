<?php

class home extends SYGAAS_Controller {
	function __construct() {
		parent::__construct();
	}
	
	function index() {
		$this->load->view( 'surat/surat_masuk/home');
	}
	
	function grid() {
		$action = (isset($_POST['action'])) ? $_POST['action'] : '';
		unset($_POST['action']);
		
		$grid = array();
		if ($action == 'surat_masuk') {
			$_POST['column'] = array( 'no_surat', 'perihal', 'tanggal_surat' );
			
			// button
			$_POST['is_custom']  = '<button class="btn btn-xs btn-edit btn-success" data-original-title="Edit"><i class="fa fa-pencil"></i></button> ';
			$_POST['is_custom'] .= '<button class="btn btn-xs btn-disposisi btn-success" data-original-title="Disposisi"><i class="fa fa-book"></i></button> ';
			$_POST['is_custom'] .= '<button class="btn btn-xs btn-print btn-success" data-original-title="Print Disposisi"><i class="fa fa-print"></i></button> ';
			$_POST['is_custom'] .= '<button class="btn btn-xs btn-delete btn-danger" data-original-title="Hapus"><i class="fa fa-times"></i></button> ';
			
			$array = $this->surat_masuk_model->get_array($_POST);
			$count = $this->surat_masuk_model->get_count();
			$grid = array( 'sEcho' => $_POST['sEcho'], 'aaData' => $array, 'iTotalRecords' => $count, 'iTotalDisplayRecords' => $count );
		} else if ($action == 'disposisi') {
			$_POST['grid_type'] = 'validation';
			$_POST['column'] = array( 'waktu', 'kepada', 'waktu_text' );
			
			$array = $this->disposisi_model->get_array($_POST);
			$count = $this->disposisi_model->get_count();
			$grid = array( 'sEcho' => $_POST['sEcho'], 'aaData' => $array, 'iTotalRecords' => $count, 'iTotalDisplayRecords' => $count );
		}
		
		echo json_encode($grid);
	}
	
	function action() {
		$action = (isset($_POST['action'])) ? $_POST['action'] : '';
		unset($_POST['action']);
		
		// default data
		$result = array();
		
		// surat masuk
		if ($action == 'update') {
			$result = $this->surat_masuk_model->update($_POST);
			
			// create disposisi info
			if (empty($_POST['id'])) {
				$param_disposisi['id'] = 0;
				$param_disposisi['surat_masuk_id'] = $result['id'];
				$param_disposisi['kepada'] = 'Surat dibuat.';
				$param_disposisi['waktu'] = $_POST['tanggal_terima'];
				$this->disposisi_model->update($param_disposisi);
			}
		} else if ($action == 'get_by_id') {
			$result = $this->surat_masuk_model->get_by_id(array( 'id' => $_POST['id'] ));
		} else if ($action == 'delete') {
			$result = $this->surat_masuk_model->delete($_POST);
		}
		
		// disposisi
		else if ($action == 'disposisi_update') {
			$result = $this->disposisi_model->update($_POST);
		} else if ($action == 'disposisi_validasi') {
			$disposisi_last = $this->disposisi_model->get_last($_POST);
			$time_diff = get_time_diff($disposisi_last['waktu'], $this->config->item('current_datetime'));
			
			$param_update['id'] = $_POST['id'];
			$param_update['waktu'] = $this->config->item('current_datetime');
			$param_update['waktu_diff'] = $time_diff;
			$result = $this->disposisi_model->update($param_update);
		} else if ($action == 'disposisi_get_by_id') {
			$result = $this->disposisi_model->get_by_id(array( 'id' => $_POST['id'] ));
		} else if ($action == 'disposisi_delete') {
			$result = $this->disposisi_model->delete($_POST);
		}
		
		echo json_encode($result);
	}
	
	function disposisi() {
		header("Content-type: application/vnd.ms-word");
		header("Content-Disposition: attachment;Filename=disposisi.doc");
		
		$content = $this->load->view( 'surat/surat_masuk/disposisi', array(), true );
		echo $content;
	}
}