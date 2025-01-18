Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -Name "PortNumber" -Value 12000 -Type DWord

Write-Host "Reiniciando el servicio de Terminal Services..."
net stop termservice
net start termservice

New-NetFirewallRule -DisplayName "Permitir puerto 12000 TCP" -Direction Inbound -Protocol TCP -LocalPort 12000 -Action Allow
New-NetFirewallRule -DisplayName "Permitir puerto 12000 UDP" -Direction Inbound -Protocol UDP -LocalPort 12000 -Action Allow
New-NetFirewallRule -DisplayName "Permitir puerto 12000 TCP" -Direction Outbound -Protocol TCP -LocalPort 12000 -Action Allow
New-NetFirewallRule -DisplayName "Permitir puerto 12000 UDP" -Direction Outbound -Protocol UDP -LocalPort 12000 -Action Allow

Write-Host "El cambio de puerto y las reglas de firewall se han completado y el servicio se ha reiniciado."
