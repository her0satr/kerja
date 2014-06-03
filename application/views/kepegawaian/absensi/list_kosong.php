<?php
	// page data
	$page_data['current_date'] = $this->config->item('current_date');
?>
<?php $this->load->view( 'common/meta', array( 'title' => 'Rekap Absensi Tidak Masuk' ) ); ?>

<body>
<?php $this->load->view( 'common/header'); ?>

<div class="content enlarged">
	<?php $this->load->view( 'common/sidebar'); ?>
	<div class="hide">
		<div class="cnt-data"><?php echo json_encode($page_data); ?></div>
		<iframe name="iframe_upload_file" src="<?php echo base_url('upload?callback=set_upload_file'); ?>"></iframe>
	</div>
	
  	<div class="mainbar">
	    <div class="page-head">
			<h2 class="pull-left button-back">Rekap Absensi Tidak Masuk</h2>
			<div class="clearfix"></div>
		</div>
		
	    <div class="matter"><div class="container">
            <div class="row"><div class="col-md-12">
				
				<div class="widget">
					<div class="widget-content" style="padding: 20px 20px 0 20px;">
						<form class="form-horizontal" method="post" id="form-search">
							<div class="form-group">
								<label class="col-lg-2 control-label">Tanggal</label>
								<div class="col-lg-5">
									<div class="input-append datepicker">
										<input name="tanggal" type="text" class="form-control dtpicker" placeholder="Tanggal" data-format="dd-MM-yyyy" />
										<span class="add-on"><i data-time-icon="fa fa-time" data-date-icon="fa fa-calendar" class="btn btn-info"></i></span>
									</div>
								</div>
								<div class="col-lg-3">
									<button type="submit" class="btn btn-info">Cari</button>
									<button type="button" class="btn btn-info btn-absensi-add">Tambah</button>
								</div>
							</div>
						</form>
					</div>
				</div>
				
				<div class="widget grid-main">
					<div class="widget-head">
						<div class="pull-left">Status dengan Keterangan</div>
						<div class="widget-icons pull-right">
							<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
							<a href="#" class="wclose"><i class="fa fa-times"></i></a>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="widget-content">
						<table id="datatable" class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th class="center">Nama</th>
									<th class="center">Tanggal</th>
									<th class="center">Status</th>
									<th class="center">Keterangan</th>
									<th class="center">Control</th></tr>
							</thead>
							<tbody></tbody>
						</table>
						<div class="widget-foot">
							<br /><br />
							<div class="clearfix"></div> 
						</div>
					</div>
				</div>
				
				<div class="widget grid-main">
					<div class="widget-head">
						<div class="pull-left">Status tanpa Keterangan</div>
						<div class="widget-icons pull-right">
							<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
							<a href="#" class="wclose"><i class="fa fa-times"></i></a>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="widget-content">
						<table id="datatable-no-absense" class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th class="center">Nama</th>
									<th class="center">Tanggal</th></tr>
							</thead>
							<tbody></tbody>
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
	
	<div id="form-absensi" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"><div class="modal-dialog modal-dialog-big"><div class="modal-content"><form>
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h4 class="modal-title">Form Absensi</h4>
		</div>
		<div class="modal-body"><div class="widget-content">
			<div class="padd"><div class="form-horizontal">
				<input type="hidden" name="action" value="update" />
				<input type="hidden" name="id" value="0" />
				<input type="hidden" name="biodata_id" value="0" />
				
				<div class="form-group">
					<label class="col-lg-2 control-label">Nama Pegawai</label>
					<div class="col-lg-10 cnt-typeahead">
						<input type="text" name="biodata_title" class="form-control typeahead-biodata" placeholder="Nama Pegawai" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-2 control-label">Tanggal</label>
					<div class="col-lg-10">
						<div class="input-append datepicker">
							<input name="tanggal" type="text" class="form-control dtpicker" placeholder="Tanggal" data-format="dd-MM-yyyy" />
							<span class="add-on"><i data-time-icon="fa fa-time" data-date-icon="fa fa-calendar" class="btn btn-info"></i></span>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-2 control-label">Status</label>
					<div class="col-lg-10">
						<select class="form-control" name="status_kosong">
							<option value="Ijin">Ijin</option>
							<option value="Cuti">Cuti</option>
							<option value="Sakit">Sakit</option>
							<option value="DL">DL</option>
							<option value="DD">DD</option>
							<option value="TB">TB</option>
							<option value="MPP">MPP</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-2 control-label">Keterangan</label>
					<div class="col-lg-10">
						<input type="text" name="keterangan" class="form-control" placeholder="Keterangan" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-2 control-label">File</label>
					<div class="col-lg-5">
						<input type="text" name="upload_file" class="form-control" placeholder="File" />
					</div>
					<div class="col-lg-2">
						<input type="button" class="btn btn-primary btn-browse-upload-file" value="Browse" />
					</div>
				</div>
				
			</div></div>
		</div></div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal" aria-hidden="true">Close</button>
			<button type="submit" class="btn btn-primary">Save changes</button>
		</div>
	</form></div></div></div>
