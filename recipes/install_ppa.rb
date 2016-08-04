#
# Cookbook Name:: osm2pgsql
# Recipe:: install_ppa
#

apt_repository node[:osm2pgsql][:ppa][:name] do
  uri           node[:osm2pgsql][:ppa][:uri]
  distribution  node[:osm2pgsql][:ppa][:distribution]
  components    node[:osm2pgsql][:ppa][:components]
end
