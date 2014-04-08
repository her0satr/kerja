<?php
	$biodata_id = $this->uri->segments['4'];
	$biodata = $this->biodata_model->get_by_id(array( 'id' => $biodata_id ));
	if (count($biodata) == 0) {
		exit;
	}
	
	// page data
	$page_data['biodata'] = $biodata;
?>
<?php $this->load->view( 'common/meta', array( 'title' => 'Riwayat' ) ); ?>

<body>
<?php $this->load->view( 'common/header'); ?>

<div class="content">
	<?php $this->load->view( 'common/sidebar'); ?>
	<div class="hide">
		<div class="cnt-data"><?php echo json_encode($page_data); ?></div>
		<iframe name="iframe_pendidikan" src="<?php echo base_url('upload?callback=set_riwayat_pendidikan'); ?>"></iframe>
		<iframe name="iframe_mutasi" src="<?php echo base_url('upload?callback=set_riwayat_mutasi'); ?>"></iframe>
		<iframe name="iframe_diklat" src="<?php echo base_url('upload?callback=set_riwayat_diklat'); ?>"></iframe>
	</div>
	
  	<div class="mainbar">
	    <div class="page-head">
			<h2 class="pull-left button-back">Riwayat - <?php echo $biodata['nama']; ?></h2>
			<div class="clearfix"></div>
		</div>
		
	    <div class="matter"><div class="container">
            <div class="row"><div class="col-md-12">
				
				<h3>Riwayat Pendidikan</h3>
				<div class="widget grid-main">
					<div class="widget-head">
						<div class="pull-left">
							<button class="btn btn-info btn-xs btn-add-pendidikan">Tambah</button>
						</div>
						<div class="widget-icons pull-right">
							<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
							<a href="#" class="wclose"><i class="fa fa-times"></i></a>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="widget-content">
						<table id="dt-pendidikan" class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th>No Ijazah</th>
									<th>Tahun</th>
									<th>Keterangan</th>
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
				
				<h3>Riwayat Mutasi</h3>
				<div class="widget grid-main">
					<div class="widget-head">
						<div class="pull-left">
							<button class="btn btn-info btn-xs btn-add-mutasi">Tambah</button>
						</div>
						<div class="widget-icons pull-right">
							<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
							<a href="#" class="wclose"><i class="fa fa-times"></i></a>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="widget-content">
						<table id="dt-mutasi" class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th>No SK</th>
									<th>Tahun</th>
									<th>Keterangan</th>
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
				
				<h3>Riwayat Diklat</h3>
				<div class="widget grid-main">
					<div class="widget-head">
						<div class="pull-left">
							<button class="btn btn-info btn-xs btn-add-diklat">Tambah</button>
						</div>
						<div class="widget-icons pull-right">
							<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
							<a href="#" class="wclose"><i class="fa fa-times"></i></a>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="widget-content">
						<table id="dt-diklat" class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th>No Sertifikat</th>
									<th>Tahun</th>
									<th>Keterangan</th>
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
	
	<div id="form-pendidikan" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"><div class="modal-dialog modal-dialog-big"><div class="modal-content"><form>
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h4 class="modal-title">Riwayat Pendidikan</h4>
		</div>
		<div class="modal-body"><div class="widget-content">
			<div class="padd"><div class="form-horizontal">
				<input type="hidden" name="action" value="pendidikan_update" />
				<input type="hidden" name="id" value="0" />
				<input type="hidden" name="biodata_id" value="0" />
				
				<div class="form-group">
					<label class="col-lg-2 control-label">No Ijazah</label>
					<div class="col-lg-10">
						<input type="text" name="no_ijazah" class="form-control" placeholder="No Ijazah" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-2 control-label">Tahun</label>
					<div class="col-lg-10">
						<input type="text" name="tahun" class="form-control" placeholder="Tahun" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-2 control-label">File</label>
					<div class="col-lg-6">
						<input type="text" name="upload_file" class="form-control" placeholder="File" />
					</div>
					<div class="col-lg-2">
						<input type="button" class="btn btn-primary btn-browse-pendidikan" value="Browse" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-2 control-label">Keterangan</label>
					<div class="col-lg-10">
						<input type="text" name="keterangan" class="form-control" placeholder="Keterangan" />
					</div>
				</div>
			</div></div>
		</div></div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal" aria-hidden="true">Close</button>
			<button type="submit" class="btn btn-primary">Save changes</button>
		</div>
	</form></div></div></div>
	
	<div id="form-mutasi" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"><div class="modal-dialog modal-dialog-big"><div class="modal-content"><form>
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h4 class="modal-title">Riwayat Mutasi</h4>
		</div>
		<div class="modal-body"><div class="widget-content">
			<div class="padd"><div class="form-horizontal">
				<input type="hidden" name="action" value="mutasi_update" />
				<input type="hidden" name="id" value="0" />
				<input type="hidden" name="biodata_id" value="0" />
				
				<div class="form-group">
					<label class="col-lg-2 control-label">No SK</label>
					<div class="col-lg-10">
						<input type="text" name="no_sk" class="form-control" placeholder="No SK" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-2 control-label">Tahun</label>
					<div class="col-lg-10">
						<input type="text" name="tahun" class="form-control" placeholder="Tahun" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-2 control-label">File</label>
					<div class="col-lg-6">
						<input type="text" name="upload_file" class="form-control" placeholder="File" />
					</div>
					<div class="col-lg-2">
						<input type="button" class="btn btn-primary btn-browse-mutasi" value="Browse" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-2 control-label">Keterangan</label>
					<div class="col-lg-10">
						<input type="text" name="keterangan" class="form-control" placeholder="Keterangan" />
					</div>
				</div>
			</div></div>
		</div></div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal" aria-hidden="true">Close</button>
			<button type="submit" class="btn btn-primary">Save changes</button>
		</div>
	</form></div></div></div>
	
	<div id="form-diklat" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"><div class="modal-dialog modal-dialog-big"><div class="modal-content"><form>
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h4 class="modal-title">Riwayat Diklat</h4>
		</div>
		<div class="modal-body"><div class="widget-content">
			<div class="padd"><div class="form-horizontal">
				<input type="hidden" name="action" value="diklat_update" />
				<input type="hidden" name="id" value="0" />
				<input type="hidden" name="biodata_id" value="0" />
				
				<div class="form-group">
					<label class="col-lg-2 control-label">No Sertifikat</label>
					<div class="col-lg-10">
						<input type="text" name="no_sertifikat" class="form-control" placeholder="No Sertifikat" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-2 control-label">Tahun</label>
					<div class="col-lg-10">
						<input type="text" name="tahun" class="form-control" placeholder="Tahun" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-2 control-label">File</label>
					<div class="col-lg-6">
						<input type="text" name="upload_file" class="form-control" placeholder="File" />
					</div>
					<div class="col-lg-2">
						<input type="button" class="btn btn-primary btn-browse-diklat" value="Browse" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-2 control-label">Keterangan</label>
					<div class="col-lg-10">
						<input type="text" name="keterangan" class="form-control" placeholder="Keterangan" />
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
		}
	}
	page.init();
	
	// upload
	$('.btn-browse-pendidikan').click(function() { window.iframe_pendidikan.browse() });
	set_riwayat_pendidikan = function(p) {
		$('#form-pendidikan [name="upload_file"]').val(p.file_name);
	}
	$('.btn-browse-mutasi').click(function() { window.iframe_mutasi.browse() });
	set_riwayat_mutasi = function(p) {
		$('#form-mutasi [name="upload_file"]').val(p.file_name);
	}
	$('.btn-browse-diklat').click(function() { window.iframe_diklat.browse() });
	set_riwayat_diklat = function(p) {
		$('#form-diklat [name="upload_file"]').val(p.file_name);
	}
	
	// grid
	var pendidikan_param = {
		id: 'dt-pendidikan',
		source: web.host + 'kepegawaian/riwayat/grid',
		column: [ { }, { }, { }, { bSortable: false, sClass: "center" } ],
		fnServerParams: function ( aoData ) {
			aoData.push(
				{ "name": "action", "value": 'riwayat_pendidikan' },
				{ "name": "biodata_id", "value": page.data.biodata.id }
			)
		},
		callback: function() {
			$('#dt-pendidikan .btn-edit').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				Func.ajax({ url: web.host + 'kepegawaian/riwayat/action', param: { action: 'pendidikan_get_by_id', id: record.id }, callback: function(result) {
					Func.populate({ cnt: '#form-pendidikan', record: result });
					$('#form-pendidikan').modal();
				} });
			});
			
			$('#dt-pendidikan .btn-file').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				if (record.link_upload == null) {
					noty({ text: 'File upload tidak tersedia.', layout: 'topRight', type: 'error', timeout: 1500 });
				} else {
					window.open(record.link_upload);
				}
			});
			
			$('#dt-pendidikan .btn-delete').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				Func.form.del({
					data: { action: 'pendidikan_delete', id: record.id },
					url: web.host + 'kepegawaian/riwayat/action', callback: function() { dt_pendidikan.reload(); }
				});
			});
		}
	}
	var dt_pendidikan = Func.datatable(pendidikan_param);
	var mutasi_param = {
		id: 'dt-mutasi',
		source: web.host + 'kepegawaian/riwayat/grid',
		column: [ { }, { }, { }, { bSortable: false, sClass: "center" } ],
		fnServerParams: function ( aoData ) {
			aoData.push(
				{ "name": "action", "value": 'riwayat_mutasi' },
				{ "name": "biodata_id", "value": page.data.biodata.id }
			)
		},
		callback: function() {
			$('#dt-mutasi .btn-edit').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				Func.ajax({ url: web.host + 'kepegawaian/riwayat/action', param: { action: 'mutasi_get_by_id', id: record.id }, callback: function(result) {
					Func.populate({ cnt: '#form-mutasi', record: result });
					$('#form-mutasi').modal();
				} });
			});
			
			$('#dt-mutasi .btn-file').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				if (record.link_upload == null) {
					noty({ text: 'File upload tidak tersedia.', layout: 'topRight', type: 'error', timeout: 1500 });
				} else {
					window.open(record.link_upload);
				}
			});
			
			$('#dt-mutasi .btn-delete').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				Func.form.del({
					data: { action: 'mutasi_delete', id: record.id },
					url: web.host + 'kepegawaian/riwayat/action', callback: function() { dt_mutasi.reload(); }
				});
			});
		}
	}
	var dt_mutasi = Func.datatable(mutasi_param);
	var diklat_param = {
		id: 'dt-diklat',
		source: web.host + 'kepegawaian/riwayat/grid',
		column: [ { }, { }, { }, { bSortable: false, sClass: "center" } ],
		fnServerParams: function ( aoData ) {
			aoData.push(
				{ "name": "action", "value": 'riwayat_diklat' },
				{ "name": "biodata_id", "value": page.data.biodata.id }
			)
		},
		callback: function() {
			$('#dt-diklat .btn-edit').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				Func.ajax({ url: web.host + 'kepegawaian/riwayat/action', param: { action: 'diklat_get_by_id', id: record.id }, callback: function(result) {
					Func.populate({ cnt: '#form-diklat', record: result });
					$('#form-diklat').modal();
				} });
			});
			
			$('#dt-diklat .btn-file').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				if (record.link_upload == null) {
					noty({ text: 'File upload tidak tersedia.', layout: 'topRight', type: 'error', timeout: 1500 });
				} else {
					window.open(record.link_upload);
				}
			});
			
			$('#dt-diklat .btn-delete').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				Func.form.del({
					data: { action: 'diklat_delete', id: record.id },
					url: web.host + 'kepegawaian/riwayat/action', callback: function() { dt_diklat.reload(); }
				});
			});
		}
	}
	var dt_diklat = Func.datatable(diklat_param);
	
	// form pendidikan
	$('.btn-add-pendidikan').click(function() {
		$('#form-pendidikan form')[0].reset();
		$('#form-pendidikan [name="biodata_id"]').val(page.data.biodata.id);
		$('#form-pendidikan').modal();
	});
	$('#form-pendidikan form').validate({
		rules: {
			tahun: { required: true },
			no_ijazah: { required: true }
		}
	});
	$('#form-pendidikan form').submit(function(e) {
		e.preventDefault();
		if (! $('#form-pendidikan form').valid()) {
			return false;
		}
		
		Func.form.submit({
			url: web.host + 'kepegawaian/riwayat/action',
			param: Func.form.get_value('form-pendidikan'),
			callback: function(result) {
				dt_pendidikan.reload();
				$('#form-pendidikan').modal('hide');
			}
		});
	});
	
	// form mutasi
	$('.btn-add-mutasi').click(function() {
		$('#form-mutasi form')[0].reset();
		$('#form-mutasi [name="biodata_id"]').val(page.data.biodata.id);
		$('#form-mutasi').modal();
	});
	$('#form-mutasi form').validate({
		rules: {
			tahun: { required: true },
			no_sk: { required: true }
		}
	});
	$('#form-mutasi form').submit(function(e) {
		e.preventDefault();
		if (! $('#form-mutasi form').valid()) {
			return false;
		}
		
		Func.form.submit({
			url: web.host + 'kepegawaian/riwayat/action',
			param: Func.form.get_value('form-mutasi'),
			callback: function(result) {
				dt_mutasi.reload();
				$('#form-mutasi').modal('hide');
			}
		});
	});
	
	// form diklat
	$('.btn-add-diklat').click(function() {
		$('#form-diklat form')[0].reset();
		$('#form-diklat [name="biodata_id"]').val(page.data.biodata.id);
		$('#form-diklat').modal();
	});
	$('#form-diklat form').validate({
		rules: {
			tahun: { required: true },
			no_sertifikat: { required: true }
		}
	});
	$('#form-diklat form').submit(function(e) {
		e.preventDefault();
		if (! $('#form-diklat form').valid()) {
			return false;
		}
		
		Func.form.submit({
			url: web.host + 'kepegawaian/riwayat/action',
			param: Func.form.get_value('form-diklat'),
			callback: function(result) {
				dt_diklat.reload();
				$('#form-diklat').modal('hide');
			}
		});
	});
});
</script>
</body>
</html>