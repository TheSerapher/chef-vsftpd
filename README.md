Description [ ![Codeship Status for TheSerapher/chef-vsftpd](https://www.codeship.io/projects/3e72d8b0-67e3-0130-0fd6-12313d093ed4/status?branch=master)](https://www.codeship.io/projects/1777)
===========

A vsftpd Chef cookbook to install and configure a standard vsftpd
installation.

Requirements
============

## Platform:

* CentOS
* RHEL

## Cookbooks:

*No dependencies defined*

Attributes
==========

*No attributes defined*

Recipes
=======

## vsftpd::default

Installs/configures vsftpd 

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
    rake test        # Run all tests

## Bundler

If you prefer to let [Bundler](http://gembundler.com) install all required gems
(you should), run the tests this way:

    $ bundle install
    $ bundle exec rake test

## Berkshelf

[Berkshelf](http://berkshelf.com) is used to set up the cookbook and its
dependencies (as defined in `Berksfile`) prior to testing with Rake and Vagrant.

## Vagrant

With [Vagrant](http://vagrantup.com), you can spin up a virtual machine and run
your cookbook inside it via Chef Solo.

This command will boot and provision the VM as specified in the `Vagrantfile`:

    $ bundle exec vagrant up

(Berkshelf's Vagrant plugin will make your cookbook and its dependencies
automatically available to Vagrant when creating or provisioning a VM.)

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
