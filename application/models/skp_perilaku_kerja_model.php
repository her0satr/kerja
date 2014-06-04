<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class skp_perilaku_kerja_model extends CI_Model {
    function __construct() {
        parent::__construct();
		
        $this->field = array(
			'id', 'biodata_id', 'perilaku_kerja_id', 'tahun', 'nilai'
		);
    }

    function update($param) {
        $result = array();
       
        if (empty($param['id'])) {
            $insert_query  = GenerateInsertQuery($this->field, $param, SKP_PERILAKU_KERJA);
            $insert_result = mysql_query($insert_query) or die(mysql_error());
           
            $result['id'] = mysql_insert_id();
            $result['status'] = '1';
            $result['message'] = 'Data berhasil disimpan.';
        } else {
            $update_query  = GenerateUpdateQuery($this->field, $param, SKP_PERILAKU_KERJA);
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
				SELECT skp_perilaku_kerja.*
				FROM ".SKP_PERILAKU_KERJA." skp_perilaku_kerja
				WHERE skp_perilaku_kerja.id = '".$param['id']."'
				LIMIT 1
			";
		} else if (isset($param['biodata_id']) && isset($param['tahun'])) {
			$select_query  = "
				SELECT skp_perilaku_kerja.*
				FROM ".SKP_PERILAKU_KERJA." skp_perilaku_kerja
				WHERE
					skp_perilaku_kerja.tahun = '".$param['tahun']."'
					AND skp_perilaku_kerja.biodata_id = '".$param['biodata_id']."'
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
		
		$param['field_replace']['perilaku_kerja_title'] = 'perilaku_kerja.title';
		
		$string_tahun = (isset($param['tahun'])) ? "AND skp_perilaku_kerja.tahun = '".$param['tahun']."'" : '';
		$string_biodata = (isset($param['biodata_id'])) ? "AND skp_perilaku_kerja.biodata_id = '".$param['biodata_id']."'" : '';
		$string_filter = GetStringFilter($param, @$param['column']);
//		$string_sorting = GetStringSorting($param, @$param['column'], 'no_urut ASC');
		$string_sorting = 'no_urut ASC';
		$string_limit = GetStringLimit($param);
		
		$select_query = "
			SELECT SQL_CALC_FOUND_ROWS skp_perilaku_kerja.*,
				perilaku_kerja.title perilaku_kerja_title
			FROM ".SKP_PERILAKU_KERJA." skp_perilaku_kerja
			LEFT JOIN ".PERILAKU_KERJA." perilaku_kerja ON perilaku_kerja.id = skp_perilaku_kerja.perilaku_kerja_id
			WHERE 1 $string_tahun $string_biodata $string_filter
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
		$delete_query  = "DELETE FROM ".SKP_PERILAKU_KERJA." WHERE id = '".$param['id']."' LIMIT 1";
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
	
	function get_average_nilai($param = array()) {
		$array = $this->get_array($param);
		
		// get average
		$total = 0;
		foreach ($array as $key => $row) {
			$total += $row['nilai'];
		}
		$result = (count($array) == 0) ? 0 : $total / count($array);
		$result = number_format($result, 2, ',', '.');
		
		return $result;
	}
}