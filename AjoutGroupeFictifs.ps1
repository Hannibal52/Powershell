clear

# Import the ActiveDirectory module
Import-Module ActiveDirectory

function New-GlobalGroup {
    param(
        [string]$GroupName,
        [string]$OrganizationalUnit
    )

    $ldapPath = "OU=$OrganizationalUnit,OU=AGDLP,DC=AGDLP,DC=LAN"

    try {
        # Create the group
        New-ADGroup -Name $GroupName -Path $ldapPath -GroupScope Global -ErrorAction Stop
        # Get the group to return its DN
        $group = Get-ADGroup -Identity $GroupName
        Write-Host "Group '$GroupName' created successfully."
        return $group.DistinguishedName
    } catch {
        Write-Host "Error creating group '$GroupName': $_"
    }
}



function Add-GroupMember {
    param(
        [string]$GroupDN,
        [string]$MemberDN
    )

    try {
        Add-ADGroupMember -Identity $GroupDN -Members $MemberDN -ErrorAction Stop
        Write-Host "Member with DN '$MemberDN' added to group with DN '$GroupDN' successfully."
    } catch {
        Write-Host "Error adding member with DN '$MemberDN' to group with DN '$GroupDN': $_"
    }
}




# Liste des départements et des noms de groupes à créer
$departmentsAndGroups = @{
    'Isère' = @{
    'Direction' = @('Conseil administration', 'Comité exécutif', 'Assistants de direction')
    'RH' = @('Recrutement', 'Formation', 'Relations sociales')
    'Comptabilité' = @('Créditeurs', 'Débiteurs', 'Paie')
    'Support' = @('Aide Technique', 'Support Client', 'Infrastructure')
    'Achats' = @('Sourcing', 'Négociations', 'Gestion des fournisseurs')
    'Sécurité' = @('Sécurité des systèmes', 'Sécurité physique', 'Conformité')
    'Juridique' = @('Conseil', 'Litiges', 'Contrats')
    'IT' = @('Admins Réseau', 'Admins Système', 'Développeurs', 'Analystes')
    }

 'Savoie'= @{
    'Développement' = @('Développeurs Frontend', 'Développeurs Backend', 'Gestion de projet')
    'Ventes' = @('Acquisition', 'Fidélisation', 'Support Ventes')
    'Marketing' = @('Publicité', 'Événementiel', 'Étude de marché')
    'R&D' = @('Innovation', 'Prototypage', 'Études scientifiques')
    'Production' = @('Planification', 'Opérations', 'Maintenance')
    'Qualité' = @('Contrôle Qualité', 'Assurance Qualité', 'Certifications')
    'Logistique' = @('Transport', 'Stockage', 'Gestion des commandes')}

}



# Iterate through the departments and categories
foreach ($department in $departmentsAndGroups.Keys) {
    $departmentDN = New-GlobalGroup -GroupName $department -OrganizationalUnit "GroupesGlobaux"

    foreach ($category in $departmentsAndGroups[$department].Keys) {
        $categoryDN = New-GlobalGroup -GroupName $category -OrganizationalUnit "GroupesGlobaux"
        if ($categoryDN) {
            Add-GroupMember -GroupDN $departmentDN -MemberDN $categoryDN
        }

        foreach ($childGroupName in $departmentsAndGroups[$department][$category]) {
            $childDN = New-GlobalGroup -GroupName $childGroupName -OrganizationalUnit "GroupesGlobaux"

            Write-Host  $childDN $categoryDN


            if ($childDN) {
                Add-GroupMember -GroupDN $categoryDN -MemberDN $childDN
            }
        }
    }
}
