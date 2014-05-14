<?php

class rekap_agenda extends SYGAAS_Controller {
	function __construct() {
		parent::__construct();
	}
	
	function index() {
		$this->load->view( 'kepegawaian/skp/rekap_agenda');
	}
	
	function download() {
		header("Content-type: application/vnd.ms-word");
		header("Content-Disposition: attachment;Filename=kegiatan_harian.doc");
		
		$content = $this->load->view( 'kepegawaian/skp/rekap_kegiatan', array(), true );
		echo $content;
	}
}