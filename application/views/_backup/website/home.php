<?php
	$array_event = $this->Event_model->get_array();
?>
<?php $this->load->view( 'website/common/meta' ); ?>
<body>
	<?php $this->load->view( 'website/common/header' ); ?>
	<?php $this->load->view( 'website/common/menu' ); ?>
	
	<div class="content">
		<div class="event">
			<div class="main-title"><div class="pad">EVENT TERBARU</div></div>
			<?php foreach ($array_event as $row) { ?>
			<div class="item">
				<div class="pad">
					<img src="<?php echo $row['thumbnail_link']; ?>" />
					<div class="title"><?php echo $row['name']; ?></div>
					<div class="desc"><?php echo $row['content']; ?></div>
					<div class="clear"></div>
				</div>
			</div>
			<?php } ?>
			<div class="clear"></div>
		</div>
		<div class="gallery">
			<div class="main-title"><div class="pad">GALLERY</div></div>
			<div class="item"><div class="limit"><img src="<?php echo base_url('static/img/motorcycle01.jpg'); ?>" /></div></div>
			<div class="item"><div class="limit"><img src="<?php echo base_url('static/img/motorcycle02.jpg'); ?>" /></div></div>
			<div class="item"><div class="limit"><img src="<?php echo base_url('static/img/motorcycle03.jpg'); ?>" /></div></div>
			<div class="item"><div class="limit"><img src="<?php echo base_url('static/img/motorcycle04.jpg'); ?>" /></div></div>
		</div>
	</div>
	<div class="clear"></div>
</body>