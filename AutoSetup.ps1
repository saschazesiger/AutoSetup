

function import {                                                              #Import Dialog

[reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null
[reflection.assembly]::loadwithpartialname("System.Drawing") | Out-Null

$form1 = New-Object System.Windows.Forms.Form                                  #Variabeln initalisieren
$button1 = New-Object System.Windows.Forms.Button
$label = New-Object System.Windows.Forms.Label
$InitialFormWindowState = New-Object System.Windows.Forms.FormWindowState

$button1_OnClick=                                                              #Export Button
{
        function conf_speichern{                                               #Geiche Konf. wie im Main Dialog
        if(Test-Path C:\AutoSetup\Custom-Script.ps1){                          #Falls Pfad nicht existiert wird neue Datei erstellt
            Remove-Item C:\AutoSetup\Custom-Script.ps1
            $lsb_log.Items.Insert(0, "Alte Konfiguration wurde gelöscht")
        }

        $ckb = "$"                                                             #Variabeln werden generiert
        $ckb = $ckb + $ckb_chocolatey.checked

        $cke_chocolatey = "$" + $ckb_chocolatey.checked
        $cke_chrome = "$" + $ckb_chrome.Checked
        $cke_opera = "$" + $ckb_opera.Checked
        $cke_winrar = "$" + $ckb_winrar.Checked
        $cke_7zip = "$" + $ckb_7zip.Checked
        $cke_teams = "$" + $ckb_teams.Checked
        $cke_discord = "$" + $ckb_discord.Checked
        $cke_zoom = "$" + $ckb_zoom.Checked
        $cke_paintnet = "$" + $ckb_paintnet.Checked
        $cke_vlc = "$" + $ckb_vlc.Checked
        $cke_adobe = "$" + $ckb_adobe.Checked
        $cke_backup = "$" + $ckb_backup.Checked
        $cke_geek = "$" + $ckb_geek.Checked
        $cke_download = "$" + $ckb_download.Checked
        $cke_firefox = "$" + $ckb_firefox.Checked
        $cke_hintergrund = "$" + $ckb_hintergrund.Checked
        $cke_name = "$" + $ckb_name.Checked
        $cke_user = "$" + $ckb_user.Checked
        $cke_darkmode = "$" + $ckb_darkmode.Checked
        $cke_wvorher = "$" + $ckb_wvorher.Checked
        $cke_nachw = "$" + $ckb_nachw.Checked
        $txe_url = $txb_url.text
        $txe_vorname = $txb_vorname.text
        $txe_nachname = $txb_nachname.text
        $txe_user = $txb_user.text
        $txe_pass = $txb_pass.text
        $txe_name = $txb_name.text
        $cke_aktiv = "$" + $ckb_aktiv.Checked
        $cke_passaendern = "$" + $ckb_passaendern.Checked
        $c1 = Get-Content -Path C:\AutoSetup\c2.txt 

        $lsb_log.Items.Insert(0, "Variabeln gespeichert")                      #Script wird heruntergeladen

        $wc.DownloadFile("https://raw.githubusercontent.com/saschazesiger/AutoSetup/main/AutoSetup.ps1", "C:\AutoSetup\Custom-Script.ps1")
        $lsb_log.Items.Insert(0, "Datei heruntergeladen")
        $NewContent = Get-Content -Path "C:\AutoSetup\Custom-Script.ps1" |     #Öffnet Scirpt und fügt die Variabeln ein
        ForEach-Object {
            $_

            if($_ -match ('^' + [regex]::Escape('# Costum Code wird unterhalb eingefügt -->')))
            {
                '$btn_speichern.Text = "Eigene Konf. geladen"'
                '$btn_speichern.enabled = $false'
                '$ckb_chocolatey.Checked ='+ " $cke_chocolatey"
                '$ckb_chrome.Checked ='+ " $cke_chrome"
                '$ckb_opera.Checked ='+ " $cke_opera"
                '$ckb_winrar.Checked ='+ " $cke_winrar"
                '$ckb_7zip.Checked ='+ " $cke_7zip"
                '$ckb_teams.Checked ='+ " $cke_teams"
                '$ckb_discord.Checked ='+ " $cke_discord"
                '$ckb_zoom.Checked ='+ " $cke_zoom"
                '$ckb_paintnet.Checked ='+ " $cke_paintnet"
                '$ckb_vlc.Checked ='+ " $cke_vlc"
                '$ckb_adobe.Checked ='+ " $cke_adobe"
                '$ckb_backup.Checked ='+ " $cke_backup"
                '$ckb_geek.Checked ='+ " $cke_geek"
                '$ckb_download.Checked ='+ " $cke_download"
                '$ckb_firefox.Checked ='+ " $cke_firefox"
                '$ckb_hintergrund.Checked ='+ " $cke_hintergrund"
                '$ckb_name.Checked ='+ " $cke_name"
                '$ckb_user.Checked ='+ " $cke_user"
                '$ckb_darkmode.Checked ='+ " $cke_darkmode"
                '$ckb_wvorher.Checked ='+ " $cke_wvorher"
                '$ckb_nachw.Checked ='+ " $cke_nachw"
                '$txb_url.text ='+" '$txe_url'"
                '$txb_vorname.text ='+" '$txe_vorname'"
                '$txb_nachname.text ='+" '$txe_nachname'"
                '$txb_pass.text ='+" '$txe_pass'"
                '$txb_user.text ='+" '$txe_user'"
                '$txb_name.text ='+" '$txe_name'"
                '$ckb_aktiv.Checked ='+ " $cke_aktiv"
                '$ckb_passaendern.Checked ='+ " $cke_passaendern"
                'set_hintergrund'
                '$c1 =' + " $c1"
                '$btn_standardfarbe.BackColor = "#FF"+$c1;'
                '$c2 = "0x" + "$c1"'
                '"$c1" > C:\AutoSetup\c1.txt'
                '"$c2" > C:\AutoSetup\c2.txt'

            }
        }                                                                      #Generiert neuer Script in Autosetup Ordner
        $NewContent | Out-File -FilePath "C:\AutoSetup\Custom-Script.ps1" -Encoding Default -Force
        $lsb_log.Items.Insert(0, "Datei unter C:\AutoSetup\Custom-Script.ps1 erstellt!")
        $sc.rootfolder = "MyComputer"                                          #Öffnet Speicherdialog
        $sc.ShowDialog()
        Move-Item "C:\AutoSetup\Custom-Script.ps1" $sc.SelectedPath -force     #Verschiebt die Datei in den angegebenen Pfad
        $lsb_log.Items.Insert(0, "Datei erfolgreich verschoben!")
    }
    conf_speichern                                                             #Script wird ausgeführt

}

$OnLoadForm_StateCorrection=
{
	$form1.WindowState = $InitialFormWindowState
}

$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 107
$System_Drawing_Size.Width = 280
$form1.ClientSize = $System_Drawing_Size
$form1.DataBindings.DefaultDataSourceUpdateMode = 0
$form1.Name = "form1"
$form1.Text = "Importieren"


$button1.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 22
$System_Drawing_Point.Y = 63
$button1.Location = $System_Drawing_Point
$button1.Name = "button1"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 26
$System_Drawing_Size.Width = 229
$button1.Size = $System_Drawing_Size
$button1.TabIndex = 1
$button1.Text = "Konfiguration jetzt exportieren"
$button1.UseVisualStyleBackColor = $True
$button1.add_Click($button1_OnClick)

$form1.Controls.Add($button1)

$label.DataBindings.DefaultDataSourceUpdateMode = 0
$label.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",8.25,1,3,0)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 22
$System_Drawing_Point.Y = 13
$label.Location = $System_Drawing_Point
$label.Name = "label"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 46
$System_Drawing_Size.Width = 260
$label.Size = $System_Drawing_Size
$label.TabIndex = 0
$label.Text = "Ein Import ist nicht nötig, das exportierte Programm kann eigenständig ausgeführt werden!"

$form1.Controls.Add($label)

$InitialFormWindowState = $form1.WindowState
$form1.add_Load($OnLoadForm_StateCorrection)
$form1.ShowDialog()| Out-Null

} 



function GenerateForm {                                                        #Hauptform
########################################################################
# Dieses Programm vereinfacht das Setup nach der Windows Installation.
# Author: Janis Zesiger
########################################################################

#region Import the Assemblies
[reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null
[reflection.assembly]::loadwithpartialname("System.Drawing") | Out-Null
#endregion

#region Globale Variablen                                                       #Variabeln erstellen

#endregion Globale Variabeln

#region Generated Form Objects                                                  #Felder initalisieren                                              
$sc = new-object System.Windows.Forms.FolderBrowserDialog
$wc = New-Object System.Net.WebClient
$frm_setup = New-Object System.Windows.Forms.Form
$btn_zuruecksetzen = New-Object System.Windows.Forms.Button
$grb_wiederherstellung = New-Object System.Windows.Forms.GroupBox
$ckb_nachw = New-Object System.Windows.Forms.CheckBox
$ckb_wvorher = New-Object System.Windows.Forms.CheckBox
$grb_farbe = New-Object System.Windows.Forms.GroupBox
$ckb_darkmode = New-Object System.Windows.Forms.CheckBox
$btn_standardfarbeloeschen = New-Object System.Windows.Forms.Button
$btn_standardfarbe = New-Object System.Windows.Forms.Button
$grb_applikation = New-Object System.Windows.Forms.GroupBox
$ckb_chocolatey = New-Object System.Windows.Forms.CheckBox
$lbl_browser = New-Object System.Windows.Forms.Label
$ckb_firefox = New-Object System.Windows.Forms.CheckBox
$ckb_opera = New-Object System.Windows.Forms.CheckBox
$ckb_chrome = New-Object System.Windows.Forms.CheckBox
$lbl_archiv = New-Object System.Windows.Forms.Label
$ckb_winrar = New-Object System.Windows.Forms.CheckBox
$ckb_7zip = New-Object System.Windows.Forms.CheckBox
$lbl_chat = New-Object System.Windows.Forms.Label
$ckb_download = New-Object System.Windows.Forms.CheckBox
$ckb_backup = New-Object System.Windows.Forms.CheckBox
$ckb_geek = New-Object System.Windows.Forms.CheckBox
$ckb_teams = New-Object System.Windows.Forms.CheckBox
$ckb_discord = New-Object System.Windows.Forms.CheckBox
$ckb_zoom = New-Object System.Windows.Forms.CheckBox
$lbl_sonstige = New-Object System.Windows.Forms.Label
$lbl_medien = New-Object System.Windows.Forms.Label
$ckb_adobe = New-Object System.Windows.Forms.CheckBox
$ckb_paintnet = New-Object System.Windows.Forms.CheckBox
$ckb_vlc = New-Object System.Windows.Forms.CheckBox
$grb_benutzer = New-Object System.Windows.Forms.GroupBox
$ckb_user = New-Object System.Windows.Forms.CheckBox
$txb_nachname = New-Object System.Windows.Forms.TextBox
$lbl_nachname = New-Object System.Windows.Forms.Label
$ckb_passaendern = New-Object System.Windows.Forms.CheckBox
$ckb_aktiv = New-Object System.Windows.Forms.CheckBox
$txb_pass = New-Object System.Windows.Forms.TextBox
$lbl_pass = New-Object System.Windows.Forms.Label
$txb_user = New-Object System.Windows.Forms.TextBox
$lbl_user = New-Object System.Windows.Forms.Label
$txb_vorname = New-Object System.Windows.Forms.TextBox
$lbl_vorname = New-Object System.Windows.Forms.Label
$grb_name = New-Object System.Windows.Forms.GroupBox
$ckb_name = New-Object System.Windows.Forms.CheckBox
$txb_name = New-Object System.Windows.Forms.TextBox
$lbl_name = New-Object System.Windows.Forms.Label
$checkBox1 = New-Object System.Windows.Forms.CheckBox
$lsb_log = New-Object System.Windows.Forms.ListBox
$btn_laden = New-Object System.Windows.Forms.Button
$btn_speichern = New-Object System.Windows.Forms.Button
$btn_anwenden = New-Object System.Windows.Forms.Button
$grb_hintergrund = New-Object System.Windows.Forms.GroupBox
$lbl_hintergrund = New-Object System.Windows.Forms.Label
$txb_url = New-Object System.Windows.Forms.TextBox
$btn_hintergrund = New-Object System.Windows.Forms.Button
$ckb_hintergrund = New-Object System.Windows.Forms.CheckBox
$img_hintergrund = New-Object System.Windows.Forms.PictureBox
$InitialFormWindowState = New-Object System.Windows.Forms.FormWindowState

$img_choco = New-Object System.Windows.Forms.PictureBox
$img_chrome = New-Object System.Windows.Forms.PictureBox
$img_opera = New-Object System.Windows.Forms.PictureBox
$img_winrar = New-Object System.Windows.Forms.PictureBox
$img_7zip = New-Object System.Windows.Forms.PictureBox
$img_teams = New-Object System.Windows.Forms.PictureBox
$img_discord = New-Object System.Windows.Forms.PictureBox
$img_zoom = New-Object System.Windows.Forms.PictureBox
$img_paintnet = New-Object System.Windows.Forms.PictureBox
$img_vlc = New-Object System.Windows.Forms.PictureBox
$img_adobe = New-Object System.Windows.Forms.PictureBox
$img_backup = New-Object System.Windows.Forms.PictureBox
$img_geek = New-Object System.Windows.Forms.PictureBox
$img_download = New-Object System.Windows.Forms.PictureBox
$img_firefox = New-Object System.Windows.Forms.PictureBox
#endregion Generated Form Objects

#region Funktionen
function chocoinstall {                                                         #Chocolatey wird installiert
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    C:\AutoSetup\choco-install.ps1
}

function wvorher {
    $lsb_log.Items.Insert(0, "Wiederherstellungspunkt wird erstellt...")        #Checkpoint wird vom Computer erstellt
    Checkpoint-Computer "Angelegt vor Ausführung von AutoSetup"
    $lsb_log.Items.Insert(0, "Wiederherstellungspunkt wurde erstellt")

}

function wnachher {
    $lsb_log.Items.Insert(0, "Wiederherstellungspunkt wird erstellt...")        #Checkpoint wird nach der Ausführung erstellt
    Checkpoint-Computer "Angelegt nach Ausführung von AutoSetup"
    $lsb_log.Items.Insert(0, "Wiederherstellungspunkt wurde erstellt")
}

function appchoco {
    [int]$apps = "0"
    if($ckb_firefox.Checked -eq $true){$apps = "1"}                             #Es wird überprüft ob Chocolatey benötigt wird
    if($ckb_chrome.Checked -eq $true){$apps = "1"}
    if($ckb_opera.Checked -eq $true){$apps = "1"}
    if($ckb_winrar.Checked -eq $true){$apps = "1"}
    if($ckb_7zip.Checked -eq $true){$apps = "1"}
    if($ckb_teams.Checked -eq $true){$apps = "1"}
    if($ckb_discord.Checked -eq $true){$apps = "1"}
    if($ckb_zoom.Checked -eq $true){$apps = "1"}
    if($ckb_paintnet.Checked -eq $true){$apps = "1"}
    if($ckb_vlc.Checked -eq $true){$apps = "1"}
    if($ckb_adobe.Checked -eq $true){$apps = "1"}
    if($ckb_backup.Checked -eq $true){$apps = "1"}
    if($ckb_geek.Checked -eq $true){$apps = "1"}
    if($ckb_download.Checked -eq $true){$apps = "1"}
    if($apps -eq "0"){
        $ckb_chocolatey.Checked = $false
        $ckb_chocolatey.Enabled=$true
        $ckb_chocolatey.Text="Chocolatey"
    }
}

     Function Set-WallPaper($Image) {                                           #Funktion um das Hintergrundbild anzupassen
Add-Type -TypeDefinition @" 
using System; 
using System.Runtime.InteropServices;
  
public class Params
{ 
    [DllImport("User32.dll",CharSet=CharSet.Unicode)] 
    public static extern int SystemParametersInfo (Int32 uAction, 
                                                   Int32 uParam, 
                                                   String lpvParam, 
                                                   Int32 fuWinIni);
}
"@ 
  
    $SPI_SETDESKWALLPAPER = 0x0014
    $UpdateIniFile = 0x01
    $SendChangeEvent = 0x02
  
    $fWinIni = $UpdateIniFile -bor $SendChangeEvent
  
    $ret = [Params]::SystemParametersInfo($SPI_SETDESKWALLPAPER, 0, $Image, $fWinIni)
 
}
function set_hintergrund {                                                     
    if($txb_url.Text -match "https://"){                                       #Wenn URL nicht leer ist... 
            [int]$random = get-random
            $pfad = "C:\AutoSetup\Bilder\"
            $pfad = $pfad + $random
            $pfad = $pfad + ".jpg"                                             #Ein Pfad mit Bild Datei mit Random Name wird erstellt
    #        $lsb_log.Items.Insert(0, "Bild wird heruntergeladen...")
    #        $wc.DownloadFile($txb_url.Text, $pfad)                            #Das eingegebene Bild wird durch den Web Client heruntergeladen
    #        $lsb_log.Items.Insert(0, "Bild wird gespeichert...")
    #        $img_hintergrund.Image = [System.Drawing.Image]::Fromfile($pfad)  #Bild wird in Imagebox angezeigt
    #        $lsb_log.Items.Insert(0, "Unter $pfad gespeichert")
    #        
        try{
            Invoke-WebRequest $txb_url.Text -OutFile ($pfad)
            $bild = [System.Drawing.Image]::Fromfile($pfad)
            $img_hintergrund.Image = $bild
            $lsb_log.Items.Insert(0, "Unter $pfad gespeichert!")
            $pfad > C:\AutoSetup\hintergrund-pfad.txt                          #Schreibt den Bildpfad in eine Textdatei um später wieder verwendet zu werden.
        }catch{
            $lsb_log.Items.Insert(0, "Kein Bild unter dieser URL gefunden!")
        }
    }else{
        $lsb_log.Items.Insert(0, "Keine URL eingegeben!")                      #Falls URL ungültig ist
        
    }
    
}



#endregion Funktionen

#region Felder aktivieren & deaktivieren
$txb_url.Enabled = $false                                                      #Standardmässiges ein & ausschalten von Feldern beim Start
$btn_hintergrund.Enabled = $false
$img_hintergrund.Enabled = $false
$txb_name.Enabled = $false
$txb_vorname.Enabled = $false
$txb_nachname.Enabled = $false
$txb_user.Enabled = $false
$txb_pass.Enabled = $false
$ckb_aktiv.Enabled = $false
$ckb_passaendern.Enabled = $false

$ckb_name.add_CheckedChanged({                                                 #Aktiviert die Felder wenn die PCName-Checkbox gecheckt wird
    if ($ckb_name.Checked -eq $true){
        $txb_name.Enabled = $true
    }else{
        $txb_name.Enabled = $false
    }
})
$ckb_user.add_CheckedChanged({                                                 #Aktiviert die Felder wenn die User-Checkbox gecheckt wird
    if ($ckb_user.Checked -eq $true){
        $txb_vorname.Enabled = $true
        $txb_nachname.Enabled = $true
        $txb_user.Enabled = $true
        $txb_pass.Enabled = $true
        $ckb_aktiv.Enabled = $true
        $ckb_passaendern.Enabled = $true
    }else{
        $txb_vorname.Enabled = $false
        $txb_nachname.Enabled = $false
        $txb_user.Enabled = $false
        $txb_pass.Enabled = $false
        $ckb_aktiv.Enabled = $false
        $ckb_passaendern.Enabled = $false
    }
})

$ckb_hintergrund.Add_CheckedChanged({                                          #Aktiviert die Felder wenn die Hintergrund-Checkbox gecheckt wird
if ($ckb_hintergrund.Checked -eq $true){
        $txb_url.Enabled = $true
        $btn_hintergrund.Enabled = $true
        $img_hintergrund.Enabled = $true
    }else{
        $txb_url.Enabled = $false
        $btn_hintergrund.Enabled = $false
        $img_hintergrund.Enabled = $false
    }
})
                                                                               #Es wird überprüft ob Chocolatey verwendet wird oder nicht
$ckb_firefox.add_CheckedChanged({if($ckb_firefox.Checked -eq $true){$ckb_chocolatey.Checked=$true;$ckb_chocolatey.Enabled=$false;$ckb_chocolatey.Text="Chocolatey (wird benötigt)"}else{appchoco}})
$ckb_chrome.add_CheckedChanged({if($ckb_chrome.Checked -eq $true){$ckb_chocolatey.Checked = $true;$ckb_chocolatey.Enabled=$false;$ckb_chocolatey.Text="Chocolatey (wird benötigt)"}else{appchoco}})
$ckb_opera.add_CheckedChanged({if($ckb_opera.Checked -eq $true){$ckb_chocolatey.Checked = $true;$ckb_chocolatey.Enabled=$false;$ckb_chocolatey.Text="Chocolatey (wird benötigt)"}else{appchoco}})
$ckb_winrar.add_CheckedChanged({if($ckb_winrar.Checked -eq $true){$ckb_chocolatey.Checked = $true;$ckb_chocolatey.Enabled=$false;$ckb_chocolatey.Text="Chocolatey (wird benötigt)"}else{appchoco}})
$ckb_7zip.add_CheckedChanged({if($ckb_7zip.Checked -eq $true){$ckb_chocolatey.Checked = $true;$ckb_chocolatey.Enabled=$false;$ckb_chocolatey.Text="Chocolatey (wird benötigt)"}else{appchoco}})
$ckb_teams.add_CheckedChanged({if($ckb_teams.Checked -eq $true){$ckb_chocolatey.Checked = $true;$ckb_chocolatey.Enabled=$false;$ckb_chocolatey.Text="Chocolatey (wird benötigt)"}else{appchoco}})
$ckb_discord.add_CheckedChanged({if($ckb_discord.Checked -eq $true){$ckb_chocolatey.Checked = $true;$ckb_chocolatey.Enabled=$false;$ckb_chocolatey.Text="Chocolatey (wird benötigt)"}else{appchoco}})
$ckb_zoom.add_CheckedChanged({if($ckb_zoom.Checked -eq $true){$ckb_chocolatey.Checked = $true;$ckb_chocolatey.Enabled=$false;$ckb_chocolatey.Text="Chocolatey (wird benötigt)"}else{appchoco}})
$ckb_paintnet.add_CheckedChanged({if($ckb_paintnet.Checked -eq $true){$ckb_chocolatey.Checked = $true;$ckb_chocolatey.Enabled=$false;$ckb_chocolatey.Text="Chocolatey (wird benötigt)"}else{appchoco}})
$ckb_vlc.add_CheckedChanged({if($ckb_vlc.Checked -eq $true){$ckb_chocolatey.Checked = $true;$ckb_chocolatey.Enabled=$false;$ckb_chocolatey.Text="Chocolatey (wird benötigt)"}else{appchoco}})
$ckb_adobe.add_CheckedChanged({if($ckb_adobe.Checked -eq $true){$ckb_chocolatey.Checked = $true;$ckb_chocolatey.Enabled=$false;$ckb_chocolatey.Text="Chocolatey (wird benötigt)"}else{appchoco}})
$ckb_backup.add_CheckedChanged({if($ckb_backup.Checked -eq $true){$ckb_chocolatey.Checked = $true;$ckb_chocolatey.Enabled=$false;$ckb_chocolatey.Text="Chocolatey (wird benötigt)"}else{appchoco}})
$ckb_geek.add_CheckedChanged({if($ckb_geek.Checked -eq $true){$ckb_chocolatey.Checked = $true;$ckb_chocolatey.Enabled=$false;$ckb_chocolatey.Text="Chocolatey (wird benötigt)"}else{appchoco}})
$ckb_download.add_CheckedChanged({if($ckb_download.Checked -eq $true){$ckb_chocolatey.Checked = $true;$ckb_chocolatey.Enabled=$false;$ckb_chocolatey.Text="Chocolatey (wird benötigt)"}else{appchoco}})
$ckb_nachw.add_CheckedChanged({if($ckb_nachw.Checked -eq $true){$ckb_wvorher.Checked = $false}})
$ckb_wvorher.add_CheckedChanged({if($ckb_wvorher.Checked -eq $true){$ckb_nachw.Checked = $false}})

#endregion Felder aktivieren & deaktivieren
#region Hintergrund
$btn_hintergrund_OnClick=
{
    set_hintergrund
}

#endregion Hintergrund
#region Ausführung
$btn_anwenden_OnClick=                                                         #Ab hier beginnt die eigentliche Ausführung des Programmes
{

    $btn_anwenden.BackColor = [System.Drawing.Color]::FromArgb(0,0,0,0)
    if($ckb_wvorher.Checked -eq $true){                                        #Wenn die Checkbox zum Wiederherstellungspunkt vorher angeklickt ist
        $lsb_log.Items.Insert(0, "Wiederherstellungspunkt wird erstellt...")
        Checkpoint-Computer "Angelegt vor Ausführung von AutoSetup"            #Wird ein Wiederherstellungspunkt zu Beginn erstellt
        $lsb_log.Items.Insert(0, "Wiederherstellungspunkt wurde erstellt")
    }

                                                                               #Falls die entsprechende Checkbox ausgewählt ist wird das Programm installiert und der Log gespeichert
    if($ckb_chocolatey.Checked -eq $true){$lsb_log.Items.Insert(0, "Chocolatey wird installiert..."); chocoinstall > C:\AutoSetup\chocolatey.log; $lsb_log.Items.Insert(0, "Chocolatey Installation abgeschlossen")}
    if($ckb_firefox.Checked -eq $true){$lsb_log.Items.Insert(0, "Firefox wird installiert..."); choco install firefox -y > C:\AutoSetup\firefox.log; $lsb_log.Items.Insert(0, "Firefox Installation abgeschlossen")}
    if($ckb_chrome.Checked -eq $true){$lsb_log.Items.Insert(0, "Chrome wird installiert...");choco install googlechrome -y > C:\AutoSetup\chrome.log; $lsb_log.Items.Insert(0, "Chrome Installation abgeschlossen")}
    if($ckb_opera.Checked -eq $true){$lsb_log.Items.Insert(0, "Opera wird installiert...");choco install opera -y > C:\AutoSetup\opera.log; $lsb_log.Items.Insert(0, "Opera Installation abgeschlossen")}
    if($ckb_winrar.Checked -eq $true){$lsb_log.Items.Insert(0, "WinRAR wird installiert...");choco install winrar -y > C:\AutoSetup\winrar.log; $lsb_log.Items.Insert(0, "WinRAR Installation abgeschlossen")}
    if($ckb_7zip.Checked -eq $true){$lsb_log.Items.Insert(0, "7ZIP wird installiert...");choco install 7zip -y > C:\AutoSetup\7zip.log; $lsb_log.Items.Insert(0, "7ZIP Installation abgeschlossen")}
    if($ckb_teams.Checked -eq $true){$lsb_log.Items.Insert(0, "Teams wird installiert...");choco install microsoft-teams -y > C:\AutoSetup\7zip.log; $lsb_log.Items.Insert(0, "Teams Installation abgeschlossen")}
    if($ckb_discord.Checked -eq $true){$lsb_log.Items.Insert(0, "Discord wird installiert...");choco install discord -y > C:\AutoSetup\teams.log; $lsb_log.Items.Insert(0, "Discord Installation abgeschlossen")}
    if($ckb_zoom.Checked -eq $true){$lsb_log.Items.Insert(0, "Zoom wird installiert...");choco install zoom -y > C:\AutoSetup\zoom.log; $lsb_log.Items.Insert(0, "Zoom Installation abgeschlossen")}
    if($ckb_paintnet.Checked -eq $true){$lsb_log.Items.Insert(0, "Paint.NET wird installiert...");choco install paint.net -y > C:\AutoSetup\paintnet.log; $lsb_log.Items.Insert(0, "Paint.NET Installation abgeschlossen")}
    if($ckb_vlc.Checked -eq $true){$lsb_log.Items.Insert(0, "VLC wird installiert...");choco install vlc -y > C:\AutoSetup\vlc.log; $lsb_log.Items.Insert(0, "VLC Installation abgeschlossen")}
    if($ckb_adobe.Checked -eq $true){$lsb_log.Items.Insert(0, "Adobe wird installiert...");choco install adobereader -y > C:\AutoSetup\adobe.log; $lsb_log.Items.Insert(0, "Adobe Reader Installation abgeschlossen")}
    if($ckb_backup.Checked -eq $true){$lsb_log.Items.Insert(0, "Google Backup and Sync wird installiert...");choco install google-drive-file-stream -y > C:\AutoSetup\backup.log; $lsb_log.Items.Insert(0, "Google Backup and Sync Installation abgeschlossen")}
    if($ckb_geek.Checked -eq $true){$lsb_log.Items.Insert(0, "Geek Uninstaller wird installiert...");choco install geekuninstaller -y > C:\AutoSetup\geek.log; $lsb_log.Items.Insert(0, "Geek Uninstaller Installation abgeschlossen")}
    if($ckb_download.Checked -eq $true){$lsb_log.Items.Insert(0, "Internet Download Manager wird installiert...");choco install internet-download-manager -y > C:\AutoSetup\downloadmanager.log; $lsb_log.Items.Insert(0, "Internet Download Manager Installation abgeschlossen")}
    $lsb_log.Items.Insert(0, "Alle Programme installiert");
    $lsb_log.Items.Insert(0, "Installationslogs unter C:\AutoSetup");
    $pfad = Get-Content -Path C:\AutoSetup\hintergrund-pfad.txt                #Setzt $pfad zu der vorher angegebenen Textdatei

if($ckb_hintergrund.Checked -eq $true){                                        #Wenn die Checkbox fürs Hintergrundbild ausgewählt ist
    if($pfad -ne "leer"){
        Set-WallPaper -Image "$pfad"                                           #Führt die obere Funktion aus, setzt $pfad als Hintergrund
        $lsb_log.Items.Insert(0, "$pfad als Hintergrund eingestellt")                
    }else{
        Set-WallPaper -Image “C:\AutoSetup\Bilder\hintergrund.jpg”             #Setzt das Standardbild als Hintergrund falls die Textbox leer ist
        $lsb_log.Items.Insert(0, "Standardhintergrund eingestellt")
    }}


    if($ckb_darkmode.Checked -eq $true){                                       #Falls Darkmode ausgewählt ist
        $lsb_log.Items.Insert(0, "Skript für Darkmode wird erstellt...")             #Der Darkmodebefehl wird in eine externe Datei geschrieben da ansonsten die GUI abstürtzt
        [string]$darkmode = "Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Value 0"
        $darkmode > C:\AutoSetup\darkmode.ps1                                  #Das externe Script wird ausgeführt
        start powershell {C:\AutoSetup\darkmode.ps1}
        $lsb_log.Items.Insert(0, "Darkmode eingeschaltet")
    }

    if($ckb_name.Checked -eq $true){                                           #Wenn PCName angekreuzt ist
        if($txb_name.Text -ne ""){                                             #Wenn Das Textfeld nicht leer ist
            $lsb_log.Items.Insert(0, "PC Name wird geändert...")
            $name = $txb_name.text
            start powershell {Rename-Computer -NewName "$name"}                #Neuer Name wird gesetzt
            $lsb_log.Items.Insert(0, "Name wurde geändert (Erst nach Neustart sichtbar!)")
        }else{
            $lsb_log.Items.Insert(0, "Bitte einen Namen eingeben!")    
        }

    }

    if($ckb_user.Checked -eq $true){                                            #Wenn User angekreuzt ist
        if($txb_user.Text -ne ""){                                              #Überprüft ob alle Textfelder etwas beinhalten
            if($txb_vorname.Text -ne ""){
                if($txb_nachname.Text -ne ""){
                    if($txb_pass.Text -ne ""){
                            $user = $txb_user.text                              #Schreibt der Inhalt aller Textfelder in Variabeln
                            $vorname = $txb_vorname.text
                            $nachname = $txb_nachname.text                      #Konvertiert die Passwortvariabel zu einem SecureString
                            $passwort = ConvertTo-SecureString $txb_pass.Text -AsPlainText -Force
                        if($ckb_aktiv.Checked -eq $true){
                            if($ckb_passaendern.Checked -eq $true){             #Nutzer wird erstellt, das Passwort läuft nicht ab
                                New-LocalUser $user -Password $passwort -FullName "$vorname $nachname" -PasswordNeverExpires:$true
                            }else{                                              #Nutzer wird normal erstellt
                                New-LocalUser $user -Password $passwort -FullName "$vorname $nachname"
                            }
                        }else{
                            if($ckb_passaendern.Checked -eq $true){             #Nutzer wird erstellt, Passwort läuft nicht ab, Nutzer vorerst deaktiviert
                                New-LocalUser $user -Password $passwort -FullName "$vorname $nachname" -PasswordNeverExpires:$true | Disable-Localuser
                            }else{                                              #Nutzer wird erstellt, vorerst deaktiviert
                                New-LocalUser $user -Password $passwort -FullName "$vorname $nachname" | Disable-Localuser
                            }
                        }                                                       #Gibt Fehlermeldungen aus, falls ein Feld nicht ausgefüllt ist
                    }else{$lsb_log.Items.Insert(0, "Bitte ein Passwort angeben!")}    
                }else{$lsb_log.Items.Insert(0, "Bitte Nachname eingeben!")}
            }else{$lsb_log.Items.Insert(0, "Bitte einen Vorname angeben!")}
        }else{$lsb_log.Items.Insert(0, "Bitte einen Username angeben!")}
    }

    if($btn_standardfarbe.BackColor.Name -eq "white"){                           #Falls Button weiss ist, dann überspringen
        $lsb_log.Items.Insert(0, "Standardfarbe nicht geändert.. (Überspringen)")
    }else{
        $lsb_log.Items.Insert(0, "Standardfarbe wird geändert...")
        $RegPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent"
        $c2 = Get-Content -Path C:\AutoSetup\c2.txt                              #Setzt Standardfarbe nach Datei auf AutoSetup
        $AccentColorMenuKey = @{
	        Key   = 'AccentColorMenu';
	        Type  = "DWORD";
        }
                                                                                 #Wenn Registry Pfad existiert
        If ($Null -eq (Get-ItemProperty -Path $RegPath -Name $AccentColorMenuKey.Key -ErrorAction SilentlyContinue))
        {                                                                        #Neue Datei erstellen
	        New-ItemProperty -Path $RegPath -Name $AccentColorMenuKey.Key -Value $c2 -PropertyType $AccentColorMenuKey.Type -Force
            $lsb_log.Items.Insert(0, "Reg. Eintrag AccentColorMenu wird erstellt...")
        }
        Else
        {                                                                         #In bestehende Datei einfügen
	        Set-ItemProperty -Path $RegPath -Name $AccentColorMenuKey.Key -Value $c2 -Force
            $lsb_log.Items.Insert(0, "Reg. Eintrag AccentColorMenu wird geändert... (bereits vorhanden)")
        }
        $StartMenuKey = @{
	    Key   = 'StartColorMenu';
	    Type  = "DWORD";
        }

        If ($Null -eq (Get-ItemProperty -Path $RegPath -Name $StartMenuKey.Key -ErrorAction SilentlyContinue))
        {
	        New-ItemProperty -Path $RegPath -Name $StartMenuKey.Key -Value $c2 -PropertyType $StartMenuKey.Type -Force
            $lsb_log.Items.Insert(0, "Reg. Eintrag StartMenuKey wird erstellt...")
        }
        Else
        {
	        Set-ItemProperty -Path $RegPath -Name $StartMenuKey.Key -Value $c2 -Force
            $lsb_log.Items.Insert(0, "Reg. Eintrag StartMenuKey wird geändert... (bereits vorhanden)")
        }

        $lsb_log.Items.Insert(0, "Explorer wird neu gestartet um Änderungen zu übernehmen...")
        Stop-Process -ProcessName explorer -Force -ErrorAction SilentlyContinue
        $lsb_log.Items.Insert(0, "Standardfarbe geändert!")
    }

    if($ckb_nachw.Checked -eq $true){                                           #Erstellt ein Systembackup nach der Ausführung
        wnachher 
    }
    $btn_anwenden.BackColor = [System.Drawing.Color]::FromArgb(255,0,255,0)
}
#endregion Ausführung


$btn_speichern_OnClick= 
{
        function conf_speichern{                                               #Geiche Konf. wie im Main Dialog
        if(Test-Path C:\AutoSetup\Custom-Script.ps1){                          #Falls Pfad nicht existiert wird neue Datei erstellt
            Remove-Item C:\AutoSetup\Custom-Script.ps1
            $lsb_log.Items.Insert(0, "Alte Konfiguration wurde gelöscht")
        }

        $ckb = "$"                                                             #Variabeln werden generiert
        $ckb = $ckb + $ckb_chocolatey.checked

        $cke_chocolatey = "$" + $ckb_chocolatey.checked
        $cke_chrome = "$" + $ckb_chrome.Checked
        $cke_opera = "$" + $ckb_opera.Checked
        $cke_winrar = "$" + $ckb_winrar.Checked
        $cke_7zip = "$" + $ckb_7zip.Checked
        $cke_teams = "$" + $ckb_teams.Checked
        $cke_discord = "$" + $ckb_discord.Checked
        $cke_zoom = "$" + $ckb_zoom.Checked
        $cke_paintnet = "$" + $ckb_paintnet.Checked
        $cke_vlc = "$" + $ckb_vlc.Checked
        $cke_adobe = "$" + $ckb_adobe.Checked
        $cke_backup = "$" + $ckb_backup.Checked
        $cke_geek = "$" + $ckb_geek.Checked
        $cke_download = "$" + $ckb_download.Checked
        $cke_firefox = "$" + $ckb_firefox.Checked
        $cke_hintergrund = "$" + $ckb_hintergrund.Checked
        $cke_name = "$" + $ckb_name.Checked
        $cke_user = "$" + $ckb_user.Checked
        $cke_darkmode = "$" + $ckb_darkmode.Checked
        $cke_wvorher = "$" + $ckb_wvorher.Checked
        $cke_nachw = "$" + $ckb_nachw.Checked
        $txe_url = $txb_url.text
        $txe_vorname = $txb_vorname.text
        $txe_nachname = $txb_nachname.text
        $txe_user = $txb_user.text
        $txe_pass = $txb_pass.text
        $txe_name = $txb_name.text
        $cke_aktiv = "$" + $ckb_aktiv.Checked
        $cke_passaendern = "$" + $ckb_passaendern.Checked
        $c1 = Get-Content -Path C:\AutoSetup\c2.txt 

        $lsb_log.Items.Insert(0, "Variabeln gespeichert")                      #Script wird heruntergeladen

        $wc.DownloadFile("https://raw.githubusercontent.com/saschazesiger/AutoSetup/main/AutoSetup.ps1", "C:\AutoSetup\Custom-Script.ps1")
        $lsb_log.Items.Insert(0, "Datei heruntergeladen")
        $NewContent = Get-Content -Path "C:\AutoSetup\Custom-Script.ps1" |     #Öffnet Scirpt und fügt die Variabeln ein
        ForEach-Object {
            $_

            if($_ -match ('^' + [regex]::Escape('# Costum Code wird unterhalb eingefügt -->')))
            {
                '$btn_speichern.Text = "Eigene Konf. geladen"'
                '$btn_speichern.enabled = $false'
                '$ckb_chocolatey.Checked ='+ " $cke_chocolatey"
                '$ckb_chrome.Checked ='+ " $cke_chrome"
                '$ckb_opera.Checked ='+ " $cke_opera"
                '$ckb_winrar.Checked ='+ " $cke_winrar"
                '$ckb_7zip.Checked ='+ " $cke_7zip"
                '$ckb_teams.Checked ='+ " $cke_teams"
                '$ckb_discord.Checked ='+ " $cke_discord"
                '$ckb_zoom.Checked ='+ " $cke_zoom"
                '$ckb_paintnet.Checked ='+ " $cke_paintnet"
                '$ckb_vlc.Checked ='+ " $cke_vlc"
                '$ckb_adobe.Checked ='+ " $cke_adobe"
                '$ckb_backup.Checked ='+ " $cke_backup"
                '$ckb_geek.Checked ='+ " $cke_geek"
                '$ckb_download.Checked ='+ " $cke_download"
                '$ckb_firefox.Checked ='+ " $cke_firefox"
                '$ckb_hintergrund.Checked ='+ " $cke_hintergrund"
                '$ckb_name.Checked ='+ " $cke_name"
                '$ckb_user.Checked ='+ " $cke_user"
                '$ckb_darkmode.Checked ='+ " $cke_darkmode"
                '$ckb_wvorher.Checked ='+ " $cke_wvorher"
                '$ckb_nachw.Checked ='+ " $cke_nachw"
                '$txb_url.text ='+" '$txe_url'"
                '$txb_vorname.text ='+" '$txe_vorname'"
                '$txb_nachname.text ='+" '$txe_nachname'"
                '$txb_pass.text ='+" '$txe_pass'"
                '$txb_user.text ='+" '$txe_user'"
                '$txb_name.text ='+" '$txe_name'"
                '$ckb_aktiv.Checked ='+ " $cke_aktiv"
                '$ckb_passaendern.Checked ='+ " $cke_passaendern"
                'set_hintergrund'
                '$c1 =' + " $c1"
                '$btn_standardfarbe.BackColor = "#FF"+$c1;'
                '$c2 = "0x" + "$c1"'
                '"$c1" > C:\AutoSetup\c1.txt'
                '"$c2" > C:\AutoSetup\c2.txt'

            }
        }                                                                      #Generiert neuer Script in Autosetup Ordner
        $NewContent | Out-File -FilePath "C:\AutoSetup\Custom-Script.ps1" -Encoding Default -Force
        $lsb_log.Items.Insert(0, "Datei unter C:\AutoSetup\Custom-Script.ps1 erstellt!")
        $sc.rootfolder = "MyComputer"                                          #Öffnet Speicherdialog
        $sc.ShowDialog()
        Move-Item "C:\AutoSetup\Custom-Script.ps1" $sc.SelectedPath -force     #Verschiebt die Datei in den angegebenen Pfad
        $lsb_log.Items.Insert(0, "Datei erfolgreich verschoben!")
    }
    conf_speichern                                                             #Script wird ausgeführt
}

$txb_vorname.Add_TextChanged({                                                 #Falls dieses Feld ein Sonderzeichen beinhaltet
    $text = $txb_vorname.Text
    $symbol = ""
    if($text -match '[^a-zA-Z0-9]'){
        $txb_vorname.Text = ""                                              #Setzt das Feld zurück
        $lsb_log.Items.Insert(0, "Sonderzeichen können nicht verwendet werden!")
    }
})
$txb_nachname.Add_TextChanged({
    $text = $txb_nachname.Text
    $symbol = ""
    if($text -match '[^a-zA-Z0-9]'){
        $txb_nachname.Text = ""
        $lsb_log.Items.Insert(0, "Sonderzeichen können nicht verwendet werden!")
    }
})
$txb_user.Add_TextChanged({
    $text = $txb_user.Text
    $symbol = ""
    if($text -match '[^a-zA-Z0-9]'){
        $txb_user.Text = ""
        $lsb_log.Items.Insert(0, "Sonderzeichen können nicht verwendet werden!")
    }
})
$txb_name.Add_TextChanged({
    $text = $txb_name.Text
    $symbol = ""
    if($text -match '[^a-zA-Z0-9]'){
        $txb_name.Text = ""
        $lsb_log.Items.Insert(0, "Sonderzeichen können nicht verwendet werden!")
    }
})

$btn_standardfarbe_OnClick= 
{
$c1 = '';
    foreach( $digit in (1..6 | foreach{ '{0:X}' -f (Get-Random -Max 16) })){
        $c1 = "$c1"+"$digit";}
        $c2 = "0x" + "$c1"
    $btn_standardfarbe.BackColor = "#FF"+$c1;
    [string]$colorbtn = $btn_standardfarbe.BackColor
    "$c1" > C:\AutoSetup\c1.txt
    "$c2" > C:\AutoSetup\c2.txt
    $lsb_log.Items.Insert(0, "$colorbtn")
}

$btn_laden_OnClick= 
{
    import

}


$btn_standardfarbeloeschen_OnClick= 
{
$btn_standardfarbe.BackColor = "white"

}


$btn_zuruecksetzen_OnClick= 
{
    $frm_setup.Close()
}

$ckb_vorname.add

$OnLoadForm_StateCorrection=                                                                    #Wenn GUI gestartet wird
{
	$frm_setup.WindowState = $InitialFormWindowState

$lsb_log.Items.Insert(0, "Ausführung wird gestartet...")                                        #Erstellt alle nötigen Ordner falls sie nicht bereits existieren
    if(test-path C:\AutoSetup){
        $lsb_log.Items.Insert(0, "C:\AutoSetup existiert bereits, überspringen...")
    }else{
        mkdir C:\AutoSetup
        $lsb_log.Items.Insert(0, "C:\AutoSetup wird erstellt")
    }if(test-path C:\AutoSetup\Bilder){
        $lsb_log.Items.Insert(0, "C:\AutoSetup\Bilder existiert bereits, überspringen...")
    }else{
        mkdir C:\AutoSetup\Bilder
        $lsb_log.Items.Insert(0, "C:\AutoSetup\Bilder wird erstellt")
    }if(test-path C:\AutoSetup\Bilder\Icons){
        $lsb_log.Items.Insert(0, "C:\AutoSetup existiert bereits, überspringen...")
    }else{
        mkdir C:\AutoSetup\Bilder\Icons
        $lsb_log.Items.Insert(0, "C:\AutoSetup\Bilder\Icons wird erstellt")
    }                                                                                            #Lädt alle Icons herunter falls sie nicht bereits existieren
    [string]$pfad = "leer"
    $pfad > C:\AutoSetup\hintergrund-pfad.txt
    if(Test-Path "C:\AutoSetup\Bilder\hintergrund.jpg"){}else{$wc.DownloadFile("https://i.pinimg.com/736x/60/c1/4a/60c14a43fb4745795b3b358868517e79.jpg", "C:\AutoSetup\Bilder\hintergrund.jpg")}
    if(Test-Path "C:\AutoSetup\Bilder\Icons\chocolatey.png"){}else{$wc.DownloadFile("https://raw.githubusercontent.com/saschazesiger/AutoSetup/main/Bilder/Icons/chocolatey.png", "C:\AutoSetup\Bilder\Icons\chocolatey.png")}
    if(Test-Path "C:\AutoSetup\Bilder\Icons\firefox.png"){}else{$wc.DownloadFile("https://raw.githubusercontent.com/saschazesiger/AutoSetup/main/Bilder/Icons/firefox.png", "C:\AutoSetup\Bilder\Icons\firefox.png")}
    if(Test-Path "C:\AutoSetup\Bilder\Icons\opera.png"){}else{$wc.DownloadFile("https://raw.githubusercontent.com/saschazesiger/AutoSetup/main/Bilder/Icons/opera.png", "C:\AutoSetup\Bilder\Icons\opera.png")}
    if(Test-Path "C:\AutoSetup\Bilder\Icons\chrome.png"){}else{$wc.DownloadFile("https://raw.githubusercontent.com/saschazesiger/AutoSetup/main/Bilder/Icons/chrome.png", "C:\AutoSetup\Bilder\Icons\chrome.png")}
    if(Test-Path "C:\AutoSetup\Bilder\Icons\winrar.png"){}else{$wc.DownloadFile("https://raw.githubusercontent.com/saschazesiger/AutoSetup/main/Bilder/Icons/winrar.png", "C:\AutoSetup\Bilder\Icons\winrar.png")}
    if(Test-Path "C:\AutoSetup\Bilder\Icons\7zip.png"){}else{$wc.DownloadFile("https://raw.githubusercontent.com/saschazesiger/AutoSetup/main/Bilder/Icons/7zip.png", "C:\AutoSetup\Bilder\Icons\7zip.png")}
    if(Test-Path "C:\AutoSetup\Bilder\Icons\teams.png"){}else{$wc.DownloadFile("https://raw.githubusercontent.com/saschazesiger/AutoSetup/main/Bilder/Icons/teams.png", "C:\AutoSetup\Bilder\Icons\teams.png")}
    if(Test-Path "C:\AutoSetup\Bilder\Icons\discord.png"){}else{$wc.DownloadFile("https://raw.githubusercontent.com/saschazesiger/AutoSetup/main/Bilder/Icons/discord.png", "C:\AutoSetup\Bilder\Icons\discord.png")}
    if(Test-Path "C:\AutoSetup\Bilder\Icons\zoom.png"){}else{$wc.DownloadFile("https://raw.githubusercontent.com/saschazesiger/AutoSetup/main/Bilder/Icons/zoom.png", "C:\AutoSetup\Bilder\Icons\zoom.png")}
    if(Test-Path "C:\AutoSetup\Bilder\Icons\paintnet.png"){}else{$wc.DownloadFile("https://raw.githubusercontent.com/saschazesiger/AutoSetup/main/Bilder/Icons/paintnet.png", "C:\AutoSetup\Bilder\Icons\paintnet.png")}
    if(Test-Path "C:\AutoSetup\Bilder\Icons\vlc.png"){}else{$wc.DownloadFile("https://raw.githubusercontent.com/saschazesiger/AutoSetup/main/Bilder/Icons/vlc.png", "C:\AutoSetup\Bilder\Icons\vlc.png")}
    if(Test-Path "C:\AutoSetup\Bilder\Icons\adobe.png"){}else{$wc.DownloadFile("https://raw.githubusercontent.com/saschazesiger/AutoSetup/main/Bilder/Icons/adobe.png", "C:\AutoSetup\Bilder\Icons\adobe.png")}
    if(Test-Path "C:\AutoSetup\Bilder\Icons\backup.png"){}else{$wc.DownloadFile("https://raw.githubusercontent.com/saschazesiger/AutoSetup/main/Bilder/Icons/backup.png", "C:\AutoSetup\Bilder\Icons\backup.png")}
    if(Test-Path "C:\AutoSetup\Bilder\Icons\geek.png"){}else{$wc.DownloadFile("https://raw.githubusercontent.com/saschazesiger/AutoSetup/main/Bilder/Icons/geek.png", "C:\AutoSetup\Bilder\Icons\geek.png")}
    if(Test-Path "C:\AutoSetup\Bilder\Icons\download.png"){}else{$wc.DownloadFile("https://raw.githubusercontent.com/saschazesiger/AutoSetup/main/Bilder/Icons/download.png", "C:\AutoSetup\Bilder\Icons\download.png")}

                                                                                                  #Alle Icons werden geladen
    $img_hintergrund.Image = [System.Drawing.Image]::Fromfile("C:\AutoSetup\Bilder\hintergrund.jpg")
    $img_choco.Image = [System.Drawing.Image]::Fromfile("C:\AutoSetup\Bilder\Icons\chocolatey.png")
    $img_firefox.Image = [System.Drawing.Image]::Fromfile("C:\AutoSetup\Bilder\Icons\firefox.png")
    $img_opera.Image = [System.Drawing.Image]::Fromfile("C:\AutoSetup\Bilder\Icons\chrome.png")
    $img_chrome.Image = [System.Drawing.Image]::Fromfile("C:\AutoSetup\Bilder\Icons\opera.png")
    $img_winrar.Image = [System.Drawing.Image]::Fromfile("C:\AutoSetup\Bilder\Icons\winrar.png")
    $img_7zip.Image = [System.Drawing.Image]::Fromfile("C:\AutoSetup\Bilder\Icons\7zip.png")
    $img_teams.Image = [System.Drawing.Image]::Fromfile("C:\AutoSetup\Bilder\Icons\teams.png")
    $img_discord.Image = [System.Drawing.Image]::Fromfile("C:\AutoSetup\Bilder\Icons\discord.png")
    $img_zoom.Image = [System.Drawing.Image]::Fromfile("C:\AutoSetup\Bilder\Icons\zoom.png")
    $img_paintnet.Image = [System.Drawing.Image]::Fromfile("C:\AutoSetup\Bilder\Icons\paintnet.png")
    $img_vlc.Image = [System.Drawing.Image]::Fromfile("C:\AutoSetup\Bilder\Icons\vlc.png")
    $img_adobe.Image = [System.Drawing.Image]::Fromfile("C:\AutoSetup\Bilder\Icons\adobe.png")
    $img_backup.Image = [System.Drawing.Image]::Fromfile("C:\AutoSetup\Bilder\Icons\backup.png")
    $img_geek.Image = [System.Drawing.Image]::Fromfile("C:\AutoSetup\Bilder\Icons\geek.png")
    $img_download.Image = [System.Drawing.Image]::Fromfile("C:\AutoSetup\Bilder\Icons\download.png")
    $wc.DownloadFile("https://community.chocolatey.org/install.ps1", "C:\AutoSetup\choco-install.ps1")

    #if(test-path C:\AutoSetup\hintergrund-pfad.txt){
    #    $pfad = Get-Content -Path C:\AutoSetup\hintergrund-pfad.txt
    #    $img_hintergrund.Image = [System.Drawing.Image]::Fromfile($pfad)
    #}


# Costum Code wird unterhalb eingefügt -->


##########################################


}

#----------------------------------------------
#region Icons
#$img_choco.BorderStyle = 0
#$img_choco.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 16
$System_Drawing_Point.Y = 36
$img_choco.Location = $System_Drawing_Point
#$img_choco.Name = "img_choco"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 20
$img_choco.Size = $System_Drawing_Size
#$img_choco.TabIndex = 28
#$img_choco.TabStop = $False
$img_choco.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::Zoom
$frm_setup.Controls.Add($img_choco)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 16
$System_Drawing_Point.Y = 78
$img_firefox.Location = $System_Drawing_Point
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 20
$img_firefox.Size = $System_Drawing_Size
$img_firefox.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::Zoom
$frm_setup.Controls.Add($img_firefox)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 16
$System_Drawing_Point.Y = 100
$img_chrome.Location = $System_Drawing_Point
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 20
$img_chrome.Size = $System_Drawing_Size
$img_chrome.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::Zoom
$frm_setup.Controls.Add($img_chrome)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 16
$System_Drawing_Point.Y = 120
$img_opera.Location = $System_Drawing_Point
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 20
$img_opera.Size = $System_Drawing_Size
$img_opera.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::Zoom
$frm_setup.Controls.Add($img_opera)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 16
$System_Drawing_Point.Y = 171
$img_winrar.Location = $System_Drawing_Point
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 20
$img_winrar.Size = $System_Drawing_Size
$img_winrar.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::Zoom
$frm_setup.Controls.Add($img_winrar)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 16
$System_Drawing_Point.Y = 192
$img_7zip.Location = $System_Drawing_Point
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 20
$img_7zip.Size = $System_Drawing_Size
$img_7zip.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::Zoom
$frm_setup.Controls.Add($img_7zip)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 16
$System_Drawing_Point.Y = 236
$img_teams.Location = $System_Drawing_Point
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 20
$img_teams.Size = $System_Drawing_Size
$img_teams.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::Zoom
$frm_setup.Controls.Add($img_teams)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 16
$System_Drawing_Point.Y = 255
$img_discord.Location = $System_Drawing_Point
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 20
$img_discord.Size = $System_Drawing_Size
$img_discord.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::Zoom
$frm_setup.Controls.Add($img_discord)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 16
$System_Drawing_Point.Y = 276
$img_zoom.Location = $System_Drawing_Point
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 20
$img_zoom.Size = $System_Drawing_Size
$img_zoom.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::Zoom
$frm_setup.Controls.Add($img_zoom)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 16
$System_Drawing_Point.Y = 320
$img_paintnet.Location = $System_Drawing_Point
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 20
$img_paintnet.Size = $System_Drawing_Size
$img_paintnet.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::Zoom
$frm_setup.Controls.Add($img_paintnet)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 16
$System_Drawing_Point.Y = 339
$img_vlc.Location = $System_Drawing_Point
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 20
$img_vlc.Size = $System_Drawing_Size
$img_vlc.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::Zoom
$frm_setup.Controls.Add($img_vlc)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 16
$System_Drawing_Point.Y = 360
$img_adobe.Location = $System_Drawing_Point
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 20
$img_adobe.Size = $System_Drawing_Size
$img_adobe.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::Zoom
$frm_setup.Controls.Add($img_adobe)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 16
$System_Drawing_Point.Y = 404
$img_backup.Location = $System_Drawing_Point
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 20
$img_backup.Size = $System_Drawing_Size
$img_backup.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::Zoom
$frm_setup.Controls.Add($img_backup)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 16
$System_Drawing_Point.Y = 424
$img_geek.Location = $System_Drawing_Point
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 20
$img_geek.Size = $System_Drawing_Size
$img_geek.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::Zoom
$frm_setup.Controls.Add($img_geek)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 16
$System_Drawing_Point.Y = 445
$img_download.Location = $System_Drawing_Point
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 20
$img_download.Size = $System_Drawing_Size
$img_download.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::Zoom
$frm_setup.Controls.Add($img_download)

#endregion Icons

#region Generated Form Code
$frm_setup.BackColor = [System.Drawing.Color]::FromArgb(255,255,255,255)
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 487
$System_Drawing_Size.Width = 1004
$frm_setup.ClientSize = $System_Drawing_Size
$frm_setup.DataBindings.DefaultDataSourceUpdateMode = 0
$frm_setup.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9,0,3,1)
$frm_setup.Name = "frm_setup"
$frm_setup.Text = "AutoSetup "


$btn_zuruecksetzen.DataBindings.DefaultDataSourceUpdateMode = 0
$btn_zuruecksetzen.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9.75,0,3,1)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 717
$System_Drawing_Point.Y = 419
$btn_zuruecksetzen.Location = $System_Drawing_Point
$btn_zuruecksetzen.Name = "btn_zuruecksetzen"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 52
$System_Drawing_Size.Width = 273
$btn_zuruecksetzen.Size = $System_Drawing_Size
$btn_zuruecksetzen.TabIndex = 41
$btn_zuruecksetzen.Text = "Programm schliessen"
$btn_zuruecksetzen.UseVisualStyleBackColor = $True
$btn_zuruecksetzen.add_Click($btn_zuruecksetzen_OnClick)

$frm_setup.Controls.Add($btn_zuruecksetzen)


$grb_wiederherstellung.DataBindings.DefaultDataSourceUpdateMode = 0
$grb_wiederherstellung.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9.75,1,3,1)
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 717
$System_Drawing_Point.Y = 121
$grb_wiederherstellung.Location = $System_Drawing_Point
$grb_wiederherstellung.Name = "grb_wiederherstellung"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 119
$System_Drawing_Size.Width = 273
$grb_wiederherstellung.Size = $System_Drawing_Size
$grb_wiederherstellung.TabIndex = 40
$grb_wiederherstellung.TabStop = $False
$grb_wiederherstellung.Text = "Wiederherstellung"

