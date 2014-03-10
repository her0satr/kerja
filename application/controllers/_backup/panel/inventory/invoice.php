<?php

class invoice extends DEALER_Controller {
	function __construct() {
		parent::__construct();
	}
	
	function index() {
		$this->load->view( 'panel/inventory/invoice' );
	}
	
	function grid() {
		$_POST['is_edit'] = 1;
		$_POST['column'] = array( 'no', 'rupiah_angka_format', 'date_print' );
		
		$array = $this->Invoice_model->get_array($_POST);
		$count = $this->Invoice_model->get_count();
		$grid = array( 'sEcho' => $_POST['sEcho'], 'aaData' => $array, 'iTotalRecords' => $count, 'iTotalDisplayRecords' => $count );
		
		echo json_encode($grid);
	}
	
	function action() {
		$action = (isset($_POST['action'])) ? $_POST['action'] : '';
		unset($_POST['action']);
		
		$user = $this->User_model->get_session();
		
		$result = array();
		if ($action == 'update') {
			$param = $_POST;
			if (empty($_POST['id'])) {
				$param['no'] = $this->Invoice_model->get_no();
				$param['penerima'] = $user['id'];
				$param['date_print'] = $this->config->item('current_date');
			}
			
			$result = $this->Invoice_model->update($param);
		} else if ($action == 'get_by_id') {
			$result = $this->Invoice_model->get_by_id(array( 'id' => $_POST['id'] ));
		} else if ($action == 'delete') {
			$result = $this->Invoice_model->delete($_POST);
		}
		
		echo json_encode($result);
	}
	
	function cetak() {
		$this->load->library('mpdf');
		
		$invoice_html = $this->load->view( 'panel/inventory/invoice_cetak', array( ), true );
		$this->mpdf->WriteHTML($invoice_html);
		$this->mpdf->Output();
	}
}