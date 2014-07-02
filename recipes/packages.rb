#
# Cookbook Name:: osm2pgsql
# Recipe:: packages
#

include_recipe 'apt'

%w(
  build-essential
  libxml2-dev
  libgeos++-dev
  libpq-dev
  libbz2-dev
  libtool
  automake
  libprotobuf-c0-dev
  protobuf-c-compiler
  dh-make
).each do |p|
  package p do
    action :install
  end
end

package 'proj' do
  action :install
  only_if { platform?('ubuntu') && node[:platform_version] <= '12.04' }
end

package 'libproj-dev' do
  action :install
  only_if { platform?('ubuntu') && node[:platform_version] > '12.04' }
end
