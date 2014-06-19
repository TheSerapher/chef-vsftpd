# encoding: utf-8

# Include service definition now
include_recipe 'vsftpd::_define_service'

directory node['vsftpd']['etcdir'] do
  action :create
  user 'root'
  group 'root'
  mode '755'
  only_if { node['platform_family'] == 'debian' }
end

directory node['vsftpd']['config']['user_config_dir'] do
  action :create
  user 'root'
  group 'root'
  mode '755'
  recursive true
end

config = value_for_platform_family(
  'rhel' => '/etc/vsftpd/vsftpd.conf',
  'redhat' => '/etc/vsftpd/vsftpd.conf',
  'centos' => '/etc/vsftpd/vsftpd.conf',
  'debian' => '/etc/vsftpd.conf'
)

# rubocop:disable Style/LineLength,
{ 'vsftpd.conf.erb' => config,
  'vsftpd.chroot_list.erb' => node['vsftpd']['config']['chroot_list_file'],
  'vsftpd.user_list.erb' => node['vsftpd']['config']['userlist_file'] }.each do |template, destination|
  # rubocop:enable Style/LineLength
  template destination do
    source template
    notifies :restart, 'service[vsftpd]', :delayed
  end
end
