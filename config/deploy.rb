$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require "rvm/capistrano"

set :rvm_ruby_string, '1.9.3'
set :rvm_type, :user


set :application, "flyware"
set :rails_env, "production"
default_run_options[:pty] = true


set :user, "rvm"
set :use_sudo, false
set :deploy_to, "/home/rvm/webapps/#{application}"

set :deploy_via, :remote_cache

set :scm, :git
set :repository,  "git@github.com:kirillivanov/abrakadabra.git"
set :branch, "master"
set :ssh_options, { :forward_agent => true }

role :web, "rvm@188.127.226.141"
role :app, "rvm@188.127.226.141"
role :db,  "rvm@188.127.226.141", :primary => true

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
   run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  task :upload_settings do
    run "mkdir -p #{shared_path}/assets/"
    run "mkdir -p #{shared_path}/spree/"
  end

  task :bundle_new_release do
    puts '---------------------------------------------------------------------'
    puts 'BUNDLE RELEASE AND PRECOMPILE ASSETS'
    puts '---------------------------------------------------------------------'
    run "cd #{release_path} && bundle install --without development test"
  end

  task :symlink_shared do
    puts '---------------------------------------------------------------------'
    puts 'symlink_shared: #{shared_path}/assets #{release_path}/public/assets'
    puts 'symlink_shared: #{shared_path}/spree #{release_path}/public/spree'
    puts '---------------------------------------------------------------------'
    run "ln -nfs #{shared_path}/assets #{release_path}/public/assets"
    run "ln -nfs #{shared_path}/spree #{release_path}/public/spree"

    deploy.bundle_new_release
   end

  task :bundle_new_release do
    puts '---------------------------------------------------------------------'
    puts 'BUNDLE RELEASE AND PRECOMPILE ASSETS'
    puts '---------------------------------------------------------------------'
    run "cd #{release_path} && bundle install --without development test && bundle exec rake assets:precompile"
  end

end

after 'deploy:setup', 'deploy:upload_settings'
after 'deploy:update_code', 'deploy:symlink_shared'