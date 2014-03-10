<?php
	$penjualan_id = (!empty($_GET['id'])) ? $_GET['id'] : 0;
	$page_data['penjualan_id'] = $penjualan_id;
?>
<?php $this->load->view( 'panel/common/meta', array( 'title' => 'Kwintasi' ) ); ?>

<body>
<?php $this->load->view( 'panel/common/header'); ?>

<div class="content">
	<?php $this->load->view( 'panel/common/sidebar'); ?>
	<div class="hide cnt-data"><?php echo json_encode($page_data); ?></div>
	
  	<div class="mainbar">
	    <div class="page-head">
			<h2 class="pull-left button-back">Kwintasi</h2>
			<div class="clearfix"></div>
		</div>
		
	    <div class="matter"><div class="container">
            <div class="row"><div class="col-md-12">
				
				<div class="widget grid-main">
					<div class="widget-head">
						<div class="pull-left">
							<button class="btn btn-info btn-xs btn-add-invoice">Tambah</button>
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
									<th>No</th>
									<th>Nilai</th>
									<th>Tanggal Cetak</th>
									<th>Control</th></tr>
							</thead>
							<tbody></tbody>
						</table>
						
						<div class="widget-foot">
							<br /><br />
							<div class="clearfix"></div> 
						</div>
					</div>
				</div>
				
				<div class="widget hide" id="form-invoice">
					<div class="widget-head">
						<div class="pull-left">Form Jenis Angsuran</div>
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
								<label class="col-lg-2 control-label">Kwintasi No</label>
								<div class="col-lg-10">
									<input type="text" name="no" class="form-control" placeholder="XXXXX" readonly="readonly" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Nilai Rupiah</label>
								<div class="col-lg-10">
									<input type="text" name="rupiah_angka" class="form-control" placeholder="Nilai Rupiah" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Uang Sebesar</label>
								<div class="col-lg-10">
									<textarea class="form-control" rows="3" name="rupiah_text" placeholder="Uang Sebesar"></textarea>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Yang Menyerahkan</label>
								<div class="col-lg-10">
									<input type="text" name="pengantar" class="form-control" placeholder="Yang Menyerahkan" />
								</div>
							</div>
							<div class="form-group cnt-content">
								<label class="col-lg-2 control-label">Keterangan</label>
								<div class="col-lg-10">
									<input type="text" name="content" class="form-control" placeholder="Keterangan" />
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
			$('#form-invoice').hide();
		},
		show_form_invoice: function() {
			$('.grid-main').hide();
			$('#form-invoice').show();
			
			if (page.data.penjualan_id == 0) {
				$('#form-invoice .cnt-content').show();
			} else {
				$('#form-invoice .cnt-content').hide();
			}
		},
		init: function() {
			var temp = $('.cnt-data').html();
			eval('var data = ' + temp);
			page.data = data;
		}
	}
	page.init();
	
	// global
	$('.btn-show-grid').click(function() {
		page.show_grid();
	});
	
	// grid
	var param = {
		id: 'datatable', aaSorting: [[ 0, "DESC" ]],
		source: web.host + 'panel/inventory/invoice/grid',
		column: [ { }, { }, { }, { bSortable: false, sClass: "center" } ],
		fnServerParams: function(aoData) {
			aoData.push( { name: 'penjualan_id', value: page.data.penjualan_id } );
		},
		callback: function() {
			$('#datatable .btn-edit').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				Func.ajax({ url: web.host + 'panel/inventory/invoice/action', param: { action: 'get_by_id', id: record.id }, callback: function(result) {
					$('#form-invoice [name="id"]').val(result.id);
					$('#form-invoice [name="no"]').val(result.no);
					$('#form-invoice [name="content"]').val(result.content);
					$('#form-invoice [name="rupiah_angka"]').val(result.rupiah_angka);
					$('#form-invoice [name="rupiah_text"]').val(result.rupiah_text);
					$('#form-invoice [name="pengantar"]').val(result.pengantar);
					page.show_form_invoice();
				} });
			});
			
			$('#datatable .btn-delete').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				Func.confirm_delete({
					data: { action: 'delete', id: record.id },
					url: web.host + 'panel/inventory/invoice/action', callback: function() { dt.reload(); }
				});
			});
		}
	}
	dt = Func.init_datatable(param);
	
	// form jenis angsuran
	$('.btn-add-invoice').click(function() {
		page.show_form_invoice();
		$('#form-invoice form')[0].reset();
		$('#form-invoice [name="id"]').val(0);
	});
	$('#form-invoice form').validate({
		rules: {
			name: { required: true, minlength: 2 }
		}
	});
	$('#form-invoice form').submit(function() {
		if (! $('#form-invoice form').valid()) {
			return false;
		}
		
		var param = Site.Form.GetValue('form-invoice');
		param.penjualan_id = page.data.penjualan_id;
		Func.ajax({ url: web.host + 'panel/inventory/invoice/action', param: param, callback: function(result) {
			if (result.status == 1) {
				dt.reload();
				page.show_grid();
				$('#form-invoice form')[0].reset();
			}
		} });
		
		return false;
	});
});
</script>
</body>
</html>