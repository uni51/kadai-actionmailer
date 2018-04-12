server '52.68.6.17', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/starboard/.ssh/id_rsa'
