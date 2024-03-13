$holidays = invoke-webrequest https://date.nager.at/api/v3/publicholidays/2024/NL | convertfrom-json
foreach ($holiday in $holidays) {
$daterange = New-CSOnlineDateTimeRange -Start (get-date $holiday.date -Format "d/M/yyyy")
$holidayname = $holiday.localname + "-" + (get-date $holiday.date -Format "yyyy")
New-CSOnlineSchedule -Name $holidayname -FixedSchedule -DateTimeRanges @($daterange)
}