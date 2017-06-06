[CmdletBinding()]
param (

)

. (Join-Path $PSScriptRoot '_createlinks.ps1')
. (Join-Path $PSScriptRoot '_presetvars.ps1')

$containerId = docker run -d --hostname=NAVSERVER -p 7045-7048:7045-7048 `
    -e "sql_server=sql_ip\sql_instance" -e "sql_db=navdbname" `
    -e "import_cronus_license=false" -e "config_instance=false" `
    ${repo}/${navImageNameWin}

docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $containerId