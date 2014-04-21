<?php
	// page
	$page_data['date_start'] = date("01-m-Y");
	$page_data['date_end'] = date("t-m-Y");
?>
<?php $this->load->view( 'common/meta', array( 'title' => 'Rekap Agenda Kerja' ) ); ?>

<body>
<?php $this->load->view( 'common/header'); ?>

<div class="content enlarged">
	<?php $this->load->view( 'common/sidebar'); ?>
	<div class="hide cnt-data"><?php echo json_encode($page_data); ?></div>
	
  	<div class="mainbar">
	    <div class="page-head">
			<h2 class="pull-left button-back">Rekap Agenda Kerja</h2>
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
						<div class="padd"><form class="form-horizontal" method="post" action="<?php echo base_url('kepegawaian/skp/rekap_agenda/download'); ?>">
							<input type="hidden" name="biodata_id" value="0" />
							
							<div class="form-group">
								<label class="col-lg-2 control-label">Nama Pegawai</label>
								<div class="col-lg-4 cnt-typeahead">
									<input type="text" name="biodata_title" class="form-control typeahead-biodata" placeholder="Nama Pegawai" />
								</div>
							</div>
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
									<button type="submit" class="btn btn-info">Download</button>
								</div>
							</div>
						</form></div>
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
	
	// typeahead
	var biodata_store = new Bloodhound({
		datumTokenizer: Bloodhound.tokenizers.obj.whitespace('nama'),
		queryTokenizer: Bloodhound.tokenizers.whitespace,
		prefetch: web.host + 'typeahead?action=biodata',
		remote: web.host + 'typeahead?action=biodata&namelike=%QUERY'
	});
	biodata_store.initialize();
	var biodata = $('.typeahead-biodata').typeahead(null, {
		name: 'biodata',
		displayKey: 'nama',
		source: biodata_store.ttAdapter(),
		templates: {
			empty: [
				'<div class="empty-message">',
				'no result found.',
				'</div>'
			].join('\n'),
			suggestion: Handlebars.compile('<p><strong>{{nama}}</strong></p>')
		}
	});
	biodata.on('typeahead:selected', function(evt, data) {
		$('#form-chart [name="biodata_id"]').val(data.id);
	});
	
	// form
	$('#form-chart form').validate({
		rules: {
			biodata_title: { required: true },
			date_start: { required: true },
			date_end: { required: true }
		}
	});
	$('#form-chart form').submit(function(e) {
		e.preventDefault();
		
		var param = Func.form.get_value('#form-chart');
		var link = web.host + 'kepegawaian/skp/rekap_agenda/download?biodata_id=' + param.biodata_id + '&date_start=' + param.date_start + '&date_end=' + param.date_end;
		window.open(link);
	});
});
</script>
</body>
</html>