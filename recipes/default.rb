# encoding: utf-8

include_recipe 'vsftpd::_install'
include_recipe 'vsftpd::_ssl' unless node['vsftpd']['ssl']['enabled'] == false
include_recipe 'vsftpd::_configure'
