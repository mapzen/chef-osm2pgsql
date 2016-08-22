#
# Cookbook Name:: osm2pgsql
# Recipe:: install_pkg
#

include_recipe 'osm2pgsql::install_ppa' if node[:osm2pgsql][:ppa][:enabled]

package 'osm2pgsql' do
  action node[:osm2pgsql][:upgrade] ? :upgrade : :install
end

link '/usr/local/bin/osm2pgsql' do
  to '/usr/bin/osm2pgsql'
  link_type :symbolic
end
