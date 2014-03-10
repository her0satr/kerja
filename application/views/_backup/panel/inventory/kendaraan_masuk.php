<?php
	$array_jenis_unit = $this->Jenis_Unit_model->get_array();
?>
<?php $this->load->view( 'panel/common/meta', array( 'title' => 'Kendaraan Masuk' ) ); ?>
<body>
<?php $this->load->view( 'panel/common/header'); ?>

<div class="content">
	<?php $this->load->view( 'panel/common/sidebar'); ?>
	
  	<div class="mainbar">
	    <div class="page-head">
			<h2 class="pull-left button-back">Kendaraan Masuk</h2>
			<div class="clearfix"></div>
		</div>
		
	    <div class="matter"><div class="container">
            <div class="row"><div class="col-md-12">
				
				<div class="widget grid-main">
					<div class="widget-head">
						<div class="pull-left">
							<button class="btn btn-info btn-xs btn-add-kendaraan-masuk">Tambah</button>
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
									<th>Tanggal</th>
									<th>Jenis Unit</th>
									<th>Warna</th>
									<th>Jumlah</th>
									<th>Total</th></tr>
							</thead>
							<tbody></tbody>
						</table>
						
						<div class="widget-foot">
							<br /><br />
							<div class="clearfix"></div> 
						</div>
					</div>
				</div>
				
				<div class="widget hide" id="form-kendaraan-masuk">
					<div class="widget-head">
						<div class="pull-left">Form Kendaraan Masuk</div>
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
							
							<div class="form-group">
								<label class="col-lg-2 control-label">Jenis Unit</label>
								<div class="col-lg-10">
									<select class="form-control" name="jenis_unit_id">
										<?php echo ShowOption(array( 'Array' => $array_jenis_unit )); ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Jenis Warna</label>
								<div class="col-lg-10">
									<select class="form-control" name="jenis_warna_id">
										<option value="">-</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Tanggal Masuk</label>
								<div class="col-lg-10">
									<div class="input-append datepicker">
										<input name="stock_date" type="text" class="form-control dtpicker" placeholder="Tanggal Masuk" data-format="dd-MM-yyyy" />
										<span class="add-on"><i data-time-icon="fa fa-time" data-date-icon="fa fa-calendar" class="btn btn-info"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Jumlah</label>
								<div class="col-lg-10">
									<input type="text" name="stock_update" class="form-control" placeholder="Jumlah" />
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

<?php $this->load->view( 'panel/common/footer' ); ?>
<?php $this->load->view( 'panel/common/library_js'); ?>

<script>
$(document).ready(function() {
	var dt = null;
	var page = {
		show_grid: function() {
			$('.grid-main').show();
			$('#form-kendaraan-masuk').hide();
		},
		show_form_kendaraan_masuk: function() {
			$('.grid-main').hide();
			$('#form-kendaraan-masuk').show();
		}
	}
	
	// global
	$('.btn-show-grid').click(function() {
		page.show_grid();
	});
	
	// grid
	var param = {
		id: 'datatable', aaSorting: [[ 0, "DESC" ]],
		source: web.host + 'panel/inventory/kendaraan_masuk/grid',
		column: [ { }, { bSortable: false }, { bSortable: false }, { bSortable: false, sClass: "center" }, { bSortable: false, sClass: "center" } ]
	}
	dt = Func.init_datatable(param);
	
	// form jenis leasing
	$('.btn-add-kendaraan-masuk').click(function() {
		var date = str_pad(new Date().getDate(), 2, "0", 'STR_PAD_LEFT');
		var month = str_pad(new Date().getMonth() + 1, 2, "0", 'STR_PAD_LEFT');
		var current_date = date + '-' + month + '-' + new Date().getFullYear();
		
		page.show_form_kendaraan_masuk();
		$('#form-kendaraan-masuk form')[0].reset();
		$('#form-kendaraan-masuk [name="id"]').val(0);
		$('#form-kendaraan-masuk [name="stock_date"]').val(current_date);
	});
	$('#form-kendaraan-masuk [name="jenis_unit_id"]').change(function() {
		combo.jenis_warna({ jenis_unit_id: $(this).val(), target: $('#form-kendaraan-masuk [name="jenis_warna_id"]') });
	});
	$('#form-kendaraan-masuk form').validate({
		rules: {
			jenis_unit_id: { required: true },
			jenis_warna_id: { required: true },
			stock_date: { required: true },
			stock_update: { required: true }
		}
	});
	$('#form-kendaraan-masuk form').submit(function() {
		if (! $('#form-kendaraan-masuk form').valid()) {
			return false;
		}
		
		var param = Site.Form.GetValue('form-kendaraan-masuk');
		param.stock_date = Func.SwapDate(param.stock_date);
		Func.ajax({ url: web.host + 'panel/inventory/kendaraan_masuk/action', param: param, callback: function(result) {
			if (result.status == 1) {
				dt.reload();
				page.show_grid();
				$('#form-kendaraan-masuk form')[0].reset();
			}
		} });
		
		return false;
	});
});
</script>
</body>
</html>