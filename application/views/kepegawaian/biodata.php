<?php
	$array_agama = $this->agama_model->get_array();
	$array_kelamin = $this->kelamin_model->get_array();
	$array_pangkat = $this->pangkat_model->get_array(array( 'limit' => 100 ));
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
		<iframe name="iframe_photo" src="<?php echo base_url('upload?callback=set_photo'); ?>"></iframe>
		<iframe name="iframe_karpeg" src="<?php echo base_url('upload?callback=set_karpeg'); ?>"></iframe>
		<iframe name="iframe_kartu_nikah" src="<?php echo base_url('upload?callback=set_kartu_nikah'); ?>"></iframe>
		<iframe name="iframe_cpns" src="<?php echo base_url('upload?callback=set_cpns'); ?>"></iframe>
		<iframe name="iframe_pns" src="<?php echo base_url('upload?callback=set_pns'); ?>"></iframe>
		<iframe name="iframe_non_pns" src="<?php echo base_url('upload?callback=set_non_pns'); ?>"></iframe>
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
									<th>SKPD</th>
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
							<input type="hidden" name="photo" value="" />
							<input type="hidden" name="skpd_id" value="0" />
							
							<div class="center" style="position: absolute; right: 0px; width: 175px; z-index: 10; background: #FFFFFF; padding: 10px;">
								<div style="padding: 0 0 10px 0;"><img class="biodata_photo" src="<?php echo base_url('static/img/user1.png'); ?>" style="width: 100%;" /></div>
								<div><input type="button" class="btn btn-primary btn-browse-photo" value="Browse" /></div>
							</div>
							
							<div class="form-group">
								<label class="col-lg-2 control-label">Nama</label>
								<div class="col-lg-8">
									<input type="text" name="nama" class="form-control" placeholder="Nama" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Gelar Depan</label>
								<div class="col-lg-8">
									<input type="text" name="gelar_depan" class="form-control" placeholder="Gelar Depan" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Gelar Belakang</label>
								<div class="col-lg-8">
									<input type="text" name="gelar_belakang" class="form-control" placeholder="Gelar Belakang" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">NIP</label>
								<div class="col-lg-8">
									<input type="text" name="nip" class="form-control" placeholder="NIP" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">SKPD</label>
								<div class="col-lg-8 cnt-typeahead">
									<input type="text" name="skpd_title" class="form-control typeahead-skpd" placeholder="SKPD" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Karpeg</label>
								<div class="col-lg-4">
									<input type="text" name="karpeg" class="form-control" placeholder="Karpeg" />
								</div>
								<div class="col-lg-2">
									<input type="button" class="btn btn-primary btn-browse-karpeg" value="Browse" />
									<input type="button" class="btn btn-primary btn-check-file" value="Check" />
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
								<label class="col-lg-2 control-label">Karis/Karsu</label>
								<div class="col-lg-4">
									<input type="text" name="kartu_nikah" class="form-control" placeholder="Karis/Karsu" />
								</div>
								<div class="col-lg-2">
									<input type="button" class="btn btn-primary btn-browse-kartu-nikah" value="Browse" />
									<input type="button" class="btn btn-primary btn-check-file" value="Check" />
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
				
				<div class="widget hide" id="form-detail">
					<div class="widget-head">
						<div class="pull-left">Form Detail Pegawai</div>
						<div class="widget-icons pull-right">
							<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
							<a href="#" class="wclose"><i class="fa fa-times"></i></a>
						</div>
						<div class="clearfix"></div>
					</div>
					
					<div class="widget-content">
						<div class="padd"><form class="form-horizontal">
							<input type="hidden" name="action" value="update_detail" />
							<input type="hidden" name="id" value="0" />
							<input type="hidden" name="biodata_id" value="0" />
							<input type="hidden" name="unit_kerja_id" value="0" />
							
							<div class="form-group">
								<label class="col-lg-2 control-label left">CPNS</label>
								<div class="col-lg-4">
									<input type="text" name="cpns" class="form-control" placeholder="CPNS" />
								</div>
								<div class="col-lg-2">
									<input type="button" class="btn btn-primary btn-browse-cpns" value="Browse" />
									<input type="button" class="btn btn-primary btn-check-file" value="Check" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label left">PNS</label>
								<div class="col-lg-4">
									<input type="text" name="pns" class="form-control" placeholder="PNS" />
								</div>
								<div class="col-lg-2">
									<input type="button" class="btn btn-primary btn-browse-pns" value="Browse" />
									<input type="button" class="btn btn-primary btn-check-file" value="Check" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label left">Non PNS</label>
								<div class="col-lg-4">
									<input type="text" name="non_pns" class="form-control" placeholder="Non PNS" />
								</div>
								<div class="col-lg-2">
									<input type="button" class="btn btn-primary btn-browse-non_pns" value="Browse" />
									<input type="button" class="btn btn-primary btn-check-file" value="Check" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label left">Jabatan</label>
								<div class="col-lg-10">
									<input type="text" name="jabatan" class="form-control" placeholder="Jabatan" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label left">Unit Kerja</label>
								<div class="col-lg-10 cnt-typeahead">
									<input type="text" name="unit_kerja_text" class="form-control typeahead-unit_kerja" placeholder="Unit Kerja" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label left">Gaji</label>
								<div class="col-lg-10">
									<input type="text" name="gaji" class="form-control" placeholder="Gaji" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label left">Pangkat / Golongan</label>
								<div class="col-lg-10">
									<select class="form-control" name="pangkat_id">
										<?php echo ShowOption(array( 'Array' => $array_pangkat )); ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label left">Gol. Ruang</label>
								<div class="col-lg-10">
									<input type="text" name="golongan_ruang" class="form-control" placeholder="Gol. Ruang" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label left">TMT Pangkat</label>
								<div class="col-lg-10">
									<input type="text" name="tmt_pangkat" class="form-control" placeholder="TMT Pangkat" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label left">- Masa Kerja</label>
								<div class="col-lg-10">
									<input type="text" name="tmt_masa_kerja" class="form-control" placeholder="Masa Kerja" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label left">- Tahun</label>
								<div class="col-lg-10">
									<input type="text" name="tmt_tahun" class="form-control" placeholder="Tahun" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label left">- Bulan</label>
								<div class="col-lg-10">
									<input type="text" name="tmt_bulan" class="form-control" placeholder="Bulan" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label left">No HP</label>
								<div class="col-lg-10">
									<input type="text" name="hp" class="form-control" placeholder="No HP" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label left">Email</label>
								<div class="col-lg-10">
									<input type="text" name="email" class="form-control" placeholder="Email" />
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
			$('#form-detail').hide();
		},
		show_form: function() {
			$('.grid-main').hide();
			$('#form-biodata').show();
			$('#form-detail').hide();
		},
		show_form_detail: function() {
			$('.grid-main').hide();
			$('#form-biodata').hide();
			$('#form-detail').show();
		}
	}
	
	// global
	$('.btn-show-grid').click(function() {
		page.show_grid();
	});
	
	// skpd
	var skpd_store = new Bloodhound({
		datumTokenizer: Bloodhound.tokenizers.obj.whitespace('title'),
		queryTokenizer: Bloodhound.tokenizers.whitespace,
		prefetch: web.host + 'typeahead?action=skpd',
		remote: web.host + 'typeahead?action=skpd&namelike=%QUERY'
	});
	skpd_store.initialize();
	var unit_kerja = $('.typeahead-unit_kerja').typeahead(null, {
		name: 'unit-kerja',
		displayKey: 'title',
		source: skpd_store.ttAdapter(),
		templates: {
			empty: [
				'<div class="empty-message">',
				'no result found.',
				'</div>'
			].join('\n'),
			suggestion: Handlebars.compile('<p><strong>{{title}}</strong></p>')
		}
	});
	unit_kerja.on('typeahead:selected', function(evt, data) {
		$('#form-detail [name="unit_kerja_id"]').val(data.id);
	});
	var skpd = $('.typeahead-skpd').typeahead(null, {
		name: 'skpd',
		displayKey: 'title',
		source: skpd_store.ttAdapter(),
		templates: {
			empty: [
				'<div class="empty-message">',
				'no result found.',
				'</div>'
			].join('\n'),
			suggestion: Handlebars.compile('<p><strong>{{title}}</strong></p>')
		}
	});
	skpd.on('typeahead:selected', function(evt, data) {
		$('#form-biodata [name="skpd_id"]').val(data.id);
	});
	
	// upload
	$('.btn-browse-photo').click(function() { window.iframe_photo.browse() });
	set_photo = function(p) {
		$('#form-biodata [name="photo"]').val(p.file_name);
		$('#form-biodata .biodata_photo').attr('src', p.file_link);
	}
	$('.btn-browse-karpeg').click(function() { window.iframe_karpeg.browse() });
	set_karpeg = function(p) {
		$('#form-biodata [name="karpeg"]').val(p.file_name);
	}
	$('.btn-browse-kartu-nikah').click(function() { window.iframe_kartu_nikah.browse() });
	set_kartu_nikah = function(p) {
		$('#form-biodata [name="kartu_nikah"]').val(p.file_name);
	}
	$('.btn-browse-cpns').click(function() { window.iframe_cpns.browse() });
	set_cpns = function(p) {
		$('#form-detail [name="cpns"]').val(p.file_name);
	}
	$('.btn-browse-pns').click(function() { window.iframe_pns.browse() });
	set_pns = function(p) {
		$('#form-detail [name="pns"]').val(p.file_name);
	}
	$('.btn-browse-non_pns').click(function() { window.iframe_non_pns.browse() });
	set_non_pns = function(p) {
		$('#form-detail [name="non_pns"]').val(p.file_name);
	}
	
	// grid
	var param = {
		id: 'datatable',
		source: web.host + 'kepegawaian/biodata/grid',
		column: [ { }, { }, { }, { }, { }, { bSortable: false, sClass: "center" } ],
		callback: function() {
			$('#datatable .btn-edit').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				Func.ajax({ url: web.host + 'kepegawaian/biodata/action', param: { action: 'get_by_id', id: record.id }, callback: function(result) {
					Func.populate({ cnt: '#form-biodata', record: result });
					$('#form-biodata .biodata_photo').attr('src', result.link_photo);
					page.show_form();
				} });
			});
			
			$('#datatable .btn-detail').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				Func.ajax({ url: web.host + 'kepegawaian/biodata/action', param: { action: 'get_biodata_detail_by_id', id: record.id }, callback: function(result) {
					$('#form-detail form')[0].reset();
					Func.populate({ cnt: '#form-detail', record: result });
					page.show_form_detail();
				} });
			});
			
			$('#datatable .btn-riwayat').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				window.open(record.link_riwayat);
			});
			
			$('#datatable .btn-login').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				record.action = 'create_login';
				
				Func.form.submit({
					url: web.host + 'kepegawaian/biodata/action',
					param: record,
					callback: function(result) {
						dt.reload();
					}
				});
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
	
	// form biodata
	$('.btn-add').click(function() {
		page.show_form();
		$('#form-biodata form')[0].reset();
		$('#form-biodata [name="id"]').val(0);
		$('#form-biodata .biodata_photo').attr('src', web.host + 'static/img/user1.png');
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
	
	// form detail
	$('#form-detail form').validate({
		rules: {
			hp: { required: true }
		}
	});
	$('#form-detail form').submit(function(e) {
		e.preventDefault();
		if (! $('#form-detail form').valid()) {
			return false;
		}
		
		Func.form.submit({
			url: web.host + 'kepegawaian/biodata/action',
			param: Func.form.get_value('form-detail'),
			callback: function(result) {
				page.show_grid();
			}
		});
	});
});
</script>
</body>
</html>