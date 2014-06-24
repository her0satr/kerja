<?php
	// biodata
	$biodata = $this->biodata_model->get_by_id(array( 'id' => $_GET['biodata_id'] ));
	
	// pejabat penilai
	$param_pejabat_penilai['tahun'] = $_GET['tahun'];
	$param_pejabat_penilai['biodata_id'] = $_GET['biodata_id'];
	$param_pejabat_penilai['posisi'] = 'Pejabat Penilai';
	$pejabat_penilai = $this->skp_pejabat_model->get_by_id($param_pejabat_penilai);
	
	// summary
	$param_summary['tahun'] = $_GET['tahun'];
	$param_summary['biodata_id'] = $_GET['biodata_id'];
	$summary = $this->skp_summary_model->get_by_id($param_summary);
	
	// sasaran kerja
	$param_sasaran_kerja['tahun'] = $_GET['tahun'];
	$param_sasaran_kerja['biodata_id'] = $_GET['biodata_id'];
	$sasaran_kerja = $this->skp_sasaran_kerja_model->get_array($param_sasaran_kerja);
?>

<style>
div, table { font-size: 10px; }
table.border {background-color:#000;}
table.border td,th,caption{background-color:#fff}
</style>

<div style="text-align: center; font-weight: bold; font-size: 14px;">
	<div>FORMULIR SASARAN KERJA</div>
	<div>PEGAWAI NEGERI SIPIL</div>
</div><br />

<div style="padding: 20px 0 0 40px;">
<table class="border" style="width: 680px;">
	<tr>
		<td style="width: 30px; text-align: center;">NO</td>
		<td style="width: 310px;" colspan="2">I. PEJABAT PENILAI</td>
		<td style="width: 30px; text-align: center;">NO</td>
		<td style="width: 310px;" colspan="2">II. PEGAWAI NEGERI SIPIL YANG DINILAI</td></tr>
	<tr>
		<td style="width: 30px; text-align: center;">1</td>
		<td style="width: 120px;">Nama</td>
		<td style="width: 180px;"><?php echo $pejabat_penilai['nama']; ?></td>
		<td style="width: 30px; text-align: center;">1</td>
		<td style="width: 120px;">Nama</td>
		<td style="width: 180px;"><?php echo $biodata['nama_gelar']; ?></td></tr>
	<tr>
		<td style="width: 30px; text-align: center;">2</td>
		<td style="width: 120px;">NIP</td>
		<td style="width: 180px;"><?php echo $pejabat_penilai['nip']; ?></td>
		<td style="width: 30px; text-align: center;">2</td>
		<td style="width: 120px;">NIP</td>
		<td style="width: 180px;"><?php echo $biodata['nip']; ?></td></tr>
	<tr>
		<td style="text-align: center;">3</td>
		<td>Pangkat/Gol.Ruang</td>
		<td><?php echo $pejabat_penilai['golongan_ruang_text']; ?></td>
		<td style="text-align: center;">3</td>
		<td>Pangkat/Gol.Ruang</td>
		<td><?php echo $biodata['golongan_ruang_text']; ?></td></tr>
	<tr>
		<td style="text-align: center;">4</td>
		<td>Jabatan</td>
		<td><?php echo $pejabat_penilai['jabatan']; ?></td>
		<td style="text-align: center;">4</td>
		<td>Jabatan</td>
		<td><?php echo $biodata['jabatan']; ?></td></tr>
	<tr>
		<td style="text-align: center;">5</td>
		<td>Unit Kerja</td>
		<td><?php echo $pejabat_penilai['unit_kerja']; ?></td>
		<td style="text-align: center;">5</td>
		<td>Unit Kerja</td>
		<td><?php echo $biodata['skpd_title']; ?></td></tr>
</table>
</div>
<div style="clear: both;"></div><br />

<div style="padding: 20px 0 0 40px;">
<table class="border" style="width: 680px;">
	<tr>
		<td style="width: 30px; text-align: center;" rowspan="2">NO</td>
		<td style="width: 280px;" rowspan="2">III. KEGIATAN TUGAS JABATAN</td>
		<td style="width: 60px; text-align: center;" rowspan="2">AK</td>
		<td style="width: 300px; text-align: center;" colspan="4">TARGET</td></tr>
	<tr>
		<td style="width: 80px; text-align: center;">KUANT/OUTPUT</td>
		<td style="width: 70px; text-align: center;">KUAL/OUTPUT</td>
		<td style="width: 80px; text-align: center;">WAKTU</td>
		<td style="width: 70px; text-align: center;">BIAYA</td></tr>
	<?php $counter = 1; ?>
	<?php foreach ($sasaran_kerja as $row) { ?>
	<tr>
		<td style="text-align: center;"><?php echo $counter; ?></td>
		<td><?php echo $row['jenis_skp_title']; ?></td>
		<td style="text-align: center;"><?php echo $row['ak']; ?></td>
		<td>
			<table style="width: 70;">
				<tr>
					<td style="width: 30; text-align: center;"><?php echo $row['kuant_nilai']; ?></td>
					<td style="width: 40;"><?php echo $row['jenis_skp_satuan']; ?></td>
				</tr>
			</table>
		</td>
		<td style="text-align: center;"><?php echo $row['kual']; ?></td>
		<td style="text-align: center;"><?php echo $row['waktu_nilai'].' '.$row['waktu_satuan']; ?></td>
		<td style="text-align: center;"><?php echo $row['biaya']; ?></td></tr>
	<?php $counter++; ?>
	<?php } ?>
</table>
</div><br />

<div style="text-align: center; font-size: 12px; padding: 30px 0 0 0;">
	<table style="width: 100%;">
		<tr>
			<td style="width: 50%; text-align: center;">
				<div>&nbsp;</div>
				<div>Pejabat Penilai,</div>
				<div style="padding: 25px 0;">&nbsp;</div>
				<div><?php echo $pejabat_penilai['nama']; ?></div>
				<div>NIP. <?php echo $pejabat_penilai['nip']; ?></div>
			</td>
			<td style="width: 50%; text-align: center;">
				<div>Malang, <?php echo @$summary['tanggal_pembuatan_text']; ?></div>
				<div>Pegawai Negeri Sipil Yang Dinilai</div>
				<div style="padding: 25px 0;">&nbsp;</div>
				<div><?php echo $biodata['nama']; ?></div>
				<div>NIP. <?php echo $biodata['nip']; ?></div>
			</td>
		</tr>
	</table>
	
	<div style="padding: 25px 0 0 45px; text-align: left;">
		Catatan :<br />
		* AK Bagi PNS yang memangku jabatan fungsional tertentu
	</div>
</div>