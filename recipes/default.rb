# encoding: utf-8

include_recipe 'vsftpd::_install'
include_recipe 'vsftpd::_configure'
if "#{node['vsftpd']['config']['ssl_enable']}" == 'YES'
	include_recipe 'vsftpd::_ssl'
end