$frm_setup.Controls.Add($grb_wiederherstellung)

$ckb_nachw.DataBindings.DefaultDataSourceUpdateMode = 0
$ckb_nachw.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9,0,3,1)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 6
$System_Drawing_Point.Y = 70
$ckb_nachw.Location = $System_Drawing_Point
$ckb_nachw.Name = "ckb_nachw"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 35
$System_Drawing_Size.Width = 261
$ckb_nachw.Size = $System_Drawing_Size
$ckb_nachw.TabIndex = 1
$ckb_nachw.Text = "Wiederherstellungspunkt nach Ausführung erstellen"
$ckb_nachw.UseVisualStyleBackColor = $True

$grb_wiederherstellung.Controls.Add($ckb_nachw)


$ckb_wvorher.DataBindings.DefaultDataSourceUpdateMode = 0
$ckb_wvorher.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9,0,3,1)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 7
$System_Drawing_Point.Y = 29
$ckb_wvorher.Location = $System_Drawing_Point
$ckb_wvorher.Name = "ckb_wvorher"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 42
$System_Drawing_Size.Width = 259
$ckb_wvorher.Size = $System_Drawing_Size
$ckb_wvorher.TabIndex = 0
$ckb_wvorher.Text = "Wiederherstellungspunkt vor Ausführung erstellen"
$ckb_wvorher.UseVisualStyleBackColor = $True

