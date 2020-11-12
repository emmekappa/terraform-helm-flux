all: init fmt validate
.PHONY: init fmt validate

init:
	terraform init -backend=false

fmt:
	terraform fmt -recursive

validate:
	GITLAB_TOKEN="fake" terraform validate

release-minor:
	$(eval VERSION=$(shell git describe --tags --abbrev=0 | awk -F. '{$$NF+=1; OFS="."; print $0}'))
	echo "Releasing a new minor: $(VERSION)"
	git tag -a $(VERSION) -m "new release"
	git push origin $(VERSION)
