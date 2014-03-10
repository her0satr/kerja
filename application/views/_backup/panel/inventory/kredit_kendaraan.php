<?php
	$user = $this->User_model->get_session();
	$array_jenis_unit = $this->Jenis_Unit_model->get_array();
	$array_jenis_leasing = $this->Jenis_Leasing_model->get_array();
	$array_jenis_angsuran = $this->Jenis_Angsuran_model->get_array();
	$array_jenis_pembayaran = $this->Jenis_Pembayaran_model->get_array();
	
	$page_data['user_id'] = $user['id'];
	$page_data['user_type_id'] = $user['user_type_id'];
	$page_data['USER_ID_SALES'] = USER_ID_SALES;
	$page_data['USER_ID_DELIVERY'] = USER_ID_DELIVERY;
	$page_data['USER_ID_PENAGIHAN'] = USER_ID_PENAGIHAN;
	$page_data['USER_ID_ADMINISTRATOR'] = USER_ID_ADMINISTRATOR;
	$page_data['STATUS_PENJUALAN_PENDING'] = STATUS_PENJUALAN_PENDING;
	$page_data['STATUS_PENJUALAN_DITOLAK'] = STATUS_PENJUALAN_DITOLAK;
	$page_data['STATUS_PENJUALAN_DITERIMA'] = STATUS_PENJUALAN_DITERIMA;
?>
<?php $this->load->view( 'panel/common/meta', array( 'title' => 'Kredit Kendaraan' ) ); ?>
<body>
<?php $this->load->view( 'panel/common/header'); ?>

