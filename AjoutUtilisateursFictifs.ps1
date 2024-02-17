# Import the ActiveDirectory module
Import-Module ActiveDirectory


$firstNames = @("Jean", "Marie", "Pierre", "Sophie", "Émilie", "Luc", "Anna", "David", "Élise", "Antoine", "Julie", "Thomas", "Sarah", "Nicolas", "Laura", "Mathieu", "Claire", "Gabriel", "Caroline", "Alexandre", "Manon", "Vincent", "Catherine", "Maxime")
$lastNames = @("Dupont", "Durand", "Leroy", "Moreau", "Lambert", "Simon", "Roux", "David", "Bertrand", "Morel", "Fournier", "Girard", "Bonnet", "Roy", "Denis", "Lefevre", "Martin", "Mercier", "François", "Lefebvre", "Michel", "Perrin", "Rousseau", "Brun")

# Générer 25 utilisateurs fictifs
for ($i = 1; $i -le 25; $i++) {
    $firstName = $firstNames | Get-Random
    $lastName = $lastNames | Get-Random
    $samAccountName = ("{0}{1}{2}" -f $firstName, $lastName, $i).ToLower()
    $userPrincipalName = "$samAccountName@yourdomain.com"
    $displayName = "$firstName $lastName"
    New-ADUser -Name $displayName -GivenName $firstName -Surname $lastName -SamAccountName $samAccountName -UserPrincipalName $userPrincipalName -Path "OU=Utilisateurs,OU=AGDLP,DC=AGDLP,DC=LAN" -AccountPassword (ConvertTo-SecureString "Password123" -AsPlainText -Force) -Enabled $true -PasswordNeverExpires $true -ErrorAction SilentlyContinue
    Write-Host "User created: $displayName"
}
