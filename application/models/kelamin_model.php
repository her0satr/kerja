<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class kelamin_model extends CI_Model {
    function __construct() {
        parent::__construct();
    }
	
    function get_array($param = array()) {
        $array = array(
			array( 'id' => 'Laki Laki', 'title' => 'Laki Laki' ),
			array( 'id' => 'Perempuan', 'title' => 'Perempuan' )
		);
		
        return $array;
    }
}