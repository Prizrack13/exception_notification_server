# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts 'Run `bundle install` to install missing gems'
  exit e.status_code
end
require 'rake'

APP_RAKEFILE = File.expand_path('../test/dummy/Rakefile', __FILE__)
load 'rails/tasks/engine.rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://guides.rubygems.org/specification-reference/ for more options
  gem.name = 'exception_notification_server'
  gem.homepage = 'http://github.com/prizrack13/exception_notification_server'
  gem.license = 'MIT'
  gem.summary = %(Exception Notifiaction Server)
  gem.description = %(Gem that receive errors from exception_notification gem and show it grouped on pages)
  gem.email = 'Prizrack13@mail.ru'
  gem.authors = ['Anatoliy Varanitsa']
  gem.platform = Gem::Platform::RUBY
  gem.required_ruby_version = '>= 1.9.2'
  gem.files = `git ls-files`.split($INPUT_RECORD_SEPARATOR).delete_if { |f| f == 'bin/rails' }
  gem.executables = gem.files.grep(/^bin\//) { |f| File.basename(f) }.delete_if { |f| f == 'rails' }
  gem.test_files    = gem.files.grep(/^(test|spec|features)\//)
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = true
end

desc 'Code coverage detail'
task :simplecov do
  ENV['COVERAGE'] = 'true'
  Rake::Task['test'].execute
end

task default: :test

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ''

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "exception_notification_server #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
