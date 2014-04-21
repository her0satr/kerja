<?php
	// biodata
	$biodata = $this->biodata_model->get_by_id(array( 'id' => $_GET['biodata_id'] ));
	
	// array skp
	$param_array['biodata_id'] = $_GET['biodata_id'];
	$param_array['tanggal'] = $_GET['tanggal'];
	$array_skp = $this->kegiatan_skp_model->get_array($param_array);
?>

<style>
td { vertical-align: top; }
td.border { padding: 3px; border: 1px solid #000000; }
</style>

<h2 style="text-align: center;">KEGIATAN KERJA HARIAN PNS</h2>

<div style="margin: 0 0 10px 0; padding: 0 0 10px 0;">
	<table style="width: 95%; border-collapse: collapse;">
		<tr>
			<td style="width: 15%;">Hari</td>
			<td style="width: 75%;">: <?php echo GetFormatDate($_GET['tanggal'], array( 'FormatDate' => 'l', 'replace_indo' => true )); ?></td>
		</tr>
		<tr>
			<td>Tanggal</td>
			<td>: <?php echo GetFormatDate($_GET['tanggal']); ?></td>
		</tr>
	</table>
</div>

<table style="width: 100%; border-collapse: collapse;">
	<tr style="text-align: center;">
		<td class="border" style="width: 10%;">No</td>
		<td class="border" style="width: 20%;">Jam</td>
		<td class="border" style="width: 40%;">Uraian Kegiatan</td>
		<td class="border" style="width: 30%;">Kendala yang dihadapi</td>
	</tr>
	<?php $counter = 1; ?>
	<?php foreach ($array_skp as $row) { ?>
	<tr>
		<td class="border" style="text-align: center;"><?php echo $counter; ?></td>
		<td class="border" style="text-align: center;"><?php echo $row['waktu']; ?></td>
		<td class="border"><?php echo $row['title']; ?></td>
		<td class="border"><?php echo $row['kendala']; ?></td>
	</tr>
	<?php $counter++; ?>
	<?php } ?>
</table><br /><br /><br />

<div>
	<table style="width: 100%; border-collapse: collapse;">
		<tr>
			<td style="width: 60%;">&nbsp;</td>
			<td style="width: 40%; text-align: center;">
				Malang,<br />
				Yang bersangkutan<br /><br /><br />
				<?php echo $biodata['nama']; ?><br />
				NIP. <?php echo $biodata['nip']; ?>
			</td>
		</tr>
	</table>
</div>