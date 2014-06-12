<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class nota_dinas_model extends CI_Model {
    function __construct() {
        parent::__construct();
		
        $this->field = array(
			'id', 'no_urut', 'no_surat', 'surat_dari', 'disposisi_kepada', 'perihal', 'posisi', 'tanggal_disposisi', 'tanggal_surat', 'tanggal_terima', 'catatan', 'file_surat', 'create_time'
		);
    }

    function update($param) {
        $result = array();
       
        if (empty($param['id'])) {
            $insert_query  = GenerateInsertQuery($this->field, $param, NOTA_DINAS);
            $insert_result = mysql_query($insert_query) or die(mysql_error());
           
            $result['id'] = mysql_insert_id();
            $result['status'] = '1';
            $result['message'] = 'Data berhasil disimpan.';
        } else {
            $update_query  = GenerateUpdateQuery($this->field, $param, NOTA_DINAS);
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
				SELECT nota_dinas.*
				FROM ".NOTA_DINAS." nota_dinas
				WHERE nota_dinas.id = '".$param['id']."'
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
		
		$string_date_start = (isset($param['date_start'])) ? "AND nota_dinas.tanggal_surat >= '".$param['date_start']."'" : '';
		$string_date_end = (isset($param['date_end'])) ? "AND nota_dinas.tanggal_surat <= '".$param['date_end']."'" : '';
		$string_year = (isset($param['year'])) ? "AND YEAR(nota_dinas.tanggal_surat) = '".$param['year']."'" : '';
		$string_month = (isset($param['month'])) ? "AND MONTH(nota_dinas.tanggal_surat) = '".$param['month']."'" : '';
		$string_filter = GetStringFilter($param, @$param['column']);
		$string_sorting = GetStringSorting($param, @$param['column'], 'no_urut ASC');
		$string_limit = GetStringLimit($param);
		
		$select_query = "
			SELECT SQL_CALC_FOUND_ROWS nota_dinas.*
			FROM ".NOTA_DINAS." nota_dinas
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
			$select_query = "SELECT COUNT(*) TotalRecord FROM ".NOTA_DINAS;
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
			FROM ".NOTA_DINAS." nota_dinas
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
			SELECT DAY(nota_dinas.tanggal_surat) tanggal, COUNT(*) total
			FROM ".NOTA_DINAS." nota_dinas
			WHERE
				MONTH(nota_dinas.tanggal_surat) = '".$param['month']."'
				AND YEAR(nota_dinas.tanggal_surat) = '".$param['year']."'
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
			SELECT MONTH(nota_dinas.tanggal_surat) month, COUNT(*) total
			FROM ".NOTA_DINAS." nota_dinas
			WHERE YEAR(nota_dinas.tanggal_surat) = '".$param['year']."'
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
			SELECT 'Nota Dinas' label, COUNT(*) total
			FROM ".NOTA_DINAS." nota_dinas
			WHERE
				nota_dinas.tanggal_surat >= '".$param['date_start']."'
				AND nota_dinas.tanggal_surat <= '".$param['date_end']."'
		";
        $select_result = mysql_query($select_query) or die(mysql_error());
		while ( $row = mysql_fetch_assoc( $select_result ) ) {
			$array[] = $row;
		}
		
        return $array;
	}
	
    function delete($param) {
		$delete_query  = "DELETE FROM ".NOTA_DINAS." WHERE id = '".$param['id']."' LIMIT 1";
		$delete_result = mysql_query($delete_query) or die(mysql_error());
		
		$result['status'] = '1';
		$result['message'] = 'Data berhasil dihapus.';

        return $result;
    }
	
	function sync($row, $param = array()) {
		$row = StripArray($row, array( 'tanggal_terima', 'tanggal_disposisi' ));
		
		if (isset($row['tanggal_terima'])) {
			$array_temp = explode(' ', $row['tanggal_terima']);
			$row['tanggal_terima_date'] = $array_temp[0];
			$row['tanggal_terima_time'] = $array_temp[1];
		}
		
		if (count(@$param['column']) > 0) {
			$row = dt_view_set($row, $param);
		}
		
		return $row;
	}
}