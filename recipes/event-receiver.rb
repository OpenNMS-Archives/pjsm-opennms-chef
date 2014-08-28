#
# Cookbook Name:: event-receiver
# Recipe:: default
#
# Copyright 2014, The OpenNMS Group, Inc.
#
# All rights reserved - Do Not Redistribute
#
include_recipe "opennms-light"

# Install Karaf ActiveMQ dispatcher configuration, try 120 seconds to get a Karaf connection
execute "Install OpenNMS activemq" do
  command 'sshpass -p admin ssh -o StrictHostKeyChecking=no admin@localhost -p 8101 "features:install opennms-activemq"'
  retries 60
  retry_delay 2
end

# Install Karaf ActiveMQ event forwarder, try 120 seconds to get a Karaf connection
execute "Install OpenNMS activemq event forwarder" do
  command 'sshpass -p admin ssh -o StrictHostKeyChecking=no admin@localhost -p 8101 "features:install opennms-activemq-event-receiver"'
  retries 60
  retry_delay 2
end

# Restart OpenNMS
service "opennms" do
  action [:restart]
end