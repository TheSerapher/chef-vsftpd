# encoding: utf-8
directory node['vsftpd']['etcdir'] do
  action :create
  user 'root'
  group 'root'
  mode '755'
end

directory node['vsftpd']['config']['user_config_dir'] do
  action :create
  user 'root'
  group 'root'
  mode '755'
  recursive true
end

{
  'vsftpd.conf.erb' => node['vsftpd']['configfile'],
  'vsftpd.chroot_list.erb' => node['vsftpd']['config']['chroot_list_file'],
  'vsftpd.user_list.erb' => node['vsftpd']['config']['userlist_file']
}.each do |template, destination|
  template destination do
    source template
    notifies :restart, 'service[vsftpd]', :delayed
  end
end

# Include service definition now
include_recipe 'vsftpd::_define_service'
