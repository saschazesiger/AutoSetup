function Get-Color {
    $colorDialog = new-object System.Windows.Forms.ColorDialog 
    $colorDialog.AllowFullOpen = $false
    [void]$colorDialog.ShowDialog()
    $colorDialog.Color.Name
}

get-color