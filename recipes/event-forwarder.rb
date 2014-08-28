#
# Cookbook Name:: opennms
# Recipe:: event-forwarder
#
# Copyright 2014, The OpenNMS Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "opennms-light"

case node['platform_family']
when "rhel"
    home_dir = "/opt/opennms"

when "debian"
    home_dir = "/usr/share/opennms"
end

{ "reqPush.sh" => "reqPush.sh.erb"}.each do |dest, source|
  template "#{home_dir}/bin/#{dest}" do
    source "#{source}"
    owner "vagrant"
    group "vagrant"
    mode  "0750"
  end
end

cron_d "reqPush_cron" do
  action :create
  minute "0/5"
  command "#{home_dir}/bin/reqPush.sh"
end
