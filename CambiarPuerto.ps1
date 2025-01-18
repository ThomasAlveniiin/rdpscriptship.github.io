# Leer dominio como parámetro opcional
param (
    [string]$Dominio = $(Read-Host "Introduce el dominio de tu web")
)

# Mostrar el dominio ingresado
Write-Host "El dominio ingresado es: $Dominio"

# Cambiar el valor del puerto en el registro
Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -Name "PortNumber" -Value 12000 -Type DWord

# Reiniciar el servicio de Terminal Services
Write-Host "Reiniciando el servicio de Terminal Services..."
net stop termservice
net start termservice

Write-Host "El cambio de puerto se ha completado y el servicio se ha reiniciado."
