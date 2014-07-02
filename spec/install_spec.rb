require 'spec_helper'

describe 'osm2pgsql::install' do
  context 'install type pkg' do
    let(:chef_run) do
      ChefSpec::Runner.new do |node|
        node.set[:osm2pgsql][:install_type] = 'pkg'
      end.converge(described_recipe)
    end

    it 'should include recipe osm2pgsql::install_pkg' do
      expect(chef_run).to include_recipe 'osm2pgsql::install_pkg'
    end
  end

  context 'install type source' do
    let(:chef_run) do
      ChefSpec::Runner.new do |node|
        node.set[:osm2pgsql][:install_type] = 'source'
      end.converge(described_recipe)
    end

    it 'should include recipe osm2pgsql::install_source' do
      expect(chef_run).to include_recipe 'osm2pgsql::install_source'
    end
  end

end
