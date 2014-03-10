<?php
	$array_user_type = $this->User_Type_model->get_array();
	$array_koordinator = $this->User_model->get_array(array( 'user_type_id' => USER_ID_SALES ));
	
	$page_data['USER_ID_SALES'] = USER_ID_SALES;
?>
<?php $this->load->view( 'panel/common/meta', array( 'title' => 'User' ) ); ?>

<body>
<?php $this->load->view( 'panel/common/header'); ?>

<div class="content">
	<?php $this->load->view( 'panel/common/sidebar'); ?>
	<div class="hide">
		<div class="cnt-data"><?php echo json_encode($page_data); ?></div>
		<iframe name="iframe_thumnail" src="<?php echo base_url('panel/upload?callback=set_thumnail'); ?>"></iframe>
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
									<th>Email</th>
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
							<div class="form-group cnt-sales">
								<label class="col-lg-2 control-label">Koordinator Sales</label>
								<div class="col-lg-10">
									<select class="form-control" name="koordinator_id">
										<?php echo ShowOption(array( 'Array' => $array_koordinator, 'ArrayTitle' => 'fullname' )); ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Email</label>
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

<?php $this->load->view( 'panel/common/footer' ); ?>
<?php $this->load->view( 'panel/common/library_js'); ?>

<script>
$(document).ready(function() {
	var dt = null;
	var page = {
		show_grid: function() {
			$('.grid-main').show();
			$('#form-user').hide();
		},
		show_form_user: function() {
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
	$('#form-user [name="user_type_id"]').change(function() {
		var value = $(this).val();
		if (value == page.data.USER_ID_SALES) {
			$('.cnt-sales').show();
		} else {
			$('.cnt-sales').hide();
		}
	});
	
	// upload
	$('.btn-browse-avatar').click(function() { window.iframe_thumnail.browse() });
	set_thumnail = function(p) {
		$('#form-user [name="thumbnail"]').val(p.file_name);
	}
	
	// grid
	var param = {
		id: 'datatable',
		source: web.host + 'panel/member/user/grid',
		column: [ { }, { }, { }, { bSortable: false, sClass: 'center' }, { bSortable: false, sClass: 'center' } ],
		callback: function() {
			$('#datatable .btn-edit').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				Func.ajax({ url: web.host + 'panel/member/user/action', param: { action: 'get_by_id', id: record.id }, callback: function(result) {
					$('#form-user [name="id"]').val(result.id);
					$('#form-user [name="user_type_id"]').val(result.user_type_id);
					$('#form-user [name="koordinator_id"]').val(result.koordinator_id);
					$('#form-user [name="email"]').val(result.email);
					$('#form-user [name="address"]').val(result.address);
					$('#form-user [name="fullname"]').val(result.fullname);
					$('#form-user [name="thumbnail"]').val(result.thumbnail);
					$('#form-user [name="is_active"]').filter('[value=' + result.is_active.toString() + ']').click();
					
					page.show_form_user();
				} });
			});
			
			$('#datatable .btn-delete').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				Func.confirm_delete({
					data: { action: 'delete', id: record.id },
					url: web.host + 'panel/member/user/action', callback: function() { dt.reload(); }
				});
			});
		}
	}
	dt = Func.init_datatable(param);
	
	// form jenis unit
	$('.btn-add-user').click(function() {
		page.show_form_user();
		$('#form-user form')[0].reset();
		$('#form-user [name="id"]').val(0);
	});
	$('#form-user form').validate({
		rules: {
			user_type_id: { required: true },
			fullname: { required: true, minlength: 5 },
			email: { required: true, email: true },
			passwd_confirm: { equalTo: '[name="passwd"]' }
		}
	});
	$('#form-user form').submit(function() {
		if (! $('#form-user form').valid()) {
			return false;
		}
		
		var param = Site.Form.GetValue('form-user');
		param.is_active = $('[name="is_active"]:checked').val();
		Func.ajax({ url: web.host + 'panel/member/user/action', param: param, callback: function(result) {
			if (result.status == 1) {
				dt.reload();
				page.show_grid();
				$('#form-user form')[0].reset();
				
				if (typeof(result.page_reload) != 'undefined') {
					if (result.page_reload) {
						window.location = web.host + 'panel/member/user';
					}
				}
			}
		} });
		
		return false;
	});
});
</script>
</body>
</html>