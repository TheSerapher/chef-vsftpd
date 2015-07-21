openssl_x509 "#{node['vsftpd']['config']['rsa_cert_file']}" do
  key_file    "#{node['vsftpd']['ssl']['rsa_private_key_file']}"
  common_name "#{node['vsftpd']['ssl']['common_name']}"
  org         "#{node['vsftpd']['ssl']['org']}"
  org_unit    "#{node['vsftpd']['ssl']['org_unit']}"
  country     "#{node['vsftpd']['ssl']['country']}"
end
