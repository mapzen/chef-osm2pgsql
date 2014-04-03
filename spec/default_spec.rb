require 'spec_helper'

describe 'osm2pgsql::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'should include recipe osm2pgsql::install' do
    chef_run.should include_recipe 'osm2pgsql::install'
  end
end
