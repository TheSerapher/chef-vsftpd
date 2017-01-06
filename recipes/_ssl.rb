ssl_root = node['vsftpd']['ssl']
key_root = ssl_root['key']
cert_root = ssl_root['cert']

key_dir = ::File:dirname(key_root)
cert_dir = ::File:dirname(cert_root)

[ key_dir, cert_dir ].each do | d |
  directory d do
    mode 0o755
  end
end

openssl_x509 cert_root['public_cert_file'] do
  key_file key_root['private_key_file']
  common_name cert_root['common_name']
  org cert_root['org']
  org_unit cert_root['org_unit']
  country cert_root['country']
  key_file key_root['private_key_file']
  key_length key_root['length']
  owner key_root['owner']
  group key_root['group']
  mode key_root['mode']

  # these default to nil
  expire cert_root['expire_days'] unless cert_root['expire_days'].nil?
  key_pass key_root['pass'] unless key_root['pass'].nil?
end
