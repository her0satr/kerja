<?php
	$user = $this->User_model->get_session();
?>
<div class="header">
	<div class="left"><a href="<?php echo base_url('panel/home/dashboard'); ?>">Panel</a></div>
	<?php echo strtoupper($user['fullname']); ?>, <a href="<?php echo base_url('panel/home/logout'); ?>">Logout</a>
</div>