<div class="content">
	<?php $this->load->view( 'panel/common/sidebar'); ?>
	<div class="hide">
		<div class="cnt-data"><?php echo json_encode($page_data); ?></div>
		<iframe name="iframe_ktp_file" src="<?php echo base_url('panel/upload?callback=set_ktp_file'); ?>"></iframe>
	</div>
	
	<div id="form-confirm" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog"><div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title">Form Persetujuan Kredit</h4>
			</div>
			<div class="modal-body"><form class="form-horizontal">
				<input type="hidden" name="id" value="0" />
				<input type="hidden" name="action" value="update_approve" />
				
				<div class="form-group">
					<label class="col-lg-2 control-label">KTP</label>
					<div class="col-lg-10"><label class="checkbox-inline"><input type="checkbox" name="with_ktp" value="1" /></label></div>
				</div>
				<div class="form-group">
					<label class="col-lg-2 control-label">Gesek</label>
					<div class="col-lg-10"><label class="checkbox-inline"><input type="checkbox" name="with_gesek" value="1" disabled="disabled" /></label></div>
				</div>
				<div class="form-group">
					<label class="col-lg-2 control-label">BAST</label>
					<div class="col-lg-10"><label class="checkbox-inline"><input type="checkbox" name="with_bast" value="1" /></label></div>
				</div>
			</form></div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal" aria-hidden="true">Cancel</button>
				<button type="button" class="btn btn-primary">Update</button>
			</div>
		</div></div>
	</div>
	
  	<div class="mainbar">
	    <div class="page-head">
			<h2 class="pull-left button-back">Kredit Kendaraan</h2>
			<div class="clearfix"></div>
		</div>
		
	    <div class="matter"><div class="container">
            <div class="row"><div class="col-md-12">
				
				<div class="widget grid-main">
					<div class="widget-head">
						<div class="pull-left">
							<button class="btn btn-info btn-xs btn-add-kredit-kendaraan">Tambah</button>
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
									<th>Nama Sales</th>
									<th>Jenis Unit</th>
									<th>Nama Konsumen</th>
									<th>Tanggal Order</th>
									<th>Status Penjualan</th>
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
				
				<div class="widget hide" id="form-kredit-kendaraan">
					<div class="widget-head">
						<div class="pull-left">Form Kredit Kendaraan</div>
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
									<select class="form-control form-entry" name="jenis_unit_id">
										<?php echo ShowOption(array( 'Array' => $array_jenis_unit )); ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Jenis Warna</label>
								<div class="col-lg-10">
									<select class="form-control form-entry" name="jenis_warna_id">
										<option value="">-</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Jenis Pembayaran</label>
								<div class="col-lg-10">
									<select class="form-control form-entry" name="jenis_pembayaran_id">
										<?php echo ShowOption(array( 'Array' => $array_jenis_pembayaran )); ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Nama Konsumen</label>
								<div class="col-lg-10">
									<input type="text" name="name" class="form-control form-entry" placeholder="Nama Konsumen" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">NIK</label>
								<div class="col-lg-10">
									<input type="text" name="nik" class="form-control form-entry" placeholder="NIK" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">No Telepon / HP</label>
								<div class="col-lg-10">
									<input type="text" name="phone" class="form-control form-entry" placeholder="No Telepon / HP" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Tempat Lahir</label>
								<div class="col-lg-10">
									<input type="text" name="birth_place" class="form-control form-entry" placeholder="Tempat Lahir" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Tanggal Lahir</label>
								<div class="col-lg-10">
									<div class="input-append datepicker">
										<input name="birth_date" type="text" class="form-control dtpicker form-entry" placeholder="Tanggal Lahir" data-format="dd-MM-yyyy" />
										<span class="add-on"><i data-time-icon="fa fa-time" data-date-icon="fa fa-calendar" class="btn btn-info"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Alamat</label>
								<div class="col-lg-10">
									<textarea class="form-control form-entry" rows="3" name="address" placeholder="Alamat"></textarea>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Upload KTP</label>
								<div class="col-lg-4">
									<input type="text" name="ktp_file" class="form-control" placeholder="Upload KTP" />
								</div>
								<div class="col-lg-2">
									<input type="button" class="btn btn-primary btn-browse-ktp" value="Browse" />
									<input type="button" class="btn btn-primary btn-check-ktp" value="Check File" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Harga OTR</label>
								<div class="col-lg-10">
									<input type="text" name="price_otr" class="form-control form-entry" placeholder="Harga OTR" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Lama Angsuran</label>
								<div class="col-lg-10">
									<select class="form-control form-entry" name="jenis_angsuran_id">
										<?php echo ShowOption(array( 'Array' => $array_jenis_angsuran )); ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Angsuran</label>
								<div class="col-lg-10">
									<input type="text" name="price_angsuran" class="form-control form-entry" placeholder="Angsuran" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Jenis Leasing</label>
								<div class="col-lg-10">
									<select class="form-control form-entry" name="jenis_leasing_id">
										<?php echo ShowOption(array( 'Array' => $array_jenis_leasing )); ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Potongan Penjualan</label>
								<div class="col-lg-10">
									<input type="text" name="discount" class="form-control form-entry" placeholder="Potongan Penjualan" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">DP Konsumen</label>
								<div class="col-lg-10">
									<input type="text" name="dp_customer" class="form-control form-entry" placeholder="DP Konsumen" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">DP Gros</label>
								<div class="col-lg-10">
									<input type="text" name="dp_gross" class="form-control form-entry" placeholder="DP Konsumen" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">SUB</label>
								<div class="col-lg-10">
									<input type="text" name="sub" class="form-control form-entry" placeholder="SUB" readonly="readonly" />
								</div>
							</div>
							<hr />
							
							<div class="col-lg-4">
								<div class="form-group">
									<label class="col-lg-2 control-label">KTP</label>
									<div class="col-lg-10"><label class="checkbox-inline"><input type="checkbox" name="with_ktp" class="form-entry" value="1" /></label></div>
								</div>
								<div class="form-group">
									<label class="col-lg-2 control-label">Geset</label>
									<div class="col-lg-10"><label class="checkbox-inline"><input type="checkbox" name="with_gesek" class="form-entry" value="1" disabled="disabled" /></label></div>
								</div>
								<div class="form-group">
									<label class="col-lg-2 control-label">Bast</label>
									<div class="col-lg-10"><label class="checkbox-inline"><input type="checkbox" name="with_bast" class="form-entry" value="1" /></label></div>
								</div>
							</div>
							<div class="col-lg-8">
								<div class="form-group">
									<label class="col-lg-4 control-label">Noka Nosin</label>
									<div class="col-lg-8">
										<input type="text" name="noka_nosin" class="form-control form-entry-penagihan" placeholder="Noka Nosin" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-4 control-label">Perkiraan Pengiriman</label>
									<div class="col-lg-8">
										<div class="input-append datepicker">
											<input name="delivery_date" type="text" class="form-control form-entry-penagihan dtpicker" placeholder="Perkiraan Pengiriman" data-format="dd-MM-yyyy" />
											<span class="add-on"><i data-time-icon="fa fa-time" data-date-icon="fa fa-calendar" class="btn btn-info"></i></span>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-4 control-label">DeliveryMan</label>
									<div class="col-lg-8">
										<input type="text" name="delivery_man" class="form-control form-entry-penagihan" placeholder="DeliveryMan" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-4 control-label">ACC / TL</label>
									<div class="col-lg-8">
										<input type="text" name="status_penjualan_name" class="form-control" placeholder="ACC / TL" readonly="readonly" />
									</div>
								</div>
							</div>
							<hr style="clear: both;" />
							
							<div class="form-group form-btn">
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
			$('#form-kredit-kendaraan').hide();
		},
		show_form_kredit_kendaraan: function() {
			$('.grid-main').hide();
			$('#form-kredit-kendaraan').show();
		},
		init: function() {
			var temp = $('.cnt-data').html();
			eval('var data = ' + temp);
			page.data = data;
			
			if (page.data.user_type_id == page.data.USER_ID_DELIVERY || page.data.user_type_id == page.data.USER_ID_ADMINISTRATOR) {
				$('[name="with_gesek"]').attr('disabled', false);
			}
		}
	}
	
	// global
	$('.btn-show-grid').click(function() {
		page.show_grid();
	});
	$('#form-kredit-kendaraan [name="dp_customer"], #form-kredit-kendaraan [name="dp_gross"]').keyup(function() {
		var dp_gross = $('#form-kredit-kendaraan [name="dp_gross"]').val();
		var dp_customer = $('#form-kredit-kendaraan [name="dp_customer"]').val();
		var sub = dp_gross - dp_customer;
		$('#form-kredit-kendaraan [name="sub"]').val(sub);
	});
	$('#form-kredit-kendaraan [name="jenis_unit_id"]').change(function() {
		combo.jenis_warna({ jenis_unit_id: $(this).val(), target: $('#form-kredit-kendaraan [name="jenis_warna_id"]') });
	});
	$('#form-kredit-kendaraan .btn-check-ktp').click(function() {
		var ktp_file = $('#form-kredit-kendaraan [name="ktp_file"]').val();
		if (ktp_file.length == 0) {
			return;
		}
		window.open(web.host + 'static/upload/' + ktp_file);
	});
	
	// grid
	var param = {
		id: 'datatable', aaSorting: [[ 3, "DESC" ]],
		source: web.host + 'panel/inventory/kredit_kendaraan/grid',
		column: [ { }, { }, { }, { sClass: "center" }, { sClass: "center" }, { bSortable: false, sClass: "center", sWidth: "15%" } ],
		callback: function() {
			$('#datatable .btn-edit').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				Func.ajax({ url: web.host + 'panel/inventory/kredit_kendaraan/action', param: { action: 'get_by_id', id: record.id }, callback: function(result) {
					$('#form-kredit-kendaraan [name="id"]').val(result.id);
					$('#form-kredit-kendaraan [name="jenis_unit_id"]').val(result.jenis_unit_id);
					$('#form-kredit-kendaraan [name="jenis_pembayaran_id"]').val(result.jenis_pembayaran_id);
					$('#form-kredit-kendaraan [name="jenis_angsuran_id"]').val(result.jenis_angsuran_id);
					$('#form-kredit-kendaraan [name="jenis_leasing_id"]').val(result.jenis_leasing_id);
					$('#form-kredit-kendaraan [name="name"]').val(result.name);
					$('#form-kredit-kendaraan [name="nik"]').val(result.nik);
					$('#form-kredit-kendaraan [name="phone"]').val(result.phone);
					$('#form-kredit-kendaraan [name="address"]').val(result.address);
					$('#form-kredit-kendaraan [name="ktp_file"]').val(result.ktp_file);
					$('#form-kredit-kendaraan [name="birth_place"]').val(result.birth_place);
					$('#form-kredit-kendaraan [name="birth_date"]').val(Func.SwapDate(result.birth_date));
					$('#form-kredit-kendaraan [name="price_otr"]').val(result.price_otr);
					$('#form-kredit-kendaraan [name="price_angsuran"]').val(result.price_angsuran);
					$('#form-kredit-kendaraan [name="discount"]').val(result.discount);
					$('#form-kredit-kendaraan [name="dp_customer"]').val(result.dp_customer);
					$('#form-kredit-kendaraan [name="dp_gross"]').val(result.dp_gross);
					$('#form-kredit-kendaraan [name="sub"]').val(result.sub);
					
					// async data
					combo.jenis_warna({ jenis_unit_id: result.jenis_unit_id, target: $('#form-kredit-kendaraan [name="jenis_warna_id"]'), value: result.jenis_warna_id });
					
					// additional information
					$('#form-kredit-kendaraan [name="with_ktp"], #form-kredit-kendaraan [name="with_gesek"], #form-kredit-kendaraan [name="with_bast"]').attr('checked', false);
					if (result.with_ktp == 1) {
						$('#form-kredit-kendaraan [name="with_ktp"]').click();
					}
					if (result.with_gesek == 1) {
						$('#form-kredit-kendaraan [name="with_gesek"]').prop('checked', true);
					}
					if (result.with_bast == 1) {
						$('#form-kredit-kendaraan [name="with_bast"]').click();
					}
					$('#form-kredit-kendaraan [name="noka_nosin"]').val(result.noka_nosin);
					$('#form-kredit-kendaraan [name="delivery_date"]').val(Func.SwapDate(result.delivery_date));
					$('#form-kredit-kendaraan [name="delivery_man"]').val(result.delivery_man);
					$('#form-kredit-kendaraan [name="status_penjualan_name"]').val(result.status_penjualan_name);
					
					// editable only for pending status
					if (page.data.user_type_id == page.data.USER_ID_ADMINISTRATOR) {
						$('#form-kredit-kendaraan .form-btn [type="submit"]').show();
					} else if (page.data.user_type_id == page.data.USER_ID_DELIVERY) {
						if (result.status_penjualan_id == page.data.STATUS_PENJUALAN_DITERIMA) {
							$('.form-entry').attr('disabled', 'disabled');
							$('#form-kredit-kendaraan [name="with_gesek"]').removeAttr('disabled');
							$('#form-kredit-kendaraan .form-btn [type="submit"]').show();
						} else {
							$('.form-entry').removeAttr('disabled');
							$('#form-kredit-kendaraan .form-btn [type="submit"]').show();
						}
					} else if (page.data.user_type_id == page.data.USER_ID_SALES) {
						if (result.status_penjualan_id == page.data.STATUS_PENJUALAN_DITERIMA) {
							$('#form-kredit-kendaraan .form-btn [type="submit"]').hide();
						} else {
							$('#form-kredit-kendaraan .form-btn [type="submit"]').show();
						}
					} else if (page.data.user_type_id == page.data.USER_ID_PENAGIHAN) {
						$('.form-entry').attr('disabled', 'disabled');
						$('.form-entry-penagihan').attr('disabled', 'disabled');
						$('#form-kredit-kendaraan .form-btn [type="submit"]').hide();
					}
					
					page.show_form_kredit_kendaraan();
				} });
			});
			
			$('#datatable .btn-approve').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				// populate data
				$('#form-confirm [name="id"]').val(record.id);
				$('#form-confirm [name="with_ktp"], #form-confirm [name="with_gesek"], #form-confirm [name="with_bast"]').attr('checked', false);
				if (record.with_ktp == 1) {
					$('#form-confirm [name="with_ktp"]').click();
				}
				if (record.with_gesek == 1) {
					$('#form-confirm [name="with_gesek"]').prop('checked', true);
				}
				if (record.with_bast == 1) {
					$('#form-confirm [name="with_bast"]').click();
				}
				$('#form-confirm').modal();
			});
			
			$('#datatable .btn-reject').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				var param = {
					action: 'update',
					id: record.id,
					status_penjualan_id: page.data.STATUS_PENJUALAN_DITOLAK
				};
				Func.ajax({ url: web.host + 'panel/inventory/kredit_kendaraan/action', param: param, callback: function(result) {
					noty({ text: result.message, layout: 'topRight', type: 'success', timeout: 1500 });
					if (result.status == 1) {
						dt.reload();
					}
				} });
			});
			
			$('#datatable .btn-delivery').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				var param = {
					action: 'update_delivery',
					id: record.id,
					is_deliver: 1
				};
				Func.ajax({ url: web.host + 'panel/inventory/kredit_kendaraan/action', param: param, callback: function(result) {
					noty({ text: result.message, layout: 'topRight', type: 'success', timeout: 1500 });
					if (result.status == 1) {
						dt.reload();
					}
				} });
			});
			
			$('#datatable .btn-delete').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				if (record.status_penjualan_id == page.data.STATUS_PENJUALAN_PENDING) {
					Func.confirm_delete({
						data: { action: 'delete', id: record.id },
						url: web.host + 'panel/inventory/kredit_kendaraan/action', callback: function() { dt.reload(); }
					});
				} else {
					noty({ text: 'Data sudah diproses tidak dapat dihapus / diubah.', layout: 'topRight', type: 'success', timeout: 1500 });
				}
			});
			
			$('#datatable .btn-invoice').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				window.location = web.host + 'panel/inventory/invoice/?id=' + record.id;
			});
		}
	}
	dt = Func.init_datatable(param);
	
	// form jenis leasing
	$('.btn-add-kredit-kendaraan').click(function() {
		page.show_form_kredit_kendaraan();
		$('#form-kredit-kendaraan form')[0].reset();
		$('#form-kredit-kendaraan [name="id"]').val(0);
		
		// show button
		$('.form-entry').removeAttr('disabled');
		$('#form-kredit-kendaraan .form-btn [type="submit"]').show();
	});
	$('#form-kredit-kendaraan form').validate({
		rules: {
			jenis_unit_id: { required: true },
			jenis_warna_id: { required: true },
			jenis_pembayaran_id: { required: true },
			name: { required: true },
			phone: { required: true },
			address: { required: true },
			birth_place: { required: true },
			birth_date: { required: true }
		}
	});
	$('#form-kredit-kendaraan form').submit(function() {
		if (! $('#form-kredit-kendaraan form').valid()) {
			return false;
		}
		
		var param = Site.Form.GetValue('form-kredit-kendaraan');
		param.birth_date = Func.SwapDate(param.birth_date);
		param.delivery_date = Func.SwapDate(param.delivery_date);
		param.with_ktp = ($('#form-kredit-kendaraan [name="with_ktp"]').is(':checked')) ? 1 : 0;
		param.with_gesek = ($('#form-kredit-kendaraan [name="with_gesek"]').is(':checked')) ? 1 : 0;
		param.with_bast = ($('#form-kredit-kendaraan [name="with_bast"]').is(':checked')) ? 1 : 0;
		Func.ajax({ url: web.host + 'panel/inventory/kredit_kendaraan/action', param: param, callback: function(result) {
			if (result.status == 1) {
				dt.reload();
				page.show_grid();
				$('#form-kredit-kendaraan form')[0].reset();
			}
		} });
		
		return false;
	});
	
	// form confirm
	$('#form-confirm .btn-primary').click(function() {
		var param = Site.Form.GetValue('form-confirm');
		param.with_ktp = ($('#form-confirm [name="with_ktp"]').is(':checked')) ? 1 : 0;
		param.with_gesek = ($('#form-confirm [name="with_gesek"]').is(':checked')) ? 1 : 0;
		param.with_bast = ($('#form-confirm [name="with_bast"]').is(':checked')) ? 1 : 0;
		Func.ajax({ url: web.host + 'panel/inventory/kredit_kendaraan/action', param: param, callback: function(result) {
			if (result.status == 1) {
				dt.reload();
				$('#form-confirm').modal('hide');
				noty({ text: result.message, layout: 'topRight', type: 'success', timeout: 1500 });
			} else {
				noty({ text: result.message, layout: 'topRight', type: 'warning', timeout: 1500 });
			}
		} });
	});
	
	// upload
	$('.btn-browse-ktp').click(function() { window.iframe_ktp_file.browse() });
	set_ktp_file = function(p) {
		$('#form-kredit-kendaraan [name="ktp_file"]').val(p.file_name);
	}
	
	page.init();
});

function set_kredit() {
	$('[name="jenis_unit_id"]').val('13');
	$('[name="jenis_warna_id"]').val('2');
	$('[name="jenis_pembayaran_id"]').val('2');
	$('[name="jenis_angsuran_id"]').val('1');
	$('[name="jenis_leasing_id"]').val('4');
	$('[name="name"]').val('Pembeli No 1');
	$('[name="nik"]').val('NIK temp');
	$('[name="phone"]').val('0341');
	$('[name="birth_date"]').val('15-12-2013');
	$('[name="discount"]').val('0');
	$('[name="dp_customer"]').val('1000000');
	$('[name="dp_gross"]').val('100000');
	$('[name="sub"]').val('0');
}
</script>
</body>
</html>