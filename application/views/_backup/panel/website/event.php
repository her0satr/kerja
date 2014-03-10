<?php $this->load->view( 'panel/common/meta', array( 'title' => 'Event' ) ); ?>

<body>
<?php $this->load->view( 'panel/common/header'); ?>

<div class="content">
	<?php $this->load->view( 'panel/common/sidebar'); ?>
	<div class="hide">
		<iframe name="iframe_thumnail" src="<?php echo base_url('panel/upload?callback=set_thumnail'); ?>"></iframe>
	</div>
	
  	<div class="mainbar">
	    <div class="page-head">
			<h2 class="pull-left button-back">Event</h2>
			<div class="clearfix"></div>
		</div>
		
	    <div class="matter"><div class="container">
            <div class="row"><div class="col-md-12">
				
				<div class="widget grid-main">
					<div class="widget-head">
						<div class="pull-left">
							<button class="btn btn-info btn-xs btn-add-event">Tambah</button>
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
									<th>Title</th>
									<th>Content</th>
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
				
				<div class="widget hide" id="form-event">
					<div class="widget-head">
						<div class="pull-left">Form Event</div>
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
								<label class="col-lg-2 control-label">Judul</label>
								<div class="col-lg-10">
									<input type="text" name="name" class="form-control" placeholder="Judul" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Keterangan</label>
								<div class="col-lg-10">
									<textarea class="form-control" rows="3" name="content" placeholder="Keterangan"></textarea>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Thumbnail</label>
								<div class="col-lg-4">
									<input type="text" name="thumbnail" class="form-control" placeholder="Avatar" />
								</div>
								<div class="col-lg-2">
									<input type="button" class="btn btn-primary btn-browse-avatar" value="Browse" />
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
			$('#form-event').hide();
		},
		show_form_event: function() {
			$('.grid-main').hide();
			$('#form-event').show();
		}
	}
	
	// global
	$('.btn-show-grid').click(function() {
		page.show_grid();
	});
	
	// upload
	$('.btn-browse-avatar').click(function() { window.iframe_thumnail.browse() });
	set_thumnail = function(p) {
		$('#form-event [name="thumbnail"]').val(p.file_name);
	}
	
	// grid
	var param = {
		id: 'datatable',
		source: web.host + 'panel/website/event/grid',
		column: [ { }, { }, { bSortable: false, sClass: 'center' } ],
		callback: function() {
			$('#datatable .btn-edit').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				Func.ajax({ url: web.host + 'panel/website/event/action', param: { action: 'get_by_id', id: record.id }, callback: function(result) {
					$('#form-event [name="id"]').val(result.id);
					$('#form-event [name="name"]').val(result.name);
					$('#form-event [name="content"]').val(result.content);
					$('#form-event [name="thumbnail"]').val(result.thumbnail);
					
					page.show_form_event();
				} });
			});
			
			$('#datatable .btn-delete').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				Func.confirm_delete({
					data: { action: 'delete', id: record.id },
					url: web.host + 'panel/website/event/action', callback: function() { dt.reload(); }
				});
			});
		}
	}
	dt = Func.init_datatable(param);
	
	// form jenis unit
	$('.btn-add-event').click(function() {
		page.show_form_event();
		$('#form-event form')[0].reset();
		$('#form-event [name="id"]').val(0);
	});
	$('#form-event form').validate({
		rules: {
			name: { required: true },
			content: { required: true }
		}
	});
	$('#form-event form').submit(function() {
		if (! $('#form-event form').valid()) {
			return false;
		}
		
		var param = Site.Form.GetValue('form-event');
		Func.ajax({ url: web.host + 'panel/website/event/action', param: param, callback: function(result) {
			if (result.status == 1) {
				dt.reload();
				page.show_grid();
				$('#form-event form')[0].reset();
			}
		} });
		
		return false;
	});
});
</script>
</body>
</html>