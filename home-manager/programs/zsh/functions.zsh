####################
## functions
#####################

cdf(){cd $(fuzzycd "$1")}

fim(){vim $(fuzzyvim "$1")}

scan-git-secrets() {
	echo "Scanning $PWD for secrets"
	docker run -v "$PWD":/path ghcr.io/zricethezav/gitleaks:v8.8.12 detect -f json -r "/path/report-secrets.json" --source="/path"
	cat report-secrets.json | jq -n -r 'inputs[].Secret' | sort -u > extracted-secrets
	echo "Exported $(wc -l extracted-secrets) to file ./extracted-secrets"
}

setup(){
	cd ~/setup-nix
	make $@
}

tf-docs(){
	if [ -z "$1" ]; then
		echo "output file missing"
	else;
		docker run --rm -v $(pwd):/project -w /project quay.io/terraform-docs/terraform-docs:latest --hide requirements markdown . > ./$1
	fi
}
