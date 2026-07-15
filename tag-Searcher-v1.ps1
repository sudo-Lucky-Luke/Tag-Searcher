# ==========================
# Einstellungen
# ==========================

$File   = "C:\Temp\Config.xml"
$Tag    = "Username"
$Action = "Read"      # Read | Delete | Replace
$Value  = "Admin"     # Nur bei Replace

# ==========================

[xml]$Xml = Get-Content $File

$Nodes = $Xml.SelectNodes("//$Tag")

switch ($Action) {

    "Read" {
        $Nodes.InnerText
    }

    "Delete" {
        foreach ($Node in $Nodes) {
            $Node.InnerText = ""
        }
        $Xml.Save($File)
    }

    "Replace" {
        foreach ($Node in $Nodes) {
            $Node.InnerText = $Value
        }
        $Xml.Save($File)
    }

    default {
        Write-Error "Action muss 'Read', 'Delete' oder 'Replace' sein."
    }
}