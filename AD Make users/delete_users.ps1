# Specify the file path for the CSV file
$CSVPath = "C:\Skriptit\userlist.csv"
$GroupName = "Testi"  # Group name
$OUPath = "OU=Testi,OU=OU - Kaikki,DC=yourdomain,DC=local"  # OU path
$DomainPath = "yourdomain.local"

$Users = Import-Csv $CSVPath  # Read CSV file and create users

foreach ($User in $Users) {
    $Username = $User.Username
    $OU = $OUPath  # OU path
    $Group = $GroupName  # Group name

    # Remove the user from the group
    Remove-ADGroupMember -Identity $Group -Members $Username -Confirm:$false

    # Get the user's DistinguishedName
    $UserDN = Get-ADUser -Filter {SamAccountName -eq $Username} | Select-Object -ExpandProperty DistinguishedName

    # Remove the user
    Remove-ADUser -Identity $UserDN -Confirm:$false

    Write-Host "User $Username removed successfully from group $Group and deleted."
}
