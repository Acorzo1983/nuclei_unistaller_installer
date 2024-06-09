#!/bin/bash

# Function to print message in orange
print_orange() {
    echo -e "\e[38;5;214m$1\e[0m"
}

# Display the message in orange
print_orange "This tool is made with love by Albert C."

# Function to install Nuclei
install_tool() {
    echo "Installing Nuclei..."
    wget -qO- https://api.github.com/repos/projectdiscovery/nuclei/releases/latest | grep "browser_download_url.*nuclei.*linux_amd64.zip" | cut -d : -f 2,3 | tr -d \" | wget -qi -
    unzip nuclei_*_linux_amd64.zip
    sudo mv nuclei /usr/local/bin/
    chmod +x /usr/local/bin/nuclei
    rm nuclei_*_linux_amd64.zip

    if command -v nuclei &> /dev/null; then
        echo "Nuclei version $(nuclei -version) installed successfully."
    else
        echo "Failed to install Nuclei."
    fi
}

# Function to uninstall and clean Nuclei
uninstall_tool() {
    echo "Uninstalling and cleaning Nuclei..."
    
    # Uninstall Nuclei if it's installed
    if command -v nuclei &> /dev/null; then
        echo "Uninstalling Nuclei..."
        sudo rm -f /usr/local/bin/nuclei
        sudo rm -rf ~/.nuclei
    else
        echo "Nuclei is not installed."
    fi

    # Clean any remaining Nuclei related files
    echo "Cleaning up Nuclei related files..."
    sudo rm -rf /usr/local/share/nuclei
    sudo rm -rf /usr/local/etc/nuclei
    sudo rm -rf /usr/local/lib/nuclei
    sudo rm -rf /usr/local/bin/nuclei
    sudo rm -rf /usr/share/nuclei
    sudo rm -rf /etc/nuclei
    sudo rm -rf /lib/nuclei
    sudo rm -rf /bin/nuclei
    rm -rf ~/go/bin/nuclei
    rm -rf ~/go/pkg/mod/cache/download/sumdb/sum.golang.org/lookup/github.com/projectdiscovery/nuclei
    rm -rf ~/go/pkg/mod/cache/download/github.com/projectdiscovery/nuclei
    rm -rf ~/go/pkg/mod/github.com/projectdiscovery/nuclei
    rm -rf ~/go/pkg/mod/github.com/projectdiscovery/nuclei/v3@v3.2.8/cmd/nuclei
    rm -rf ~/go/pkg/mod/github.com/projectdiscovery/nuclei/v3@v3.2.8/pkg/templates/signer/.nuclei-config/nuclei

    # Find and remove any remaining Nuclei files on the system
    echo "Searching for additional Nuclei files..."
    sudo find / -name "nuclei" -exec rm -rf {} \;

    # Verify uninstallation
    if ! command -v nuclei &> /dev/null; then
        echo "Nuclei has been successfully uninstalled and cleaned."
    else
        echo "Failed to uninstall Nuclei."
    fi
}

# Main script logic
if [[ $# -eq 0 ]]; then
    echo "No arguments provided. Use -i to install or -u to uninstall and clean files."
    exit
