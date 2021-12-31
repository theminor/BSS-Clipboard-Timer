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

$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = New-Object System.Drawing.Point(215,135)
$Form.text                       = "BSS"
$Form.TopMost                    = $false

$grpBox                          = New-Object system.Windows.Forms.Groupbox
$grpBox.height                   = 90
$grpBox.width                    = 200
$grpBox.location                 = New-Object System.Drawing.Point(8,8)

$wcTimerLabel                    = New-Object system.Windows.Forms.Label
$wcTimerLabel.text               = "Wealth Clock:"
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
$wcTime.location                 = New-Object System.Drawing.Point(140,10)
$wcTime.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$bmasTimerLabel                  = New-Object system.Windows.Forms.Label
$bmasTimerLabel.text             = "Beesmas Feast:"
$bmasTimerLabel.AutoSize         = $true
$bmasTimerLabel.width            = 25
$bmasTimerLabel.height           = 10
$bmasTimerLabel.location         = New-Object System.Drawing.Point(10,38)
$bmasTimerLabel.Font             = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$bmasTime                        = New-Object system.Windows.Forms.TextBox
$bmasTime.multiline              = $false
$bmasTime.text                   = "90"
$bmasTime.width                  = 50
$bmasTime.height                 = 20
$bmasTime.location               = New-Object System.Drawing.Point(140,35)
$bmasTime.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$gbreadTimerLabel                = New-Object system.Windows.Forms.Label
$gbreadTimerLabel.text           = "Gingerbread House:"
$gbreadTimerLabel.AutoSize       = $true
$gbreadTimerLabel.width          = 25
$gbreadTimerLabel.height         = 10
$gbreadTimerLabel.location       = New-Object System.Drawing.Point(10,63)
$gbreadTimerLabel.Font           = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$gbreadTime                      = New-Object system.Windows.Forms.TextBox
$gbreadTime.multiline            = $false
$gbreadTime.text                 = "120"
$gbreadTime.width                = 50
$gbreadTime.height               = 20
$gbreadTime.location             = New-Object System.Drawing.Point(140,60)
$gbreadTime.Font                 = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$clpLabel                        = New-Object system.Windows.Forms.Label
$clpLabel.text                   = "Clipboard:"
$clpLabel.AutoSize               = $true
$clpLabel.width                  = 25
$clpLabel.height                 = 10
$clpLabel.location               = New-Object System.Drawing.Point(7,108)
$clpLabel.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$clpTxt                          = New-Object system.Windows.Forms.TextBox
$clpTxt.multiline                = $false
$clpTxt.text                     = "(checking...)"
$clpTxt.width                    = 130
$clpTxt.height                   = 20
$clpTxt.location                 = New-Object System.Drawing.Point(75,105)
$clpTxt.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$grpBox.controls.AddRange(@($wcTime,$wcTimerLabel,$bmasTimerLabel,$bmasTime,$gbreadTimerLabel,$gbreadTime))
$Form.controls.AddRange(@($grpBox,$clpLabel,$clpTxt))

# Backup variables for textbox input errors
$global:wcTimeBak = $wcTime.text
$global:bmasTimeBak = $bmasTime.text
$global:gbreadTimeBak = $gbreadTime.text

# Create a timer.
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
    }
    if ($clpTxt.text -eq 'beesmasfeastdone') {
        $bmasTime.text = "90"
        Set-Clipboard -Value 'timers pending'
    }
    if ($clpTxt.text -eq 'gingerbreaddone') {
        $gbreadTime.text = "120"
        Set-Clipboard -Value 'timers pending'
    }

    if (($bmasTime.text -as [decimal]) -or ($bmasTime.text -eq 0) -or ($bmasTime.text -eq "0.0")) {
        $bmasTime.text = [decimal]($bmasTime.text) - 0.1
        if ([decimal]($bmasTime.text) -lt 0) {
            Set-Clipboard -Value 'beesmasfeastelapsed'
        }
    } else {
        $bmasTime.text = $global:bmasTimeBak
    }
    if (($gbreadTime.text -as [decimal]) -or ($gbreadTime.text -eq 0) -or ($gbreadTime.text -eq "0.0")) {
        $gbreadTime.text = [decimal]($gbreadTime.text) - 0.1 
        if ([decimal]($gbreadTime.text) -lt 0) {
            Set-Clipboard -Value 'gingerbreadelapsed'
        }
    } else {
        $gbreadTime.text = $global:gbreadTimeBak
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
    
    $clpTxt.text = Get-Clipboard
})

$timer.Start()

[void]$Form.ShowDialog()
