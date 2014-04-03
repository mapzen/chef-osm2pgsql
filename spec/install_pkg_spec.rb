require 'spec_helper'

describe 'osm2pgsql::install_pkg' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'should install package osm2pgsql' do
    chef_run.should install_package 'osm2pgsql'
  end
end
