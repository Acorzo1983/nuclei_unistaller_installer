
# Nuclei Installer and Cleaner Script

This script allows you to easily install or uninstall and clean the Nuclei tool on your Linux system. Nuclei is a fast, customizable vulnerability scanner based on simple YAML-based DSL.

## Prerequisites

- A Linux-based operating system
- Internet connection
- `go` installed (Go programming language)

## Features

- **Installation**: Automatically installs the latest version of Nuclei.
- **Uninstallation and Cleanup**: Completely removes Nuclei and its related files from your system.

## Usage

### Running the Script

1. Download the script to your local machine.
    ```bash
   wget https://raw.githubusercontent.com/Acorzo1983/nuclei_unistaller_installer/main/nuclei_uninstaller_installer.sh
   ```  
3. Make the script executable:
   ```bash
   chmod +x nuclei_uninstaller_installer.sh
   ```
4. Run the script:
   ```bash
   sudo bash nuclei_uninstaller_installer.sh
   ```

### Script Options

Upon running the script, you will be prompted to choose one of the following options:

1. **Install**: This option will install the latest version of Nuclei.
2. **Uninstall and Clean Files**: This option will uninstall Nuclei and remove all related files from your system.

### Example

```sh
$ ./nuclei_uninstaller_installer.sh
What would you like to do?
1. Install
2. Uninstall and clean files
Please enter your choice (1 or 2): 1
Installing Nuclei...
Nuclei version x.y.z installed successfully.
```

```sh
$ ./nuclei_uninstaller_installer.sh
What would you like to do?
1. Install
2. Uninstall and clean files
Please enter your choice (1 or 2): 2
Are you sure you want to uninstall and clean Nuclei? (y/n): y
Uninstalling and cleaning Nuclei...
Nuclei has been successfully uninstalled and cleaned.
```

## Contributions

Contributions are welcome! Feel free to open an issue or submit a pull request.

## License

This project is licensed under the MIT License. See the LICENSE file for details.

---

*This tool is made with love by Albert C.*
