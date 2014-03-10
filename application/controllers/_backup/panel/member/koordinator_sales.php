<?php

class koordinator_sales extends DEALER_Controller {
	function __construct() {
		parent::__construct();
	}
	
	function index() {
		$this->load->view( 'panel/member/koordinator_sales');
	}
}