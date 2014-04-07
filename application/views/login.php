<?php $this->load->view( 'common/meta' ); ?>

<body>

<!-- Form area -->
<div class="admin-form"><div class="container">
	<div class="row">
		<div class="col-md-12">
            <div class="widget">
				<div class="widget-head">
					<i class="icon-lock"></i> Login 
				</div>
				
				<div class="widget-content" id="form-login">
					<div class="padd">
						<div class="center"><img src="<?php echo base_url('static/img/logo.png'); ?>" style="width: 75%;" /></div>
						<form class="form-horizontal" method="post">
							<div class="form-group">
								<label class="control-label col-lg-3">Email / NIP</label>
								<div class="col-lg-9">
									<input type="text" name="email" class="form-control" placeholder="Email / NIP" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-lg-3">Password</label>
								<div class="col-lg-9">
									<input type="password" name="passwd" class="form-control" placeholder="Password" />
								</div>
							</div>
							<div class="col-lg-9 col-lg-offset-3">
								<button type="submit" class="btn btn-danger">Sign in</button>
								<button type="reset" class="btn btn-default">Reset</button>
							</div>
							<br />
						</form>
					</div>
                </div>
                <div class="widget-foot">
					<div style="margin: 0 auto; width: 75%;">
						<div style="float: left; width: 50%; text-align: center;">
							<a href="<?php echo base_url('rekap/absensi'); ?>">
								<img src="<?php echo base_url('static/img/icons/icon-absensi.png'); ?>" />
							</a><br />
							<a href="<?php echo base_url('rekap/absensi'); ?>">Rekap Absensi</a>
						</div>
						<div style="float: left; width: 50%; text-align: center;">
							<a href="<?php echo base_url('rekap/agenda'); ?>">
								<img src="<?php echo base_url('static/img/icons/icon-agenda-rapat.png'); ?>" />
							</a><br />
							<a href="<?php echo base_url('rekap/agenda'); ?>">Rekap Agenda</a>
						</div>
						<div class="clear"></div>
					</div>
				</div>
            </div>  
		</div>
    </div>
</div></div>

<?php $this->load->view( 'common/library_js'); ?>

<script>
$(document).ready(function() {
	$('#form-login form').validate({
		rules: {
			email: { required: true },
			passwd: { required: true }
		}
	});
	$('#form-login form').submit(function(e) {
		e.preventDefault();
		if (! $('#form-login form').valid()) {
			return false;
		}
		
		var param = Func.form.get_value('form-login');
		Func.ajax({ url: web.host + 'home/action', param: param, callback: function(result) {
			if (result.success) {
				window.location = web.host;
			} else {
				noty({ text: result.message, layout: 'topRight', type: 'error', timeout: 1500 });
			}
		} });
	});
});
</script>

</body>
</html>