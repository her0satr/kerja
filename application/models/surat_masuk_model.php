<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class surat_masuk_model extends CI_Model {
    function __construct() {
        parent::__construct();
		
        $this->field = array(
			'id', 'sifat_surat_id', 'sifat_arsip_id', 'no_urut', 'no_surat', 'no_agenda', 'surat_dari', 'perihal', 'tanggal_surat', 'tanggal_terima',
			'catatan', 'file_surat', 'create_time'
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
       
        if (isset($param['no_surat']) && isset($param['surat_dari'])) {
            $select_query  = "
				SELECT surat_masuk.*
				FROM ".SURAT_MASUK." surat_masuk
				WHERE
					surat_masuk.no_surat = '".$param['no_surat']."'
					AND surat_masuk.surat_dari = '".$param['surat_dari']."'
				LIMIT 1
			";
        } else if (isset($param['id'])) {
            $select_query  = "
				SELECT surat_masuk.*, sifat_surat.title sifat_surat_title
				FROM ".SURAT_MASUK." surat_masuk
				LEFT JOIN ".SIFAT_SURAT." sifat_surat ON sifat_surat.id = surat_masuk.sifat_surat_id
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
		
		$string_date_start = (isset($param['date_start'])) ? "AND surat_masuk.tanggal_terima >= '".$param['date_start']."'" : '';
		$string_date_end = (isset($param['date_end'])) ? "AND surat_masuk.tanggal_terima <= '".$param['date_end']."'" : '';
		$string_year = (isset($param['year'])) ? "AND YEAR(surat_masuk.tanggal_terima) = '".$param['year']."'" : '';
		$string_month = (isset($param['month'])) ? "AND MONTH(surat_masuk.tanggal_terima) = '".$param['month']."'" : '';
		$string_filter = GetStringFilter($param, @$param['column']);
		$string_sorting = GetStringSorting($param, @$param['column'], 'no_urut ASC');
		$string_limit = GetStringLimit($param);
		
		$select_query = "
			SELECT SQL_CALC_FOUND_ROWS surat_masuk.*
			FROM ".SURAT_MASUK." surat_masuk
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
			$select_query = "SELECT COUNT(*) TotalRecord FROM ".SURAT_MASUK;
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
			FROM ".SURAT_MASUK." surat_masuk
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
			SELECT DAY(surat_masuk.tanggal_terima) tanggal, COUNT(*) total
			FROM ".SURAT_MASUK." surat_masuk
			WHERE
				MONTH(surat_masuk.tanggal_terima) = '".$param['month']."'
				AND YEAR(surat_masuk.tanggal_terima) = '".$param['year']."'
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
			SELECT MONTH(surat_masuk.tanggal_terima) month, COUNT(*) total
			FROM ".SURAT_MASUK." surat_masuk
			WHERE YEAR(surat_masuk.tanggal_terima) = '".$param['year']."'
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
		// delete disposisi
		$delete_query  = "DELETE FROM ".DISPOSISI." WHERE surat_masuk_id = '".$param['id']."'";
		$delete_result = mysql_query($delete_query) or die(mysql_error());
		
		// delete surat masuk
		$delete_query  = "DELETE FROM ".SURAT_MASUK." WHERE id = '".$param['id']."' LIMIT 1";
		$delete_result = mysql_query($delete_query) or die(mysql_error());
		
		$result['status'] = '1';
		$result['message'] = 'Data berhasil dihapus.';

        return $result;
    }
	
    function get_array_posisi($param = array()) {
        $array = array();
		
		$param['field_replace']['detail'] = '';
		$param['field_replace']['disposisi'] = '';
		
		$string_year = (isset($param['year'])) ? "AND YEAR(surat_masuk.tanggal_terima) = '".$param['year']."'" : '';
		$string_month = (isset($param['month'])) ? "AND MONTH(surat_masuk.tanggal_terima) = '".$param['month']."'" : '';
		$string_date_start = (isset($param['date_start'])) ? "AND surat_masuk.tanggal_terima >= '".$param['date_start']."'" : '';
		$string_date_end = (isset($param['date_end'])) ? "AND surat_masuk.tanggal_terima <= '".$param['date_end']."'" : '';
		$string_filter = GetStringFilter($param, @$param['column']);
		$string_sorting = GetStringSorting($param, @$param['column'], 'surat_masuk.no_urut ASC');
		$string_limit = GetStringLimit($param);
		
		// get surat data
		$select_query = "
			SELECT SQL_CALC_FOUND_ROWS surat_masuk.id, surat_masuk.no_urut, surat_masuk.surat_dari, surat_masuk.no_surat,
				surat_masuk.tanggal_terima, surat_masuk.perihal
			FROM ".SURAT_MASUK." surat_masuk
			WHERE 1
				$string_year $string_month
				$string_date_start $string_date_end
				$string_filter
			ORDER BY $string_sorting
			LIMIT $string_limit
		";
        $select_result = mysql_query($select_query) or die(mysql_error());
		while ( $row = mysql_fetch_assoc( $select_result ) ) {
			$array[] = $row;
		}
		
		// get surat detail
		foreach ($array as $key => $row) {
			// set default data
			$array[$key]['disposisi'] = '-';
			$array[$key]['detail'] = '';
			
			$param_disposisi = array(
				'surat_masuk_id' => $row['id'],
				'sort' => '[{"property":"waktu","direction":"ASC"}]'
			);
			$array_disposisi = $this->disposisi_model->get_array($param_disposisi);
			foreach ($array_disposisi as $disposisi) {
				// get disposisi
				$array[$key]['disposisi'] = $disposisi['surat_destination_title'];
				
				// get detail
				$array[$key]['detail'] .= (empty($array[$key]['detail'])) ?
					$disposisi['surat_destination_title'].' - '.$disposisi['waktu'] :
					'<br />'.$disposisi['surat_destination_title'].' - '.$disposisi['waktu'];
			}
		}
		
		// convert to datatable
		if (isset($param['column'])) {
			$result = array();
			foreach ($array as $row) {
				$result[] = dt_view_set($row, $param);
			}
		} else {
			$result = $array;
		}
		
        return $result;
    }
	
	function sync($row, $param = array()) {
		$row = StripArray($row, array( 'tanggal_surat' ));
		
		// link
		if (isset($row['id'])) {
			$row['link_disposisi'] = base_url('surat/surat_masuk/home/disposisi/?id='.$row['id']);
		}
		
		// tanggal terima
		if (!empty($row['tanggal_terima'])) {
			$array_temp = explode(' ', $row['tanggal_terima']);
			$row['tanggal_terima_date'] = $array_temp[0];
			$row['tanggal_terima_time'] = $array_temp[1];
		}
		
		if (count(@$param['column']) > 0) {
			$row = dt_view_set($row, $param);
		}
		
		return $row;
	}
	
	function get_chart_monthly($param = array()) {
		// prepare result
		$result = array( );
		for ($i = 1; $i <= 31; $i++) {
			$result[$i] = array( 'date' => $i, 'tepat_waktu' => 0, 'terlambat' => 0, 'total' => 0 );
		}
		
		// time info
		$tepat_waktu = 2 * 24 * 60 * 60;
		
		// get value
		$select_query = "
			SELECT DAY(surat_masuk.tanggal_terima) tanggal, surat_masuk.id, surat_masuk.no_surat,
				(	SELECT COUNT(*)
					FROM ".DISPOSISI."
					WHERE
						surat_masuk_id = surat_masuk.id
						AND surat_destination_id != '".SURAT_DESTINATION_CREATED."'
						AND waktu_diff != 0
						AND waktu_diff <= '$tepat_waktu'
				) tepat_waktu,
				(	SELECT COUNT(*)
					FROM ".DISPOSISI."
					WHERE
						surat_masuk_id = surat_masuk.id
						AND surat_destination_id != '".SURAT_DESTINATION_CREATED."'
						AND waktu_diff != 0
						AND waktu_diff > '$tepat_waktu'
				) terlambat
			FROM ".SURAT_MASUK." surat_masuk
			WHERE
				MONTH(surat_masuk.tanggal_terima) = '".$param['month']."'
				AND YEAR(surat_masuk.tanggal_terima) = '".$param['year']."'
			LIMIT 10000
		";
		$select_result = mysql_query($select_query) or die(mysql_error());
		while (false !== $row = mysql_fetch_assoc($select_result)) {
			$result[$row['tanggal']]['terlambat'] += $row['terlambat'];
			$result[$row['tanggal']]['tepat_waktu'] += $row['tepat_waktu'];
			$result[$row['tanggal']]['total'] = $result[$row['tanggal']]['tepat_waktu'] + $result[$row['tanggal']]['terlambat'];
		}
		
		// fix data
		$result_temp = $result;
		$result = array();
		foreach ($result_temp as $row) {
			$result[] = $row;
		}
		
		return $result;
	}
	
	function get_chart_yearly($param = array()) {
		// prepare result
		$result = array( );
		for ($i = 1; $i <= 12; $i++) {
			$result[$i] = array(
				'total' => 0,
				'month_no' => $i,
				'terlambat' => 0,
				'tepat_waktu' => 0,
				'label' => GetFormatDate($param['year'].'-'.$i.'-01', array( 'FormatDate' => 'F', 'replace_indo' => true ))
			);
		}
		
		// time info
		$tepat_waktu = 2 * 24 * 60 * 60;
		
		// get value
		$select_query = "
			SELECT MONTH(surat_masuk.tanggal_terima) month, surat_masuk.id, surat_masuk.no_surat,
				(	SELECT COUNT(*)
					FROM ".DISPOSISI."
					WHERE
						surat_masuk_id = surat_masuk.id
						AND surat_destination_id != '".SURAT_DESTINATION_CREATED."'
						AND waktu_diff != 0
						AND waktu_diff <= '$tepat_waktu'
				) tepat_waktu,
				(	SELECT COUNT(*)
					FROM ".DISPOSISI."
					WHERE
						surat_masuk_id = surat_masuk.id
						AND surat_destination_id != '".SURAT_DESTINATION_CREATED."'
						AND waktu_diff != 0
						AND waktu_diff > '$tepat_waktu'
				) terlambat
			FROM ".SURAT_MASUK." surat_masuk
			WHERE YEAR(surat_masuk.tanggal_terima) = '".$param['year']."'
		";
		$select_result = mysql_query($select_query) or die(mysql_error());
		while (false !== $row = mysql_fetch_assoc($select_result)) {
			$result[$row['month']]['terlambat'] += $row['terlambat'];
			$result[$row['month']]['tepat_waktu'] += $row['tepat_waktu'];
			$result[$row['month']]['total'] = $result[$row['month']]['tepat_waktu'] + $result[$row['month']]['terlambat'];
		}
		
		// fix data
		$result_temp = $result;
		$result = array();
		foreach ($result_temp as $row) {
			$result[] = $row;
		}
		
		return $result;
	}
}