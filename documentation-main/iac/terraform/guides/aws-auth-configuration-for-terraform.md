### Configuring AWS CLI for AWS Account Authentication (option 1)

#### Step-by-Step Guide

### Prerequisites
1. **Install AWS CLI:**
   - If you haven't installed the AWS CLI yet, you can find installation instructions [here](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html).

### Step 1: Create an IAM User
1. **Log in to the AWS Management Console:**
   - Navigate to the [IAM Console](https://console.aws.amazon.com/iam/).
   
2. **Create a New IAM User:**
   - Click on "Users" in the sidebar, then click "Add user".
   - Enter a username and select "Programmatic access" as the access type.

3. **Attach Policies:**
   - On the "Set permissions" page, either add the user to a group with appropriate permissions, or attach policies directly. For basic usage, you can use the "AmazonS3FullAccess" policy for S3 access, "AmazonEC2FullAccess" for EC2, etc.

4. **Complete the User Creation:**
   - Click through the rest of the steps to create the user. At the end, you will see an access key ID and a secret access key. **Save these credentials securely**.

### Step 2: Configure AWS CLI

1. **Open Your Terminal:**
   - Open a terminal window on your system.

2. **Run AWS Configure Command:**
   - In the terminal, run the following command:
     ```bash
     aws configure
     ```

3. **Enter Your Credentials:**
   - You will be prompted to enter your AWS access key ID, secret access key, default region name, and default output format.
     ```plaintext
     AWS Access Key ID [None]: YOUR_ACCESS_KEY_ID
     AWS Secret Access Key [None]: YOUR_SECRET_ACCESS_KEY
     Default region name [None]: YOUR_DEFAULT_REGION
     Default output format [None]: json
     ```

   - Replace `YOUR_ACCESS_KEY_ID` with the access key ID from the IAM user creation step.
   - Replace `YOUR_SECRET_ACCESS_KEY` with the secret access key from the IAM user creation step.
   - Replace `YOUR_DEFAULT_REGION` with the region you primarily work in (e.g., `us-west-2`).
   - Choose `json`, `yaml`, `text`, or `table` as the default output format. JSON is commonly used.

### Step 3: Verify Configuration

1. **List S3 Buckets:**
   - To verify that the AWS CLI is configured correctly, try listing your S3 buckets:
     ```bash
     aws s3 ls
     ```
   - If configured correctly, you should see a list of your S3 buckets.

### Advanced Configuration Options (option 2)

1. **Configure Multiple Profiles:**
   - If you need to configure multiple profiles, you can use the `--profile` flag with the `aws configure` command:
     ```bash
     aws configure --profile profile_name
     ```
   - To use a specific profile with AWS CLI commands, add `--profile profile_name` to your commands:
     ```bash
     aws s3 ls --profile profile_name
     ```

2. **Store Credentials in Environment Variables:**
   - Alternatively, you can set environment variables for your credentials:
     ```bash
     export AWS_ACCESS_KEY_ID=YOUR_ACCESS_KEY_ID
     export AWS_SECRET_ACCESS_KEY=YOUR_SECRET_ACCESS_KEY
     export AWS_DEFAULT_REGION=YOUR_DEFAULT_REGION
     ```
   - This method is useful for temporary access or script automation.

3. **Configuration Files:**
   - The AWS CLI stores configuration settings in two files located at `~/.aws/`:
     - `config`: Contains settings such as the default region and output format.
     - `credentials`: Contains your access key ID and secret access key.
   - You can manually edit these files to update settings or add multiple profiles.

### Useful Links:
- [AWS CLI Configuration](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html)
- [IAM Best Practices](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html)

### Granted auth tool configuration (option 3)

[Official guide](https://docs.commonfate.io/granted/getting-started)

### AWS-VAULT configuration

# TO DO