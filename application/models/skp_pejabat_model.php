<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class skp_pejabat_model extends CI_Model {
    function __construct() {
        parent::__construct();
		
        $this->field = array(
			'id', 'biodata_id', 'pangkat_id', 'tahun', 'posisi', 'nama', 'nip', 'jabatan', 'unit_kerja'
		);
    }

    function update($param) {
        $result = array();
       
        if (empty($param['id'])) {
            $insert_query  = GenerateInsertQuery($this->field, $param, SKP_PEJABAT);
            $insert_result = mysql_query($insert_query) or die(mysql_error());
           
            $result['id'] = mysql_insert_id();
            $result['status'] = '1';
            $result['message'] = 'Data berhasil disimpan.';
        } else {
            $update_query  = GenerateUpdateQuery($this->field, $param, SKP_PEJABAT);
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
				SELECT skp_pejabat.*
				FROM ".SKP_PEJABAT." skp_pejabat
				WHERE skp_pejabat.id = '".$param['id']."'
				LIMIT 1
			";
		} else if (isset($param['biodata_id']) && isset($param['tahun']) && isset($param['posisi'])) {
			$select_query  = "
				SELECT skp_pejabat.*, pangkat.golongan, pangkat.ruang
				FROM ".SKP_PEJABAT." skp_pejabat
				LEFT JOIN ".PANGKAT." pangkat ON pangkat.id = skp_pejabat.pangkat_id
				WHERE
					skp_pejabat.tahun = '".$param['tahun']."'
					AND skp_pejabat.posisi = '".$param['posisi']."'
					AND skp_pejabat.biodata_id = '".$param['biodata_id']."'
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
		
		$string_tahun = (isset($param['tahun'])) ? "AND skp_pejabat.tahun = '".$param['tahun']."'" : '';
		$string_biodata = (isset($param['biodata_id'])) ? "AND skp_pejabat.biodata_id = '".$param['biodata_id']."'" : '';
		$string_filter = GetStringFilter($param, @$param['column']);
		$string_sorting = GetStringSorting($param, @$param['column'], 'tahun ASC');
		$string_limit = GetStringLimit($param);
		
		$select_query = "
			SELECT SQL_CALC_FOUND_ROWS skp_pejabat.*
			FROM ".SKP_PEJABAT." skp_pejabat
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
		$delete_query  = "DELETE FROM ".SKP_PEJABAT." WHERE id = '".$param['id']."' LIMIT 1";
		$delete_result = mysql_query($delete_query) or die(mysql_error());
		
		$result['status'] = '1';
		$result['message'] = 'Data berhasil dihapus.';

        return $result;
    }
	
	function sync($row, $param = array()) {
		$row = StripArray($row);
		
		// golongan ruang
		$row['golongan_ruang_text'] = '';
		if (!empty($row['golongan']) && !empty($row['ruang'])) {
			$row['golongan_ruang_text'] = $row['golongan'].' / '.$row['ruang'];
		}
		
		if (count(@$param['column']) > 0) {
			$row = dt_view_set($row, $param);
		}
		
		return $row;
	}
}