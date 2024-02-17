# Assurez-vous que le module ActiveDirectory est importé
Import-Module ActiveDirectory

function Build-GroupTree {
    param(
        [string]$GroupName,
        [System.Windows.Forms.TreeNode]$ParentNode = $null
    )
    
    # Si le groupe a déjà un TreeNode, ne pas en créer un nouveau
    if ($global:groupNodes.ContainsKey($GroupName)) {
        if ($ParentNode -ne $null -and $ParentNode.Nodes.ContainsKey($GroupName) -eq $false) {
            $ParentNode.Nodes.Add($global:groupNodes[$GroupName])
        }
        return
    }

    # Créer un nouveau TreeNode pour ce groupe
    $node = New-Object System.Windows.Forms.TreeNode($GroupName)
    $global:groupNodes[$GroupName] = $node
    
    if ($ParentNode -ne $null) {
        $ParentNode.Nodes.Add($node)
    }

    # Trouver tous les groupes enfants
    $childGroups = Get-ADGroupMember -Identity $GroupName -ErrorAction SilentlyContinue |
                   Where-Object { $_.objectClass -eq 'group' } |
                   Get-ADGroup -Properties Name

    foreach ($childGroup in $childGroups) {
        Build-GroupTree -GroupName $childGroup.Name -ParentNode $node
    }
}

# Création du formulaire et du TreeView
$form = New-Object System.Windows.Forms.Form
$form.Width = 400
$form.Height = 400
$form.StartPosition = "Manual"
$form.Location = New-Object System.Drawing.Point(600, 450)

$treeView = New-Object System.Windows.Forms.TreeView
$treeView.Dock = [System.Windows.Forms.DockStyle]::Fill




# Ajouter le TreeView au formulaire
$form.Controls.Add($treeView)

# Initialiser un dictionnaire global pour suivre les nœuds de l'arbre
$global:groupNodes = @{}

# Construire l'arbre en partant des groupes de niveau supérieur
$rootGroups = Get-ADGroup -Filter 'GroupScope -eq "Global"' -SearchBase "OU=GroupesGlobaux,OU=AGDLP,DC=AGDLP,DC=LAN"

foreach ($rootGroup in $rootGroups) {
    Build-GroupTree -GroupName $rootGroup.Name
}

# Ajouter tous les nœuds racines au TreeView
$global:groupNodes.Values | Where-Object { $_.Parent -eq $null } | ForEach-Object {
    $treeView.Nodes.Add($_)
}

# Afficher le formulaire
$form.ShowDialog()
