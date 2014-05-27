<?php
	// master
	$user = $this->user_model->get_session();
	$biodata = $this->biodata_model->get_by_id(array( 'id' => $user['biodata_id'] ));
	$array_year = get_array_year(array( 'YearMin' => 2013 ));
	
	// page data
	$page_data['user'] = $user;
	$page_data['biodata'] = $biodata;
	$page_data['USER_ID_PEGAWAI'] = USER_ID_PEGAWAI;
?>
<?php $this->load->view( 'common/meta', array( 'title' => 'SKP Tahunan' ) ); ?>

<body>
<?php $this->load->view( 'common/header'); ?>

<div class="content enlarged">
	<?php $this->load->view( 'common/sidebar'); ?>
	<div class="hide">
		<div class="cnt-data"><?php echo json_encode($page_data); ?></div>
	</div>
	
  	<div class="mainbar">
	    <div class="page-head">
			<h2 class="pull-left button-back">SKP Tahunan</h2>
			<div class="clearfix"></div>
		</div>
        
	    <div class="matter"><div class="container">
            <div class="row"><div class="col-md-12">
				
				<div class="widget" id="form-search">
					<div class="widget-head">
						<div class="pull-left">Form Pencarian</div>
						<div class="widget-icons pull-right">
							<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
							<a href="#" class="wclose"><i class="fa fa-times"></i></a>
						</div>
						<div class="clearfix"></div>
					</div>
					
					<div class="widget-content">
						<div class="padd"><form class="form-horizontal">
							<input type="hidden" name="biodata_id" value="0" />
							
							<div class="form-group cnt-search-biodata hide">
								<label class="col-lg-2 control-label">Nama Pegawai</label>
								<div class="col-lg-10 cnt-typeahead">
									<input type="text" name="biodata_title" class="form-control typeahead-biodata" placeholder="Nama Pegawai" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Tahun</label>
								<div class="col-lg-10">
									<select class="form-control" name="tahun">
										<?php echo ShowOption(array( 'Array' => $array_year )); ?>
									</select>
								</div>
							</div>
						</form></div>
					</div>
				</div>
				
				<div class="cnt-summary">
					<h3>SKP Info</h3>
					<div class="widget grid-main">
						<div class="widget-head">
							<div class="pull-left">
								<button class="btn btn-info btn-xs btn-add-skp-summary">Tambah</button>
							</div>
							<div class="widget-icons pull-right">
								<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
								<a href="#" class="wclose"><i class="fa fa-times"></i></a>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="widget-content">
							<table id="dt-skp-summary" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th class="center">Tanggal Pembuatan</th>
										<th class="center">Tanggal Penilaian</th>
										<th class="center">Control</th>
									</tr>
								</thead>
								<tbody></tbody>
							</table>
							<div class="widget-foot">
								<br /><br />
								<div class="clearfix"></div> 
							</div>
						</div>
					</div>
				</div>
				
				<div class="widget hide" id="form-summary">
					<div class="widget-head">
						<div class="pull-left">Form SKP Info</div>
						<div class="widget-icons pull-right">
							<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
							<a href="#" class="wclose"><i class="fa fa-times"></i></a>
						</div>
						<div class="clearfix"></div>
					</div>
					
					<div class="widget-content">
						<div class="padd"><form class="form-horizontal">
							<input type="hidden" name="action" value="skp_summary_update" />
							<input type="hidden" name="id" value="0" />
							<input type="hidden" name="tahun" />
							<input type="hidden" name="biodata_id" />
							
							<div class="form-group">
								<label class="col-lg-2 control-label">Tanggal Pembuatan</label>
								<div class="col-lg-10">
									<div class="input-append datepicker">
										<input name="tanggal_pembuatan" type="text" class="form-control dtpicker" placeholder="Tanggal Pembuatan" data-format="dd-MM-yyyy" />
										<span class="add-on"><i data-time-icon="fa fa-time" data-date-icon="fa fa-calendar" class="btn btn-info"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Tanggal Penilaian</label>
								<div class="col-lg-10">
									<div class="input-append datepicker">
										<input name="tanggal_penilaian" type="text" class="form-control dtpicker" placeholder="Tanggal Penilaian" data-format="dd-MM-yyyy" />
										<span class="add-on"><i data-time-icon="fa fa-time" data-date-icon="fa fa-calendar" class="btn btn-info"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Keberatan</label>
								<div class="col-lg-10">
									<textarea name="keberatan" class="form-control" placeholder="Keberatan"></textarea>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Tanggal Keberatan</label>
								<div class="col-lg-10">
									<div class="input-append datepicker">
										<input name="tanggal_keberatan" type="text" class="form-control dtpicker" placeholder="Tanggal Keberatan" data-format="dd-MM-yyyy" />
										<span class="add-on"><i data-time-icon="fa fa-time" data-date-icon="fa fa-calendar" class="btn btn-info"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Tanggapan</label>
								<div class="col-lg-10">
									<textarea name="tanggapan" class="form-control" placeholder="Keberatan"></textarea>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Tanggal Tanggapan</label>
								<div class="col-lg-10">
									<div class="input-append datepicker">
										<input name="tanggal_tanggapan" type="text" class="form-control dtpicker" placeholder="Tanggal Tanggapan" data-format="dd-MM-yyyy" />
										<span class="add-on"><i data-time-icon="fa fa-time" data-date-icon="fa fa-calendar" class="btn btn-info"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Keputusan</label>
								<div class="col-lg-10">
									<textarea name="keputusan" class="form-control" placeholder="Keputusan"></textarea>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Tanggal Keputusan</label>
								<div class="col-lg-10">
									<div class="input-append datepicker">
										<input name="tanggal_keputusan" type="text" class="form-control dtpicker" placeholder="Tanggal Keputusan" data-format="dd-MM-yyyy" />
										<span class="add-on"><i data-time-icon="fa fa-time" data-date-icon="fa fa-calendar" class="btn btn-info"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Rekomendasi</label>
								<div class="col-lg-10">
									<textarea name="rekomendasi" class="form-control" placeholder="Rekomendasi"></textarea>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-6 control-label">Tanggal Dibuat</label>
								<div class="col-lg-6">
									<div class="input-append datepicker">
										<input name="tanggal_dibuat" type="text" class="form-control dtpicker" data-format="dd-MM-yyyy" />
										<span class="add-on"><i data-time-icon="fa fa-time" data-date-icon="fa fa-calendar" class="btn btn-info"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-6 control-label">Tanggal Diterima (PNS)</label>
								<div class="col-lg-6">
									<div class="input-append datepicker">
										<input name="tanggal_diterima_pns" type="text" class="form-control dtpicker" data-format="dd-MM-yyyy" />
										<span class="add-on"><i data-time-icon="fa fa-time" data-date-icon="fa fa-calendar" class="btn btn-info"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-6 control-label">Tanggal Diterima (Atasan Pejabat)</label>
								<div class="col-lg-6">
									<div class="input-append datepicker">
										<input name="tanggal_diterima_atasan" type="text" class="form-control dtpicker" data-format="dd-MM-yyyy" />
										<span class="add-on"><i data-time-icon="fa fa-time" data-date-icon="fa fa-calendar" class="btn btn-info"></i></span>
									</div>
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
				
				<h3>Tupoksi</h3>
				<div class="widget grid-main">
					<div class="widget-head">
						<div class="pull-left">
							<button class="btn btn-info btn-xs btn-add-jenis-skp">Tambah</button>
						</div>
						<div class="widget-icons pull-right">
							<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
							<a href="#" class="wclose"><i class="fa fa-times"></i></a>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="widget-content">
						<table id="dt-skp" class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th>Nama</th>
									<th>Jumlah</th>
									<th>Satuan</th>
									<th>Point</th>
									<th class="center">Control</th>
								</tr>
							</thead>
							<tbody></tbody>
						</table>
						<div class="widget-foot">
							<br /><br />
							<div class="clearfix"></div> 
						</div>
					</div>
				</div>
                
				<h3>Kegiatan Lain</h3>
				<div class="widget grid-main">
					<div class="widget-head">
						<div class="pull-left">
							<button class="btn btn-info btn-xs btn-add-jenis-kegiatan">Tambah</button>
						</div>
						<div class="widget-icons pull-right">
							<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
							<a href="#" class="wclose"><i class="fa fa-times"></i></a>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="widget-content">
						<table id="dt-kegiatan" class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th>Nama</th>
									<th>Jumlah</th>
									<th>Satuan</th>
									<th>Point</th>
									<th class="center">Control</th>
								</tr>
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
	
	<div id="form-skp" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"><div class="modal-dialog modal-dialog-big"><div class="modal-content"><form>
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h4 class="modal-title">Jenis SKP</h4>
		</div>
		<div class="modal-body"><div class="widget-content">
			<div class="padd"><div class="form-horizontal">
				<input type="hidden" name="action" value="skp_update" />
				<input type="hidden" name="id" value="0" />
				<input type="hidden" name="biodata_id" value="0" />
				
				<div class="form-group">
					<label class="col-lg-2 control-label">Nama</label>
					<div class="col-lg-10">
						<input type="text" name="title" class="form-control" placeholder="Nama" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-2 control-label">Jumlah</label>
					<div class="col-lg-10">
						<input type="text" name="jumlah" class="form-control" placeholder="Jumlah" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-2 control-label">Satuan</label>
					<div class="col-lg-10">
						<input type="text" name="satuan" class="form-control" placeholder="Satuan" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-2 control-label">Point</label>
					<div class="col-lg-10">
						<input type="text" name="point" class="form-control" placeholder="Point" />
					</div>
				</div>
			</div></div>
		</div></div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal" aria-hidden="true">Close</button>
			<button type="submit" class="btn btn-primary">Save changes</button>
		</div>
	</form></div></div></div>
	
	<div id="form-kegiatan" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"><div class="modal-dialog modal-dialog-big"><div class="modal-content"><form>
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h4 class="modal-title">Kegiatan Lain</h4>
		</div>
		<div class="modal-body"><div class="widget-content">
			<div class="padd"><div class="form-horizontal">
				<input type="hidden" name="action" value="kegiatan_update" />
				<input type="hidden" name="id" value="0" />
				<input type="hidden" name="biodata_id" value="0" />
				
				<div class="form-group">
					<label class="col-lg-2 control-label">Nama</label>
					<div class="col-lg-10">
						<input type="text" name="title" class="form-control" placeholder="Nama" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-2 control-label">Jumlah</label>
					<div class="col-lg-10">
						<input type="text" name="jumlah" class="form-control" placeholder="Jumlah" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-2 control-label">Satuan</label>
					<div class="col-lg-10">
						<input type="text" name="satuan" class="form-control" placeholder="Satuan" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-2 control-label">Point</label>
					<div class="col-lg-10">
						<input type="text" name="point" class="form-control" placeholder="Point" />
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
			
			// auto set for pegawai
			if (page.data.user.user_type_id == page.data.USER_ID_PEGAWAI) {
				$('#form-search [name="biodata_id"]').val(page.data.user.biodata_id);
			} else {
				$('#form-search .cnt-search-biodata').show();
			}
		},
		show_grid: function() {
			$('#form-search').show();
			$('.cnt-summary').show();
			$('#form-summary').hide();
		},
		show_form_summary: function() {
			$('#form-search').hide();
			$('.cnt-summary').hide();
			$('#form-summary').show();
		},
		is_valid_search: function(p) {
			p.message = (typeof(p.message) == 'undefined') ? true : p.message;
			
			var form_search = Func.form.get_value('form-search');
			if (form_search.biodata_id == 0 || form_search.tahun == '') {
				if (p.message) {
					noty({ text: 'Silahkan memasukan data pencarian terlebih dahulu.', layout: 'topRight', type: 'error', timeout: 2500 });
				}
				
				return false;
			}
			
			return true;
		},
		search_refresh: function() {
			var is_valid_search = page.is_valid_search({ message: false });
			if (!is_valid_search) {
				return;
			}
			
			// reload grid
			dt_skp_summary.reload();
		}
	}
	page.init();
	
	// grid
	var dt_skp_summary_param = {
		id: 'dt-skp-summary',
		source: web.host + 'kepegawaian/skp/skp_tahunan/grid',
		column: [ { sClass: 'center' }, { sClass: 'center' }, { bSortable: false, sClass: "center" } ],
		fnServerParams: function ( aoData ) {
			var form_search = Func.form.get_value('form-search');
			aoData.push(
				{ "name": "action", "value": 'skp_summary' },
				{ "name": "tahun", "value": form_search.tahun },
				{ "name": "biodata_id", "value": form_search.biodata_id }
			)
		},
		callback: function() {
			$('#dt-skp-summary .btn-edit').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				Func.ajax({ url: web.host + 'kepegawaian/skp/skp_tahunan/action', param: { action: 'skp_summary_get_by_id', id: record.id }, callback: function(result) {
					Func.populate({ cnt: '#form-summary', record: result });
					page.show_form_summary();
				} });
			});
			
			$('#dt-skp-summary .btn-delete').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				Func.form.del({
					data: { action: 'skp_summary_delete', id: record.id },
					url: web.host + 'kepegawaian/skp/skp_tahunan/action', callback: function() { dt_skp_summary.reload(); }
				});
			});
		}
	}
	var dt_skp_summary = Func.datatable(dt_skp_summary_param);
	
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
		$('#form-search [name="biodata_id"]').val(data.id);
		page.search_refresh();
	});
	
	// search
	$('#form-search [name="tahun"]').change(function() {
		page.search_refresh();
	});
	
	// global
	$('.btn-show-grid').click(function() {
		page.show_grid();
	});
	
	// form summary
	$('.btn-add-skp-summary').click(function() {
		var is_valid_search = page.is_valid_search({});
		if (!is_valid_search) {
			return;
		}
		
		// show form
		page.show_form_summary();
		
		// populate data
		var form_search = Func.form.get_value('form-search');
		$('#form-summary [name="tahun"]').val(form_search.tahun);
		$('#form-summary [name="biodata_id"]').val(form_search.biodata_id);
	});
	$('#form-summary form').validate({
		rules: {
			tanggal_pembuatan: { required: true }
		}
	});
	$('#form-summary form').submit(function(e) {
		e.preventDefault();
		if (! $('#form-summary form').valid()) {
			return false;
		}
		
		Func.form.submit({
			url: web.host + 'kepegawaian/skp/skp_tahunan/action',
			param: Func.form.get_value('form-summary'),
			callback: function(result) {
				page.search_refresh();
				page.show_grid();
				$('#form-summary form')[0].reset();
			}
		});
	});
});
</script>
</body>
</html>