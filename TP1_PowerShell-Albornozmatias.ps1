
Write-Host " INFORMACION DEL SISTEMA " -ForegroundColor Cyan

Write-Host "`n[1] Version de PowerShell:" -ForegroundColor Yellow
$PSVersionTable.PSVersion

Write-Host "`n[2] Configuracion de Permisividad:" -ForegroundColor Yellow
Get-ExecutionPolicy -List | Format-Table Scope, ExecutionPolicy -AutoSize

Write-Host "`n[3] Edicion del Sistema Operativo:" -ForegroundColor Yellow
$SO = Get-CimInstance -ClassName Win32_OperatingSystem
[PSCustomObject]@{
    Nombre        = $SO.Caption
    Version       = $SO.Version
    Build         = $SO.BuildNumber
    Arquitectura  = $SO.OSArchitecture
    Fabricante    = $SO.Manufacturer
} | Format-List

Write-Host "`n[4] Informacion completa del PC:" -ForegroundColor Yellow
Write-Host "Nombre del equipo (simbolo del sistema): $env:COMPUTERNAME" -ForegroundColor Green

Get-ComputerInfo | Select-Object `
    CsName, `
    CsManufacturer, `
    CsModel, `
    WindowsProductName, `
    WindowsEditionId, `
    OsVersion, `
    OsArchitecture, `
    BiosFirmwareVersion, `
    CsTotalPhysicalMemory, `
    CsNumberOfProcessors, `
    CsProcessors, `
    TimeZone

Write-Host "`nProceso finalizado correctamente." -ForegroundColor Green
Read-Host "Presione ENTER para salir"