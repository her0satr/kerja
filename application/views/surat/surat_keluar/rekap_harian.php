<?php
	// data
	$_POST['date_start'] = (empty($_POST['date_start'])) ? date("01-m-Y") : $_POST['date_start'];
	$_POST['date_end'] = (empty($_POST['date_end'])) ? date("t-m-Y") : $_POST['date_end'];
	
	// array surat
	$param_surat['date_start'] = ExchangeFormatDate($_POST['date_start']);
	$param_surat['date_end'] = ExchangeFormatDate($_POST['date_end']);
	$param_surat['limit'] = 100000;
	$array_surat = $this->surat_keluar_model->get_array($param_surat);
	
	// page
	$page_data['date_start'] = $_POST['date_start'];
	$page_data['date_end'] = $_POST['date_end'];
?>
<?php $this->load->view( 'common/meta', array( 'title' => 'Rekap Harian' ) ); ?>

<body>
<?php $this->load->view( 'common/header'); ?>

<div class="content enlarged">
	<?php $this->load->view( 'common/sidebar'); ?>
	<div class="hide cnt-data"><?php echo json_encode($page_data); ?></div>
	
  	<div class="mainbar">
	    <div class="page-head">
			<h2 class="pull-left button-back">Rekap Harian</h2>
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
				
				<div class="widget grid-main">
					<div class="widget-head">
						<div class="pull-left">&nbsp;</div>
						<div class="widget-icons pull-right">&nbsp;</div>
						<div class="clearfix"></div>
					</div>
					<div class="widget-content">
						<table id="datatable" class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th>No Urut</th>
									<th>No Surat</th>
									<th>Pengolah</th>
									<th>Tujuan</th>
									<th>Tanggal Surat</th>
								</tr>
							</thead>
							<tbody>
								<?php foreach($array_surat as $row) { ?>
								<tr>
									<td><?php echo $row['no_urut']; ?></td>
									<td><?php echo $row['no_surat']; ?></td>
									<td><?php echo $row['pengolah']; ?></td>
									<td><?php echo $row['tujuan']; ?></td>
									<td class="center"><?php echo GetFormatDate($row['tanggal_surat']); ?></td>
								</tr>
								<?php } ?>
							</tbody>
						</table>
						<div class="widget-foot">
							<br /><br />
							<div class="clearfix"></div> 
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
	
	// datatable
	$('#datatable').dataTable({ 'sPaginationType': 'full_numbers' });
});
</script>
</body>
</html>