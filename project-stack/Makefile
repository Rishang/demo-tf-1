#  --sync-usage-file
cost-estimate:
	infracost breakdown --config-file=infracost.yml

docs:
	bash docs.sh

compliance-check:
	tfsec src

graph:
	cd src;terraform plan -var-file=environments/dev/terraform.tfvars -out=tfplan.out
	cd src;rover graph tfplan.out

fmt:
	terraform fmt -recursive
