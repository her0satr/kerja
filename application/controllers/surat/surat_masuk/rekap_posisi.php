<?php

class rekap_posisi extends SYGAAS_Controller {
	function __construct() {
		parent::__construct();
	}
	
	function index() {
		$this->load->view( 'surat/surat_masuk/rekap_posisi');
	}
	
	function grid() {
		$_POST['column'] = array( 'no_urut', 'surat_dari', 'no_surat', 'tanggal_terima', 'perihal', 'disposisi', 'detail' );
		$array = $this->surat_masuk_model->get_array_posisi($_POST);
		$count = $this->surat_masuk_model->get_count();
		$grid = array( 'sEcho' => $_POST['sEcho'], 'aaData' => $array, 'iTotalRecords' => $count, 'iTotalDisplayRecords' => $count );
		
		echo json_encode($grid);
	}
}