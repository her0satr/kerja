<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class disposisi_model extends CI_Model {
    function __construct() {
        parent::__construct();
		
        $this->field = array(
			'id', 'surat_masuk_id', 'surat_destination_id', 'waktu', 'waktu_diff'
		);
    }

    function update($param) {
        $result = array();
       
        if (empty($param['id'])) {
            $insert_query  = GenerateInsertQuery($this->field, $param, DISPOSISI);
            $insert_result = mysql_query($insert_query) or die(mysql_error());
           
            $result['id'] = mysql_insert_id();
            $result['status'] = '1';
            $result['message'] = 'Data berhasil disimpan.';
        } else {
            $update_query  = GenerateUpdateQuery($this->field, $param, DISPOSISI);
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
				SELECT disposisi.*
				FROM ".DISPOSISI." disposisi
				WHERE disposisi.id = '".$param['id']."'
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
		
		$param['field_replace']['waktu'] = 'id';
		$param['field_replace']['waktu_text'] = '';
		$param['field_replace']['surat_destination_title'] = 'surat_destination.title';
		
		$string_surat_masuk = (isset($param['surat_masuk_id'])) ? "AND disposisi.surat_masuk_id = '".$param['surat_masuk_id']."'" : '';
		$string_surat_hidden = (isset($param['hidden'])) ? "AND surat_destination.hidden = '".$param['hidden']."'" : '';
		$string_filter = GetStringFilter($param, @$param['column']);
		$string_sorting = GetStringSorting($param, @$param['column'], 'waktu ASC');
		$string_limit = GetStringLimit($param);
		
		$select_query = "
			SELECT SQL_CALC_FOUND_ROWS disposisi.*,
				surat_destination.title surat_destination_title, surat_destination.hidden surat_destination_hidden
			FROM ".DISPOSISI." disposisi
			LEFT JOIN ".SURAT_DESTINATION." surat_destination ON surat_destination.id = disposisi.surat_destination_id
			WHERE 1 $string_surat_masuk $string_surat_hidden $string_filter
			ORDER BY $string_sorting
			LIMIT $string_limit
		";
        $select_result = mysql_query($select_query) or die(mysql_error());
		while ( $row = mysql_fetch_assoc( $select_result ) ) {
			$array[] = $this->sync($row, $param);
		}
		
        return $array;
    }
	
	function get_array_disposisi_print($param = array()) {
		$param['hidden'] = 0;
		$result = $this->get_array($param);
		
		if (count($result) == 0) {
			$result = $this->surat_destination_model->get_array();
			
			// make same label
			foreach ($result as $key => $row) {
				$result[$key]['surat_destination_title'] = $row['title'];
			}
		}
		
		return $result;
	}
	
    function get_count($param = array()) {
		$select_query = "SELECT FOUND_ROWS() TotalRecord";
		$select_result = mysql_query($select_query) or die(mysql_error());
		$row = mysql_fetch_assoc($select_result);
		$TotalRecord = $row['TotalRecord'];
		
		return $TotalRecord;
    }
	
	function get_last($param = array()) {
        $array = array();
       
		$select_query  = "
			SELECT disposisi.*
			FROM ".DISPOSISI." disposisi
			WHERE disposisi.surat_masuk_id = (SELECT disposisi_sub.surat_masuk_id FROM ".DISPOSISI." disposisi_sub WHERE disposisi_sub.id = '".$param['id']."')
			ORDER BY waktu DESC
			LIMIT 1
		";
		
        $select_result = mysql_query($select_query) or die(mysql_error());
        if (false !== $row = mysql_fetch_assoc($select_result)) {
            $array = $this->sync($row);
        }
       
        return $array;
	}
	
    function delete($param) {
		$delete_query  = "DELETE FROM ".DISPOSISI." WHERE id = '".$param['id']."' LIMIT 1";
		$delete_result = mysql_query($delete_query) or die(mysql_error());
		
		$result['status'] = '1';
		$result['message'] = 'Data berhasil dihapus.';

        return $result;
    }
	
	function sync($row, $param = array()) {
		$row = StripArray($row, array( 'waktu' ));
		
		if (!empty($row['waktu_diff'])) {
			$row['waktu_text'] = show_time_diff($row['waktu_diff']);
		}
		
		if (isset($param['grid_type']) && $param['grid_type'] == 'validation') {
			$param['is_custom']  = '<button class="btn btn-xs btn-edit" data-original-title="Edit"><img src="'.base_url('static/img/icons/icon-edit.png').'" /></button> ';
			
			// add validation
			if (empty($row['waktu'])) {
				$param['is_custom'] .= '<button class="btn btn-xs btn-validasi" data-original-title="Validasi"><img src="'.base_url('static/img/icons/icon-check.png').'" /></button> ';
			}
			
			$param['is_custom'] .= '<button class="btn btn-xs btn-delete" data-original-title="Hapus"><img src="'.base_url('static/img/icons/icon-delete.png').'" /></button> ';
		}
		
		if (count(@$param['column']) > 0) {
			$row = dt_view_set($row, $param);
		}
		
		return $row;
	}
}