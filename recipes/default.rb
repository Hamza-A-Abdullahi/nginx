#
# Cookbook:: nginx
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

#update ubuntu resources
apt_update 'update_sources' do
  action :update
end

package "nginx" do
  action :install
end

service "nginx" do
  action [:enable,:start]
end

template '/etc/nginx/sites-available/proxy.conf' do
  source 'proxy.conf.erb'
  variables proxy_port: node['nginx']['proxy_port']
  notifies :restart, 'service[nginx]'
end
