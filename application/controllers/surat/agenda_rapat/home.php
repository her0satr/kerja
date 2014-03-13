<?php

class home extends SYGAAS_Controller {
	function __construct() {
		parent::__construct();
	}
	
	function index() {
		$this->load->view( 'surat/agenda_rapat/home');
	}
	
	function grid() {
		$action = (isset($_POST['action'])) ? $_POST['action'] : '';
		unset($_POST['action']);
		
		$grid = array();
		if ($action == 'agenda_rapat') {
			$_POST['column'] = array( 'leading_sektor', 'no_surat', 'tempat', 'tanggal_ajuan' );
			
			// button
			$_POST['is_custom']  = '<button class="btn btn-xs btn-edit btn-success" data-original-title="Edit"><i class="fa fa-pencil"></i></button> ';
			$_POST['is_custom'] .= '<button class="btn btn-xs btn-skpd btn-success" data-original-title="Undangan"><i class="fa fa-book"></i></button> ';
			$_POST['is_custom'] .= '<button class="btn btn-xs btn-delete btn-danger" data-original-title="Hapus"><i class="fa fa-times"></i></button> ';
			
			$array = $this->agenda_rapat_model->get_array($_POST);
			$count = $this->agenda_rapat_model->get_count();
			$grid = array( 'sEcho' => $_POST['sEcho'], 'aaData' => $array, 'iTotalRecords' => $count, 'iTotalDisplayRecords' => $count );
		} else if ($action == 'skpd') {
			$_POST['is_delete'] = 1;
			$_POST['column'] = array( 'title', 'kepala', 'instansi' );
			
			$array = $this->agenda_skpd_model->get_array($_POST);
			$count = $this->agenda_skpd_model->get_count();
			$grid = array( 'sEcho' => $_POST['sEcho'], 'aaData' => $array, 'iTotalRecords' => $count, 'iTotalDisplayRecords' => $count );
		}
		
		echo json_encode($grid);
	}
	
	function action() {
		$action = (isset($_POST['action'])) ? $_POST['action'] : '';
		unset($_POST['action']);
		
		// default data
		$result = array();
		
		// agenda rapat
		if ($action == 'update') {
			$result = $this->agenda_rapat_model->update($_POST);
		} else if ($action == 'get_by_id') {
			$result = $this->agenda_rapat_model->get_by_id(array( 'id' => $_POST['id'] ));
		} else if ($action == 'delete') {
			$result = $this->agenda_rapat_model->delete($_POST);
		}
		
		// skpd
		else if ($action == 'skpd_update') {
			$record = $this->agenda_skpd_model->get_by_id($_POST);
			if (count($record) == 0) {
				$result = $this->agenda_skpd_model->update($_POST);
			} else {
				$result['status'] = '0';
				$result['message'] = 'Data sudah terdaftar.';
			}
		} else if ($action == 'skpd_get_by_id') {
			$result = $this->agenda_skpd_model->get_by_id(array( 'id' => $_POST['id'] ));
		} else if ($action == 'skpd_delete') {
			$result = $this->agenda_skpd_model->delete($_POST);
		}
		
		echo json_encode($result);
	}
}