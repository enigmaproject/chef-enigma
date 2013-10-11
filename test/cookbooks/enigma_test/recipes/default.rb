include_recipe 'enigma'

enigma_service 'memcached' do
  action :register
  port 11211
  etcdhosts [node['ipaddress']]
  environment "production"
  ip node['ipaddress']
end

enigma_service 'memcached' do
  action :register
  port 11211
  etcdhosts [node['ipaddress']]
  ip '10.0.2.100'
  environment "production"
end
