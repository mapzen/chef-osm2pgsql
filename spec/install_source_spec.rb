require 'spec_helper'

describe 'osm2pgsql::install_source' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'should include recipe osm2pgsql::packages' do
    expect(chef_run).to include_recipe 'osm2pgsql::packages'
  end

  it 'should ark osm2pgsql' do
    expect(chef_run).to install_with_make_ark 'osm2pgsql'
  end

end