$grb_wiederherstellung.Controls.Add($ckb_wvorher)



$grb_farbe.DataBindings.DefaultDataSourceUpdateMode = 0
$grb_farbe.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9.75,1,3,1)
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 717
$System_Drawing_Point.Y = 15
$grb_farbe.Location = $System_Drawing_Point
$grb_farbe.Name = "grb_farbe"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 99
$System_Drawing_Size.Width = 273
$grb_farbe.Size = $System_Drawing_Size
$grb_farbe.TabIndex = 39
$grb_farbe.TabStop = $False
$grb_farbe.Text = "Farben"

$frm_setup.Controls.Add($grb_farbe)

$ckb_darkmode.DataBindings.DefaultDataSourceUpdateMode = 0
$ckb_darkmode.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9,0,3,1)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 7
$System_Drawing_Point.Y = 68
$ckb_darkmode.Location = $System_Drawing_Point
$ckb_darkmode.Name = "ckb_darkmode"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 24
$System_Drawing_Size.Width = 199
$ckb_darkmode.Size = $System_Drawing_Size
$ckb_darkmode.TabIndex = 2
$ckb_darkmode.Text = "Darkmode einschalten"
$ckb_darkmode.UseVisualStyleBackColor = $True

$grb_farbe.Controls.Add($ckb_darkmode)


