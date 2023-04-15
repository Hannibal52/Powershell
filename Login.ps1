Add-Type -AssemblyName System.Windows.Forms
$tableau1 = @('3', '5', '7', '1', '8', '2', '6', '4', '9')
$tableau2 = @('9', '6', '2', '4', '5', '1', '8', '3', '7')
$tableau3 = @('1', '4', '9', '7', '6', '5', '3', '2', '8')
$tableau4 = @('6', '8', '3', '2', '9', '4', '7', '1', '5')
$passwordCorrect = ($tableau1[0], $tableau3[2], $tableau3[5], $tableau4[8] -join '')
$form = New-Object System.Windows.Forms.Form
$form.Text = 'Connexion sécurisée'
$form.WindowState = 'Maximized'
$form.StartPosition = 'CenterScreen'
$form.TopMost = $true
$form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::None
$label = New-Object System.Windows.Forms.Label
$label.Text = 'Entrez votre mot de passe:'
$label.AutoSize = $true
$passwordBox = New-Object System.Windows.Forms.TextBox
$passwordBox.PasswordChar = '*'
$passwordBox.Size = New-Object System.Drawing.Size(150, 20)
$button = New-Object System.Windows.Forms.Button
$button.Text = 'Connexion'
$button.Location = New-Object System.Drawing.Point(700, 490)
$passwordBox.Location = New-Object System.Drawing.Point(700, 470)
$label.Location = New-Object System.Drawing.Point(700, 450)
$form.Add_MouseMove({
    [MousePosition2]::SetCursorPos([int]$x, [int]$y)
})
$button.Add_Click({
    if ($passwordBox.Text -eq $passwordCorrect) {
        $form.Close()
    } else {
        [System.Windows.Forms.MessageBox]::Show('Mot de passe incorrect !', 'Erreur', [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
        $passwordBox.Clear()
    }
})
$passwordBox.Add_KeyDown({
    if ($_.KeyCode -eq [System.Windows.Forms.Keys]::Enter) {
        $button.PerformClick()
    }
})
$form.Controls.Add($label)
$form.Controls.Add($passwordBox)
$form.Controls.Add($button)
$form.Add_Shown({
    # Définir le timer pour déclencher la fonction toutes les secondes
    $timer = New-Object System.Windows.Forms.Timer
    $timer.Interval = 3000  # intervalle en millisecondes
    $timer.Enabled = $true
    $timer.Add_Tick({
        [System.Windows.Forms.SendKeys]::SendWait("{ESC}")
    })
})
$form.ShowDialog()
