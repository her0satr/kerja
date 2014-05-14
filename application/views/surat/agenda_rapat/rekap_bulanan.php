<?php
	// data
	$_POST['date_select'] = (empty($_POST['date_select'])) ? date("m-Y") : $_POST['date_select'];
	
	// array surat
	list($param_surat['month'], $param_surat['year']) = explode('-', $_POST['date_select']);
	$param_surat['limit'] = 100000;
	$array_surat = $this->agenda_rapat_model->get_array($param_surat);
	
	// page
	$page_data['date_select'] = $_POST['date_select'];
?>
<?php $this->load->view( 'common/meta', array( 'title' => 'Rekap Bulanan' ) ); ?>

<body>
<?php $this->load->view( 'common/header'); ?>

<div class="content enlarged">
	<?php $this->load->view( 'common/sidebar'); ?>
	<div class="hide cnt-data"><?php echo json_encode($page_data); ?></div>
	
  	<div class="mainbar">
	    <div class="page-head">
			<h2 class="pull-left button-back">Rekap Bulanan</h2>
			<div class="clearfix"></div>
		</div>
		
	    <div class="matter"><div class="container">
            <div class="row"><div class="col-md-12">
				
				<div class="widget" id="form-search">
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
							<input type="hidden" name="action" value="chart_data" />
							
							<div class="form-group">
								<label class="col-lg-2 control-label">Bulan Tahun</label>
								<div class="col-lg-10">
									<div class="input-append datepicker">
										<input name="date_select" type="text" class="form-control dtpicker" placeholder="Bulan Tahun" data-format="MM-yyyy" />
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
					<div class="widget-content"><div class="padd">
						<div id="cnt-chart"></div>
					</div></div>
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
									<th>No Surat</th>
									<th>Leading Sektor</th>
									<th>Acara</th>
									<th>Tanggal Undangan</th>
									<th>Tempat</th>
								</tr>
							</thead>
							<tbody>
								<?php foreach($array_surat as $row) { ?>
								<tr>
									<td><?php echo $row['no_surat']; ?></td>
									<td><?php echo $row['leading_sektor']; ?></td>
									<td><?php echo $row['acara']; ?></td>
									<td class="center"><?php echo GetFormatDate($row['tanggal_undangan']); ?></td>
									<td><?php echo $row['tempat']; ?></td>
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
			$('[name="date_select"]').val(page.data.date_select);
			
			// render chart
			page.render_chart();
		},
		render_chart: function() {
			// clean container
			$('#cnt-chart').html('');
			
			// get data
			Func.ajax({ url: web.host + 'surat/agenda_rapat/rekap_bulanan/action', param: Func.form.get_value('form-search'), callback: function(result) {
				Morris.Line({
					parseTime: false,
					element: 'cnt-chart',
					data: result,
					xkey: 'date',
					ykeys: [ 'total' ],
					labels: [ 'Jumlah' ]
				});
			} });
		}
	}
	page.init();
	
	// search
	$('#form-search form').validate({
		rules: {
			date_select: { required: true }
		}
	});
	
	// datatable
	$('#datatable').dataTable({ 'sPaginationType': 'full_numbers' });
});
</script>
</body>
</html>