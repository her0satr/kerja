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
		if (in_array($action, array( 'skp_summary', 'skp_sasaran_kerja', 'skp_pejabat', 'skp_realisasi', 'skp_tugas_tambahan', 'skp_kreativitas', 'skp_perilaku_kerja' ))) {
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
				$_POST['column'] = array( 'jenis_skp_title', 'real_angka_kredit', 'real_kuant', 'real_kual', 'real_waktu', 'real_biaya' );
			} else if ($action == 'skp_tugas_tambahan') {
				$_POST['is_edit'] = 1;
				$_POST['column'] = array( 'title', 'perhitungan', 'nilai_capaian' );
			} else if ($action == 'skp_kreativitas') {
				$_POST['is_edit'] = 1;
				$_POST['column'] = array( 'title', 'perhitungan', 'nilai_capaian' );
			} else if ($action == 'skp_perilaku_kerja') {
				$_POST['is_edit'] = 1;
				$_POST['column'] = array( 'perilaku_kerja_title', 'nilai' );
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
		
		// skp realisasi
		else if ($action == 'skp_realisasi_update') {
			// check record
			$record = $this->skp_realisasi_model->get_by_id(array( 'skp_sasaran_kerja_id' => $_POST['skp_sasaran_kerja_id'] ));
			
			// add parameter for existing record
			if (!empty($record['id'])) {
				$_POST['id'] = $record['id'];
			}
			
			// update
			$result = $this->skp_realisasi_model->update($_POST);
		} else if ($action == 'skp_realisasi_get_by_id') {
			$result = $this->skp_realisasi_model->get_by_id(array( 'skp_sasaran_kerja_id' => $_POST['skp_sasaran_kerja_id'] ));
		}
		
		// skp tugas tambahan
		else if ($action == 'skp_tugas_tambahan_update') {
			// check record
			if (empty($_POST['id'])) {
				$check_param = array(
					'tahun' => $_POST['tahun'],
					'biodata_id' => $_POST['biodata_id']
				);
				$check_record = $this->skp_tugas_tambahan_model->get_array($check_param);
				if (count($check_record) >= 2) {
					$result['status'] = 0;
					$result['message'] = 'Anda tidak bisa memiliki Tugas Tambahan lebih dari 2 pada tahun yang sama.';
					echo json_encode($result);
					exit;
				}
			}
			
			// update
			$result = $this->skp_tugas_tambahan_model->update($_POST);
		} else if ($action == 'skp_tugas_tambahan_get_by_id') {
			$result = $this->skp_tugas_tambahan_model->get_by_id(array( 'id' => $_POST['id'] ));
		} else if ($action == 'skp_tugas_tambahan_delete') {
			$result = $this->skp_tugas_tambahan_model->delete($_POST);
		}
		
		// skp kreativitas
		else if ($action == 'skp_kreativitas_update') {
			// check record
			if (empty($_POST['id'])) {
				$check_param = array(
					'tahun' => $_POST['tahun'],
					'biodata_id' => $_POST['biodata_id']
				);
				$check_record = $this->skp_kreativitas_model->get_array($check_param);
				if (count($check_record) >= 2) {
					$result['status'] = 0;
					$result['message'] = 'Anda tidak bisa memiliki Kreativitas lebih dari 2 pada tahun yang sama.';
					echo json_encode($result);
					exit;
				}
			}
			
			// update
			$result = $this->skp_kreativitas_model->update($_POST);
		} else if ($action == 'skp_kreativitas_get_by_id') {
			$result = $this->skp_kreativitas_model->get_by_id(array( 'id' => $_POST['id'] ));
		} else if ($action == 'skp_kreativitas_delete') {
			$result = $this->skp_kreativitas_model->delete($_POST);
		}
		
		// skp perilaku kerja
		else if ($action == 'skp_perilaku_kerja_update') {
			$result = $this->skp_perilaku_kerja_model->update($_POST);
		} else if ($action == 'skp_perilaku_kerja_get_by_id') {
			$result = $this->skp_perilaku_kerja_model->get_by_id(array( 'id' => $_POST['id'] ));
		} else if ($action == 'skp_perilaku_kerja_delete') {
			$result = $this->skp_perilaku_kerja_model->delete($_POST);
		}
		
		echo json_encode($result);
	}
	
	function cetak() {
		$print_type = (isset($_GET['print_type'])) ? $_GET['print_type'] : 'sasaran';
		
		// load library
		ini_set("memory_limit", "1G");
		$this->load->library('mpdf');
		
		if ($print_type == 'sasaran') {
			$template = $this->load->view( 'kepegawaian/skp/template_skp_tahunan/sasaran_kerja', array( ), true );
			$this->mpdf->WriteHTML($template);
		} else if ($print_type == 'realisasi') {
			$this->mpdf->AddPage('L');
			$template = $this->load->view( 'kepegawaian/skp/template_skp_tahunan/capaian_sasaran', array( ), true );
			$this->mpdf->WriteHTML($template);
		} else if ($print_type == 'penilaian') {
			$this->mpdf->AddPage('P');
			$template = $this->load->view( 'kepegawaian/skp/template_skp_tahunan/prestasi_kerja', array( ), true );
			$this->mpdf->WriteHTML($template);
			
			$this->mpdf->AddPage('P');
			$template = $this->load->view( 'kepegawaian/skp/template_skp_tahunan/perilaku', array( ), true );
			$this->mpdf->WriteHTML($template);
			
			$this->mpdf->AddPage('P');
			$template = $this->load->view( 'kepegawaian/skp/template_skp_tahunan/tanggapan', array( ), true );
			$this->mpdf->WriteHTML($template);
			
			$this->mpdf->AddPage('P');
			$template = $this->load->view( 'kepegawaian/skp/template_skp_tahunan/persetujuan', array( ), true );
			$this->mpdf->WriteHTML($template);
		}
		
		$this->mpdf->Output();
	}
}