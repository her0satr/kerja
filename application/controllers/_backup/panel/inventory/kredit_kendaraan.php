<?php

class kredit_kendaraan extends DEALER_Controller {
	function __construct() {
		parent::__construct();
	}
	
	function index() {
		$this->load->view( 'panel/inventory/kredit_kendaraan');
	}
	
	function grid() {
		$user = $this->User_model->get_session();
		
		$_POST['kredit_penjualan_grid'] = 1;
		$_POST['user_type_id'] = $user['user_type_id'];
		$_POST['column'] = array( 'sales_name', 'jenis_unit_text', 'name', 'order_date_swap', 'status_penjualan_name' );
		
		// additional filter for sales
		if ($user['user_type_id'] == USER_ID_SALES) {
			$_POST['sales_id'] = $user['id'];
		}
		
		$array = $this->Penjualan_model->get_array($_POST);
		$count = $this->Penjualan_model->get_count();
		$grid = array( 'sEcho' => $_POST['sEcho'], 'aaData' => $array, 'iTotalRecords' => $count, 'iTotalDisplayRecords' => $count );
		
		echo json_encode($grid);
	}
	
	function action() {
		$action = (isset($_POST['action'])) ? $_POST['action'] : '';
		unset($_POST['action']);
		
		$user = $this->User_model->get_session();
		
		$result = array();
		if ($action == 'update') {
			if (empty($_POST['id'])) {
				$_POST['sales_id'] = $user['id'];
				$_POST['status_penjualan_id'] = STATUS_PENJUALAN_PENDING;
				$_POST['order_date'] = $this->config->item('current_date');
			}
			
			$result = $this->Penjualan_model->update($_POST);
		}
		else if ($action == 'update_approve') {
			$result = $this->Penjualan_model->update($_POST);
			
			if ($_POST['with_ktp'] && $_POST['with_gesek'] && $_POST['with_bast']) {
				$penjualan = $this->Penjualan_model->get_by_id(array( 'id' => $_POST['id'] ));
				
				// reduce inventory
				$param_kendaraan['stock_date'] = $penjualan['order_date'];
				$param_kendaraan['stock_update'] = -1;
				$param_kendaraan['penjualan_id'] = $_POST['id'];
				$param_kendaraan['jenis_unit_id'] = $penjualan['jenis_unit_id'];
				$param_kendaraan['jenis_warna_id'] = $penjualan['jenis_warna_id'];
				$result_inventory = $this->Kendaraan_model->update_total($param_kendaraan);
				if ($result_inventory['status'] == false) {
					echo json_encode($result_inventory);
					exit;
				}
				
				// update penjualan
				$param_update['id'] = $_POST['id'];
				$param_update['admin_id'] = $user['id'];
				$param_update['status_penjualan_id'] = STATUS_PENJUALAN_DITERIMA;
				$result = $this->Penjualan_model->update($param_update);
			}
		}
		else if ($action == 'update_delivery') {
			$_POST['user_delivery_id'] = $user['id'];
			$result = $this->Penjualan_model->update($_POST);
		}
		else if ($action == 'get_by_id') {
			$result = $this->Penjualan_model->get_by_id(array( 'id' => $_POST['id'] ));
		}
		else if ($action == 'delete') {
			$result = $this->Penjualan_model->delete($_POST);
		}
		
		echo json_encode($result);
	}
}