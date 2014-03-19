<?php

class absensi extends CI_Controller {
	function __construct() {
		parent::__construct();
	}
	
	function index() {
		$this->load->view( 'rekap/absensi');
	}
	
	function grid() {
		$_POST['is_edit'] = 1;
		$_POST['column'] = array( 'no_surat', 'surat_dari', 'perihal', 'tanggal_surat' );
		
		$array = $this->nota_dinas_model->get_array($_POST);
		$count = $this->nota_dinas_model->get_count();
		$grid = array( 'sEcho' => $_POST['sEcho'], 'aaData' => $array, 'iTotalRecords' => $count, 'iTotalDisplayRecords' => $count );
		
		echo json_encode($grid);
	}
}