<?php $this->load->view( 'common/meta', array( 'title' => 'Rekap Absensi Masuk' ) ); ?>

<body>
<?php $this->load->view( 'common/header'); ?>

<div class="content">
	<?php $this->load->view( 'common/sidebar'); ?>
	
  	<div class="mainbar">
	    <div class="page-head">
			<h2 class="pull-left button-back">Rekap Absensi Masuk</h2>
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
								</div>
							</div>
						</form>
					</div>
				</div>
				
				<div class="widget grid-main">
					<div class="widget-head">
						<div class="pull-left">&nbsp;</div>
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
									<th class="center">Absensi #1</th>
									<th class="center">Absensi #2</th>
									<th class="center">Absensi #3</th>
									<th class="center">Absensi #4</th>
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
					<label class="col-lg-2 control-label">Absensi #1</label>
					<div class="col-lg-10">
						<div class="input-append timepicker">
							<input name="waktu_01" type="text" class="form-control tmpicker" data-format="hh:mm:ss" />
							<span class="add-on"><i data-time-icon="fa fa-clock-o" data-date-icon="fa fa-calendar" class="btn btn-info"></i></span>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-2 control-label">Absensi #2</label>
					<div class="col-lg-10">
						<div class="input-append timepicker">
							<input name="waktu_02" type="text" class="form-control tmpicker" data-format="hh:mm:ss" />
							<span class="add-on"><i data-time-icon="fa fa-clock-o" data-date-icon="fa fa-calendar" class="btn btn-info"></i></span>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-2 control-label">Absensi #3</label>
					<div class="col-lg-10">
						<div class="input-append timepicker">
							<input name="waktu_03" type="text" class="form-control tmpicker" data-format="hh:mm:ss" />
							<span class="add-on"><i data-time-icon="fa fa-clock-o" data-date-icon="fa fa-calendar" class="btn btn-info"></i></span>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-2 control-label">Absensi #4</label>
					<div class="col-lg-10">
						<div class="input-append timepicker">
							<input name="waktu_04" type="text" class="form-control tmpicker" data-format="hh:mm:ss" />
							<span class="add-on"><i data-time-icon="fa fa-clock-o" data-date-icon="fa fa-calendar" class="btn btn-info"></i></span>
						</div>
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
	// grid
	var param = {
		id: 'datatable',
		source: web.host + 'kepegawaian/absensi/list_masuk/grid',
		column: [ { sClass: "center" }, { sClass: "center" }, { sClass: "center" }, { sClass: "center" }, { sClass: "center" }, { sClass: "center" }, { bSortable: false, sClass: "center" } ],
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
				
				Func.ajax({ url: web.host + 'kepegawaian/absensi/list_masuk/action', param: { action: 'get_by_id', id: record.id }, callback: function(result) {
					Func.populate({ cnt: '#form-absensi', record: result });
					$('#form-absensi').modal();
				} });
			});
			
			$('#datatable .btn-delete').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				Func.form.del({
					data: { action: 'delete', id: record.id },
					url: web.host + 'kepegawaian/absensi/list_masuk/action', callback: function() { dt.reload(); }
				});
			});
		}
	}
	var dt = Func.datatable(param);
	
	// form search
	$('#form-search').submit(function(e) {
		e.preventDefault();
		dt.reload();
	});
	
	// form jam
	$('#form-absensi form').validate({
		rules: {
			jam_ke: { required: true },
			jam_awal: { required: true },
			jam_akhir: { required: true }
		}
	});
	$('#form-absensi form').submit(function(e) {
		e.preventDefault();
		if (! $('#form-absensi form').valid()) {
			return false;
		}
		
		Func.form.submit({
			url: web.host + 'kepegawaian/absensi/list_masuk/action',
			param: Func.form.get_value('form-absensi'),
			callback: function(result) {
				dt.reload();
				$('#form-absensi form')[0].reset();
				$('#form-absensi').modal('hide');
			}
		});
	});
});
</script>
</body>
</html>