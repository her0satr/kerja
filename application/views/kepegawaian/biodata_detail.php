<?php
	$array_agama = $this->agama_model->get_array();
	$array_kelamin = $this->kelamin_model->get_array();
	$array_jenis_kepegawaian = $this->jenis_kepegawaian_model->get_array();
	$array_status_perkawinan = $this->status_perkawinan_model->get_array();
	$array_status_kepegawaian = $this->status_kepegawaian_model->get_array();
	
	$page_data['user'] = $this->user_model->get_session();
?>
<?php $this->load->view( 'common/meta', array( 'title' => 'Biodata' ) ); ?>

<body>
<?php $this->load->view( 'common/header'); ?>

<div class="content enlarged">
	<?php $this->load->view( 'common/sidebar'); ?>
	<div class="hide">
		<div class="cnt-data"><?php echo json_encode($page_data); ?></div>
	</div>
	
  	<div class="mainbar">
	    <div class="page-head">
			<h2 class="pull-left button-back">Biodata</h2>
			<div class="clearfix"></div>
		</div>
		
	    <div class="matter"><div class="container">
            <div class="row"><div class="col-md-12">
				
				<div class="widget" id="form-biodata">
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
							<input type="hidden" name="skpd_id" value="0" />
							
							<div class="center" style="position: absolute; right: 0px; width: 175px; z-index: 10; background: #FFFFFF; padding: 10px;">
								<div style="padding: 0 0 10px 0;"><img class="biodata_photo" src="<?php echo base_url('static/img/user1.png'); ?>" style="width: 100%;" /></div>
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
									<input type="button" class="btn btn-primary btn-check-file" value="Check" />
								</div>
							</div>
						</form></div>
					</div>
				</div>  
				
				<div class="widget" id="form-detail">
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
									<input type="button" class="btn btn-primary btn-check-file" value="Check" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label left">PNS</label>
								<div class="col-lg-4">
									<input type="text" name="pns" class="form-control" placeholder="PNS" />
								</div>
								<div class="col-lg-2">
									<input type="button" class="btn btn-primary btn-check-file" value="Check" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label left">Non PNS</label>
								<div class="col-lg-4">
									<input type="text" name="non_pns" class="form-control" placeholder="Non PNS" />
								</div>
								<div class="col-lg-2">
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
		init: function() {
			var temp = $('.cnt-data').html();
			eval('var data = ' + temp);
			page.data = data;
			
			// load data pegawai
			Func.ajax({ url: web.host + 'kepegawaian/biodata/action', param: { action: 'get_by_id', id: page.data.user.biodata_id }, callback: function(result) {
				Func.populate({ cnt: '#form-biodata', record: result });
				$('#form-biodata .biodata_photo').attr('src', result.link_photo);
			} });
			
			// load detail pegawai
			Func.ajax({ url: web.host + 'kepegawaian/biodata/action', param: { action: 'get_biodata_detail_by_id', id: page.data.user.biodata_id }, callback: function(result) {
				$('#form-detail form')[0].reset();
				Func.populate({ cnt: '#form-detail', record: result });
			} });
			
			$('#form-biodata, #form-detail').find('[type="text"]').attr('disabled', 'disabled');
			$('#form-biodata, #form-detail').find('select').attr('disabled', 'disabled');
		}
	}
	
	page.init();
});
</script>
</body>
</html>