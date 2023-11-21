# Create-AD-users
My school things

# Active Directory User Creation Script

This PowerShell script automates the creation of users in Active Directory from a CSV file.

## Usage

1. **CSV File**: Prepare a CSV file containing user information with headers like `Username`, `Firstname`, and `Lastname`.

2. **Update Script Parameters**: Modify the script variables according to your environment:

   ```powershell
   $CSVPath = "C:\Scripts\userlist.csv"
   $GroupName = "Test"
   $OUPath = "OU=Test,OU=OU - All,DC=yourdomain,DC=local"
   $DomainPath = "yourdomain.local"

## CSV Format

Ensure that your CSV file follows the format below:
 ```plaintext
Username,Firstname,Lastname
matti.meikalainen,Matti,Meikäläinen
anna.asiakas,Anna,Asiakas
jari.jarvinen,Jari,Järvinen
laura.lampinen,Laura,Lampinen
