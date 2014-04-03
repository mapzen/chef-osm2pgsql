#
# Cookbook Name:: osm2pgsql
# Recipe:: install
#
# Copyright 2013, Mapzen
#
# All rights reserved - Do Not Redistribute
#

case node[:osm2pgsql][:install_type]
when 'pkg'
  include_recipe 'osm2pgsql::install_pkg'
when 'source'
  include_recipe 'osm2pgsql::install_source'
end
