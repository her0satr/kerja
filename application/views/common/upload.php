<?php
	$func_callback = (!empty($_GET['callback'])) ? $_GET['callback'] : 'callback';
	$filetype = (!empty($_GET['filetype'])) ? $_GET['filetype'] : '';
	
	$param_update = ($filetype == 'document') ? array( 'AllowedExtention' => array( 'doc', 'docx', 'pdf' ), 'max_size' => 250000 ) : array();
	$file_upload = Upload('document', $this->config->item('base_path') . '/static/upload', $param_update);
	
	$file_name = $file_link = $message = '';
	if ($file_upload['Result'] == 1) {
		$file_name = $file_upload['FileDirName'];
		$file_link = base_url('static/upload/'.$file_name);
	} else {
		$message = @$file_upload['Message'];
	}
	
	// set callback
	$callback = 0;
	if (strlen($file_name) > 0 || strlen($message) > 0) {
		$callback = 1;
	}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en">
<head>
	<link rel="stylesheet" href="<?php echo base_url('static/css/bootstrap.css'); ?>" />
	<script src="<?php echo base_url('static/js/jquery.js'); ?>"></script>
	<script type="text/javascript">
		var func_callback = window.parent.<?php echo $func_callback; ?>;
	</script>
</head>
<body>
	<form method="post" enctype="multipart/form-data" id="form-upload">
		<input type="hidden" name="callback" value="<?php echo $callback; ?>">
		<input type="hidden" name="file_name" value="<?php echo $file_name; ?>">
		<input type="hidden" name="file_link" value="<?php echo $file_link; ?>">
		<input type="hidden" name="message" value="<?php echo $message; ?>">
		
		<div style="padding: 10px 0 0 0;">
			<a class="btn cursor browse btn-primary">Select File</a>
		</div>
		<div class="hide">
			<div class="line"><input type="file" name="document" size="50" /></div>
			<div class="line"><input type="submit" name="Submit" value="Ganti Foto" /></div>
		</div>
	</form>
	<script type="text/javascript">
		$('.browse').click(function() { $('[name="document"]').click(); });
		$('[name="document"]').change(function() { $('#form-upload').submit(); });
		
		// it will call by parent window
		var browse = function() { $('[name="document"]').click(); }
		
		var message = $('[name="message"]').val();
		var callback = $('[name="callback"]').val();
		var file_name = $('[name="file_name"]').val();
		if (callback == 1) {
			if (func_callback != null) { 
				func_callback({ file_name: file_name, message: message, file_link: $('[name="file_link"]').val() });
			}
		}
	</script>
</body>
</html>