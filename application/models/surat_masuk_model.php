<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class surat_masuk_model extends CI_Model {
    function __construct() {
        parent::__construct();
		
        $this->field = array(
			'id', 'sifat_surat_id', 'sifat_arsip_id', 'no_urut', 'no_surat', 'no_agenda', 'surat_dari', 'perihal', 'tanggal_surat', 'tanggal_terima',
			'catatan', 'file_surat'
		);
    }

    function update($param) {
        $result = array();
       
        if (empty($param['id'])) {
            $insert_query  = GenerateInsertQuery($this->field, $param, SURAT_MASUK);
            $insert_result = mysql_query($insert_query) or die(mysql_error());
           
            $result['id'] = mysql_insert_id();
            $result['status'] = '1';
            $result['message'] = 'Data berhasil disimpan.';
        } else {
            $update_query  = GenerateUpdateQuery($this->field, $param, SURAT_MASUK);
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
				SELECT surat_masuk.*
				FROM ".SURAT_MASUK." surat_masuk
				WHERE surat_masuk.id = '".$param['id']."'
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
		$string_sorting = GetStringSorting($param, @$param['column'], 'title ASC');
		$string_limit = GetStringLimit($param);
		
		$select_query = "
			SELECT SQL_CALC_FOUND_ROWS surat_masuk.*
			FROM ".SURAT_MASUK." surat_masuk
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
		if (isset($param['is_query'])) {
			$select_query = "SELECT COUNT(*) TotalRecord FROM ".SURAT_MASUK;
		} else {
			$select_query = "SELECT FOUND_ROWS() TotalRecord";
		}
		
		$select_result = mysql_query($select_query) or die(mysql_error());
		$row = mysql_fetch_assoc($select_result);
		$TotalRecord = $row['TotalRecord'];
		
		return $TotalRecord;
    }
	
	function get_rekap_yearly() {
		// prepare result
		$result = array( );
		for ($i = 12; $i >= 0; $i--) {
			$year_month = date("Y-m", strtotime("-$i Month"));
			$result[$year_month] = array(
				'total' => 0,
				'ym' => $year_month,
				'label' => GetFormatDate($year_month.'-01', array( 'FormatDate' => 'M Y' ))
			);
		}
		
		// get value
		$select_query = "
			SELECT LEFT(tanggal_terima, 7) label, COUNT(*) total
			FROM ".SURAT_MASUK." surat_masuk
			GROUP BY label
		";
		$select_result = mysql_query($select_query) or die(mysql_error());
		while (false !== $row = mysql_fetch_assoc($select_result)) {
			$result[$row['label']]['total'] = $row['total'];
		}
		
		// fix data
		$result_temp = $result;
		$result = array();
		foreach ($result_temp as $row) {
			$result[] = $row;
		}
		
		return $result;
	}
	
	function get_rekap_filter($param = array()) {
		$array = array();
		
		$select_query = "
			SELECT 'Surat Masuk' label, COUNT(*) total
			FROM ".SURAT_MASUK." surat_masuk
			WHERE
				surat_masuk.tanggal_terima >= '".$param['date_start']."'
				AND surat_masuk.tanggal_terima <= '".$param['date_end']."'
		";
        $select_result = mysql_query($select_query) or die(mysql_error());
		while ( $row = mysql_fetch_assoc( $select_result ) ) {
			$array[] = $row;
		}
		
        return $array;
	}
	
    function delete($param) {
		$delete_query  = "DELETE FROM ".SURAT_MASUK." WHERE id = '".$param['id']."' LIMIT 1";
		$delete_result = mysql_query($delete_query) or die(mysql_error());
		
		$result['status'] = '1';
		$result['message'] = 'Data berhasil dihapus.';

        return $result;
    }
	
	function sync($row, $param = array()) {
		$row = StripArray($row, array( 'tanggal_surat' ));
		
		$row['link_disposisi'] = base_url('surat/surat_masuk/home/disposisi/?id='.$row['id']);
		
		if (!empty($row['tanggal_terima'])) {
			$array_temp = explode(' ', $row['tanggal_terima']);
			$row['tanggal_terima_date'] = $array_temp[0];
			$row['tanggal_terima_time'] = substr($array_temp[1], 0, 5);
		}
		
		if (count(@$param['column']) > 0) {
			$row = dt_view_set($row, $param);
		}
		
		return $row;
	}
}