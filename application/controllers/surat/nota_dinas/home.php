<?php

class home extends SYGAAS_Controller {
	function __construct() {
		parent::__construct();
	}
	
	function index() {
		$this->load->view( 'surat/nota_dinas/home');
	}
	
	function grid() {
		$action = (isset($_POST['action'])) ? $_POST['action'] : '';
		unset($_POST['action']);
		
		$grid = array();
		if ($action == 'nota_dinas') {
			$_POST['column'] = array( 'no_urut', 'no_surat', 'surat_dari', 'perihal', 'tanggal_surat' );
			
			// button
			$_POST['is_custom']  = '<button class="btn btn-xs btn-edit" data-original-title="Edit"><img src="'.base_url('static/img/icons/icon-edit.png').'" /></button> ';
			$_POST['is_custom'] .= '<button class="btn btn-xs btn-disposisi" data-original-title="Disposisi"><img src="'.base_url('static/img/icons/icon-detail.png').'" /></button> ';
			$_POST['is_custom'] .= '<button class="btn btn-xs btn-delete" data-original-title="Hapus"><img src="'.base_url('static/img/icons/icon-delete.png').'" /></button> ';
			
			$array = $this->nota_dinas_model->get_array($_POST);
			$count = $this->nota_dinas_model->get_count();
			$grid = array( 'sEcho' => $_POST['sEcho'], 'aaData' => $array, 'iTotalRecords' => $count, 'iTotalDisplayRecords' => $count );
		} else if ($action == 'nota_dinas_disposisi') {
			$_POST['grid_type'] = 'validation';
			$_POST['column'] = array( 'waktu', 'nota_dinas_kepada_title', 'waktu_text' );
			
			$array = $this->nota_dinas_disposisi_model->get_array($_POST);
			$count = $this->nota_dinas_disposisi_model->get_count();
			$grid = array( 'sEcho' => $_POST['sEcho'], 'aaData' => $array, 'iTotalRecords' => $count, 'iTotalDisplayRecords' => $count );
		}
		
		echo json_encode($grid);
	}
	
	function action() {
		$action = (isset($_POST['action'])) ? $_POST['action'] : '';
		unset($_POST['action']);
		
		// default result
		$result = array();
		
		// nota dinas
		if ($action == 'update') {
			// add create time
			if (empty($_POST['id'])) {
				$_POST['create_time'] = $this->config->item('current_datetime');
			}
			
			// execute
			$result = $this->nota_dinas_model->update($_POST);
			
			// create disposisi info
			if (empty($_POST['id'])) {
				$param_disposisi['id'] = 0;
				$param_disposisi['nota_dinas_id'] = $result['id'];
				$param_disposisi['nota_dinas_kepada_id'] = NOTA_DINAS_CREATED;
				$param_disposisi['waktu'] = $this->config->item('current_datetime');
				$this->nota_dinas_disposisi_model->update($param_disposisi);
			}
		} else if ($action == 'get_by_id') {
			$result = $this->nota_dinas_model->get_by_id(array( 'id' => $_POST['id'] ));
		} else if ($action == 'get_next_no') {
			$result = $this->nota_dinas_model->get_next_no();
		} else if ($action == 'delete') {
			$result = $this->nota_dinas_model->delete($_POST);
		}
		
		// disposisi nota dinas
		else if ($action == 'disposisi_update') {
			$result = $this->nota_dinas_disposisi_model->update($_POST);
		} else if ($action == 'disposisi_validasi') {
			$disposisi_last = $this->nota_dinas_disposisi_model->get_last($_POST);
			$time_diff = get_time_diff($disposisi_last['waktu'], $this->config->item('current_datetime'));
			
			$param_update['id'] = $_POST['id'];
			$param_update['waktu'] = $this->config->item('current_datetime');
			$param_update['waktu_diff'] = $time_diff;
			$result = $this->nota_dinas_disposisi_model->update($param_update);
		} else if ($action == 'disposisi_get_by_id') {
			$result = $this->nota_dinas_disposisi_model->get_by_id(array( 'id' => $_POST['id'] ));
		} else if ($action == 'disposisi_delete') {
			$result = $this->nota_dinas_disposisi_model->delete($_POST);
		}
		
		
		echo json_encode($result);
	}
}