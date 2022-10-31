# cloud-run-intro

## Usage
```
terrafom init
terraform plan  --var-file=env/<env>.tfvars
terraform plan  --var-file=env/<prod>.tfvars
```

## Usafull commands
```
terraform providers lock \                                                                           dg-uat
  -platform=linux_arm64 \
  -platform=linux_amd64 \
  -platform=darwin_amd64 \
  -platform=windows_amd64
terraform fmt
```

## NOTES
- Envs can be divided by terraform workspace.  CIs like Atlantis and Terraform Cloud hadnle workspaces well(f.e. parallel run).
- Resources will be promoted and deleted from env to env using <something>_enabled variable.
- State should be moved to remote backend.
- This code should be refactored into module in case it should be duplicated for another similiar unit(f.e. cloud run deployment intro2)
