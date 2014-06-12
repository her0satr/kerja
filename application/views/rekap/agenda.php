<?php
	// get form param
	$tanggal_ajuan = (isset($_POST['tanggal_ajuan'])) ? ExchangeFormatDate($_POST['tanggal_ajuan']) : '';
	
	// array agenda
	$param_agenda = array(
		'rahasia' => 0,
		'limit' => 100
	);
	if (empty($tanggal_ajuan)) {
		$param_agenda['today'] = $this->config->item('current_date');
	} else {
		$param_agenda['tanggal_ajuan'] = $tanggal_ajuan;
	}
	$array_agenda = $this->agenda_rapat_model->get_array($param_agenda);
	
	// page data
	$page_data = array();
	$page_data['tanggal_ajuan'] = $tanggal_ajuan;
?>
<?php $this->load->view( 'common/meta', array( 'title' => 'Rekap Agenda' ) ); ?>

<body>
<div class="hide">
	<div class="cnt-data"><?php echo json_encode($page_data); ?></div>
</div>

<div class="admin-form big"><div class="container">
	<div class="row">
		<div class="col-md-12">
            <div class="widget">
				<div style="display: none;">
					<div id="form-hidden">
						<input type="hidden" name="agenda_rapat_id" value="0" />
					</div>
				</div>
				
				<div class="widget-head">
					<i class="icon-lock"></i> Rekap Agenda
				</div>
				
				<div class="widget-content">
					<form class="form-horizontal" method="post" id="form-search">
						<input type="hidden" name="skpd_id" value="0" />
						
						<div class="form-group">
							<label class="col-lg-2 control-label">Tanggal</label>
							<div class="col-lg-5">
								<div class="input-append datepicker">
									<input name="tanggal_ajuan" type="text" class="form-control dtpicker" placeholder="Tanggal" data-format="dd-MM-yyyy" />
									<span class="add-on"><i data-time-icon="fa fa-time" data-date-icon="fa fa-calendar" class="btn btn-info"></i></span>
								</div>
							</div>
							<div class="col-lg-3">
								<button type="submit" class="btn btn-info">Cari</button>
							</div>
						</div>
						<hr />
					</form>
				</div>
				
				<div class="widget grid-main" style="margin: 0 20px 20px 20px;">
					<div class="widget-head">
						<div class="pull-left">&nbsp;</div>
						<div class="widget-icons pull-right">&nbsp;</div>
						<div class="clearfix"></div>
					</div>
					<div class="widget-content">
						<table id="datatable" class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th class="center">Tanggal</th>
									<th class="center">Jam</th>
									<th class="center">Acara</th>
									<th class="center">Tempat</th>
									<th class="center">Catatan</th>
									<th class="center">Control</th>
								</tr>
							</thead>
							<tbody>
								<?php foreach($array_agenda as $row) { ?>
								<tr>
									<td class="center"><?php echo GetFormatDate($row['tanggal_ajuan_date']); ?></td>
									<td class="center"><?php echo substr($row['tanggal_ajuan_time'], 0, 5); ?></td>
									<td><?php echo $row['acara']; ?></td>
									<td class="center"><?php echo $row['tempat']; ?></td>
									<td><?php echo $row['catatan']; ?></td>
									<td class="center">
										<button data-original-title="Daftar Undangan" class="btn btn-xs btn-skpd-undangan">
											<img src="<?php echo base_url('static/img/icons/icon-detail.png'); ?>" />
										</button>
										<span class="hide"><?php echo json_encode($row); ?></span>
									</td>
								</tr>
								<?php } ?>
							</tbody>
						</table>
						<div class="widget-foot">
							<br /><br />
							<div class="clearfix"></div> 
						</div>
					</div>
				</div>
				
                <div class="widget-foot center">
					<a href="<?php echo base_url(); ?>">Home</a>
				</div>
            </div>  
		</div>
    </div>
	
	<div id="form-skpd" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"><div class="modal-dialog modal-dialog-big"><div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h4 class="modal-title">Form SKPD</h4>
		</div>
		<div class="modal-body"><div class="widget-content">
			<div class="padd">
				<div class="widget grid-spkd">
					<div class="widget-head">
						<div class="pull-left">&nbsp;</div>
						<div class="widget-icons pull-right">&nbsp;</div>
						<div class="clearfix"></div>
					</div>
					<div class="widget-content">
						<table id="dt-skpd" class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th class="center">Nama</th>
									<th>Kepada</th>
									<th>Instansi</th>
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
		</div></div>
		<div class="modal-footer">&nbsp;</div>
	</div></div></div>
</div></div>

<?php $this->load->view( 'common/library_js'); ?>

<script>
$(document).ready(function() {
	var page = {
		init: function() {
			var raw = $('.cnt-data').text();
			eval('var data = ' + raw);
			page.data = data;
			
			// populate data
			Func.populate({ cnt: '#form-search', record: page.data });
			
			// datatable
			$('#datatable').dataTable();
			$('.btn-skpd-undangan').click(function() {
				// get record
				var raw_record = $(this).parents('td').find('span.hide').text();
				eval('var record = ' + raw_record);
				
				// set agenda rapat id
				$('#form-hidden [name="agenda_rapat_id"]').val(record.id);
				
				// show modal
				dt_skpd.reload();
				$('#form-skpd').modal();
			});
		}
	}
	page.init();
	
	// grid skpd
	var skpd_param = {
		id: 'dt-skpd',
		source: web.host + 'rekap/agenda/grid',
		column: [ { }, { }, { } ],
		fnServerParams: function ( aoData ) {
			var param = Func.form.get_value('form-hidden');
			aoData.push(
				{ "name": "agenda_rapat_id", "value": param.agenda_rapat_id }
			)
		}
	}
	var dt_skpd = Func.datatable(skpd_param);
});
</script>

</body>
</html>