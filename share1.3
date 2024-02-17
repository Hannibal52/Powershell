# Assurez-vous que le module ActiveDirectory est importé
Import-Module ActiveDirectory

# Ajout des types pour l'interface graphique
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing





# Fonction pour mettre à jour la liste des membres du groupe sélectionné
function Update-GroupMemberList {
    param([string]$groupName)

    $groupMemberList.Items.Clear()

    $members = Get-ADGroupMember -Identity $groupName

    foreach ($member in $members) {
        $user = Get-ADUser -Identity $member.SamAccountName -Properties GivenName, Surname
        $displayName = "$($user.GivenName) $($user.Surname) [$($user.SamAccountName)]"
        $groupMemberList.Items.Add($displayName) | Out-Null
    }
}





# Création du formulaire principal
$form = New-Object System.Windows.Forms.Form
$form.Text = 'Gestion des groupes et utilisateurs AD'
$form.WindowState = [System.Windows.Forms.FormWindowState]::Maximized
$form.StartPosition = 'CenterScreen'




# Création des légendes
$groupLabel = New-Object System.Windows.Forms.Label
$groupLabel.Location = New-Object System.Drawing.Point(700, 80)
$groupLabel.Size = New-Object System.Drawing.Size(240, 20)
$groupLabel.Text = 'Groupes'
$form.Controls.Add($groupLabel)

$filterLabel = New-Object System.Windows.Forms.Label
$filterLabel.Location = New-Object System.Drawing.Point(1410, 50)
$filterLabel.Size = New-Object System.Drawing.Size(100, 20)
$filterLabel.Text = 'Filtre'
$form.Controls.Add($filterLabel)

$memberLabel = New-Object System.Windows.Forms.Label
$memberLabel.Location = New-Object System.Drawing.Point(1060, 80)
$memberLabel.Size = New-Object System.Drawing.Size(240, 20)
# Le texte sera mis à jour lors de la sélection d'un groupe
$memberLabel.Text = 'Membres de'
$form.Controls.Add($memberLabel)







# Liste des groupes
$groupList = New-Object System.Windows.Forms.ListBox
$groupList.Location = New-Object System.Drawing.Point(700, 100)
$groupList.Size = New-Object System.Drawing.Size(240, 300)

# Liste des membres du groupe
$groupMemberList = New-Object System.Windows.Forms.ListBox
$groupMemberList.Location = New-Object System.Drawing.Point(1060, 100)
$groupMemberList.Size = New-Object System.Drawing.Size(240, 300)

# Liste de tous les utilisateurs
$userList = New-Object System.Windows.Forms.ListBox
$userList.Location = New-Object System.Drawing.Point(1410, 100)
$userList.Size = New-Object System.Drawing.Size(240, 300)

# Ajouter les contrôles au formulaire
$form.Controls.Add($groupList)
$form.Controls.Add($groupMemberList)
$form.Controls.Add($userList)




# Création des ListBox et des labels pour les nouvelles listes
$localGroupsOfGlobalGroupLabel = New-Object System.Windows.Forms.Label
$localGroupsOfGlobalGroupLabel.Location = New-Object System.Drawing.Point(1060, 410) 
$localGroupsOfGlobalGroupLabel.Size = New-Object System.Drawing.Size(240, 40)
$localGroupsOfGlobalGroupLabel.Text = "Groupes locaux du groupe global :"
$localGroupsOfGlobalGroupLabel.ForeColor = '#0A9647'
$localGroupsOfGlobalGroupLabel.Font = New-Object System.Drawing.Font( [System.Drawing.FontStyle]::Bold)
$form.Controls.Add($localGroupsOfGlobalGroupLabel)

$localGroupsOfGlobalGroupList = New-Object System.Windows.Forms.ListBox
$localGroupsOfGlobalGroupList.Location = New-Object System.Drawing.Point(1060, 450)
$localGroupsOfGlobalGroupList.Size = New-Object System.Drawing.Size(240, 350)
$form.Controls.Add($localGroupsOfGlobalGroupList)

$globalGroupsOfUserLabel = New-Object System.Windows.Forms.Label
$globalGroupsOfUserLabel.Location = New-Object System.Drawing.Point(1410, 410) 
$globalGroupsOfUserLabel.Size = New-Object System.Drawing.Size(240, 40)
$globalGroupsOfUserLabel.ForeColor = '#0A9647'
$globalGroupsOfUserLabel.Font = New-Object System.Drawing.Font([System.Drawing.FontStyle]::Bold)
$globalGroupsOfUserLabel.Text = "Groupes globaux de l'utilisateur :"
$form.Controls.Add($globalGroupsOfUserLabel)

$globalGroupsOfUserList = New-Object System.Windows.Forms.ListBox
$globalGroupsOfUserList.Location = New-Object System.Drawing.Point(1410, 450)
$globalGroupsOfUserList.Size = New-Object System.Drawing.Size(240, 350)
$form.Controls.Add($globalGroupsOfUserList)













