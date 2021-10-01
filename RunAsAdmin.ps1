$wc = New-Object System.Net.WebClient
if(test-path C:\AutoSetup){}else{mkdir C:\AutoSetup}
$wc.DownloadFile("https://raw.githubusercontent.com/saschazesiger/AutoSetup/main/AutoSetup.ps1", "C:\AutoSetup\Setup.ps1")
Start-Process powershell "-command C:\AutoSetup\Setup.ps1" -Verb RunAs
