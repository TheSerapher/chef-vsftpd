Description ![Travis-CI](https://travis-ci.org/TheSerapher/chef-vsftpd.svg?branch=master "Travis-CI")
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

*openssl >= 4.2.0*

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
  <!-- SSL attributes -->
  <tr>
    <td></td>
    <td><center><B>SSL</B></center></td>
    <td></td>
  </tr>
  <tr>
    <td><code>node['vsftpd']['ssl']['']</code></td>
    <td></td>
    <td><code></code></td>
  </tr>
  <tr>
    <td><code>node['vsftpd']['ssl']['enabled']</code></td>
    <td>Whether to turn on SSL and create and/or use key and cert files.</td>
    <td><code>false</code></td>
  </tr>
  <tr>
    <td><code>node['vsftpd']['ssl']['tlsv1_enabled']</code></td>
    <td>If SSL is used, whether to use TLS.</td>
    <td>true when SSL is enabled</td>
  </tr>
  <tr>
    <td><code>node['vsftpd']['ssl']['sslv2_enabled']</code></td>
    <td>If SSL is enabled, whether to use SSLv2 or not.</td>
    <td><code>false</code></td>
  </tr>
  <tr>
    <td><code>node['vsftpd']['ssl']['sslv3_enabled']</code></td>
    <td>If SSL is enabled, whether to use SSLv3 or not.</td>
    <td><code>false</code></td>
  </tr>
  <tr>
    <td><code>node['vsftpd']['ssl']['allow_anon']</code></td>
    <td>Whether or not anonymous users are allowed to use SSL.</td>
    <td><code>true</code></td>
  </tr>
  <tr>
    <td><code>node['vsftpd']['ssl']['force_local_data']</code></td>
    <td>If SSL is enabled and this is set to true, all non-anonymous users must use encrypted connections for sending data.</td>
    <td><code>true</code></td>
  </tr>
  <tr>
    <td><code>node['vsftpd']['ssl']['force_local_logins']</code></td>
    <td>If SSL is enabled and this is set to true, all non-anonymous users must use SSL to send password.</td>
    <td><code>true</code></td>
  </tr>
  <tr>
    <td><code>node['vsftpd']['ssl']['cert']['public_cert_file']</code></td>
    <td>The path to the public certificate file that will be created if it doesn't exist.</td>
    <td><code>node['vsftpd']['etcdir'] + '/vsftpd.pem'</code></td>
  </tr>
  <tr>
    <td><code>node['vsftpd']['ssl']['key']['private_key_file']</code></td>
    <td>The path to the private key file used to sign the cert.  Will be created without a password if it does not exist. If it exists, it will be used to sign the public cert using the passphrase specified in node['vsftpd']['ssl']['pass'] attribute if set.</td>
    <td><code>node['vsftpd']['etcdir'] + '/vsftpd.key'</code></td>
  </tr>
  <tr>
    <td><code>node['vsftpd']['ssl']['cert']['common_name']</code></td>
    <td>Value for the `CN` certificate field.</td>
    <td>'www.example.com'</td>
  </tr>
  <tr>
    <td><code>node['vsftpd']['ssl']['cert']['org']</code></td>
    <td>Value for the 'O' certificate field.</td>
    <td>'Example Company'</td>
  </tr>
  <tr>
    <td><code>node['vsftpd']['ssl']['cert']['org_unit']</code></td>
    <td>Value for the 'OU' certificate field.</td>
    <td>'RND'</td>
  </tr>
  <tr>
    <td><code>node['vsftpd']['ssl']['cert']['country']</code></td>
    <td>Value for the 'C' SSL field.</td>
    <td>'US'</td>
  </tr>
  <tr>
    <td><code>node['vsftpd']['ssl']['cert']['expire_days']</code></td>
    <td>Value representing the number of days from <I>now</I> through which the issued certificate cert will remain valid. The certificate will expire after this period. Defaults to no expiration.</td>
    <td>nil</td>
  </tr>
  <tr>
    <td><code>node['vsftpd']['ssl']['key']['length']</code></td>
    <td>Length of private key in bits.</td>
    <td><code>4096</code></td>
  </tr>
  <tr>
    <td><code>node['vsftpd']['ssl']['key']['user']</code></td>
    <td>Owner of the public certificate and private key file if they are created by this cookbook.</td>
    <td><code>'root'</code></td>
  </tr>
  <tr>
    <td><code>node['vsftpd']['ssl']['key']['group']</code></td>
    <td>Group owning the public certificate and private key file created by this cookbook.</td>
    <td><code>'root'</code></td>
  </tr>
  <tr>
    <td><code>node['vsftpd']['ssl']['key']['mode']</code></td>
    <td>Security permissions (in *NIX chmod(1) format) for the public certificate and private key files.</td>
    <td><code>00400</code></td>
  </tr>
  <tr>
    <td><code>node['vsftpd']['ssl']['key']['pass']</code></td>
    <td>The password for an existing key file (if using your own). <B>This is incredibly insecure.</B>  Consider using an encrypted data bag or chef-vault instead of this attribute.</td>
    <td><code>nil</code></td>
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
