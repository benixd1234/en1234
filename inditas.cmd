@echo off
rem FCSM Segedprogram inditasa: friss hardverlista atmasolasa, majd a HTML megnyitasa.
rem Ugyanabba a mappaba tedd, ahol a helpdesk-seged.html van (halozati mappa is lehet).
rem "inditas.cmd frissit": csak frissiti az adatot, nem nyit bongeszot (utemezett feladathoz).
pushd "%~dp0"
powershell -NoProfile -Command "$f = Get-ChildItem '\\smbclust\db\Hardverlista2025_-_Ezt_haszn*.xlsb' -ErrorAction SilentlyContinue | Select-Object -First 1; if ($f) { $s = [IO.File]::Open($f.FullName, 'Open', 'Read', 'ReadWrite'); $m = New-Object IO.MemoryStream; $s.CopyTo($m); $s.Close(); $js = 'window.HW_XLSB={name:' + (ConvertTo-Json $f.Name) + ',time:' + (ConvertTo-Json $f.LastWriteTime.ToString('yyyy.MM.dd HH:mm')) + ',data:''' + [Convert]::ToBase64String($m.ToArray()) + '''};'; [IO.File]::WriteAllText((Join-Path $PWD 'hardverlista-adat.js'), $js) } else { Write-Host 'A hardverlista most nem erheto el, a legutobbi adat marad.'; Start-Sleep 3 }"
if /i not "%~1"=="frissit" start "" "%~dp0helpdesk-seged.html"
popd
