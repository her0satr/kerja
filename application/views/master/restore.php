<?php $this->load->view( 'common/meta', array( 'title' => 'Restore DB' ) ); ?>

<body>
<?php $this->load->view( 'common/header'); ?>

<div class="content">
	<?php $this->load->view( 'common/sidebar'); ?>
	<div class="hide">
		<iframe name="iframe_file_restore" src="<?php echo base_url('upload?callback=set_file_restore'); ?>"></iframe>
	</div>
	
  	<div class="mainbar">
	    <div class="page-head">
			<h2 class="pull-left button-back">Restore DB</h2>
			<div class="clearfix"></div>
		</div>
		
	    <div class="matter"><div class="container">
            <div class="row"><div class="col-md-12">
				
				<div class="widget" id="form-restore">
					<div class="widget-head">
						<div class="pull-left">Form Restore DB</div>
						<div class="widget-icons pull-right">
							<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
							<a href="#" class="wclose"><i class="fa fa-times"></i></a>
						</div>
						<div class="clearfix"></div>
					</div>
					
					<div class="widget-content">
						<div class="padd"><form class="form-horizontal">
							<input type="hidden" name="action" value="execute_restore" />
							
							<div class="form-group">
								<label class="col-lg-2 control-label">File Restore</label>
								<div class="col-lg-4">
									<input type="text" name="file_restore" class="form-control" placeholder="File Restore" />
								</div>
								<div class="col-lg-2">
									<input type="button" class="btn btn-primary btn-browse-file-restore" value="Browse" />
								</div>
							</div>
							
							<hr />
							<div class="form-group">
								<div class="col-lg-offset-2 col-lg-9">
									<button type="submit" class="btn btn-info">Restore</button>
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
	// upload
	$('.btn-browse-file-restore').click(function() { window.iframe_file_restore.browse() });
	set_file_restore = function(p) {
		$('#form-restore [name="file_restore"]').val(p.file_name);
	}
	
	// form restore
	$('#form-restore form').validate({
		rules: {
			file_restore: { required: true }
		}
	});
	$('#form-restore form').submit(function(e) {
		e.preventDefault();
		if (! $('#form-restore form').valid()) {
			return false;
		}
		
		Func.form.submit({
			url: web.host + 'master/restore/action',
			param: Func.form.get_value('form-restore'),
			callback: function(result) {
				$('#form-restore form')[0].reset();
			}
		});
	});
});
</script>
</body>
</html>