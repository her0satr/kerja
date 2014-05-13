<?php
	$surat_masuk = $this->widget_model->get_by_id(array( 'alias' => 'surat-masuk' ));
	$surat_keluar = $this->widget_model->get_by_id(array( 'alias' => 'surat-keluar' ));
	$nota_dinas = $this->widget_model->get_by_id(array( 'alias' => 'nota-dinas' ));
	$agenda_rapat = $this->widget_model->get_by_id(array( 'alias' => 'agenda-rapat' ));
	$tambahan_surat = $this->widget_model->get_by_id(array( 'alias' => 'tambahan-surat' ));
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

<style>
#accordion li { width: 550px; }
#accordion .featured_box { width: 395px; }
#accordion .featured_tab { width: 80px; }
#accordion .featured_tab div { width: 80%; text-align: center; }
#accordion .featured_tab img { display: inline; width: 100%; text-align: center; }
#accordion .featured_tab p { padding: 0px 5px; }
</style>

<div id="featured_slide"><div class="wrapper"><div class="featured_content">
	<ul id="accordion">
		<li class="current">
			<div class="featured_box">
				<h2><?php echo $surat_masuk['title']; ?></h2>
				<p><?php echo $surat_masuk['content']; ?></p>
				<p class="readmore">
                <a target="_parent" href="<?php echo base_url('surat/surat_masuk/home'); ?>">Surat Masuk &raquo;</a>
                </p>
			</div>
			<div class="featured_tab">
				<div><img src="<?php echo base_url('static/img/slider/surat_masuk.png'); ?>" alt="" /></div>
				<p><?php echo $surat_masuk['title']; ?></p>
			</div>
		</li>
        <li>
			<div class="featured_box">
				<h2><?php echo $surat_keluar['title']; ?></h2>
				<p><?php echo $surat_keluar['content']; ?></p>
				<p class="readmore">
                <a target="_parent" href="<?php echo base_url('surat/surat_keluar/home'); ?>">Surat Keluar &raquo;</a>
                </p>
			</div>
			<div class="featured_tab">
				<img src="<?php echo base_url('static/img/slider/surat_keluar.png'); ?>" alt="" />
				<p><?php echo $surat_keluar['title']; ?></p>
			</div>
        </li>
		<li>
			<div class="featured_box">
				<h2><?php echo $nota_dinas['title']; ?></h2>
				<p><?php echo $nota_dinas['content']; ?></p>
				<p class="readmore">
                <a target="_parent" href="<?php echo base_url('surat/nota_dinas/home'); ?>">Nota Dinas &raquo;</a>
                </p>
			</div>
			<div class="featured_tab">
				<img src="<?php echo base_url('static/img/slider/nota_dinas.png'); ?>" alt="" />
				<p><?php echo $nota_dinas['title']; ?></p>
			</div>
        </li>
        <li>
			<div class="featured_box">
				<h2><?php echo $agenda_rapat['title']; ?></h2>
				<p><?php echo $agenda_rapat['content']; ?></p>
				<p class="readmore">
                <a target="_parent" href="<?php echo base_url('surat/agenda_rapat/home'); ?>">Agenda Rapat &raquo;</a>
                </p>
			</div>
			<div class="featured_tab">
				<img src="<?php echo base_url('static/img/slider/agenda_rapat.png'); ?>" alt="" />
				<p><?php echo $agenda_rapat['title']; ?></p>
			</div>
        </li>
        <li>
			<div class="featured_box">
				<h2><?php echo $tambahan_surat['title']; ?></h2>
				<p><?php echo $tambahan_surat['content']; ?></p>
				<p class="readmore">
                SURAT MASUK &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NOTA DINAS<br />
                <a target="_parent" href="<?php echo base_url('surat/surat_masuk/rekap_harian'); ?>">Rekap Harian &raquo;</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; <a target="_parent" href="<?php echo base_url('surat/nota_dinas/rekap_harian'); ?>">Rekap Harian &raquo;</a> <br /> 
                <a target="_parent" href="<?php echo base_url('surat/surat_masuk/rekap_bulanan'); ?>">Rekap Bulanan &raquo;</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a target="_parent" href="<?php echo base_url('surat/nota_dinas/rekap_bulanan'); ?>">Rekap Bulanan &raquo;</a> <br />
                <a target="_parent" href="<?php echo base_url('surat/surat_masuk/rekap_tahunan'); ?>">Rekap Tahunan &raquo;</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a target="_parent" href="<?php echo base_url('surat/nota_dinas/rekap_tahunan'); ?>">Rekap Tahunan &raquo;</a> <br />
                <a target="_parent" href="<?php echo base_url('surat/surat_masuk/rekap_posisi'); ?>">Rekap Posisi &raquo;</a> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <br />

<br />
                SURAT KELUAR &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AGENDA RAPAT<br />
                <a target="_parent" href="<?php echo base_url('surat/surat_keluar/rekap_harian'); ?>">Rekap Harian</a> 
                <a target="_parent" href="<?php echo base_url('surat/surat_keluar/rekap_bulanan'); ?>"> | Bulanan</a>
                <a target="_parent" href="<?php echo base_url('surat/surat_keluar/rekap_tahunan'); ?>"> | Tahunan</a>
                &nbsp;&nbsp;&nbsp; <a target="_parent" href="<?php echo base_url('surat/agenda_rapat/rekap'); ?>">Rekap Agenda Rapat</a> <br />
                
                
                </p>
			</div>
			<div class="featured_tab">
				<img src="<?php echo base_url('static/img/slider/4.png'); ?>" alt="" />
				<p><?php echo $tambahan_surat['title']; ?></p>
			</div>
        </li>
	</ul>
</div></div></div>
<script>
// set accordion
$('#accordion').hSlides({
	totalWidth: 920,
	totalHeight: 250,
	minPanelWidth: 80,
	maxPanelWidth: 540,
	easing: "easeOutBack",
	activeClass: 'current'
});

// set link
$('a').attr('target', '_parent');
</script>
</body>
</html>