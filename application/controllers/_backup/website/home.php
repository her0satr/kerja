<?php

class home extends DEALER_Controller {
    function __construct() {
        parent::__construct();
    }
    
    function index() {
		$current_page = (!empty($this->uri->segments[1])) ? $this->uri->segments[1] : 'home';
		
		if (in_array($current_page, array( 'sales', 'error', 'schedule' ))) {
			$this->load->view( 'website/'.$current_page );
		} else {
			$this->load->view( 'website/home' );
		}
    }
}