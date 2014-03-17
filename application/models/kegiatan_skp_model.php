<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class kegiatan_skp_model extends CI_Model {
    function __construct() {
        parent::__construct();
		
        $this->field = array(
			'id', 'biodata_id', 'jenis_skp_id', 'kegiatan_lain_id', 'tanggal', 'type_row'
		);
    }

    function update($param) {
        $result = array();
       
        if (empty($param['id'])) {
            $insert_query  = GenerateInsertQuery($this->field, $param, KEGIATAN_SKP);
            $insert_result = mysql_query($insert_query) or die(mysql_error());
           
            $result['id'] = mysql_insert_id();
            $result['status'] = '1';
            $result['message'] = 'Data berhasil disimpan.';
        } else {
            $update_query  = GenerateUpdateQuery($this->field, $param, KEGIATAN_SKP);
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
				SELECT kegiatan_skp.*
				FROM ".KEGIATAN_SKP." kegiatan_skp
				WHERE kegiatan_skp.id = '".$param['id']."'
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
		
		$string_biodata = (isset($param['biodata_id'])) ? "AND kegiatan_skp.biodata_id = '".$param['biodata_id']."'" : '';
		$string_filter = (!empty($param['sSearch'])) ? "AND (jenis_skp.title LIKE '%".$param['sSearch']."%' OR jenis_kegiatan.title LIKE '%".$param['sSearch']."%' OR kegiatan_skp.tanggal LIKE '%".$param['sSearch']."%')" : '';
		$string_sorting = GetStringSorting($param, @$param['column'], 'title ASC');
		$string_limit = GetStringLimit($param);
		
		$select_query = "
			SELECT SQL_CALC_FOUND_ROWS kegiatan_skp.*,
				CASE
					WHEN kegiatan_skp.type_row = '1' THEN jenis_skp.title
					WHEN kegiatan_skp.type_row = '2' THEN jenis_kegiatan.title
					END AS title
			FROM ".KEGIATAN_SKP." kegiatan_skp
			LEFT JOIN ".JENIS_SKP." jenis_skp ON jenis_skp.id = kegiatan_skp.jenis_skp_id
			LEFT JOIN ".JENIS_KEGIATAN." jenis_kegiatan ON jenis_kegiatan.id = kegiatan_skp.kegiatan_lain_id
			WHERE 1 $string_biodata $string_filter
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
		if (isset($param['is_query'])) {
			$select_query = "SELECT COUNT(*) TotalRecord FROM ".KEGIATAN_SKP;
		} else {
			$select_query = "SELECT FOUND_ROWS() TotalRecord";
		}
		
		$select_result = mysql_query($select_query) or die(mysql_error());
		$row = mysql_fetch_assoc($select_result);
		$TotalRecord = $row['TotalRecord'];
		
		return $TotalRecord;
    }
	
    function delete($param) {
		$delete_query  = "DELETE FROM ".KEGIATAN_SKP." WHERE id = '".$param['id']."' LIMIT 1";
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