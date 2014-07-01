# default attributes
#
default[:osm2pgsql][:install_type] = 'source' # 'source' or 'pkg'

# attributes for install_type == 'source'
#
default[:osm2pgsql][:owner]       = 'root'
default[:osm2pgsql][:prefix_root] = '/usr/local'
default[:osm2pgsql][:version]     = '0.84.0'
default[:osm2pgsql][:url]         = 'https://github.com/openstreetmap/osm2pgsql/archive/0.84.0.tar.gz'
