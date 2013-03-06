# Copyright 2012, Sebastian Grewe <sebastian@grewe.ca>
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

require File.expand_path('../support/helpers', __FILE__)

describe "up2date::default" do
  include Helpers::VsftpdTest

  it 'should have created /etc/vsftpd' do
    directory('/etc/vsftpd').must_exist
  end
  it 'should have created /etc/vsftpd/vsftpd.chroot_list' do
    file('/etc/vsftpd/vsftpd.chroot_list').must_exist
  end
  it 'should have created /etc/vsftpd/vsftpd.user_list' do
    file('/etc/vsftpd/vsftpd.user_list').must_exist
  end
  it 'should have started vsftpd' do
    service('vsftpd').must_be_running
  end
  it 'should allow access to user vagrant' do
    ftp = Net::FTP.new('localhost')
    ret = ftp.login('vagrant','vagrant')
    ftp.close
    assert ret
  end
end
