# For testing that supervisord actually works - drop a config file to do 'tail -f'

directory '/var/log/tailgun' do
  owner 'root'
  group 'root'
  mode '755'
end

directory '/etc/supervisor.d' do
  owner 'root'
  group 'root'
  mode '755'
end

template '/etc/supervisor.d/tailgun.conf' do
  source 'tailgun.conf.erb'
  owner 'root'
  group 'root'
  mode '644'
end

template '/var/log/tailgun/tailgun.txt' do
  source 'tailgun.txt.erb'
  owner 'root'
  group 'root'
  mode '644'
end
