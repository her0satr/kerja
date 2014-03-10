<?php

class home extends CI_Controller {
	function __construct() {
		parent::__construct();
	}
	
	function index() {
		$this->load->view( 'panel/login');
	}
	
	function dashboard() {
		$user = $this->User_model->get_session();
		
		if ($user['user_type_id'] == USER_ID_DELIVERY || $user['user_type_id'] == USER_ID_PENAGIHAN) {
			$this->load->view( 'panel/inventory/kredit_kendaraan');
		} else {
			$this->load->view( 'panel/dashboard');
		}
	}
	
	function action() {
		$user = $this->User_model->get_by_id(array( 'email' => $_POST['email'] ));
		
		$result = array( 'success' => false, 'message' => '' );
		if (count($user) == 0) {
			$result['message'] = 'Maaf, user anda tidak ditemukan';
		} else if ($user['is_active'] == 0) {
			$result['message'] = 'Maaf, user anda tidak aktif';
		} else if ($user['passwd'] == EncriptPassword($_POST['passwd'])) {
			$result['success'] = true;
			$this->User_model->set_session($user);
		} else {
			$result['message'] = 'Maaf, passsword Anda tidak sesuai.';
		}
		
		echo json_encode($result);
		exit;
	}
	
	function logout() {
		$this->User_model->del_session();
		header("Location: ".base_url());
		exit;
	}
}