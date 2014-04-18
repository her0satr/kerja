<?php
	$_POST['date_start'] = (empty($_POST['date_start'])) ? date("01-m-Y") : $_POST['date_start'];
	$_POST['date_end'] = (empty($_POST['date_end'])) ? date("t-m-Y") : $_POST['date_end'];
	
	$param_rekap_penjualan['date_start'] = ExchangeFormatDate($_POST['date_start']);
	$param_rekap_penjualan['date_end'] = ExchangeFormatDate($_POST['date_end']);
	$array_rekap_penjualan = $this->surat_keluar_model->get_rekap_filter($param_rekap_penjualan);
	
	$page_data['date_start'] = $_POST['date_start'];
	$page_data['date_end'] = $_POST['date_end'];
	$page_data['chart_data'] = $array_rekap_penjualan;
?>
<?php $this->load->view( 'common/meta', array( 'title' => 'Rekap Surat Keluar' ) ); ?>

<body>
<?php $this->load->view( 'common/header'); ?>

<div class="content enlarged">
	<?php $this->load->view( 'common/sidebar'); ?>
	<div class="hide cnt-data"><?php echo json_encode($page_data); ?></div>
	
  	<div class="mainbar">
	    <div class="page-head">
			<h2 class="pull-left button-back">Rekap Surat Keluar</h2>
			<div class="clearfix"></div>
		</div>
		
	    <div class="matter"><div class="container">
            <div class="row"><div class="col-md-12">

				<div class="widget" id="form-chart">
					<div class="widget-head">
						<div class="pull-left">Pencarian</div>
						<div class="widget-icons pull-right">
							<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
							<a href="#" class="wclose"><i class="fa fa-times"></i></a>
						</div>
						<div class="clearfix"></div>
					</div>
					
					<div class="widget-content">
						<div class="padd"><form class="form-horizontal" method="post">
							<div class="form-group">
								<label class="col-lg-2 control-label">Tanggal Mulai</label>
								<div class="col-lg-10">
									<div class="input-append datepicker">
										<input name="date_start" type="text" class="form-control dtpicker" placeholder="Tanggal Mulai" data-format="dd-MM-yyyy" />
										<span class="add-on"><i data-time-icon="fa fa-time" data-date-icon="fa fa-calendar" class="btn btn-info"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Tanggal Selesai</label>
								<div class="col-lg-10">
									<div class="input-append datepicker">
										<input name="date_end" type="text" class="form-control dtpicker" placeholder="Tanggal Selesai" data-format="dd-MM-yyyy" />
										<span class="add-on"><i data-time-icon="fa fa-time" data-date-icon="fa fa-calendar" class="btn btn-info"></i></span>
									</div>
								</div>
							</div>
							<hr />
							<div class="form-group">
								<div class="col-lg-offset-2 col-lg-9">
									<button type="submit" class="btn btn-info">Cari</button>
								</div>
							</div>
						</form></div>
					</div>
				</div>
				
				<div class="widget">
					<div class="widget-head">
						<div class="pull-left">Chart Rekap Surat Keluar</div>
						<div class="widget-icons pull-right">
							<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
							<a href="#" class="wclose"><i class="fa fa-times"></i></a>
						</div>  
						<div class="clearfix"></div>
					</div>
					
					<div class="widget-content">
						<div class="padd">
							<div id="chart-bar"></div>
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
			
			// set date
			$('[name="date_start"]').val(page.data.date_start);
			$('[name="date_end"]').val(page.data.date_end);
		}
	}
	page.init();
	
	if (page.data.chart_data.length > 0) {
		Morris.Bar({
			element: 'chart-bar',
			data: page.data.chart_data,
			xkey: 'label',
			ykeys: [ 'total' ],
			labels: [ 'Total' ]
		});
	} else {
		noty({ text: 'Tidak ada penjualan yang ditemukan', layout: 'topRight', type: 'warning', timeout: 1500 });
	}
});
</script>
</body>
</html>