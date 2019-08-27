# Terraform

This repository host a `terraform` project to deploy the
[jorgechato.com](https://jorgechato.com) and
[whereisjorge.today](https://whereisjorge.today) ecosystem in AWS.

```zsh
.
├── modules
│   ├── cluster # ecs
│   ├── instance # instance + iam + sg
│   ├── network # eip + vpc + subnets
│   └── storage # s3 + ebs
└── platform
    └── eu-west-1
        └── pro
```

### Prepare

We will need a S3 bucket already created to use it as `remote_source` for our
Terraform backend. A hand make task is not an option we want to automate
everything with Terraform. From the root of the repository let's create
a private S3 bucket.

Since I am working alone and in a small project, blocking the `async` access in
the bucket is not needed.

```zsh
$ terraform apply
```

### Run

`eu-west-1` folder is a representation of the instance **zone** I am using.

`pro` is the only environment I am hosting. I don't have millions to spend on
servers (just yet) so let's be crazy and develop in the production environment.

```zsh
$ cd platform/eu-west-1/pro

$ terraform init
$ terraform apply
```
