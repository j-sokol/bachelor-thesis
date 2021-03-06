### Bachelor thesis on FIT CTU in Prague.

## Abstract 

This thesis deals with research and deployment of provisioning frameworks
for bare metal servers. Goal of this thesis is to chose one of those frameworks,
deploy it and with changes use it in production. The choosing criteria are:
open-source software for practical and economical reasons, comunity behind
framework and support for installed operating system (there has to be at
least OS CentOS and Debian). Based on analysis in the first chapter was
chosen framework Foreman, that suits criteria the best – simple and usable
graphical web interface, support for multiple separated local area networks and
an option to change configuration of installed systems fast. Another chapter
shows deployment of Foreman framework. This thesis also includes plugin for
Foreman to show graphs from rrd data source (with use of Collectd Graph
Panel). Ansible playbooks for simple deployment of Foreman servers are also
included.
