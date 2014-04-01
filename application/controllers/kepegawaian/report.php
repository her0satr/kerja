<?php

class report extends SYGAAS_Controller {
	function __construct() {
		parent::__construct();
	}
	
	function index() {
		$this->load->view( 'kepegawaian/report');
	}
	
	function download($report_name = '') {
		$content = '';
		if (in_array($report_name, array( 'buku_1.doc', 'buku_2.doc', 'buku_3.doc', 'buku_4.doc', 'buku_5.doc', 'buku_6.doc' ))) {
			$template_name = preg_replace('/\.doc/i', '', $report_name);
			$content = $this->load->view( 'kepegawaian/template/'.$template_name, array(), true );
		} else {
			echo "error request.";
			exit;
		}
		
		header("Content-type: application/vnd.ms-word");
		header("Content-Disposition: attachment;Filename=".$report_name);
		echo $content;
	}
}