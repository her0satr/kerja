<?php $this->load->view( 'panel/common/meta', array( 'title' => 'Stock Kendaraan' ) ); ?>

<body>
<?php $this->load->view( 'panel/common/header'); ?>

<div class="content">
	<?php $this->load->view( 'panel/common/sidebar'); ?>
	
  	<div class="mainbar">
	    <div class="page-head">
			<h2 class="pull-left button-back">Stock Kendaraan</h2>
			<div class="clearfix"></div>
		</div>
		
	    <div class="matter"><div class="container">
            <div class="row"><div class="col-md-12">
				
				<div class="widget grid-main">
					<div class="widget-head">
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
									<th>Jenis Unit</th>
									<th>Jenis Warna</th>
									<th>Jumlah</th></tr>
							</thead>
							<tbody></tbody>
						</table>
						
						<div class="widget-foot">
							<br /><br />
							<div class="clearfix"></div> 
						</div>
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
			$('#form-jenis-angsuran').hide();
		}
	}
	
	// grid
	var param = {
		id: 'datatable',
		source: web.host + 'panel/report/stock_kendaraan/grid',
		column: [ { }, { }, { } ]
	}
	dt = Func.init_datatable(param);
});
</script>
</body>
</html>