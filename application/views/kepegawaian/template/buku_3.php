<?php
	$array_pegawai = $this->biodata_model->get_array();
?>

<style>
.center { text-align: center; }
td { vertical-align: middle; }
td.border { border: 1px solid #000000; }
</style>

<div style="font-size: 16px; font-weight: bold; padding: 0 0 20px 0;">
	<div>BUKU PENJAGAAN PENSIUN  DAN REALISASINYA</div>
	<div>UNIT KERJA	: BAGIAN TATA USAHA</div>
	<div>INSTANSI : SEKRETARIAT DAERAH</div>
	<div>KEADAAN : </div>
</div>

<table style="width: 100%; border-collapse: collapse; vertical-align: middle;">
	<tr class="center">
		<td class="border" rowspan="2" style="width: 25px;">NO</td>
		<td class="border" rowspan="2" style="width: 150px;">NAMA</td>
		<td class="border" rowspan="2" style="width: 150px;">NIP</td>
		<td class="border" rowspan="2" style="width: 100px;">PANGKAT / GOL. RUANG</td>
		<td class="border" rowspan="2" style="width: 100px;">TGL LAHIR PADA SK PENGANGKATAN PERTAMA</td>
		<td class="border" rowspan="2" style="width: 100px;">58 TAHUN YANG AKAN DATANG PADA (TMT)</td>
		<td class="border" rowspan="2" style="width: 100px;">60 TAHUN YANG AKAN DATANG PADA (TMT)</td>
		<td class="border" colspan="2" style="width: 200px;">REALISASI</td>
		<td class="border" rowspan="2" style="width: 100px;">KET.</td>
	</tr>
	<tr class="center">
		<td class="border" style="width: 100px;">TGL</td>
		<td class="border" style="width: 100px;">NO. SK</td>
	</tr>
	<tr class="center">
		<td class="border">1</td>
		<td class="border">2</td>
		<td class="border">3</td>
		<td class="border">4</td>
		<td class="border">5</td>
		<td class="border">6</td>
		<td class="border">7</td>
		<td class="border">8</td>
		<td class="border">9</td>
		<td class="border">10</td>
	</tr>
	<?php $counter = 0; ?>
	<?php foreach ($array_pegawai as $key => $row) { ?>
		<?php $counter++; ?>
	<tr>
		<td class="border center"><?php echo $counter; ?></td>
		<td class="border center"><?php echo $row['nama']; ?></td>
		<td class="border center"><?php echo $row['nip']; ?></td>
		<td class="border center"><?php echo $row['golongan_ruang']; ?></td>
		<td class="border center">&nbsp;</td>
		<td class="border center">&nbsp;</td>
		<td class="border center">&nbsp;</td>
		<td class="border center">&nbsp;</td>
		<td class="border center">&nbsp;</td>
		<td class="border center">&nbsp;</td>
	</tr>
	<?php } ?>
</table>