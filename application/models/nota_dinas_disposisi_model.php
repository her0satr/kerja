<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class nota_dinas_disposisi_model extends CI_Model {
    function __construct() {
        parent::__construct();
		
        $this->field = array(
			'id', 'nota_dinas_id', 'nota_dinas_kepada_id', 'waktu', 'waktu_diff'
		);
    }

    function update($param) {
        $result = array();
       
        if (empty($param['id'])) {
            $insert_query  = GenerateInsertQuery($this->field, $param, NOTA_DINAS_DISPOSISI);
            $insert_result = mysql_query($insert_query) or die(mysql_error());
           
            $result['id'] = mysql_insert_id();
            $result['status'] = '1';
            $result['message'] = 'Data berhasil disimpan.';
        } else {
            $update_query  = GenerateUpdateQuery($this->field, $param, NOTA_DINAS_DISPOSISI);
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
				SELECT nota_dinas_disposisi.*
				FROM ".NOTA_DINAS_DISPOSISI." nota_dinas_disposisi
				WHERE nota_dinas_disposisi.id = '".$param['id']."'
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
		$param['field_replace']['nota_dinas_kepada_title'] = 'nota_dinas_kepada.title';
		
		$string_nota_dinas = (isset($param['nota_dinas_id'])) ? "AND nota_dinas_disposisi.nota_dinas_id = '".$param['nota_dinas_id']."'" : '';
		$string_filter = GetStringFilter($param, @$param['column']);
		$string_sorting = GetStringSorting($param, @$param['column'], 'waktu ASC');
		$string_limit = GetStringLimit($param);
		
		$select_query = "
			SELECT SQL_CALC_FOUND_ROWS nota_dinas_disposisi.*,
				nota_dinas_kepada.title nota_dinas_kepada_title, nota_dinas_kepada.hidden nota_dinas_kepada_hidden
			FROM ".NOTA_DINAS_DISPOSISI." nota_dinas_disposisi
			LEFT JOIN ".NOTA_DINAS_KEPADA." nota_dinas_kepada ON nota_dinas_kepada.id = nota_dinas_disposisi.nota_dinas_kepada_id
			WHERE 1 $string_nota_dinas $string_filter
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
	
	function get_last($param = array()) {
        $array = array();
       
		$select_query  = "
			SELECT nota_dinas_disposisi.*
			FROM ".NOTA_DINAS_DISPOSISI." nota_dinas_disposisi
			WHERE nota_dinas_disposisi.nota_dinas_id = (
				SELECT nota_dinas_disposisi_sub.nota_dinas_id
				FROM ".NOTA_DINAS_DISPOSISI." nota_dinas_disposisi_sub
				WHERE nota_dinas_disposisi_sub.id = '".$param['id']."'
			)
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
		$delete_query  = "DELETE FROM ".NOTA_DINAS_DISPOSISI." WHERE id = '".$param['id']."' LIMIT 1";
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