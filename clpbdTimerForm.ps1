# .Net methods for hiding/showing the console in the background
Add-Type -Name Window -Namespace Console -MemberDefinition '
[DllImport("Kernel32.dll")]
public static extern IntPtr GetConsoleWindow();

[DllImport("user32.dll")]
public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);
'
function Hide-Console
{
    $consolePtr = [Console.Window]::GetConsoleWindow()
    #0 hide
    [Console.Window]::ShowWindow($consolePtr, 0)
}
Hide-Console

# Create Form
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$Form                            = New-Object System.Windows.Forms.Form
$Form.ClientSize                 = New-Object System.Drawing.Point(250,215)
$Form.text                       = "BSS"
$Form.TopMost                    = $false
$Form.FormBorderStyle            = [System.Windows.Forms.FormBorderStyle]::Fixed3D

$grpBox                          = New-Object System.Windows.Forms.Groupbox
$grpBox.height                   = 165
$grpBox.width                    = 235
$grpBox.location                 = New-Object System.Drawing.Point(8,5)

$wcTimerLabel                    = New-Object System.Windows.Forms.Label
$wcTimerLabel.text               = "Wealth Clock (0x):"
$wcTimerLabel.AutoSize           = $true
$wcTimerLabel.width              = 25
$wcTimerLabel.height             = 10
$wcTimerLabel.location           = New-Object System.Drawing.Point(10,13)
$wcTimerLabel.Font               = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$wcTime                          = New-Object system.Windows.Forms.TextBox
$wcTime.multiline                = $false
$wcTime.text                     = "60"
$wcTime.width                    = 50
$wcTime.height                   = 20
$wcTime.location                 = New-Object System.Drawing.Point(175,10)
$wcTime.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$bmasTimerLabel                  = New-Object System.Windows.Forms.Label
$bmasTimerLabel.text             = "Beesmas Feast (0x):"
$bmasTimerLabel.AutoSize         = $true
$bmasTimerLabel.width            = 25
$bmasTimerLabel.height           = 10
$bmasTimerLabel.location         = New-Object System.Drawing.Point(10,38)
$bmasTimerLabel.Font             = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$bmasTime                        = New-Object System.Windows.Forms.TextBox
$bmasTime.multiline              = $false
$bmasTime.text                   = "90"
$bmasTime.width                  = 50
$bmasTime.height                 = 20
$bmasTime.location               = New-Object System.Drawing.Point(175,35)
$bmasTime.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$gbreadTimerLabel                = New-Object System.Windows.Forms.Label
$gbreadTimerLabel.text           = "Gingerbread House (0x):"
$gbreadTimerLabel.AutoSize       = $true
$gbreadTimerLabel.width          = 25
$gbreadTimerLabel.height         = 10
$gbreadTimerLabel.location       = New-Object System.Drawing.Point(10,63)
$gbreadTimerLabel.Font           = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$gbreadTime                      = New-Object System.Windows.Forms.TextBox
$gbreadTime.multiline            = $false
$gbreadTime.text                 = "120"
$gbreadTime.width                = 50
$gbreadTime.height               = 20
$gbreadTime.location             = New-Object System.Drawing.Point(175,60)
$gbreadTime.Font                 = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$hdayTimerLabel                  = New-Object System.Windows.Forms.Label
$hdayTimerLabel.text             = "Honeyday Candles (0x):"
$hdayTimerLabel.AutoSize         = $true
$hdayTimerLabel.width            = 25
$hdayTimerLabel.height           = 10
$hdayTimerLabel.location         = New-Object System.Drawing.Point(10,88)
$hdayTimerLabel.Font             = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$hdayTime                        = New-Object System.Windows.Forms.TextBox
$hdayTime.multiline              = $false
$hdayTime.text                   = "240"
$hdayTime.width                  = 50
$hdayTime.height                 = 20
$hdayTime.location               = New-Object System.Drawing.Point(175,85)
$hdayTime.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$samovarTimerLabel               = New-Object System.Windows.Forms.Label
$samovarTimerLabel.text          = "Samovar (0x):"
$samovarTimerLabel.AutoSize      = $true
$samovarTimerLabel.width         = 25
$samovarTimerLabel.height        = 10
$samovarTimerLabel.location      = New-Object System.Drawing.Point(10,113)
$samovarTimerLabel.Font          = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$samovarTime                     = New-Object System.Windows.Forms.TextBox
$samovarTime.multiline           = $false
$samovarTime.text                = "360"
$samovarTime.width               = 50
$samovarTime.height              = 20
$samovarTime.location            = New-Object System.Drawing.Point(175,110)
$samovarTime.Font                = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$lidArtTimerLabel                = New-Object System.Windows.Forms.Label
$lidArtTimerLabel.text           = "Onett Lid Art (0x):"
$lidArtTimerLabel.AutoSize       = $true
$lidArtTimerLabel.width          = 25
$lidArtTimerLabel.height         = 10
$lidArtTimerLabel.location       = New-Object System.Drawing.Point(10,138)
$lidArtTimerLabel.Font           = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$lidArtTime                      = New-Object System.Windows.Forms.TextBox
$lidArtTime.multiline            = $false
$lidArtTime.text                 = "480"
$lidArtTime.width                = 50
$lidArtTime.height               = 20
$lidArtTime.location             = New-Object System.Drawing.Point(175,135)
$lidArtTime.Font                 = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$clpLabel                        = New-Object System.Windows.Forms.Label
$clpLabel.text                   = "Clipboard:"
$clpLabel.AutoSize               = $true
$clpLabel.width                  = 25
$clpLabel.height                 = 10
$clpLabel.location               = New-Object System.Drawing.Point(7,185)
$clpLabel.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$clpTxt                          = New-Object System.Windows.Forms.TextBox
$clpTxt.multiline                = $false
$clpTxt.text                     = "(checking...)"
$clpTxt.width                    = 165
$clpTxt.height                   = 20
$clpTxt.location                 = New-Object System.Drawing.Point(75,182)
$clpTxt.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$grpBox.controls.AddRange(@($wcTime,$wcTimerLabel,$bmasTimerLabel,$bmasTime,$gbreadTimerLabel,$gbreadTime,$hdayTimerLabel,$hdayTime,$samovarTimerLabel,$samovarTime,$lidArtTimerLabel,$lidArtTime))
$Form.controls.AddRange(@($grpBox,$clpLabel,$clpTxt))

