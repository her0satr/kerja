<?php

class SYGAAS_Controller extends CI_Controller {
    function __construct() {
        parent::__construct();
		$this->user_model->required_login();
    }
}