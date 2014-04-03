#
# Cookbook Name:: osm2pgsql
# Recipe:: install_source
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
  environment 'PREFIX' => node[:osm2pgsql][:source_install_prefix]
  code <<-EOH
    ./autogen.sh
    ./configure --prefix=#{node[:osm2pgsql][:source_install_prefix]}
    make -j "#{node[:cpu][:total]}" && make install
  EOH
  not_if "test -f #{node[:osm2pgsql][:source_install_prefix]}/bin/osm2pgsql"
end

git 'osm2pgsql' do
  action      :sync
  reference   'master'
  repository  'https://github.com/openstreetmap/osm2pgsql.git'
  destination '/opt/osm2pgsql'
  notifies    :run, 'bash[build_osm2pgsql]', :immediately
end
