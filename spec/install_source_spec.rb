require 'spec_helper'

describe 'osm2pgsql::install_source' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'should include recipe git' do
    chef_run.should include_recipe 'git'
  end

  it 'should include recipe osm2pgsql::packages' do
    chef_run.should include_recipe 'osm2pgsql::packages'
  end

  it 'should define a bash resource build_osm2pgsql with no action' do
    chef_run.should_not run_bash 'build_osm2pgsql'
  end

  it 'should clone osm2pgsql from git' do
    chef_run.should sync_git('osm2pgsql').with(
      repository:   'https://github.com/openstreetmap/osm2pgsql.git',
      reference:    'master',
      destination:  '/opt/osm2pgsql'
    )
  end

  it 'should notify build_osm2pgsql' do
    git = chef_run.git('osm2pgsql')
    expect(git).to notify('bash[build_osm2pgsql]').to(:run).immediately
  end

end
