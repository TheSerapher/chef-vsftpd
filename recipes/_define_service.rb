# encoding: utf-8

if node['vsftpd']['enabled']
  service 'vsftpd' do
    provider Chef::Provider::Service::Upstart if node['platform'] == 'ubuntu' &&
      node['platform_version'] == '14.04'
    action %w( enable start )
  end
else
  service 'vsftpd' do
    provider Chef::Provider::Service::Upstart if node['platform'] == 'ubuntu' &&
      node['platform_version'] == '14.04'
    action %w( disable stop )
  end
end
