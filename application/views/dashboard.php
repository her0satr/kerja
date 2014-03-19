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
	
	$page_data['user_type_id'] = $user['user_type_id'];
	$page_data['array_rekap_yearly'] = $this->surat_masuk_model->get_rekap_yearly();
?>
<?php $this->load->view( 'common/meta', array( 'title' => 'Selamat Datang' ) ); ?>

<body>
<?php $this->load->view( 'common/header'); ?>

<style>
.well h2 { padding: 0px; margin: 0px; line-height: 20px; }
.well h2 span { font-size: 20px; }
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
				
				<div class="widget">
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
				<div class="widget">
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
				
				<div class="widget">
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
		}
	}
	page.init();
	
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