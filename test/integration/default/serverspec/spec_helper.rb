# encoding: utf-8

require 'serverspec'
require 'net/ftp'
require 'rspec/expectations'

set :backend, :exec

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
