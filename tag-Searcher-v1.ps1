# ==========================
# Einstellungen
# ==========================

$File   = "C:\Temp\Config.xml"
$Tag    = "Username"
$Action = "Read"      # Read | DeleteValue | Replace | DeleteTag
$Value  = "Admin"     # Nur bei Replace

# ==========================

[xml]$Xml = Get-Content $File

$Nodes = $Xml.SelectNodes("//$Tag")

switch ($Action) {

    "Read" {
        $Nodes.InnerText
    }

    "DeleteValue" {
        foreach ($Node in $Nodes) {
            $Node.InnerText = ""
        }
        $Xml.Save($File)
    }

    "DeleteTAg" {
        foreach ($Node in $Nodes) {
            $Node.ParentNode.RemoveChild($Node) | Out-Null
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