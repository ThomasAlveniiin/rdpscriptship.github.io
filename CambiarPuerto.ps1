Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -Name "PortNumber" -Value 12000 -Type DWord

Write-Host "Reiniciando el servicio de Terminal Services..."
net stop termservice
net start termservice

Write-Host "El cambio de puerto se ha completado y el servicio se ha reiniciado."
