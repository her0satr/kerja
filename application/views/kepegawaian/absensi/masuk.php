<?php
	$user = $this->user_model->get_session();
	$user['biodata_id'] = (isset($user['biodata_id'])) ? $user['biodata_id'] : 0;
	$biodata = $this->biodata_model->get_by_id(array( 'id' => $user['biodata_id'] ));
	if (count($biodata) == 0) {
		header('Location: '.base_url());
		exit;
	}
	
	// make sure user having absense today
	$this->absensi_masuk_model->set_absensi_today(array( 'biodata_id' => $user['biodata_id'] ));
	
	// page data
	$page_data['biodata'] = $biodata;
	$page_data['current_date'] = $this->config->item('current_date');
?>
<?php $this->load->view( 'common/meta', array( 'title' => 'Absensi Masuk' ) ); ?>

<body>
<?php $this->load->view( 'common/header'); ?>

<div class="content enlarged">
	<?php $this->load->view( 'common/sidebar'); ?>
	<div class="hide">
		<div class="cnt-data"><?php echo json_encode($page_data); ?></div>
	</div>
	
  	<div class="mainbar">
	    <div class="page-head">
			<h2 class="pull-left button-back">Absensi Masuk</h2>
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
									<th class="center">Absensi #1</th>
									<th class="center">Absensi #2</th>
									<th class="center">Absensi #3</th>
									<th class="center">Absensi #4</th>
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
					<label class="col-lg-2 control-label">Tanggal</label>
					<div class="col-lg-10">
						<div class="input-append datepicker">
							<input name="tanggal" type="text" class="form-control dtpicker" placeholder="Tanggal Lahir" data-format="dd-MM-yyyy" />
							<span class="add-on"><i data-time-icon="fa fa-time" data-date-icon="fa fa-calendar" class="btn btn-info"></i></span>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-2 control-label">Informasi</label>
					<div class="col-lg-10">
						<select class="form-control" name="label">
							<option value="">-</option>
							<option value="Tepat Waktu">Tepat Waktu</option>
							<option value="Terlambat">Terlambat</option>
						</select>
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
	
	<div id="form-review" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"><div class="modal-dialog modal-dialog-big"><div class="modal-content"><form>
		<input type="hidden" name="id" value="" />
		
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h4 class="modal-title">Form Review Absensi</h4>
		</div>
		<div class="modal-body"><div class="widget-content">
			<div class="padd"><div class="form-horizontal">
				<div class="form-group">
					<label class="col-lg-2 control-label">Tanggal</label>
					<div class="col-lg-10">
						<div class="input-append datepicker">
							<input name="tanggal" type="text" class="form-control dtpicker" placeholder="Tanggal Lahir" />
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-2 control-label">Informasi</label>
					<div class="col-lg-10">
						<select class="form-control" name="label">
							<option value="">-</option>
							<option value="Tepat Waktu">Tepat Waktu</option>
							<option value="Terlambat">Terlambat</option>
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
					<label class="col-lg-2 control-label">Absensi #1</label>
					<div class="col-lg-4">
						<input type="text" name="waktu_01" class="form-control" placeholder="Keterangan" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-2 control-label">Absensi #2</label>
					<div class="col-lg-4">
						<input type="text" name="waktu_02" class="form-control" placeholder="Keterangan" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-2 control-label">Absensi #3</label>
					<div class="col-lg-4">
						<input type="text" name="waktu_03" class="form-control" placeholder="Keterangan" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-2 control-label">Absensi #4</label>
					<div class="col-lg-4">
						<input type="text" name="waktu_04" class="form-control" placeholder="Keterangan" />
					</div>
				</div>
			</div></div>
		</div></div>
		<div class="modal-footer">
			<button type="submit" class="btn btn-info">Save</button>
			<button type="button" class="btn btn-default" data-dismiss="modal" aria-hidden="true">Close</button>
		</div>
	</form></div></div></div>
</div>

<?php $this->load->view( 'common/footer' ); ?>
<?php $this->load->view( 'common/library_js'); ?>

