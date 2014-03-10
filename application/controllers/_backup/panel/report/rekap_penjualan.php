<?php

class rekap_penjualan extends DEALER_Controller {
	function __construct() {
		parent::__construct();
	}
	
	function index() {
		$this->load->view( 'panel/report/rekap_penjualan');
	}
}