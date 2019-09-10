<#
------------------
This is the old (pre-WS2012) way:

makecert -n "CN=PowerShell Local Certificate Root" -a sha1 `
-eku 1.3.6.1.5.5.7.3.3 -r -sv root.pvk root.cer `
-ss Root -sr localMachine

Translated to: 
create a certificate 
with this X.500 name
and this digest 
and this EKU 
which is self-signed
and has this private key 
and is called this
in this store
in this location

makecert -pe -n "CN=PowerShell User" -ss MY -a sha1 `
-eku 1.3.6.1.5.5.7.3.3 -iv root.pvk -ic root.cer

Translated to:
create a certificate 
which has an exportable pk
with this X.500 name
in this store
with this digest 
and this EKU
using this key
and this certificate

------------------
The EKU for "code signing" is 1.3.6.1.5.5.7.3.3
Make your own cert for signing scripts:
New-SelfSignedCertificate <TODO: convert from makecert>

------------------
Find a specific cert by thumbprint (or something else):
dir -recurse | where {$_.Thumbprint -eq “<thumbprint>”} | Format-List -property *

------------------
Example for signing stuff:
$cert = @(Get-ChildItem cert:\CurrentUser\My -codesigning)[0]
Set-AuthenticodeSignature $file $cert

------------------
After the Set-AuthenticodeSignature command, you can run your code. 
If the cert is self-signed, PS will still complain a bit. Just run it anyway.
#>
echo "Read comments in this code to create a self-signed certificate so you can run your code!"