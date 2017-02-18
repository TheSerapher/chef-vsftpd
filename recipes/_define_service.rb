# encoding: utf-8

service 'vsftpd' do
  if node['platform'] == 'ubuntu'
    if node['platform_version'].to_f >= 16.04
      provider Chef::Provider::Service::Systemd
    elsif node['platform_version'].to_f >= 14.04
      provider Chef::Provider::Service::Upstart
    end
  end

  if node['vsftpd']['enabled']
    action [:enable, :start]
  else
    action [:disable, :stop]
  end

  supports restart: true
end
