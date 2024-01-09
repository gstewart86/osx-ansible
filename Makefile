.DEFAULT_GOAL := help

# Common playbook command
COMMON_PLAYBOOK := ansible-playbook playbooks/common.yml

# Help target to display other targets and their descriptions
help:
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

# Pattern rule for common tasks
common-%:
	$(COMMON_PLAYBOOK) -t $* -K

# Special targets that don't fit the pattern
## bootstrap: Installs Homebrew and Ansible if not present
bootstrap:
	./bootstrap.sh

## dump_facts: Displays all Ansible facts on this host
dump_facts:
	ansible all -m setup --tree /tmp/facts --connection=local -i ansible_hosts

## update: Updates binaries without rebooting
update:
	ansible-playbook playbooks/update.yml -K

## update-reboot: Updates binaries and reboots
update-reboot:
	ansible-playbook playbooks/update.yml -e "reboot=true" -K
