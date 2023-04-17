Add-Type -AssemblyName System.Windows.Forms
Add-Type -TypeDefinition @"
    using System;
    using System.Runtime.InteropServices;

 

    public class MousePosition {
        [DllImport("user32.dll", SetLastError = true)]
        public static extern bool SetCursorPos(int x, int y);

        [DllImport("user32.dll")]
        public static extern bool GetCursorPos(out POINT lpPoint);

 

        [StructLayout(LayoutKind.Sequential)]
        public struct POINT {
            public int X;
            public int Y;
        }
    }

 

    public class Screen {
        [DllImport("user32.dll")]
        public static extern IntPtr GetDesktopWindow();

 

        [DllImport("user32.dll", SetLastError = true)]
        public static extern bool GetWindowRect(IntPtr hwnd, out RECT lpRect);

 

        [StructLayout(LayoutKind.Sequential)]
        public struct RECT {
            public int Left;
            public int Top;
            public int Right;
            public int Bottom;
        }
    }
"@


$passwordCorrect = '12232'
$form = New-Object System.Windows.Forms.Form
$form.Text = 'Connexion securisee'
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



# Ajout d'un PictureBox pour afficher l'image
$picturebox = New-Object System.Windows.Forms.PictureBox
$picturebox.ImageLocation = "https://upload.wikimedia.org/wikipedia/commons/f/ff/Crystal_Clear_action_lock.png"
$picturebox.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::Zoom
$picturebox.Location = New-Object System.Drawing.Point(700, 600)
$picturebox.Size = New-Object System.Drawing.Size(150, 150)
$form.Controls.Add($picturebox)


$screenRect = New-Object Screen+RECT
[Screen]::GetWindowRect([Screen]::GetDesktopWindow(), [ref]$screenRect)

 

$screenWidth = $screenRect.Right - $screenRect.Left
$screenHeight = $screenRect.Bottom - $screenRect.Top

 

$x = $screenWidth * 0.42
$y = $screenHeight * 0.443



$form.Add_MouseMove({
    [MousePosition]::SetCursorPos([int]$x, [int]$y)
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


 



    # Definir le timer pour declencher la fonction toutes les secondes
    $timer = New-Object System.Windows.Forms.Timer
    $timer.Interval = 500  # intervalle en millisecondes
    $timer.Enabled = $true
    $timer.Add_Tick({
        [System.Windows.Forms.SendKeys]::SendWait("{ESC}")
    })
})


Add-Type -Name User32 -Namespace Win32 -MemberDefinition '
    [DllImport("user32.dll")]
    public static extern short GetAsyncKeyState(int vKey);
'



$form.ShowDialog()
