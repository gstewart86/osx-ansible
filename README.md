# Ansible

Ansible configurations, playbooks and roles for setting up an OSX host.

`osx-ansible/playbooks/common.yml` shows what roles will be loaded.
To see what any role does, look at `osx-ansible/roles/${role}/task/main.yml`.

## Before Running You Should

update `osx-ansible/group_vars/osx.yml`.

This file contains all user-defined variables for the localhost, and should be seen as the canonical source of configuration for your device.

## Quickstart

    make bootstrap
    make install

### Bootstrap

A bootstrap process is necessary to install `homebrew` and `ansible` themselves such that the user can then execute the playbook.
