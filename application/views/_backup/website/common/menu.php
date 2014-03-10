<?php
	$current_page = (!empty($this->uri->segments[1])) ? $this->uri->segments[1] : 'home';
	$page_data['current_page'] = $current_page;
?>
<div class="menu">
	<div class="cnt-menu hide"><?php echo json_encode($page_data); ?></div>
	<div><a data-link="home" href="<?php echo base_url(); ?>" class="active">Home / Wall</a></div>
	<div><a data-link="sales" href="<?php echo base_url('sales'); ?>">History penjualan sales / team</a></div>
	<div><a data-link="error" href="<?php echo base_url('error'); ?>">Data error / kekurangan uang muka</a></div>
	<div><a data-link="schedule" href="<?php echo base_url('schedule'); ?>">Jadwal Training / Meeting Dealer</a></div>
</div>
<script>
	$('.menu').find('.active').removeClass('active');
	var raw_data = $('.menu .cnt-menu').html();
	eval('var data = ' + raw_data);
	$('a[data-link="' + data.current_page + '"]').addClass('active');
</script>