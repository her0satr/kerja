<?php
	$page_data = array();
	
	$array_laporan = array(
		array( 'id' => 'buku_1.doc', 'title' => 'BUKU PENJAGAAN KENAIKAN GAJI BERKALA DAN REALISASINYA' ),
		array( 'id' => 'buku_2.doc', 'title' => 'BUKU PENJAGAAN KENAIKAN PANGKAT  DAN REALISASINYA' ),
		array( 'id' => 'buku_3.doc', 'title' => 'BUKU PENJAGAAN PENSIUN  DAN REALISASINYA' ),
		array( 'id' => 'buku_4.doc', 'title' => 'BUKU PENINGKATAN PENDIDIKAN DAN LATIHAN' ),
		array( 'id' => 'buku_5.doc', 'title' => 'B U K U    C U T I' ),
		array( 'id' => 'buku_6.doc', 'title' => 'DAFTAR URUT KEPANGKATAN PEGAWAI NEGERI SIPIL' )
	);
?>
<?php $this->load->view( 'common/meta', array( 'title' => 'Rekap Agenda Rapat' ) ); ?>

<body>
<?php $this->load->view( 'common/header'); ?>

<div class="content enlarged">
	<?php $this->load->view( 'common/sidebar'); ?>
	<div class="hide cnt-data"><?php echo json_encode($page_data); ?></div>
	
  	<div class="mainbar">
	    <div class="page-head">
			<h2 class="pull-left button-back">Download Laporan</h2>
			<div class="clearfix"></div>
		</div>
		
	    <div class="matter"><div class="container">
            <div class="row"><div class="col-md-12">

				<div class="widget" id="form-report">
					<div class="widget-head">
						<div class="pull-left">Pencarian</div>
						<div class="widget-icons pull-right">
							<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
							<a href="#" class="wclose"><i class="fa fa-times"></i></a>
						</div>
						<div class="clearfix"></div>
					</div>
					
					<div class="widget-content">
						<div class="padd"><form class="form-horizontal" method="post">
							<input type="hidden" name="action" value="download_word" />
							
							<div class="form-group">
								<label class="col-lg-2 control-label">Jenis Laporan</label>
								<div class="col-lg-10">
									<select class="form-control" name="report_name">
										<?php echo ShowOption(array( 'Array' => $array_laporan )); ?>
									</select>
								</div>
							</div>
							<hr />
							<div class="form-group">
								<div class="col-lg-offset-2 col-lg-9">
									<button type="submit" class="btn btn-info">Download</button>
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
	var page = {
		init: function() {
			var temp = $('.cnt-data').html();
			eval('var data = ' + temp);
			page.data = data;
		}
	}
	page.init();
	
	// form detail
	$('#form-report form').validate({
		rules: {
			hp: { required: true }
		}
	});
	$('#form-report form').submit(function(e) {
		e.preventDefault();
		if (! $('#form-report form').valid()) {
			return false;
		}
		
		var param = Func.form.get_value('form-report');
		window.open(web.host + 'kepegawaian/report/download/' + param.report_name);
	});
});
</script>
</body>
</html>