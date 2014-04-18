<?php
	$surat_masuk = $this->widget_model->get_by_id(array( 'alias' => 'surat-masuk' ));
	$surat_keluar = $this->widget_model->get_by_id(array( 'alias' => 'surat-keluar' ));
	$nota_dinas = $this->widget_model->get_by_id(array( 'alias' => 'nota-dinas' ));
	$agenda_rapat = $this->widget_model->get_by_id(array( 'alias' => 'agenda-rapat' ));
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
				<h2><?php echo $surat_masuk['title']; ?></h2>
				<p><?php echo $surat_masuk['content']; ?></p>
			</div>
			<div class="featured_tab"><img src="<?php echo base_url('static/img/slider/1.png'); ?>" alt="" />
				<p><?php echo $surat_masuk['title']; ?></p>
			</div>
		</li>
        <li>
			<div class="featured_box">
				<h2><?php echo $surat_keluar['title']; ?></h2>
				<p><?php echo $surat_keluar['content']; ?></p>
			</div>
			<div class="featured_tab"><img src="<?php echo base_url('static/img/slider/2.png'); ?>" alt="" />
				<p><?php echo $surat_keluar['title']; ?></p>
			</div>
        </li>
		<li>
			<div class="featured_box">
				<h2><?php echo $nota_dinas['title']; ?></h2>
				<p><?php echo $nota_dinas['content']; ?></p>
			</div>
			<div class="featured_tab"><img src="<?php echo base_url('static/img/slider/3.png'); ?>" alt="" />
				<p><?php echo $nota_dinas['title']; ?></p>
			</div>
        </li>
        <li>
			<div class="featured_box">
				<h2><?php echo $agenda_rapat['title']; ?></h2>
				<p><?php echo $agenda_rapat['content']; ?></p>
			</div>
			<div class="featured_tab"><img src="<?php echo base_url('static/img/slider/4.png'); ?>" alt="" />
				<p><?php echo $agenda_rapat['title']; ?></p>
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