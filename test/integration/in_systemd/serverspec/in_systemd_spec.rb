require_relative 'spec_helper'

if os[:family].to_s == 'smartos'
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
  describe command('/usr/local/bin/supervisorctl status') do
    its(:stdout) { should contain('tailgun\\s+RUNNING') }
  end
  describe file('/var/log/tailgun/tailgun.out.log') do
    it { should exist }
    it { should be_file }
    its(:content) { should contain('Lorem ipsum dolor sit amet') }
  end
end
