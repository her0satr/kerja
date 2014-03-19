<div id="form-password" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"><div class="modal-dialog modal-dialog-big"><div class="modal-content"><form>
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h4 class="modal-title">Change Password</h4>
	</div>
	<div class="modal-body"><div class="widget-content">
		<div class="padd"><div class="form-horizontal">
			
			<div class="form-group">
				<label class="col-lg-3 control-label">Password Lama</label>
				<div class="col-lg-9"><input type="password" class="form-control" name="password_old" placeholder="Password Lama" /></div>
			</div>
			<div class="form-group">
				<label class="col-lg-3 control-label">Password Baru</label>
				<div class="col-lg-9"><input type="password" class="form-control" name="password_new" placeholder="Password Baru" id="password_new" /></div>
			</div>
			<div class="form-group">
				<label class="col-lg-3 control-label">Password Baru (Konfirmasi)</label>
				<div class="col-lg-9"><input type="password" class="form-control" name="password_confirm" placeholder="Password Baru (Konfirmasi)" /></div>
			</div>
			
		</div></div>
	</div></div>
	<div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal" aria-hidden="true">Close</button>
		<button type="submit" class="btn btn-primary">Sent</button>
	</div>
</form></div></div></div>

<footer>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<p class="copy">Copyright &copy; <?php echo date("Y"); ?> | <a href="#">Your Site</a> </p>
			</div>
		</div>
	</div>
</footer>

<div id="cnt-temp"></div>
<span class="totop"><a href="#"><i class="fa fa-chevron-up"></i></a></span>

<script type="text/javascript">
$(document).ready(function() {
	$('.btn-password').click(function() {
		$('#form-password form')[0].reset();
		$('#form-password').modal();
	});
	
	$('#form-password form').validate({
		rules: {
			password_old: { required: true },
			password_new: { required: true },
			password_confirm: { required: true, equalTo: "#password_new" }
		}
	});
	$('#form-password form').submit(function(e) {
		e.preventDefault();
		if (! $('#form-password form').valid()) {
			return false;
		}
		
		Func.form.submit({
			url: web.host + 'home/change_password',
			param: Func.form.get_value('form-password'),
			callback: function(result) {
				$('#form-password').modal('hide');
			}
		});
	});
});
</script>