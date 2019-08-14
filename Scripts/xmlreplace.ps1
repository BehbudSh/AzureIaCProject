$xmlreplace = (Get-AzureRmSqlDatabaseSecureConnectionPolicy -ResourceGroupName "Project1RG" -ServerName "prodvmsql" -DatabaseName "sqldb").ConnectionStrings.AdoNetConnectionString
$PathToXml =  'C:\inetpub\wwwroot\Web.config'
$xml = [xml](Get-Content -Path $PathToXml)
$xml.configuration.connectionStrings.ChildNodes.Item(0).connectionstring = $xmlreplace
$xml.Save($PathToXml)