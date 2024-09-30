### Terraform Installation on Ubuntu

#### Step-by-Step Guide

1. **Update the System:**
   - Open the terminal and run the following command to update your package list and install any available updates:
     ```bash
     sudo apt-get update && sudo apt-get upgrade -y
     ```

2. **Install Dependencies:**
   - Ensure that necessary dependencies such as `curl` and `unzip` are installed:
     ```bash
     sudo apt-get install -y curl unzip
     ```

3. **Download Terraform:**
   - Download the latest version of Terraform. Replace `1.0.0` with the desired version:
     ```bash
     curl -LO https://releases.hashicorp.com/terraform/1.0.0/terraform_1.0.0_linux_amd64.zip
     ```

4. **Unzip the Terraform Package:**
   - Unzip the downloaded Terraform package:
     ```bash
     unzip terraform_1.0.0_linux_amd64.zip
     ```

5. **Move Terraform to `/usr/local/bin`:**
   - Move the `terraform` binary to a directory included in your system's `PATH`:
     ```bash
     sudo mv terraform /usr/local/bin/
     ```

6. **Verify the Installation:**
   - Check if Terraform is installed correctly by running:
     ```bash
     terraform -v
     ```

### Terraform Installation on macOS

#### Step-by-Step Guide

1. **Install Homebrew (if not already installed):**
   - Homebrew is a package manager for macOS. If you don't have it installed, run the following command in your terminal:
     ```bash
     /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
     ```

2. **Update Homebrew:**
   - Update Homebrew to make sure you have the latest version of all formulae:
     ```bash
     brew update
     ```

3. **Install Terraform Using Homebrew:**
   - You can install Terraform directly using Homebrew:
     ```bash
     brew tap hashicorp/tap
     brew install hashicorp/tap/terraform
     ```

4. **Verify the Installation:**
   - Check if Terraform is installed correctly by running:
     ```bash
     terraform -v
     ```

### Additional Steps for Both Ubuntu and macOS

1. **Configure Environment Variables (Optional):**
   - If you want to make Terraform available globally, add it to your `PATH`. Open your shell configuration file (`~/.bashrc`, `~/.zshrc`, etc.) and add the following line:
     ```bash
     export PATH=$PATH:/usr/local/bin/terraform
     ```
   - Apply the changes:
     ```bash
     source ~/.bashrc  # or source ~/.zshrc for zsh users
     ```

2. **Basic Terraform Commands to Test Installation:**
   - Initialize a new or existing Terraform configuration:
     ```bash
     terraform init
     ```
   - Create an execution plan:
     ```bash
     terraform plan
     ```
   - Apply the configuration:
     ```bash
     terraform apply
     ```

### TFswitch installation guide

[Official documentation](https://tfswitch.warrensbox.com/Installation/)