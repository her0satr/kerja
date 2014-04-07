<?php
	$user = $this->user_model->get_session();
	
	$summary_total = array(
		'pegawai' => $this->biodata_model->get_count( array( 'is_query' => true ) ),
		'skp' => $this->kegiatan_skp_model->get_count( array( 'is_query' => true ) ),
		'absensi_masuk' => $this->absensi_masuk_model->get_count( array( 'is_query' => true ) ),
		'surat_masuk' => $this->surat_masuk_model->get_count( array( 'is_query' => true ) ),
		'surat_keluar' => $this->surat_keluar_model->get_count( array( 'is_query' => true ) ),
		'nota_dinas' => $this->nota_dinas_model->get_count( array( 'is_query' => true ) ),
		'agenda_rapat' => $this->agenda_rapat_model->get_count( array( 'is_query' => true ) )
	);
	
	// user type
	$page_data['USER_ID_TU'] = USER_ID_TU;
	$page_data['USER_ID_ADMINISTRATOR'] = USER_ID_ADMINISTRATOR;
	
	$page_data['user_type_id'] = $user['user_type_id'];
	$page_data['array_rekap_yearly'] = $this->surat_masuk_model->get_rekap_yearly();
?>
<?php $this->load->view( 'common/meta', array( 'title' => 'Selamat Datang' ) ); ?>

<body>
<?php $this->load->view( 'common/header'); ?>

<style>
.well h2 { padding: 0px; margin: 0px; line-height: 20px; }
.well h2 span { font-size: 20px; }

#main-menu .bg-info a img { margin: 0 10px 10px 10px; }
</style>

