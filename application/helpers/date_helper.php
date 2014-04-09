<?php
if (! function_exists('GetArrayDay')) {
	function GetArrayDay() {
		$ArrayDay = array();
		for ($i = 1; $i <= 31; $i++) {
			$Day = str_pad($i, 2, "0", STR_PAD_LEFT);
			$ArrayDay[$Day] = $Day;
		}
		return $ArrayDay;
	}
}

if (! function_exists('GetArrayMonth')) {
	function GetArrayMonth() {
		$ArrayMonth = array(
			'01' => 'January',
			'02' => 'February',
			'03' => 'Maret',
			'04' => 'April',
			'05' => 'Mei',
			'06' => 'Juni',
			'07' => 'Juli',
			'08' => 'Agustus',
			'09' => 'September',
			'10' => 'Oktober',
			'11' => 'November',
			'12' => 'Desember');
		return $ArrayMonth;
	}
}

if (! function_exists('get_array_year')) {
	function get_array_year($Param) {
		$Param['YearMin'] = (isset($Param['YearMin'])) ? $Param['YearMin'] : 1900;
		$Param['YearMax'] = (isset($Param['YearMax'])) ? $Param['YearMax'] : date("Y");
		
		$ArrayYear = array();
		for ($i = $Param['YearMin']; $i <= $Param['YearMax']; $i++) {
			$ArrayYear[] = array( 'id' => $i, 'title' => $i );
		}
		
		return $ArrayYear;
	}
}

if (! function_exists('ConvertDateToArray')) {
	function ConvertDateToArray($Date) {
		$Array = array();
		
		$ArrayDate = explode(' ', $Date);
		$Date = $ArrayDate[0];
		$Time = (count($ArrayDate) == 2) ? $ArrayDate[1] : '00:00:00';
		
		$ArrayDateTemp = explode('-', $Date);
		$ArrayTimeTemp = explode(':', $Time);
		
		$Array['Year'] = $ArrayDateTemp[0];
		$Array['Month'] = $ArrayDateTemp[1];
		$Array['Day'] = $ArrayDateTemp[2];
		$Array['Hour'] = $ArrayTimeTemp[0];
		$Array['Minute'] = $ArrayTimeTemp[1];
		$Array['Second'] = $ArrayTimeTemp[2];
		
		return $Array;
	}
}

if (! function_exists('ConvertToUnixTime')) {
	function ConvertToUnixTime($String) {
		preg_match('/(\d{4})-(\d{2})-(\d{2})( (\d+):(\d+):(\d+))*/i', $String, $Match);
		
		if (count($Match) >= 3) {
			$UnixTime = mktime (@$Match[5], @$Match[6], @$Match[7], $Match[2], $Match[3], $Match[1]);
		} else {
			$UnixTime = 0;
		}
		
		return $UnixTime;
	}
}

if (! function_exists('DateDiff')) {
	function DateDiff($StringDate1, $StringDate2) {
		if (strlen($StringDate1) < 10 || strlen($StringDate2) < 10) {
			return 'momments ago';
		}
		
		$StringDate1 = substr($StringDate1, 0, 10);
		$StringDate2 = substr($StringDate2, 0, 10);
		
		$UnixTime1 = ConvertToUnixTime($StringDate1);
		$UnixTime2 = ConvertToUnixTime($StringDate2);
		
		$TimeDiff = ($UnixTime2 - $UnixTime1) / (24 * 60 * 60);
		return $TimeDiff;
	}
}

if (! function_exists('ExchangeFormatDate')) {
	function ExchangeFormatDate($Date) {
		if (empty($Date)) {
			return '';
		}
		
		$ArrayDate = explode('-', $Date);
		$FormatDate = $ArrayDate[2] . '-' . $ArrayDate[1] . '-' . $ArrayDate[0];
		
		return $FormatDate;
	}
}

if (! function_exists('ConvertDateToString')) {
	function ConvertDateToString($String) {
		$ArrayMonth = GetArrayMonth();
		$ArrayDate = ConvertDateToArray($String);
		
		return $ArrayDate['Day']. ' ' . $ArrayMonth[$ArrayDate['Month']] . ' ' . $ArrayDate['Year'] . ' ' . $ArrayDate['Hour'] . ':' . $ArrayDate['Minute'];
	}
}

if (! function_exists('GetFormatDate')) {
	// echo GetFormatDate('2013-12-05', array( 'FormatDate' => 'l, j F Y', 'replace_indo' => true ));
	function GetFormatDate($String, $Param = array()) {
		$Param['replace_indo'] = (isset($Param['replace_indo'])) ? $Param['replace_indo'] : true;
		
		if ($String == '0000-00-00' || empty($String)) {
			return '';
        }
		
		$Param['FormatDate'] = (isset($Param['FormatDate'])) ? $Param['FormatDate'] : "d F Y";
		$result = date($Param['FormatDate'], strtotime($String));
		
		if ($Param['replace_indo']) {
			$array_source = array( 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday', 'January', 'February', 'March', 'May', 'June', 'July', 'August', 'October', 'December' );
			$array_replace = array( 'Senin', 'Selasa', 'Rabu', 'Kamis', "Jum'at", 'Sabtu', 'Minggu', 'Januari', 'Februari', 'Maret', 'Mei', 'Juni', 'Juli', 'Agustus', 'Oktober', 'Desember' );
			$result = str_replace($array_source, $array_replace, $result);
		}
		
		return $result;
	}
}

if (! function_exists('AddDate')) {
	function AddDate($date, $date_count) {
		$temp_date = date_create($date);
		date_add($temp_date, date_interval_create_from_date_string($date_count));
		$result = date_format($temp_date, 'Y-m-d');
		
		return $result;
	}
}

if (! function_exists('get_time_diff')) {
	function get_time_diff($date1, $date2) {
		// raw time diff
		$unix = ConvertToUnixTime($date1);
		$now = ConvertToUnixTime($date2);
		$diff_time = $now - $unix;
		
		// time reduce by saturday & sunday
		$weekend_day = 0;
		$date_check1 = substr($date1, 0, 10);
		$date_check2 = substr($date2, 0, 10);
		for ($i = 0; $i < 365; $i++) {
			if ($date_check1 == $date_check2) {
				break;
			}
			
			$date_check1 = AddDate($date_check1, '1 days');
			$string_day = GetFormatDate($date_check1, array( 'FormatDate' => 'l', 'replace_indo' => false ));
			if (in_array($string_day, array( 'Saturday', 'Sunday' ))) {
				$weekend_day++;
			}
		}
		$diff_time = $diff_time - ($weekend_day * 24 * 60 * 60);
		
		return $diff_time;
	}
}

if (! function_exists('show_time_diff')) {
	function show_time_diff($diff_time) {
		if ($diff_time < 60) {
			$result = $diff_time.' detik';
		} else if ($diff_time < (60 * 60)) {
			$minute = floor($diff_time / 60);
			$second = $diff_time % 60;
			$result = $minute.' menit '.$second.' detik';
		} else if ($diff_time < (60 * 60 * 24)) {
			$hour = floor($diff_time / (60 * 60));
			$minute = floor(($diff_time / 60) % 60);
			$string_minute = (empty($minute)) ? '' : $minute.' menit';
			$result = $hour.' jam '.$string_minute.'';
		} else if ($diff_time <= (60 * 60 * 24 * 30)) {
			$day = floor($diff_time / (60 * 60 * 24));
			$hour = floor(($diff_time / (60 * 60)) / 24);
			$result = $day.' hari';
		} else {
			$result = 'lebih dari 30 hari';
		}
		
		return $result;
	}
}