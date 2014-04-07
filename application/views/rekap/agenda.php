<?php
	$skpd = (isset($_POST['skpd_id'])) ? $this->skpd_model->get_by_id(array( 'id' => $_POST['skpd_id'] )) : array();
	
	// array agenda
	$param_agenda = array(
		'rahasia' => 0,
		'today' => $this->config->item('current_date'),
		'limit' => 100
	);
	if (!empty($_POST['skpd_id'])) {
		$param_agenda['skpd_id'] = $_POST['skpd_id'];
	}
	$array_agenda = $this->agenda_rapat_model->get_array($param_agenda);
	
	// page data
	$page_data['skpd_id'] = @$skpd['id'];
	$page_data['skpd_title'] = @$skpd['title'];
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
				<div class="widget-head">
					<i class="icon-lock"></i> Rekap Agenda
				</div>
				
				<div class="widget-content">
					<form class="form-horizontal" method="post" id="form-search">
						<input type="hidden" name="skpd_id" value="0" />
						
						<div class="form-group">
							<label class="col-lg-2 control-label">SKPD</label>
							<div class="col-lg-5 cnt-typeahead">
								<input type="text" name="skpd_title" class="form-control typeahead-skpd" placeholder="SKPD" />
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
	var page = {
		init: function() {
			var raw = $('.cnt-data').text();
			eval('var data = ' + raw);
			page.data = data;
			
			// populate data
			Func.populate({ cnt: '#form-search', record: page.data });
			
			// datatable
			$('#datatable').dataTable();
		}
	}
	page.init();
	
	// skpd
	var skpd_store = new Bloodhound({
		datumTokenizer: Bloodhound.tokenizers.obj.whitespace('title'),
		queryTokenizer: Bloodhound.tokenizers.whitespace,
		prefetch: web.host + 'typeahead?action=skpd',
		remote: web.host + 'typeahead?action=skpd&namelike=%QUERY'
	});
	skpd_store.initialize();
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
		$('#form-search [name="skpd_id"]').val(data.id);
	});
});
</script>

</body>
</html>