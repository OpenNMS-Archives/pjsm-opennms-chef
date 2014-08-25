# Allow Java remote debugging on port 8001: true / false
default['opennms']['home'] = '/usr/share/opennms'
default['opennms']['log'] = '/var/log/opennms/opennms-remote-poller.log'
default['opennms']['baseurl'] = 'http:/192.168.0.1/opennms-remoting'
default['opennms']['location'] = 'Europe'
default['opennms']['gui'] = 'false'
default['opennms']['runas'] = 'root'
default['opennms']['start_poller'] = '1'
default['opennms']['remote_user'] = 'remote-user'
default['opennms']['remote_pass'] = 'remote-pass'

# Start service and Java environment
default['opennms']['remote-poller']['java_heap_space'] = '384'
default['opennms']['start_timeout'] = '0'
