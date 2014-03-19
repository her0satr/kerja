<?php	$tanggal_absensi = (isset($_POST['tanggal_absensi'])) ? ExchangeFormatDate($_POST['tanggal_absensi']) : date("Y-m-d");	$array_absensi = $this->absensi_masuk_model->get_rekap_by_date(array( 'tanggal' => $tanggal_absensi ));		$page_data['tanggal_absensi'] = $tanggal_absensi;?><?php $this->load->view( 'common/meta', array( 'title' => 'Rekap Absensi' ) ); ?><body><div class="hide">	<div class="cnt-data"><?php echo json_encode($page_data); ?></div></div><!-- Form area --><div class="admin-form big"><div class="container">	<div class="row">		<div class="col-md-12">            <div class="widget">				<div class="widget-head">					<i class="icon-lock"></i> Rekap Absensi				</div>								<div class="widget-content">					<form class="form-horizontal" method="post" id="form-search">						<div class="form-group">							<label class="col-lg-2 control-label">Tanggal</label>							<div class="col-lg-5">								<div class="input-append datepicker">									<input name="tanggal_absensi" type="text" class="form-control dtpicker" placeholder="Tanggal" data-format="dd-MM-yyyy" />									<span class="add-on"><i data-time-icon="fa fa-time" data-date-icon="fa fa-calendar" class="btn btn-info"></i></span>								</div>							</div>							<div class="col-lg-3">								<button type="submit" class="btn btn-info">Cari</button>							</div>						</div>						<hr />					</form>				</div>								<div class="widget grid-main" style="margin: 20px;">					<div class="widget-head">						<div class="pull-left">&nbsp;</div>						<div class="widget-icons pull-right">&nbsp;</div>						<div class="clearfix"></div>					</div>					<div class="widget-content">						<table id="datatable" class="table table-striped table-bordered table-hover">							<thead>								<tr>									<th>Divisi</th>									<th class="center">Hadir</th>									<th class="center">Tidak Masuk</th>									<th class="center">Ijin</th>									<th class="center">Cuti</th>									<th class="center">Sakit</th>									<th class="center">Kosong</th>								</tr>							</thead>							<tbody>								<?php foreach($array_absensi as $row) { ?>								<tr>									<td><?php echo $row['title']; ?></td>									<td class="center"><?php echo $row['masuk']; ?></td>									<td class="center"><?php echo $row['tidak_masuk']; ?></td>									<td class="center"><?php echo $row['ijin']; ?></td>									<td class="center"><?php echo $row['cuti']; ?></td>									<td class="center"><?php echo $row['sakit']; ?></td>									<td class="center"><?php echo $row['tanpa_keterangan']; ?></td>								</tr>								<?php } ?>							</tbody>						</table>						<div class="widget-foot">							<br /><br />							<div class="clearfix"></div> 						</div>					</div>				</div>				                <div class="widget-foot center">					<a href="<?php echo base_url(); ?>">Home</a>				</div>            </div>  		</div>    </div></div></div><?php $this->load->view( 'common/library_js'); ?><script>$(document).ready(function() {	var page = {		init: function() {			var raw = $('.cnt-data').text();			eval('var data = ' + raw);			page.data = data;						Func.populate({ cnt: '#form-search', record: page.data });		}	}	page.init();		// datatable	$('#datatable').dataTable();		// form	$('#form-search').validate({		rules: {			tanggal_absensi: { required: true }		}	});	$('#form-search').submit(function(e) {		if (! $('#form-search').valid()) {			e.preventDefault();			return false;		}	});});</script></body></html>