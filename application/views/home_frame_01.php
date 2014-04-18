<?php
	$skp = $this->widget_model->get_by_id(array( 'alias' => 'skp' ));
	$pegawai = $this->widget_model->get_by_id(array( 'alias' => 'pegawai' ));
	$absensi = $this->widget_model->get_by_id(array( 'alias' => 'absensi' ));
	$laporan_pegawai = $this->widget_model->get_by_id(array( 'alias' => 'laporan-pegawai' ));
?>

<html>
<head>
	<link rel="stylesheet" href="<?php echo base_url('static/js/slider/featured_slide.css'); ?>" type="text/css" />
	<script type="text/javascript" src="<?php echo base_url('static/js/slider/jquery-1.4.1.min.js'); ?>"></script>
	<script type="text/javascript" src="<?php echo base_url('static/js/slider/jquery.easing.1.3.js'); ?>"></script>
	<script type="text/javascript" src="<?php echo base_url('static/js/slider/jquery.hoverIntent.js'); ?>"></script>
	<script type="text/javascript" src="<?php echo base_url('static/js/slider/jquery.hslides.1.0.js'); ?>"></script>
</head>
<body>
<div id="featured_slide"><div class="wrapper"><div class="featured_content">
	<ul id="accordion">
		<li class="current">
			<div class="featured_box">
				<h2><?php echo $pegawai['title']; ?></h2>
				<p><?php echo $pegawai['content']; ?></p>
			</div>
			<div class="featured_tab"><img src="<?php echo base_url('static/img/slider/1.png'); ?>" alt="" />
				<p><?php echo $pegawai['title']; ?></p>
			</div>
		</li>
		<li>
			<div class="featured_box">
				<h2><?php echo $skp['title']; ?></h2>
				<p><?php echo $skp['content']; ?></p>
			</div>
			<div class="featured_tab"><img src="<?php echo base_url('static/img/slider/3.png'); ?>" alt="" />
				<p><?php echo $skp['title']; ?></p>
			</div>
        </li>
        <li>
			<div class="featured_box">
				<h2><?php echo $absensi['title']; ?></h2>
				<p><?php echo $absensi['content']; ?></p>
			</div>
			<div class="featured_tab"><img src="<?php echo base_url('static/img/slider/2.png'); ?>" alt="" />
				<p><?php echo $absensi['title']; ?></p>
			</div>
        </li>
        <li>
			<div class="featured_box">
				<h2><?php echo $laporan_pegawai['title']; ?></h2>
				<p><?php echo $laporan_pegawai['content']; ?></p>
			</div>
			<div class="featured_tab"><img src="<?php echo base_url('static/img/slider/4.png'); ?>" alt="" />
				<p><?php echo $laporan_pegawai['title']; ?></p>
			</div>
        </li>
	</ul>
</div></div></div>
<script>
// set accordion
$('#accordion').hSlides({
	totalWidth: 920,
	totalHeight: 250,
	minPanelWidth: 111,
	maxPanelWidth: 590,
	easing: "easeOutBack",
	activeClass: 'current'
});

// set link
$('a').attr('target', '_parent');
</script>
</body>
</html>