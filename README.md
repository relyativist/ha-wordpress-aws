# High Availability Wordpress on AWS.

This is Terraform deployment code for WordPress simple architecture with autoscale group. Project created in educational purposes during devops-schoold.

## Console roadmap and architechture

In [Notion project page](https://juvenile-alibi-1f1.notion.site/High-awailability-wordpress-on-AWS-ef5df10936214f5d85343736cf599c63) you will find architechture scheme and console tutorial deployment.

## Running on your aws account

Provide your aws credentials and public key in .terraform.tfvars.simple

## Usage

```bash
# init providers
terraform init

# dry-run
terraform plan

# apply resources
terraform apply --auto-approve
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.