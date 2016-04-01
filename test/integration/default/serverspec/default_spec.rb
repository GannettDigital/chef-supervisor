require_relative 'spec_helper'

if "#{os[:family]}" == 'smartos'
  describe service('supervisord') do
    it { should be_enabled }
  end
  describe file('/opt/local/share/smf/supervisord') do
    it { should exist }
    it { should be_file }
    it { should be_owned_by 'root' }
  end
else
  describe service('supervisor') do
    it { should be_running }
    it { should be_enabled }
  end
  describe file('/etc/init.d/supervisor') do
    it { should exist }
    it { should be_file }
    it { should be_owned_by 'root' }
  end
end
