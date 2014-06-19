# Enable service during startup and start service
default['vsftpd']['enabled'] = true

# Configuration directory of vsftpd
default['vsftpd']['etcdir'] = '/etc/vsftpd'

# Only allow access to certain users
# Default: no users are allowed to access FTP
default['vsftpd']['allowed'] = [ ]

# Depending on configuration of vsftpd allow users to run
# non-chroot or defines users that have to be chroot'ed
# Default: chroot all users but those defined here
default['vsftpd']['chroot'] = [ ]

# Various configuration options with some sane defaults
# For details on these please check the official documentation
default['vsftpd']['config'] = {
  'session_support'             => 'YES',
  'force_dot_files'             => 'NO',
  'hide_ids'                    => 'YES',
  'download_enable'             => 'YES',
  'anonymous_enable'            => 'NO',
  'anon_root'                   => '',
  'anon_world_readable_only'    => 'NO',
  'anon_upload_enable'          => 'NO',
  'anon_mkdir_write_enable'     => 'NO',
  'no_anon_password'            => 'NO',
  'ftp_username'                => 'ftp',
  'local_enable'                => 'YES',
  'local_root'                  => '',
  'user_config_dir'             => node['vsftpd']['etcdir'] + '/users.d',
  'guest_enable'                => 'NO',
  'guest_username'              => 'ftp',
  'write_enable'                => 'YES',
  'local_umask'                 => '022',
  'dirmessage_enable'           => 'YES',
  'message_file'                => '.message',
  'xferlog_enable'              => 'YES',
  'xferlog_file'                => '/var/log/xferlog',
  'xferlog_std_format'          => 'YES',
  'connect_from_port_20'        => 'YES',
  'chmod_enable'                => 'YES',
  'chown_uploads'               => 'NO',
  'chown_username'              => 'nobody',
  'idle_session_timeout'        => '600',
  'data_connection_timeout'     => '120',
  'nopriv_user'                 => 'nobody',
  'async_abor_enable'           => 'NO',
  'ascii_upload_enable'         => 'NO',
  'ascii_download_enable'       => 'NO',
  'ftpd_banner'                 => 'FTP Service managed by Chef',
  'banner_file'                 => '',
  'cmds_allowed'                => '',
  'deny_email_enable'           => 'NO',
  'banned_email_file'           => node['vsftpd']['etcdir'] + '/banned_emails',
  'userlist_enable'             => 'YES',
  'userlist_deny'               => 'NO',
  'userlist_file'               => node['vsftpd']['etcdir'] + '/vsftpd.user_list',
  'chroot_local_user'           => 'YES',
  'chroot_list_enable'          => 'YES',
  'chroot_list_file'            => node['vsftpd']['etcdir'] + '/vsftpd.chroot_list',
  'ls_recurse_enable'           => 'NO',
  'listen'                      => 'YES',
  'listen_address'              => node['ipaddress'],
  'listen_ipv6'                 => 'NO',
  'listen_address6'             => '',
  'pasv_enable'                 => 'YES',
  'pasv_address'                => node['ipaddress'],
  'pasv_max_port'               => '5590',
  'pasv_min_port'               => '5555',
  'port_enable'                 => 'YES',
  'pam_service_name'            => 'vsftpd',
  'tcp_wrappers'                => 'YES',
  'anon_max_rate'               => '0',
  'local_max_rate'              => '0',
  'max_clients'                 => '0',
  'max_per_ip'                  => '0'
}

# Addresses a compatibility breaking upgrade, might be better to set to NO explicitly but for testing purposes it's enabled
if node['platform'] == 'ubuntu' && node['platform_version'] == '14.04'
  default['vsftpd']['config']['allow_writeable_chroot'] = 'YES'
end