function Update-LocalGroupsOfGlobalGroup {
    param([string]$globalGroupName)

    $localGroupsOfGlobalGroupList.Items.Clear()

    # Récupérer les groupes locaux dont ce groupe global est membre
    $localGroups = Get-ADGroup -Identity $globalGroupName -Properties MemberOf | Select-Object -ExpandProperty MemberOf
    foreach ($group in $localGroups) {
        $groupName = (Get-ADGroup -Identity $group).Name
        $localGroupsOfGlobalGroupList.Items.Add($groupName)
    }
}

function Update-GlobalGroupsOfUser {
    param([string]$samAccountName)

    $globalGroupsOfUserList.Items.Clear()

    # Récupérer les groupes globaux dont cet utilisateur (identifié par SamAccountName) est membre
    $globalGroups = Get-ADUser -Identity $samAccountName -Properties MemberOf | Select-Object -ExpandProperty MemberOf
    foreach ($groupDn in $globalGroups) {
        $groupName = (Get-ADGroup -Identity $groupDn).Name
        $globalGroupsOfUserList.Items.Add($groupName)
    }
}






# Gestionnaire d'événements pour la sélection d'un utilisateur
$userList.Add_SelectedIndexChanged({
    if ($userList.SelectedItem -ne $null) {
        # Extraire le SamAccountName de la chaîne sélectionnée
        $selectedText = $userList.SelectedItem
        $samAccountName = $selectedText -match '\[(.*?)\]' | Out-Null
        $samAccountName = $matches[1]

        $globalGroupsOfUserLabel.Text = "Groupes de : $selectedText"
        Update-GlobalGroupsOfUser -samAccountName $samAccountName
    }
})






# Mise à jour de la légende du groupe lors de la sélection d'un groupe
$groupList.Add_SelectedIndexChanged({
        if ($groupList.SelectedItem -ne $null) {

            $localGroupsOfGlobalGroupLabel.Text = "Permissions de : " + $groupList.SelectedItem
            Update-LocalGroupsOfGlobalGroup -globalGroupName $groupList.SelectedItem
            Update-GroupMemberList -groupName $groupList.SelectedItem
            $memberLabel.Text = "Membres de $($groupList.SelectedItem)"
       
            $groupMemberList.Visible = 1
            $userList.Visible = 1
            $filterTextBox.Visible = 1

            Update-GroupMemberList -groupName $groupList.SelectedItem
            $memberLabel.Text = "Membres de $($groupList.SelectedItem)"
        }
    })



# Création du champ de texte pour le filtre
$filterTextBox = New-Object System.Windows.Forms.TextBox
$filterTextBox.Location = New-Object System.Drawing.Point(1410, 70)
$filterTextBox.Size = New-Object System.Drawing.Size(240, 20)
$form.Controls.Add($filterTextBox)




# Fonction pour filtrer et mettre à jour la liste des utilisateurs avec leur nom complet
function Filter-UserList {
    param([string]$filterText)

    $userList.Items.Clear()

    # Récupérer tous les utilisateurs
    $allUsers = Get-ADUser -Filter 'Enabled -eq $true' -SearchBase "OU=Utilisateurs,OU=AGDLP,DC=AGDLP,DC=LAN" -Properties GivenName, Surname , SamAccountName
    
    foreach ($user in $allUsers) {
        # Construire une chaîne contenant à la fois le prénom et le nom de l'utilisateur
        $fullName ="$($user.GivenName) $($user.Surname) [$($user.SamAccountName)]"
        
        # Filtrer les utilisateurs en fonction du texte de recherche entré
        if ($fullName -like "*$filterText*") {
            $userList.Items.Add($fullName)
        }
    }
} 



# Gestionnaire d'événements pour le changement de texte
$filterTextBox.Add_TextChanged({
    if ([string]::IsNullOrWhiteSpace($filterTextBox.Text)) {
        # Si le champ de texte est vide, afficher tous les utilisateurs
        Filter-UserList -filterText '*'
    } else {
        # Sinon, utiliser le texte du filtre pour filtrer les utilisateurs
        Filter-UserList -filterText $filterTextBox.Text
    }
})

# Mettre à jour initialement la liste complète des utilisateurs
Filter-UserList -filterText ''










# Ajout de la zone de texte de filtre pour les groupes et de son étiquette au formulaire
$filterTextBoxGroupe = New-Object System.Windows.Forms.TextBox
$filterTextBoxGroupe.Location = New-Object System.Drawing.Point(700, 50) # Ajustez la position si nécessaire
$filterTextBoxGroupe.Size = New-Object System.Drawing.Size(240, 20)
$form.Controls.Add($filterTextBoxGroupe)