<div class="content">
	<?php $this->load->view( 'common/sidebar'); ?>
	<div class="hide">
		<div class="cnt-data"><?php echo json_encode($page_data); ?></div>
	</div>
	
  	<div class="mainbar">
	    <div class="page-head">
			<h2 class="pull-left">Selamat Datang</h2>
			<div class="clearfix"></div>
		</div>
		
	    <div class="matter"><div class="container">
            <div class="row"><div class="col-md-12">
				
				<div class="widget" id="main-menu">
					<ul class="info-blocks">
						<li class="bg-info cnt-administrasi-kepegawaian" style="display: none;">
							<div class="top-info">
								<a>Administrasi</a>
							</div>
							<a class="cursor show-kepegawaian"><img src="<?php echo base_url('static/img/icons/icon-pegawai.png'); ?>" /></a>
							<span class="bottom-info bg-primary">Kepegawaian</span>
						</li>
						<li class="bg-info cnt-administrasi-persuratan" style="display: none;">
							<div class="top-info">
								<a>Administrasi</a>
							</div>
							<a class="cursor show-persuratan"><img src="<?php echo base_url('static/img/icons/icon-surat.png'); ?>" /></a>
							<span class="bottom-info bg-primary">Persuratan</span>
						</li>
						<li class="bg-info cnt-biodata" style="display: none;">
							<div class="top-info">
								<a>Management</a>
							</div>
							<a href="<?php echo base_url('kepegawaian/biodata'); ?>"><img src="<?php echo base_url('static/img/icons/icon-pegawai.png'); ?>" /></a>
							<span class="bottom-info bg-primary">Biodata</span>
						</li>
						<li class="bg-info cnt-absensi" style="display: none;">
							<div class="top-info">
								<a>Management</a>
							</div>
							<a href="<?php echo base_url('kepegawaian/absensi/masuk'); ?>"><img src="<?php echo base_url('static/img/icons/icon-absensi.png'); ?>" /></a>
							<span class="bottom-info bg-primary">Absensi</span>
						</li>
						<li class="bg-info cnt-skp" style="display: none;">
							<div class="top-info">
								<a>Management</a>
							</div>
							<a href="<?php echo base_url('kepegawaian/skp/home'); ?>"><img src="<?php echo base_url('static/img/icons/icon-skp.png'); ?>" /></a>
							<span class="bottom-info bg-primary">Kegiatan Harian / SKP</span>
						</li>
						<li class="bg-info cnt-report" style="display: none;">
							<div class="top-info">
								<a>Management</a>
							</div>
							<a href="<?php echo base_url('kepegawaian/report'); ?>"><img src="<?php echo base_url('static/img/icons/icon-report.png'); ?>" /></a>
							<span class="bottom-info bg-primary">Report</span>
						</li>
						<li class="bg-info cnt-surat-masuk" style="display: none;">
							<div class="top-info">
								<a>Management</a>
							</div>
							<a href="<?php echo base_url('surat/surat_masuk/home'); ?>"><img src="<?php echo base_url('static/img/icons/icon-surat-masuk.png'); ?>" /></a>
							<span class="bottom-info bg-primary">Surat Masuk</span>
						</li>
						<li class="bg-info cnt-surat-keluar" style="display: none;">
							<div class="top-info">
								<a>Management</a>
							</div>
							<a href="<?php echo base_url('surat/surat_keluar/home'); ?>"><img src="<?php echo base_url('static/img/icons/icon-surat-keluar.png'); ?>" /></a>
							<span class="bottom-info bg-primary">Surat Keluar</span>
						</li>
						<li class="bg-info cnt-nota-dinas" style="display: none;">
							<div class="top-info">
								<a>Management</a>
							</div>
							<a href="<?php echo base_url('surat/nota_dinas/home'); ?>"><img src="<?php echo base_url('static/img/icons/icon-nota-dinas.png'); ?>" /></a>
							<span class="bottom-info bg-primary">Nota Dinas</span>
						</li>
						<li class="bg-info cnt-agenda-rapat" style="display: none;">
							<div class="top-info">
								<a>Management</a>
							</div>
							<a href="<?php echo base_url('surat/agenda_rapat/home'); ?>"><img src="<?php echo base_url('static/img/icons/icon-agenda-rapat.png'); ?>" /></a>
							<span class="bottom-info bg-primary">Agenda Rapat</span>
						</li>
					</ul>
					<div class="center cnt-action" style="padding: 0 0 20px 0;">
						<a class="cursor btn-reload">
							<i class="fa fa-refresh" style="font-size: 35px;"></i><br />
							Refresh
						</a>
					</div>
				</div>
				
				<div class="page-head">
					<h4 class="pull-left">Management Pegawai</h4>
					<div class="clearfix"></div>
				</div>
				<div class="widget" style="min-width: 920px; padding: 10px;">
					<div style="width: 920px; height: 250px; margin: 0px auto;">
						<iframe src="<?php echo base_url('home/frame/01'); ?>" scrolling="no" frameBorder="0" style="width: 920px; height: 250px;"></iframe>
					</div>
				</div>
				
				<?php if (in_array($user['user_type_id'], array(USER_ID_TU, USER_ID_ADMINISTRATOR))) { ?>
				<div class="page-head">
					<h4 class="pull-left">Management Surat</h4>
					<div class="clearfix"></div>
				</div>
				<div class="widget" style="min-width: 920px; padding: 10px;">
					<div style="width: 920px; height: 250px; margin: 0px auto;">
						<iframe src="<?php echo base_url('home/frame/02'); ?>" scrolling="no" frameBorder="0" style="width: 920px; height: 250px;"></iframe>
					</div>
				</div>
				<?php } ?>
				
				<div class="widget hide">
					<ul class="info-blocks">
						<?php if (in_array($user['user_type_id'], array(USER_ID_TU, USER_ID_ADMINISTRATOR))) { ?>
						<li class="bg-primary">
							<div class="top-info">
								<a href="<?php echo base_url('kepegawaian/biodata'); ?>">Tambah Pegawai</a>
								<small>Management</small>
							</div>
							<a href="<?php echo base_url('kepegawaian/biodata'); ?>"><i class="fa fa-user"></i></a>
							<span class="bottom-info bg-danger"><?php echo $summary_total['pegawai']; ?> total Pegawai</span>
						</li>
						<?php } ?>
						<li class="bg-success">
							<div class="top-info">
								<a href="<?php echo base_url('kepegawaian/skp/home'); ?>">Tambah SKP</a>
								<small>Management</small>
							</div>
							<a href="<?php echo base_url('kepegawaian/skp/home'); ?>"><i class="fa fa-book"></i></a>
							<span class="bottom-info bg-primary"><?php echo $summary_total['pegawai']; ?> total SKP</span>
						</li>
						<li class="bg-danger">
							<div class="top-info">
								<a href="<?php echo base_url('kepegawaian/absensi/masuk'); ?>">Tambah Absensi</a>
								<small>Management</small>
							</div>
							<a href="<?php echo base_url('kepegawaian/absensi/masuk'); ?>"><i class="fa fa-list-ol"></i></a>
							<span class="bottom-info bg-primary"><?php echo $summary_total['absensi_masuk']; ?> total Absensi Masuk</span>
						</li>
					</ul>
				</div>
				
				<?php if (in_array($user['user_type_id'], array(USER_ID_TU, USER_ID_ADMINISTRATOR))) { ?>
				<div class="widget hide">
					<ul class="info-blocks">
						<li class="bg-info">
							<div class="top-info">
								<a href="<?php echo base_url('surat/surat_masuk/home'); ?>">Surat Masuk</a>
								<small>Management</small>
							</div>
							<a href="<?php echo base_url('surat/surat_masuk/home'); ?>"><i class="fa fa-file-text"></i></a>
							<span class="bottom-info bg-primary"><?php echo $summary_total['surat_masuk']; ?> total Surat Masuk</span>
						</li>
						<li class="bg-warning">
							<div class="top-info">
								<a href="<?php echo base_url('surat/surat_keluar/home'); ?>">Surat Keluar</a>
								<small>Management</small>
							</div>
							<a href="<?php echo base_url('surat/surat_keluar/home'); ?>"><i class="fa fa-file-text"></i></a>
							<span class="bottom-info bg-primary"><?php echo $summary_total['surat_keluar']; ?> total Surat Keluar</span>
						</li>
						<li class="bg-primary">
							<div class="top-info">
								<a href="<?php echo base_url('surat/nota_dinas/home'); ?>">Nota Dinas</a>
								<small>Management</small>
							</div>
							<a href="<?php echo base_url('surat/nota_dinas/home'); ?>"><i class="fa fa-ticket"></i></a>
							<span class="bottom-info bg-danger"><?php echo $summary_total['nota_dinas']; ?> total Nota Dinas</span>
						</li>
						<li class="bg-success">
							<div class="top-info">
								<a href="<?php echo base_url('surat/agenda_rapat/home'); ?>">Agenda Rapat</a>
								<small>Management</small>
							</div>
							<a href="<?php echo base_url('surat/agenda_rapat/home'); ?>"><i class="fa fa-tasks"></i></a>
							<span class="bottom-info bg-primary"><?php echo $summary_total['agenda_rapat']; ?> total Agenda Rapat</span>
						</li>
					</ul>
				</div>
				<?php } ?>
				
				<div class="widget hide">
					<div class="widget-head">
						<div class="pull-left">Rekap Surat Masuk 12 Bulan Terakhir</div>
						<div class="widget-icons pull-right">
							<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
							<a href="#" class="wclose"><i class="fa fa-times"></i></a>
						</div>  
						<div class="clearfix"></div>
					</div>
					<div class="widget-content">
						<div class="padd">
							<div id="chart-summary"></div>
						</div>
					</div>
				</div>
				
			</div></div>
        </div></div>
    </div>
	<div class="clearfix"></div>
