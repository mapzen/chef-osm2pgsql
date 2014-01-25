default[:osm2pgsql][:install_type]          = 'pkg'
default[:osm2pgsql][:source_install_prefix] = '/usr'
default[:osm2pgsql][:pkg_version]           = node[:mapzen][:osm2pgsql][:version] || '0.0.1'
