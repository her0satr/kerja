<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class kegiatan_skp_model extends CI_Model {
    function __construct() {
        parent::__construct();
		
        $this->field = array(
			'id', 'biodata_id', 'jenis_skp_id', 'jenis_kegiatan_id', 'no_urut', 'tanggal', 'waktu', 'type_row', 'kendala', 'keterangan'
		);
    }

    function update($param) {
        $result = array();
       
        if (empty($param['id'])) {
            $insert_query  = GenerateInsertQuery($this->field, $param, KEGIATAN_SKP);
            $insert_result = mysql_query($insert_query) or die(mysql_error());
           
            $result['id'] = mysql_insert_id();
            $result['status'] = '1';
            $result['message'] = 'Data berhasil disimpan.';
        } else {
            $update_query  = GenerateUpdateQuery($this->field, $param, KEGIATAN_SKP);
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
				SELECT kegiatan_skp.*, biodata.nama biodata_text
				FROM ".KEGIATAN_SKP." kegiatan_skp
				LEFT JOIN ".BIODATA." biodata ON biodata.id = kegiatan_skp.biodata_id
				WHERE kegiatan_skp.id = '".$param['id']."'
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
		
		$param['field_replace']['biodata_text'] = 'biodata.nama';
		
		$string_tanggal = (isset($param['tanggal'])) ? "AND kegiatan_skp.tanggal = '".$param['tanggal']."'" : '';
		$string_biodata = (isset($param['biodata_id'])) ? "AND kegiatan_skp.biodata_id = '".$param['biodata_id']."'" : '';
		$string_filter = (!empty($param['sSearch'])) ? "AND (jenis_skp.title LIKE '%".$param['sSearch']."%' OR jenis_kegiatan.title LIKE '%".$param['sSearch']."%' OR kegiatan_skp.tanggal LIKE '%".$param['sSearch']."%' OR kegiatan_skp.keterangan LIKE '%".$param['sSearch']."%')" : '';
		$string_sorting = GetStringSorting($param, @$param['column'], 'title ASC');
		$string_limit = GetStringLimit($param);
		
		$select_query = "
			SELECT SQL_CALC_FOUND_ROWS kegiatan_skp.*, biodata.nama biodata_text,
				CASE
					WHEN kegiatan_skp.type_row = '1' THEN jenis_skp.title
					WHEN kegiatan_skp.type_row = '2' THEN jenis_kegiatan.title
				END AS title
			FROM ".KEGIATAN_SKP." kegiatan_skp
			LEFT JOIN ".BIODATA." biodata ON biodata.id = kegiatan_skp.biodata_id
			LEFT JOIN ".JENIS_SKP." jenis_skp ON jenis_skp.id = kegiatan_skp.jenis_skp_id
			LEFT JOIN ".JENIS_KEGIATAN." jenis_kegiatan ON jenis_kegiatan.id = kegiatan_skp.jenis_kegiatan_id
			WHERE 1 $string_tanggal $string_biodata $string_filter
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
			$select_query = "SELECT COUNT(*) TotalRecord FROM ".KEGIATAN_SKP;
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
			FROM ".KEGIATAN_SKP." kegiatan_skp
			WHERE tanggal = '".$param['tanggal']."'
		";
        $select_result = mysql_query($select_query) or die(mysql_error());
        if (false !== $row = mysql_fetch_assoc($select_result)) {
			$result['next_no'] = $row['next_no'] + 1;
        }
		
        return $result;
    }
	
    function get_summary_skp($param = array()) {
        $array = array();
		
		$string_biodata = (isset($param['biodata_id'])) ? "AND kegiatan_skp.biodata_id = '".$param['biodata_id']."'" : '';
		$string_date_start = (isset($param['date_start'])) ? "AND kegiatan_skp.tanggal >= '".$param['date_start']."'" : '';
		$string_date_end = (isset($param['date_end'])) ? "AND kegiatan_skp.tanggal <= '".$param['date_end']."'" : '';
		$string_sorting = GetStringSorting($param, @$param['column'], 'jenis_skp.title ASC');
		$string_limit = GetStringLimit($param);
		
		$select_query = "
			SELECT jenis_skp.title, jenis_skp.jumlah, jenis_skp.point, COUNT(jenis_skp.jumlah) total_jumlah
			FROM ".KEGIATAN_SKP." kegiatan_skp
			LEFT JOIN ".JENIS_SKP." jenis_skp ON jenis_skp.id = kegiatan_skp.jenis_skp_id
			WHERE 1
				$string_biodata $string_date_start $string_date_end
				AND jenis_skp.title IS NOT NULL
			GROUP BY jenis_skp.title, jenis_skp.jumlah, jenis_skp.point
			ORDER BY $string_sorting
			LIMIT $string_limit
		";
        $select_result = mysql_query($select_query) or die(mysql_error());
		while ( $row = mysql_fetch_assoc( $select_result ) ) {
			// total point
			$row['total_point'] = 0;
			if (!empty($row['jumlah']) && !empty($row['point'])) {
				$row['total_point'] = $row['total_jumlah'] * $row['point'];
			}
			
			$array[] = $row;
		}
		
        return $array;
    }
	
    function get_summary_kegiatan($param = array()) {
        $array = array();
		
		$string_biodata = (isset($param['biodata_id'])) ? "AND kegiatan_skp.biodata_id = '".$param['biodata_id']."'" : '';
		$string_date_start = (isset($param['date_start'])) ? "AND kegiatan_skp.tanggal >= '".$param['date_start']."'" : '';
		$string_date_end = (isset($param['date_end'])) ? "AND kegiatan_skp.tanggal <= '".$param['date_end']."'" : '';
		$string_sorting = GetStringSorting($param, @$param['column'], 'jenis_kegiatan.title ASC');
		$string_limit = GetStringLimit($param);
		
		$select_query = "
			SELECT jenis_kegiatan.title, jenis_kegiatan.jumlah, jenis_kegiatan.point, COUNT(jenis_kegiatan.jumlah) total_jumlah
			FROM ".KEGIATAN_SKP." kegiatan_skp
			LEFT JOIN ".JENIS_KEGIATAN." jenis_kegiatan ON jenis_kegiatan.id = kegiatan_skp.jenis_kegiatan_id
			WHERE 1
				$string_biodata $string_date_start $string_date_end
				AND jenis_kegiatan.title IS NOT NULL
			GROUP BY jenis_kegiatan.title, jenis_kegiatan.jumlah, jenis_kegiatan.point
			ORDER BY $string_sorting
			LIMIT $string_limit
		";
        $select_result = mysql_query($select_query) or die(mysql_error());
		while ( $row = mysql_fetch_assoc( $select_result ) ) {
			// total point
			$row['total_point'] = 0;
			if (!empty($row['jumlah']) && !empty($row['point'])) {
				$row['total_point'] = $row['total_jumlah'] * $row['point'];
			}
			
			$array[] = $row;
		}
		
        return $array;
    }

    function delete($param) {
		$delete_query  = "DELETE FROM ".KEGIATAN_SKP." WHERE id = '".$param['id']."' LIMIT 1";
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