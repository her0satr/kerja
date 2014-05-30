<?php
	$penilai = $this->skp_model->get_by_id_penilai(array( 'K_PENILAI' => $K_PENILAI ));
	$pegawai_detail = $this->lpegawai->GetPegawaiById($penilai['K_PEGAWAI']);
	$penilai_detail = $this->lpegawai->GetPegawaiById($penilai['K_PENILAI_PEGAWAI']);
	$array_kegiatan = $this->skp_model->get_array_kegiatan(array( 'K_PEGAWAI' => $penilai['K_PEGAWAI'], 'TAHUN' => $penilai['TAHUN'] ));
	$rate_kegiatan = $this->skp_model->get_rate_kegiatan(array( 'K_PEGAWAI' => $penilai['K_PEGAWAI'], 'TAHUN' => $penilai['TAHUN'] ));
	
	$array_kreativitas = $this->skp_model->get_array_kreativitas_pegawai(array( 'K_PEGAWAI' => $penilai['K_PEGAWAI'], 'TAHUN' => $penilai['TAHUN'] ));
	$array_tugas_tambahan = $this->skp_model->get_array_tugas_tambahan_pegawai(array( 'K_PEGAWAI' => $penilai['K_PEGAWAI'], 'TAHUN' => $penilai['TAHUN'] ));
?>

<style>
table.border {background-color:#000;}
table.border td,th,caption{background-color:#fff}
</style>

<div style="text-align: center; font-weight: bold; font-size: 14px;">
	<div>PENILAIAN CAPAIAN SASARAN KERJA</div>
	<div>PEGAWAI NEGERI SIPIL</div>
</div>

<div style="padding: 20px 0 0 20px;">
<div style="padding: 10px 0; font-size: 12px;">
	<?php echo 'Jangka Waktu Penilaian 02 Januari s.d. '.date("t", mktime(0, 0, 0, 12, 01, $penilai['TAHUN'])).' Desember '.$penilai['TAHUN']; ?>
</div>
<table class="border" style="font-size: 10px; width: 1000px;">
	<tr>
		<td style="width: 25px; text-align: center;" rowspan="2">NO</td>
		<td style="width: 225px; text-align: center;" rowspan="2">I. Kegiatan Tugas  Jabatan</td>
		<td style="width: 50px; text-align: center;" rowspan="2">AK</td>
		<td style="width: 250px; text-align: center;" colspan="4">TARGET</td>
		<td style="width: 50px; text-align: center;" rowspan="2">AK</td>
		<td style="width: 250px; text-align: center;" colspan="4">REALISASI</td>
		<td style="width: 75px; text-align: center;" rowspan="2">PERHITUNGAN</td>
		<td style="width: 75px; text-align: center;" rowspan="2">NILAI CAPAIAN</td>
	</tr>
	<tr>
		<td style="text-align: center;">Kuant / Output</td>
		<td style="text-align: center;">Kual / Mutu</td>
		<td style="text-align: center;">Waktu</td>
		<td style="text-align: center;">Biaya</td>
		<td style="text-align: center;">Kuant / Output</td>
		<td style="text-align: center;">Kual / Mutu</td>
		<td style="text-align: center;">Waktu</td>
		<td style="text-align: center;">Biaya</td>
	</tr>
	<?php $counter = 1; ?>
	<?php foreach ($array_kegiatan as $row) { ?>
	<tr>
		<td style="text-align: center;"><?php echo $counter; ?></td>
		<td><?php echo $row['KEGIATAN']; ?></td>
		<td style="text-align: center;"><?php echo show_skp($row['AK_TARGET_TITLE']); ?></td>
		<td style="text-align: center;"><?php echo $row['KUAN_TARGET_TITLE']; ?></td>
		<td style="text-align: center;"><?php echo $row['KUAL_TARGET_TITLE']; ?></td>
		<td style="text-align: center;"><?php echo $row['WAKTU_TARGET']; ?></td>
		<td style="text-align: center;"><?php echo show_skp($row['BIAYA_TARGET']); ?></td>
		<td style="text-align: center;"><?php echo show_skp($row['AK_REAL_TITLE']); ?></td>
		<td style="text-align: center;"><?php echo $row['KUAN_REAL_TITLE']; ?></td>
		<td style="text-align: center;"><?php echo $row['KUAL_REAL_TITLE']; ?></td>
		<td style="text-align: center;"><?php echo $row['WAKTU_REAL']; ?></td>
		<td style="text-align: center;"><?php echo show_skp($row['BIAYA_REAL']); ?></td>
		<td style="text-align: center;"><?php echo $row['PERHITUNGAN']; ?></td>
		<td style="text-align: center;"><?php echo $row['NILAI_CAPAIAN']; ?></td></tr>
	<?php $counter++; ?>
	<?php } ?>
	<tr>
		<td>&nbsp;</td>
		<td>II. TUGAS TAMBAHAN DAN KREATIVITAS :</td>
		<td>-</td>
		<td>-</td>
		<td>-</td>
		<td>-</td>
		<td>-</td>
		<td>-</td>
		<td>-</td>
		<td>-</td>
		<td>-</td>
		<td>-</td>
		<td>-</td>
		<td>-</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			a. Tugas Tambahan<br />
			<?php foreach ($array_tugas_tambahan as $row) { ?>
				- <?php echo $row['KEGIATAN']; ?><br />
			<?php } ?>
		</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td style="text-align: center;">
			&nbsp;<br />
			<?php foreach ($array_tugas_tambahan as $row) { ?>
				<?php echo $row['NILAI']; ?><br />
			<?php } ?>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			b. Kreatifitas<br />
			<?php foreach ($array_kreativitas as $row) { ?>
				- <?php echo $row['KEGIATAN']; ?><br />
			<?php } ?></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td style="text-align: center;">
			&nbsp;<br />
			<?php foreach ($array_kreativitas as $row) { ?>
				<?php echo $row['NILAI']; ?><br />
			<?php } ?>
		</td>
	</tr>
	<tr>
		<td colspan="13" rowspan="2" style="font-size: 14px; text-align: center;">Nilai Capaian SKP</td>
		<td style="text-align: center;"><?php echo $rate_kegiatan['score']; ?></td>
	</tr>
	<tr>
		<td style="text-align: center;"><?php echo $rate_kegiatan['label']; ?></td>
	</tr>
</table>
</div>

<div style="text-align: center; font-size: 12px; padding: 30px 0 0 0;">
	<div style="float: left; width: 70%;">
		<div>&nbsp;</div>
	</div>
	<div style="float: left; width: 25%;">
		<div>Malang, 02  Januari <?php echo ($penilai['TAHUN'] + 1); ?></div>
		<div>Pegawai Negeri Sipil Yang Dinilai</div>
		<div style="padding: 25px 0;">&nbsp;</div>
		<div><?php echo $pegawai_detail['NAMA_GELAR']; ?></div>
		<div><?php echo $pegawai_detail['K_PEGAWAI']; ?></div>
	</div>
	<div style="clear: both;"></div>
</div>