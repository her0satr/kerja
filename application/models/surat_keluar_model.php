<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class surat_keluar_model extends CI_Model {
    function __construct() {
        parent::__construct();
		
        $this->field = array(
			'id', 'no_urut', 'index_surat_id', 'no_surat', 'pengolah', 'tujuan', 'tanggal_surat', 'lampiran', 'perihal', 'catatan', 'file_surat', 'create_time'
		);
    }

    function update($param) {
        $result = array();
       
        if (empty($param['id'])) {
            $insert_query  = GenerateInsertQuery($this->field, $param, SURAT_KELUAR);
            $insert_result = mysql_query($insert_query) or die(mysql_error());
           
            $result['id'] = mysql_insert_id();
            $result['status'] = '1';
            $result['message'] = 'Data berhasil disimpan.';
        } else {
            $update_query  = GenerateUpdateQuery($this->field, $param, SURAT_KELUAR);
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
				SELECT surat_keluar.*,
					index_surat.code index_surat_code, index_surat.title index_surat_title
				FROM ".SURAT_KELUAR." surat_keluar
				LEFT JOIN ".INDEX_SURAT." index_surat ON index_surat.id = surat_keluar.index_surat_id
				WHERE surat_keluar.id = '".$param['id']."'
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
		
		$string_date_start = (isset($param['date_start'])) ? "AND surat_keluar.tanggal_surat >= '".$param['date_start']."'" : '';
		$string_date_end = (isset($param['date_end'])) ? "AND surat_keluar.tanggal_surat <= '".$param['date_end']."'" : '';
		$string_year = (isset($param['year'])) ? "AND YEAR(surat_keluar.tanggal_surat) = '".$param['year']."'" : '';
		$string_month = (isset($param['month'])) ? "AND MONTH(surat_keluar.tanggal_surat) = '".$param['month']."'" : '';
		$string_filter = GetStringFilter($param, @$param['column']);
		$string_sorting = GetStringSorting($param, @$param['column'], 'no_urut ASC');
		$string_limit = GetStringLimit($param);
		
		$select_query = "
			SELECT SQL_CALC_FOUND_ROWS surat_keluar.*
			FROM ".SURAT_KELUAR." surat_keluar
			WHERE 1 $string_date_start $string_date_end
				$string_year $string_month $string_filter
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
			$select_query = "SELECT COUNT(*) TotalRecord FROM ".SURAT_KELUAR;
		} else {
			$select_query = "SELECT FOUND_ROWS() TotalRecord";
		}
		
		$select_result = mysql_query($select_query) or die(mysql_error());
		$row = mysql_fetch_assoc($select_result);
		$TotalRecord = $row['TotalRecord'];
		
		return $TotalRecord;
    }
	
    function get_next_no($param = array()) {
        $result = array( 'status' => true, 'next_no' => 1 );
		
		$select_query  = "
			SELECT MAX(no_urut) next_no
			FROM ".SURAT_KELUAR." surat_keluar
			WHERE YEAR(create_time) = '".$this->config->item('current_year')."'
		";
        $select_result = mysql_query($select_query) or die(mysql_error());
        if (false !== $row = mysql_fetch_assoc($select_result)) {
			$result['next_no'] = $row['next_no'] + 1;
        }
		
        return $result;
    }
	
	function get_select_monthly($param = array()) {
		// prepare result
		$result = array( );
		for ($i = 1; $i <= 31; $i++) {
			$result[$i] = array( 'date' => $i, 'total' => 0 );
		}
		
		// get value
		$select_query = "
			SELECT DAY(surat_keluar.tanggal_surat) tanggal, COUNT(*) total
			FROM ".SURAT_KELUAR." surat_keluar
			WHERE
				MONTH(surat_keluar.tanggal_surat) = '".$param['month']."'
				AND YEAR(surat_keluar.tanggal_surat) = '".$param['year']."'
			GROUP BY tanggal
			LIMIT 50
		";
		$select_result = mysql_query($select_query) or die(mysql_error());
		while (false !== $row = mysql_fetch_assoc($select_result)) {
			$result[$row['tanggal']]['total'] = $row['total'];
		}
		
		// fix data
		$result_temp = $result;
		$result = array();
		foreach ($result_temp as $row) {
			$result[] = $row;
		}
		
		return $result;
	}
	
	function get_select_yearly($param = array()) {
		// prepare result
		$result = array( );
		for ($i = 1; $i <= 12; $i++) {
			$result[$i] = array(
				'month_no' => $i,
				'total' => 0,
				'label' => GetFormatDate($param['year'].'-'.$i.'-01', array( 'FormatDate' => 'F', 'replace_indo' => true ))
			);
		}
		
		// get value
		$select_query = "
			SELECT MONTH(surat_keluar.tanggal_surat) month, COUNT(*) total
			FROM ".SURAT_KELUAR." surat_keluar
			WHERE YEAR(surat_keluar.tanggal_surat) = '".$param['year']."'
			GROUP BY month
		";
		$select_result = mysql_query($select_query) or die(mysql_error());
		while (false !== $row = mysql_fetch_assoc($select_result)) {
			$result[$row['month']]['total'] = $row['total'];
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
			SELECT 'Surat Keluar' label, COUNT(*) total
			FROM ".SURAT_KELUAR." surat_keluar
			WHERE
				surat_keluar.tanggal_surat >= '".$param['date_start']."'
				AND surat_keluar.tanggal_surat <= '".$param['date_end']."'
		";
        $select_result = mysql_query($select_query) or die(mysql_error());
		while ( $row = mysql_fetch_assoc( $select_result ) ) {
			$array[] = $row;
		}
		
        return $array;
	}
	
    function delete($param) {
		$delete_query  = "DELETE FROM ".SURAT_KELUAR." WHERE id = '".$param['id']."' LIMIT 1";
		$delete_result = mysql_query($delete_query) or die(mysql_error());
		
		$result['status'] = '1';
		$result['message'] = 'Data berhasil dihapus.';

        return $result;
    }
	
	function sync($row, $param = array()) {
		$row = StripArray($row, array( 'tanggal_surat' ));
		
		// link
		if (isset($row['id'])) {
			$row['link_print'] = base_url('surat/surat_keluar/home/cetak/?id='.$row['id']);
		}
		
		if (count(@$param['column']) > 0) {
			$row = dt_view_set($row, $param);
		}
		
		return $row;
	}
}