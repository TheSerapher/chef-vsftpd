Description [ ![Codeship Status for TheSerapher/chef-vsftpd](https://www.codeship.io/projects/3e72d8b0-67e3-0130-0fd6-12313d093ed4/status?branch=master)](https://www.codeship.io/projects/1777)
===========

A vsftpd Chef cookbook to install and configure a standard vsftpd
installation.

Requirements
============

## Platform:

* CentOS
* RHEL
* Debian
* Ubuntu

## Cookbooks:

*No other cookbooks required*

Attributes
==========

<table>
  <tr>
    <td>Attribute</td>
    <td>Description</td>
    <td>Default</td>
  </tr>
  <tr>
    <td><code>node['vsftpd']['enabled']</code></td>
    <td>Enable and start vsftpd after installation</td>
    <td><code>true</code></td>
  </tr>
  <tr>
    <td><code>node['vsftpd']['etcdir']</code></td>
    <td>Where to store additional configuration files</td>
    <td><code>/etc/vsftpd</code></td>
  </tr>
  <tr>
    <td><code>node['vsftpd']['allowed']</code></td>
    <td>Array of local users that are allowd to connect via FTP</td>
    <td><code>[ ]</code></td>
  </tr>
  <tr>
    <td><code>node['vsftpd']['chroot']</code></td>
    <td>Array of users that will not be chroot'ed</td>
    <td><code>[ ]</code></td>
  </tr>
  <tr>
    <td><code>node['vsftpd']['config']</code></td>
    <td>Configuration array with key/value pairs.</td>
    <td>See <a href="https://security.appspot.com/vsftpd/vsftpd_conf.html">Manpage</a> for details</td>
  </tr>
</table>

Recipes
=======

## vsftpd::default

Installs/configures vsftpd, includes some sub-tasks via `include_recipe`. 

Known Issue
===========

When using *Ubuntu 12.04* or *Debian Wheezy* you will have issues with
this cookbook and running `chroot_local_users=YES` in the configuration.

There are some workarounds to overcome this problem:

* [Blake's Coding Blog](http://blakecode.blogspot.de/2012/08/vsftpd-refusing-to-run-with-writable.html)
* [Ubuntu 12.04 Fix](http://blog.thefrontiergroup.com.au/2012/10/making-vsftpd-with-chrooted-users-work-again/)

The basic gist of these articles:

* revoke write permissions on the users home 
* setup a different chroot environment via `passwd_chroot_enable=YES`
* install a patched version of the vsftpd 2.x branch and set
  `allow_writeable_chroot=YES` to ignore this error
* use vsftpd 3.x and set `allow_writeable_chroot=YES` to ignore this error


Testing
=======

The cookbook comes with some testing facilities allowing you to iterate quickly
on cookbook changes.

## Rake

You can execute the tests with [Rake](http://rake.rubyforge.org). The `Rakefile`
provides the following tasks:

    $ rake -T
    rake chefspec    # Run ChefSpec examples
    rake foodcritic  # Run Foodcritic lint checks
    rake knife       # Run knife cookbook test
    rake rubocop     # Run rubocop checks
    rake test        # Run all tests

## Bundler

If you prefer to let [Bundler](http://gembundler.com) install all required gems
(you should), run the tests this way:

    $ # I like to install them in a parent folder so all cookbooks can use it
    $ bundle install --path=../vendor/bundle
    $ bundle exec rake test

## Berkshelf

[Berkshelf](http://berkshelf.com) is used to set up the cookbook and its
dependencies (as defined in `Berksfile`) prior to testing with Rake and Vagrant.

## Kitchen

This cookbook is using [test-kitchen](https://github.com/opscode/test-kitchen) to create machines. You
can review the boxes by using:

    $ bundle exec kitchen list

To run the full kitchen suite included in this cookbook simply execute:

    $ bundle exec kitchen test
    
You can also verify/converge/test any specific machine from the previous list output:

    $ bundle exec kitchen verify <instance>

License and Author
==================

Author:: Sebastian Grewe (<sebastian.grewe@gmail.com>)

Copyright:: 2013, Sebastian Grewe 

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
