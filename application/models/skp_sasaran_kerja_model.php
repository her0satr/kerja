<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class skp_sasaran_kerja_model extends CI_Model {
    function __construct() {
        parent::__construct();
		
        $this->field = array(
			'id', 'biodata_id', 'jenis_skp_id', 'tahun', 'ak', 'kuant_nilai', 'kual', 'waktu_nilai', 'waktu_satuan', 'biaya'
		);
    }
	
    function update($param) {
        $result = array();
       
        if (empty($param['id'])) {
            $insert_query  = GenerateInsertQuery($this->field, $param, SKP_SASARAN_KERJA);
            $insert_result = mysql_query($insert_query) or die(mysql_error());
           
            $result['id'] = mysql_insert_id();
            $result['status'] = '1';
            $result['message'] = 'Data berhasil disimpan.';
        } else {
            $update_query  = GenerateUpdateQuery($this->field, $param, SKP_SASARAN_KERJA);
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
				SELECT skp_sasaran_kerja.*
				FROM ".SKP_SASARAN_KERJA." skp_sasaran_kerja
				WHERE skp_sasaran_kerja.id = '".$param['id']."'
				LIMIT 1
			";
		} else if (isset($param['biodata_id']) && isset($param['tahun'])) {
			$select_query  = "
				SELECT skp_sasaran_kerja.*
				FROM ".SKP_SASARAN_KERJA." skp_sasaran_kerja
				WHERE
					skp_sasaran_kerja.tahun = '".$param['tahun']."'
					AND skp_sasaran_kerja.biodata_id = '".$param['biodata_id']."'
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
		
		$param['field_replace']['jenis_skp_title'] = 'jenis_skp.title';
		
		$string_tahun = (isset($param['tahun'])) ? "AND skp_sasaran_kerja.tahun = '".$param['tahun']."'" : '';
		$string_biodata = (isset($param['biodata_id'])) ? "AND skp_sasaran_kerja.biodata_id = '".$param['biodata_id']."'" : '';
		$string_filter = GetStringFilter($param, @$param['column']);
		$string_sorting = GetStringSorting($param, @$param['column'], 'tahun ASC');
		$string_limit = GetStringLimit($param);
		
		$select_query = "
			SELECT SQL_CALC_FOUND_ROWS skp_sasaran_kerja.*,
				jenis_skp.title jenis_skp_title, jenis_skp.satuan jenis_skp_satuan
			FROM ".SKP_SASARAN_KERJA." skp_sasaran_kerja
			LEFT JOIN ".JENIS_SKP." jenis_skp ON jenis_skp.id = skp_sasaran_kerja.jenis_skp_id
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
		$delete_query  = "DELETE FROM ".SKP_SASARAN_KERJA." WHERE id = '".$param['id']."' LIMIT 1";
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