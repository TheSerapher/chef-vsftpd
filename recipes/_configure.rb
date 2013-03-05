#
# Cookbook Name:: vsftpd
# Recipe:: default
#
# Copyright (C) 2013 Sebastian Grewe <sebastian.grewe@gmail.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

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
  'debian' => '/etc/vsftpd.conf'
)

{ 'vsftpd.conf.erb' => config,
  'vsftpd.chroot_list.erb' => node['vsftpd']['config']['chroot_list_file'],
  'vsftpd.user_list.erb' => node['vsftpd']['config']['userlist_file'] }.each do |template,destination|
  template destination do
    source template
    notifies :restart, 'service[vsftpd]', :delayed
  end
end
