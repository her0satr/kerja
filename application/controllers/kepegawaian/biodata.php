<?php

class biodata extends SYGAAS_Controller {
	function __construct() {
		parent::__construct();
	}
	
	function index() {
		$this->load->view( 'kepegawaian/biodata');
	}
	
	function grid() {
		$_POST['column'] = array( 'nama', 'nip', 'tanggal_lahir_text', 'tempat_lahir' );
		
		// button
		$_POST['is_custom']  = '<button class="btn btn-xs btn-edit btn-success" data-original-title="Edit"><i class="fa fa-pencil"></i></button> ';
		$_POST['is_custom'] .= '<button class="btn btn-xs btn-detail btn-success" data-original-title="Detail"><i class="fa fa-book"></i></button> ';
		$_POST['is_custom'] .= '<button class="btn btn-xs btn-riwayat btn-success" data-original-title="Riwayat"><i class="fa fa-folder"></i></button> ';
		$_POST['is_custom'] .= '<button class="btn btn-xs btn-delete btn-danger" data-original-title="Hapus"><i class="fa fa-times"></i></button> ';
		
		$array = $this->biodata_model->get_array($_POST);
		$count = $this->biodata_model->get_count();
		$grid = array( 'sEcho' => $_POST['sEcho'], 'aaData' => $array, 'iTotalRecords' => $count, 'iTotalDisplayRecords' => $count );
		
		echo json_encode($grid);
	}
	
	function action() {
		$action = (isset($_POST['action'])) ? $_POST['action'] : '';
		unset($_POST['action']);
		
		$result = array();
		if ($action == 'update') {
			$result = $this->biodata_model->update($_POST);
		} else if ($action == 'get_by_id') {
			$result = $this->biodata_model->get_by_id(array( 'id' => $_POST['id'] ));
		} else if ($action == 'delete') {
			$result = $this->biodata_model->delete($_POST);
		}
		
		else if ($action == 'update_detail') {
			// make sure no record for this biodata
			if (empty($_POST['id'])) {
				$record = $this->biodata_detail_model->get_by_id(array( 'biodata_id' => $_POST['biodata_id'] ));
				if (count($record) > 0) {
					$_POST['id'] = $record['id'];
				}
			}
			
			$result = $this->biodata_detail_model->update($_POST);
		} else if ($action == 'get_biodata_detail_by_id') {
			$result = $this->biodata_detail_model->get_by_id(array( 'biodata_id' => $_POST['id'] ));
			$result['biodata_id'] = $_POST['id'];
		}
		
		echo json_encode($result);
	}
}