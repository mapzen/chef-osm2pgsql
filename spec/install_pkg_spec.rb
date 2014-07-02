require 'spec_helper'

describe 'osm2pgsql::install_pkg' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'should install package osm2pgsql' do
    expect(chef_run).to install_package 'osm2pgsql'
  end
end