$filterLabelGroupe = New-Object System.Windows.Forms.Label
$filterLabelGroupe.Location = New-Object System.Drawing.Point(700, 30) # Ajustez la position si nécessaire
$filterLabelGroupe.Size = New-Object System.Drawing.Size(240, 20)
$filterLabelGroupe.Text = 'Filtrer les Groupes Globaux'
$form.Controls.Add($filterLabelGroupe)




# Fonction pour filtrer et mettre à jour la liste des groupes globaux
function Filter-GroupList {
    param([string]$filterText)

    $groupList.Items.Clear()

    # Récupérer tous les groupes globaux
    $allGroups = Get-ADGroup -Filter 'GroupScope -eq "Global"' -SearchBase "OU=GroupesGlobaux,OU=AGDLP,DC=AGDLP,DC=LAN"
    
    foreach ($group in $allGroups) {
        # Filtrer les groupes en fonction du texte de recherche entré
        if ([string]::IsNullOrWhiteSpace($filterText) -or $group.Name -like "*$filterText*") {
            $groupList.Items.Add($group.Name)
        }
    }
}

# Gestionnaire d'événements pour le changement de texte du filtre des groupes
$filterTextBoxGroupe.Add_TextChanged({
    Filter-GroupList -filterText $filterTextBoxGroupe.Text
})

# Mettre à jour initialement la liste complète des groupes globaux
Filter-GroupList -filterText ''












































# Remplir la liste des groupes
$groups = Get-ADGroup -Filter * -SearchBase "OU=GroupesGlobaux,OU=AGDLP,DC=AGDLP,DC=LAN"
foreach ($group in $groups) {
    $groupList.Items.Add($group.Name)
}

# Remplir la liste de tous les utilisateurs
$users = Get-ADUser -Filter * -SearchBase "OU=Utilisateurs,OU=AGDLP,DC=AGDLP,DC=LAN"
foreach ($user in $users) {
    $userList.Items.Add($user.SamAccountName)
}

# Gestionnaire d'événements pour la sélection d'un groupe
$groupList.Add_SelectedIndexChanged({
        if ($groupList.SelectedItem -ne $null) {
            Update-GroupMemberList -groupName $groupList.SelectedItem
        }
    })

# Gestionnaire d'événements pour le double-clic sur un membre du groupe
$groupMemberList.Add_MouseDoubleClick({
        if ($groupMemberList.SelectedItem -ne $null) {
            # Retirer l'utilisateur du groupe
            Remove-ADGroupMember -Identity $groupList.SelectedItem -Members $groupMemberList.SelectedItem -Confirm:$false
            # Mettre à jour la liste des membres
            Update-GroupMemberList -groupName $groupList.SelectedItem
             
             Update-GlobalGroupsOfUser -userName $userList.SelectedItem
             Update-LocalGroupsOfGlobalGroup -globalGroupName $groupList.SelectedItem
        }
    })