</div>

<?php $this->load->view( 'common/footer' ); ?>
<?php $this->load->view( 'common/library_js'); ?>

<script>
$(document).ready(function() {
	var page = {
		init: function() {
			var raw = $('.cnt-data').text();
			eval('var data = ' + raw);
			page.data = data;
			
			// set search
			Func.populate({ cnt: '#form-search', record: { tanggal: page.data.current_date } });
		}
	}
	
	// init page
	page.init();
	
	// upload
	$('.btn-browse-upload-file').click(function() { window.iframe_upload_file.browse() });
	set_upload_file = function(p) {
		$('#form-absensi [name="upload_file"]').val(p.file_name);
	}
	
	// grid with absense
	var param = {
		id: 'datatable', aaSorting: [[1, 'desc']],
		source: web.host + 'kepegawaian/absensi/list_kosong/grid',
		column: [ { }, { sClass: "center" }, { sClass: "center" }, { }, { bSortable: false, sClass: "center" } ],
		fnServerParams: function ( aoData ) {
			var search = Func.form.get_value('form-search');
			if (search.tanggal.length > 0) {
				aoData.push(
					{ "name": "tanggal", "value": search.tanggal }
				)
			}
		},
		callback: function() {
			$('#datatable .btn-edit').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				Func.ajax({ url: web.host + 'kepegawaian/absensi/list_kosong/action', param: { action: 'get_by_id', id: record.id }, callback: function(result) {
					Func.populate({ cnt: '#form-absensi', record: result });
					$('#form-absensi').modal();
				} });
			});
			
			$('#datatable .btn-file').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				if (record.link_upload == null) {
					noty({ text: 'File upload tidak tersedia.', layout: 'topRight', type: 'error', timeout: 1500 });
				} else {
					window.open(record.link_upload);
				}
			});
			
			$('#datatable .btn-delete').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				Func.form.del({
					data: { action: 'delete', id: record.id },
					url: web.host + 'kepegawaian/absensi/list_kosong/action', callback: function() {
						dt.reload();
						dt_absence.reload();
					}
				});
			});
		}
	}
	var dt = Func.datatable(param);
	
	// grid without absense
	var param_absence = {
		id: 'datatable-no-absense', aaSorting: [[0, 'asc']],
		source: web.host + 'kepegawaian/absensi/list_kosong/grid_no_absense',
		column: [ { }, { sClass: "center" } ],
		fnServerParams: function ( aoData ) {
			var search = Func.form.get_value('form-search');
			if (search.tanggal.length > 0) {
				aoData.push(
					{ "name": "tanggal", "value": search.tanggal }
				)
			}
		}
	}
	var dt_absence = Func.datatable(param_absence);
	
	// biodata
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
		$('#form-absensi [name="biodata_id"]').val(data.id);
	});
	
	// form search
	$('#form-search').submit(function(e) {
		e.preventDefault();
		dt.reload();
		dt_absence.reload();
	});
	$('#form-search').submit();
	
	// form absensi
	$('.btn-absensi-add').click(function() {
		$('#form-absensi form')[0].reset();
		$('#form-absensi [name="id"]').val(0);
		$('#form-absensi [name="biodata_id"]').val(0);
		$('#form-absensi').modal();
	});
	$('#form-absensi form').validate({
		rules: {
			biodata_title: { required: true },
			tanggal: { required: true },
			status_kosong: { required: true }
		}
	});
	$('#form-absensi form').submit(function(e) {
		e.preventDefault();
		if (! $('#form-absensi form').valid()) {
			return false;
		}
		
		Func.form.submit({
			url: web.host + 'kepegawaian/absensi/list_kosong/action',
			param: Func.form.get_value('form-absensi'),
			callback: function(result) {
				dt.reload();
				dt_absence.reload();
				$('#form-absensi form')[0].reset();
				$('#form-absensi').modal('hide');
			}
		});
	});
});
</script>
</body>
</html>