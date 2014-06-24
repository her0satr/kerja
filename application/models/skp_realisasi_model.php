<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class skp_realisasi_model extends CI_Model {
    function __construct() {
        parent::__construct();
		
        $this->field = array(
			'id', 'skp_sasaran_kerja_id', 'kuant_revisi', 'waktu_nilai', 'waktu_satuan', 'biaya'
		);
    }

    function update($param) {
        $result = array();
       
        if (empty($param['id'])) {
            $insert_query  = GenerateInsertQuery($this->field, $param, SKP_REALISASI);
            $insert_result = mysql_query($insert_query) or die(mysql_error());
           
            $result['id'] = mysql_insert_id();
            $result['status'] = '1';
            $result['message'] = 'Data berhasil disimpan.';
        } else {
            $update_query  = GenerateUpdateQuery($this->field, $param, SKP_REALISASI);
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
				SELECT skp_realisasi.*
				FROM ".SKP_REALISASI." skp_realisasi
				WHERE skp_realisasi.id = '".$param['id']."'
				LIMIT 1
			";
		} else if (isset($param['skp_sasaran_kerja_id'])) {
			$select_query = "
				SELECT SQL_CALC_FOUND_ROWS
					skp_realisasi.id, skp_realisasi.kuant_revisi, skp_realisasi.waktu_nilai, skp_realisasi.waktu_satuan, skp_realisasi.biaya,
					skp_sasaran_kerja.id skp_sasaran_kerja_id
				FROM ".SKP_SASARAN_KERJA." skp_sasaran_kerja
				LEFT JOIN ".SKP_REALISASI." skp_realisasi ON skp_realisasi.skp_sasaran_kerja_id = skp_sasaran_kerja.id
				WHERE skp_sasaran_kerja.id = '".$param['skp_sasaran_kerja_id']."'
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
		
		$param['field_replace']['real_kual'] = '';
		$param['field_replace']['real_kuant'] = '';
		$param['field_replace']['real_waktu'] = '';
		$param['field_replace']['real_biaya'] = '';
		$param['field_replace']['jenis_skp_title'] = 'jenis_skp.title';
		
		$string_tahun = (isset($param['tahun'])) ? "AND skp_sasaran_kerja.tahun = '".$param['tahun']."'" : '';
		$string_biodata = (isset($param['biodata_id'])) ? "AND skp_sasaran_kerja.biodata_id = '".$param['biodata_id']."'" : '';
		$string_filter = GetStringFilter($param, @$param['column']);
		$string_sorting = GetStringSorting($param, @$param['column'], 'jenis_skp.title ASC');
		$string_limit = GetStringLimit($param);
		
		$select_query = "
			SELECT SQL_CALC_FOUND_ROWS
				jenis_skp.title jenis_skp_title, jenis_skp.satuan jenis_skp_satuan, jenis_skp.point jenis_skp_point,
				
				skp_sasaran_kerja.id skp_sasaran_kerja_id,
				skp_sasaran_kerja.ak target_ak, skp_sasaran_kerja.kuant_nilai target_kuant_nilai, skp_sasaran_kerja.kual target_kual,
				skp_sasaran_kerja.waktu_nilai target_waktu_nilai, skp_sasaran_kerja.waktu_satuan target_waktu_satuan, skp_sasaran_kerja.biaya target_biaya,
				
				skp_realisasi.id skp_realisasi_id, skp_realisasi.kuant_revisi real_kuant_revisi, skp_realisasi.waktu_nilai real_waktu_nilai, skp_realisasi.waktu_satuan real_waktu_satuan,
				skp_realisasi.biaya real_biaya,
				
				(	SELECT SUM(kuan)
					FROM ".KEGIATAN_SKP." a1
					WHERE
						a1.biodata_id = skp_sasaran_kerja.biodata_id
						AND YEAR(a1.tanggal) = skp_sasaran_kerja.tahun
						AND a1.jenis_skp_id = skp_sasaran_kerja.jenis_skp_id
				) real_kuant,
				(	SELECT AVG(kual)
					FROM ".KEGIATAN_SKP." b1
					WHERE
						b1.biodata_id = skp_sasaran_kerja.biodata_id
						AND YEAR(b1.tanggal) = skp_sasaran_kerja.tahun
						AND b1.jenis_skp_id = skp_sasaran_kerja.jenis_skp_id
				) real_kual
			FROM ".SKP_SASARAN_KERJA." skp_sasaran_kerja
			LEFT JOIN ".SKP_REALISASI." skp_realisasi ON skp_realisasi.skp_sasaran_kerja_id = skp_sasaran_kerja.id
			LEFT JOIN ".JENIS_SKP." jenis_skp ON jenis_skp.id = skp_sasaran_kerja.jenis_skp_id
			WHERE 1 $string_tahun $string_biodata $string_filter
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
	
    function delete($param) {
		$delete_query  = "DELETE FROM ".SKP_REALISASI." WHERE id = '".$param['id']."' LIMIT 1";
		$delete_result = mysql_query($delete_query) or die(mysql_error());
		
		$result['status'] = '1';
		$result['message'] = 'Data berhasil dihapus.';

        return $result;
    }
	
	function sync($row, $param = array()) {
		$row = StripArray($row);
		
		// kual
		if (!empty($row['real_kual'])) {
			$row['real_kual'] = round($row['real_kual']);
		}
		
		// real waktu
		$row['real_waktu'] = '-';
		if (!empty($row['real_waktu_nilai']) && !empty($row['real_waktu_satuan'])) {
			$row['real_waktu'] = $row['real_waktu_nilai'].' '.$row['real_waktu_satuan'];
		}
		
		// perhitungan & nilai capaian
		$row['perhitungan'] = 0;
		if (!empty($row['target_kuant_nilai']) && !empty($row['real_kuant']) && !empty($row['real_waktu_nilai'])) {
			$is_revisi = (!empty($_GET['revisi'])) ? $_GET['revisi'] : false;
			if ($is_revisi && !empty($row['real_kuant_revisi'])) {
				$row['target_kuant_nilai'] = $row['real_kuant_revisi'];
			}
			
			// kontanta
			$rw_kecil_24 = (((1.76 * $row['real_waktu_nilai']) - $row['target_waktu_nilai']) / $row['real_waktu_nilai']) * 100;
			$rw_besar_24 = 76 - (((((1.76 * $row['real_waktu_nilai']) - $row['target_waktu_nilai']) / $row['real_waktu_nilai']) * 100) - 100);
			
			// data
			$waktu_persen = 100 - (($row['real_waktu_nilai'] / $row['target_waktu_nilai']) * 100);
			$waktu = ($waktu_persen > 24) ? $rw_besar_24 : $rw_kecil_24;
			$biaya_persen = (empty($row['target_biaya']) || empty($row['real_biaya'])) ? 0 : 100 - (($row['real_biaya'] / $row['target_biaya']) * 100);
			$kuan = ($row['real_kuant'] / $row['target_kuant_nilai']) * 100;
			$kual = ($row['real_kual'] / $row['target_kual']) * 100;
			
			// angka kredit
			$row['target_ak'] = number_format($row['target_ak'], 2, ',', '.');
			$row['real_angka_kredit'] = $row['real_kuant'] * $row['jenis_skp_point'];
			$row['real_angka_kredit'] = number_format($row['real_angka_kredit'], 2, ',', '.');
			
			// perhitungan
			$row['perhitungan'] = $waktu + $kuan + $kual;
			$row['perhitungan'] = number_format($row['perhitungan'], 2, ',', '.');
			
			// nilai capaian
			$row['nilai_capaian'] = (empty($row['target_biaya']) || empty($row['real_biaya'])) ? ($waktu + $kuan + $kual) / 3 : ($waktu + $kuan + $kual) / 4;
			$row['nilai_capaian'] = number_format($row['nilai_capaian'], 2, ',', '.');
		}
		
		// dt view
		if (count(@$param['column']) > 0) {
			$row = dt_view_set($row, $param);
		}
		
		return $row;
	}
	
	function get_total_nilai_capaian($param = array()) {
		// realisasi
		$param_realisasi['tahun'] = $param['tahun'];
		$param_realisasi['biodata_id'] = $param['biodata_id'];
		$realisasi = $this->skp_realisasi_model->get_array($param_realisasi);
		
		// tugas tambahan
		$param_tugas_tambahan['tahun'] = $param['tahun'];
		$param_tugas_tambahan['biodata_id'] = $param['biodata_id'];
		$array_tugas_tambahan = $this->skp_tugas_tambahan_model->get_array($param_tugas_tambahan);
		
		// kreativitas
		$param_kreativitas['tahun'] = $param['tahun'];
		$param_kreativitas['biodata_id'] = $param['biodata_id'];
		$array_kreativitas = $this->skp_kreativitas_model->get_array($param_kreativitas);
		
		// count realisasi
		$temp_total = 0;
		foreach ($realisasi as $key => $row) {
			$float = floatval(preg_replace('/\,/i', '.', $row['nilai_capaian']));
			$temp_total += $float;
		}
		$nilai_capaian = $temp_total / count($realisasi);
		
		// count tugas tambahan
		foreach ($array_tugas_tambahan as $key => $row) {
			$nilai_capaian += $row['nilai_capaian'];
		}
		
		// count kreativitas
		foreach ($array_kreativitas as $key => $row) {
			$nilai_capaian += $row['nilai_capaian'];
		}
		
		// final
		$nilai_capaian = number_format($nilai_capaian, 2, ',', '.');
		
		return $nilai_capaian;
	}
	
	function get_final_nilai($param = array()) {
		$nilai_capaian = $this->get_total_nilai_capaian($param);
		$perilaku_kerja_average = $this->skp_perilaku_kerja_model->get_average_nilai($param);
		
		$result = array(
			'nilai_capaian' => $nilai_capaian,
			'nilai_capaian_persen' => number_format($nilai_capaian * 0.6, 2, ',', '.'),
			'perilaku_kerja' => $perilaku_kerja_average,
			'perilaku_kerja_persen' => number_format($perilaku_kerja_average * 0.4, 2, ',', '.'),
		);
		
		// summary
		$result['final_nilai'] = $result['nilai_capaian_persen'] + $result['perilaku_kerja_persen'];
		$result['final_nilai'] = number_format($result['final_nilai'], 2, ',', '.');
		
		return $result;
	}
}