<?php

class home extends SYGAAS_Controller {
	function __construct() {
		parent::__construct();
	}
	
	function index() {
		$this->load->view( 'surat/surat_keluar/home');
	}
	
	function grid() {
		$_POST['column'] = array( 'no_urut', 'no_surat', 'pengolah', 'tujuan', 'tanggal_surat' );
		
		// button
		$_POST['is_custom']  = '<button class="btn btn-xs btn-edit" data-original-title="Edit"><img src="'.base_url('static/img/icons/icon-edit.png').'" /></button> ';
		$_POST['is_custom'] .= '<button class="btn btn-xs btn-print" data-original-title="Print"><img src="'.base_url('static/img/icons/icon-print.png').'" /></button> ';
		$_POST['is_custom'] .= '<button class="btn btn-xs btn-delete" data-original-title="Hapus"><img src="'.base_url('static/img/icons/icon-delete.png').'" /></button> ';
		
		$array = $this->surat_keluar_model->get_array($_POST);
		$count = $this->surat_keluar_model->get_count();
		$grid = array( 'sEcho' => $_POST['sEcho'], 'aaData' => $array, 'iTotalRecords' => $count, 'iTotalDisplayRecords' => $count );
		
		echo json_encode($grid);
	}
	
	function action() {
		$action = (isset($_POST['action'])) ? $_POST['action'] : '';
		unset($_POST['action']);
		
		$result = array();
		if ($action == 'update') {
			$result = $this->surat_keluar_model->update($_POST);
		} else if ($action == 'get_by_id') {
			$result = $this->surat_keluar_model->get_by_id(array( 'id' => $_POST['id'] ));
		} else if ($action == 'get_next_no') {
			$result = $this->surat_keluar_model->get_next_no();
		} else if ($action == 'delete') {
			$result = $this->surat_keluar_model->delete($_POST);
		}
		
		echo json_encode($result);
	}
	
	function cetak() {
		/*   */
		header("Content-type: application/vnd.ms-word");
		header("Content-Disposition: attachment;Filename=surat_keluar.doc");
		/*	*/
		
		$content = $this->load->view( 'surat/surat_keluar/cetak', array(), true );
		echo $content;
	}
}