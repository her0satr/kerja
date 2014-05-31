<?php
	// biodata
	$biodata = $this->biodata_model->get_by_id(array( 'id' => $_GET['biodata_id'] ));
	
	// summary
	$param_summary['tahun'] = $_GET['tahun'];
	$param_summary['biodata_id'] = $_GET['biodata_id'];
	$summary = $this->skp_summary_model->get_by_id($param_summary);
	
	// pejabat penilai
	$param_pejabat_penilai['tahun'] = $_GET['tahun'];
	$param_pejabat_penilai['biodata_id'] = $_GET['biodata_id'];
	$param_pejabat_penilai['posisi'] = 'Pejabat Penilai';
	$pejabat_penilai = $this->skp_pejabat_model->get_by_id($param_pejabat_penilai);
	
	// atasan pejabat penilai
	$param_atasan_pejabat_penilai['tahun'] = $_GET['tahun'];
	$param_atasan_pejabat_penilai['biodata_id'] = $_GET['biodata_id'];
	$param_atasan_pejabat_penilai['posisi'] = 'Atasan Pejabat Penilai';
	$atasan_pejabat_penilai = $this->skp_pejabat_model->get_by_id($param_atasan_pejabat_penilai);
?>

<style>
table.border {background-color:#000;}
table.border td,th,caption{background-color:#fff}
table.border td{ vertical-align: top; padding: 12px 7px; }
</style>

<div style="padding: 20px 0 0 40px; text-align: center; font-weight: bold; font-size: 14px;">
	<div><img src="<?php echo base_url('static/img/garuda.png'); ?>" /></div>
	<div>PENILAIAN PRESTASI KERJA</div>
	<div>PEGAWAI NEGERI SIPIL</div>
</div>

<div style="padding: 40px 0 10px 20px; font-size: 12px;">
	<div style="float: left; width: 40%;">
		KEMENTERIAN PEKERJAAN UMUM<br />
		DIREKTORAT JENDERAL BINA MARGA
	</div>
	<div style="float: right; width: 35%;">
		JANGKA WAKTU PENILAIAN<br />
		BULAN Januari s/d <?php echo $summary['tanggal_penilaian_text']; ?>
	</div>
	<div style="clear: both;"></div>
</div>

<div style="padding: 10px 0 0 20px;">
<table class="border" style="width: 1000px;">
	<tr>
		<td style="width: 25px; text-align: center;" rowspan="6">1</td>
		<td style="width: 975px; text-align: left;" colspan="2">YANG DINILAI</td></tr>
	<tr>
		<td style="width: 500px;">a. Nama</td>
		<td style="width: 475px;"><?php echo $biodata['nama_gelar']; ?></td></tr>
	<tr>
		<td>b. NIP</td>
		<td><?php echo $biodata['nip']; ?></td></tr>
	<tr>
		<td>c. Pangkat, Golongan ruang, TMT</td>
		<td><?php echo $biodata['golongan_ruang_text']; ?></td></tr>
	<tr>
		<td>d. Jabatan / Pekerjaan</td>
		<td><?php echo $biodata['jabatan']; ?></td></tr>
	<tr>
		<td>e. Unit Organisasi</td>
		<td><?php echo $biodata['skpd_title']; ?></td></tr>
	<tr>
		<td style="text-align: center;" rowspan="6">2</td>
		<td style="text-align: left;" colspan="2">PEJABAT PENILAI</td></tr>
	<tr>
		<td>a. Nama</td>
		<td><?php echo $pejabat_penilai['nama']; ?></td></tr>
	<tr>
		<td>b. NIP</td>
		<td><?php echo $pejabat_penilai['nip']; ?></td></tr>
	<tr>
		<td>c. Pangkat, Golongan ruang, TMT</td>
		<td><?php echo $pejabat_penilai['golongan_ruang_text']; ?></td></tr>
	<tr>
		<td>d. Jabatan / Pekerjaan</td>
		<td><?php echo $pejabat_penilai['jabatan']; ?></td></tr>
	<tr>
		<td>e. Unit Organisasi</td>
		<td><?php echo $pejabat_penilai['unit_kerja']; ?></td></tr>
	<tr>
		<td style="text-align: center;" rowspan="6">3</td>
		<td style="text-align: left;" colspan="2">ATASAN PEJABAT PENILAI</td></tr>
	<tr>
		<td>a. Nama</td>
		<td><?php echo $atasan_pejabat_penilai['nama']; ?></td></tr>
	<tr>
		<td>b. NIP</td>
		<td><?php echo $atasan_pejabat_penilai['nip']; ?></td></tr>
	<tr>
		<td>c. Pangkat, Golongan ruang, TMT</td>
		<td><?php echo $atasan_pejabat_penilai['golongan_ruang_text']; ?></td></tr>
	<tr>
		<td>d. Jabatan / Pekerjaan</td>
		<td><?php echo $atasan_pejabat_penilai['jabatan']; ?></td></tr>
	<tr>
		<td>e. Unit Organisasi</td>
		<td><?php echo $atasan_pejabat_penilai['unit_kerja']; ?></td></tr>
</table>
</div>
