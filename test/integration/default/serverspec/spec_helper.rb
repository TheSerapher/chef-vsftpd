# encoding: utf-8

require 'serverspec'
require 'net/ftp'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

require 'rspec/expectations'

def ftp(host, user, password)
  ftp = Net::FTP.new(host)
  begin
    ret = ftp.login(user, password)
  rescue Net::FTPPermError
    ret = false
  end
  ftp.close
  ret
end
