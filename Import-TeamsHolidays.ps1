[param]


$holidays = Invoke-WebRequest https://date.nager.at/api/v3/publicholidays/2024/NL | ConvertFrom-Json
foreach ($holiday in $holidays) {
    $daterange = New-CsOnlineDateTimeRange -Start (Get-Date $holiday.date -Format 'd/M/yyyy')
    $holidayname = $holiday.localname + '-' + (Get-Date $holiday.date -Format 'yyyy')
    New-CsOnlineSchedule -Name $holidayname -FixedSchedule -DateTimeRanges @($daterange)
}