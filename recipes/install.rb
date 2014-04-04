#
# Cookbook Name:: osm2pgsql
# Recipe:: install
#

case node[:osm2pgsql][:install_type]
when 'pkg'
  include_recipe 'osm2pgsql::install_pkg'
when 'source'
  include_recipe 'osm2pgsql::install_source'
end
