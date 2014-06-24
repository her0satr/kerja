<?php

class biodata extends SYGAAS_Controller {
	function __construct() {
		parent::__construct();
	}
	
	function index() {
		$user = $this->user_model->get_session();
		
		if ($user['user_type_id'] == USER_ID_PEGAWAI) {
			$this->load->view( 'kepegawaian/biodata_detail');
		} else {
			$this->load->view( 'kepegawaian/biodata');
		}
	}
	
	function grid() {
		$_POST['grid_type'] = 'biodata_view';
		$_POST['column'] = array( 'nama', 'nip', 'skpd_title', 'tanggal_lahir_text', 'tempat_lahir' );
		
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
		
		// create login
		else if ($action == 'create_login') {
			$user_check = $this->user_biodata_model->get_by_id(array( 'biodata_id' => $_POST['id'] ));
			if (count($user_check) > 0) {
				$result['status'] = '0';
				$result['message'] = 'User yang bersangkutan sudah memiliki user.';
			} else if (empty($_POST['nip'])) {
				$result['status'] = '0';
				$result['message'] = 'User belum memiliki NIP.';
			} else {
				// create user
				$param_user = array(
					'id' => 0,
					'user_type_id' => USER_ID_PEGAWAI,
					'email' => $_POST['nip'],
					'fullname' => $_POST['nama'],
					'passwd' => EncriptPassword($_POST['nip']),
					'is_active' => 1
				);
				$result_user = $this->user_model->update($param_user);
				
				// create user biodata
				$param_user_biodata = array(
					'user_id' => $result_user['id'],
					'biodata_id' => $_POST['id'],
				);
				$result = $this->user_biodata_model->update($param_user_biodata);
			}
		}
		
		// update detail biodata
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
	
	function biography($id = 0) {
		header("Content-type: application/vnd.ms-word");
		header("Content-Disposition: attachment;Filename=biography.doc");
		
		$template = $this->load->view( 'kepegawaian/biography', array( ), true );
		echo $template;
	}
}