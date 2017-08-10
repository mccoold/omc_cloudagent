#
# Cookbook:: omc_cloudagent
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
agent_base_dir = node.default['omc']['agent_base_dir']
stage_dir = node.default['omc']['base_dir'] + '/stage_dir'
json_dir = node.default['omc']['json_dir']
omcuser = node.default['omc']['user']
omcgroup = node.default['omc']['group']

# group "#{omcgroup}" do
#   action :create
#   #append true
# end

# user "#{omcuser}" do
#   comment 'omc users'
#   group "#{omcgroup}"
#   shell '/bin/bash'
#   #not_if (node['etc']['passwd']"#{omcuser}")
#   action :create
# end

[node.default['omc']['base_dir'], "#{agent_base_dir}", "#{json_dir}", "#{stage_dir}"].each do |omcdir|
 directory "#{omcdir}" do
      owner "#{omcuser}"
      group "#{omcgroup}" 
      mode  "00744"
      action :create
  end
end

['AgentInstall.sh', 'lama.zip'].each do |cbfiles| 
  cookbook_file node.default['omc']['base_dir'] + "/#{cbfiles}" do
    source "#{cbfiles}"
    owner "#{omcuser}"
    group "#{omcgroup}"
    mode '0755' 
    action :create_if_missing
  end
end


  regkey = node.default['omc']['regkey']
  # execute 'download_only_lama.zip' do
  #   cwd node.default['omc']['base_dir']
  #   user "#{omcuser}"
  #  # environment ({"https_proxy" => "www-proxy.us.oracle.com:80"})
  #   command "./AgentInstall\.sh AGENT_TYPE=cloud_agent AGENT_REGISTRATION_KEY=#{regkey} STAGE_LOCATION=#{stage_dir} -download_only"
  #   action :run
  #   not_if { ::File.exist?("#{stage_dir}/lama.zip") }
  # end


execute 'install_from_staged' do
  #cwd "#{stage_dir}"
  cwd node.default['omc']['base_dir']
  environment ({"USER" => "#{omcuser}"})
  user "#{omcuser}"
  group "#{omcgroup}"
  command "./AgentInstall.sh AGENT_TYPE=cloud_agent AGENT_REGISTRATION_KEY=#{regkey} AGENT_BASE_DIR=#{agent_base_dir} -staged"
  not_if { ::File.exist?("#{agent_base_dir}/agent_inst/") }
  action :run
end

if node['omc']['dbmon'] == 'true' then
  include_recipe "omc_cloudagent::enable_db_mon"
end
if node['omc']['hostmon'] == 'true' then
  include_recipe "omc_cloudagent::enable_host_mon"
end
if node['omc']['wlsmon'] == 'true' then
  include_recipe "omc_cloudagent::enable_wls_mon"
end

