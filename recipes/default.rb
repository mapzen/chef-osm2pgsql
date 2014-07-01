#
# Cookbook Name:: osm2pgsql
# Recipe:: default
#

include_recipe 'apt::default'
include_recipe 'osm2pgsql::install'
