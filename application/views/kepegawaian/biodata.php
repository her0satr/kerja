<?php
	$array_agama = $this->agama_model->get_array();
	$array_kelamin = $this->kelamin_model->get_array();
	$array_jenis_kepegawaian = $this->jenis_kepegawaian_model->get_array();
	$array_status_perkawinan = $this->status_perkawinan_model->get_array();
	$array_status_kepegawaian = $this->status_kepegawaian_model->get_array();
?>
<?php $this->load->view( 'common/meta', array( 'title' => 'Biodata' ) ); ?>

<body>
<?php $this->load->view( 'common/header'); ?>

<div class="content">
	<?php $this->load->view( 'common/sidebar'); ?>
	<div class="hide">
		<div class="cnt-data"><?php echo json_encode($page_data); ?></div>
		<iframe name="iframe_karpeg" src="<?php echo base_url('upload?callback=set_karpeg'); ?>"></iframe>
		<iframe name="iframe_kartu_nikah" src="<?php echo base_url('upload?callback=set_kartu_nikah'); ?>"></iframe>
	</div>
	
  	<div class="mainbar">
	    <div class="page-head">
			<h2 class="pull-left button-back">Biodata</h2>
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
									<th>Tanggal Lahir</th>
									<th>Tempat Lahir</th>
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
				
				<div class="widget hide" id="form-biodata">
					<div class="widget-head">
						<div class="pull-left">Form Biodata</div>
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
								<label class="col-lg-2 control-label">Karpeg</label>
								<div class="col-lg-4">
									<input type="text" name="karpeg" class="form-control" placeholder="Karpeg" />
								</div>
								<div class="col-lg-2">
									<input type="button" class="btn btn-primary btn-browse-karpeg" value="Browse" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Tempat Lahir</label>
								<div class="col-lg-10">
									<input type="text" name="tempat_lahir" class="form-control" placeholder="Tempat Lahir" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Tanggal Lahir</label>
								<div class="col-lg-10">
									<div class="input-append datepicker">
										<input name="tanggal_lahir" type="text" class="form-control dtpicker" placeholder="Tanggal Lahir" data-format="dd-MM-yyyy" />
										<span class="add-on"><i data-time-icon="fa fa-time" data-date-icon="fa fa-calendar" class="btn btn-info"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Agama</label>
								<div class="col-lg-10">
									<select class="form-control" name="agama_id">
										<?php echo ShowOption(array( 'Array' => $array_agama )); ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Jenis Kelamin</label>
								<div class="col-lg-10">
									<select class="form-control" name="kelamin">
										<?php echo ShowOption(array( 'Array' => $array_kelamin )); ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Status Kepegawaian</label>
								<div class="col-lg-10">
									<select class="form-control" name="status_kepegawaian_id">
										<?php echo ShowOption(array( 'Array' => $array_status_kepegawaian )); ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Jenis Kepegawaian</label>
								<div class="col-lg-10">
									<select class="form-control" name="jenis_kepegawaian_id">
										<?php echo ShowOption(array( 'Array' => $array_jenis_kepegawaian )); ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Status Perkawinan</label>
								<div class="col-lg-10">
									<select class="form-control" name="status_perkawinan_id">
										<?php echo ShowOption(array( 'Array' => $array_status_perkawinan )); ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Kartu Nikah</label>
								<div class="col-lg-4">
									<input type="text" name="kartu_nikah" class="form-control" placeholder="Kartu Nikah" />
								</div>
								<div class="col-lg-2">
									<input type="button" class="btn btn-primary btn-browse-kartu-nikah" value="Browse" />
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
			$('#form-biodata').hide();
		},
		show_form: function() {
			$('.grid-main').hide();
			$('#form-biodata').show();
		},
		show_form_detail: function() {
			$('.grid-main').hide();
			$('#form-biodata').show();
		}
	}
	
	// global
	$('.btn-show-grid').click(function() {
		page.show_grid();
	});
	
	// upload
	$('.btn-browse-karpeg').click(function() { window.iframe_karpeg.browse() });
	set_karpeg = function(p) {
		$('#form-biodata [name="karpeg"]').val(p.file_name);
	}
	$('.btn-browse-kartu-nikah').click(function() { window.iframe_kartu_nikah.browse() });
	set_kartu_nikah = function(p) {
		$('#form-biodata [name="kartu_nikah"]').val(p.file_name);
	}
	
	// grid
	var param = {
		id: 'datatable',
		source: web.host + 'kepegawaian/biodata/grid',
		column: [ { }, { }, { }, { }, { bSortable: false, sClass: "center" } ],
		callback: function() {
			$('#datatable .btn-edit').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				Func.ajax({ url: web.host + 'kepegawaian/biodata/action', param: { action: 'get_by_id', id: record.id }, callback: function(result) {
					Func.populate({ cnt: '#form-biodata', record: result });
					page.show_form();
				} });
			});
			
			$('#datatable .btn-detail').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				Func.ajax({ url: web.host + 'kepegawaian/biodata/action', param: { action: 'get_by_id', id: record.id }, callback: function(result) {
					Func.populate({ cnt: '#biodata-detail', record: result });
					page.show_form_detail();
				} });
			});
			
			$('#datatable .btn-delete').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				Func.form.del({
					data: { action: 'delete', id: record.id },
					url: web.host + 'kepegawaian/biodata/action', callback: function() { dt.reload(); }
				});
			});
		}
	}
	dt = Func.datatable(param);
	
	// form skpd
	$('.btn-add').click(function() {
		page.show_form();
		$('#form-biodata form')[0].reset();
		$('#form-biodata [name="id"]').val(0);
	});
	$('#form-biodata form').validate({
		rules: {
			nama: { required: true, minlength: 5 },
			tempat_lahir: { required: true },
			tanggal_lahir: { required: true },
			agama_id: { required: true },
			kelamin: { required: true }
		}
	});
	$('#form-biodata form').submit(function(e) {
		e.preventDefault();
		if (! $('#form-biodata form').valid()) {
			return false;
		}
		
		Func.form.submit({
			url: web.host + 'kepegawaian/biodata/action',
			param: Func.form.get_value('form-biodata'),
			callback: function(result) {
				dt.reload();
				page.show_grid();
				$('#form-biodata form')[0].reset();
			}
		});
	});
});
</script>
</body>
</html>