<?php
	$user = $this->user_model->get_session();
	
	$summary_total = array(
		'pegawai' => $this->biodata_model->get_count( array( 'is_query' => true ) ),
		'surat_masuk' => $this->surat_masuk_model->get_count( array( 'is_query' => true ) ),
		'surat_keluar' => $this->surat_keluar_model->get_count( array( 'is_query' => true ) )
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
					<div class="widget-head">
						<div class="pull-left">Summary</div>
						<div class="widget-icons pull-right">
							<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
							<a href="#" class="wclose"><i class="fa fa-times"></i></a>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="widget-content">
						<div class="padd statement">
							<div class="row">
								<div class="col-md-4">
									<div class="well">
										<h2><?php echo $summary_total['pegawai']; ?><br /><span>Total Pegawai</span></h2>
									</div>
								</div>
								<div class="col-md-4">
									<div class="well">
										<h2><?php echo $summary_total['surat_masuk']; ?><br /><span>Total Surat Masuk</span></h2>
									</div>
								</div>
								<div class="col-md-4">
									<div class="well">
										<h2><?php echo $summary_total['surat_keluar']; ?><br /><span>Total Surat Keluar</span></h2>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
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