<?php
	$user = $this->user_model->get_session();
	
	// hack
	$user['biodata_id'] = 3;
	
	$user['biodata_id'] = (isset($user['biodata_id'])) ? $user['biodata_id'] : 0;
	$biodata = $this->biodata_model->get_by_id(array( 'id' => $user['biodata_id'] ));
	if (count($biodata) == 0) {
		exit;
	}
	
	// page data
	$page_data['biodata'] = $biodata;
?>
<?php $this->load->view( 'common/meta', array( 'title' => 'Absensi Kosong' ) ); ?>

<body>
<?php $this->load->view( 'common/header'); ?>

<div class="content">
	<?php $this->load->view( 'common/sidebar'); ?>
	<div class="hide">
		<div class="cnt-data"><?php echo json_encode($page_data); ?></div>
	</div>
	
  	<div class="mainbar">
	    <div class="page-head">
			<h2 class="pull-left button-back">Absensi Kosong</h2>
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
									<th class="center">Status</th>
									<th class="center">Keterangan</th>
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
					<label class="col-lg-2 control-label">Status</label>
					<div class="col-lg-10">
						<select class="form-control" name="status_kosong">
							<option value="">-</option>
							<option value="Ijin">Ijin</option>
							<option value="Cuti">Cuti</option>
							<option value="Sakit">Sakit</option>
							<option value="Tanpa Keterangan">Tanpa Keterangan</option>
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
</div>

<?php $this->load->view( 'common/footer' ); ?>
<?php $this->load->view( 'common/library_js'); ?>

<script>
$(document).ready(function() {
	var page = {
		init: function() {
			// page data
			var raw = $('.cnt-data').text();
			eval('var data = ' + raw);
			page.data = data;
		}
	}
	page.init();
	
	// grid
	var param = {
		id: 'datatable',
		source: web.host + 'kepegawaian/absensi/kosong/grid',
		column: [ {
					sClass: "center"
			}, {	sClass: "center"
			}, {	
			}, {	bSortable: false, sClass: "center"
		} ],
		fnServerParams: function ( aoData ) {
			aoData.push(
				{ "name": "biodata_id", "value": page.data.biodata.id }
			)
		},
		callback: function() {
			$('#datatable .btn-edit').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				Func.ajax({ url: web.host + 'kepegawaian/absensi/kosong/action', param: { action: 'get_by_id', id: record.id }, callback: function(result) {
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
					url: web.host + 'kepegawaian/absensi/kosong/action', callback: function() { dt.reload(); }
				});
			});
		}
	}
	var dt = Func.datatable(param);
	
	// form biodata
	$('.btn-add').click(function() {
		$('#form-absensi form')[0].reset();
		$('#form-absensi [name="id"]').val(0);
		$('#form-absensi [name="biodata_id"]').val(page.data.biodata.id);
		$('#form-absensi').modal();
	});
	$('#form-absensi form').validate({
		rules: {
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
			url: web.host + 'kepegawaian/absensi/kosong/action',
			param: Func.form.get_value('form-absensi'),
			callback: function(result) {
				dt.reload();
				$('#form-absensi').modal('hide');
				$('#form-absensi form')[0].reset();
			}
		});
	});
});
</script>
</body>
</html>