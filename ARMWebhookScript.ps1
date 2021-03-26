param([string] $VMName,[string] $StaticMemory,[string] $ProcessorCount,[string] $Image,[string] $Location)
$uri = 'https://f3b60840-5f07-4bfb-82e7-10723d26c506.webhook.we.azure-automation.net/webhooks?token=vYfMXFirXJkyDSPjhk873Iayt6bFr8KWcih5gxbH5UU%3d'
$params  = @(@{ VMName=$VMName;StaticMemory=$StaticMemory;ProcessorCount=$ProcessorCount;Image=$Image})
$body = ConvertTo-Json -InputObject $params
$header = @{ message='StartedbyOnrego'}
$response = Invoke-WebRequest -Method Post -Uri $uri -Body $body -Headers $header
$output = (ConvertFrom-Json ($response.Content)).jobids[0]
Write-Output $output
$DeploymentScriptOutputs = @{}
$DeploymentScriptOutputs['text'] = $output