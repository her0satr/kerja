<?php
	$array_pegawai = $this->absensi_kosong_model->get_array();
?>

<style>
.center { text-align: center; }
td { vertical-align: middle; }
td.border { border: 1px solid #000000; }
</style>

<div style="font-size: 16px; font-weight: bold; padding: 0 0 20px 0;">
	<div>B U K U    C U T I</div>
	<div>UNIT KERJA	: BAGIAN TATA USAHA</div>
	<div>INSTANSI : SEKRETARIAT DAERAH</div>
	<div>KEADAAN : </div>
</div>

<table style="width: 100%; border-collapse: collapse; vertical-align: middle;">
	<tr class="center">
		<td class="border" rowspan="2" style="width: 25px;">NO</td>
		<td class="border" rowspan="2" style="width: 150px;">NAMA PEGAWAI YANG MENGAMBIL CUTI</td>
		<td class="border" rowspan="2" style="width: 150px;">NIP / NIK</td>
		<td class="border" rowspan="2" style="width: 100px;">JABATAN</td>
		<td class="border" rowspan="2" style="width: 100px;">JENIS CUTI</td>
		<td class="border" colspan="2" style="width: 100px;">LAMA CUTI</td>
		<td class="border" rowspan="2" style="width: 100px;">SISA CUTI TAHUN YBS</td>
		<td class="border" colspan="3" style="width: 400px;">SK. CUTI</td>
		<td class="border" rowspan="2" style="width: 50px;">KETERANGAN</td>
	</tr>
	<tr class="center">
		<td class="border" style="width: 100px;">DARI TGL. S/D TGL.</td>
		<td class="border" style="width: 100px;">JUMLAH HARI KERJA</td>
		<td class="border" style="width: 100px;">PEJABAT</td>
		<td class="border" style="width: 100px;">NOMOR</td>
		<td class="border" style="width: 100px;">TANGGAL</td>
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
	</tr>
	<?php $counter = 0; ?>
	<?php foreach ($array_pegawai as $key => $row) { ?>
		<?php $counter++; ?>
	<tr>
		<td class="border center"><?php echo $counter; ?></td>
		<td class="border center"><?php echo $row['nama']; ?></td>
		<td class="border center"><?php echo $row['nip']; ?></td>
		<td class="border center">&nbsp;</td>
		<td class="border center"><?php echo $row['status_kosong']; ?></td>
		<td class="border center"><?php echo GetFormatDate($row['tanggal']); ?></td>
		<td class="border center">&nbsp;</td>
		<td class="border center">&nbsp;</td>
		<td class="border center">&nbsp;</td>
		<td class="border center">&nbsp;</td>
		<td class="border center">&nbsp;</td>
		<td class="border center">&nbsp;</td>
	</tr>
	<?php } ?>
</table>