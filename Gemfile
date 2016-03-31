#
# Copyright 2014, Noah Kantrowitz
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

source 'https://rubygems.org'

gem 'berkshelf', '= 4.0.1'
gem 'rubocop', '= 0.36.0'
gem 'chef'
gem 'vagrant-wrapper'
gem 'foodcritic', '= 5.0.0'
gem 'kitchen-docker'
gem 'travis', '~> 1.7'
gem 'kitchen-sync'
gem 'stove'

group :test do
  gem 'chefspec', '= 4.5.0'
  gem 'chef-zero', '= 4.5.0'
end

group :integration do
  gem 'activesupport', '= 4.2.5.2'
  gem 'serverspec', '= 2.29.1'
  gem 'test-kitchen', '= 1.6.0'
  gem 'kitchen-vagrant', '= 0.19.0'
  gem 'kitchen-ec2', '= 1.0.0'
  gem 'winrm', '= 1.7.2'
  gem 'winrm-fs', '= 0.3.1'
end