<script>
$(document).ready(function() {
	var page = {
		init: function() {
			// disable change date
			$('#form-absensi [name="tanggal"]').attr('disabled', true);
			$('#form-absensi [name="tanggal"]').next().hide();
			
			// page data
			var raw = $('.cnt-data').text();
			eval('var data = ' + raw);
			page.data = data;
			page.current_date = true;
		}
	}
	page.init();
	
	// grid
	var param = {
		id: 'datatable', aaSorting: [[0, 'desc']],
		source: web.host + 'kepegawaian/absensi/masuk/grid',
		column: [ {
					sClass: "center"
			}, {	sClass: "center"
			}, {	sClass: "center"
			}, {	sClass: "center"
			}, {	sClass: "center"
			}, {	bSortable: false, sClass: "center"
		} ],
		fnServerParams: function ( aoData ) {
			aoData.push(
				{ "name": "biodata_id", "value": page.data.biodata.id }
			)
			
			// do it once only
			if (page.current_date) {
				page.current_date = false;
				aoData.push(
					{ "name": "tanggal", "value": page.data.current_date }
				)
			}
		},
		callback: function() {
			$('#datatable .btn-edit').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				Func.ajax({ url: web.host + 'kepegawaian/absensi/masuk/action', param: { action: 'get_by_id', id: record.id }, callback: function(result) {
					$('#form-review form')[0].reset();
					$('#form-review input').attr('disabled', true)
					$('#form-review [name="label"]').attr('disabled', false)
					$('#form-review [name="keterangan"]').attr('disabled', false)
					Func.populate({ cnt: '#form-review', record: result });
					$('#form-review').modal();
				} });
			});
			
			$('#datatable .btn-absensi').click(function() {
				var raw_record = $(this).parents('tr').find('span.hide').text();
				eval('var record = ' + raw_record);
				
				Func.form.submit({
					url: web.host + 'kepegawaian/absensi/masuk/action',
					param: { action: 'update_waktu', absensi: $(this).data('absensi'), id: record.id },
					callback: function(result) {
						dt.reload();
					}
				});
			});
		}
	}
	var dt = Func.datatable(param);
	setTimeout(function() {
		$('#datatable_filter input').val(page.data.current_date);
	}, 500);
	
	// form biodata
	$('.btn-add').click(function() {
		var date = str_pad(new Date().getDate(), 2, "0", 'STR_PAD_LEFT');
		var month = str_pad(new Date().getMonth() + 1, 2, "0", 'STR_PAD_LEFT');
		var current_date = date + '-' + month + '-' + new Date().getFullYear();
		
		$('#form-absensi form')[0].reset();
		$('#form-absensi [name="id"]').val(0);
		$('#form-absensi [name="tanggal"]').val(current_date);
		$('#form-absensi [name="biodata_id"]').val(page.data.biodata.id);
		$('#form-absensi').modal();
	});
	$('#form-absensi form').validate({
		rules: {
			tanggal: { required: true },
			label: { required: true }
		}
	});
	$('#form-absensi form').submit(function(e) {
		e.preventDefault();
		if (! $('#form-absensi form').valid()) {
			return false;
		}
		
		Func.form.submit({
			url: web.host + 'kepegawaian/absensi/masuk/action',
			param: Func.form.get_value('form-absensi'),
			callback: function(result) {
				dt.reload();
				$('#form-absensi').modal('hide');
			}
		});
	});
	
	// form agama
	$('#form-review form').submit(function(e) {
		e.preventDefault();
		if (! $('#form-review form').valid()) {
			return false;
		}
		
		var record = Func.form.get_value('form-review');
		var param = { action: 'update_keterangan', id: record.id, label: record.label, keterangan: record.keterangan }
		Func.form.submit({
			url: web.host + 'kepegawaian/absensi/masuk/action',
			param: param,
			callback: function(result) {
				dt.reload();
				$('#form-review').modal('hide');
				$('#form-review form')[0].reset();
			}
		});
	});
});
</script>
</body>
</html>