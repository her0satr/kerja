<?php
	$array_pangkat = $this->pangkat_model->get_array(array( 'limit' => 100 ));
?>
<?php $this->load->view( 'common/meta', array( 'title' => 'Pejabat' ) ); ?>

<body>
<?php $this->load->view( 'common/header'); ?>

<div class="content enlarged">
	<?php $this->load->view( 'common/sidebar'); ?>
	
  	<div class="mainbar">
	    <div class="page-head">
			<h2 class="pull-left button-back">Pejabat</h2>
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
									<th>Nama</th>
									<th>NIP</th>
									<th>Jabatan</th>
									<th>Unit Kerja</th>
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
				
				<div class="widget hide" id="form-pejabat">
					<div class="widget-head">
						<div class="pull-left">Form Pejabat</div>
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
								<label class="col-lg-2 control-label">Nama</label>
								<div class="col-lg-10">
									<input type="text" name="nama" class="form-control" placeholder="Nama" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">NIP</label>
								<div class="col-lg-10">
									<input type="text" name="nip" class="form-control" placeholder="NIP" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Pangkat / Golongan</label>
								<div class="col-lg-10">
									<select class="form-control" name="pangkat_id">
										<?php echo ShowOption(array( 'Array' => $array_pangkat )); ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Jabatan</label>
								<div class="col-lg-10">
									<input type="text" name="jabatan" class="form-control" placeholder="Jabatan" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Unit Kerja</label>
								<div class="col-lg-10">
									<input type="text" name="unit_kerja" class="form-control" placeholder="Unit Kerja" />
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
		show_grid: function() {
			$('.grid-main').show();
			$('#form-pejabat').hide();
		},
		show_form: function() {
			$('.grid-main').hide();
			$('#form-pejabat').show();
		}
	}
	
	// global
	$('.btn-show-grid').click(function() {
		page.show_grid();
	});
	
	// grid
	var param = {
		id: 'datatable',
		source: web.host + 'master/pejabat/grid',
		column: [ { }, { }, { }, { }, { bSortable: false, sClass: "center" } ],
		callback: function() {
			$('#datatable .btn-edit').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				Func.ajax({ url: web.host + 'master/pejabat/action', param: { action: 'get_by_id', id: record.id }, callback: function(result) {
					Func.populate({ cnt: '#form-pejabat', record: result });
					page.show_form();
				} });
			});
			
			$('#datatable .btn-delete').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				Func.form.del({
					data: { action: 'delete', id: record.id },
					url: web.host + 'master/pejabat/action', callback: function() { dt.reload(); }
				});
			});
		}
	}
	dt = Func.datatable(param);
	
	// form pejabat
	$('.btn-add').click(function() {
		page.show_form();
		$('#form-pejabat form')[0].reset();
		$('#form-pejabat [name="id"]').val(0);
	});
	$('#form-pejabat form').validate({
		rules: {
			nama: { required: true, minlength: 2 }
		}
	});
	$('#form-pejabat form').submit(function(e) {
		e.preventDefault();
		if (! $('#form-pejabat form').valid()) {
			return false;
		}
		
		Func.form.submit({
			url: web.host + 'master/pejabat/action',
			param: Func.form.get_value('form-pejabat'),
			callback: function(result) {
				dt.reload();
				page.show_grid();
				$('#form-pejabat form')[0].reset();
			}
		});
	});
});
</script>
</body>
</html>