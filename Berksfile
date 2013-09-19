site :opscode

%w(apt git).each do |c|
  cookbook c
end

cookbook 'osm2pgsql', :path => '.'
