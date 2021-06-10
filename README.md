# Terraform AWS Jenkins Pipeline setup

The material in this repo demonstrates how to use the Terraform to provision a Jenkins instance
## Prereqs

Before you get started, you'll need to make sure you have a few things ready.

* AWS Access Key and Secret Key
* An S3 Bucket (can create in Aws if preferred [code not setup to provision this])
* Key/pair (can create and reference)
### Workspace variables

Create and set the following variables in your workspaces (e.g., create terraform.tfvars file and then set the vars from there)

#### Jenkins workspace

 * `aws_access_key`: Your AWS IAM access key. This account should be able to provision any AWS resource
 * `aws_secret_key`: The secret id key paired with the access key
 * `aws_region`: Region to deploy the demo to. Defaults to `us-east-1`
 * `key_pair`: This is the EC2 key pair you created in order to SSH into your EC2 instance
 * `instance_type`: Size of the AWS instance to run the demo on. The default is set to `t3.medium`
 * `org_name`: The name of your Terraform Cloud Organization where these workspaces reside
 * `workspace_name`: The name of the simple instance workspace
 * `bucket`: The name of an S3 bucket where Jenkins can stash an artifact from the build pipeline--just the bucket name only (NOTE: Make sure created in same region)
 * `prefix`: Unique prefix for naming (ex: dev)

#### Simple instance workspace

 * `aws_access_key`: Your AWS IAM access key. This account should be able to provision any AWS resource
 * `aws_secret_key`: The secret id key paired with the access key
 * `aws_region`: Region to deploy the demo to. Defaults to `us-east-1`
 * `key_pair`: This is the EC2 key pair you created in order to SSH into your EC2 instance
 * `instance_type`: Size of the AWS instance to run the demo on. Defaults to `t3.medium`
 * `prefix`: Unique prefix for naming (ex: dev)
## Spinning up Jenkins

After your vars are set in terraform.tfvars run the following:

```
terraform init
```

```
terraform apply
```

After deployed you will see the ip outputted to jenkins instance

```
e.g., http://ec2-3-237-84-107.compute-1.amazonaws.com/8080
```

Login to Jenkins server. Navigate to the URL outputted in the workspace and login to the Jenkins server with the following credentials:

Username: `devops`
Password: `SuperSecret1`

#### Entering your AWS credentials

Add AWS credentials into Jenkins in order to run pipeline and securely interact with AWS.

 1. From the left-hand menu, click **Credentials**, then **System** just below it
 2. Click **Global credentials (unrestricted)** from the listing--it will be the only one listed
 3. From the left-hand menu, click **Add Credentials**
 4. In the **Kind** menu, select **AWS Credentials**
 5. Enter the following values:
    a. **ID**: pipeline-credentials
    b. **Access Key ID**: _your AWS access key ID_
    c. **Secret Access Key**: _your AWS secret key_
 6. Click **OK**
 7. Click **Jenkins** in the upper, left-hand corner

#### Creating the pipeline

There is a sample Jenkifils setup that is configurable. Locate the `scripts/Jenkinsfile` in the project file and modify as needed. We're going to need the contents of that file in the steps below.

 1. In the menu on the left, click **New Item**
 2. Enter `custom-api` as the item name
 3. Select **Pipeline** from the options
 4. Click **OK** at the bottom of the option list
 5. Click the **Pipeline** tab at the top, or just scroll all the way down on the page
 6. After you finish modifying, you can copy the contents of the `Jenkinsfile` file and paste it into the **Script** text area
 7. Click **Save**

## Ready to run!

Click **Build Now** from the menu on the left.

#### Step 1 - Clone

Jenkins will clone sample project specified in repo

#### Step 2 - Build

Maven will build the project and produce a `jar` file

#### Step 3 - Upload Binary

The `jar` file will be uploaded to your S3 bucket

#### Step 4 - Run Terraform

TODO - This is WIP. THe current code creates Jenkins instance, but will need to integrate Jenkins jobs for various projects. 
