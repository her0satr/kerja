<?php
	$page_data = array();
	$array_user_type = $this->user_type_model->get_array();
?>
<?php $this->load->view( 'common/meta', array( 'title' => 'User' ) ); ?>

<body>
<?php $this->load->view( 'common/header'); ?>

<div class="content">
	<?php $this->load->view( 'common/sidebar'); ?>
	<div class="hide">
		<div class="cnt-data"><?php echo json_encode($page_data); ?></div>
		<iframe name="iframe_thumnail" src="<?php echo base_url('upload?callback=set_thumnail'); ?>"></iframe>
	</div>
	
  	<div class="mainbar">
	    <div class="page-head">
			<h2 class="pull-left button-back">User</h2>
			<div class="clearfix"></div>
		</div>
		
	    <div class="matter"><div class="container">
            <div class="row"><div class="col-md-12">
				
				<div class="widget grid-main">
					<div class="widget-head">
						<div class="pull-left">
							<button class="btn btn-info btn-xs btn-add-user">Tambah</button>
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
									<th>Email / NIP</th>
									<th>Fullname</th>
									<th>Jenis User</th>
									<th>Active</th>
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
				
				<div class="widget hide" id="form-user">
					<div class="widget-head">
						<div class="pull-left">Form User</div>
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
								<label class="col-lg-2 control-label">Jenis User</label>
								<div class="col-lg-10">
									<select class="form-control" name="user_type_id">
										<?php echo ShowOption(array( 'Array' => $array_user_type )); ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Email / NIP</label>
								<div class="col-lg-10">
									<input type="text" name="email" class="form-control" placeholder="Email" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Fullname</label>
								<div class="col-lg-10">
									<input type="text" name="fullname" class="form-control" placeholder="Fullname" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Password</label>
								<div class="col-lg-10">
									<input type="password" name="passwd" class="form-control" placeholder="Password" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Password Confirm</label>
								<div class="col-lg-10">
									<input type="password" name="passwd_confirm" class="form-control" placeholder="Password Confirm" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Avatar</label>
								<div class="col-lg-4">
									<input type="text" name="thumbnail" class="form-control" placeholder="Avatar" />
								</div>
								<div class="col-lg-2">
									<input type="button" class="btn btn-primary btn-browse-avatar" value="Browse" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Address</label>
								<div class="col-lg-10">
									<textarea class="form-control" name="address" rows="3" placeholder="Address"></textarea>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Aktif</label>
								<div class="col-lg-10">
									<div class="radio">
										<label><input type="radio" name="is_active" value="1" checked /> Ya</label>
									</div>
									<div class="radio">
										<label><input type="radio" name="is_active" value="0" /> Tidak</label>
									</div>
								</div>
							</div>
							<hr />
							<div class="form-group">
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

<?php $this->load->view( 'common/footer' ); ?>
<?php $this->load->view( 'common/library_js'); ?>

<script>
$(document).ready(function() {
	var dt = null;
	var page = {
		show_grid: function() {
			$('.grid-main').show();
			$('#form-user').hide();
		},
		show_form: function() {
			$('#form-user [name="user_type_id"]').change();
			
			$('.grid-main').hide();
			$('#form-user').show();
		},
		init: function() {
			var temp = $('.cnt-data').html();
			eval('var data = ' + temp);
			page.data = data;
		}
	}
	page.init();
	
	// global
	$('.btn-show-grid').click(function() {
		page.show_grid();
	});
	
	// upload
	$('.btn-browse-avatar').click(function() { window.iframe_thumnail.browse() });
	set_thumnail = function(p) {
		$('#form-user [name="thumbnail"]').val(p.file_name);
	}
	
	// grid
	var param = {
		id: 'datatable',
		source: web.host + 'user/user/grid',
		column: [ { }, { }, { }, { bSortable: false, sClass: 'center' }, { bSortable: false, sClass: 'center' } ],
		callback: function() {
			$('#datatable .btn-edit').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				Func.ajax({ url: web.host + 'user/user/action', param: { action: 'get_by_id', id: record.id }, callback: function(result) {
					Func.populate({ cnt: '#form-user', record: result });
					page.show_form();
				} });
			});
			
			$('#datatable .btn-delete').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				Func.form.del({
					data: { action: 'delete', id: record.id },
					url: web.host + 'user/user/action', callback: function() { dt.reload(); }
				});
			});
		}
	}
	dt = Func.datatable(param);
	
	// form jenis unit
	$('.btn-add-user').click(function() {
		page.show_form();
		$('#form-user form')[0].reset();
		$('#form-user [name="id"]').val(0);
	});
	$('#form-user form').validate({
		rules: {
			user_type_id: { required: true },
			fullname: { required: true, minlength: 5 },
			email: { required: true },
			passwd_confirm: { equalTo: '[name="passwd"]' }
		}
	});
	$('#form-user form').submit(function(e) {
		e.preventDefault();
		if (! $('#form-user form').valid()) {
			return false;
		}
		
		Func.form.submit({
			url: web.host + 'user/user/action',
			param: Func.form.get_value('form-user'),
			callback: function(result) {
				dt.reload();
				page.show_grid();
				$('#form-user form')[0].reset();
			}
		});
	});
});
</script>
</body>
</html>