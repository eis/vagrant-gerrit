vagrant-gerrit
==============

A vagrantbox to use with gerrit with added jenkins

Instructions
============

1) Make sure you have all Git submodules checked-out (clone this
   repository with `--recurse-submodules` or run `git submodule update
   --init` in a non-recursive clone).

2) Run `vagrant up`

3) Enjoy ;-). Point your web browser to [http://localhost:8081](http://localhost:8081/)
   for gerrit web interface, and [http://localhost:8082](http://localhost:8082) for Jenkins.
   Use `vagrant ssh` to open a shell on the machine,
   Gerrit runs with `$site_path=/opt/gerrit`.
