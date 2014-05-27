<?php

class skp_tahunan extends SYGAAS_Controller {
	function __construct() {
		parent::__construct();
	}
	
	function index() {
		$this->load->view( 'kepegawaian/skp/skp_tahunan');
	}
	
	function grid() {
		// action
		$action = (isset($_POST['action'])) ? $_POST['action'] : '';
		
		// user
		$user = $this->user_model->get_session();
		
		// grid selecetor
		if (in_array($action, array( 'skp_summary', 'skp_sasaran_kerja', 'skp_pejabat', 'skp_realisasi' ))) {
			if ($action == 'skp_summary') {
				$_POST['is_edit'] = 1;
				$_POST['column'] = array( 'tanggal_pembuatan_text', 'tanggal_penilaian_text' );
			} else if ($action == 'skp_sasaran_kerja') {
				$_POST['is_edit'] = 1;
				$_POST['column'] = array( 'jenis_skp_title', 'ak', 'kuant_nilai', 'kual' );
			} else if ($action == 'skp_pejabat') {
				$_POST['is_edit'] = 1;
				$_POST['column'] = array( 'nama', 'nip' );
			} else if ($action == 'skp_realisasi') {
				$_POST['is_edit_only'] = 1;
				$_POST['column'] = array( 'jenis_skp_title', 'kuant', 'kual', 'waktu_text', 'biaya_text' );
			}
			
			$model_name = $action.'_model';
			$array = $this->$model_name->get_array($_POST);
			$count = $this->$model_name->get_count();
		}
		
		$grid = array( 'sEcho' => $_POST['sEcho'], 'aaData' => $array, 'iTotalRecords' => $count, 'iTotalDisplayRecords' => $count );
		echo json_encode($grid);
	}
	
	function action() {
		$action = (isset($_POST['action'])) ? $_POST['action'] : '';
		unset($_POST['action']);
		
		// set result
		$result = array();
		
		// skp summary
		if ($action == 'skp_summary_update') {
			// check count
			if (empty($_POST['id'])) {
				$record = $this->skp_summary_model->get_array(array( 'biodata_id' => $_POST['biodata_id'] ));
				$count_record = count($record);
				if (!empty($count_record)) {
					$result['status'] = 0;
					$result['message'] = 'Anda sudah memiliki record, harap memperbaharui record tersebut.';
					echo json_encode($result);
					exit;
				}
			}
			
			$result = $this->skp_summary_model->update($_POST);
		} else if ($action == 'skp_summary_get_by_id') {
			$result = $this->skp_summary_model->get_by_id(array( 'id' => $_POST['id'] ));
		} else if ($action == 'skp_summary_delete') {
			$result = $this->skp_summary_model->delete($_POST);
		}
		
		// skp sasaran
		else if ($action == 'skp_sasaran_update') {
			$result = $this->skp_sasaran_kerja_model->update($_POST);
		} else if ($action == 'skp_sasaran_get_by_id') {
			$result = $this->skp_sasaran_kerja_model->get_by_id(array( 'id' => $_POST['id'] ));
		} else if ($action == 'skp_sasaran_delete') {
			$result = $this->skp_sasaran_kerja_model->delete($_POST);
		}
		
		// skp pejabat
		else if ($action == 'skp_pejabat_update') {
			// check record
			if (empty($_POST['id'])) {
				$check_param = array(
					'tahun' => $_POST['tahun'],
					'biodata_id' => $_POST['biodata_id'],
					'posisi' => $_POST['posisi']
				);
				$check_record = $this->skp_pejabat_model->get_by_id($check_param);
				if (count($check_record) > 0) {
					$result['status'] = 0;
					$result['message'] = 'Anda tidak bisa memiliki pejabat dengan posisi yang sama lebih dari satu pada tahun yang sama.';
					echo json_encode($result);
					exit;
				}
			}
			
			// update
			$result = $this->skp_pejabat_model->update($_POST);
		} else if ($action == 'skp_pejabat_get_by_id') {
			$result = $this->skp_pejabat_model->get_by_id(array( 'id' => $_POST['id'] ));
		} else if ($action == 'skp_pejabat_delete') {
			$result = $this->skp_pejabat_model->delete($_POST);
		}
		
		// skp pejabat
		else if ($action == 'skp_realisasi_update') {
			echo 'continue here';
			print_r($_POST); exit;
			
			$result = $this->skp_realisasi_model->update($_POST);
		} else if ($action == 'skp_realisasi_get_by_id') {
			$result = $this->skp_realisasi_model->get_by_id(array( 'skp_sasaran_kerja_id' => $_POST['skp_sasaran_kerja_id'] ));
		}
		
		echo json_encode($result);
	}
}