$btn_standardfarbeloeschen.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 241
$System_Drawing_Point.Y = 20
$btn_standardfarbeloeschen.Location = $System_Drawing_Point
$btn_standardfarbeloeschen.Name = "btn_standardfarbeloeschen"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 42
$System_Drawing_Size.Width = 25
$btn_standardfarbeloeschen.Size = $System_Drawing_Size
$btn_standardfarbeloeschen.TabIndex = 1
$btn_standardfarbeloeschen.Text = "X"
$btn_standardfarbeloeschen.UseVisualStyleBackColor = $True
$btn_standardfarbeloeschen.add_Click($btn_standardfarbeloeschen_OnClick)

$grb_farbe.Controls.Add($btn_standardfarbeloeschen)


$btn_standardfarbe.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 6
$System_Drawing_Point.Y = 20
$btn_standardfarbe.Location = $System_Drawing_Point
$btn_standardfarbe.Name = "btn_standardfarbe"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 42
$System_Drawing_Size.Width = 229
$btn_standardfarbe.Size = $System_Drawing_Size
$btn_standardfarbe.TabIndex = 0
$btn_standardfarbe.Text = "Standard Farbe auswählen"
$btn_standardfarbe.UseVisualStyleBackColor = $True
$btn_standardfarbe.add_Click($btn_standardfarbe_OnClick)
$btn_standardfarbe.BackColor = "white"