# Backup variables for textbox input errors
$global:wcTimeBak = $wcTime.text
$global:bmasTimeBak = $bmasTime.text
$global:gbreadTimeBak = $gbreadTime.text
$global:hdayTimeBak = $hdayTime.text
$global:samovarTimeBak = $hdayTime.text
$global:lidArtTimeBak = $hdayTime.text

# Global counters for cycles completed of each timer
$global:wcCycles = 0
$global:bmasCycles = 0
$global:gbreadCycles = 0
$global:hdayCycles = 0
$global:samovarCycles = 0
$global:lidArtCycles = 0

$wcTimerLabel.Add_Click({ 
    $global:wcCycles = 0
    $wcTimerLabel.text = "Wealth Clock (0x):"
})
$bmasTimerLabel.Add_Click({ 
    $global:bmasCycles = 0
    $bmasTimerLabel.text = "Beesmas Feast (0x):"
})
$gbreadTimerLabel.Add_Click({ 
    $global:gbreadCycles = 0
    $gbreadTimerLabel.text = "Gingerbread House (0x):"
})
$hdayTimerLabel.Add_Click({ 
    $global:hdayCycles = 0
    $hdayTimerLabel.text = "Honeyday Candles (0x):"
})
$samovarTimerLabel.Add_Click({ 
    $global:samovarCycles = 0
    $samovarTimerLabel.text = "Samovar (0x):"
})
$lidArtTimerLabel.Add_Click({ 
    $global:lidArtCycles = 0
    $lidArtTimerLabel.text = "Onett Lid Art (0x):"
})
$clpLabel.Add_Click({
    if ($clpTxt.text -eq "gingerbreadelapsed") {
        Set-Clipboard -Value 'gingerbreaddone'
    } elseif ($clpTxt.text -eq "honeydayelapsed") {
        Set-Clipboard -Value 'honeydaydone'
    } elseif ($clpTxt.text -eq "clockelapsed") {
        Set-Clipboard -Value 'clockdone'
    } elseif ($clpTxt.text -eq "beesmasfeastelapsed") {
        Set-Clipboard -Value 'beesmasfeastdone'
    } elseif ($clpTxt.text -eq "samovarelapsed") {
        Set-Clipboard -Value 'samovardone'
    } # elseif ($clpTxt.text -eq "lidartelapsed") {
    #     Set-Clipboard -Value 'lidartdone'
    # }
    $clpTxt.text = Get-Clipboard
})

# Create the timer.
$timer = New-Object system.Windows.Forms.Timer
$timer.Interval = 6000  # 0.1 minutes

Set-Clipboard -Value 'timers pending'
$clpTxt.text = Get-Clipboard

