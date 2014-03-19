<?php
	$user = $this->user_model->get_session();
	$biodata = $this->biodata_model->get_by_id(array( 'id' => $user['biodata_id'] ));
	if (count($biodata) == 0) {
		header('Location: '.base_url());
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
	</div>
	
  	<div class="mainbar">
	    <div class="page-head">
			<h2 class="pull-left button-back">Jenis SKP & Kegiatan Lain</h2>
			<div class="clearfix"></div>
		</div>
		
	    <div class="matter"><div class="container">
            <div class="row"><div class="col-md-12">
				
				<h3>Jenis SKP</h3>
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
				<div class="form-group hide">
					<label class="col-lg-2 control-label">Jumlah</label>
					<div class="col-lg-10">
						<input type="text" name="jumlah" class="form-control" placeholder="Jumlah" />
					</div>
				</div>
				<div class="form-group hide">
					<label class="col-lg-2 control-label">Satuan</label>
					<div class="col-lg-10">
						<input type="text" name="satuan" class="form-control" placeholder="Satuan" />
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
	
	// grid
	var skp_param = {
		id: 'dt-skp',
		source: web.host + 'kepegawaian/skp/master/grid',
		column: [ { }, { }, { }, { bSortable: false, sClass: "center" } ],
		fnServerParams: function ( aoData ) {
			aoData.push(
				{ "name": "action", "value": 'jenis_skp' },
				{ "name": "biodata_id", "value": page.data.biodata.id }
			)
		},
		callback: function() {
			$('#dt-skp .btn-edit').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				Func.ajax({ url: web.host + 'kepegawaian/skp/master/action', param: { action: 'skp_get_by_id', id: record.id }, callback: function(result) {
					Func.populate({ cnt: '#form-skp', record: result });
					$('#form-skp').modal();
				} });
			});
			
			$('#dt-skp .btn-delete').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				Func.form.del({
					data: { action: 'skp_delete', id: record.id },
					url: web.host + 'kepegawaian/skp/master/action', callback: function() { dt_skp.reload(); }
				});
			});
		}
	}
	var dt_skp = Func.datatable(skp_param);
	var kegiatan_param = {
		id: 'dt-kegiatan',
		source: web.host + 'kepegawaian/skp/master/grid',
		column: [ { }, { bSortable: false, sClass: "center" } ],
		fnServerParams: function ( aoData ) {
			aoData.push(
				{ "name": "action", "value": 'jenis_kegiatan' },
				{ "name": "biodata_id", "value": page.data.biodata.id }
			)
		},
		callback: function() {
			$('#dt-kegiatan .btn-edit').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				Func.ajax({ url: web.host + 'kepegawaian/skp/master/action', param: { action: 'kegiatan_get_by_id', id: record.id }, callback: function(result) {
					Func.populate({ cnt: '#form-kegiatan', record: result });
					$('#form-kegiatan').modal();
				} });
			});
			
			$('#dt-kegiatan .btn-delete').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				Func.form.del({
					data: { action: 'kegiatan_delete', id: record.id },
					url: web.host + 'kepegawaian/skp/master/action', callback: function() { dt_kegiatan.reload(); }
				});
			});
		}
	}
	var dt_kegiatan = Func.datatable(kegiatan_param);
	
	// form skp
	$('.btn-add-jenis-skp').click(function() {
		$('#form-skp form')[0].reset();
		$('#form-skp [name="biodata_id"]').val(page.data.biodata.id);
		$('#form-skp').modal();
	});
	$('#form-skp form').validate({
		rules: {
			title: { required: true }
		}
	});
	$('#form-skp form').submit(function(e) {
		e.preventDefault();
		if (! $('#form-skp form').valid()) {
			return false;
		}
		
		Func.form.submit({
			url: web.host + 'kepegawaian/skp/master/action',
			param: Func.form.get_value('form-skp'),
			callback: function(result) {
				dt_skp.reload();
				$('#form-skp').modal('hide');
			}
		});
	});
	
	// form kegiatan
	$('.btn-add-jenis-kegiatan').click(function() {
		$('#form-kegiatan form')[0].reset();
		$('#form-kegiatan [name="biodata_id"]').val(page.data.biodata.id);
		$('#form-kegiatan').modal();
	});
	$('#form-kegiatan form').validate({
		rules: {
			title: { required: true }
		}
	});
	$('#form-kegiatan form').submit(function(e) {
		e.preventDefault();
		if (! $('#form-kegiatan form').valid()) {
			return false;
		}
		
		Func.form.submit({
			url: web.host + 'kepegawaian/skp/master/action',
			param: Func.form.get_value('form-kegiatan'),
			callback: function(result) {
				dt_kegiatan.reload();
				$('#form-kegiatan').modal('hide');
			}
		});
	});
});
</script>
</body>
</html>