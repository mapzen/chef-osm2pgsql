#
# Cookbook Name:: osm2pgsql
# Recipe:: install
#

include_recipe 'osm2pgsql::install_pkg'     if node[:osm2pgsql][:install_type] == 'pkg'
include_recipe 'osm2pgsql::install_source'  if node[:osm2pgsql][:install_type] == 'source'
