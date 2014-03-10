<?php $this->load->view( 'panel/common/meta', array( 'title' => 'Schedule' ) ); ?>

<body>
<?php $this->load->view( 'panel/common/header'); ?>

<div class="content">
	<?php $this->load->view( 'panel/common/sidebar'); ?>
  	<div class="mainbar">
	    <div class="page-head">
			<h2 class="pull-left button-back">Schedule</h2>
			<div class="clearfix"></div>
		</div>
		
	    <div class="matter"><div class="container">
            <div class="row"><div class="col-md-12">
				
				<div class="widget grid-main">
					<div class="widget-head">
						<div class="pull-left">
							<button class="btn btn-info btn-xs btn-add-schedule">Tambah</button>
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
									<th>Lokasi</th>
									<th>Waktu</th>
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
				
				<div class="widget hide" id="form-schedule">
					<div class="widget-head">
						<div class="pull-left">Form Schedule</div>
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
								<label class="col-lg-2 control-label">Lokasi</label>
								<div class="col-lg-10">
									<input type="text" name="location" class="form-control" placeholder="Lokasi" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Tanggal</label>
								<div class="col-lg-10">
									<div class="input-append datepicker">
										<input name="schedule_date_temp" type="text" class="form-control dtpicker" placeholder="Tanggal Masuk" data-format="dd-MM-yyyy" />
										<span class="add-on"><i data-time-icon="fa fa-time" data-date-icon="fa fa-calendar" class="btn btn-info"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Waktu</label>
								<div class="col-lg-10">
									<div class="input-append timepicker">
										<input name="schedule_time_temp" data-format="hh:mm:ss" class="form-control dtpicker" type="text" />
										<span class="add-on"><i data-time-icon="fa fa-clock-o" data-date-icon="fa fa-calendar" class="btn btn-info"></i></span>
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
			$('#form-schedule').hide();
		},
		show_form_schedule: function() {
			$('.grid-main').hide();
			$('#form-schedule').show();
		}
	}
	
	// global
	$('.btn-show-grid').click(function() {
		page.show_grid();
	});
	
	// grid
	var param = {
		id: 'datatable',
		source: web.host + 'panel/website/schedule/grid',
		column: [ { }, { }, { }, { bSortable: false, sClass: 'center' } ],
		callback: function() {
			$('#datatable .btn-edit').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				Func.ajax({ url: web.host + 'panel/website/schedule/action', param: { action: 'get_by_id', id: record.id }, callback: function(result) {
					var array_date_time = result.schedule_time.split(' ');
					$('#form-schedule [name="id"]').val(result.id);
					$('#form-schedule [name="name"]').val(result.name);
					$('#form-schedule [name="location"]').val(result.location);
					$('#form-schedule [name="schedule_date_temp"]').val(Func.SwapDate(array_date_time[0]));
					$('#form-schedule [name="schedule_time_temp"]').val(array_date_time[1]);
					
					'id', 'name', 'location', 'schedule_time' 
					
					page.show_form_schedule();
				} });
			});
			
			$('#datatable .btn-delete').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				Func.confirm_delete({
					data: { action: 'delete', id: record.id },
					url: web.host + 'panel/website/schedule/action', callback: function() { dt.reload(); }
				});
			});
		}
	}
	dt = Func.init_datatable(param);
	
	// form jenis unit
	$('.btn-add-schedule').click(function() {
		page.show_form_schedule();
		$('#form-schedule form')[0].reset();
		$('#form-schedule [name="id"]').val(0);
	});
	$('#form-schedule form').validate({
		rules: {
			name: { required: true },
			location: { required: true },
			schedule_date_temp: { required: true },
			schedule_time_temp: { required: true }
		}
	});
	$('#form-schedule form').submit(function() {
		if (! $('#form-schedule form').valid()) {
			return false;
		}
		
		var param = Site.Form.GetValue('form-schedule');
		param.schedule_date_temp = Func.SwapDate(param.schedule_date_temp);
		param.schedule_time = param.schedule_date_temp + ' ' + param.schedule_time_temp;
		
		// delete param
		delete param.schedule_date_temp;
		delete param.schedule_time_temp;
		
		Func.ajax({ url: web.host + 'panel/website/schedule/action', param: param, callback: function(result) {
			if (result.status == 1) {
				dt.reload();
				page.show_grid();
				$('#form-schedule form')[0].reset();
			}
		} });
		
		return false;
	});
});
</script>
</body>
</html>