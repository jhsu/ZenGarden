$:.unshift(File.expand_path("~/.rvm/lib"))
require 'rvm/capistrano'

set :user, "http"
set :use_sudo, false

set :rvm_ruby_string, '1.9.2-p0'
set :rvm_type, :system

set :application, "ZenGarden"
set :scm, :git
set :repository,  "https://jhsu@github.com/jhsu/ZenGarden.git"
set :deploy_to, "/home/http/zengarden"


role :web, "jhsu.org"                          # Your HTTP server, Apache/etc
role :app, "jhsu.org"                          # This may be the same as your `Web` server
role :db,  "jhsu.org", :primary => true # This is where Rails migrations will run

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
  task :start do
		run "touch #{current_path}/tmp/restart.txt"
	end

  task :stop do ; end

  task :restart, :roles => :app, :except => { :no_release => true } do
		run "touch #{current_path}/tmp/restart.txt"
  end
end
