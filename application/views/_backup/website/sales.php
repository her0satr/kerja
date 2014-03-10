<?php
	$param_rekap_penjualan['date_start'] = date("Y-m-01");
	$param_rekap_penjualan['date_end'] = date("Y-m-t");
	$array_rekap_penjualan = $this->Penjualan_model->get_rekap_penjualan($param_rekap_penjualan);
?>
<?php $this->load->view( 'website/common/meta' ); ?>
<body>
	<?php $this->load->view( 'website/common/header' ); ?>
	<?php $this->load->view( 'website/common/menu' ); ?>
	
	<div class="content">
		<div class="error">
			<div class="main-title"><div class="pad">DATA ERROR / KEKURANGAN UANG MUKA</div></div>
			<div class="table">
				<table class="reference">
					<tr>
						<th class="center">Unit Unit</th>
						<th class="center">Jumlah Kredit</th>
						<th class="center">Jumlah Tunai</th></tr>
					<?php foreach ($array_rekap_penjualan as $row) { ?>
					<tr>
						<td><?php echo $row['jenis_unit_name']; ?></td>
						<td class="center"><?php echo $row['kredit']; ?></td>
						<td class="center"><?php echo $row['tunai']; ?></td>
					</tr>
					<?php } ?>
				</table>
			</div>
		</div>
	</div>
	<div class="clear"></div>
</body>