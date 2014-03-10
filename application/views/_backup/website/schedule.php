<?php
	$array_schedule = $this->Schedule_model->get_array();
?>
<?php $this->load->view( 'website/common/meta' ); ?>
<body>
	<?php $this->load->view( 'website/common/header' ); ?>
	<?php $this->load->view( 'website/common/menu' ); ?>
	
	<div class="content">
		<div class="schedule">
			<div class="main-title"><div class="pad">JADWAL TRAINING / MEETING DEALER</div></div>
			<?php foreach ($array_schedule as $row) { ?>
			<div class="item">
				<div class="title"><?php echo $row['name']; ?></div>
				<div class="desc">Tanggal : <?php echo GetFormatDate($row['schedule_time'], array( 'FormatDate' => 'l, j F Y', 'replace_indo' => true )); ?></div>
				<div class="desc">Waktu : <?php echo $row['schedule_time_only']; ?></div>
				<div class="desc">Tempat : <?php echo $row['location']; ?></div>
				<div class="clear"></div>
			</div>
			<?php } ?>
		</div>
	</div>
	<div class="clear"></div>
</body>