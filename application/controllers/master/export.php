<?php

class export extends SYGAAS_Controller {
	function __construct() {
		parent::__construct();
	}
	
	function index() {
		$file_backup = $this->config->item('base_path') . '/static/_temp/backup.sql';
		$link_bakcup = base_url('static/_temp/backup.sql');
		$this->make_sql_backup($file_backup);
		
		header('Location: '.$link_bakcup);
		exit;
	}
	
	function make_sql_backup($backupFile) {
		$sql = "SHOW TABLES";
		$retval = mysql_query( $sql);
		if(! $retval )
		{
		  die('Could not retrive tables: ' . mysql_error());
		}else{
			while($row = mysql_fetch_array($retval)){
				$tables[] = $row[0];
			}
		}
		$starttime = microtime(true);
		$headers = "-- MySql Data Dump\n\n";
		$headers .= "-- Database : sygaas_db \n\n";
		$headers .= "-- Dumping started at : ". date("Y-m-d-h-i-s") .  "\n\n";

		$outputdata = $lines = '';
		for($t=0;$t<count($tables);$t++){
			$outputdata .= "\n\n-- Dumping data for table : $tables[$t]\n\n";
			$sql = "SELECT * FROM $tables[$t]";
			$result = mysql_query($sql);
			while($row = mysql_fetch_assoc($result)){
				$nor = count($row);
				$datas = array();
				foreach($row as $r){
					$datas[] = $r;
				}
				$lines .= "INSERT INTO $tables[$t] VALUES (";
				for($i=0;$i<$nor;$i++){
					if($datas[$i]===NULL){
						$lines .= "NULL";
					}else if((string)$datas[$i] == "0"){
						$lines .= "0";
					}else if(filter_var($datas[$i],FILTER_VALIDATE_INT) || filter_var($datas[$i],FILTER_VALIDATE_FLOAT)){
						$lines .= $datas[$i];
					}else{
						$lines .= "'" . str_replace("\n","\\n",$datas[$i]) . "'";
					}
					if($i==$nor-1){
						$lines .= ");\n";
					}else{
						$lines .= ",";
					}
				}
				$outputdata .= $lines;
				$lines = "";
			}
		}
		$headers .= "-- Dumping finished at : ". date("Y-m-d-h-i-s") .  "\n\n";
		$endtime = microtime(true);
		$diff = $endtime - $starttime;
		$headers .= "-- Dumping data of sygaas_db took : ". $diff .  " Sec\n\n";
		$headers .= "-- --------------------------------------------------------";
		$datadump = $headers . $outputdata;

		$file = fopen($backupFile,"w");
		$len = fwrite($file,$datadump);
		fclose($file);
		if ($len != 0) {
			return true;
		} else {
			return false;
		}
	}
}