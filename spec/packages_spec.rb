require 'spec_helper'

describe 'osm2pgsql::packages' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'should include recipe apt::default' do
    chef_run.should include_recipe 'apt::default'
  end

  it 'should install supporting build packages' do
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
    ).each do |pkg|
      chef_run.should install_package pkg
    end
  end

  context 'platform version <= 12.04' do
    let(:chef_run) { ChefSpec::Runner.new(platform: 'ubuntu', version: '12.04').converge(described_recipe) }

    it 'should install package proj' do
      chef_run.should install_package 'proj'
    end
  end

  context 'platform version > 12.04' do
    let(:chef_run) { ChefSpec::Runner.new(platform: 'ubuntu', version: '13.04').converge(described_recipe) }

    it 'should install package libproj-dev' do
      chef_run.should install_package 'libproj-dev'
    end
  end

end
