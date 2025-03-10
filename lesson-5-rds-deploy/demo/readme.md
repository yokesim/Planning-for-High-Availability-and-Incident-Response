# Instructions
1. Open your AWS console

2. Open CloudShell, Copy the AMI to your account

   **Restore image**
    ```shell
    aws ec2 create-restore-image-task --object-key ami-0ec6fdfb365e5fc00.bin --bucket udacity-srend --name "udacity-<your_name>" --region us-east-1
    ```
    <!-- - Replace the owner field in `_data.tf` with your Amazon owner ID assigned on the AMI (you can get this in the console by going to EC2 - AMIs and selecting the Owned by me at the top filter) -->
    - Take note of that AMI ID the script just output. Copy the AMI to `us-east-2` and `us-west-1`:
        - `aws ec2 copy-image --source-image-id <your-ami-id-from-above> --source-region us-east-1 --region us-east-2 --name "udacity-<your_name>"`
        - `aws ec2 copy-image --source-image-id <your-ami-id-from-above> --source-region us-east-1 --region us-west-1 --name "udacity-<your_name>"`

    - Make note of the ami output from the above 2 commands. You'll need to put this in the `ec2.tf` file for `zone1` for `us-east-2` and in `ec2.tf` file for `zone2` for `us-west-1` respectively

    <!-- - Set your aws cli config to `us-east-2` -->

3. Change your region to `us-east-2`. From the AWS console create an S3 bucket in `us-east-2` called `udacity-tf-<your_name>` e.g `udacity-tf-tscotto`
    - click next until created.
    - Update `_config.tf` in the `Lesson-5-rds-deploy/demo/zone1` folder with your S3 bucket name where you will replace `<your_name>` with your name

4. Change your region to `us-west-1`. From the AWS console create an S3 bucket in `us-west-1` called `udacity-tf-<your_name>` e.g `udacity-tf-tscotto`
    - click next until created.
    - Update `_config.tf` in the `Lesson-5-rds-deploy/demo/zone2` folder with your S3 bucket name where you will replace `<your_name>` with your name

5. Setup your CloudShell. Open CloudShell in the `us-east-2` or `us-west-1` region. Install the following on both regions one by one:

- terraform
    - `wget https://releases.hashicorp.com/terraform/1.10.3/terraform_1.10.3_linux_amd64.zip`
    - `unzip terraform_1.10.3_linux_amd64.zip`
    - `mkdir ~/bin`
    - `mv terraform ~/bin`

6. Deploy Terraform infrastructure
    - Clone the starter code from the git repo to a folder CloudShell
    - `cd` into the `starter` folder
    - `terraform init`
    - `terraform apply`

7. At the end of your lesson, run `terraform destroy` and allow it to destroy all your resources

## Destroy it all
### Step 1: Destroy Resources in Zone 1 Folder

1. Open the **zone1** folder.
2. Run the following command to destroy the specific AWS RDS cluster resource:

   ```
   terraform destroy -target=module.project_rds_p.aws_rds_cluster.udacity_cluster
   ```

   This command will delete the RDS cluster named `udacity_cluster` managed by the `project_rds_p` module in the `zone1` folder.

---

### Step 2: Destroy All Resources in Zone 2 Folder

1. Open the **zone2** folder.
2. Run the following command to destroy **all** Terraform-managed resources in the `zone2` folder:

   ```
   terraform destroy
   ```

   This will remove all resources that are defined in the `zone2` configuration.

---

### Step 3: Destroy All Resources in Zone 1 Folder

1. Return to the **zone1** folder.
2. Run the following command to destroy **all** resources in the `zone1` folder:

   ```
   terraform destroy
   ```

   This will remove all resources that are defined in the `zone1` configuration.
