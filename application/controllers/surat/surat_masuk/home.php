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
			$_POST['column'] = array( 'no_urut', 'no_surat', 'perihal', 'tanggal_surat' );
			
			// button
			$_POST['is_custom']  = '<button class="btn btn-xs btn-edit" data-original-title="Edit"><img src="'.base_url('static/img/icons/icon-edit.png').'" /></button> ';
			$_POST['is_custom'] .= '<button class="btn btn-xs btn-disposisi" data-original-title="Disposisi"><img src="'.base_url('static/img/icons/icon-detail.png').'" /></button> ';
			$_POST['is_custom'] .= '<button class="btn btn-xs btn-print" data-original-title="Print Disposisi"><img src="'.base_url('static/img/icons/icon-print.png').'" /></button> ';
			$_POST['is_custom'] .= '<button class="btn btn-xs btn-delete" data-original-title="Hapus"><img src="'.base_url('static/img/icons/icon-delete.png').'" /></button> ';
			
			$array = $this->surat_masuk_model->get_array($_POST);
			$count = $this->surat_masuk_model->get_count();
			$grid = array( 'sEcho' => $_POST['sEcho'], 'aaData' => $array, 'iTotalRecords' => $count, 'iTotalDisplayRecords' => $count );
		} else if ($action == 'disposisi') {
			$_POST['grid_type'] = 'validation';
			$_POST['column'] = array( 'waktu', 'surat_destination_title', 'waktu_text' );
			
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
			// 'no surat' & 'surat dari' must be unique
			if (empty($_POST['id'])) {
				$check = $this->surat_masuk_model->get_by_id(array( 'no_surat' => $_POST['no_surat'], 'surat_dari' => $_POST['surat_dari'] ));
				if (count($check) > 0) {
					$result['status'] = '0';
					$result['message'] = 'No Surat & Surat Dari sudah terpakai, harap memerika data surat sebelumnya.';
					echo json_encode($result);
					exit;
				}
			}
			
			// update
			$result = $this->surat_masuk_model->update($_POST);
			
			// create disposisi info
			if (empty($_POST['id'])) {
				$param_disposisi['id'] = 0;
				$param_disposisi['surat_masuk_id'] = $result['id'];
				$param_disposisi['surat_destination_id'] = SURAT_DESTINATION_CREATED;
				$param_disposisi['waktu'] = $_POST['tanggal_terima'];
				$this->disposisi_model->update($param_disposisi);
			}
		} else if ($action == 'get_by_id') {
			$result = $this->surat_masuk_model->get_by_id(array( 'id' => $_POST['id'] ));
		} else if ($action == 'get_next_no') {
			$result = $this->surat_masuk_model->get_next_no();
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
		
		// kop surat
		else if ($action == 'update_kop_surat') {
			$result = $this->kop_surat_model->update($_POST);
		} else if ($action == 'get_kop_surat') {
			$result = $this->kop_surat_model->get_by_id($_POST);
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