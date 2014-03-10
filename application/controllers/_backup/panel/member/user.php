<?php

class user extends DEALER_Controller {
	function __construct() {
		parent::__construct();
	}
	
	function index() {
		$this->load->view( 'panel/member/user');
	}
	
	function grid() {
		$_POST['is_edit'] = 1;
		$_POST['column'] = array( 'email', 'fullname', 'user_type_name', 'is_active' );
		
		$array = $this->User_model->get_array($_POST);
		$count = $this->User_model->get_count();
		$grid = array( 'sEcho' => $_POST['sEcho'], 'aaData' => $array, 'iTotalRecords' => $count, 'iTotalDisplayRecords' => $count );
		
		echo json_encode($grid);
	}
	
	function action() {
		$action = (isset($_POST['action'])) ? $_POST['action'] : '';
		unset($_POST['action']);
		
		// user
		$user = $this->User_model->get_session();
		
		$result = array();
		if ($action == 'update') {
			if (isset($_POST['passwd']) && empty($_POST['passwd'])) {
				unset($_POST['passwd']);
			} else {
				$_POST['passwd'] = EncriptPassword($_POST['passwd']);
			}
			
			$result = $this->User_model->update($_POST);
			
			// check reload
			if (!empty($_POST['thumbnail']) && $user['id'] == $result['id']) {
				$result['page_reload'] = true;
				
				// set session
				$user = $this->User_model->get_by_id(array( 'id' => $result['id'] ));
				$this->User_model->set_session($user);
			}
		} else if ($action == 'get_by_id') {
			$result = $this->User_model->get_by_id(array( 'id' => $_POST['id'] ));
		} else if ($action == 'delete') {
			$result = $this->User_model->delete($_POST);
		}
		
		echo json_encode($result);
	}
}