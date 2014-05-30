<?php
	// master
	$user = $this->user_model->get_session();
	$biodata = $this->biodata_model->get_by_id(array( 'id' => $user['biodata_id'] ));
	$array_year = get_array_year(array( 'YearMin' => 2013 ));
	$array_pangkat = $this->pangkat_model->get_array(array( 'limit' => 100 ));
	$array_perilaku_kerja = $this->perilaku_kerja_model->get_array(array( 'limit' => 100 ));
	
	// page data
	$page_data['user'] = $user;
	$page_data['biodata'] = $biodata;
	$page_data['USER_ID_PEGAWAI'] = USER_ID_PEGAWAI;
?>
<?php $this->load->view( 'common/meta', array( 'title' => 'SKP Tahunan' ) ); ?>

<body>
<?php $this->load->view( 'common/header'); ?>

<div class="content enlarged">
	<?php $this->load->view( 'common/sidebar'); ?>
	<div class="hide">
		<div class="cnt-data"><?php echo json_encode($page_data); ?></div>
	</div>
	
  	<div class="mainbar">
	    <div class="page-head">
			<h2 class="pull-left button-back">SKP Tahunan</h2>
			<div class="clearfix"></div>
		</div>
        
	    <div class="matter"><div class="container">
            <div class="row"><div class="col-md-12">
				
				<div class="widget" id="form-search">
					<div class="widget-head">
						<div class="pull-left">Form Pencarian</div>
						<div class="widget-icons pull-right">
							<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
							<a href="#" class="wclose"><i class="fa fa-times"></i></a>
						</div>
						<div class="clearfix"></div>
					</div>
					
					<div class="widget-content">
						<div class="padd"><form class="form-horizontal">
							<input type="hidden" name="biodata_id" value="0" />
							
							<div class="form-group cnt-search-biodata hide">
								<label class="col-lg-2 control-label">Nama Pegawai</label>
								<div class="col-lg-10 cnt-typeahead">
									<input type="text" name="biodata_title" class="form-control typeahead-biodata" placeholder="Nama Pegawai" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Tahun</label>
								<div class="col-lg-10">
									<select class="form-control" name="tahun">
										<?php echo ShowOption(array( 'Array' => $array_year )); ?>
									</select>
								</div>
							</div>
						</form></div>
					</div>
				</div>
				
				<div class="cnt-summary">
					<h3>SKP Info</h3>
					<div class="widget grid-main">
						<div class="widget-head">
							<div class="pull-left">
								<button class="btn btn-info btn-xs btn-add-skp-summary">Tambah</button>
							</div>
							<div class="widget-icons pull-right">
								<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
								<a href="#" class="wclose"><i class="fa fa-times"></i></a>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="widget-content">
							<table id="dt-skp-summary" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th class="center">Tanggal Pembuatan</th>
										<th class="center">Tanggal Penilaian</th>
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
				</div>
				
				<div class="cnt-sasaran">
					<h3>SKP Sasaran Kerja</h3>
					<div class="widget grid-main">
						<div class="widget-head">
							<div class="pull-left">
								<button class="btn btn-info btn-xs btn-add-skp-sasaran">Tambah</button>
								<button class="btn btn-info btn-xs btn-print-skp-sasaran">Cetak</button>
							</div>
							<div class="widget-icons pull-right">
								<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
								<a href="#" class="wclose"><i class="fa fa-times"></i></a>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="widget-content">
							<table id="dt-skp-sasaran" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>Jenis SKP</th>
										<th class="center">AK</th>
										<th class="center">Kuant</th>
										<th class="center">Kual</th>
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
				</div>
				
				<div class="cnt-pejabat">
					<h3>SKP Pejabat</h3>
					<div class="widget grid-main">
						<div class="widget-head">
							<div class="pull-left">
								<button class="btn btn-info btn-xs btn-add-skp-pejabat">Tambah</button>
							</div>
							<div class="widget-icons pull-right">
								<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
								<a href="#" class="wclose"><i class="fa fa-times"></i></a>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="widget-content">
							<table id="dt-skp-pejabat" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>Nama</th>
										<th class="center">NIP</th>
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
				</div>
				
				<div class="cnt-realisasi">
					<h3>SKP Realisasi</h3>
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
							<table id="dt-skp-realisasi" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>Jenis SKP</th>
										<th class="center">Kuant</th>
										<th class="center">Kual</th>
										<th class="center">Waktu</th>
										<th class="center">Biaya</th>
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
				</div>
				
				<div class="cnt-tugas-tambahan">
					<h3>SKP Tugas Tambahan</h3>
					<div class="widget grid-main">
						<div class="widget-head">
							<div class="pull-left">
								<button class="btn btn-info btn-xs btn-add-skp-tugas-tambahan">Tambah</button>
							</div>
							<div class="widget-icons pull-right">
								<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
								<a href="#" class="wclose"><i class="fa fa-times"></i></a>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="widget-content">
							<table id="dt-skp-tugas-tambahan" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>Judul</th>
										<th class="center">Perhituangan</th>
										<th class="center">Nilai Capaian</th>
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
				</div>
				
				<div class="cnt-kreativitas">
					<h3>SKP Kreativitas</h3>
					<div class="widget grid-main">
						<div class="widget-head">
							<div class="pull-left">
								<button class="btn btn-info btn-xs btn-add-skp-kreativitas">Tambah</button>
							</div>
							<div class="widget-icons pull-right">
								<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
								<a href="#" class="wclose"><i class="fa fa-times"></i></a>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="widget-content">
							<table id="dt-skp-kreativitas" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>Judul</th>
										<th class="center">Perhituangan</th>
										<th class="center">Nilai Capaian</th>
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
				</div>
				
				<div class="cnt-perilaku-kerja">
					<h3>SKP Perilaku Kerja</h3>
					<div class="widget grid-main">
						<div class="widget-head">
							<div class="pull-left">
								<button class="btn btn-info btn-xs btn-add-skp-perilaku-kerja">Tambah</button>
							</div>
							<div class="widget-icons pull-right">
								<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
								<a href="#" class="wclose"><i class="fa fa-times"></i></a>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="widget-content">
							<table id="dt-skp-perilaku-kerja" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>Judul</th>
										<th class="center">Nilai</th>
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
				</div>
				
				<div class="widget hide" id="form-summary">
					<div class="widget-head">
						<div class="pull-left">Form SKP Info</div>
						<div class="widget-icons pull-right">
							<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
							<a href="#" class="wclose"><i class="fa fa-times"></i></a>
						</div>
						<div class="clearfix"></div>
					</div>
					
					<div class="widget-content">
						<div class="padd"><form class="form-horizontal">
							<input type="hidden" name="action" value="skp_summary_update" />
							<input type="hidden" name="id" value="0" />
							<input type="hidden" name="tahun" />
							<input type="hidden" name="biodata_id" />
							
							<div class="form-group">
								<label class="col-lg-2 control-label">Tanggal Pembuatan</label>
								<div class="col-lg-10">
									<div class="input-append datepicker">
										<input name="tanggal_pembuatan" type="text" class="form-control dtpicker" placeholder="Tanggal Pembuatan" data-format="dd-MM-yyyy" />
										<span class="add-on"><i data-time-icon="fa fa-time" data-date-icon="fa fa-calendar" class="btn btn-info"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Tanggal Penilaian</label>
								<div class="col-lg-10">
									<div class="input-append datepicker">
										<input name="tanggal_penilaian" type="text" class="form-control dtpicker" placeholder="Tanggal Penilaian" data-format="dd-MM-yyyy" />
										<span class="add-on"><i data-time-icon="fa fa-time" data-date-icon="fa fa-calendar" class="btn btn-info"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Keberatan</label>
								<div class="col-lg-10">
									<textarea name="keberatan" class="form-control" placeholder="Keberatan"></textarea>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Tanggal Keberatan</label>
								<div class="col-lg-10">
									<div class="input-append datepicker">
										<input name="tanggal_keberatan" type="text" class="form-control dtpicker" placeholder="Tanggal Keberatan" data-format="dd-MM-yyyy" />
										<span class="add-on"><i data-time-icon="fa fa-time" data-date-icon="fa fa-calendar" class="btn btn-info"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Tanggapan</label>
								<div class="col-lg-10">
									<textarea name="tanggapan" class="form-control" placeholder="Keberatan"></textarea>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Tanggal Tanggapan</label>
								<div class="col-lg-10">
									<div class="input-append datepicker">
										<input name="tanggal_tanggapan" type="text" class="form-control dtpicker" placeholder="Tanggal Tanggapan" data-format="dd-MM-yyyy" />
										<span class="add-on"><i data-time-icon="fa fa-time" data-date-icon="fa fa-calendar" class="btn btn-info"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Keputusan</label>
								<div class="col-lg-10">
									<textarea name="keputusan" class="form-control" placeholder="Keputusan"></textarea>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Tanggal Keputusan</label>
								<div class="col-lg-10">
									<div class="input-append datepicker">
										<input name="tanggal_keputusan" type="text" class="form-control dtpicker" placeholder="Tanggal Keputusan" data-format="dd-MM-yyyy" />
										<span class="add-on"><i data-time-icon="fa fa-time" data-date-icon="fa fa-calendar" class="btn btn-info"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Rekomendasi</label>
								<div class="col-lg-10">
									<textarea name="rekomendasi" class="form-control" placeholder="Rekomendasi"></textarea>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-6 control-label">Tanggal Dibuat</label>
								<div class="col-lg-6">
									<div class="input-append datepicker">
										<input name="tanggal_dibuat" type="text" class="form-control dtpicker" data-format="dd-MM-yyyy" />
										<span class="add-on"><i data-time-icon="fa fa-time" data-date-icon="fa fa-calendar" class="btn btn-info"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-6 control-label">Tanggal Diterima (PNS)</label>
								<div class="col-lg-6">
									<div class="input-append datepicker">
										<input name="tanggal_diterima_pns" type="text" class="form-control dtpicker" data-format="dd-MM-yyyy" />
										<span class="add-on"><i data-time-icon="fa fa-time" data-date-icon="fa fa-calendar" class="btn btn-info"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-6 control-label">Tanggal Diterima (Atasan Pejabat)</label>
								<div class="col-lg-6">
									<div class="input-append datepicker">
										<input name="tanggal_diterima_atasan" type="text" class="form-control dtpicker" data-format="dd-MM-yyyy" />
										<span class="add-on"><i data-time-icon="fa fa-time" data-date-icon="fa fa-calendar" class="btn btn-info"></i></span>
									</div>
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
				
				<div class="widget hide" id="form-sasaran">
					<div class="widget-head">
						<div class="pull-left">Form SKP Sasaran Kerja</div>
						<div class="widget-icons pull-right">
							<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
							<a href="#" class="wclose"><i class="fa fa-times"></i></a>
						</div>
						<div class="clearfix"></div>
					</div>
					
					<div class="widget-content">
						<div class="padd"><form class="form-horizontal">
							<input type="hidden" name="action" value="skp_sasaran_update" />
							<input type="hidden" name="id" value="0" />
							<input type="hidden" name="tahun" />
							<input type="hidden" name="biodata_id" />
							
							<div class="form-group">
								<label class="col-lg-2 control-label">Jenis SKP</label>
								<div class="col-lg-10">
									<select class="form-control" name="jenis_skp_id">
										<option value="0">-</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">AK</label>
								<div class="col-lg-10">
									<input type="text" name="ak" class="form-control" placeholder="AK" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Kuant Nilai</label>
								<div class="col-lg-10">
									<input type="text" name="kuant_nilai" class="form-control" placeholder="Kuant Nilai" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Kual</label>
								<div class="col-lg-10">
									<input type="text" name="kual" class="form-control" placeholder="Kual" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Waktu Nilai</label>
								<div class="col-lg-10">
									<input type="text" name="waktu_nilai" class="form-control" placeholder="Waktu Nilai" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Waktu Satuan</label>
								<div class="col-lg-10">
									<input type="text" name="waktu_satuan" class="form-control" placeholder="Waktu Satuan" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Biaya</label>
								<div class="col-lg-10">
									<input type="text" name="biaya" class="form-control" placeholder="Biaya" />
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
	
	<div id="form-pejabat" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"><div class="modal-dialog modal-dialog-big"><div class="modal-content"><form>
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h4 class="modal-title">Form SKP Pejabat</h4>
		</div>
		<div class="modal-body"><div class="widget-content">
			<div class="padd"><div class="form-horizontal">
				<input type="hidden" name="action" value="skp_pejabat_update" />
				<input type="hidden" name="id" value="0" />
				<input type="hidden" name="tahun" />
				<input type="hidden" name="biodata_id" />
				
				<div class="form-group">
					<label class="col-lg-4 control-label">Jabatan</label>
					<div class="col-lg-8">
						<select class="form-control" name="posisi">
							<option value="">-</option>
							<option value="Pejabat Penilai">Pejabat Penilai</option>
							<option value="Atasan Pejabat Penilai">Atasan Pejabat Penilai</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-4 control-label">Nama</label>
					<div class="col-lg-8">
						<input type="text" name="nama" class="form-control" placeholder="Nama" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-4 control-label">NIP</label>
					<div class="col-lg-8">
						<input type="text" name="nip" class="form-control" placeholder="NIP" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-4 control-label">Pangkat / Golongan</label>
					<div class="col-lg-8">
						<select class="form-control" name="pangkat_id">
							<?php echo ShowOption(array( 'Array' => $array_pangkat )); ?>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-4 control-label">Jabatan</label>
					<div class="col-lg-8">
						<input type="text" name="jabatan" class="form-control" placeholder="Jabatan" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-4 control-label">Unit Kerja</label>
					<div class="col-lg-8">
						<input type="text" name="unit_kerja" class="form-control" placeholder="Unit Kerja" />
					</div>
				</div>
			</div></div>
		</div></div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal" aria-hidden="true">Close</button>
			<button type="submit" class="btn btn-primary">Save changes</button>
		</div>
	</form></div></div></div>
	
	<div id="form-realisasi" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"><div class="modal-dialog modal-dialog-big"><div class="modal-content"><form>
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h4 class="modal-title">Form SKP Realisasi</h4>
		</div>
		<div class="modal-body"><div class="widget-content">
			<div class="padd"><div class="form-horizontal">
				<input type="hidden" name="action" value="skp_realisasi_update" />
				<input type="hidden" name="skp_sasaran_kerja_id" value="0" />
				
				<div class="form-group">
					<label class="col-lg-4 control-label">Waktu Nilai</label>
					<div class="col-lg-8">
						<input type="text" name="waktu_nilai" class="form-control" placeholder="Waktu Nilai" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-4 control-label">Waktu Satuan</label>
					<div class="col-lg-8">
						<input type="text" name="waktu_satuan" class="form-control" placeholder="Waktu Satuan" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-4 control-label">Biaya</label>
					<div class="col-lg-8">
						<input type="text" name="biaya" class="form-control" placeholder="Biaya" />
					</div>
				</div>
			</div></div>
		</div></div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal" aria-hidden="true">Close</button>
			<button type="submit" class="btn btn-primary">Save changes</button>
		</div>
	</form></div></div></div>
	
	<div id="form-tugas-tambahan" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"><div class="modal-dialog modal-dialog-big"><div class="modal-content"><form>
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h4 class="modal-title">Form SKP Tugas Tambahan</h4>
		</div>
		<div class="modal-body"><div class="widget-content">
			<div class="padd"><div class="form-horizontal">
				<input type="hidden" name="action" value="skp_tugas_tambahan_update" />
				<input type="hidden" name="id" value="0" />
				<input type="hidden" name="tahun" />
				<input type="hidden" name="biodata_id" />
				
				<div class="form-group">
					<label class="col-lg-4 control-label">Judul</label>
					<div class="col-lg-8">
						<input type="text" name="title" class="form-control" placeholder="Judul" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-4 control-label">Perhitungan</label>
					<div class="col-lg-8">
						<input type="text" name="perhitungan" class="form-control" placeholder="Perhitungan" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-4 control-label">Nilai Capaian</label>
					<div class="col-lg-8">
						<input type="text" name="nilai_capaian" class="form-control" placeholder="NIP" />
					</div>
				</div>
			</div></div>
		</div></div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal" aria-hidden="true">Close</button>
			<button type="submit" class="btn btn-primary">Save changes</button>
		</div>
	</form></div></div></div>
	
	<div id="form-kreativitas" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"><div class="modal-dialog modal-dialog-big"><div class="modal-content"><form>
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h4 class="modal-title">Form SKP Kreativitas</h4>
		</div>
		<div class="modal-body"><div class="widget-content">
			<div class="padd"><div class="form-horizontal">
				<input type="hidden" name="action" value="skp_kreativitas_update" />
				<input type="hidden" name="id" value="0" />
				<input type="hidden" name="tahun" />
				<input type="hidden" name="biodata_id" />
				
				<div class="form-group">
					<label class="col-lg-4 control-label">Judul</label>
					<div class="col-lg-8">
						<input type="text" name="title" class="form-control" placeholder="Judul" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-4 control-label">Perhitungan</label>
					<div class="col-lg-8">
						<input type="text" name="perhitungan" class="form-control" placeholder="Perhitungan" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-4 control-label">Nilai Capaian</label>
					<div class="col-lg-8">
						<input type="text" name="nilai_capaian" class="form-control" placeholder="NIP" />
					</div>
				</div>
			</div></div>
		</div></div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal" aria-hidden="true">Close</button>
			<button type="submit" class="btn btn-primary">Save changes</button>
		</div>
	</form></div></div></div>
	
	<div id="form-perilaku-kerja" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"><div class="modal-dialog modal-dialog-big"><div class="modal-content"><form>
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h4 class="modal-title">Form SKP Perilaku Kerja</h4>
		</div>
		<div class="modal-body"><div class="widget-content">
			<div class="padd"><div class="form-horizontal">
				<input type="hidden" name="action" value="skp_perilaku_kerja_update" />
				<input type="hidden" name="id" value="0" />
				<input type="hidden" name="tahun" />
				<input type="hidden" name="biodata_id" />
				
				<div class="form-group">
					<label class="col-lg-4 control-label">Judul</label>
					<div class="col-lg-8">
						<select class="form-control" name="perilaku_kerja_id">
							<?php echo ShowOption(array( 'Array' => $array_perilaku_kerja )); ?>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-4 control-label">Nilai</label>
					<div class="col-lg-8">
						<input type="text" name="nilai" class="form-control" placeholder="Nilai" />
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
			
			// auto set for pegawai
			if (page.data.user.user_type_id == page.data.USER_ID_PEGAWAI) {
				$('#form-search [name="biodata_id"]').val(page.data.user.biodata_id);
			} else {
				$('#form-search .cnt-search-biodata').show();
			}
		},
		show_grid: function() {
			$('#form-search').show();
			$('.cnt-summary').show();
			$('.cnt-sasaran').show();
			$('.cnt-pejabat').show();
			$('.cnt-realisasi').show();
			$('.cnt-tugas-tambahan').show();
			$('.cnt-kreativitas').show();
			$('.cnt-perilaku-kerja').show();
			$('#form-summary').hide();
			$('#form-sasaran').hide();
		},
		show_form_summary: function() {
			$('#form-search').hide();
			$('.cnt-summary').hide();
			$('.cnt-sasaran').hide();
			$('.cnt-pejabat').hide();
			$('.cnt-realisasi').hide();
			$('.cnt-tugas-tambahan').hide();
			$('.cnt-kreativitas').hide();
			$('.cnt-perilaku-kerja').hide();
			$('#form-summary').show();
			$('#form-sasaran').hide();
		},
		show_form_sasaran: function() {
			$('#form-search').hide();
			$('.cnt-summary').hide();
			$('.cnt-sasaran').hide();
			$('.cnt-pejabat').hide();
			$('.cnt-realisasi').hide();
			$('.cnt-tugas-tambahan').hide();
			$('.cnt-kreativitas').hide();
			$('.cnt-perilaku-kerja').hide();
			$('#form-summary').hide();
			$('#form-sasaran').show();
		},
		is_valid_search: function(p) {
			p.message = (typeof(p.message) == 'undefined') ? true : p.message;
			
			var form_search = Func.form.get_value('form-search');
			if (form_search.biodata_id == 0 || form_search.tahun == '') {
				if (p.message) {
					noty({ text: 'Silahkan memasukan data pencarian terlebih dahulu.', layout: 'topRight', type: 'error', timeout: 2500 });
				}
				
				return false;
			}
			
			return true;
		},
		search_refresh: function() {
			var is_valid_search = page.is_valid_search({ message: false });
			if (!is_valid_search) {
				return;
			}
			
			// reload grid
			dt_skp_summary.reload();
			dt_skp_sasaran.reload();
			dt_skp_pejabat.reload();
			dt_skp_realisasi.reload();
			dt_skp_tugas_tambahan.reload();
			dt_skp_kreativitas.reload();
			dt_skp_perilaku_kerja.reload();
		}
	}
	page.init();
	
	// grid summary
	var dt_skp_summary_param = {
		id: 'dt-skp-summary',
		source: web.host + 'kepegawaian/skp/skp_tahunan/grid',
		column: [ { sClass: 'center' }, { sClass: 'center' }, { bSortable: false, sClass: "center" } ],
		fnServerParams: function ( aoData ) {
			var form_search = Func.form.get_value('form-search');
			aoData.push(
				{ "name": "action", "value": 'skp_summary' },
				{ "name": "tahun", "value": form_search.tahun },
				{ "name": "biodata_id", "value": form_search.biodata_id }
			)
		},
		callback: function() {
			$('#dt-skp-summary .btn-edit').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				Func.ajax({ url: web.host + 'kepegawaian/skp/skp_tahunan/action', param: { action: 'skp_summary_get_by_id', id: record.id }, callback: function(result) {
					Func.populate({ cnt: '#form-summary', record: result });
					page.show_form_summary();
				} });
			});
			
			$('#dt-skp-summary .btn-delete').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				Func.form.del({
					data: { action: 'skp_summary_delete', id: record.id },
					url: web.host + 'kepegawaian/skp/skp_tahunan/action', callback: function() { dt_skp_summary.reload(); }
				});
			});
		}
	}
	var dt_skp_summary = Func.datatable(dt_skp_summary_param);
	
	// grid sasaran kerja
	var dt_skp_sasaran_param = {
		id: 'dt-skp-sasaran',
		source: web.host + 'kepegawaian/skp/skp_tahunan/grid',
		column: [ { }, { bSortable: false, sClass: "center" }, { bSortable: false, sClass: "center" }, { bSortable: false, sClass: "center" }, { bSortable: false, sClass: "center" } ],
		fnServerParams: function ( aoData ) {
			var form_search = Func.form.get_value('form-search');
			aoData.push(
				{ "name": "action", "value": 'skp_sasaran_kerja' },
				{ "name": "tahun", "value": form_search.tahun },
				{ "name": "biodata_id", "value": form_search.biodata_id }
			)
		},
		callback: function() {
			$('#dt-skp-sasaran .btn-edit').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				Func.ajax({ url: web.host + 'kepegawaian/skp/skp_tahunan/action', param: { action: 'skp_sasaran_get_by_id', id: record.id }, callback: function(result) {
					Func.populate({ cnt: '#form-sasaran', record: result });
					combo.jenis_skp({ biodata_id: result.biodata_id, target: $('#form-sasaran [name="jenis_skp_id"]'), value: result.jenis_skp_id });
					page.show_form_sasaran();
				} });
			});
			
			$('#dt-skp-sasaran .btn-delete').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				Func.form.del({
					data: { action: 'skp_sasaran_delete', id: record.id },
					url: web.host + 'kepegawaian/skp/skp_tahunan/action', callback: function() { dt_skp_sasaran.reload(); }
				});
			});
		}
	}
	var dt_skp_sasaran = Func.datatable(dt_skp_sasaran_param);
	
	// grid pejabat
	var dt_skp_pejabat_param = {
		id: 'dt-skp-pejabat',
		source: web.host + 'kepegawaian/skp/skp_tahunan/grid',
		column: [ { }, { }, { bSortable: false, sClass: "center" } ],
		fnServerParams: function ( aoData ) {
			var form_search = Func.form.get_value('form-search');
			aoData.push(
				{ "name": "action", "value": 'skp_pejabat' },
				{ "name": "tahun", "value": form_search.tahun },
				{ "name": "biodata_id", "value": form_search.biodata_id }
			)
		},
		callback: function() {
			$('#dt-skp-pejabat .btn-edit').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				Func.ajax({ url: web.host + 'kepegawaian/skp/skp_tahunan/action', param: { action: 'skp_pejabat_get_by_id', id: record.id }, callback: function(result) {
					Func.populate({ cnt: '#form-pejabat', record: result });
					$('#form-pejabat').modal();
				} });
			});
			
			$('#dt-skp-pejabat .btn-delete').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				Func.form.del({
					data: { action: 'skp_pejabat_delete', id: record.id },
					url: web.host + 'kepegawaian/skp/skp_tahunan/action', callback: function() { dt_skp_pejabat.reload(); }
				});
			});
		}
	}
	var dt_skp_pejabat = Func.datatable(dt_skp_pejabat_param);
	
	// grid realisasi
	var dt_skp_realisasi_param = {
		id: 'dt-skp-realisasi',
		source: web.host + 'kepegawaian/skp/skp_tahunan/grid',
		column: [ { }, { bSortable: false, sClass: "center" }, { bSortable: false, sClass: "center" }, { bSortable: false, sClass: "center" }, { bSortable: false, sClass: "center" }, { bSortable: false, sClass: "center" } ],
		fnServerParams: function ( aoData ) {
			var form_search = Func.form.get_value('form-search');
			aoData.push(
				{ "name": "action", "value": 'skp_realisasi' },
				{ "name": "tahun", "value": form_search.tahun },
				{ "name": "biodata_id", "value": form_search.biodata_id }
			)
		},
		callback: function() {
			$('#dt-skp-realisasi .btn-edit').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				aaa = record;
				record = aaa;
				
				Func.ajax({ url: web.host + 'kepegawaian/skp/skp_tahunan/action', param: { action: 'skp_realisasi_get_by_id', skp_sasaran_kerja_id: record.skp_sasaran_kerja_id }, callback: function(result) {
					Func.populate({ cnt: '#form-realisasi', record: result });
					$('#form-realisasi').modal();
				} });
			});
			
			$('#dt-skp-realisasi .btn-delete').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				Func.form.del({
					data: { action: 'skp_realisasi_delete', id: record.id },
					url: web.host + 'kepegawaian/skp/skp_tahunan/action', callback: function() { dt_skp_realisasi.reload(); }
				});
			});
		}
	}
	var dt_skp_realisasi = Func.datatable(dt_skp_realisasi_param);
	
	// grid tugas_tambahan
	var dt_skp_tugas_tambahan_param = {
		id: 'dt-skp-tugas-tambahan',
		source: web.host + 'kepegawaian/skp/skp_tahunan/grid',
		column: [ { }, { sClass: "center" }, { sClass: "center" }, { bSortable: false, sClass: "center" } ],
		fnServerParams: function ( aoData ) {
			var form_search = Func.form.get_value('form-search');
			aoData.push(
				{ "name": "action", "value": 'skp_tugas_tambahan' },
				{ "name": "tahun", "value": form_search.tahun },
				{ "name": "biodata_id", "value": form_search.biodata_id }
			)
		},
		callback: function() {
			$('#dt-skp-tugas-tambahan .btn-edit').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				Func.ajax({ url: web.host + 'kepegawaian/skp/skp_tahunan/action', param: { action: 'skp_tugas_tambahan_get_by_id', id: record.id }, callback: function(result) {
					Func.populate({ cnt: '#form-tugas-tambahan', record: result });
					$('#form-tugas-tambahan').modal();
				} });
			});
			
			$('#dt-skp-tugas-tambahan .btn-delete').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				Func.form.del({
					data: { action: 'skp_tugas_tambahan_delete', id: record.id },
					url: web.host + 'kepegawaian/skp/skp_tahunan/action', callback: function() { dt_skp_tugas_tambahan.reload(); }
				});
			});
		}
	}
	var dt_skp_tugas_tambahan = Func.datatable(dt_skp_tugas_tambahan_param);
	
	// grid kreativitas
	var dt_skp_kreativitas_param = {
		id: 'dt-skp-kreativitas',
		source: web.host + 'kepegawaian/skp/skp_tahunan/grid',
		column: [ { }, { sClass: "center" }, { sClass: "center" }, { bSortable: false, sClass: "center" } ],
		fnServerParams: function ( aoData ) {
			var form_search = Func.form.get_value('form-search');
			aoData.push(
				{ "name": "action", "value": 'skp_kreativitas' },
				{ "name": "tahun", "value": form_search.tahun },
				{ "name": "biodata_id", "value": form_search.biodata_id }
			)
		},
		callback: function() {
			$('#dt-skp-kreativitas .btn-edit').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				Func.ajax({ url: web.host + 'kepegawaian/skp/skp_tahunan/action', param: { action: 'skp_kreativitas_get_by_id', id: record.id }, callback: function(result) {
					Func.populate({ cnt: '#form-kreativitas', record: result });
					$('#form-kreativitas').modal();
				} });
			});
			
			$('#dt-skp-kreativitas .btn-delete').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				Func.form.del({
					data: { action: 'skp_kreativitas_delete', id: record.id },
					url: web.host + 'kepegawaian/skp/skp_tahunan/action', callback: function() { dt_skp_kreativitas.reload(); }
				});
			});
		}
	}
	var dt_skp_kreativitas = Func.datatable(dt_skp_kreativitas_param);
	
	// grid perilaku kerja
	var dt_skp_perilaku_kerja_param = {
		id: 'dt-skp-perilaku-kerja',
		source: web.host + 'kepegawaian/skp/skp_tahunan/grid',
		column: [ { }, { sClass: "center" }, { bSortable: false, sClass: "center" } ],
		fnServerParams: function ( aoData ) {
			var form_search = Func.form.get_value('form-search');
			aoData.push(
				{ "name": "action", "value": 'skp_perilaku_kerja' },
				{ "name": "tahun", "value": form_search.tahun },
				{ "name": "biodata_id", "value": form_search.biodata_id }
			)
		},
		callback: function() {
			$('#dt-skp-perilaku-kerja .btn-edit').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				Func.ajax({ url: web.host + 'kepegawaian/skp/skp_tahunan/action', param: { action: 'skp_perilaku_kerja_get_by_id', id: record.id }, callback: function(result) {
					Func.populate({ cnt: '#form-perilaku-kerja', record: result });
					$('#form-perilaku-kerja').modal();
				} });
			});
			
			$('#dt-skp-perilaku-kerja .btn-delete').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				Func.form.del({
					data: { action: 'skp_perilaku_kerja_delete', id: record.id },
					url: web.host + 'kepegawaian/skp/skp_tahunan/action', callback: function() { dt_skp_perilaku_kerja.reload(); }
				});
			});
		}
	}
	var dt_skp_perilaku_kerja = Func.datatable(dt_skp_perilaku_kerja_param);
	
	// biodata
	var biodata_store = new Bloodhound({
		datumTokenizer: Bloodhound.tokenizers.obj.whitespace('nama'),
		queryTokenizer: Bloodhound.tokenizers.whitespace,
		prefetch: web.host + 'typeahead?action=biodata',
		remote: web.host + 'typeahead?action=biodata&namelike=%QUERY'
	});
	biodata_store.initialize();
	var biodata = $('.typeahead-biodata').typeahead(null, {
		name: 'biodata',
		displayKey: 'nama',
		source: biodata_store.ttAdapter(),
		templates: {
			empty: [
				'<div class="empty-message">',
				'no result found.',
				'</div>'
			].join('\n'),
			suggestion: Handlebars.compile('<p><strong>{{nama}}</strong></p>')
		}
	});
	biodata.on('typeahead:selected', function(evt, data) {
		$('#form-search [name="biodata_id"]').val(data.id);
		page.search_refresh();
	});
	
	// search
	$('#form-search [name="tahun"]').change(function() {
		page.search_refresh();
	});
	
	// global
	$('.btn-show-grid').click(function() {
		page.show_grid();
	});
	
	// form summary
	$('.btn-add-skp-summary').click(function() {
		var is_valid_search = page.is_valid_search({});
		if (!is_valid_search) {
			return;
		}
		
		// show form
		page.show_form_summary();
		
		// populate data
		var form_search = Func.form.get_value('form-search');
		$('#form-summary form')[0].reset();
		$('#form-summary [name="id"]').val(0);
		$('#form-summary [name="tahun"]').val(form_search.tahun);
		$('#form-summary [name="biodata_id"]').val(form_search.biodata_id);
	});
	$('#form-summary form').validate({
		rules: {
			tanggal_pembuatan: { required: true }
		}
	});
	$('#form-summary form').submit(function(e) {
		e.preventDefault();
		if (! $('#form-summary form').valid()) {
			return false;
		}
		
		Func.form.submit({
			url: web.host + 'kepegawaian/skp/skp_tahunan/action',
			param: Func.form.get_value('form-summary'),
			callback: function(result) {
				page.show_grid();
				dt_skp_summary.reload();
				$('#form-summary form')[0].reset();
			}
		});
	});
	
	// form sasaran
	$('.btn-add-skp-sasaran').click(function() {
		var is_valid_search = page.is_valid_search({});
		if (!is_valid_search) {
			return;
		}
		
		// show form
		page.show_form_sasaran();
		
		// populate data
		var form_search = Func.form.get_value('form-search');
		$('#form-sasaran form')[0].reset();
		$('#form-sasaran [name="id"]').val(0);
		$('#form-sasaran [name="tahun"]').val(form_search.tahun);
		$('#form-sasaran [name="biodata_id"]').val(form_search.biodata_id);
		combo.jenis_skp({ biodata_id: form_search.biodata_id, target: $('#form-sasaran [name="jenis_skp_id"]') });
	});
	$('.btn-print-skp-sasaran').click(function() {
		var is_valid_search = page.is_valid_search({});
		if (!is_valid_search) {
			return;
		}
		
		// show form
		page.show_form_sasaran();
		
		// populate data
		var form_search = Func.form.get_value('form-search');
		var link_print = web.host + 'kepegawaian/skp/skp_tahunan/cetak?print_type=sasaran&biodata_id=' + form_search.biodata_id + '&tahun=' + form_search.tahun;
		window.open(link_print);
	});
	$('#form-sasaran form').validate({
		rules: {
			jenis_skp_id: { required: true },
			ak: { required: true, digits: true },
			kuant_nilai: { required: true, digits: true },
			kual: { required: true, digits: true }
		}
	});
	$('#form-sasaran form').submit(function(e) {
		e.preventDefault();
		if (! $('#form-sasaran form').valid()) {
			return false;
		}
		
		Func.form.submit({
			url: web.host + 'kepegawaian/skp/skp_tahunan/action',
			param: Func.form.get_value('form-sasaran'),
			callback: function(result) {
				page.show_grid();
				dt_skp_sasaran.reload();
				$('#form-sasaran form')[0].reset();
			}
		});
	});
	
	// form pejabat
	$('.btn-add-skp-pejabat').click(function() {
		var is_valid_search = page.is_valid_search({});
		if (!is_valid_search) {
			return;
		}
		
		// show form
		$('#form-pejabat').modal();
		
		// populate data
		var form_search = Func.form.get_value('form-search');
		$('#form-pejabat form')[0].reset();
		$('#form-pejabat [name="id"]').val(0);
		$('#form-pejabat [name="tahun"]').val(form_search.tahun);
		$('#form-pejabat [name="biodata_id"]').val(form_search.biodata_id);
	});
	$('#form-pejabat form').validate({
		rules: {
			posisi: { required: true },
			pangkat_id: { required: true },
			nama: { required: true },
			nip: { required: true },
			jabatan: { required: true },
			unit_kerja: { required: true }
		}
	});
	$('#form-pejabat form').submit(function(e) {
		e.preventDefault();
		if (! $('#form-pejabat form').valid()) {
			return false;
		}
		
		Func.form.submit({
			url: web.host + 'kepegawaian/skp/skp_tahunan/action',
			param: Func.form.get_value('form-pejabat'),
			callback: function(result) {
				page.show_grid();
				dt_skp_pejabat.reload();
				$('#form-pejabat').modal('hide');
			}
		});
	});
	
	// form realisasi
	$('#form-realisasi form').validate({
		rules: {
			posisi: { required: true },
			pangkat_id: { required: true },
			nama: { required: true },
			nip: { required: true },
			jabatan: { required: true },
			unit_kerja: { required: true }
		}
	});
	$('#form-realisasi form').submit(function(e) {
		e.preventDefault();
		if (! $('#form-realisasi form').valid()) {
			return false;
		}
		
		Func.form.submit({
			url: web.host + 'kepegawaian/skp/skp_tahunan/action',
			param: Func.form.get_value('form-realisasi'),
			callback: function(result) {
				page.show_grid();
				dt_skp_realisasi.reload();
				$('#form-realisasi').modal('hide');
			}
		});
	});
	
	// form tugas tambahan
	$('.btn-add-skp-tugas-tambahan').click(function() {
		var is_valid_search = page.is_valid_search({});
		if (!is_valid_search) {
			return;
		}
		
		// show form
		$('#form-tugas-tambahan').modal();
		
		// populate data
		var form_search = Func.form.get_value('form-search');
		$('#form-tugas-tambahan form')[0].reset();
		$('#form-tugas-tambahan [name="id"]').val(0);
		$('#form-tugas-tambahan [name="tahun"]').val(form_search.tahun);
		$('#form-tugas-tambahan [name="biodata_id"]').val(form_search.biodata_id);
	});
	$('#form-tugas-tambahan form').validate({
		rules: {
			title: { required: true },
			perhitungan: { required: true },
			nilai_capaian: { required: true }
		}
	});
	$('#form-tugas-tambahan form').submit(function(e) {
		e.preventDefault();
		if (! $('#form-tugas-tambahan form').valid()) {
			return false;
		}
		
		Func.form.submit({
			url: web.host + 'kepegawaian/skp/skp_tahunan/action',
			param: Func.form.get_value('form-tugas-tambahan'),
			callback: function(result) {
				page.show_grid();
				dt_skp_tugas_tambahan.reload();
				$('#form-tugas-tambahan').modal('hide');
			}
		});
	});
	
	// form kreativitas
	$('.btn-add-skp-kreativitas').click(function() {
		var is_valid_search = page.is_valid_search({});
		if (!is_valid_search) {
			return;
		}
		
		// show form
		$('#form-kreativitas').modal();
		
		// populate data
		var form_search = Func.form.get_value('form-search');
		$('#form-kreativitas form')[0].reset();
		$('#form-kreativitas [name="id"]').val(0);
		$('#form-kreativitas [name="tahun"]').val(form_search.tahun);
		$('#form-kreativitas [name="biodata_id"]').val(form_search.biodata_id);
	});
	$('#form-kreativitas form').validate({
		rules: {
			title: { required: true },
			perhitungan: { required: true },
			nilai_capaian: { required: true }
		}
	});
	$('#form-kreativitas form').submit(function(e) {
		e.preventDefault();
		if (! $('#form-kreativitas form').valid()) {
			return false;
		}
		
		Func.form.submit({
			url: web.host + 'kepegawaian/skp/skp_tahunan/action',
			param: Func.form.get_value('form-kreativitas'),
			callback: function(result) {
				page.show_grid();
				dt_skp_kreativitas.reload();
				$('#form-kreativitas').modal('hide');
			}
		});
	});
	
	// form perilaku kerja
	$('.btn-add-skp-perilaku-kerja').click(function() {
		var is_valid_search = page.is_valid_search({});
		if (!is_valid_search) {
			return;
		}
		
		// show form
		$('#form-perilaku-kerja').modal();
		
		// populate data
		var form_search = Func.form.get_value('form-search');
		$('#form-perilaku-kerja form')[0].reset();
		$('#form-perilaku-kerja [name="id"]').val(0);
		$('#form-perilaku-kerja [name="tahun"]').val(form_search.tahun);
		$('#form-perilaku-kerja [name="biodata_id"]').val(form_search.biodata_id);
	});
	$('#form-perilaku-kerja form').validate({
		rules: {
			perilaku_kerja_id: { required: true },
			nilai: { required: true }
		}
	});
	$('#form-perilaku-kerja form').submit(function(e) {
		e.preventDefault();
		if (! $('#form-perilaku-kerja form').valid()) {
			return false;
		}
		
		Func.form.submit({
			url: web.host + 'kepegawaian/skp/skp_tahunan/action',
			param: Func.form.get_value('form-perilaku-kerja'),
			callback: function(result) {
				page.show_grid();
				dt_skp_perilaku_kerja.reload();
				$('#form-perilaku-kerja').modal('hide');
			}
		});
	});
});
</script>
</body>
</html>