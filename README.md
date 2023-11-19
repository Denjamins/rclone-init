# Rclone Init

**rclone-init** is a Bash script created by Denis Surkov to simplify the management of the Rclone tool on your system. Rclone is a powerful command-line program to manage files on cloud storage. This script automates the installation and updating process for Rclone.

## Features

- **Version Checking**: The script checks the version of Rclone installed on your system and compares it with the latest version available on GitHub.

- **Automatic Update**: If a new version of Rclone is available, the script prompts you to update. The update process is handled seamlessly.

- **Installation**: In case Rclone is not found on your system, the script offers to install it for you. The installation process is straightforward and ensures that Rclone is properly set up.

## Installation:
1. Download to the user home directory with:
   ```bash
   wget -O rclone-init.sh https://raw.githubusercontent.com/Denjamins/rclone-init/main/rclone-init.sh
   ```
2. Add `source ~/rclone-init.sh` to your `.bashrc`:
   ```bash
   echo "source ~/rclone-init.sh" >> ~/.bashrc
   ```
   or `.bash_profile`:
   ```bash
   echo "source ~/rclone-init.sh" >> ~/.bash_profile
   ```

### How it works

- The script fetches the latest version of itself from the GitHub repository to ensure it is up to date.

- It then checks for the presence of Rclone on your system. If not found, it provides an option to install it.

- If Rclone is already installed, it compares the installed version with the latest version available and prompts you to update if necessary.

## Getting Started

Visit the [GitHub repository](https://github.com/Denjamins/rclone-init) for more details and to contribute to the project.

## Author

- Denis Surkov
- GitHub: [Denjamins](https://github.com/Denjamins)
