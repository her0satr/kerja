<?php
	$array_pegawai = $this->biodata_model->get_array();
?>

<style>
.center { text-align: center; }
td { vertical-align: middle; }
td.border { border: 1px solid #000000; }
</style>

<div style="font-size: 16px; font-weight: bold; padding: 0 0 20px 0;">
	<div>BUKU PENJAGAAN KENAIKAN GAJI BERKALA DAN REALISASINYA</div>
	<div>UNIT KERJA	: BAGIAN TATA USAHA</div>
	<div>INSTANSI : SEKRETARIAT DAERAH</div>
	<div>KEADAAN : </div>
</div>

<table style="width: 100%; border-collapse: collapse; vertical-align: middle;">
	<tr class="center">
		<td class="border" rowspan="2" style="width: 25px;">NO</td>
		<td class="border" rowspan="2" style="width: 150px;">NAMA. NIP</td>
		<td class="border" rowspan="2" style="width: 50px;">GOL / RUANG</td>
		<td class="border" rowspan="2" style="width: 50px;">TMT</td>
		<td class="border" rowspan="2" style="width: 50px;">GAJI POKOK</td>
		<td class="border" colspan="2" style="width: 80px;">MASA KERJA</td>
		<td class="border" rowspan="2" style="width: 50px;">JABATAN</td>
		<td class="border" rowspan="2" style="width: 50px;">UNIT KERJA</td>
		<td class="border" colspan="3" style="width: 50px;">DIUSULKAN</td>
		<td class="border" colspan="3" style="width: 150px;">REALISASI PENERBIT SK</td>
		<td class="border" rowspan="2" style="width: 50px;">KET.</td>
	</tr>
	<tr class="center">
		<td class="border" style="width: 40px;">THN</td>
		<td class="border" style="width: 40px;">BLN</td>
		<td class="border" style="width: 50px;">TGL & NOMOR</td>
		<td class="border" style="width: 50px;">TMT</td>
		<td class="border" style="width: 50px;">GAJI POKOK</td>
		<td class="border" style="width: 50px;">TGL & NOMOR</td>
		<td class="border" style="width: 50px;">TMT</td>
		<td class="border" style="width: 50px;">GAJI POKOK</td>
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
		<td class="border">12</td>
		<td class="border">13</td>
		<td class="border">14</td>
		<td class="border">15</td>
		<td class="border">16</td>
	</tr>
	<?php $counter = 0; ?>
	<?php foreach ($array_pegawai as $key => $row) { ?>
		<?php $counter++; ?>
	<tr>
		<td class="border center"><?php echo $counter; ?></td>
		<td class="border center"><?php echo $row['nama'].' / '.$row['nip']; ?></td>
		<td class="border center"><?php echo $row['golongan_ruang']; ?></td>
		<td class="border center"><?php echo $row['tmt_masa_kerja']; ?></td>
		<td class="border center"><?php echo $row['gaji']; ?></td>
		<td class="border center"><?php echo $row['tmt_tahun']; ?></td>
		<td class="border center"><?php echo $row['tmt_bulan']; ?></td>
		<td class="border center"><?php echo $row['jabatan']; ?></td>
		<td class="border center">&nbsp;</td>
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