# Reduce time in each box by 0.1 (minutes) each tick
$timer.Add_Tick({
    $clpTxt.text = Get-Clipboard

    if ($clpTxt.text -eq 'clockdone') {
        $wcTime.text = "60"
        Set-Clipboard -Value 'timers pending'
        $global:wcCycles = $global:wcCycles + 1
        $wcTimerLabel.text = "Wealth Clock (" + $global:wcCycles + "x):"
    }
    if ($clpTxt.text -eq 'beesmasfeastdone') {
        $bmasTime.text = "90"
        Set-Clipboard -Value 'timers pending'
        $global:bmasCycles = $global:bmasCycles + 1
        $bmasTimerLabel.text = "Beesmas Feast (" + $global:bmasCycles + "x):"
    }
    if ($clpTxt.text -eq 'gingerbreaddone') {
        # $gbreadTime.text = "120"
        # Set-Clipboard -Value 'timers pending'
        # $global:gbreadCycles = $global:gbreadCycles + 1
        # $gbreadTimerLabel.text = "Gingerbread House (" + $global:gbreadCycles + "x):"
    }
    if ($clpTxt.text -eq 'honeydaydone') {
        $hdayTime.text = "240"
        Set-Clipboard -Value 'timers pending'
        $global:hdayCycles = $global:hdayCycles + 1
        $hdayTimerLabel.text = "Honeyday Candles (" + $global:hdayCycles + "x):"
    }
    if ($clpTxt.text -eq 'samovardone') {
        $samovarTime.text = "360"
        Set-Clipboard -Value 'timers pending'
        $global:samovarCycles = $global:samovarCycles + 1
        $samovarTimerLabel.text = "Samovar (" + $global:samovarCycles + "x):"
    }
    if ($clpTxt.text -eq 'lidartdone') {
        # $lidArtTime.text = "480"
        # Set-Clipboard -Value 'timers pending'
        # $global:lidArtCycles = $global:lidArtCycles + 1
        # $lidArtTimerLabel.text = "Onett Lid Art (" + $global:hdayCycles + "x):"
    }

    if (($lidArtTime.text -as [decimal]) -or ($lidArtTime.text -eq 0) -or ($lidArtTime.text -eq "0.0")) {
        $lidArtTime.text = [decimal]($lidArtTime.text) - 0.1 
        if ([decimal]($lidArtTime.text) -lt 0) {
            # Set-Clipboard -Value 'lidartelapsed'
        }
    } else {
        $lidArtTime.text = $global:lidArtTimeBak
    }
    if (($samovarTime.text -as [decimal]) -or ($samovarTime.text -eq 0) -or ($samovarTime.text -eq "0.0")) {
        $samovarTime.text = [decimal]($samovarTime.text) - 0.1 
        if ([decimal]($samovarTime.text) -lt 0) {
            Set-Clipboard -Value 'samovarelapsed'
        }
    } else {
        $samovarTime.text = $global:samovarTimeBak
    }
    if (($gbreadTime.text -as [decimal]) -or ($gbreadTime.text -eq 0) -or ($gbreadTime.text -eq "0.0")) {
        $gbreadTime.text = [decimal]($gbreadTime.text) - 0.1 
        if ([decimal]($gbreadTime.text) -lt 0) {
            # Set-Clipboard -Value 'gingerbreadelapsed'
        }
    } else {
        $gbreadTime.text = $global:gbreadTimeBak
    }
    if (($hdayTime.text -as [decimal]) -or ($hdayTime.text -eq 0) -or ($hdayTime.text -eq "0.0")) {
        $hdayTime.text = [decimal]($hdayTime.text) - 0.1 
        if ([decimal]($hdayTime.text) -lt 0) {
            Set-Clipboard -Value 'honeydayelapsed'
        }
    } else {
        $hdayTime.text = $global:hdayTimeBak
    }
    if (($bmasTime.text -as [decimal]) -or ($bmasTime.text -eq 0) -or ($bmasTime.text -eq "0.0")) {
        $bmasTime.text = [decimal]($bmasTime.text) - 0.1
        if ([decimal]($bmasTime.text) -lt 0) {
            Set-Clipboard -Value 'beesmasfeastelapsed'
        }
    } else {
        $bmasTime.text = $global:bmasTimeBak
    }
    if (($wcTime.text -as [decimal]) -or ($wcTime.text -eq 0) -or ($wcTime.text -eq "0.0")) {
        $wcTime.text = [decimal]($wcTime.text) - 0.1
        if ([decimal]($wcTime.text) -lt 0) {
            Set-Clipboard -Value 'clockelapsed'
        }
    } else {
        $wcTime.text = $global:wcTimeBak
    }

    $global:wcTimeBak = $wcTime.text
    $global:bmasTimeBak = $bmasTime.text
    $global:gbreadTimeBak = $gbreadTime.text
    $global:hdayTimeBak = $hdayTime.text
    $global:samovarTimeBak = $samovarTime.text
    $global:lidArtTimeBak = $lidArtTime.text

    $clpTxt.text = Get-Clipboard
})

$timer.Start()

[void]$Form.ShowDialog()
