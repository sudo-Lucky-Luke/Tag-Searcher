# XML Tag Editor

Simple PowerShell script for editing XML tags.

## Features

- Read the value of a tag
- Clear the value of a tag
- Replace the value of a tag

## Usage

Edit the variables at the top of the script:

```powershell
$File   = "C:\Temp\Test.xml"
$Tag    = "Username"
$Action = "Read"      # Read | DeleteValue | Replace | DeleteTAg
$Value  = "NewValue"  # Only used with Replace
```

Then run the script.

### Actions

- **Read** – Displays the value(s) of the selected tag.
- **Delete** – Clears the value while keeping the XML tag.
- **Replace** – Replaces the value with the specified text.