Ansible
-------

 - Installation: http://docs.ansible.com/intro_installation.html
 - Ansible version should be < 2.0

Setup
-----

 1. Clone this repository
 1. Change `hosts` file according to your needs
 1. Change values specified in group_vars/* files

Running playbooks
-----------------

		ansible-playbook -i <hosts_file> <playbook> --check

Example:

		ansible-playbook -i hosts proxy_server.yml --check -u root

Run these without `--check` to apply changes on server.
