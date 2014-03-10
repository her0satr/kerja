<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Penjualan_model extends CI_Model {
    function __construct() {
        parent::__construct();
		
        $this->field = array(
			'id', 'sales_id', 'jenis_unit_id', 'jenis_warna_id', 'jenis_leasing_id', 'jenis_angsuran_id', 'jenis_pembayaran_id', 'status_penjualan_id', 'name', 'nik',
			'phone', 'birth_date', 'discount', 'dp_customer', 'dp_gross', 'sub', 'is_deliver', 'order_date', 'admin_id', 'user_delivery_id', 'birth_place', 'address',
			'price_otr', 'price_angsuran', 'with_ktp', 'with_gesek', 'with_bast', 'noka_nosin', 'delivery_date', 'delivery_man', 'ktp_file'
		);
    }

    function update($param) {
        $result = array();
       
        if (empty($param['id'])) {
            $insert_query  = GenerateInsertQuery($this->field, $param, PENJUALAN);
            $insert_result = mysql_query($insert_query) or die(mysql_error());
           
            $result['id'] = mysql_insert_id();
            $result['status'] = '1';
            $result['message'] = 'Data berhasil disimpan.';
        } else {
            $update_query  = GenerateUpdateQuery($this->field, $param, PENJUALAN);
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
				SELECT Penjualan.*, StatusPenjualan.name status_penjualan_name
				FROM ".PENJUALAN." Penjualan
				LEFT JOIN ".STATUS_PENJUALAN." StatusPenjualan ON StatusPenjualan.id = Penjualan.status_penjualan_id
				WHERE Penjualan.id = '".$param['id']."'
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
		
		$param['field_replace']['name'] = 'Penjualan.name';
		$param['field_replace']['sales_name'] = 'User.fullname';
		$param['field_replace']['jenis_unit_text'] = 'JenisUnit.name';
		$param['field_replace']['order_date_swap'] = 'Penjualan.order_date';
		$param['field_replace']['status_penjualan_name'] = 'StatusPenjualan.name';
		
		$string_sales = (!empty($param['sales_id'])) ? "AND Penjualan.sales_id = '".$param['sales_id']."'" : "";
		$string_filter = GetStringFilter($param, @$param['column']);
		$string_sorting = GetStringSorting($param, @$param['column'], 'order_date DESC');
		$string_limit = GetStringLimit($param);

		// additional sort
		if (strtoupper($string_sorting) == strtoupper('Penjualan.order_date desc')) {
			$string_sorting = 'Penjualan.order_date DESC, Penjualan.id DESC';
		} else if (strtoupper($string_sorting) == strtoupper('Penjualan.order_date asc')) {
			$string_sorting = 'Penjualan.order_date ASC, Penjualan.id ASC';
		}
		
		$select_query = "
			SELECT SQL_CALC_FOUND_ROWS Penjualan.*,
				User.fullname sales_name, JenisUnit.name jenis_unit_name, JenisUnit.warna jenis_unit_warna,
				JenisPembayaran.name jenis_pembayaran_name,
				StatusPenjualan.name status_penjualan_name
			FROM ".PENJUALAN." Penjualan
			LEFT JOIN ".USER." User ON User.id = Penjualan.sales_id
			LEFT JOIN ".JENIS_UNIT." JenisUnit ON JenisUnit.id = Penjualan.jenis_unit_id
			LEFT JOIN ".JENIS_PEMBAYARAN." JenisPembayaran ON JenisPembayaran.id = Penjualan.jenis_pembayaran_id
			LEFT JOIN ".STATUS_PENJUALAN." StatusPenjualan ON StatusPenjualan.id = Penjualan.status_penjualan_id
			WHERE 1 $string_sales $string_filter
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
	
	function get_rekap_penjualan($param = array()) {
		$array = array();
		
		// filter
		$string_main = $string_tunai = $string_kredit = '';
		if (!empty($param['sales_id'])) {
			$string_main = "AND Penjualan.sales_id = '".$param['sales_id']."'";
			$string_tunai = "AND PenjualanTunai.sales_id = '".$param['sales_id']."'";
			$string_kredit = "AND PenjualanKredit.sales_id = '".$param['sales_id']."'";
		}
		
		$select_query = "
			SELECT JenisUnit.name jenis_unit_name,
				(	SELECT COUNT(*)
					FROM ".PENJUALAN." PenjualanKredit
					WHERE
						PenjualanKredit.jenis_unit_id = Penjualan.jenis_unit_id
						AND PenjualanKredit.jenis_pembayaran_id = '".JENIS_PEMBAYARAN_KREDIT."'
						AND PenjualanKredit.status_penjualan_id = '".STATUS_PENJUALAN_DITERIMA."'
						AND PenjualanKredit.order_date >= '".$param['date_start']."'
						AND PenjualanKredit.order_date <= '".$param['date_end']."'
						$string_kredit
				) kredit,
				(	SELECT COUNT(*)
					FROM ".PENJUALAN." PenjualanTunai
					WHERE
						PenjualanTunai.jenis_unit_id = Penjualan.jenis_unit_id
						AND PenjualanTunai.jenis_pembayaran_id = '".JENIS_PEMBAYARAN_TUNAI."'
						AND PenjualanTunai.status_penjualan_id = '".STATUS_PENJUALAN_DITERIMA."'
						AND PenjualanTunai.order_date >= '".$param['date_start']."'
						AND PenjualanTunai.order_date <= '".$param['date_end']."'
						$string_tunai
				) tunai
			FROM ".PENJUALAN." Penjualan
			LEFT JOIN ".JENIS_UNIT." JenisUnit ON JenisUnit.id = Penjualan.jenis_unit_id
			WHERE
				Penjualan.status_penjualan_id = '".STATUS_PENJUALAN_DITERIMA."'
				AND Penjualan.order_date >= '".$param['date_start']."'
				AND Penjualan.order_date <= '".$param['date_end']."'
				$string_main
			GROUP BY JenisUnit.name
			ORDER BY JenisUnit.name ASC
			LIMIT 25
		";
		
        $select_result = mysql_query($select_query) or die(mysql_error());
		while ( $row = mysql_fetch_assoc( $select_result ) ) {
			$array[] = $row;
		}
		
        return $array;
    }
	
	function get_rekap_sales($param = array()) {
		$array = array();
		
		// filter
		$string_sales = (!empty($param['sales_id'])) ? "AND Penjualan.sales_id = '".$param['sales_id']."'" : "";
		
		$select_query = "
			SELECT User.fullname label, COUNT(*) value
			FROM ".PENJUALAN." Penjualan
			LEFT JOIN ".USER." User ON User.id = Penjualan.sales_id
			LEFT JOIN ".JENIS_UNIT." JenisUnit ON JenisUnit.id = Penjualan.jenis_unit_id
			WHERE
				Penjualan.status_penjualan_id = '".STATUS_PENJUALAN_DITERIMA."'
				AND Penjualan.order_date >= '".$param['date_start']."'
				AND Penjualan.order_date <= '".$param['date_end']."'
				$string_sales
			GROUP BY User.fullname
			ORDER BY User.fullname ASC
			LIMIT 25
		";
        $select_result = mysql_query($select_query) or die(mysql_error());
		while ( $row = mysql_fetch_assoc( $select_result ) ) {
			$array[] = $row;
		}
		
        return $array;
    }
	
	function get_rekap_yearly() {
		$year_last = date("Y") - 1;
		$month_last = date("m");
		
		// prepare result
		$result = array( 'data' => array(), 'key' => array(), 'label' => array() );
		for ($i = 12; $i >= 0; $i--) {
			$year_month = date("Y-m", strtotime("-$i Month"));
			$result['data'][$year_month] = array(
				'ym' => $year_month,
				'label' => GetFormatDate($year_month.'-01', array( 'FormatDate' => 'M Y' ))
			);
		}
		
		// get value
		$select_query = "
			SELECT JenisUnit.name, LEFT(Penjualan.order_date, 7) order_month, COUNT(*) total
			FROM ".PENJUALAN." Penjualan
			LEFT JOIN ".JENIS_UNIT." JenisUnit ON JenisUnit.id = Penjualan.jenis_unit_id
			WHERE
				Penjualan.status_penjualan_id = '".STATUS_PENJUALAN_DITERIMA."'
				AND YEAR(Penjualan.order_date) >= '".$year_last."'
				AND MONTH(Penjualan.order_date) >= '".$month_last."'
			GROUP BY JenisUnit.name, order_month
		";
        $select_result = mysql_query($select_query) or die(mysql_error());
		while ( $row = mysql_fetch_assoc( $select_result ) ) {
			$order_month_name = $row['order_month'];
			$jenis_unit_name = preg_replace('/[^0-9a-z]/i', '_', strtolower($row['name']));
			$result['data'][$order_month_name][$jenis_unit_name] = $row['total'];
			
			// key
			if (!in_array($jenis_unit_name, $result['key'])) {
				$result['key'][] = $jenis_unit_name;
			}
			
			// label
			if (!in_array($row['name'], $result['label'])) {
				$result['label'][] = $row['name'];
			}
		}
		
		// fix data
		$temp_data = $result['data'];
		$result['data'] = array();
		foreach ($temp_data as $row) {
			foreach ($result['key'] as $key) {
				if (!isset($row[$key])) {
					$row[$key] = 0;
				}
			}
			
			$result['data'][] = $row;
		}
		
		return $result;
	}
	
	function get_penjualan_pending() {
		$result = array();
		
		$select_query = "
			SELECT
				(SELECT COUNT(*) FROM ".PENJUALAN." WHERE status_penjualan_id = '".STATUS_PENJUALAN_PENDING."' AND with_ktp = 0) no_ktp,
				(SELECT COUNT(*) FROM ".PENJUALAN." WHERE status_penjualan_id = '".STATUS_PENJUALAN_PENDING."' AND with_gesek = 0) no_gesek,
				(SELECT COUNT(*) FROM ".PENJUALAN." WHERE status_penjualan_id = '".STATUS_PENJUALAN_PENDING."' AND with_bast = 0) no_bask
		";
        $select_result = mysql_query($select_query) or die(mysql_error());
		while ( $row = mysql_fetch_assoc( $select_result ) ) {
			$result = $row;
		}
		
		return $result;
	}
	
    function delete($param) {
		$delete_query  = "DELETE FROM ".PENJUALAN." WHERE id = '".$param['id']."' LIMIT 1";
		$delete_result = mysql_query($delete_query) or die(mysql_error());
		
		$result['status'] = '1';
		$result['message'] = 'Data berhasil dihapus.';

        return $result;
    }
	
	function sync($row, $param = array()) {
		$user = $this->User_model->get_session();
		
		$row = StripArray($row, array( 'delivery_date' ));
		$row['order_date_swap'] = ExchangeFormatDate($row['order_date']);
		
		// coloring
		if (isset($row['jenis_unit_warna']) && isset($row['jenis_unit_name'])) {
			$row['jenis_unit_text'] = '<span class="color" data-color="'.$row['jenis_unit_warna'].'">'.$row['jenis_unit_name'].'</span>';
		}
		
		// status penjualan
		if (!empty($row['status_penjualan_name']) && $row['status_penjualan_id'] == STATUS_PENJUALAN_DITERIMA) {
			$row['status_penjualan_name'] .= (empty($row['is_deliver'])) ? '' : ' - Terkirim';
		}
		
		if (count(@$param['column']) > 0) {
			// generate button
			if (!empty($param['kredit_penjualan_grid'])) {
				$param['is_custom']  = '<button class="btn btn-xs btn-edit btn-success" data-original-title="Edit"><i class="fa fa-pencil"></i></button> ';
				
				// approve / reject button
				if (@$param['user_type_id'] == USER_ID_ADMINISTRATOR && $row['status_penjualan_id'] == STATUS_PENJUALAN_PENDING) {
					$param['is_custom'] .= '<button class="btn btn-xs btn-approve btn-success" data-original-title="Approve"><i class="fa fa-check"></i></button> ';
					$param['is_custom'] .= '<button class="btn btn-xs btn-reject btn-warning" data-original-title="Reject"><i class="fa fa-adjust"></i></button> ';
				}
				
				// delivery button
				if (@$param['user_type_id'] == USER_ID_ADMINISTRATOR && $row['status_penjualan_id'] == STATUS_PENJUALAN_DITERIMA && empty($row['is_deliver'])) {
					$param['is_custom'] .= '<button class="btn btn-xs btn-delivery btn-success" data-original-title="Deliver"><i class="fa fa-envelope"></i></button> ';
				}
				
				// delete button
				if($row['status_penjualan_id'] == STATUS_PENJUALAN_PENDING && $user['user_type_id'] != USER_ID_DELIVERY) {
					$param['is_custom'] .= '<button class="btn btn-xs btn-delete btn-danger" data-original-title="Hapus"><i class="fa fa-times"></i></button> ';
				}
				
				// invoice
				if (@$param['user_type_id'] == USER_ID_ADMINISTRATOR && $row['status_penjualan_id'] == STATUS_PENJUALAN_DITERIMA) {
					$param['is_custom'] .= '<button class="btn btn-xs btn-invoice btn-success" data-original-title="Kwintasi"><i class="fa fa-file"></i></button> ';
				}
			}
			
			$row = dt_view_set($row, $param);
		}
		
		return $row;
	}
}