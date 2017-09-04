#
# screenshot.ps1
#

[string]$FileNamePattern = 'screenshot_{0}.png'

while(1) {
    $fileName = $FileNamePattern -f (Get-Date).ToString('yyyyMMdd_HHmmss_ffff')
    $path = Join-Path $PWD $fileName

    $b = New-Object System.Drawing.Bitmap([System.Windows.Forms.Screen]::PrimaryScreen.Bounds.Width, [System.Windows.Forms.Screen]::PrimaryScreen.Bounds.Height)

    $g = [System.Drawing.Graphics]::FromImage($b)
    $g.CopyFromScreen((New-Object System.Drawing.Point(0,0)), (New-Object System.Drawing.Point(0,0)), $b.Size)
    $g.Dispose()
    $b.Save($path)
}