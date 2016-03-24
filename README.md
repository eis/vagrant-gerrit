vagrant-gerrit
==============

A vagrantbox to use with gerrit with added jenkins

Originally forked from https://github.com/roidelapluie/vagrant-gerrit,
but since that is version 2.8.1, I needed something newer and upgrade path
seemed way hard, created quickly this one which is based on shell scripts
for gerrit. Seems to work and more future proof.

Using Gerrit 2.11.2 currently, also tested with 2.12.2.

Assumes you're behind a proxy defined in http_proxy env variable.

Instructions
============

1) Make sure you have all Git submodules checked-out (clone this
   repository with `--recurse-submodules` or run `git submodule update
   --init` in a non-recursive clone).

2) Run `vagrant up`

3) `vagrant ssh`

4) run install-gerrit-step2-gerrit.sh as gerrit user

5) run install-gerrit-service.sh as root user

6) Enjoy ;-). Point your web browser to [http://localhost:8091](http://localhost:8091/)
   for gerrit web interface, and [http://localhost:8092](http://localhost:8092) for Jenkins.
   Use `vagrant ssh` to open a shell on the machine,
   Gerrit runs with `$site_path=/opt/gerrit`.
