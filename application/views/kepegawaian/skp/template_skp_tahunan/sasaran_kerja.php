<?php
	print_r($_GET); exit;
	$penilai = $this->skp_model->get_by_id_penilai(array( 'K_PENILAI' => $K_PENILAI ));
	$pegawai_detail = $this->lpegawai->GetPegawaiById($penilai['K_PEGAWAI']);
	$penilai_detail = $this->lpegawai->GetPegawaiById($penilai['K_PENILAI_PEGAWAI']);
	$array_kegiatan = $this->skp_model->get_array_kegiatan(array( 'K_PEGAWAI' => $penilai['K_PEGAWAI'], 'TAHUN' => $penilai['TAHUN'] ));
?>

<style>
table.border {background-color:#000;}
table.border td,th,caption{background-color:#fff}
</style>

<div style="text-align: center; font-weight: bold; font-size: 14px;">
	<div>FORMULIR SASARAN KERJA</div>
	<div>PEGAWAI NEGERI SIPIL</div>
</div>

<div style="padding: 20px 0 0 40px;">
<table class="border" style="font-size: 10px; width: 680px;">
	<tr>
		<td style="width: 30px; text-align: center;">NO</td>
		<td style="width: 310px;" colspan="2">I. PEJABAT PENILAI</td>
		<td style="width: 30px; text-align: center;">NO</td>
		<td style="width: 310px;" colspan="2">II. PEGAWAI NEGERI SIPIL YANG DINILAI</td></tr>
	<tr>
		<td style="width: 30px; text-align: center;">1</td>
		<td style="width: 120px;">Nama</td>
		<td style="width: 180px;"><?php echo $penilai_detail['NAMA_GELAR']; ?></td>
		<td style="width: 30px; text-align: center;">1</td>
		<td style="width: 120px;">Nama</td>
		<td style="width: 180px;"><?php echo $pegawai_detail['NAMA_GELAR']; ?></td></tr>
	<tr>
		<td style="text-align: center;">3</td>
		<td>Pangkat/Gol.Ruang</td>
		<td><?php echo $penilai_detail['GOLONGAN_RUANG']; ?></td>
		<td style="text-align: center;">3</td>
		<td>Pangkat/Gol.Ruang</td>
		<td><?php echo $pegawai_detail['GOLONGAN_RUANG']; ?></td></tr>
	<tr>
		<td style="text-align: center;">4</td>
		<td>Jabatan</td>
		<td><?php echo $penilai_detail['JABATAN_LAIN']; ?></td>
		<td style="text-align: center;">4</td>
		<td>Jabatan</td>
		<td><?php echo $pegawai_detail['JABATAN_LAIN']; ?></td></tr>
	<tr>
		<td style="text-align: center;">5</td>
		<td>Unit Kerja</td>
		<td><?php echo $penilai_detail['UNIT_KERJA']; ?></td>
		<td style="text-align: center;">5</td>
		<td>Unit Kerja</td>
		<td><?php echo $pegawai_detail['UNIT_KERJA']; ?></td></tr>
</table>
</div>

<div style="padding: 20px 0 0 40px;">
<table class="border" style="font-size: 10px; width: 680px;">
	<tr>
		<td style="width: 30px; text-align: center;" rowspan="2">NO</td>
		<td style="width: 300px;" rowspan="2">III. KEGIATAN TUGAS JABATAN</td>
		<td style="width: 60px; text-align: center;" rowspan="2">AK</td>
		<td style="width: 280px; text-align: center;" colspan="4">TARGET</td></tr>
	<tr>
		<td style="width: 70px; text-align: center;">KUANT /<br />OUTPUT</td>
		<td style="width: 70px; text-align: center;">KUAL /<br />OUTPUT</td>
		<td style="width: 70px; text-align: center;">WAKTU</td>
		<td style="width: 70px; text-align: center;">BIAYA</td></tr>
	<?php $counter = 1; ?>
	<?php foreach ($array_kegiatan as $row) { ?>
	<tr>
		<td style="text-align: center;"><?php echo $counter; ?></td>
		<td><?php echo $row['KEGIATAN']; ?></td>
		<td style="text-align: center;"><?php echo show_skp($row['AK_TARGET_TITLE']); ?></td>
		<td style="text-align: center;"><?php echo $row['KUAN_TARGET_TITLE']; ?></td>
		<td style="text-align: center;"><?php echo $row['KUAL_TARGET_TITLE']; ?></td>
		<td style="text-align: center;"><?php echo $row['WAKTU_TARGET']; ?></td>
		<td style="text-align: center;"><?php echo show_skp($row['BIAYA_TARGET']); ?></td></tr>
	<?php $counter++; ?>
	<?php } ?>
</table>
</div>

<div style="text-align: center; font-size: 12px; padding: 30px 0 0 0;">
	<div style="float: left; width: 50%;">
		<div>&nbsp;</div>
		<div>Pejabat Penilai,</div>
		<div style="padding: 25px 0;">&nbsp;</div>
		<div><?php echo $penilai_detail['NAMA_GELAR']; ?></div>
		<div><?php echo $penilai_detail['K_PEGAWAI']; ?></div>
	</div>
	<div style="float: left; width: 50%;">
		<div>Malang, 02  Januari <?php echo ($penilai['TAHUN'] + 1); ?></div>
		<div>Pegawai Negeri Sipil Yang Dinilai</div>
		<div style="padding: 25px 0;">&nbsp;</div>
		<div><?php echo $pegawai_detail['NAMA_GELAR']; ?></div>
		<div><?php echo $pegawai_detail['K_PEGAWAI']; ?></div>
	</div>
	<div style="clear: both;"></div>
</div>