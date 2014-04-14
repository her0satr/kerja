<?php

class restore extends SYGAAS_Controller {
	function __construct() {
		parent::__construct();
	}
	
	function index() {
		$this->load->view( 'master/restore');
	}
	
	function action() {
		$action = (isset($_POST['action'])) ? $_POST['action'] : '';
		unset($_POST['action']);
		
		$result = array();
		if ($action == 'execute_restore') {
			$file_restore_path = $this->config->item('base_path').'/static/upload/'.$_POST['file_restore'];
			$array_record = file($file_restore_path);
			
			// check file restore
			if (trim($array_record[0]) != '-- MySql Data Dump') {
				$result['status'] = '0';
				$result['message'] = 'File restore tidak sesuai dengan hasil export.';
				echo json_encode($result);
				exit;
			}
			
			// restore
			$table_current = '';
			foreach ($array_record as $key => $query) {
				// check query
				$check_query = substr($query, 0, 6);
				if ($check_query != 'INSERT') {
					continue;
				}
				
				// clean table
				preg_match('/INTO ([a-z0-9\_]+) VALUES/i', $query, $match);
				if ($match[1] != $table_current) {
					$table_current = $match[1];
					
					// truncate
					$truncate_query  = "TRUNCATE $table_current";
					$truncate_result = mysql_query($truncate_query) or die(mysql_error());
				}
				
				// insert record
				$insert_query  = $query;
				$insert_result = mysql_query($insert_query) or die(mysql_error());
			}
			
			// set result
            $result['status'] = '1';
            $result['message'] = 'Database berhasil di restore.';
		}
		
		echo json_encode($result);
	}
}