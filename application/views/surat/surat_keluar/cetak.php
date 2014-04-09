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
td.border { padding: 10px; border: 1px solid #000000; }
</style>

<table style="width: 95%; border-collapse: collapse;">
	<tr>
		<td class="border" style="width: 5%; padding: 0px;" rowspan="5">
			<img src="<?php echo base_url('static/img/logo-surat-keluar.png'); ?>" style="width: 100%px;" />
		</td>
		<td class="border" style="width: 65%;">
			Index<br />
			<?php echo $surat_keluar['index_surat_title']; ?>
		</td>
		<td class="border" style="width: 15%; padding: 15px;">
			Kode<br />
			<?php echo $surat_keluar['index_surat_code']; ?>
		</td>
		<td class="border" style="width: 15%; padding: 20px;">
			No Urut<br />
			<?php echo $surat_keluar['no_urut']; ?>
		</td>
	</tr>
	<tr>
		<td class="border" colspan="3">Isi Ringkas</td>
	</tr>
	<tr>
		<td class="border" colspan="3">
			Kepada<br />
			<?php echo $surat_keluar['tujuan']; ?>
		</td>
	</tr>
	<tr>
		<td class="border">
			Pengolah<br />
			<?php echo $surat_keluar['pengolah']; ?>
		</td>
		<td class="border">
			Tanggal Surat<br />
			<?php echo GetFormatDate($surat_keluar['tanggal_surat']); ?>
		</td>
		<td class="border">
			Lampiran<br />
			<?php echo $surat_keluar['lampiran']; ?>
		</td>
	</tr>
	<tr>
		<td class="border" colspan="3">
			Catatan<br />
			<?php echo $surat_keluar['catatan']; ?>
		</td>
	</tr>
</table>