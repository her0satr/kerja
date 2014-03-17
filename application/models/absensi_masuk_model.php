<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class absensi_masuk_model extends CI_Model {
    function __construct() {
        parent::__construct();
		
        $this->field = array(
			'id', 'biodata_id', 'tanggal', 'label', 'waktu_01', 'status_01', 'waktu_02', 'status_02', 'waktu_03', 'status_03', 'waktu_04', 'status_04', 'keterangan'
		);
    }

    function update($param) {
        $result = array();
       
        if (empty($param['id'])) {
            $insert_query  = GenerateInsertQuery($this->field, $param, ABSENSI_MASUK);
            $insert_result = mysql_query($insert_query) or die(mysql_error());
           
            $result['id'] = mysql_insert_id();
            $result['status'] = '1';
            $result['message'] = 'Data berhasil disimpan.';
        } else {
            $update_query  = GenerateUpdateQuery($this->field, $param, ABSENSI_MASUK);
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
				SELECT waktu_masuk.*
				FROM ".ABSENSI_MASUK." waktu_masuk
				WHERE waktu_masuk.id = '".$param['id']."'
				LIMIT 1
			";
		} else if (isset($param['biodata_id']) && isset($param['tanggal'])) {
            $select_query  = "
				SELECT waktu_masuk.*
				FROM ".ABSENSI_MASUK." waktu_masuk
				WHERE
					waktu_masuk.tanggal = '".$param['tanggal']."'
					AND waktu_masuk.biodata_id = '".$param['biodata_id']."'
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
		
		$param['field_replace']['tanggal_text'] = 'waktu_masuk.tanggal';
		
		$string_biodata = (isset($param['biodata_id'])) ? "AND waktu_masuk.biodata_id = '".$param['biodata_id']."'" : '';
		$string_filter = GetStringFilter($param, @$param['column']);
		$string_sorting = GetStringSorting($param, @$param['column'], 'tanggal DESC');
		$string_limit = GetStringLimit($param);
		
		$select_query = "
			SELECT SQL_CALC_FOUND_ROWS waktu_masuk.*, biodata.nama
			FROM ".ABSENSI_MASUK." waktu_masuk
			LEFT JOIN ".BIODATA." biodata ON biodata.id = waktu_masuk.biodata_id
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
			$select_query = "SELECT COUNT(*) TotalRecord FROM ".ABSENSI_MASUK;
		} else {
			$select_query = "SELECT FOUND_ROWS() TotalRecord";
		}
		
		$select_result = mysql_query($select_query) or die(mysql_error());
		$row = mysql_fetch_assoc($select_result);
		$TotalRecord = $row['TotalRecord'];
		
		return $TotalRecord;
    }
	
    function delete($param) {
		$delete_query  = "DELETE FROM ".ABSENSI_MASUK." WHERE id = '".$param['id']."' LIMIT 1";
		$delete_result = mysql_query($delete_query) or die(mysql_error());
		
		$result['status'] = '1';
		$result['message'] = 'Data berhasil dihapus.';

        return $result;
    }
	
	function sync($row, $param = array()) {
		$row = StripArray($row, array( 'waktu_02', 'waktu_03', 'waktu_04' ));
		
		// grid type
		if (isset($param['grid_type']) && $param['grid_type'] == 'absensi_pegawai') {
			if (empty($row['waktu_02'])) {
				$row['waktu_02'] = '<button class="btn btn-xs btn-absensi btn-success" data-absensi="waktu_02" data-original-title="Cek Absen"><i class="fa fa-clock-o"></i></button>';
			}
			if (empty($row['waktu_03'])) {
				$row['waktu_03'] = '<button class="btn btn-xs btn-absensi btn-success" data-absensi="waktu_03" data-original-title="Cek Absen"><i class="fa fa-clock-o"></i></button>';
			}
			if (empty($row['waktu_04'])) {
				$row['waktu_04'] = '<button class="btn btn-xs btn-absensi btn-success" data-absensi="waktu_04" data-original-title="Cek Absen"><i class="fa fa-clock-o"></i></button>';
			}
		}
		
		if (count(@$param['column']) > 0) {
			$row = dt_view_set($row, $param);
		}
		
		return $row;
	}
}