$grb_farbe.Controls.Add($btn_standardfarbe)



$grb_applikation.DataBindings.DefaultDataSourceUpdateMode = 0
$grb_applikation.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9.75,1,3,1)
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 12
$System_Drawing_Point.Y = 15
$grb_applikation.Location = $System_Drawing_Point
$grb_applikation.Name = "grb_applikation"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 460
$System_Drawing_Size.Width = 217
$grb_applikation.Size = $System_Drawing_Size
$grb_applikation.TabIndex = 38
$grb_applikation.TabStop = $False
$grb_applikation.Text = "Applikationen installieren"

$frm_setup.Controls.Add($grb_applikation)

$ckb_chocolatey.DataBindings.DefaultDataSourceUpdateMode = 0
$ckb_chocolatey.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9.75,0,3,1)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 30
$System_Drawing_Point.Y = 21
$ckb_chocolatey.Location = $System_Drawing_Point
$ckb_chocolatey.Name = "ckb_chocolatey"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 24
$System_Drawing_Size.Width = 180
$ckb_chocolatey.Size = $System_Drawing_Size
$ckb_chocolatey.TabIndex = 32
$ckb_chocolatey.Text = "Chocolatey"
$ckb_chocolatey.UseVisualStyleBackColor = $True

$grb_applikation.Controls.Add($ckb_chocolatey)

