<?php
	// surat keluar
	$surat_keluar_id = $_GET['id'];
	$surat_keluar = $this->surat_keluar_model->get_by_id(array( 'id' => $surat_keluar_id ));
	if (count($surat_keluar) == 0) {
		header('Location: '.base_url());
		exit;
	}
	
	// array disposisi
	$array_disposisi = $this->disposisi_model->get_array(array( 'surat_keluar_id' => $surat_keluar_id ));
?>

<style>
td { vertical-align: top; }
td.border { padding: 3px; border: 1px solid #000000; }
</style>

<table style="width: 95%; border-collapse: collapse;">
	<tr style="height: 40px;">
		<td class="border" style="width: 5%; padding: 0px; border: none; background: #CCCCCC;" rowspan="5">
			<img src="<?php echo base_url('static/img/logo-surat-keluar_transparant.png'); ?>" style="width: 100%px;" />
		</td>
		<td class="border" style="width: 45%; border-top: none; border-left: none;">
			<strong>Index</strong><br />
			<?php echo $surat_keluar['index_surat_title']; ?>
		</td>
		<td class="border" style="width: 25%; border-top: none;">
			<strong>Kode</strong><br />
			<?php echo $surat_keluar['index_surat_code']; ?>
		</td>
		<td class="border" style="width: 25%; border-top: none; border-right: none;">
			<strong>No Urut</strong><br />
			<?php echo $surat_keluar['no_urut']; ?>
		</td>
	</tr>
	<tr style="height: 100px;">
		<td class="border" colspan="3" style="border-right: none; border-left: none;"><strong>Isi Ringkas</strong></td>
	</tr>
	<tr style="height: 75px;">
		<td class="border" colspan="3" style="border-right: none; border-left: none;">
			<strong>Kepada</strong><br />
			<?php echo $surat_keluar['tujuan']; ?>
		</td>
	</tr>
	<tr style="height: 40px;">
		<td class="border" style="border-left: none;">
			<strong>Pengolah</strong><br />
			<?php echo $surat_keluar['pengolah']; ?>
		</td>
		<td class="border">
			<strong>Tanggal Surat</strong><br />
			<?php echo GetFormatDate($surat_keluar['tanggal_surat']); ?>
		</td>
		<td class="border" style="border-right: none;">
			<strong>Lampiran</strong><br />
			<?php echo $surat_keluar['lampiran']; ?>
		</td>
	</tr>
	<tr style="height: 75px;">
		<td class="border" colspan="3" style="border-bottom: none; border-right: none; border-left: none;">
			<strong>Catatan</strong><br />
			<?php echo $surat_keluar['catatan']; ?>
		</td>
	</tr>
</table>