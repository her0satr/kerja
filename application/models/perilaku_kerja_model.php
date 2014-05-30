<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class perilaku_kerja_model extends CI_Model {
    function __construct() {
        parent::__construct();
		
        $this->field = array( 'id', 'title', 'no_urut' );
    }

    function update($param) {
        $result = array();
       
        if (empty($param['id'])) {
            $insert_query  = GenerateInsertQuery($this->field, $param, PERILAKU_KERJA);
            $insert_result = mysql_query($insert_query) or die(mysql_error());
           
            $result['id'] = mysql_insert_id();
            $result['status'] = '1';
            $result['message'] = 'Data berhasil disimpan.';
        } else {
            $update_query  = GenerateUpdateQuery($this->field, $param, PERILAKU_KERJA);
            $update_result = mysql_query($update_query) or die(mysql_error());
           
            $result['id'] = $param['id'];
            $result['status'] = '1';
            $result['message'] = 'Data berhasil diperbaharui.';
        }
       
        return $result;
    }

    function get_by_id($param) {
        $array = array();
       
        if (isset($param['id'])) {
            $select_query  = "
				SELECT perilaku_kerja.*
				FROM ".PERILAKU_KERJA." perilaku_kerja
				WHERE perilaku_kerja.id = '".$param['id']."'
				LIMIT 1
			";
		}
		
        $select_result = mysql_query($select_query) or die(mysql_error());
        if (false !== $row = mysql_fetch_assoc($select_result)) {
            $array = $this->sync($row);
        }
       
        return $array;
    }
	
    function get_array($param = array()) {
        $array = array();
		
		$string_filter = GetStringFilter($param, @$param['column']);
		$string_sorting = GetStringSorting($param, @$param['column'], 'no_urut ASC');
		$string_limit = GetStringLimit($param);
		
		$select_query = "
			SELECT SQL_CALC_FOUND_ROWS perilaku_kerja.*
			FROM ".PERILAKU_KERJA." perilaku_kerja
			WHERE 1 $string_filter
			ORDER BY $string_sorting
			LIMIT $string_limit
		";
        $select_result = mysql_query($select_query) or die(mysql_error());
		while ( $row = mysql_fetch_assoc( $select_result ) ) {
			$array[] = $this->sync($row, $param);
		}
		
        return $array;
    }

    function get_count($param = array()) {
		$select_query = "SELECT FOUND_ROWS() total";
		$select_result = mysql_query($select_query) or die(mysql_error());
		$row = mysql_fetch_assoc($select_result);
		$total = $row['total'];
		
		return $total;
    }
	
    function delete($param) {
        $record_count = 0;
        $select_query = array();
        if (isset($param['id'])) {
            $select_query[] = "SELECT COUNT(*) total FROM ".SKP_PERILAKU_KERJA." WHERE perilaku_kerja_id = '".$param['id']."'";
        }
        foreach ($select_query as $query) {
            $select_result = mysql_query($query) or die(mysql_error());
            if (false !== $Row = mysql_fetch_assoc($select_result)) {
                $record_count += $Row['total'];
            }
        }
		if ($record_count > 0) {
            $result['status'] = '0';
            $result['message'] = 'Data tidak bisa dihapus karena sudah terpakai.';
			return $result;
		}
		
		$delete_query  = "DELETE FROM ".PERILAKU_KERJA." WHERE id = '".$param['id']."' LIMIT 1";
		$delete_result = mysql_query($delete_query) or die(mysql_error());
		
		$result['status'] = '1';
		$result['message'] = 'Data berhasil dihapus.';

        return $result;
    }
	
	function sync($row, $param = array()) {
		$row = StripArray($row);
		
		if (count(@$param['column']) > 0) {
			$row = dt_view_set($row, $param);
		}
		
		return $row;
	}
}