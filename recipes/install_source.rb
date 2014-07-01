#
# Cookbook Name:: osm2pgsql
# Recipe:: install_source
#

include_recipe 'apt::default'
include_recipe 'osm2pgsql::packages'

ark 'osm2pgsql' do
  action      [:install_with_make]
  url         node[:osm2pgsql][:url]
  version     node[:osm2pgsql][:version]
  owner       node[:osm2pgsql][:owner]
  prefix_root node[:osm2pgsql][:prefix_root]
end