# Gestionnaire d'événements pour le double-clic sur un utilisateur
$userList.Add_MouseDoubleClick({
    if ($userList.SelectedItem -ne $null -and $groupList.SelectedItem -ne $null) {
        # Extraire le SamAccountName de la chaîne sélectionnée
        $selectedUserDisplayName = $userList.SelectedItem
        $samAccountName = $selectedUserDisplayName -replace '.*\[(.*)\]$', '$1'

        try {
            # Ajouter l'utilisateur au groupe
            Add-ADGroupMember -Identity $groupList.SelectedItem -Members $samAccountName

            # Mettre à jour la liste des membres du groupe sélectionné
            Update-GroupMemberList -groupName $groupList.SelectedItem

            # Mise à jour des groupes de l'utilisateur sélectionné (nécessite la correction de la fonction Update-GlobalGroupsOfUser)
            $globalGroupsOfUserLabel.Text = "Groupes de : $selectedUserDisplayName"
            Update-GlobalGroupsOfUser -samAccountName $samAccountName

            # Optionnel: Mise à jour de la liste des groupes locaux du groupe global sélectionné
            Update-LocalGroupsOfGlobalGroup -globalGroupName $groupList.SelectedItem
        }
        catch {
            [System.Windows.Forms.MessageBox]::Show("Erreur lors de l'ajout de l'utilisateur au groupe: $_", "Erreur", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
        }
    }
    else {
        # Afficher une boîte de dialogue d'erreur si aucun groupe n'est sélectionné
        [System.Windows.Forms.MessageBox]::Show("Veuillez sélectionner un groupe.", "Sélection requise", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning)
    }
})











# Création d'un bouton parcourir (Button + FolderBrowserDialog).
$boutonParcourir = New-Object System.Windows.Forms.Button
$boutonParcourir.Location = New-Object System.Drawing.Point(70, 30)
$boutonParcourir.Size = New-Object System.Drawing.Point(150, 21)
$boutonParcourir.Text = "Ajouter un dossier"


$form.Controls.Add($boutonParcourir)



function CheckAndShareFolder {
    param(
        [string]$folderPath,
        [string]$folderName
    )

    # Vérifier si le dossier est déjà partagé
    $existingShare = Get-SmbShare -Name $folderName -ErrorAction SilentlyContinue

    # Si le dossier est déjà partagé, demander à l'utilisateur s'il souhaite réinitialiser le partage
    if ($existingShare) {
        $message = "Le dossier '$folderName' est déjà partagé. Voulez-vous réinitialiser le partage et les permissions?"
        $title = "Dossier déjà partagé"
        $response = [System.Windows.Forms.MessageBox]::Show($message, $title, [System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Question)

        if ($response -eq [System.Windows.Forms.DialogResult]::Yes) {
            ResetAndShareFolder $folderPath $folderName
        }
    } else {
        ResetAndShareFolder $folderPath $folderName
    }

    # Mettre à jour la liste des OUs
    UpdateOUList
}


# Fonction pour mettre à jour la liste des OUs dans l'interface
function UpdateOUList {
    $ouList.Items.Clear()
    $ous = Get-ADOrganizationalUnit -Filter * -SearchBase "OU=GroupesLocaux,OU=AGDLP,DC=AGDLP,DC=LAN" -ErrorAction SilentlyContinue
    foreach ($ou in $ous) {
        $ouList.Items.Add($ou.Name)
    }
}

function ResetAndShareFolder {
    param(
        [string]$folderPath,
        [string]$folderName
    )
    
    # Supprimer le partage existant (si applicable)
    Remove-SmbShare -Name $folderName -Force -ErrorAction SilentlyContinue

    # Créer un nouveau partage avec le nom du dossier
    New-SmbShare -Name $folderName -Path $folderPath -FullAccess "Administrateurs"

    # Retirer l'accès de "Tout le monde" par défaut
    Revoke-SmbShareAccess -Name $folderName -AccountName "Tout le monde" -Force -ErrorAction SilentlyContinue

    # Créer l'OU et les groupes locaux s'ils n'existent pas déjà
    CreateOUAndLocalGroups $folderName

    # Ajouter les groupes locaux aux autorisations de partage
    $groupNames = @("Read", "ReadWrite", "FullControl")
    foreach ($suffix in $groupNames) {
        $groupName = "DL_${folderName}_$suffix"
        $accessRight = switch ($suffix) {
            "Read" { "Read" }
            "ReadWrite" { "Change" }
            "FullControl" { "Full" }
        }
        Grant-SmbShareAccess -Name $folderName -AccountName $groupName -AccessRight $accessRight -Force -ErrorAction SilentlyContinue
    }

    # Appliquer les permissions NTFS pour les groupes et l'administrateur
    foreach ($suffix in $groupNames) {
        $groupName = "DL_${folderName}_$suffix"
        $ntfsPermission = switch ($suffix) {
            "Read" { "ReadAndExecute" }
            "ReadWrite" { "Modify" }
            "FullControl" { "FullControl" }
        }

        # Appliquer les permissions NTFS
        icacls $folderPath /grant "${groupName}:($ntfsPermission)" /t /c /q
    }

    # Assurer que l'administrateur a un contrôle total
    $adminGroup = "Administrateurs"
    icacls $folderPath /grant "${adminGroup}:(F)" /t /c /q
}

function CreateOUAndLocalGroups {
    param(
        [string]$folderName
    )
    
    $ouPath = "OU=GroupesLocaux,OU=AGDLP,DC=AGDLP,DC=LAN"
    
    # Vérifier si l'OU existe déjà
    $ou = Get-ADOrganizationalUnit -Filter "Name -eq '$folderName'" -SearchBase $ouPath -ErrorAction SilentlyContinue
    if (-not $ou) {
        # Créer l'OU
        $newOU = New-ADOrganizationalUnit -Name $folderName -Path $ouPath -Description $folderPath -ProtectedFromAccidentalDeletion $false -PassThru
    }
    
    # Créer les groupes locaux
    $groupNames = @("Read", "ReadWrite", "FullControl")
    foreach ($suffix in $groupNames) {
        $groupName = "DL_${folderName}_$suffix"
        
        # Vérifier si le groupe existe déjà
        $group = Get-ADGroup -Name $groupName -ErrorAction SilentlyContinue
        if (-not $group) {
            # Créer le groupe
            New-ADGroup -Name $groupName -GroupScope DomainLocal -Path $newOU.DistinguishedName
        }
    }
}

# Fonction pour mettre à jour la liste des OUs et sélectionner le nouvel OU
function UpdateOUListAndSelect {
    param([string]$selectedOUName)
    
    $ouList.Items.Clear()
    $ous = Get-ADOrganizationalUnit -Filter * -SearchBase "OU=GroupesLocaux,OU=AGDLP,DC=AGDLP,DC=LAN" -ErrorAction SilentlyContinue
    $indexToSelect = $null
    $index = 0
    foreach ($ou in $ous) {
        $ouList.Items.Add($ou.Name)
        if ($ou.Name -eq $selectedOUName) {
            $indexToSelect = $index
        }
        $index++
    }

    if ($indexToSelect -ne $null) {
        $ouList.SelectedIndex = $indexToSelect
    }
}


$boutonParcourir.Add_Click({
    $folderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog
    $folderBrowser.SelectedPath = "C:\"
    $result = $folderBrowser.ShowDialog()

    if ($result -eq [System.Windows.Forms.DialogResult]::OK) {
        $selectedFolderPath = $folderBrowser.SelectedPath
        $selectedFolderName = [System.IO.Path]::GetFileName($selectedFolderPath)
        
        # Supposons que la vérification du partage soit faite ici
        $isShared = $false # Changez cette logique selon vos besoins

        if ($isShared) {
            $message = "Dossier déjà partagé: Continuer pour réinitialiser les paramètres de partage ou rien faire?"
            $title = "Dossier déjà partagé"
            $response = [System.Windows.Forms.MessageBox]::Show($message, $title, [System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Question)

            if ($response -eq [System.Windows.Forms.DialogResult]::Yes) {
                # Réinitialiser le partage et définir les permissions
                ResetAndShareFolder $selectedFolderPath $selectedFolderName
            }
        } else {
            # Partager le dossier et définir les permissions si non partagé
            ResetAndShareFolder $selectedFolderPath $selectedFolderName
        }
    }
   
   UpdateOUList

           # Mise à jour de la liste des OUs et sélection du nouvel OU
        UpdateOUListAndSelect -selectedOUName $selectedFolderName

        # Fermer la fenêtre de dialogue de sélection du dossier
        $folderBrowser.Dispose()
})





# Création de la liste pour afficher les OUs
$ouList = New-Object System.Windows.Forms.ListBox
$ouList.Location = New-Object System.Drawing.Point(10, 100)
$ouList.Size = New-Object System.Drawing.Size(260, 700)



function Remove-OUWithChildren {
    param(
        [string]$ouName
    )

    $ou = Get-ADOrganizationalUnit -Filter "Name -eq '$ouName'" -Properties ProtectedFromAccidentalDeletion
    if ($ou -eq $null) {
        Write-Host "OU non trouvée"
        return
    }

    $children = Get-ADObject -Filter * -SearchBase $ou.DistinguishedName -SearchScope OneLevel
    foreach ($child in $children) {
        if ($child.ObjectClass -eq "organizationalUnit") {
            Remove-OUWithChildren -ouName $child.Name
        }
        else {
            Remove-ADObject -Identity $child.DistinguishedName -Confirm:$false -ErrorAction Stop
        }
    }

    # Retirer la protection contre la suppression et supprimer l'OU
    Set-ADOrganizationalUnit -Identity $ou.DistinguishedName -ProtectedFromAccidentalDeletion $false -ErrorAction Stop
    Remove-ADOrganizationalUnit -Identity $ou.DistinguishedName -Confirm:$false -ErrorAction Stop
    Write-Host "OU supprimée: $ouName"
}

# Ajout du gestionnaire d'événements pour la suppression de l'OU
$ouList.Add_KeyDown({
        param($sender, $e)
        if ($e.KeyCode -eq 'Delete' -and $ouList.SelectedItem -ne $null) {
            $message = "Voulez-vous vraiment supprimer l'OU `"($ouList.SelectedItem)`" et tous ses objets enfants de manière irréversible?"
            $title = "Confirmer la suppression"
            $response = [System.Windows.Forms.MessageBox]::Show($message, $title, [System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Warning)
        
            if ($response -eq 'Yes') {
                Remove-OUWithChildren -ouName $ouList.SelectedItem
                # Mettre à jour la liste des OUs après suppression
                Filter-OUList -filterText $filterOUTextBox.Text
            }
        }
    })


















# Création des listes pour afficher les membres des groupes
$readMembersList = New-Object System.Windows.Forms.ListBox
$readMembersList.Location = New-Object System.Drawing.Point(300, 200)
$readMembersList.Size = New-Object System.Drawing.Size(260, 150)

$readWriteMembersList = New-Object System.Windows.Forms.ListBox
$readWriteMembersList.Location = New-Object System.Drawing.Point(300, 400)
$readWriteMembersList.Size = New-Object System.Drawing.Size(260, 150)

$fullControlMembersList = New-Object System.Windows.Forms.ListBox
$fullControlMembersList.Location = New-Object System.Drawing.Point(300, 600)
$fullControlMembersList.Size = New-Object System.Drawing.Size(260, 150)

# Ajout des listes au formulaire
$form.Controls.Add($ouList)
$form.Controls.Add($readMembersList)
$form.Controls.Add($readWriteMembersList)
$form.Controls.Add($fullControlMembersList)






# Ajout des légendes pour chaque liste
$readLabel = New-Object System.Windows.Forms.Label
$readLabel.Location = New-Object System.Drawing.Point(300, 180)
$readLabel.Size = New-Object System.Drawing.Size(260, 20)
$readLabel.Text = "Lecture"
$form.Controls.Add($readLabel)

$readWriteLabel = New-Object System.Windows.Forms.Label
$readWriteLabel.Location = New-Object System.Drawing.Point(300, 380)
$readWriteLabel.Size = New-Object System.Drawing.Size(260, 20)
$readWriteLabel.Text = "Lecture Écriture"
$form.Controls.Add($readWriteLabel)

$fullControlLabel = New-Object System.Windows.Forms.Label
$fullControlLabel.Location = New-Object System.Drawing.Point(300, 580)
$fullControlLabel.Size = New-Object System.Drawing.Size(260, 20)
$fullControlLabel.Text = "Contrôle Total"
$form.Controls.Add($fullControlLabel)












$openFolderButton = New-Object System.Windows.Forms.Button
$openFolderButton.Location = New-Object System.Drawing.Point(300, 100) # Ajustez la position en conséquence
$openFolderButton.Size = New-Object System.Drawing.Size(260, 30)
$openFolderButton.Text = 'Ouvrir le dossier'
$form.Controls.Add($openFolderButton)

# Gestionnaire d'événements pour le bouton d'ouverture de dossier
$openFolderButton.Add_Click({
        if ($ouList.SelectedItem -ne $null) {
            $selectedOUName = $ouList.SelectedItem
            $ou = Get-ADOrganizationalUnit -Filter "Name -eq '$selectedOUName'" -SearchBase "OU=GroupesLocaux,OU=AGDLP,DC=AGDLP,DC=LAN" -Properties Description
            $folderPath = $ou.Description
        
            if (Test-Path -Path $folderPath) {
                Invoke-Item -Path $folderPath
            }
            else {
                [System.Windows.Forms.MessageBox]::Show("Le chemin du dossier n'existe pas ou n'est pas accessible.", "Erreur", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
            }
        }
    })










# Fonction pour mettre à jour les listes des membres des groupes
function Update-MembersLists {
    param([string]$selectedOU)

    

    # Réinitialiser les sélections et les bordures (en utilisant BackColor pour la bordure)
    $readMembersList.Items.Clear()
    $readWriteMembersList.Items.Clear()
    $fullControlMembersList.Items.Clear()
    $readMembersList.BackColor = 'White'
    $readWriteMembersList.BackColor = 'White'
    $fullControlMembersList.BackColor = 'White'

    # Supposons que $selectedOU est le nom de l'OU et que vos groupes se terminent par _Read, _ReadWrite et _FullControl
    $readGroup = Get-ADGroup -Filter "Name -like '*_$($selectedOU)_Read'" -SearchBase "OU=GroupesLocaux,OU=AGDLP,DC=AGDLP,DC=LAN" -ErrorAction SilentlyContinue
    $readWriteGroup = Get-ADGroup -Filter "Name -like '*_$($selectedOU)_ReadWrite'" -SearchBase "OU=GroupesLocaux,OU=AGDLP,DC=AGDLP,DC=LAN" -ErrorAction SilentlyContinue
    $fullControlGroup = Get-ADGroup -Filter "Name -like '*_$($selectedOU)_FullControl'" -SearchBase "OU=GroupesLocaux,OU=AGDLP,DC=AGDLP,DC=LAN" -ErrorAction SilentlyContinue

    if ($readGroup) {
        $members = Get-ADGroupMember -Identity $readGroup
        foreach ($member in $members) {
            $readMembersList.Items.Add($member.Name)
        }
    }
    if ($readWriteGroup) {
        $members = Get-ADGroupMember -Identity $readWriteGroup
        foreach ($member in $members) {
            $readWriteMembersList.Items.Add($member.Name)
        }
    }
    if ($fullControlGroup) {
        $members = Get-ADGroupMember -Identity $fullControlGroup
        foreach ($member in $members) {
            $fullControlMembersList.Items.Add($member.Name)
        }
    }
}



function Update-LocalGroupMemberList {
    param([string]$localGroupName, [System.Windows.Forms.ListBox]$listBoxToUpdate)

    $listBoxToUpdate.Items.Clear()
    $groupMembers = Get-ADGroupMember -Identity $localGroupName -ErrorAction SilentlyContinue
    foreach ($member in $groupMembers) {
        $listBoxToUpdate.Items.Add($member.SamAccountName)
    }
}



# Ajout du gestionnaire d'événements MouseDoubleClick à la liste des groupes globaux
$groupList.Add_MouseDoubleClick({
        $selectedGroupLocalName = $null
        $listBoxToUpdate = $null

        if ($readMembersList.BorderStyle -eq 'Fixed3D') {
            $selectedGroupLocalName = "DL_$($ouList.SelectedItem)_Read"
            $listBoxToUpdate = $readMembersList
        }
        elseif ($readWriteMembersList.BorderStyle -eq 'Fixed3D') {
            $selectedGroupLocalName = "DL_$($ouList.SelectedItem)_ReadWrite"
            $listBoxToUpdate = $readWriteMembersList
        }
        elseif ($fullControlMembersList.BorderStyle -eq 'Fixed3D') {
            $selectedGroupLocalName = "DL_$($ouList.SelectedItem)_FullControl"
            $listBoxToUpdate = $fullControlMembersList
        }

        if ($selectedGroupLocalName -and $listBoxToUpdate) {
            try {
                Add-ADGroupMember -Identity $selectedGroupLocalName -Members $groupList.SelectedItem
                [System.Windows.Forms.MessageBox]::Show("Le groupe global '$($groupList.SelectedItem)' a été ajouté au groupe local '$selectedGroupLocalName' avec succès.")
                Update-LocalGroupMemberList -localGroupName $selectedGroupLocalName -listBoxToUpdate $listBoxToUpdate

                
                Update-LocalGroupsOfGlobalGroup -globalGroupName $groupList.SelectedItem
            }
            catch {
                [System.Windows.Forms.MessageBox]::Show("Une erreur est survenue lors de l'ajout du groupe global au groupe local: $_", "Erreur", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
            }
        }
        else {
            [System.Windows.Forms.MessageBox]::Show("Veuillez choisir une permission d'un répertoire.", "Sélection requise", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning)
        }
    })









# Mise en surbrillance du groupe local sélectionné
function HighlightSelectedGroupLocal {
    param($selectedListBox)

    $readMembersList.BorderStyle = 'None'
    $readWriteMembersList.BorderStyle = 'None'
    $fullControlMembersList.BorderStyle = 'None'

    $selectedListBox.BorderStyle = 'Fixed3D'
}



# Gestionnaire d'événements pour la sélection d'une liste de groupe local
$readMembersList.Add_Click({
        HighlightSelectedGroupLocal -selectedListBox $readMembersList
    })

$readWriteMembersList.Add_Click({
        HighlightSelectedGroupLocal -selectedListBox $readWriteMembersList
    })

$fullControlMembersList.Add_Click({
        HighlightSelectedGroupLocal -selectedListBox $fullControlMembersList
    })











# Remplir la liste des OUs
$ous = Get-ADOrganizationalUnit -Filter * -SearchBase "OU=GroupesLocaux,OU=AGDLP,DC=AGDLP,DC=LAN" -ErrorAction SilentlyContinue
foreach ($ou in $ous) {
    $ouList.Items.Add($ou.Name)
}

# Fonction pour filtrer et mettre à jour la liste des OUs
function Filter-OUList {
    param([string]$filterText)
    
    $ouList.Items.Clear()

    # Si le filtre est vide, retournez tous les OUs, sinon retournez les OUs filtrés
    $ouFilter = if ($filterText) { "Name -like '*$filterText*'" } else { "*" }
    $filteredOUs = Get-ADOrganizationalUnit -Filter $ouFilter -SearchBase "OU=GroupesLocaux,OU=AGDLP,DC=AGDLP,DC=LAN"
    
    foreach ($ou in $filteredOUs) {
        $ouList.Items.Add($ou.Name)
    }
}


# Création du champ de texte pour le filtre des OUs
$filterOUTextBox = New-Object System.Windows.Forms.TextBox
$filterOUTextBox.Location = New-Object System.Drawing.Point(10, 70)
$filterOUTextBox.Size = New-Object System.Drawing.Size(260, 20)
$form.Controls.Add($filterOUTextBox)

# Gestionnaire d'événements pour le changement de texte du filtre des OUs
$filterOUTextBox.Add_TextChanged({
        Filter-OUList -filterText $filterOUTextBox.Text
    })

# Mettre à jour initialement la liste complète des OUs
Filter-OUList -filterText ''








# Fonction pour réinitialiser la couleur de toutes les listes et appliquer la couleur à la liste sélectionnée
function SetListBackColor {
    param(
        [System.Windows.Forms.ListBox]$selectedListBox
    )

    $readMembersList.BackColor = 'White'
    $readWriteMembersList.BackColor = 'White'
    $fullControlMembersList.BackColor = 'White'

    # Appliquer la couleur verte uniquement à la liste sélectionnée
    $selectedListBox.BackColor = 'LightGreen'

    $groupList.Visible = 1


}

# Gestionnaire d'événements pour la sélection d'une liste de groupe local
$readMembersList.Add_Click({
        SetListBackColor -selectedListBox $readMembersList
    })

$readWriteMembersList.Add_Click({
        SetListBackColor -selectedListBox $readWriteMembersList
    })

$fullControlMembersList.Add_Click({
        SetListBackColor -selectedListBox $fullControlMembersList
    })


# Assurez-vous d'appeler SetListBackColor lorsque l'OU est changé
$ouList.Add_SelectedIndexChanged({
        Update-MembersLists -selectedOU $ouList.SelectedItem


        $groupList.Visible = 0
        $groupMemberList.Visible = 0
        $userList.Visible = 0
        $filterTextBox.Visible = 0


        $readMembersList.Visible = $true
        $readWriteMembersList.Visible = $true
        $fullControlMembersList.Visible = $true
        $openFolderButton.Visible = $true 

    })




# Utilisez également l'événement SelectedIndexChanged pour les listes de membres
$readMembersList.Add_SelectedIndexChanged({
        SetListBackColor -selectedListBox $readMembersList
    })

$readWriteMembersList.Add_SelectedIndexChanged({
        SetListBackColor -selectedListBox $readWriteMembersList
    })

$fullControlMembersList.Add_SelectedIndexChanged({
        SetListBackColor -selectedListBox $fullControlMembersList
    })









# Fonction pour demander une confirmation avant de retirer un membre d'un groupe local
function Request-ConfirmationAndRemoveMember {
    param(
        [string]$localGroupName,
        [System.Windows.Forms.ListBox]$listBoxToUpdate,
        [string]$memberToRemove
    )

    $message = "Êtes-vous sûr de vouloir supprimer l'utilisateur `'$memberToRemove`' du groupe `'$localGroupName`'?"
    $title = "Confirmer la suppression"
    $response = [System.Windows.Forms.MessageBox]::Show($message, $title, [System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Warning)
    
    if ($response -eq 'Yes') {
        Remove-ADGroupMember -Identity $localGroupName -Members $memberToRemove -Confirm:$false -ErrorAction Stop
        Update-LocalGroupMemberList -localGroupName $localGroupName -listBoxToUpdate $listBoxToUpdate
    }
}

# Modifiez les gestionnaires d'événements KeyDown pour inclure une demande de confirmation
$readMembersList.Add_KeyDown({
        param($sender, $e)
        if ($e.KeyCode -eq 'Delete' -and $readMembersList.SelectedItem -ne $null) {
            Request-ConfirmationAndRemoveMember -localGroupName "DL_$($ouList.SelectedItem)_Read" -listBoxToUpdate $readMembersList -memberToRemove $readMembersList.SelectedItem
       Update-LocalGroupsOfGlobalGroup -globalGroupName $groupList.SelectedItem
        }
    })

$readWriteMembersList.Add_KeyDown({
        param($sender, $e)
        if ($e.KeyCode -eq 'Delete' -and $readWriteMembersList.SelectedItem -ne $null) {
            Request-ConfirmationAndRemoveMember -localGroupName "DL_$($ouList.SelectedItem)_ReadWrite" -listBoxToUpdate $readWriteMembersList -memberToRemove $readWriteMembersList.SelectedItem
       Update-LocalGroupsOfGlobalGroup -globalGroupName $groupList.SelectedItem
        }
    })

$fullControlMembersList.Add_KeyDown({
        param($sender, $e)
        if ($e.KeyCode -eq 'Delete' -and $fullControlMembersList.SelectedItem -ne $null) {
            Request-ConfirmationAndRemoveMember -localGroupName "DL_$($ouList.SelectedItem)_FullControl" -listBoxToUpdate $fullControlMembersList -memberToRemove $fullControlMembersList.SelectedItem
       Update-LocalGroupsOfGlobalGroup -globalGroupName $groupList.SelectedItem
        }
    })













# Définissez la visibilité des contrôles qui doivent être cachés au démarrage
$groupList.Visible = $false
$groupMemberList.Visible = $false
$userList.Visible = $false
$filterTextBox.Visible = $false
$readMembersList.Visible = $false
$readWriteMembersList.Visible = $false
$fullControlMembersList.Visible = $false
$openFolderButton.Visible = $false 


















# Création du bouton pour exécuter arborescence.ps1
$buttonExecuteScript = New-Object System.Windows.Forms.Button
$buttonExecuteScript.Location = New-Object System.Drawing.Point(730, 600) # Ajustez la position si nécessaire
$buttonExecuteScript.Size = New-Object System.Drawing.Size(200, 30)
$buttonExecuteScript.Text = "Voir L'arborescence des groupes"

# Ajout du bouton au formulaire
$form.Controls.Add($buttonExecuteScript)

# Gestionnaire d'événement pour le bouton
$buttonExecuteScript.Add_Click({
    $scriptPath = Join-Path $PSScriptRoot "arborescence.ps1"
    if (Test-Path $scriptPath) {
        try {
            Invoke-Expression "& `"$scriptPath`""
        } catch {
            [System.Windows.Forms.MessageBox]::Show("Une erreur est survenue lors de l'exécution du script: $($_.Exception.Message)", "Erreur", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
        }
    } else {
        [System.Windows.Forms.MessageBox]::Show("Le script arborescence.ps1 est introuvable dans le répertoire.", "Script non trouvé", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning)
    }
})























# Affichage du formulaire
$form.ShowDialog()

