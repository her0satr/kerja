<?php
	$user = $this->user_model->get_session();
	
	// page data
	$page_data['current_date'] = $this->config->item('current_date');
	$page_data['current_time'] = $this->config->item('current_time');
?>
<?php $this->load->view( 'common/meta', array( 'title' => 'List Agenda Kerja' ) ); ?>

<body>
<?php $this->load->view( 'common/header'); ?>

<div class="content">
	<?php $this->load->view( 'common/sidebar'); ?>
	<div class="hide">
		<div class="cnt-data"><?php echo json_encode($page_data); ?></div>
	</div>
	
  	<div class="mainbar">
	    <div class="page-head">
			<h2 class="pull-left button-back">List Agenda Kerja</h2>
			<div class="clearfix"></div>
		</div>
		
	    <div class="matter"><div class="container">
            <div class="row"><div class="col-md-12">
				
				<div class="widget grid-main">
					<div class="widget-head">
						<div class="pull-left">
							<button class="btn btn-info btn-xs btn-add">Tambah</button>
						</div>
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
									<th class="center">Tanggal</th>
									<th class="center">Waktu</th>
									<th>Nama</th>
									<th>Kegiatan</th>
									<th>Keterangan</th>
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
				
				<div class="widget hide" id="form-skp">
					<div class="widget-head">
						<div class="pull-left">Form Kegiatan SKP</div>
						<div class="widget-icons pull-right">
							<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
							<a href="#" class="wclose"><i class="fa fa-times"></i></a>
						</div>
						<div class="clearfix"></div>
					</div>
					
					<div class="widget-content">
						<div class="padd"><form class="form-horizontal">
							<input type="hidden" name="action" value="update" />
							<input type="hidden" name="id" value="0" />
							<input type="hidden" name="biodata_id" value="0" />
							
							<div class="form-group">
								<label class="col-lg-2 control-label">Nama</label>
								<div class="col-lg-10 cnt-typeahead">
									<input type="text" name="biodata_text" class="form-control typeahead-biodata" placeholder="Nama" />
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
								<label class="col-lg-2 control-label">Jam</label>
								<div class="col-lg-10">
									<div class="input-append timepicker">
										<input name="waktu" type="text" class="form-control tmpicker" placeholder="Jam" data-format="hh:mm:ss" />
										<span class="add-on"><i data-time-icon="fa fa-clock-o" data-date-icon="fa fa-calendar" class="btn btn-info"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Jenis Isian</label>
								<div class="col-lg-10">
									<select class="form-control" name="type_row">
										<option value="">-</option>
										<option value="1">Jenis SKP</option>
										<option value="2">Kegiatan Lain</option>
									</select>
								</div>
							</div>
							<div class="form-group hide input-skp">
								<label class="col-lg-2 control-label">Jenis SKP</label>
								<div class="col-lg-10">
									<select class="form-control" name="jenis_skp_id">
										<option value="">-</option>
									</select>
								</div>
							</div>
							<div class="form-group hide input-lain">
								<label class="col-lg-2 control-label">Kegiatan Lain</label>
								<div class="col-lg-10">
									<select class="form-control" name="jenis_kegiatan_id">
										<option value="">-</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Keterangan</label>
								<div class="col-lg-10">
									<input type="text" name="keterangan" class="form-control" placeholder="Keterangan" />
								</div>
							</div>
							
							<hr />
							<div class="form-group">
								<div class="col-lg-offset-2 col-lg-9">
									<button type="submit" class="btn btn-info">Save</button>
									<button type="button" class="btn btn-info btn-show-grid">Cancel</button>
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
	var dt = null;
	var page = {
		init: function() {
			var raw = $('.cnt-data').text();
			eval('var data = ' + raw);
			page.data = data;
		},
		show_grid: function() {
			$('.grid-main').show();
			$('#form-skp').hide();
		},
		show_form: function() {
			$('.grid-main').hide();
			$('#form-skp').show();
		}
	}
	page.init();
	
	// biodata
	var biodata_store = new Bloodhound({
		datumTokenizer: Bloodhound.tokenizers.obj.whitespace('nama'),
		queryTokenizer: Bloodhound.tokenizers.whitespace,
		prefetch: web.host + 'typeahead?action=biodata',
		remote: web.host + 'typeahead?action=biodata&namelike=%QUERY'
	});
	biodata_store.initialize();
	var biodata = $('.typeahead-biodata').typeahead(null, {
		name: 'unit-kerja',
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
		$('#form-skp [name="biodata_id"]').val(data.id);
		$('#form-skp [name="type_row"]').val('');
		$('#form-skp [name="type_row"]').change();
	});
	
	// global
	$('.btn-show-grid').click(function() {
		page.show_grid();
	});
	
	// grid
	var param = {
		id: 'datatable', aaSorting: [[0, 'desc']],
		source: web.host + 'kepegawaian/skp/list_skp/grid',
		column: [ { sClass: "center" }, { sClass: "center" }, { }, { }, { }, { bSortable: false, sClass: "center" } ],
		callback: function() {
			$('#datatable .btn-edit').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				Func.ajax({ url: web.host + 'kepegawaian/skp/list_skp/action', param: { action: 'get_by_id', id: record.id }, callback: function(result) {
					Func.populate({ cnt: '#form-skp', record: result });
					combo.jenis_skp({ biodata_id: result.biodata_id, target: $('#form-skp [name="jenis_skp_id"]'), value: result.jenis_skp_id });
					combo.jenis_kegiatan({ biodata_id: result.biodata_id, target: $('#form-skp [name="jenis_kegiatan_id"]'), value: result.jenis_kegiatan_id });
					
					page.show_form();
					$('#form-skp [name="type_row"]').change();
				} });
			});
			
			$('#datatable .btn-delete').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				Func.form.del({
					data: { action: 'delete', id: record.id },
					url: web.host + 'kepegawaian/skp/list_skp/action', callback: function() { dt.reload(); }
				});
			});
		}
	}
	dt = Func.datatable(param);
	
	// form skp
	$('.btn-add').click(function() {
		page.show_form();
		$('#form-skp [name="type_row"]').change();
		
		$('#form-skp form')[0].reset();
		$('#form-skp [name="id"]').val(0);
		$('#form-skp [name="biodata_id"]').val(page.data.biodata.id);
		$('#form-skp [name="tanggal"]').val(Func.swap_date(page.data.current_date));
	});
	$('#form-skp [name="type_row"]').change(function() {
		var value = $(this).val();
		if (value == 1) {
			$('#form-skp .input-skp').show();
			$('#form-skp .input-lain').hide();
		} else if (value == 2) {
			$('#form-skp .input-skp').hide();
			$('#form-skp .input-lain').show();
		} else {
			$('#form-skp .input-skp').hide();
			$('#form-skp .input-lain').hide();
		}
		
		// load jenis skp / jenis kegiatan
		combo.jenis_skp({ biodata_id: $('#form-skp [name="biodata_id"]').val(), target: $('#form-skp [name="jenis_skp_id"]') });
		combo.jenis_kegiatan({ biodata_id: $('#form-skp [name="biodata_id"]').val(), target: $('#form-skp [name="jenis_kegiatan_id"]') });
	});
	$('#form-skp form').validate({
		rules: {
			tanggal: { required: true },
			type_row: { required: true }
		}
	});
	$('#form-skp form').submit(function(e) {
		e.preventDefault();
		if (! $('#form-skp form').valid()) {
			return false;
		}
		
		Func.form.submit({
			url: web.host + 'kepegawaian/skp/list_skp/action',
			param: Func.form.get_value('form-skp'),
			callback: function(result) {
				dt.reload();
				page.show_grid();
				$('#form-skp form')[0].reset();
			}
		});
	});
});
</script>
</body>
</html>