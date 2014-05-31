<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class skp_summary_model extends CI_Model {
    function __construct() {
        parent::__construct();
		
        $this->field = array(
			'id', 'biodata_id', 'tahun', 'tanggal_pembuatan', 'tanggal_penilaian', 'keberatan', 'tanggal_keberatan', 'tanggapan',
			'tanggal_tanggapan', 'keputusan', 'tanggal_keputusan', 'rekomendasi', 'tanggal_dibuat', 'tanggal_diterima_pns',
			'tanggal_diterima_atasan'
		);
    }

    function update($param) {
        $result = array();
       
        if (empty($param['id'])) {
            $insert_query  = GenerateInsertQuery($this->field, $param, SKP_SUMMARY);
            $insert_result = mysql_query($insert_query) or die(mysql_error());
           
            $result['id'] = mysql_insert_id();
            $result['status'] = '1';
            $result['message'] = 'Data berhasil disimpan.';
        } else {
            $update_query  = GenerateUpdateQuery($this->field, $param, SKP_SUMMARY);
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
				SELECT skp_summary.*
				FROM ".SKP_SUMMARY." skp_summary
				WHERE skp_summary.id = '".$param['id']."'
				LIMIT 1
			";
		} else if (isset($param['biodata_id']) && isset($param['tahun'])) {
			$select_query  = "
				SELECT skp_summary.*
				FROM ".SKP_SUMMARY." skp_summary
				WHERE
					skp_summary.tahun = '".$param['tahun']."'
					AND skp_summary.biodata_id = '".$param['biodata_id']."'
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
		
		$param['field_replace']['tanggal_pembuatan_text'] = 'skp_summary.tanggal_pembuatan';
		$param['field_replace']['tanggal_penilaian_text'] = 'skp_summary.tanggal_penilaian';
		
		$string_tahun = (isset($param['tahun'])) ? "AND skp_summary.tahun = '".$param['tahun']."'" : '';
		$string_biodata = (isset($param['biodata_id'])) ? "AND skp_summary.biodata_id = '".$param['biodata_id']."'" : '';
		$string_filter = GetStringFilter($param, @$param['column']);
		$string_sorting = GetStringSorting($param, @$param['column'], 'tahun ASC');
		$string_limit = GetStringLimit($param);
		
		$select_query = "
			SELECT SQL_CALC_FOUND_ROWS skp_summary.*
			FROM ".SKP_SUMMARY." skp_summary
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
		$delete_query  = "DELETE FROM ".SKP_SUMMARY." WHERE id = '".$param['id']."' LIMIT 1";
		$delete_result = mysql_query($delete_query) or die(mysql_error());
		
		$result['status'] = '1';
		$result['message'] = 'Data berhasil dihapus.';

        return $result;
    }
	
	function sync($row, $param = array()) {
		$row = StripArray($row, array('tanggal_pembuatan', 'tanggal_penilaian', 'tanggal_keberatan', 'tanggal_tanggapan', 'tanggal_keputusan', 'tanggal_dibuat', 'tanggal_diterima_pns', 'tanggal_diterima_atasan'));
		
		// tanggal
		if (!empty($row['tanggal_pembuatan'])) {
			$row['tanggal_pembuatan_text'] = GetFormatDate($row['tanggal_pembuatan']);
		}
		if (!empty($row['tanggal_penilaian'])) {
			$row['tanggal_penilaian_text'] = GetFormatDate($row['tanggal_penilaian']);
		}
		if (!empty($row['tanggal_keberatan'])) {
			$row['tanggal_keberatan_text'] = GetFormatDate($row['tanggal_keberatan']);
		}
		if (!empty($row['tanggal_tanggapan'])) {
			$row['tanggal_tanggapan_text'] = GetFormatDate($row['tanggal_tanggapan']);
		}
		if (!empty($row['tanggal_keputusan'])) {
			$row['tanggal_keputusan_text'] = GetFormatDate($row['tanggal_keputusan']);
		}
		if (!empty($row['tanggal_dibuat'])) {
			$row['tanggal_dibuat_text'] = GetFormatDate($row['tanggal_dibuat']);
		}
		if (!empty($row['tanggal_diterima_pns'])) {
			$row['tanggal_diterima_pns_text'] = GetFormatDate($row['tanggal_diterima_pns']);
		}
		if (!empty($row['tanggal_diterima_atasan'])) {
			$row['tanggal_diterima_atasan_text'] = GetFormatDate($row['tanggal_diterima_atasan']);
		}
		
		if (count(@$param['column']) > 0) {
			$row = dt_view_set($row, $param);
		}
		
		return $row;
	}
}