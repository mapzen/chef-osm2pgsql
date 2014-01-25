#
# Cookbook Name:: osm2pgsql
# Recipe:: build
#
# Copyright 2013, Mapzen
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'git'
include_recipe 'osm2pgsql::packages'

bash 'build_osm2pgsql' do
  action :nothing
  cwd '/opt/osm2pgsql'
  environment 'PREFIX' => "#{node[:osm2pgsql][:source_install_prefix]}"
  code <<-EOH
    ./autogen.sh
    ./configure --prefix=#{node[:osm2pgsql][:source_install_prefix]}
    make -j "#{node[:cpu][:total]}" && make install
  EOH
  not_if "test -f #{node[:osm2pgsql][:source_install_prefix]}/bin/osm2pgsql"
end

git 'osm2pgsql' do
  repository 'https://github.com/openstreetmap/osm2pgsql.git'
  reference 'master'
  #reference node[:app_name][:git_revision]
  action :sync
  destination '/opt/osm2pgsql'
  notifies :run, "bash[build_osm2pgsql]", :immediately
end

