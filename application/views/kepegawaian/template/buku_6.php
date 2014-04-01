<?php
	$array_pegawai = $this->biodata_model->get_array();
?>

<style>
.center { text-align: center; }
td { vertical-align: middle; }
td.border { border: 1px solid #000000; }
</style>

<div style="font-size: 16px; font-weight: bold; padding: 0 0 20px 0;">
	<div class="center">DAFTAR URUT KEPANGKATAN PEGAWAI NEGERI SIPIL</div>
	<div class="center">UNIT ORGANISASI	: BAGIAN TATA USAHA</div>
	<div class="center">TEMPAT : SEKRETARIAT DAERAH KABUPATEN MALANG</div><br /><br />
	<div style="float: left; width: 300px;">PEMERINTAH KABUPATEN MALANG</div>
	<div style="float: right; width: 300px;">BERLAKU UNTUK<br />TAHUN :</div><br /><br />
</div>

<table style="width: 100%; border-collapse: collapse; vertical-align: middle;">
	<tr class="center">
		<td class="border" rowspan="2" style="width: 25px;">NO. URUT</td>
		<td class="border" rowspan="2" style="width: 150px;">NAMA / NIP</td>
		<td class="border" rowspan="2" style="width: 150px;">GOL. TMT</td>
		<td class="border" rowspan="2" style="width: 100px;">JABATAN ESELON SKPD</td>
		<td class="border" colspan="2" style="width: 100px;">MASA KERJA</td>
		<td class="border" colspan="2" style="width: 200px;">PENDIDIKAN & PELATIHAN</td>
		<td class="border" rowspan="2" style="width: 100px;">PENDIDIKAN TERAKHIR<br />TH. LULUS JURUSAN</td>
		<td class="border" rowspan="2" style="width: 150px;">TEMPAT LAHIR<br />TGL. LAHIR<br />AGAMA</td>
		<td class="border" rowspan="2" style="width: 50px;">KETERANGAN</td>
	</tr>
	<tr class="center">
		<td class="border" style="width: 50px;">TH</td>
		<td class="border" style="width: 50px;">BL</td>
		<td class="border" style="width: 100px;">PENJENJANGAN STRUKTURAL</td>
		<td class="border" style="width: 100px;">TEKNIS / FUNGSIONAL</td>
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
		<td class="border center"><?php echo $row['golongan_ruang']; ?></td>
		<td class="border center"><?php echo $row['jabatan']; ?></td>
		<td class="border center"><?php echo $row['tmt_tahun']; ?></td>
		<td class="border center"><?php echo $row['tmt_bulan']; ?></td>
		<td class="border center">&nbsp;</td>
		<td class="border center">&nbsp;</td>
		<td class="border center">&nbsp;</td>
		<td class="border center"><?php echo $row['tempat_lahir'].' / '.$row['tanggal_lahir'].'<br />'.$row['agama_title']; ?></td>
		<td class="border center">&nbsp;</td>
	</tr>
	<?php } ?>
</table>