$lbl_browser.DataBindings.DefaultDataSourceUpdateMode = 0
$lbl_browser.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",12,1,3,1)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 10
$System_Drawing_Point.Y = 46
$lbl_browser.Location = $System_Drawing_Point
$lbl_browser.Name = "lbl_browser"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 21
$System_Drawing_Size.Width = 100
$lbl_browser.Size = $System_Drawing_Size
$lbl_browser.TabIndex = 0
$lbl_browser.Text = "Browser"

$grb_applikation.Controls.Add($lbl_browser)


$ckb_firefox.DataBindings.DefaultDataSourceUpdateMode = 0
$ckb_firefox.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9,0,3,1)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 30
$System_Drawing_Point.Y = 64
$ckb_firefox.Location = $System_Drawing_Point
$ckb_firefox.Name = "ckb_firefox"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 24
$System_Drawing_Size.Width = 104
$ckb_firefox.Size = $System_Drawing_Size
$ckb_firefox.TabIndex = 2
$ckb_firefox.Text = "Firefox"
$ckb_firefox.UseVisualStyleBackColor = $True

$grb_applikation.Controls.Add($ckb_firefox)


$ckb_opera.DataBindings.DefaultDataSourceUpdateMode = 0
$ckb_opera.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9,0,3,1)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 30
$System_Drawing_Point.Y = 85
$ckb_opera.Location = $System_Drawing_Point
$ckb_opera.Name = "ckb_opera"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 24
$System_Drawing_Size.Width = 149
$ckb_opera.Size = $System_Drawing_Size
$ckb_opera.TabIndex = 3
$ckb_opera.Text = "Opera"
$ckb_opera.UseVisualStyleBackColor = $True

$grb_applikation.Controls.Add($ckb_opera)


$ckb_chrome.DataBindings.DefaultDataSourceUpdateMode = 0
$ckb_chrome.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9,0,3,1)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 30
$System_Drawing_Point.Y = 105
$ckb_chrome.Location = $System_Drawing_Point
$ckb_chrome.Name = "ckb_chrome"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 24
$System_Drawing_Size.Width = 147
$ckb_chrome.Size = $System_Drawing_Size
$ckb_chrome.TabIndex = 1
$ckb_chrome.Text = "Google Chrome"
$ckb_chrome.UseVisualStyleBackColor = $True

$grb_applikation.Controls.Add($ckb_chrome)

$lbl_archiv.DataBindings.DefaultDataSourceUpdateMode = 0
$lbl_archiv.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",12,1,3,1)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 10
$System_Drawing_Point.Y = 135
$lbl_archiv.Location = $System_Drawing_Point
$lbl_archiv.Name = "lbl_archiv"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 21
$System_Drawing_Size.Width = 100
$lbl_archiv.Size = $System_Drawing_Size
$lbl_archiv.TabIndex = 5
$lbl_archiv.Text = "Archiv"

$grb_applikation.Controls.Add($lbl_archiv)


$ckb_winrar.DataBindings.DefaultDataSourceUpdateMode = 0
$ckb_winrar.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9,0,3,1)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 30
$System_Drawing_Point.Y = 156
$ckb_winrar.Location = $System_Drawing_Point
$ckb_winrar.Name = "ckb_winrar"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 21
$System_Drawing_Size.Width = 104
$ckb_winrar.Size = $System_Drawing_Size
$ckb_winrar.TabIndex = 6
$ckb_winrar.Text = "WinRAR"
$ckb_winrar.UseVisualStyleBackColor = $True

