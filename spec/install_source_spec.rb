require 'spec_helper'

describe 'osm2pgsql::install_source' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'should include recipe apt' do
    chef_run.should include_recipe 'apt::default'
  end

  it 'should include recipe osm2pgsql::packages' do
    chef_run.should include_recipe 'osm2pgsql::packages'
  end

  it 'should ark osm2pgsql' do
    chef_run.should install_with_make_ark 'osm2pgsql'
  end

end
