<?php
	$user = $this->User_model->get_session();
	
	$_POST['date_start'] = (empty($_POST['date_start'])) ? date("01-m-Y") : $_POST['date_start'];
	$_POST['date_end'] = (empty($_POST['date_end'])) ? date("t-m-Y") : $_POST['date_end'];
	
	// additional filter for sales
	if ($user['user_type_id'] == USER_ID_SALES) {
		$param_rekap_sales['sales_id'] = $user['id'];
	}
	
	$param_rekap_sales['date_start'] = ExchangeFormatDate($_POST['date_start']);
	$param_rekap_sales['date_end'] = ExchangeFormatDate($_POST['date_end']);
	$array_rekap_sales = $this->Penjualan_model->get_rekap_sales($param_rekap_sales);
	
	// get total
	$total_unit = 0;
	foreach($array_rekap_sales as $row) {
		$total_unit += $row['value'];
	}
	
	$page_data['date_start'] = $_POST['date_start'];
	$page_data['date_end'] = $_POST['date_end'];
	$page_data['chart_data'] = $array_rekap_sales;
?>
<?php $this->load->view( 'panel/common/meta', array( 'title' => 'Penjualan Sales' ) ); ?>

<body>
<?php $this->load->view( 'panel/common/header'); ?>

<div class="content">
	<?php $this->load->view( 'panel/common/sidebar'); ?>
	<div class="hide cnt-data"><?php echo json_encode($page_data); ?></div>
	
  	<div class="mainbar">
	    <div class="page-head">
			<h2 class="pull-left button-back">Penjualan Sales</h2>
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
						<div class="pull-left">Chart Penjualan Sales</div>
						<div class="widget-icons pull-right">
							<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
							<a href="#" class="wclose"><i class="fa fa-times"></i></a>
						</div>  
						<div class="clearfix"></div>
					</div>
					
					<div class="widget-content">
						<div class="padd">
							<div id="chart-bar"></div>
							<?php if (!empty($total_unit)) { ?>
							<div style="text-align: center;">Total Penjualan : <?php echo $total_unit; ?> Unit</div>
							<?php } ?>
						</div>
					</div>
				</div>
			</div></div>
        </div></div>
    </div>
	<div class="clearfix"></div>
</div>

<?php $this->load->view( 'panel/common/footer' ); ?>
<?php $this->load->view( 'panel/common/library_js'); ?>

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
		Morris.Donut({
			element: 'chart-bar',
			data: page.data.chart_data,
			formatter: function (y) { return y + " Unit" }
		});
	} else {
		noty({ text: 'Tidak ada penjualan yang ditemukan', layout: 'topRight', type: 'warning', timeout: 1500 });
	}
});
</script>
</body>
</html>