$grb_applikation.Controls.Add($ckb_winrar)


$ckb_7zip.DataBindings.DefaultDataSourceUpdateMode = 0
$ckb_7zip.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9,0,3,1)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 30
$System_Drawing_Point.Y = 177
$ckb_7zip.Location = $System_Drawing_Point
$ckb_7zip.Name = "ckb_7zip"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 24
$System_Drawing_Size.Width = 104
$ckb_7zip.Size = $System_Drawing_Size
$ckb_7zip.TabIndex = 7
$ckb_7zip.Text = "7Zip"
$ckb_7zip.UseVisualStyleBackColor = $True

$grb_applikation.Controls.Add($ckb_7zip)

$lbl_chat.DataBindings.DefaultDataSourceUpdateMode = 0
$lbl_chat.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",12,1,3,1)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 10
$System_Drawing_Point.Y = 204
$lbl_chat.Location = $System_Drawing_Point
$lbl_chat.Name = "lbl_chat"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 21
$System_Drawing_Size.Width = 100
$lbl_chat.Size = $System_Drawing_Size
$lbl_chat.TabIndex = 8
$lbl_chat.Text = "Chat"

$grb_applikation.Controls.Add($lbl_chat)


$ckb_download.DataBindings.DefaultDataSourceUpdateMode = 0
$ckb_download.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9,0,3,1)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 30
$System_Drawing_Point.Y = 430
$ckb_download.Location = $System_Drawing_Point
$ckb_download.Name = "ckb_download"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 24
$System_Drawing_Size.Width = 156
$ckb_download.Size = $System_Drawing_Size
$ckb_download.TabIndex = 19
$ckb_download.Text = "Download Manager"
$ckb_download.UseVisualStyleBackColor = $True

$grb_applikation.Controls.Add($ckb_download)


$ckb_backup.DataBindings.DefaultDataSourceUpdateMode = 0
$ckb_backup.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9,0,3,1)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 30
$System_Drawing_Point.Y = 389
$ckb_backup.Location = $System_Drawing_Point
$ckb_backup.Name = "ckb_backup"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 24
$System_Drawing_Size.Width = 183
$ckb_backup.Size = $System_Drawing_Size
$ckb_backup.TabIndex = 21
$ckb_backup.Text = "Google Backup and Sync"
$ckb_backup.UseVisualStyleBackColor = $True

$grb_applikation.Controls.Add($ckb_backup)


$ckb_geek.DataBindings.DefaultDataSourceUpdateMode = 0
$ckb_geek.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9,0,3,1)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 30
$System_Drawing_Point.Y = 409
$ckb_geek.Location = $System_Drawing_Point
$ckb_geek.Name = "ckb_geek"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 24
$System_Drawing_Size.Width = 148
$ckb_geek.Size = $System_Drawing_Size
$ckb_geek.TabIndex = 18
$ckb_geek.Text = "Geek Uninstaller"
$ckb_geek.UseVisualStyleBackColor = $True

$grb_applikation.Controls.Add($ckb_geek)


$ckb_teams.DataBindings.DefaultDataSourceUpdateMode = 0
$ckb_teams.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9,0,3,1)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 30
$System_Drawing_Point.Y = 221
$ckb_teams.Location = $System_Drawing_Point
$ckb_teams.Name = "ckb_teams"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 24
$System_Drawing_Size.Width = 104
$ckb_teams.Size = $System_Drawing_Size
$ckb_teams.TabIndex = 9
$ckb_teams.Text = "Teams"
$ckb_teams.UseVisualStyleBackColor = $True

$grb_applikation.Controls.Add($ckb_teams)


$ckb_discord.DataBindings.DefaultDataSourceUpdateMode = 0
$ckb_discord.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9,0,3,1)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 30
$System_Drawing_Point.Y = 240
$ckb_discord.Location = $System_Drawing_Point
$ckb_discord.Name = "ckb_discord"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 24
$System_Drawing_Size.Width = 104
$ckb_discord.Size = $System_Drawing_Size
$ckb_discord.TabIndex = 10
$ckb_discord.Text = "Discord"
$ckb_discord.UseVisualStyleBackColor = $True

$grb_applikation.Controls.Add($ckb_discord)


$ckb_zoom.DataBindings.DefaultDataSourceUpdateMode = 0
$ckb_zoom.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9,0,3,1)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 30
$System_Drawing_Point.Y = 261
$ckb_zoom.Location = $System_Drawing_Point
$ckb_zoom.Name = "ckb_zoom"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 24
$System_Drawing_Size.Width = 104
$ckb_zoom.Size = $System_Drawing_Size
$ckb_zoom.TabIndex = 11
$ckb_zoom.Text = "Zoom"
$ckb_zoom.UseVisualStyleBackColor = $True

$grb_applikation.Controls.Add($ckb_zoom)

$lbl_sonstige.DataBindings.DefaultDataSourceUpdateMode = 0
$lbl_sonstige.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",12,1,3,1)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 10
$System_Drawing_Point.Y = 370
$lbl_sonstige.Location = $System_Drawing_Point
$lbl_sonstige.Name = "lbl_sonstige"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 100
$lbl_sonstige.Size = $System_Drawing_Size
$lbl_sonstige.TabIndex = 17
$lbl_sonstige.Text = "Sonstige"
$lbl_sonstige.add_Click($handler_label8_Click)

$grb_applikation.Controls.Add($lbl_sonstige)

$lbl_medien.DataBindings.DefaultDataSourceUpdateMode = 0
$lbl_medien.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",12,1,3,1)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 10
$System_Drawing_Point.Y = 288
$lbl_medien.Location = $System_Drawing_Point
$lbl_medien.Name = "lbl_medien"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 21
$System_Drawing_Size.Width = 100
$lbl_medien.Size = $System_Drawing_Size
$lbl_medien.TabIndex = 12
$lbl_medien.Text = "Medien"

$grb_applikation.Controls.Add($lbl_medien)


$ckb_adobe.DataBindings.DefaultDataSourceUpdateMode = 0
$ckb_adobe.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9,0,3,1)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 30
$System_Drawing_Point.Y = 345
$ckb_adobe.Location = $System_Drawing_Point
$ckb_adobe.Name = "ckb_adobe"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 24
$System_Drawing_Size.Width = 133
$ckb_adobe.Size = $System_Drawing_Size
$ckb_adobe.TabIndex = 15
$ckb_adobe.Text = "Adobe Reader"
$ckb_adobe.UseVisualStyleBackColor = $True

$grb_applikation.Controls.Add($ckb_adobe)


$ckb_paintnet.DataBindings.DefaultDataSourceUpdateMode = 0
$ckb_paintnet.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9,0,3,1)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 30
$System_Drawing_Point.Y = 305
$ckb_paintnet.Location = $System_Drawing_Point
$ckb_paintnet.Name = "ckb_paintnet"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 24
$System_Drawing_Size.Width = 104
$ckb_paintnet.Size = $System_Drawing_Size
$ckb_paintnet.TabIndex = 13
$ckb_paintnet.Text = "Paint.NET"
$ckb_paintnet.UseVisualStyleBackColor = $True

$grb_applikation.Controls.Add($ckb_paintnet)


$ckb_vlc.DataBindings.DefaultDataSourceUpdateMode = 0
$ckb_vlc.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9,0,3,1)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 30
$System_Drawing_Point.Y = 324
$ckb_vlc.Location = $System_Drawing_Point
$ckb_vlc.Name = "ckb_vlc"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 24
$System_Drawing_Size.Width = 104
$ckb_vlc.Size = $System_Drawing_Size
$ckb_vlc.TabIndex = 14
$ckb_vlc.Text = "VLC"
$ckb_vlc.UseVisualStyleBackColor = $True

$grb_applikation.Controls.Add($ckb_vlc)



$grb_benutzer.DataBindings.DefaultDataSourceUpdateMode = 0
$grb_benutzer.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9.75,1,3,1)
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 479
$System_Drawing_Point.Y = 96
$grb_benutzer.Location = $System_Drawing_Point
$grb_benutzer.Name = "grb_benutzer"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 219
$System_Drawing_Size.Width = 228
$grb_benutzer.Size = $System_Drawing_Size
$grb_benutzer.TabIndex = 37
$grb_benutzer.TabStop = $False
$grb_benutzer.Text = "Neuer Benutzer anlegen"

$frm_setup.Controls.Add($grb_benutzer)

$ckb_user.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 181
$System_Drawing_Point.Y = -1
$ckb_user.Location = $System_Drawing_Point
$ckb_user.Name = "ckb_user"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 19
$System_Drawing_Size.Width = 15
$ckb_user.Size = $System_Drawing_Size
$ckb_user.TabIndex = 10
$ckb_user.UseVisualStyleBackColor = $True

$grb_benutzer.Controls.Add($ckb_user)

$txb_nachname.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9,0,3,1)
$txb_nachname.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 112
$System_Drawing_Point.Y = 39
$txb_nachname.Location = $System_Drawing_Point
$txb_nachname.Name = "txb_nachname"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 22
$System_Drawing_Size.Width = 103
$txb_nachname.Size = $System_Drawing_Size
$txb_nachname.TabIndex = 9

$grb_benutzer.Controls.Add($txb_nachname)

$lbl_nachname.DataBindings.DefaultDataSourceUpdateMode = 0
$lbl_nachname.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9,0,3,1)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 111
$System_Drawing_Point.Y = 21
$lbl_nachname.Location = $System_Drawing_Point
$lbl_nachname.Name = "lbl_nachname"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 100
$lbl_nachname.Size = $System_Drawing_Size
$lbl_nachname.TabIndex = 8
$lbl_nachname.Text = "Nachname:"

$grb_benutzer.Controls.Add($lbl_nachname)


$ckb_passaendern.DataBindings.DefaultDataSourceUpdateMode = 0
$ckb_passaendern.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",8.25,0,3,1)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 7
$System_Drawing_Point.Y = 180
$ckb_passaendern.Location = $System_Drawing_Point
$ckb_passaendern.Name = "ckb_passaendern"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 24
$System_Drawing_Size.Width = 219
$ckb_passaendern.Size = $System_Drawing_Size
$ckb_passaendern.TabIndex = 7
$ckb_passaendern.Text = "Passwort läuft nicht ab"
$ckb_passaendern.UseVisualStyleBackColor = $True

$grb_benutzer.Controls.Add($ckb_passaendern)


$ckb_aktiv.DataBindings.DefaultDataSourceUpdateMode = 0
$ckb_aktiv.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9,0,3,1)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 7
$System_Drawing_Point.Y = 151
$ckb_aktiv.Location = $System_Drawing_Point
$ckb_aktiv.Name = "ckb_aktiv"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 24
$System_Drawing_Size.Width = 104
$ckb_aktiv.Size = $System_Drawing_Size
$ckb_aktiv.TabIndex = 6
$ckb_aktiv.Text = "Aktiv"
$ckb_aktiv.UseVisualStyleBackColor = $True
$ckb_aktiv.Checked = $true

$grb_benutzer.Controls.Add($ckb_aktiv)

$txb_pass.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9,0,3,1)
$txb_pass.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 7
$System_Drawing_Point.Y = 123
$txb_pass.Location = $System_Drawing_Point
$txb_pass.Name = "txb_pass"
$txb_pass.PasswordChar = '*'
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 22
$System_Drawing_Size.Width = 208
$txb_pass.Size = $System_Drawing_Size
$txb_pass.TabIndex = 5

