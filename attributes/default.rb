#
# Cookbook Name:: maven
# Attributes:: default
#
# Author:: Seth Chisamore (<schisamo@chef.io>)
# Author:: Bryan W. Berry (<bryan.berry@gmail.com>)
#
# Copyright:: Copyright (c) 2010-2015, Chef Software, Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default['omc']['user'] = 'oracle'
default['omc']['group'] = 'oinstall'
default['omc']['dbmon'] = 'true'
default['omc']['hostmon'] = 'true'
default['omc']['wlsmon'] = 'false'
default['omc']['agent_base_dir'] = '/omc/cloud_agent'
default['omc']['base_dir'] = '/omc'
default['omc']['json_dir'] = '/omc/json'
default['omc']['regkey'] = 'RF7eyGlELpZsSC78Cl8Z8MDtx4'
# default['maven']['repositories'] = ['http://repo1.maven.apache.org/maven']
# default['maven']['setup_bin'] = false
