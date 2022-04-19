# taccoform-1password-demo

### Install and Configure 1Password

1. Install 1password 8
2. Install 1password cli 2.0
3. Sign into 1password cli
4. Create new vault: `op vault create taccoform-demo`

```bash
op vault create taccoform-demo
ID:                   REDACTED
Name:                 taccoform-demo
Type:                 USER_CREATED
Attribute version:    1
Content version:      1
Items:                0
Created:              now
Updated:              now
```
5. Create new secret: `op item create --category=password --title='demo-secret' --vault taccoform-demo' 'password=passwordistaco'`

```bash
op item create --category=password --title='demo-secret' --vault taccoform-demo 'password=passwordistaco'
ID:          REDACTED
Title:       demo-secret
Vault:       REDACTED
Created:     now
Updated:     now
Favorite:    false
Version:     0
Category:    PASSWORD
Fields:
  password:    passwordistaco
```

6. Create secret for your DigitalOcean access token: `op item create --category=password --title='do-token' --vault taccoform-demo 'password=DIGITALOCEANACCESSTOKENGOESHERE'`
7. Set DigitalOcean environment variable: `export DIGITALOCEAN_ACCESS_TOKEN=op://taccoform-demo/do-token/password`
8. Use 1password cli to pass credentials to DigitalOcean CLI tool: `op run -- doctl account get `
9. You can also pass the credentials to a docker container: `docker run --rm --interactive --tty --env-file <(op run --no-masking -- env | grep DIGITALOCEAN) digitalocean/doctl account get`


### Terraform
1. Set a DigitalOcean access token Terraform variable via environment variables: `export TF_VAR_do_token=op://taccoform-demo/do-token/password`
2. Check out the environment variable output: `op run -- env | grep TF_VAR `
3. Init: `op run -- terraform init`
4. Apply: `op run -- terraform apply`
5. Destroy:  `op run -- terraform destroy`
