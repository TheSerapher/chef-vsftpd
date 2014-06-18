name              'vsftpd'
maintainer        'Sebastian Grewe'
maintainer_email  'sebastian.grewe@gmail.com'
license           'Apache 2.0'
description       'Installs/configures vsftpd'
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           '0.1.0'
recipe            'vsftpd::default', 'Installs/configures vsftpd'

supports 'ubuntu'
supports 'debian'
supports 'centos'
supports 'rhel'
