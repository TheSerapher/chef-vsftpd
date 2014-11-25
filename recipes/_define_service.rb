# encoding: utf-8

if node['vsftpd']['enabled']
  service 'vsftpd' do
    provider Chef::Provider::Service::Upstart if node['platform'] == 'ubuntu' &&
      node['platform_version'].to_f >= 14.04
    action [:enable, :start]
    supports :restart => true
  end
else
  service 'vsftpd' do
    provider Chef::Provider::Service::Upstart if node['platform'] == 'ubuntu' &&
      node['platform_version'].to_f >= 14.04
    action [:disable, :stop]
    supports :restart => true
  end
end
