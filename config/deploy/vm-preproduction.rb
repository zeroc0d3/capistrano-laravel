ask(:password, nil, echo: false)
# Unsecure Deploy
server '192.168.122.122', user: 'root', port: 22, roles: %w{app web db}

# Secure Deploy
# server '192.168.122.122', user: 'root', port: 22, password: fetch(:password), roles: %w{app web db}

# Default branch is :master
set :branch, "preprod"

# Default deploy_to directory is /var/www/my_app_name
set :root_path, "/var/www/preprod"
set :deploy_to, "#{fetch(:root_path)}/#{fetch(:branch)}"
set :shared_folder, "#{fetch(:deploy_to)}/shared"
set :tmp_dir, "#{fetch(:deploy_to)}/tmp"

set :src_current, "#{current_path}/#{fetch(:source)}"
set :src_release, "#{release_path}/#{fetch(:source)}"
set :current_storage, "#{fetch(:src_current)}/storage"
set :release_storage, "#{fetch(:src_release)}/storage"

set :pty, true

set :ssh_options, {
  forward_agent: true
}

set :default_environment, {
  #-- rbenv --#
  # 'PATH' => "$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"

  #-- rvm --#
  'PATH' => "$HOME/.rvm/bin:$PATH"
}
