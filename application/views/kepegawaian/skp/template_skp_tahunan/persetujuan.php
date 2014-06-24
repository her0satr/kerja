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
table.border td{ vertical-align: top; }
</style>

<div style="padding: 20px 0 0 20px;">
<table class="border" style="width: 100%;">
	<tr><td>
		8. REKOMENDASI<br /><br />
		<?php echo @$summary['rekomendasi']; ?><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
	</td></tr>
	<tr><td>
		<table style="width: 1000px;">
			<tr>
				<td style="width: 500px;" rowspan="2">&nbsp;</td>
				<td style="width: 500px;">9. DIBUAT TANGGAL, <?php echo (empty($summary['tanggal_dibuat_text'])) ? '..........................' : $summary['tanggal_dibuat_text']; ?></td>
			</tr>
			<tr>
				<td style="text-align: center;">
					PEJABAT PENILAI<br /><br /><br /><br /><br />
					<span style="text-decoration: underline;"><?php echo $pejabat_penilai['nama']; ?></span><br />
					<?php echo $pejabat_penilai['nip']; ?>
				</td>
			</tr>
			<tr><td colspan="2">&nbsp;</td></tr>
			<tr>
				<td>10. DITERIMA TANGGAL, <?php echo (empty($summary['tanggal_diterima_pns_text'])) ? '..........................' : $summary['tanggal_diterima_pns_text']; ?></td>
				<td rowspan="2">&nbsp;</td>
			</tr>
			<tr>
				<td style="text-align: center;">
					PEGAWAI NEGERI SIPIL YANG DINILAI<br /><br /><br /><br /><br />
					<span style="text-decoration: underline;"><?php echo $biodata['nama_gelar']; ?></span><br />
					<?php echo $biodata['nip']; ?>
				</td>
			</tr>
			<tr><td colspan="2">&nbsp;</td></tr>
			<tr>
				<td rowspan="2">&nbsp;</td>
				<td>11. DITERIMA TANGGAL, <?php echo (empty($summary['tanggal_diterima_atasan_text'])) ? '..........................' : $summary['tanggal_diterima_atasan_text']; ?></td>
			</tr>
			<tr>
				<td style="text-align: center;">
					ATASAN PEJABAT PENILAI<br /><br /><br /><br /><br />
					<span style="text-decoration: underline;"><?php echo $atasan_pejabat_penilai['nama']; ?></span><br />
					<?php echo $atasan_pejabat_penilai['nip']; ?>
				</td>
			</tr>
		</table><br /><br />
	</td></tr>
</table>
</div>