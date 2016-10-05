name             'osm2pgsql'
maintainer       'Mapzen'
maintainer_email 'grant@mapzen.com'
license          'GPL v3'
description      'Installs/Configures osm2pgsql'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.6.0'

%w(apt ark).each do |dep|
  depends dep
end

%w(ubuntu).each do |os|
  supports os
end