</div>

<?php $this->load->view( 'common/footer' ); ?>
<?php $this->load->view( 'common/library_js'); ?>

<script>
$(document).ready(function() {
	var page = {
		init: function() {
			var temp = $('.cnt-data').html();
			eval('var data = ' + temp);
			page.data = data;
			
			// load main menu
			page.menu.reload();
		},
		menu: {
			reload: function() {
				$('#main-menu li').hide();
				if (Func.in_array(page.data.user_type_id, [page.data.USER_ID_TU, page.data.USER_ID_ADMINISTRATOR])) {
					$('#main-menu .cnt-administrasi-kepegawaian').show();
					$('#main-menu .cnt-administrasi-persuratan').show();
				} else {
					$('#main-menu .cnt-biodata').show();
					$('#main-menu .cnt-absensi').show();
					$('#main-menu .cnt-skp').show();
					$('#main-menu .cnt-action').hide();
				}
			}
		}
	}
	page.init();
	
	// main menu
	$('#main-menu .btn-reload').click(function() {
		page.menu.reload();
	});
	$('#main-menu .show-kepegawaian').click(function() {
		$('#main-menu li').hide();
		$('#main-menu .cnt-biodata').show();
		$('#main-menu .cnt-absensi').show();
		$('#main-menu .cnt-skp').show();
		$('#main-menu .cnt-report').show();
	});
	$('#main-menu .show-persuratan').click(function() {
		$('#main-menu li').hide();
		$('#main-menu .cnt-surat-masuk').show();
		$('#main-menu .cnt-surat-keluar').show();
		$('#main-menu .cnt-nota-dinas').show();
		$('#main-menu .cnt-agenda-rapat').show();
	});
	
	// chart
	Morris.Bar({
		element: 'chart-summary',
		data: page.data.array_rekap_yearly,
		xkey: 'label',
		ykeys: ['total'],
		labels: ['label'],
		barRatio: 0.4,
		xLabelAngle: 35,
		hideHover: 'auto'
	});
});
</script>
</body>
</html>