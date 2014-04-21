<?php
	// biodata
	$biodata = $this->biodata_model->get_by_id(array( 'id' => $_GET['biodata_id'] ));
	
	// array skp
	$param_array['jenis_skp_id'] = 1;
	$param_array['biodata_id'] = $_GET['biodata_id'];
	$param_array['date_start'] = $_GET['date_start'];
	$param_array['date_end'] = $_GET['date_end'];
	$param_array['limit'] = 100;
	$array_skp = $this->kegiatan_skp_model->get_summary_skp($param_array);
	
	// array kegiatan
	$param_array['jenis_kegiatan_id'] = 1;
	$param_array['biodata_id'] = $_GET['biodata_id'];
	$param_array['date_start'] = $_GET['date_start'];
	$param_array['date_end'] = $_GET['date_end'];
	$array_kegiatan = $this->kegiatan_skp_model->get_summary_kegiatan($param_array);
?>

<style>
td { vertical-align: top; }
td.border { padding: 3px; border: 1px solid #000000; }
</style>

<h2 style="text-align: center;">KEGIATAN KERJA HARIAN PNS</h2>

<div style="margin: 0 0 10px 0; padding: 0 0 10px 0;">
	<table style="width: 95%; border-collapse: collapse;">
		<tr>
			<td style="width: 15%;">Nama</td>
			<td style="width: 75%;">: <?php echo $biodata['nama']; ?></td>
		</tr>
		<tr>
			<td>SKPD</td>
			<td>: <?php echo $biodata['skpd_title']; ?></td>
		</tr>
	</table>
</div>

<table style="width: 100%; border-collapse: collapse;">
	<tr style="text-align: center;">
		<td class="border" style="width: 10%;">No</td>
		<td class="border" style="width: 50%;">Uraian Kegiatan</td>
		<td class="border" style="width: 20%;">Jumlah<br />(Volume Pekerjaan)</td>
		<td class="border" style="width: 20%;">Poin</td>
	</tr>
	<tr>
		<td class="border">&nbsp;</td>
		<td class="border">TUPOKSI</td>
		<td class="border">&nbsp;</td>
		<td class="border">&nbsp;</td>
	</tr>
	<?php $counter = 1; ?>
	<?php foreach ($array_skp as $row) { ?>
	<tr>
		<td class="border" style="text-align: center;"><?php echo $counter; ?></td>
		<td class="border"><?php echo $row['title']; ?></td>
		<td class="border" style="text-align: center;"><?php echo $row['total_jumlah']; ?></td>
		<td class="border" style="text-align: center;"><?php echo $row['total_point']; ?></td>
	</tr>
	<?php $counter++; ?>
	<?php } ?>
	<tr>
		<td class="border">&nbsp;</td>
		<td class="border">KEGIATAN LAIN</td>
		<td class="border">&nbsp;</td>
		<td class="border">&nbsp;</td>
	</tr>
	<?php $counter = 1; ?>
	<?php foreach ($array_kegiatan as $row) { ?>
	<tr>
		<td class="border" style="text-align: center;"><?php echo $counter; ?></td>
		<td class="border"><?php echo $row['title']; ?></td>
		<td class="border" style="text-align: center;"><?php echo $row['total_jumlah']; ?></td>
		<td class="border" style="text-align: center;"><?php echo $row['total_point']; ?></td>
	</tr>
	<?php $counter++; ?>
	<?php } ?>
</table>