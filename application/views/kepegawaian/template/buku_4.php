<?php
	$array_pegawai = $this->biodata_model->get_array();
?>

<style>
.center { text-align: center; }
td { vertical-align: middle; }
td.border { border: 1px solid #000000; }
</style>

<div style="font-size: 16px; font-weight: bold; padding: 0 0 20px 0;">
	<div>BUKU PENINGKATAN PENDIDIKAN DAN LATIHAN</div>
	<div>UNIT KERJA	: BAGIAN TATA USAHA</div>
	<div>INSTANSI : SEKRETARIAT DAERAH</div>
	<div>KEADAAN : </div>
</div>

<table style="width: 100%; border-collapse: collapse; vertical-align: middle;">
	<tr class="center">
		<td class="border" rowspan="2" style="width: 25px;">NO</td>
		<td class="border" rowspan="2" style="width: 150px;">NAMA NIP / NIK</td>
		<td class="border" rowspan="2" style="width: 150px;">TEMPAT / TGL. LAHIR</td>
		<td class="border" rowspan="2" style="width: 100px;">PANGKAT / GOL. RUANG</td>
		<td class="border" rowspan="2" style="width: 100px;">PENDIDIKAN TERTINGGI</td>
		<td class="border" rowspan="2" style="width: 100px;">JABATAN / ESELON</td>
		<td class="border" colspan="4" style="width: 400px;">JENIS PENDIDIKAN LATIHAN / KURSUS</td>
		<td class="border" rowspan="2" style="width: 50px;">KETERANGAN</td>
	</tr>
	<tr class="center">
		<td class="border" style="width: 100px;">NAMA DIKLAT / KURSUS</td>
		<td class="border" style="width: 100px;">WAKTU</td>
		<td class="border" style="width: 100px;">LAMANYA (JAM)</td>
		<td class="border" style="width: 100px;">PENYELENGGARA</td>
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
		<td class="border">11</td>
	</tr>
	<?php $counter = 0; ?>
	<?php foreach ($array_pegawai as $key => $row) { ?>
		<?php $counter++; ?>
	<tr>
		<td class="border center"><?php echo $counter; ?></td>
		<td class="border center"><?php echo $row['nama'].' / '.$row['nip']; ?></td>
		<td class="border center"><?php echo $row['tempat_lahir'].' / '.$row['tanggal_lahir']; ?></td>
		<td class="border center"><?php echo $row['golongan_ruang']; ?></td>
		<td class="border center">&nbsp;</td>
		<td class="border center">&nbsp;</td>
		<td class="border center">&nbsp;</td>
		<td class="border center">&nbsp;</td>
		<td class="border center">&nbsp;</td>
		<td class="border center">&nbsp;</td>
		<td class="border center">&nbsp;</td>
	</tr>
	<?php } ?>
</table>