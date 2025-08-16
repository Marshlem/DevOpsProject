$resourceGroup = "CopilotDevOpsRG"
$webAppName   = "copilot-webapp-demo"

$webAppId = az webapp show --name $webAppName --resource-group $resourceGroup --query id -o tsv

az monitor metrics alert create `
  --name "HighCPUAlert" `
  --resource-group $resourceGroup `
  --scopes $webAppId `
  --condition "avg Percentage CPU > 80" `
  --description "CPU usage is high." `
  --window-size 5m `
  --evaluation-frequency 1m
