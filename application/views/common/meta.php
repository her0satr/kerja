<?php
	$web['host'] = base_url();
	
	$title = (isset($title)) ? $title : 'Login';
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<title><?php echo $title; ?></title>
	
	<meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link rel="stylesheet" href="<?php echo base_url('static/css/bootstrap.css'); ?>" />
	<link rel="stylesheet" href="<?php echo base_url('static/css/font-awesome.css'); ?>" />
	<link rel="stylesheet" href="<?php echo base_url('static/css/style.css'); ?>" />
	<link rel="stylesheet" href="<?php echo base_url('static/css/bootstrap-responsive.css'); ?>" />
	<link rel="stylesheet" href="<?php echo base_url('static/css/jquery-ui-1.9.2.custom.min.css'); ?>" />
	<link rel="stylesheet" href="<?php echo base_url('static/css/fullcalendar.css'); ?>" />
	<link rel="stylesheet" href="<?php echo base_url('static/css/prettyPhoto.css'); ?>" />
	<link rel="stylesheet" href="<?php echo base_url('static/css/rateit.css'); ?>" />
	<link rel="stylesheet" href="<?php echo base_url('static/css/bootstrap-datetimepicker.min.css'); ?>" />
	<link rel="stylesheet" href="<?php echo base_url('static/css/jquery.cleditor.css'); ?>" />
	<link rel="stylesheet" href="<?php echo base_url('static/css/uniform.default.css'); ?>" />
	<link rel="stylesheet" href="<?php echo base_url('static/css/daterangepicker-bs3.css'); ?>" />
	<link rel="stylesheet" href="<?php echo base_url('static/css/bootstrap-switch.css'); ?>" />
	<link rel="stylesheet" href="<?php echo base_url('static/js/datatables/css/dataTables.bootstrap.css'); ?>" />
	<link rel="stylesheet" href="<?php echo base_url('static/css/widgets.css'); ?>" />
	<link rel="stylesheet" href="<?php echo base_url('static/css/jquery.gritter.css'); ?>" />
	<link rel="stylesheet" href="<?php echo base_url('static/css/tree.css'); ?>" />
	
	<link rel="shortcut icon" href="<?php echo base_url('static/img/favicon/favicon.png'); ?>" />
	
	<!-- HTML5 Support for IE -->
	<!--[if lt IE 9]>
	<script src="js/html5shim.js"></script>
	<![endif]-->
	
	<script>var web = <?php echo json_encode($web); ?></script>
	<script src="<?php echo base_url('static/js/jquery.js'); ?>"></script>
</head>