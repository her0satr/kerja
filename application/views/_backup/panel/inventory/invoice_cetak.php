<?php
	$invoice_id = (!empty($_GET['id'])) ? $_GET['id'] : 0;
	$invoice = $this->Invoice_model->get_by_id(array( 'id' => $invoice_id ));
?>
<div>
	<div style="float: left; width: 200px;">
		<img src="<?php echo base_url('static/img/logo.png'); ?>" style="width: 80%;" />
	</div>
	<div style="float: left; width: 250px; font-size: 30px; padding: 2px 0 0 0; text-align: center;">KWINTANSI</div>
	<div style="float: left; width: 200px; font-size: 16px; padding: 16px 0 0 0; text-align: right;">No. <?php echo $invoice['no']; ?></div>
	<div style="clear: both;"></div>
</div>

<div style="padding: 50px 0;">
	<div style="float: left; width: 190px;">Telah Diterima dari</div>
	<div style="float: left; width: 400px;">: <?php echo $invoice['pengantar']; ?></div>
	<div style="clear: both; margin: 0 0 10px 0;"></div>
	<div style="float: left; width: 190px;">Uang Sebesar</div>
	<div style="float: left; width: 400px;">: <?php echo $invoice['rupiah_text']; ?></div>
	<div style="clear: both; margin: 0 0 10px 0;"></div>
	<div style="float: left; width: 190px;">Untuk Pembayaran</div>
	<div style="float: left; width: 400px;">: <?php echo $invoice['content']; ?></div>
	<div style="clear: both; margin: 0 0 50px 0;"></div>
	<div style="padding: 0 0 0 64%;"><?php echo GetFormatDate($invoice['date_print'], array( 'FormatDate' => 'l, j F Y', 'replace_indo' => true )); ?></div>
</div>

<div>
	<div style="float: left; width: 30%;">
		<div style="padding: 0 0 0 25px;">Rp. <?php echo $invoice['rupiah_angka_format']; ?></div>
	</div>
	<div style="float: left; width: 30%;">
		<div style="text-align: center; margin: 0 0 50px 0;">Yang Menyerahkan,</div>
		<div style="text-align: center;"><?php echo $invoice['pengantar']; ?></div>
	</div>
	<div style="float: left; width: 30%;">
		<div style="text-align: center; margin: 0 0 50px 0;">Yang Menerima,</div>
		<div style="text-align: center;"><?php echo $invoice['fullname']; ?></div>
	</div>
	<div style="clear: both;"></div>
</div>