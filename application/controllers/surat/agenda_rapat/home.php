<?php

class home extends SYGAAS_Controller {
	function __construct() {
		parent::__construct();
	}
	
	function index() {
		$this->load->view( 'surat/agenda_rapat/home');
	}
	
	function grid() {
		$action = (isset($_POST['action'])) ? $_POST['action'] : '';
		unset($_POST['action']);
		
		// user
		$user = $this->user_model->get_session();
		
		$grid = array();
		if ($action == 'agenda_rapat') {
			$_POST['column'] = array( 'leading_sektor', 'no_surat', 'tempat', 'tanggal_ajuan' );
			
			// button
			$_POST['is_custom']  = '<button class="btn btn-xs btn-edit btn-success" data-original-title="Edit"><i class="fa fa-pencil"></i></button> ';
			$_POST['is_custom'] .= '<button class="btn btn-xs btn-skpd btn-success" data-original-title="Undangan"><i class="fa fa-book"></i></button> ';
			
			// button sms
			if ($user['user_type_id'] == USER_ID_ADMINISTRATOR) {
				$_POST['is_custom'] .= '<button class="btn btn-xs btn-sms btn-success" data-original-title="SMS / Email"><i class="fa fa-envelope"></i></button> ';
			}
			
			$_POST['is_custom'] .= '<button class="btn btn-xs btn-delete btn-danger" data-original-title="Hapus"><i class="fa fa-times"></i></button> ';
			
			$array = $this->agenda_rapat_model->get_array($_POST);
			$count = $this->agenda_rapat_model->get_count();
			$grid = array( 'sEcho' => $_POST['sEcho'], 'aaData' => $array, 'iTotalRecords' => $count, 'iTotalDisplayRecords' => $count );
		} else if ($action == 'skpd') {
			$_POST['is_delete'] = 1;
			$_POST['column'] = array( 'title', 'kepala', 'instansi' );
			
			$array = $this->agenda_skpd_model->get_array($_POST);
			$count = $this->agenda_skpd_model->get_count();
			$grid = array( 'sEcho' => $_POST['sEcho'], 'aaData' => $array, 'iTotalRecords' => $count, 'iTotalDisplayRecords' => $count );
		}
		
		echo json_encode($grid);
	}
	
	function action() {
		$action = (isset($_POST['action'])) ? $_POST['action'] : '';
		unset($_POST['action']);
		
		// default data
		$result = array();
		
		// agenda rapat
		if ($action == 'update') {
			$result = $this->agenda_rapat_model->update($_POST);
		} else if ($action == 'get_by_id') {
			$result = $this->agenda_rapat_model->get_by_id(array( 'id' => $_POST['id'] ));
		} else if ($action == 'delete') {
			$result = $this->agenda_rapat_model->delete($_POST);
		}
		
		// skpd
		else if ($action == 'skpd_update') {
			$record = $this->agenda_skpd_model->get_by_id($_POST);
			if (count($record) == 0) {
				$result = $this->agenda_skpd_model->update($_POST);
			} else {
				$result['status'] = '0';
				$result['message'] = 'Data sudah terdaftar.';
			}
		} else if ($action == 'skpd_get_by_id') {
			$result = $this->agenda_skpd_model->get_by_id(array( 'id' => $_POST['id'] ));
		} else if ($action == 'skpd_delete') {
			$result = $this->agenda_skpd_model->delete($_POST);
		}
		
		// sent sms
		else if ($action == 'sent_sms') {
			// sent via media
			$array_skpd = $this->agenda_skpd_model->get_array(array( 'agenda_rapat_id' => $_POST['agenda_rapat_id'] ));
			foreach ($array_skpd as $row) {
				if ($_POST['media'] == 'Email') {
					if (empty($row['email'])) {
						continue;
					}
					
					$param_mail = array(
						'to' => $row['email'],
						'subject' => 'Undangan Rapat',
						'message' => $_POST['message']
					);
					sent_mail($param_mail);
				} else if ($_POST['media'] == 'SMS') {
				}
			}
			
			// insert to table sms here
            $result['status'] = '1';
            $result['message'] = 'Pesan anda berhasil disimpan dan akan segera dikirim.';
		}
		
		echo json_encode($result);
	}
	
	function convert() {
		$this->load->library('mpdf');
		$this->mpdf->WriteHTML('Cetak di PDF');
		$this->mpdf->Output();
	}
}