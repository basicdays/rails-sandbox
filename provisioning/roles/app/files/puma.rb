#!/usr/bin/env puma
# frozen_string_literal: true

# Initially generated by capistrano3-puma, didn't edit much beyond that

directory '/var/www/rails_sandbox/current'
rackup '/var/www/rails_sandbox/current/config.ru'
environment 'vbox'

tag ''

pidfile '/var/www/rails_sandbox/shared/tmp/pids/puma.pid'
state_path '/var/www/rails_sandbox/shared/tmp/pids/puma.state'
stdout_redirect '/var/www/rails_sandbox/shared/log/puma_access.log', '/var/www/rails_sandbox/shared/log/puma_error.log', true


threads 0,16



bind 'unix:///var/www/rails_sandbox/shared/tmp/sockets/puma.sock'

workers 0




restart_command 'bundle exec puma'


prune_bundler


on_restart do
  puts 'Refreshing Gemfile'
  ENV['BUNDLE_GEMFILE'] = ''
end

