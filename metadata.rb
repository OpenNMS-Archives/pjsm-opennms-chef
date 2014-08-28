name             'opennms-light'
maintainer       'OpenNMS Community'
maintainer_email 'ronny@opennms.org'
license          'GPLv3+'
description      'Installs/Configures opennms'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.adoc'))
version          '0.2.5'

recipe 'opennms-light', 'Installs open source enterprise network management platform OpenNMS.
        This cookbook aims for compatibility with stable, testing and snapshot setups. For this
	reason the attribute set to configure OpenNMS is limited.'

depends 'yum'
depends 'java'
depends 'postgresql'
depends 'cron'

%w(ubuntu debian redhat centos fedora).each do |os|
  supports os
end
