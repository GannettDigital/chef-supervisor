# encoding: utf-8
require 'chefspec'
require 'spec_helper'
require 'fauxhai'

# Debian-only
describe 'supervisor::default' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'debian', version: '8.2') do |node|
    end.converge(described_recipe)
  end

  it 'does not install the py27-expat' do
    expect(chef_run).not_to install_package 'py27-expat'
  end

  it 'creates template supervisor-dir' do
    expect(chef_run).to create_template("/etc/default/supervisor")
  end
end

# Smartos-only
describe 'supervisor::default' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'smartos', version: '5.11') do |node|
    end.converge(described_recipe)
  end

  it 'installs the package py27-expat' do
    expect(chef_run).to install_package('py27-expat')
  end

  it 'creates supervisor-dir' do
    expect(chef_run).to create_directory("/opt/local/etc/supervisor.d")
  end

  it 'creates template supervisor-config-file' do
    expect(chef_run).to create_template("/opt/local/etc/supervisord.conf")
  end

  it 'creates supervisor-log-file' do
    expect(chef_run).to create_directory("/var/log/supervisor")
  end

  it 'creates supervisor-other-dir' do
    expect(chef_run).to create_directory("/opt/local/share/smf/supervisord")
  end

  it 'creates template manifest' do
    expect(chef_run).to create_template("/opt/local/share/smf/supervisord/manifest.xml")
  end

  it 'enables the supervisord service' do
    expect(chef_run).to enable_service('supervisord')
  end

  it 'doesnt bother to run svccfg-import-supervisord' do
    expect(chef_run).to_not run_execute('svccfg-import-supervisord')
  end
end

# Everything except smartos
describe 'supervisor::default' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
    end.converge(described_recipe)
  end

  it 'includes the `python` recipe' do
    expect(chef_run).to include_recipe('python')
  end

  it 'installs supervisor' do
    expect(chef_run).to upgrade_python_pip('supervisor')
  end

  it 'does not install the py27-expat' do
    expect(chef_run).not_to install_package 'py27-expat'
  end

  it 'creates supervisor-dir' do
    expect(chef_run).to create_directory("/etc/supervisor.d")
  end

  it 'creates template supervisor-config-file' do
    expect(chef_run).to create_template("/etc/supervisord.conf")
  end

  it 'creates supervisor-log-file' do
    expect(chef_run).to create_directory("/var/log/supervisor")
  end

  it 'creates template supervisor-init-file' do
    expect(chef_run).to create_template("/etc/init.d/supervisor")
  end

  it 'enables the supervisor service' do
    expect(chef_run).to enable_service('supervisor')
  end
end