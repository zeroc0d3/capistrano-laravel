source 'https://rubygems.org'

group :development do
  gem 'byebug'
  gem 'capistrano'
  gem 'capistrano-rvm'
end

group :development, :test  do
  gem 'capistrano-sidekiq', github: 'seuros/capistrano-sidekiq'
  gem 'sshkit-sudo'
end

group :test do
  gem 'minitest', '~> 5.10.3'
end