$grb_benutzer.Controls.Add($txb_pass)

$lbl_pass.DataBindings.DefaultDataSourceUpdateMode = 0
$lbl_pass.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9,0,3,1)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 5
$System_Drawing_Point.Y = 107
$lbl_pass.Location = $System_Drawing_Point
$lbl_pass.Name = "lbl_pass"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 100
$lbl_pass.Size = $System_Drawing_Size
$lbl_pass.TabIndex = 4
$lbl_pass.Text = "Passwort:"

$grb_benutzer.Controls.Add($lbl_pass)

$txb_user.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9,0,3,1)
$txb_user.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 7
$System_Drawing_Point.Y = 82
$txb_user.Location = $System_Drawing_Point
$txb_user.Name = "txb_user"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 22
$System_Drawing_Size.Width = 208
$txb_user.Size = $System_Drawing_Size
$txb_user.TabIndex = 3

$grb_benutzer.Controls.Add($txb_user)

$lbl_user.DataBindings.DefaultDataSourceUpdateMode = 0
$lbl_user.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9,0,3,1)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 5
$System_Drawing_Point.Y = 64
$lbl_user.Location = $System_Drawing_Point
$lbl_user.Name = "lbl_user"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 100
$lbl_user.Size = $System_Drawing_Size
$lbl_user.TabIndex = 2
$lbl_user.Text = "Anmeldename:"

$grb_benutzer.Controls.Add($lbl_user)

$txb_vorname.DataBindings.DefaultDataSourceUpdateMode = 0
$txb_vorname.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9,0,3,1)
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 6
$System_Drawing_Point.Y = 39
$txb_vorname.Location = $System_Drawing_Point
$txb_vorname.Name = "txb_vorname"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 22
$System_Drawing_Size.Width = 99
$txb_vorname.Size = $System_Drawing_Size
$txb_vorname.TabIndex = 1

$grb_benutzer.Controls.Add($txb_vorname)

$lbl_vorname.DataBindings.DefaultDataSourceUpdateMode = 0
$lbl_vorname.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9,0,3,1)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 5
$System_Drawing_Point.Y = 21
$lbl_vorname.Location = $System_Drawing_Point
$lbl_vorname.Name = "lbl_vorname"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 100
$lbl_vorname.Size = $System_Drawing_Size
$lbl_vorname.TabIndex = 0
$lbl_vorname.Text = "Vorname:"
$lbl_vorname.add_Click($handler_label2_Click)

$grb_benutzer.Controls.Add($lbl_vorname)



$grb_name.DataBindings.DefaultDataSourceUpdateMode = 0
$grb_name.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9.75,1,3,1)
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 478
$System_Drawing_Point.Y = 15
$grb_name.Location = $System_Drawing_Point
$grb_name.Name = "grb_name"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 74
$System_Drawing_Size.Width = 229
$grb_name.Size = $System_Drawing_Size
$grb_name.TabIndex = 36
$grb_name.TabStop = $False
$grb_name.Text = "PC Name ändern"

$frm_setup.Controls.Add($grb_name)

$ckb_name.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 135
$System_Drawing_Point.Y = -3
$ckb_name.Location = $System_Drawing_Point
$ckb_name.Name = "ckb_name"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 24
$System_Drawing_Size.Width = 18
$ckb_name.Size = $System_Drawing_Size
$ckb_name.TabIndex = 36
$ckb_name.UseVisualStyleBackColor = $True

$grb_name.Controls.Add($ckb_name)

$txb_name.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9,0,3,1)
$txb_name.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 7
$System_Drawing_Point.Y = 41
$txb_name.Location = $System_Drawing_Point
$txb_name.Name = "txb_name"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 22
$System_Drawing_Size.Width = 216
$txb_name.Size = $System_Drawing_Size
$txb_name.TabIndex = 35

$grb_name.Controls.Add($txb_name)

$lbl_name.DataBindings.DefaultDataSourceUpdateMode = 0
$lbl_name.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9,0,3,1)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 6
$System_Drawing_Point.Y = 17
$lbl_name.Location = $System_Drawing_Point
$lbl_name.Name = "lbl_name"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 137
$lbl_name.Size = $System_Drawing_Size
$lbl_name.TabIndex = 34
$lbl_name.Text = "Neuer Name eingeben:"

$grb_name.Controls.Add($lbl_name)



$checkBox1.DataBindings.DefaultDataSourceUpdateMode = 0
$checkBox1.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9.75,1,3,1)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 630
$System_Drawing_Point.Y = 56
$checkBox1.Location = $System_Drawing_Point
$checkBox1.Name = "checkBox1"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 24
$System_Drawing_Size.Width = 152
$checkBox1.Size = $System_Drawing_Size
$checkBox1.TabIndex = 33
$checkBox1.UseVisualStyleBackColor = $True

$frm_setup.Controls.Add($checkBox1)

$lsb_log.DataBindings.DefaultDataSourceUpdateMode = 0
$lsb_log.FormattingEnabled = $True
$lsb_log.ItemHeight = 15
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 235
$System_Drawing_Point.Y = 321
$lsb_log.Location = $System_Drawing_Point
$lsb_log.Name = "lsb_log"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 154
$System_Drawing_Size.Width = 472
$lsb_log.Size = $System_Drawing_Size
$lsb_log.TabIndex = 31
$lsb_log.add_SelectedIndexChanged($handler_lsb_log_SelectedIndexChanged)

$frm_setup.Controls.Add($lsb_log)


$btn_laden.DataBindings.DefaultDataSourceUpdateMode = 0
$btn_laden.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9.75,0,3,1)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 717
$System_Drawing_Point.Y = 361
$btn_laden.Location = $System_Drawing_Point
$btn_laden.Name = "btn_laden"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 52
$System_Drawing_Size.Width = 273
$btn_laden.Size = $System_Drawing_Size
$btn_laden.TabIndex = 25
$btn_laden.Text = "Konfiguration laden"
$btn_laden.UseVisualStyleBackColor = $True
$btn_laden.add_Click($btn_laden_OnClick)

$frm_setup.Controls.Add($btn_laden)


$btn_speichern.DataBindings.DefaultDataSourceUpdateMode = 0
$btn_speichern.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9.75,0,3,1)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 717
$System_Drawing_Point.Y = 303
$btn_speichern.Location = $System_Drawing_Point
$btn_speichern.Name = "btn_speichern"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 52
$System_Drawing_Size.Width = 273
$btn_speichern.Size = $System_Drawing_Size
$btn_speichern.TabIndex = 24
$btn_speichern.Text = "Konfiguration speichern"
$btn_speichern.UseVisualStyleBackColor = $True
$btn_speichern.add_Click($btn_speichern_OnClick)

$frm_setup.Controls.Add($btn_speichern)


$btn_anwenden.DataBindings.DefaultDataSourceUpdateMode = 0
$btn_anwenden.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",12,1,3,1)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 717
$System_Drawing_Point.Y = 246
$btn_anwenden.Location = $System_Drawing_Point
$btn_anwenden.Name = "btn_anwenden"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 52
$System_Drawing_Size.Width = 273
$btn_anwenden.Size = $System_Drawing_Size
$btn_anwenden.TabIndex = 23
$btn_anwenden.Text = "Anwenden"
$btn_anwenden.UseVisualStyleBackColor = $True
$btn_anwenden.add_Click($btn_anwenden_OnClick)

$frm_setup.Controls.Add($btn_anwenden)


$grb_hintergrund.DataBindings.DefaultDataSourceUpdateMode = 0
$grb_hintergrund.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9.75,1,3,1)
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 235
$System_Drawing_Point.Y = 15
$grb_hintergrund.Location = $System_Drawing_Point
$grb_hintergrund.Name = "grb_hintergrund"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 300
$System_Drawing_Size.Width = 237
$grb_hintergrund.Size = $System_Drawing_Size
$grb_hintergrund.TabIndex = 35
$grb_hintergrund.TabStop = $False
$grb_hintergrund.Text = "Hintergrundbild festlegen"

$frm_setup.Controls.Add($grb_hintergrund)
$lbl_hintergrund.DataBindings.DefaultDataSourceUpdateMode = 0
$lbl_hintergrund.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9,0,3,1)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 5
$System_Drawing_Point.Y = 20
$lbl_hintergrund.Location = $System_Drawing_Point
$lbl_hintergrund.Name = "lbl_hintergrund"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 195
$lbl_hintergrund.Size = $System_Drawing_Size
$lbl_hintergrund.TabIndex = 27
$lbl_hintergrund.Text = "URL einer JPG Datei einfügen:"
$lbl_hintergrund.add_Click($handler_lbl_hintergrund_Click)

$grb_hintergrund.Controls.Add($lbl_hintergrund)

$txb_url.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9,0,3,1)
$txb_url.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 8
$System_Drawing_Point.Y = 48
$txb_url.Location = $System_Drawing_Point
$txb_url.Name = "txb_url"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 22
$System_Drawing_Size.Width = 223
$txb_url.Size = $System_Drawing_Size
$txb_url.TabIndex = 29
$txb_url.add_TextChanged($handler_txb_url_TextChanged)

$grb_hintergrund.Controls.Add($txb_url)


$btn_hintergrund.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 8
$System_Drawing_Point.Y = 80
$btn_hintergrund.Location = $System_Drawing_Point
$btn_hintergrund.Name = "btn_hintergrund"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 33
$System_Drawing_Size.Width = 223
$btn_hintergrund.Size = $System_Drawing_Size
$btn_hintergrund.TabIndex = 30
$btn_hintergrund.Text = "Bild laden"
$btn_hintergrund.UseVisualStyleBackColor = $True
$btn_hintergrund.add_Click($btn_hintergrund_OnClick)

$grb_hintergrund.Controls.Add($btn_hintergrund)


$ckb_hintergrund.DataBindings.DefaultDataSourceUpdateMode = 0
$ckb_hintergrund.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9.75,1,3,1)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 191
$System_Drawing_Point.Y = -3
$ckb_hintergrund.Location = $System_Drawing_Point
$ckb_hintergrund.Name = "ckb_hintergrund"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 24
$System_Drawing_Size.Width = 18
$ckb_hintergrund.Size = $System_Drawing_Size
$ckb_hintergrund.TabIndex = 26
$ckb_hintergrund.UseVisualStyleBackColor = $True

$grb_hintergrund.Controls.Add($ckb_hintergrund)


$img_hintergrund.BorderStyle = 0
$img_hintergrund.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 8
$System_Drawing_Point.Y = 120
$img_hintergrund.Location = $System_Drawing_Point
$img_hintergrund.Name = "img_hintergrund"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 166
$System_Drawing_Size.Width = 223
$img_hintergrund.Size = $System_Drawing_Size
$img_hintergrund.TabIndex = 28
$img_hintergrund.TabStop = $False
$img_hintergrund.add_Click($handler_pictureBox2_Click)
$img_hintergrund.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::Zoom
$grb_hintergrund.Controls.Add($img_hintergrund)


#endregion Generated Form Code



#Save the initial state of the form
$InitialFormWindowState = $frm_setup.WindowState
#Init the OnLoad event to correct the initial state of the form
$frm_setup.add_Load($OnLoadForm_StateCorrection)
#Show the Form
$frm_setup.ShowDialog()| Out-Null

} #End Function


GenerateForm

 
