<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class agenda_rapat_model extends CI_Model {
    function __construct() {
        parent::__construct();
		
        $this->field = array(
			'id', 'acara', 'leading_sektor', 'no_surat', 'tempat', 'tanggal_ajuan', 'tanggal_undangan', 'pimpinan_rapat', 'pakaian', 'catatan', 'keterangan', 'rahasia',
			'skpd_id'
		);
    }

    function update($param) {
        $result = array();
       
        if (empty($param['id'])) {
            $insert_query  = GenerateInsertQuery($this->field, $param, AGENDA_RAPAT);
            $insert_result = mysql_query($insert_query) or die(mysql_error());
           
            $result['id'] = mysql_insert_id();
            $result['status'] = '1';
            $result['message'] = 'Data berhasil disimpan.';
        } else {
            $update_query  = GenerateUpdateQuery($this->field, $param, AGENDA_RAPAT);
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
				SELECT agenda_rapat.*
				FROM ".AGENDA_RAPAT." agenda_rapat
				WHERE agenda_rapat.id = '".$param['id']."'
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
		
		$param['field_replace']['tanggal_ajuan_date'] = 'agenda_rapat.tanggal_ajuan';
		$param['field_replace']['tanggal_ajuan_time'] = '';
		
		$string_skpd = (isset($param['skpd_id'])) ? "AND agenda_rapat.skpd_id = '".$param['skpd_id']."'" : '';
		$string_today = (isset($param['today'])) ? "AND agenda_rapat.tanggal_undangan >= DATE('".$param['today']."')" : '';
		$string_rahasia = (isset($param['rahasia'])) ? "AND agenda_rapat.rahasia = '".$param['rahasia']."'" : '';
		$string_date_start = (isset($param['date_start'])) ? "AND agenda_rapat.tanggal_ajuan >= '".$param['date_start']."'" : '';
		$string_date_end = (isset($param['date_start'])) ? "AND agenda_rapat.tanggal_ajuan <= '".$param['date_end']."'" : '';
		$string_year = (isset($param['year'])) ? "AND YEAR(agenda_rapat.tanggal_ajuan) = '".$param['year']."'" : '';
		$string_month = (isset($param['month'])) ? "AND MONTH(agenda_rapat.tanggal_ajuan) = '".$param['month']."'" : '';
		$string_tanggal_ajuan = (isset($param['tanggal_ajuan'])) ? "AND DATE(agenda_rapat.tanggal_ajuan) = '".$param['tanggal_ajuan']."'" : '';
		$string_tanggal_undangan = (isset($param['tanggal_undangan'])) ? "AND DATE(agenda_rapat.tanggal_undangan) = '".$param['tanggal_undangan']."'" : '';
		$string_filter = GetStringFilter($param, @$param['column']);
		$string_sorting = GetStringSorting($param, @$param['column'], 'leading_sektor ASC');
		$string_limit = GetStringLimit($param);
		
		$select_query = "
			SELECT SQL_CALC_FOUND_ROWS agenda_rapat.*
			FROM ".AGENDA_RAPAT." agenda_rapat
			WHERE 1
				$string_skpd $string_rahasia $string_today
				$string_date_start $string_date_end $string_year $string_month $string_tanggal_ajuan $string_tanggal_undangan
				$string_filter
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
			$select_query = "SELECT COUNT(*) TotalRecord FROM ".AGENDA_RAPAT;
		} else {
			$select_query = "SELECT FOUND_ROWS() TotalRecord";
		}
		
		$select_result = mysql_query($select_query) or die(mysql_error());
		$row = mysql_fetch_assoc($select_result);
		$TotalRecord = $row['TotalRecord'];
		
		return $TotalRecord;
    }
	
	function get_select_monthly($param = array()) {
		// prepare result
		$result = array( );
		for ($i = 1; $i <= 31; $i++) {
			$result[$i] = array( 'date' => $i, 'total' => 0 );
		}
		
		// get value
		$select_query = "
			SELECT DAY(agenda_rapat.tanggal_ajuan) tanggal, COUNT(*) total
			FROM ".AGENDA_RAPAT." agenda_rapat
			WHERE
				MONTH(agenda_rapat.tanggal_ajuan) = '".$param['month']."'
				AND YEAR(agenda_rapat.tanggal_ajuan) = '".$param['year']."'
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
			SELECT MONTH(agenda_rapat.tanggal_ajuan) month, COUNT(*) total
			FROM ".AGENDA_RAPAT." agenda_rapat
			WHERE YEAR(agenda_rapat.tanggal_ajuan) = '".$param['year']."'
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
			SELECT 'Agenda Rapat' label, COUNT(*) total
			FROM ".AGENDA_RAPAT." agenda_rapat
			WHERE
				agenda_rapat.tanggal_ajuan >= '".$param['date_start']."'
				AND agenda_rapat.tanggal_ajuan <= '".$param['date_end']."'
		";
        $select_result = mysql_query($select_query) or die(mysql_error());
		while ( $row = mysql_fetch_assoc( $select_result ) ) {
			$array[] = $row;
		}
		
        return $array;
	}
	
    function delete($param) {
		$delete_query  = "DELETE FROM ".AGENDA_RAPAT." WHERE id = '".$param['id']."' LIMIT 1";
		$delete_result = mysql_query($delete_query) or die(mysql_error());
		
		$result['status'] = '1';
		$result['message'] = 'Data berhasil dihapus.';

        return $result;
    }
	
	function sync($row, $param = array()) {
		$row = StripArray($row, array( 'tanggal_ajuan', 'tanggal_undangan' ));
		
		if (isset($row['tanggal_ajuan'])) {
			$array_temp = explode(' ', $row['tanggal_ajuan']);
			$row['tanggal_ajuan_date'] = $array_temp[0];
			$row['tanggal_ajuan_time'] = $array_temp[1];
		}
		if (isset($row['tanggal_undangan'])) {
			$array_temp = explode(' ', $row['tanggal_undangan']);
			$row['tanggal_undangan_date'] = @$array_temp[0];
			$row['tanggal_undangan_time'] = @$array_temp[1];
		}
		
		if (count(@$param['column']) > 0) {
			$row = dt_view_set($row, $param);
		}
		
		return $row;
	}
}