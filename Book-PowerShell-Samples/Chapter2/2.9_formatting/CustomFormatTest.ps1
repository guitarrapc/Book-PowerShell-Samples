enum Name {John;Peach;Linda;}
enum Planet {Earth;Sun;Vinus;}
enum Shell {PowerShell;CommandPrompt;Bash;}

function Get-CustomInfo{
    0..2 | Foreach-Object{
        $obj = [pscustomObject]@{Name = [Name]$_; Age = $_ * 10; Planet = [Planet]$_; Shell = [Shell]$_; Edition = $PSVersionTable.PSEdition}
        if ($obj.PSTypeNames -notcontains "Custom.Info"){
            $obj.PSTypeNames.Insert(0, "Custom.Info")
        }
        $obj
    }
}

Get-CustomInfo | Format-Table
Get-CustomInfo | Format-List
Get-CustomInfo | Format-Wide

Update-FormatData -AppendPath ./CustomInfo.format.ps1xml