ask(:password, nil, echo: false)
# Unsecure Deploy
server '192.168.122.122', user: 'u1234567', port: 65002, roles: %w{app web db}

# Secure Deploy
# server '192.168.122.122', user: 'u1234567', port: 65002, password: fetch(:password), roles: %w{app web db}

# Default branch is :master
set :branch, "preprod"

# Default deploy_to directory is /var/www/my_app_name
set :root_path, "/home/u1234567/preprod"
set :deploy_to, "#{fetch(:root_path)}"
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

# namespace :composer do
#   desc 'Install Composer'
#   task :install do
#     on roles(:all) do
#       execute "cd #{fetch(:src_current)}; php -d extension=phar.so composer install"
#     end
#   end

#   desc 'Update Composer'
#   task :update do
#     on roles(:all) do
#       execute "cd #{fetch(:src_current)}; php -d extension=phar.so composer self-update"
#     end
#   end

#   desc 'Dump Autoload Composer'
#   task :dumpautoload do
#     on roles(:all) do
#       execute "cd #{fetch(:src_current)}; php -d extension=phar.so composer dump-autoload -o"
#     end
#   end

#   task :initialize do
#     on roles(:all) do
#       invoke 'composer:install'
#       invoke 'composer:dumpautoload'
#     end
#   end
# end
