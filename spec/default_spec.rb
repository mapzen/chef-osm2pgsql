require 'spec_helper'

describe 'osm2pgsql::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'should include recipe osm2pgsql::install' do
    expect(chef_run).to include_recipe 'osm2pgsql::install'
  end

  it 'should include recipe apt::default' do
    expect(chef_run).to include_recipe 'apt::default'
  end
end
