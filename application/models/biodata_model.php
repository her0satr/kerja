<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class biodata_model extends CI_Model {
    function __construct() {
        parent::__construct();
		
        $this->field = array(
			'id', 'agama_id', 'status_perkawinan_id', 'jenis_kepegawaian_id', 'status_kepegawaian_id', 'nip', 'nama', 'kelamin', 'tempat_lahir',
			'tanggal_lahir', 'karpeg', 'kartu_nikah'
		);
    }

    function update($param) {
        $result = array();
       
        if (empty($param['id'])) {
            $insert_query  = GenerateInsertQuery($this->field, $param, BIODATA);
            $insert_result = mysql_query($insert_query) or die(mysql_error());
           
            $result['id'] = mysql_insert_id();
            $result['status'] = '1';
            $result['message'] = 'Data berhasil disimpan.';
        } else {
            $update_query  = GenerateUpdateQuery($this->field, $param, BIODATA);
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
				SELECT
					biodata.*,
					biodata_detail.biodata_id, biodata_detail.jabatan, biodata_detail.pangkat, biodata_detail.golongan_ruang, biodata_detail.tmt_pangkat,
					biodata_detail.tmt_masa_kerja, biodata_detail.tmt_tahun, biodata_detail.tmt_bulan, biodata_detail.hp, biodata_detail.email,
					biodata_detail.cpns, biodata_detail.pns, biodata_detail.non_pns, biodata_detail.unit_kerja
				FROM ".BIODATA." biodata
				LEFT JOIN ".BIODATA_DETAIL." biodata_detail ON biodata_detail.biodata_id = biodata.id
				WHERE biodata.id = '".$param['id']."'
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
		
		$param['field_replace']['tanggal_lahir_text'] = 'biodata.tanggal_lahir';
		
		$string_filter = GetStringFilter($param, @$param['column']);
		$string_sorting = GetStringSorting($param, @$param['column'], 'id DESC');
		$string_limit = GetStringLimit($param);
		
		$select_query = "
			SELECT SQL_CALC_FOUND_ROWS biodata.*, user_biodata.user_id
			FROM ".BIODATA." biodata
			LEFT JOIN ".USER_BIODATA." user_biodata ON user_biodata.biodata_id = biodata.id
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
		$select_query = "SELECT FOUND_ROWS() TotalRecord";
		$select_result = mysql_query($select_query) or die(mysql_error());
		$row = mysql_fetch_assoc($select_result);
		$TotalRecord = $row['TotalRecord'];
		
		return $TotalRecord;
    }
	
    function delete($param) {
		$delete_query  = "DELETE FROM ".BIODATA." WHERE id = '".$param['id']."' LIMIT 1";
		$delete_result = mysql_query($delete_query) or die(mysql_error());
		
		$result['status'] = '1';
		$result['message'] = 'Data berhasil dihapus.';

        return $result;
    }
	
	function sync($row, $param = array()) {
		$row = StripArray($row, array( 'tanggal_lahir' ));
		
		// link
		if (isset($row['id'])) {
			$row['link_riwayat'] = base_url('kepegawaian/riwayat/index/'.$row['id']);
		}
		
		if (isset($row['tanggal_lahir'])) {
			$row['tanggal_lahir_text'] = GetFormatDate($row['tanggal_lahir']);
		}
		
		if (count(@$param['column']) > 0) {
			if (isset($param['grid_type']) && $param['grid_type'] == 'biodata_view') {
				$param['is_custom']  = '<button class="btn btn-xs btn-edit btn-success" data-original-title="Edit"><i class="fa fa-pencil"></i></button> ';
				$param['is_custom'] .= '<button class="btn btn-xs btn-detail btn-success" data-original-title="Detail"><i class="fa fa-book"></i></button> ';
				$param['is_custom'] .= '<button class="btn btn-xs btn-riwayat btn-success" data-original-title="Riwayat"><i class="fa fa-folder"></i></button> ';
				
				// add create button
				if (empty($row['user_id'])) {
					$param['is_custom'] .= '<button class="btn btn-xs btn-login btn-success" data-original-title="Login Akses"><i class="fa fa-user"></i></button> ';
				}
				
				$param['is_custom'] .= '<button class="btn btn-xs btn-delete btn-danger" data-original-title="Hapus"><i class="fa fa-times"></i></button> ';
			}
			
			$row = dt_view_set($row, $param);
		}
		
		return $row;
	}
}