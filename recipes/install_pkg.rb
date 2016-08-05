#
# Cookbook Name:: osm2pgsql
# Recipe:: install_pkg
#

include_recipe 'osm2pgsql::install_ppa' if node[:osm2pgsql][:ppa][:enabled]

package 'osm2pgsql'
