<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class agenda_skpd_model extends CI_Model {
    function __construct() {
        parent::__construct();
		
        $this->field = array( 'id', 'skpd_id', 'agenda_rapat_id' );
    }

    function update($param) {
        $result = array();
       
        if (empty($param['id'])) {
            $insert_query  = GenerateInsertQuery($this->field, $param, AGENDA_SKPD);
            $insert_result = mysql_query($insert_query) or die(mysql_error());
           
            $result['id'] = mysql_insert_id();
            $result['status'] = '1';
            $result['message'] = 'Data berhasil disimpan.';
        } else {
            $update_query  = GenerateUpdateQuery($this->field, $param, AGENDA_SKPD);
            $update_result = mysql_query($update_query) or die(mysql_error());
           
            $result['id'] = $param['id'];
            $result['status'] = '1';
            $result['message'] = 'Data berhasil diperbaharui.';
        }
       
        return $result;
    }

    function get_by_id($param) {
        $array = array();
		
        if (isset($param['skpd_id']) && isset($param['agenda_rapat_id'])) {
            $select_query  = "
				SELECT agenda_skpd.*
				FROM ".AGENDA_SKPD." agenda_skpd
				WHERE
					agenda_skpd.skpd_id = '".$param['skpd_id']."'
					AND agenda_skpd.agenda_rapat_id = '".$param['agenda_rapat_id']."'
				LIMIT 1
			";
        } else if (isset($param['id'])) {
            $select_query  = "
				SELECT agenda_skpd.*
				FROM ".AGENDA_SKPD." agenda_skpd
				WHERE agenda_skpd.id = '".$param['id']."'
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
		
		$string_agenda_rapat = (isset($param['agenda_rapat_id'])) ? "AND agenda_skpd.agenda_rapat_id = '".$param['agenda_rapat_id']."'" : '';
		$string_filter = GetStringFilter($param, @$param['column']);
		$string_sorting = GetStringSorting($param, @$param['column'], 'title ASC');
		$string_limit = GetStringLimit($param);
		
		$select_query = "
			SELECT
				SQL_CALC_FOUND_ROWS agenda_skpd.*,
				skpd.title, skpd.kepala, skpd.instansi, skpd.hp
			FROM ".AGENDA_SKPD." agenda_skpd
			LEFT JOIN ".SKPD." skpd ON skpd.id = agenda_skpd.skpd_id
			WHERE 1 $string_agenda_rapat $string_filter
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
		$select_query = "SELECT FOUND_ROWS() TotalRecord";
		$select_result = mysql_query($select_query) or die(mysql_error());
		$row = mysql_fetch_assoc($select_result);
		$TotalRecord = $row['TotalRecord'];
		
		return $TotalRecord;
    }
	
    function delete($param) {
		$delete_query  = "DELETE FROM ".AGENDA_SKPD." WHERE id = '".$param['id']."' LIMIT 1";
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