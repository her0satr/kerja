<?php

class home extends CI_Controller {
	function __construct() {
		parent::__construct();
	}
	
	function index() {
		$is_login = $this->user_model->is_login();
		
		if ($is_login) {
			$this->load->view( 'dashboard');
		} else {
			$this->load->view( 'login');
		}
	}
	
	function action() {
		$user = $this->user_model->get_by_id(array( 'email' => $_POST['email'] ));
		
		$result = array( 'success' => false, 'message' => '' );
		if (count($user) == 0) {
			$result['message'] = 'Maaf, user anda tidak ditemukan';
		} else if ($user['is_active'] == 0) {
			$result['message'] = 'Maaf, user anda tidak aktif';
		} else if ($user['passwd'] == EncriptPassword($_POST['passwd'])) {
			$result['success'] = true;
			$this->user_model->set_session($user);
		} else {
			$result['message'] = 'Maaf, passsword Anda tidak sesuai.';
		}
		
		echo json_encode($result);
		exit;
	}
	
	function logout() {
		$this->user_model->del_session();
		header("Location: ".base_url());
		exit;
	}
}