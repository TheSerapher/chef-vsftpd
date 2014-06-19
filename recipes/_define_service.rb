# encoding: utf-8

if node['platform'] == 'ubuntu' && node['platform_version'] == '14.04'
  Chef::Platform.set 'platform' => 'ubuntu',
                     'resource' => 'service',
                     'provider' => Chef::Provider::Service::Upstart
end

if node['vsftpd']['enabled']
  service 'vsftpd' do
    action %w( enable start )
  end
else
  service 'vsftpd' do
    action %w( disable stop )
  end
end
