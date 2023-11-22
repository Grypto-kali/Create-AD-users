# Define the file path for the CSV file
$CSVPath = "C:\Skriptit\userlist.csv"
$GroupName = "Testi"  # Group name
$OUPath = "OU=Testi,OU=OU - Kaikki,DC=jm,DC=local"  # OU path
$DomainPath = "jm.local"

$Users = Import-Csv $CSVPath # Read the CSV file and create users

foreach ($User in $Users) {
    $Username = $User.Username
    $Password = "Kpedu@malessa"
    $Firstname = $User.Firstname
    $Lastname = $User.Lastname
    $OU = $OUPath  # OU path
    $Group = $GroupName  # Group name
    $DisplayName = "$Firstname $Lastname"
    $Description = $GroupName

    # Create a new user
    New-ADUser -SamAccountName $Username `
                -UserPrincipalName "$Username@$DomainPath" `
                -Name "$DisplayName" `
                -GivenName $Firstname `
                -Surname $Lastname `
                -Enabled $true `
                -ChangePasswordAtLogon $false `
                -PasswordNeverExpires $true `
                -OtherAttributes @{'Description'=$Description} `
                -Path $OU `
                -AccountPassword (ConvertTo-SecureString $Password -AsPlainText -Force)

    # Add the user to the group
    Add-ADGroupMember -Identity $Group -Members $Username

    Write-Host "User $Username created successfully. Added to group: $Group. Password: $Password"
}
