<?php
	$biodata_id = (!empty($this->uri->segments[4])) ? $this->uri->segments[4] : 0;
	$biodata = $this->biodata_model->get_by_id(array( 'id' => $biodata_id ));
?>

<style>
div, table { font-size: 10px; }
table.border {background-color:#000;}
table.border td,th,caption{background-color:#fff}
</style>

<div style="text-align: center; font-weight: bold; font-size: 14px;">
	<div>BIODATA</div>
</div><br />

<div>
	<div style="font-weight: bold;">A. Identitas Pegawai</div>
	<table style="width: 70%;">
		<tr>
			<td style="width: 20%;">1. Nama</td>
			<td style="width: 2%; text-align: center;">:</td>
			<td style="width: 75%;"><?php echo $biodata['nama_gelar']; ?></td>
		</tr>
		<tr>
			<td>2. NIP</td>
			<td style="text-align: center;">:</td>
			<td><?php echo $biodata['nip']; ?></td>
		</tr>
		<tr>
			<td>3. Tempat/tanggal lahir</td>
			<td style="text-align: center;"></td>
			<td><?php echo $biodata['tempat_lahir'].'/'.ExchangeFormatDate($biodata['tanggal_lahir']); ?></td>
		</tr>
		<tr>
			<td>4. Jenis Kelamin</td>
			<td style="text-align: center;">:</td>
			<td><?php echo $biodata['kelamin']; ?></td>
		</tr>
		<tr>
			<td>5. Agama</td>
			<td style="text-align: center;">:</td>
			<td><?php echo $biodata['agama_title']; ?></td>
		</tr>
		<tr>
			<td>6. Jenis Kepegawaian</td>
			<td style="text-align: center;">:</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>7. Alamat Rumah</td>
			<td style="text-align: center;">:</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>8. Pangkat Terakhir</td>
			<td style="text-align: center;">:</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>9. Jabatan Terakhir</td>
			<td style="text-align: center;">:</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>10. Instansi Tempat Bekerja</td>
			<td style="text-align: center;">:</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>11. Unit Kerja</td>
			<td style="text-align: center;">:</td>
			<td><?php echo $biodata['unit_kerja']; ?></td>
		</tr>
	</table>
</div><br />

<div>
	<div style="font-weight: bold;">B. Riwayat Kepangkatan</div>
	<table class="border" style="width: 100%;">
		<tr style="text-align: center;">
			<td style="width: 5%;" rowspan="2">No</td>
			<td style="width: 35%;" rowspan="2">Pangkat Gol./Ruang</td>
			<td style="width: 15%;" rowspan="2">TMT</td>
			<td style="width: 25%;" colspan="2">Surat Keputusan</td>
			<td style="width: 25%;" rowspan="2">Pejabat yang Menetapkan</td>
		</tr>
		<tr style="text-align: center;">
			<td style="width: 12%;">Nomor</td>
			<td style="width: 12%;">Tanggal</td>
		</tr>
		<tr style="text-align: center; font-weight: bold;">
			<td>1</td>
			<td>2</td>
			<td>3</td>
			<td>4</td>
			<td>5</td>
			<td>6</td>
		</tr>
		<tr>
			<td style="text-align: center;">1.</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td style="text-align: center;">2.</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td style="text-align: center;">3.</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td style="text-align: center;">4.</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</table>
</div><br />

<div>
	<div style="font-weight: bold;">C. Riwayat Jabatan</div>
	<table class="border" style="width: 100%;">
		<tr style="text-align: center;">
			<td style="width: 5%;" rowspan="2">No</td>
			<td style="width: 25%;" rowspan="2">Jabatan</td>
			<td style="width: 13%;" rowspan="2">Eselon</td>
			<td style="width: 12%;" rowspan="2">TMT Jabatan</td>
			<td style="width: 25%;" colspan="2">Surat Keputusan</td>
			<td style="width: 25%;" rowspan="2">Pejabat yang Menetapkan</td>
		</tr>
		<tr style="text-align: center;">
			<td style="width: 12%;">Nomor</td>
			<td style="width: 12%;">Tanggal</td>
		</tr>
		<tr style="text-align: center; font-weight: bold;">
			<td>1</td>
			<td>2</td>
			<td>3</td>
			<td>4</td>
			<td>5</td>
			<td>6</td>
			<td>7</td>
		</tr>
		<tr>
			<td style="text-align: center;">1.</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td style="text-align: center;">2.</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td style="text-align: center;">3.</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td style="text-align: center;">4.</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</table>
</div><br />

<div>
	<div style="font-weight: bold;">D. Riwayat Pendidikan</div>
	<div style="margin: 0 0 0 10px; font-weight: bold;">1. Pendidikan Umum</div>
	<table class="border" style="width: 100%;">
		<tr style="text-align: center;">
			<td style="width: 5%;" rowspan="2">No</td>
			<td style="width: 20%;" rowspan="2">No.	Jenjang dan Jurusan Pendidikan</td>
			<td style="width: 25%;" rowspan="2">Nama Sekolah/ Akademi/ Perguruan Tinggi</td>
			<td style="width: 25%;" rowspan="2">Nama Kepala Sekolah/ Direktur/ Dekan/ Ketua/ Rektor</td>
			<td style="width: 25%;" colspan="2">STTB</td>
		</tr>
		<tr style="text-align: center;">
			<td style="width: 12%;">Nomor</td>
			<td style="width: 12%;">Tanggal</td>
		</tr>
		<tr style="text-align: center; font-weight: bold;">
			<td>1</td>
			<td>2</td>
			<td>3</td>
			<td>4</td>
			<td>5</td>
			<td>6</td>
		</tr>
		<tr>
			<td style="text-align: center;">1.</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td style="text-align: center;">2.</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td style="text-align: center;">3.</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td style="text-align: center;">4.</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</table><br />
	
	<div style="margin: 0 0 0 10px; font-weight: bold;">2. Pendidikan dan Pelatihan Kepemimpinan</div>
	<table class="border" style="width: 100%;">
		<tr style="text-align: center;">
			<td style="width: 5%;" rowspan="2">No</td>
			<td style="width: 20%;" rowspan="2">Nama Diklat</td>
			<td style="width: 20%;" rowspan="2">Tempat dan Penyelenggaraan Diklat</td>
			<td style="width: 15%;" rowspan="2">Angkatan/ Tahun</td>
			<td style="width: 15%;" rowspan="2">Lama Pendidikan</td>
			<td style="width: 25%;" colspan="2">STTB</td>
		</tr>
		<tr style="text-align: center;">
			<td style="width: 12%;">Nomor</td>
			<td style="width: 12%;">Tanggal</td>
		</tr>
		<tr style="text-align: center; font-weight: bold;">
			<td>1</td>
			<td>2</td>
			<td>3</td>
			<td>4</td>
			<td>5</td>
			<td>6</td>
			<td>7</td>
		</tr>
		<tr>
			<td style="text-align: center;">1.</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td style="text-align: center;">2.</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td style="text-align: center;">3.</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td style="text-align: center;">4.</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</table><br />
	
	<div style="margin: 0 0 0 10px; font-weight: bold;">3. Pendidikan dan Pelatihan Fungsional</div>
	<table class="border" style="width: 100%;">
		<tr style="text-align: center;">
			<td style="width: 5%;" rowspan="2">No</td>
			<td style="width: 20%;" rowspan="2">Nama Diklat</td>
			<td style="width: 20%;" rowspan="2">Tempat dan Penyelenggaraan Diklat</td>
			<td style="width: 15%;" rowspan="2">Angkatan/ Tahun</td>
			<td style="width: 15%;" rowspan="2">Lama Pendidikan</td>
			<td style="width: 25%;" colspan="2">STTB</td>
		</tr>
		<tr style="text-align: center;">
			<td style="width: 12%;">Nomor</td>
			<td style="width: 12%;">Tanggal</td>
		</tr>
		<tr style="text-align: center; font-weight: bold;">
			<td>1</td>
			<td>2</td>
			<td>3</td>
			<td>4</td>
			<td>5</td>
			<td>6</td>
			<td>7</td>
		</tr>
		<tr>
			<td style="text-align: center;">1.</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td style="text-align: center;">2.</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td style="text-align: center;">3.</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td style="text-align: center;">4.</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</table><br />
	
	<div style="margin: 0 0 0 10px; font-weight: bold;">4. Pendidikan dan Pelatihan Tehnis</div>
	<table class="border" style="width: 100%;">
		<tr style="text-align: center;">
			<td style="width: 5%;" rowspan="2">No</td>
			<td style="width: 20%;" rowspan="2">Nama Diklat</td>
			<td style="width: 20%;" rowspan="2">Tempat dan Penyelenggaraan Diklat</td>
			<td style="width: 15%;" rowspan="2">Angkatan/ Tahun</td>
			<td style="width: 15%;" rowspan="2">Lama Pendidikan</td>
			<td style="width: 25%;" colspan="2">STTB</td>
		</tr>
		<tr style="text-align: center;">
			<td style="width: 12%;">Nomor</td>
			<td style="width: 12%;">Tanggal</td>
		</tr>
		<tr style="text-align: center; font-weight: bold;">
			<td>1</td>
			<td>2</td>
			<td>3</td>
			<td>4</td>
			<td>5</td>
			<td>6</td>
			<td>7</td>
		</tr>
		<tr>
			<td style="text-align: center;">1.</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td style="text-align: center;">2.</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td style="text-align: center;">3.</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td style="text-align: center;">4.</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</table>
</div><br />

<div>
	<div style="font-weight: bold;">E. Daftar Urut Kepangkatan</div>
	<table class="border" style="width: 100%;">
		<tr style="text-align: center;">
			<td style="width: 5%;">No</td>
			<td style="width: 45%;">Tahun</td>
			<td style="width: 50%;">Urutan/Peringkat dalam DUK</td>
		</tr>
		<tr style="text-align: center; font-weight: bold;">
			<td>1</td>
			<td>2</td>
			<td>3</td>
		</tr>
		<tr>
			<td style="text-align: center;">1.</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td style="text-align: center;">2.</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td style="text-align: center;">3.</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td style="text-align: center;">4.</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</table>
</div><br />

<div>
	<div style="font-weight: bold;">F. Daftar Urut Kepangkatan</div>
	<table class="border" style="width: 100%;">
		<tr style="text-align: center;">
			<td style="width: 5%;">No</td>
			<td style="width: 15%;">Tahun</td>
			<td style="width: 30%;">Pejabat Penilai</td>
			<td style="width: 30%;">Atasan Pejabat Penilai</td>
			<td style="width: 20%;">Nilai</td>
		</tr>
		<tr style="text-align: center; font-weight: bold;">
			<td>1</td>
			<td>2</td>
			<td>3</td>
			<td>4</td>
			<td>5</td>
		</tr>
		<tr>
			<td style="text-align: center;">1.</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td style="text-align: center;">2.</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td style="text-align: center;">3.</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td style="text-align: center;">4.</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</table>
</div><br />

<div>
	<div style="font-weight: bold;">G. Disiplin</div>
	<table class="border" style="width: 100%;">
		<tr style="text-align: center;">
			<td style="width: 5%;">No</td>
			<td style="width: 25%;">Tahun</td>
			<td style="width: 35%;">Tingkat Hukuman Disiplin</td>
			<td style="width: 35%;">Jenis Hukuman Disiplin</td>
		</tr>
		<tr style="text-align: center; font-weight: bold;">
			<td>1</td>
			<td>2</td>
			<td>3</td>
			<td>4</td>
		</tr>
		<tr>
			<td style="text-align: center;">1.</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td style="text-align: center;">2.</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td style="text-align: center;">3.</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td style="text-align: center;">4.</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</table>
</div><br />

<div>
	<div style="font-weight: bold;">H. Ruang Lingkup Perjalanan Karier</div>
	<table class="border" style="width: 100%;">
		<tr style="text-align: center;">
			<td style="width: 5%;" rowspan="2">No</td>
			<td style="width: 25%;" rowspan="2">Jabatan</td>
			<td style="width: 13%;" rowspan="2">Eselon</td>
			<td style="width: 12%;" rowspan="2">TMT Jabatan</td>
			<td style="width: 25%;" colspan="2">Surat Keputusan</td>
			<td style="width: 25%;" rowspan="2">Pejabat yang Menetapkan</td>
		</tr>
		<tr style="text-align: center;">
			<td style="width: 12%;">Nomor</td>
			<td style="width: 12%;">Tanggal</td>
		</tr>
		<tr style="text-align: center; font-weight: bold;">
			<td>1</td>
			<td>2</td>
			<td>3</td>
			<td>4</td>
			<td>5</td>
			<td>6</td>
			<td>7</td>
		</tr>
		<tr>
			<td style="text-align: center;">1.</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td style="text-align: center;">2.</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td style="text-align: center;">3.</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td style="text-align: center;">4.</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</table>
</div><br />

<div>
	<div style="font-weight: bold;">I. Pengalaman Diklat Dalam Negeri/Luar Negeri mengenai wawasan Manajemen Pemerintah Umum dan Daerah</div>
	<table class="border" style="width: 100%;">
		<tr style="text-align: center;">
			<td style="width: 5%;" rowspan="2">No</td>
			<td style="width: 20%;" rowspan="2">Nama Diklat</td>
			<td style="width: 20%;" rowspan="2">Tempat dan Penyelenggaraan Diklat</td>
			<td style="width: 15%;" rowspan="2">Angkatan/ Tahun</td>
			<td style="width: 15%;" rowspan="2">Lama Pendidikan</td>
			<td style="width: 25%;" colspan="2">STTB</td>
		</tr>
		<tr style="text-align: center;">
			<td style="width: 12%;">Nomor</td>
			<td style="width: 12%;">Tanggal</td>
		</tr>
		<tr style="text-align: center; font-weight: bold;">
			<td>1</td>
			<td>2</td>
			<td>3</td>
			<td>4</td>
			<td>5</td>
			<td>6</td>
			<td>7</td>
		</tr>
		<tr>
			<td style="text-align: center;">1.</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td style="text-align: center;">2.</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td style="text-align: center;">3.</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td style="text-align: center;">4.</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</table>
</div><br />

<div>
	<div style="font-weight: bold;">J. Pengalaman Sebagai Penyaji Seminar/ Lokakarya/ Diskusi Tingkat Nasional mengenai wawasan Manajemen Pemerintahan Umum dan Daerah</div>
	<table class="border" style="width: 100%;">
		<tr style="text-align: center;">
			<td style="width: 5%;">No</td>
			<td style="width: 20%;">Tempat Seminar</td>
			<td style="width: 20%;">Judul Makalah</td>
			<td style="width: 15%;">Tahun</td>
			<td style="width: 15%;">Peran dalam Seminar/ Lokakarya/Diskusi</td>
		</tr>
		<tr style="text-align: center; font-weight: bold;">
			<td>1</td>
			<td>2</td>
			<td>3</td>
			<td>4</td>
			<td>5</td>
		</tr>
		<tr>
			<td style="text-align: center;">1.</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td style="text-align: center;">2.</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td style="text-align: center;">3.</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td style="text-align: center;">4.</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</table>
</div><br />

<div>
	<div style="font-weight: bold;">K. Pokok-pokok pikiran Strategis Politik Dalam Negeri</div>
	<table class="border" style="width: 100%;">
		<tr style="text-align: center;">
			<td style="width: 5%;">No</td>
			<td style="width: 45%;">Judul</td>
			<td style="width: 50%;">Tahun</td>
		</tr>
		<tr style="text-align: center; font-weight: bold;">
			<td>1</td>
			<td>2</td>
			<td>3</td>
		</tr>
		<tr>
			<td style="text-align: center;">1.</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td style="text-align: center;">2.</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td style="text-align: center;">3.</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td style="text-align: center;">4.</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</table>
</div><br />

<div>
	<table style="width: 100%;">
		<tr style="text-align: center;">
			<td style="width: 50%;">&nbsp;</td>
			<td style="width: 50%;">
				Malang, Desember 2009<br /><br /><br />
				<?php echo $biodata['nama_gelar']; ?><br />
				<?php echo 'NIP. '.$biodata['nip']; ?><br />
			</td>
		</tr>
	</table>
</div>