#
# Cookbook Name:: event-receiver
# Recipe:: default
#
# Copyright 2014, The OpenNMS Group, Inc.
#
# All rights reserved - Do Not Redistribute
#
include_recipe "opennms-light"

{
  "org.apache.karaf.features.cfg" => "org.apache.karaf.features.receiver.cfg.erg"
}.each do |dest, source|
  template "#{home_dir}/etc/#{dest}" do
    source "#{source}"
    owner "root"
    group "root"
    mode "0640"
  end
end

# Install Karaf ActiveMQ dispatcher configuration, try 120 seconds to get a Karaf connection
#execute "Uninstall OpenNMS event forwarder" do
#  command 'sshpass -p admin ssh -o StrictHostKeyChecking=no admin@localhost -p 8101 "features:uninstall opennms-activemq-event-forwarder"'
#  retries 60
#  retry_delay 2
#end

# Install Karaf ActiveMQ event forwarder, try 120 seconds to get a Karaf connection
#execute "Uninstall OpenNMS activemq event dispatcher config" do
#  command 'sshpass -p admin ssh -o StrictHostKeyChecking=no admin@localhost -p 8101 "features:uninstall opennms-activemq-dispatcher-config"'
#  retries 60
#  retry_delay 2
#end

# Install Karaf ActiveMQ dispatcher configuration, try 120 seconds to get a Karaf connection
#execute "Install OpenNMS activemq" do
#  command 'sshpass -p admin ssh -o StrictHostKeyChecking=no admin@localhost -p 8101 "features:install opennms-activemq"'
#  retries 60
#  retry_delay 2
#end

# Install Karaf ActiveMQ event forwarder, try 120 seconds to get a Karaf connection
#execute "Install OpenNMS activemq event dispacther" do
#  command 'sshpass -p admin ssh -o StrictHostKeyChecking=no admin@localhost -p 8101 "features:install opennms-activemq-event-receiver"'
#  retries 60
#  retry_delay 2
#end

# Restart OpenNMS
service "opennms" do
  action [:restart]
end
