<?php
	// summary
	$param_summary['tahun'] = $_GET['tahun'];
	$param_summary['biodata_id'] = $_GET['biodata_id'];
	$summary = $this->skp_summary_model->get_by_id($param_summary);
?>

<style>
table.border {background-color:#000;}
table.border td,th,caption{background-color:#fff}
table.border td{ vertical-align: top; }
</style>

<div style="padding: 20px 0 0 20px;">
<table class="border" style="width: 100%;">
	<tr>
		<td>
			6. TANGGAPAN PEJABAT PENILAI<br />
			&nbsp;&nbsp;&nbsp;&nbsp;ATAS KEBERATAN<br /><br /><br />
			<?php echo @$summary['tanggapan']; ?><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
			
			<table style="width: 900; text-align: center;">
				<tr>
					<td style="text-align: center;">Tanggal, <?php echo (empty($summary['tanggal_tanggapan_text'])) ? '...........................' : $summary['tanggal_tanggapan_text']; ?></td>
				</tr>
			</table><br />
		</td>
	</tr>
	<tr>
		<td>
			7. KEPUTUSAN ATASAN PEJABAT<br />
			&nbsp;&nbsp;&nbsp;&nbsp;PENILAI ATAS KEBERATAN<br /><br /><br />
			<?php echo @$summary['keputusan']; ?><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
			
			<table style="width: 900; text-align: center;">
				<tr>
					<td style="text-align: center;">Tanggal, <?php echo (empty($summary['tanggal_keputusan_text'])) ? '...........................' : $summary['tanggal_keputusan_text']; ?></td>
				</tr>
			</table><br />
		</td>
	</tr>
</table>
</div>