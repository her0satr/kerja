<?php
	$param_agenda = array(
		'rahasia' => 0,
		'today' => $this->config->item('current_date'),
		'limit' => 100
	);
	$array_agenda = $this->agenda_rapat_model->get_array($param_agenda);
?>
<?php $this->load->view( 'common/meta', array( 'title' => 'Rekap Agenda' ) ); ?>

<body>
<div class="admin-form big"><div class="container">
	<div class="row">
		<div class="col-md-12">
            <div class="widget">
				<div class="widget-head">
					<i class="icon-lock"></i> Rekap Agenda
				</div>
				
				<div class="widget grid-main" style="margin: 20px;">
					<div class="widget-head">
						<div class="pull-left">&nbsp;</div>
						<div class="widget-icons pull-right">&nbsp;</div>
						<div class="clearfix"></div>
					</div>
					<div class="widget-content">
						<table id="datatable" class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th class="center">Acara</th>
									<th class="center">No Surat</th>
									<th class="center">Tempat</th>
									<th class="center">Tanggal</th>
									<th class="center">Jam</th>
									<th class="center">Catatan</th>
								</tr>
							</thead>
							<tbody>
								<?php foreach($array_agenda as $row) { ?>
								<tr>
									<td><?php echo $row['acara']; ?></td>
									<td class="center"><?php echo $row['no_surat']; ?></td>
									<td class="center"><?php echo $row['tempat']; ?></td>
									<td class="center"><?php echo GetFormatDate($row['tanggal_ajuan_date']); ?></td>
									<td class="center"><?php echo substr($row['tanggal_ajuan_time'], 0, 5); ?></td>
									<td><?php echo $row['catatan']; ?></td>
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
</div></div>

<?php $this->load->view( 'common/library_js'); ?>

<script>
$(document).ready(function() {
	// datatable
	$('#datatable').dataTable();
});
</script>

</body>
</html>