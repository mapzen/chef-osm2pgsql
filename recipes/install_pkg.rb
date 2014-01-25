#
# Cookbook Name:: osm2pgsql
# Recipe:: install_pkg
#
# Copyright 2013, Mapzen
#
# All rights reserved - Do Not Redistribute
#

apt_repository 'mapzen-public' do
  uri           'http://s3.amazonaws.com/mapzen-debian'
  distribution  'stable'
  components    ['main']
  key           'https://s3.amazonaws.com/mapzen-debian/mapzen-debian.gpg.key'
end

package 'mapzen-osm2pgsql' do
  action  :install
  version node[:osm2pgsql][:pkg_version]
end

