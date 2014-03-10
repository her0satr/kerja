<?php
	$array_penjualan_pending = $this->Penjualan_model->get_penjualan_pending();
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
						<th class="center">KTP</th>
						<th class="center">Gesek</th>
						<th class="center">Bast</th></tr>
					<tr>
						<td class="center"><?php echo $array_penjualan_pending['no_ktp']; ?></td>
						<td class="center"><?php echo $array_penjualan_pending['no_gesek']; ?></td>
						<td class="center"><?php echo $array_penjualan_pending['no_bask']; ?></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div class="clear"></div>
</body>