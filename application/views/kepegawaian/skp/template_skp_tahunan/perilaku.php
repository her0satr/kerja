<?php
	// summary
	$param_summary['tahun'] = $_GET['tahun'];
	$param_summary['biodata_id'] = $_GET['biodata_id'];
	$summary = $this->skp_summary_model->get_by_id($param_summary);
	
	// perilaku kerja
	$param_perilaku_kerja['tahun'] = $_GET['tahun'];
	$param_perilaku_kerja['biodata_id'] = $_GET['biodata_id'];
	$perilaku_kerja = $this->skp_perilaku_kerja_model->get_array($param_perilaku_kerja);
	
	// perilaku kerja format
	$number = $total = 0;
	$perilaku_kerja_format = $perilaku_kerja;
	foreach ($perilaku_kerja as $key => $row) {
		$total += $row['nilai'];
		$number = $number + 1;
		$perilaku_kerja_format[$key]['perilaku_kerja_title'] = $number.'. '.$row['perilaku_kerja_title'];
		$perilaku_kerja_format[$key]['nilai_text'] = '('.get_string_score($row['nilai']).')';
	}
	
	// perilaku kerja add total
	$number = $number + 1;
	$perilaku_kerja_format[] = array( 'perilaku_kerja_title' => $number.'. Jumlah', 'nilai' => $total, 'nilai_text' => '&nbsp;' );
	
	// perilaku kerja add average
	$number = $number + 1;
	$average = (count($perilaku_kerja) == 0) ? 0 : number_format($total / count($perilaku_kerja), 2, ',', '.');
	$perilaku_kerja_format[] = array(
		'perilaku_kerja_title' => $number.'. Nilai rata - rata',
		'nilai' => $average,
		'nilai_text' => '('.get_string_score($average).')'
	);
	
	// get average perilaku kerja
	$param_perilaku_kerja['tahun'] = $_GET['tahun'];
	$param_perilaku_kerja['biodata_id'] = $_GET['biodata_id'];
	$perilaku_kerja_average = $this->skp_perilaku_kerja_model->get_average_nilai($param_perilaku_kerja);
	
	// get final nilai
	$param_final_nilai['tahun'] = $_GET['tahun'];
	$param_final_nilai['biodata_id'] = $_GET['biodata_id'];
	$final_nilai = $this->skp_realisasi_model->get_final_nilai($param_final_nilai);
?>

<style>
table.border {background-color:#000;}
table.border td,th,caption{background-color:#fff}
table.border td{ vertical-align: top; }
</style>

<div style="padding: 20px 0 0 20px;">
<table class="border" style="width: 100%;">
	<tr>
		<td style="width: 25px; text-align: center;" rowspan="<?php echo count($perilaku_kerja_format) + 3; ?>">4.</td>
		<td style="width: 850px; text-align: left;" colspan="4">UNSUR YANG DINILAI</td>
		<td style="width: 125px; text-align: center;">JUMLAH</td>
	</tr>
	<tr>
		<td colspan="4">
			<table style="width: 850px;">
				<tr>
					<td style="width: 500px;">a. Sasaran Kerja Pegawai (SKP)</td>
					<td style="width: 350px; text-align: center;"><?php echo $final_nilai['nilai_capaian']; ?> x 60 %</td>
				</tr>
			</table>
		</td>
		<td style="text-align: center; vertical-align: middle;"><?php echo $final_nilai['nilai_capaian_persen']; ?></td>
	</tr>
	<?php foreach ($perilaku_kerja_format as $key => $row) { ?>
	<tr>
		<?php if (empty($key)) { ?>
		<td style="width: 200px; vertical-align: middle;" rowspan="<?php echo count($perilaku_kerja_format) + 1; ?>">&nbsp;b. Perilaku Kerja</td>
		<?php } ?>
		
		<td style="width: 300px;"><?php echo $row['perilaku_kerja_title']; ?></td>
		<td style="width: 150px; text-align: center;"><?php echo $row['nilai']; ?></td>
		<td style="width: 200px; text-align: center;"><?php echo $row['nilai_text']; ?></td>
		<td>&nbsp;</td>
	</tr>
	<?php } ?>
	<tr>
		<td style="width: 300px;">9. Nilai Perilaku Kerja</td>
		<td style="width: 350px; text-align: center;" colspan="2"><?php echo $final_nilai['perilaku_kerja']; ?> x 40%</td>
		<td style="text-align: center;"><?php echo $final_nilai['perilaku_kerja_persen']; ?></td>
	</tr>
	<tr>
		<td style="text-align: center; vertical-align: bottom;" colspan="5" rowspan="2">NILAI PRESTASI KERJA</td>
		<td style="text-align: center;"><?php echo $final_nilai['final_nilai']; ?></td>
	</tr>
	<tr>
		<td style="text-align: center;">(<?php echo get_string_score($final_nilai['final_nilai']); ?>)</td>
	</tr>
	<tr style="min-height: 300;">
		<td colspan="6">
			5. KEBERATAN DARI PEGAWAI NEGERI<br />
			&nbsp;&nbsp;&nbsp;&nbsp;SIPIL YANG DINILAI (APABILA ADA)<br /><br /><br />
			<?php echo @$summary['keberatan']; ?><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
			
			<table style="width: 900; text-align: center;">
				<tr>
					<td style="text-align: center;">Tanggal, <?php echo (empty($summary['tanggal_keberatan_text'])) ? '...........................' : $summary['tanggal_keberatan_text']; ?></td>
				</tr>
			</table><br />
		</td>
	</tr>
</table>
</div>