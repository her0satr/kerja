<?php

class agenda extends CI_Controller {
	function __construct() {
		parent::__construct();
	}
	
	function index() {
		$this->load->view( 'rekap/agenda');
	}
}