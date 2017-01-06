name              'vsftpd'
maintainer        'Sebastian Grewe'
maintainer_email  'sebastian.grewe@gmail.com'
issues_url        'https://github.com/TheSerapher/chef-vsftpd/issues'
source_url        'https://github.com/TheSerapher/chef-vsftpd'
license           'Apache 2.0'
description       'Installs/configures vsftpd'
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           '0.4.1'
recipe            'vsftpd::default', 'Installs/configures vsftpd'

supports 'ubuntu'
supports 'debian'
supports 'centos'
supports 'rhel'

depends  'openssl',	'>= 4.2.0'

source_url 'https://github.com/TheSerapher/chef-vsftpd' if respond_to?(:source_url)
issues_url 'https://github.com/TheSerapher/chef-vsftpd/issues' if respond_to?(:issues_url)
