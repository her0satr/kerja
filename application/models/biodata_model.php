<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class biodata_model extends CI_Model {
    function __construct() {
        parent::__construct();
		
        $this->field = array(
			'id', 'agama_id', 'skpd_id', 'status_perkawinan_id', 'jenis_kepegawaian_id', 'status_kepegawaian_id', 'nip', 'nama', 'kelamin', 'tempat_lahir',
			'tanggal_lahir', 'karpeg', 'kartu_nikah', 'gelar_depan', 'gelar_belakang', 'photo'
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
					biodata.*, skpd.title skpd_title,
					biodata_detail.biodata_id, biodata_detail.jabatan, biodata_detail.golongan_ruang, biodata_detail.tmt_pangkat,
					biodata_detail.tmt_masa_kerja, biodata_detail.tmt_tahun, biodata_detail.tmt_bulan, biodata_detail.hp, biodata_detail.email,
					biodata_detail.cpns, biodata_detail.pns, biodata_detail.non_pns, biodata_detail.unit_kerja_id unit_kerja
				FROM ".BIODATA." biodata
				LEFT JOIN ".BIODATA_DETAIL." biodata_detail ON biodata_detail.biodata_id = biodata.id
				LEFT JOIN ".SKPD." skpd ON skpd.id = biodata.skpd_id
				LEFT JOIN ".SKPD." unit_kerja ON unit_kerja.id = biodata_detail.unit_kerja_id
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
		
		$param['field_replace']['skpd_title'] = 'skpd.title';
		$param['field_replace']['tanggal_lahir_text'] = 'biodata.tanggal_lahir';
		
		$string_namelike = (isset($param['namelike'])) ? "AND nama LIKE '%".$param['namelike']."%'" : '';
		$string_filter = GetStringFilter($param, @$param['column']);
		$string_sorting = GetStringSorting($param, @$param['column'], 'id DESC');
		$string_limit = GetStringLimit($param);
		
		$select_query = "
			SELECT SQL_CALC_FOUND_ROWS biodata.*, user_biodata.user_id, skpd.title skpd_title, agama.title agama_title,
				biodata_detail.golongan_ruang, biodata_detail.tmt_pangkat, biodata_detail.gaji, biodata_detail.tmt_masa_kerja, biodata_detail.tmt_tahun, biodata_detail.tmt_bulan,
				biodata_detail.jabatan, unit_kerja.title unit_kerja
			FROM ".BIODATA." biodata
			LEFT JOIN ".AGAMA." agama ON agama.id = biodata.agama_id
			LEFT JOIN ".BIODATA_DETAIL." biodata_detail ON biodata_detail.biodata_id = biodata.id
			LEFT JOIN ".SKPD." skpd ON skpd.id = biodata.skpd_id
			LEFT JOIN ".SKPD." unit_kerja ON unit_kerja.id = biodata_detail.unit_kerja_id
			LEFT JOIN ".USER_BIODATA." user_biodata ON user_biodata.biodata_id = biodata.id
			WHERE 1 $string_namelike $string_filter
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
			$select_query = "SELECT COUNT(*) TotalRecord FROM ".BIODATA;
		} else {
			$select_query = "SELECT FOUND_ROWS() TotalRecord";
		}
		
		$select_result = mysql_query($select_query) or die(mysql_error());
		$row = mysql_fetch_assoc($select_result);
		$TotalRecord = $row['TotalRecord'];
		
		return $TotalRecord;
    }
	
    function delete($param) {
		// get data
		$user_biodata = $this->user_biodata_model->get_by_id(array( 'biodata_id' => $param['id'] ));
		
		// delete user biodata
		$delete_query  = "DELETE FROM ".USER_BIODATA." WHERE id = '".$user_biodata['id']."' LIMIT 1";
		$delete_result = mysql_query($delete_query) or die(mysql_error());
		
		// delete user
		$delete_query  = "DELETE FROM ".USER." WHERE id = '".$user_biodata['user_id']."' LIMIT 1";
		$delete_result = mysql_query($delete_query) or die(mysql_error());
		
		// delete biodata
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
		if (!empty($row['photo'])) {
			$row['link_photo'] = base_url('static/upload/'.$row['photo']);
		} else {
			$row['link_photo'] = base_url('static/img/user1.png');
		}
		
		if (isset($row['tanggal_lahir'])) {
			$row['tanggal_lahir_text'] = GetFormatDate($row['tanggal_lahir']);
		}
		
		if (count(@$param['column']) > 0) {
			if (isset($param['grid_type']) && $param['grid_type'] == 'biodata_view') {
				$param['is_custom']  = '<button class="btn btn-xs btn-edit" data-original-title="Edit"><img src="'.base_url('static/img/icons/icon-edit.png').'" /></button> ';
				$param['is_custom'] .= '<button class="btn btn-xs btn-detail" data-original-title="Riwayat Kepegawaian"><img src="'.base_url('static/img/icons/icon-detail.png').'" /></button> ';
				$param['is_custom'] .= '<button class="btn btn-xs btn-riwayat" data-original-title="Riwayat"><img src="'.base_url('static/img/icons/icon-book.png').'" /></button> ';
				
				// add create button
				if (empty($row['user_id'])) {
					$param['is_custom'] .= '<button class="btn btn-xs btn-login" data-original-title="Login Akses"><img src="'.base_url('static/img/icons/icon-user.png').'" /></button> ';
				}
				
				$param['is_custom'] .= '<button class="btn btn-xs btn-delete" data-original-title="Hapus"><img src="'.base_url('static/img/icons/icon-delete.png').'" /></button> ';
			}
			
			$row = dt_view_set($row, $param);
		}
		
		return $row;
	}
}