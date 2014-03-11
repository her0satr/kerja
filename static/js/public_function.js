var Func = {
    base: web.base,
	ajax: function(p) {
		p.is_json = (p.is_json == null) ? true : p.is_json;
		
		$.ajax({ type: 'POST', url: p.url, data: p.param, success: function(data) {
			if (p.is_json == 1) {
				eval('var result = ' + data);
				p.callback(result);
			} else {
				p.callback(data);
			}
		} });
	},
	array_to_json: function(Data) {
		var temp = '';
		for (var i = 0; i < Data.length; i++) {
			temp = (temp.length == 0) ? Func.object_to_json(Data[i]) : temp + ',' + Func.object_to_json(Data[i]);
		}
		return '[' + temp + ']';
	},
	datatable: function(p) {
		var cnt_id = '#' + p.id;
		
		var dt_param = {
			"aoColumns": p.column,
			"sAjaxSource": p.source,
			"bProcessing": true, "bServerSide": true, "sServerMethod": "POST", "sPaginationType": "full_numbers",
			"oLanguage": {
				"sSearch": "<span>Search:</span> ",
				"sInfo": "Showing <span>_START_</span> to <span>_END_</span> of <span>_TOTAL_</span> entries",
				"sLengthMenu": "_MENU_ <span>entries per page</span>"
			},
			"fnDrawCallback": function (oSettings) {
				// init tooltips
				$(cnt_id + ' .tool-tip').tooltip({ placement: 'top' });
				
				if (p.callback != null) {
					p.callback();
				}
			}
		}
		if (p.fnServerParams != null) {
			dt_param.fnServerParams = p.fnServerParams;
		}
		if (p.aaSorting != null) {
			dt_param.aaSorting = p.aaSorting;
		}
		if (p.bPaginate != null) {
			dt_param.bPaginate = p.bPaginate;
		}
		
		var table = $(cnt_id).dataTable(dt_param);
		
		// initiate
		if (p.init != null) {
			p.init();
		}
		
		var dt = {
			table: table,
			reload: function() {
				if ($(cnt_id + '_paginate .paginate_active').length > 0) {
					$(cnt_id + '_paginate .paginate_active').click();
				} else {
					$(cnt_id + '_length select').change();
				}
			}
		}
		
		// init search
		$(cnt_id).parents('.panel-table').find('.btn-search').click(function() {
			var value = $(cnt_id).parents('.panel-table').find('.input-keyword').val();
			dt.table.fnFilter( value );
		});
		
		return dt;
	},
	get_name: function(value) {
		var result = value.trim().replace(new RegExp(/[^0-9a-z]+/gi), '_').toLowerCase();
		return result;
	},
	in_array: function(Value, Array) {
		var Result = false;
		for (var i = 0; i < Array.length; i++) {
			if (Value == Array[i]) {
				Result = true;
				break
			}
		}
		return Result;
	},
	is_empty: function(value) {
		var Result = false;
		if (value == null || value == 0) {
			Result = true;
		} else if (typeof(value) == 'string') {
			value = Helper.Trim(value);
			if (value.length == 0) {
				Result = true;
			}
		}
		
		return Result;
	},
	object_to_json: function(obj) {
		var str = '';
		for (var p in obj) {
			if (obj.hasOwnProperty(p)) {
				if (obj[p] != null) {
					str += (str.length == 0) ? str : ',';
					str += '"' + p + '":"' + obj[p] + '"';
				}
			}
		}
		str = '{' + str + '}';
		return str;
	},
	populate: function(p) {
		for (var form_name in p.record) {
			if (p.record.hasOwnProperty(form_name)) {
				var input = $(p.cnt + ' [name="' + form_name + '"]');
				var value = p.record[form_name];
				if (input.attr('type') == 'checkbox') {
					input.prop('checked', false);
					if (value == 1) {
						input.prop('checked', true);
					}
				} else if (input.hasClass('datepicker')) {
					input.val(Func.SwapDate(value));
				} else {
					input.val(value);
				}
			}
		}
	},
	swap_date: function(value) {
		if (value == null) {
			return '';
		}
		
		var array_value = value.split('-');
		if (array_value.length != 3) {
			return '';
		}
		
		return array_value[2] + '-' + array_value[1] + '-' + array_value[0];
	},
	trim: function(value) {
		return value.replace(/^\s+|\s+$/g,'');
	},
    form: {
		submit: function(p) {
			Func.ajax({ url: p.url, param: p.param, callback: function(result) {
				if (result.status == 1) {
					noty({ text: result.message, layout: 'topRight', type: 'success', timeout: 1500 });
					
					if (p.callback != null) {
						p.callback(result);
					}
				} else {
					noty({ text: result.message, layout: 'topRight', type: 'error', timeout: 1500 });
				}
			} });
		},
        get_value: function(container) {
			var PrefixCheck = container.substr(0, 1);
			if (! Func.in_array(PrefixCheck, ['.', '#'])) {
				container = '#' + container;
			}
			
            var data = Object();
			var set_value = function(obj, name, value) {
				if (typeof(name) == 'undefined') {
					return obj;
				} else if (name.length < 3) {
					obj[name] = value;
					return obj;
				}
				
				var endfix = name.substr(name.length - 2, 2);
				if (endfix == '[]') {
					var name_valid = name.replace(endfix, '');
					if (obj[name_valid] == null) {
						obj[name_valid] = [];
					}
					obj[name_valid].push(value);
				} else {
					obj[name] = value;
				}
				
				return obj;
			}
            
            var Input = jQuery(container + ' input, ' + container + ' select, ' + container + ' textarea');
            for (var i = 0; i < Input.length; i++) {
				var name = Input.eq(i).attr('name');
				var value = Input.eq(i).val();
				
				if (Input.eq(i).attr('type') == 'checkbox') {
					if (Input.eq(i).is(':checked')) {
						data = set_value(data, name, value);
					} else {
						data = set_value(data, name, 0);
					}
				} else if (Input.eq(i).attr('type') == 'radio') {
					value = $(container + ' [name="' + name + '"]:checked').val();
					data = set_value(data, name, value);
				} else {
					data = set_value(data, name, value);
				}
            }
			
            return data;
        },
		del: function(p) {
			var cnt_modal = '';
			cnt_modal += '<div id="cnt-confirm" class="modal small fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">';
			cnt_modal += '<div class="modal-dialog">';
			cnt_modal += '<div class="modal-content">';
			cnt_modal += '<div class="modal-header">';
			cnt_modal += '<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>';
			cnt_modal += '<h4 class="modal-title">Konfirmasi Penghapusan !!</h4>';
			cnt_modal += '</div>';
			cnt_modal += '<div class="modal-body">';
			cnt_modal += '<p>Apa Anda sudah yakin ?</p>';
			cnt_modal += '</div>';
			cnt_modal += '<div class="modal-footer">';
			cnt_modal += '<button type="button" class="btn btn-close btn-default" data-dismiss="modal" aria-hidden="true">Tidak</button>';
			cnt_modal += '<button type="button" class="btn btn-primary">Ya</button>';
			cnt_modal += '</div>';
			cnt_modal += '</div>';
			cnt_modal += '</div>';
			cnt_modal += '</div>';
			$('#cnt-temp').html(cnt_modal);
			$('#cnt-confirm').modal();
			
			$('#cnt-confirm .btn-primary').click(function() {
				$.ajax({ type: "POST", url: p.url, data: p.data }).done(function( raw_result ) {
					eval('var result = ' + raw_result);
					
					$('#cnt-confirm .btn-close').click();
					noty({ text: result.message, layout: 'topRight', type: 'success', timeout: 1500 });
					
					if (p.callback != null) {
						p.callback();
					}
				});
			});
		}
    }
}

/*	jQuery */
// combo.category_sub({ category_id: $(this).val(), target: $('#modal-advert-type-sub [name="category_sub_id"]') });
// combo.category_sub({ category_id: 'x', target: $('#modal-advert-type-sub [name="category_sub_id"]'), value: result.category_sub_id });
var combo = {
	category_sub: function(p) {
		p.category_id = (p.category_id == null) ? 0 : p.category_id;
		
		var ajax_param = {
			is_json: 0, url: web.base + 'panel/combo',
			param: { action: 'category_sub', category_id: p.category_id },
			callback: function(option) {
				p.target.html(option);
				
				// set value
				if (typeof(p.value) != 'undefined') {
					p.target.val(p.value);
				}
				
				if (p.callback != null) {
					p.callback();
				}
			}
		}
		Func.ajax(ajax_param);
	}
}