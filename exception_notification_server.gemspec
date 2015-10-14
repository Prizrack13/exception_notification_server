# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: exception_notification_server 0.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = 'exception_notification_server'
  s.version = '0.0.1'

  s.required_rubygems_version = Gem::Requirement.new('>= 0') if s.respond_to? :required_rubygems_version=
  s.require_paths = ['lib']
  s.authors = ['Anatoliy Varanitsa']
  s.date = '2015-10-14'
  s.description = 'Gem that receive errors from exception_notification gem and show it grouped on pages'
  s.email = 'Prizrack13@mail.ru'
  s.extra_rdoc_files = [
    'LICENSE.txt',
    'README.rdoc'
  ]
  s.files = [
    '.document',
    '.gitignore',
    '.ruby-gemset',
    '.ruby-version',
    'Gemfile',
    'Gemfile.lock',
    'LICENSE.txt',
    'README.rdoc',
    'Rakefile',
    'VERSION',
    'app/assets/images/exception_notification_server/.keep',
    'app/assets/javascripts/exception_notification_server/application.js.coffee',
    'app/assets/javascripts/exception_notification_server/flot/excanvas.js',
    'app/assets/javascripts/exception_notification_server/flot/jquery.flot.js',
    'app/assets/javascripts/exception_notification_server/flot/jquery.flot.resize.js',
    'app/assets/javascripts/exception_notification_server/flot/jquery.flot.time.js',
    'app/assets/javascripts/exception_notification_server/jquery.sparkline.js',
    'app/assets/javascripts/exception_notification_server/main.js.coffee',
    'app/assets/javascripts/exception_notification_server/pages/notifications.js.coffee',
    'app/assets/stylesheets/exception_notification_server/application.css.sass',
    'app/assets/stylesheets/exception_notification_server/layout.css.sass',
    'app/assets/stylesheets/exception_notification_server/notifications.css.sass',
    'app/controllers/exception_notification_server/application_controller.rb',
    'app/controllers/exception_notification_server/notifications_controller.rb',
    'app/helpers/exception_notification_server/application_helper.rb',
    'app/models/exception_notification_server/notification.rb',
    'app/views/exception_notification_server/notifications/_notifications.html.haml',
    'app/views/exception_notification_server/notifications/index.html.haml',
    'app/views/exception_notification_server/notifications/index.js.haml',
    'app/views/exception_notification_server/notifications/show.html.haml',
    'app/views/layouts/exception_notification_server/application.html.haml',
    'config/routes.rb',
    'exception_notification_server.gemspec',
    'lib/exception_notification_server.rb',
    'lib/exception_notification_server/engine.rb',
    'lib/exception_notification_server/version.rb',
    'lib/generators/exception_notification_server/install_generator.rb',
    'lib/generators/exception_notification_server/templates/exception_notification_server.rb',
    'lib/generators/exception_notification_server/templates/migration.rb',
    'lib/tasks/exception_notification_server_tasks.rake',
    'readme.md',
    'test/dummy/README.rdoc',
    'test/dummy/Rakefile',
    'test/dummy/app/assets/images/.keep',
    'test/dummy/app/assets/javascripts/application.js',
    'test/dummy/app/assets/stylesheets/application.css',
    'test/dummy/app/controllers/application_controller.rb',
    'test/dummy/app/controllers/concerns/.keep',
    'test/dummy/app/helpers/application_helper.rb',
    'test/dummy/app/mailers/.keep',
    'test/dummy/app/models/.keep',
    'test/dummy/app/models/concerns/.keep',
    'test/dummy/app/views/layouts/application.html.erb',
    'test/dummy/bin/bundle',
    'test/dummy/bin/rails',
    'test/dummy/bin/rake',
    'test/dummy/config.ru',
    'test/dummy/config/application.rb',
    'test/dummy/config/boot.rb',
    'test/dummy/config/database.yml',
    'test/dummy/config/environment.rb',
    'test/dummy/config/environments/development.rb',
    'test/dummy/config/environments/production.rb',
    'test/dummy/config/environments/test.rb',
    'test/dummy/config/initializers/assets.rb',
    'test/dummy/config/initializers/backtrace_silencers.rb',
    'test/dummy/config/initializers/cookies_serializer.rb',
    'test/dummy/config/initializers/filter_parameter_logging.rb',
    'test/dummy/config/initializers/inflections.rb',
    'test/dummy/config/initializers/mime_types.rb',
    'test/dummy/config/initializers/session_store.rb',
    'test/dummy/config/initializers/wrap_parameters.rb',
    'test/dummy/config/locales/en.yml',
    'test/dummy/config/routes.rb',
    'test/dummy/config/secrets.yml',
    'test/dummy/db/test.sqlite3',
    'test/dummy/lib/assets/.keep',
    'test/dummy/log/.keep',
    'test/dummy/log/test.log',
    'test/dummy/public/404.html',
    'test/dummy/public/422.html',
    'test/dummy/public/500.html',
    'test/dummy/public/favicon.ico',
    'test/exception_notification_server_test.rb',
    'test/integration/navigation_test.rb',
    'test/test_helper.rb'
  ]
  s.homepage = 'http://github.com/prizrack13/exception_notification_server'
  s.licenses = ['MIT']
  s.required_ruby_version = Gem::Requirement.new('>= 1.9.2')
  s.rubygems_version = '2.2.2'
  s.summary = 'Exception Notifiaction Server'
  s.test_files = ['test/dummy/README.rdoc', 'test/dummy/Rakefile', 'test/dummy/app/assets/images/.keep', 'test/dummy/app/assets/javascripts/application.js', 'test/dummy/app/assets/stylesheets/application.css', 'test/dummy/app/controllers/application_controller.rb', 'test/dummy/app/controllers/concerns/.keep', 'test/dummy/app/helpers/application_helper.rb', 'test/dummy/app/mailers/.keep', 'test/dummy/app/models/.keep', 'test/dummy/app/models/concerns/.keep', 'test/dummy/app/views/layouts/application.html.erb', 'test/dummy/bin/bundle', 'test/dummy/bin/rails', 'test/dummy/bin/rake', 'test/dummy/config.ru', 'test/dummy/config/application.rb', 'test/dummy/config/boot.rb', 'test/dummy/config/database.yml', 'test/dummy/config/environment.rb', 'test/dummy/config/environments/development.rb', 'test/dummy/config/environments/production.rb', 'test/dummy/config/environments/test.rb', 'test/dummy/config/initializers/assets.rb', 'test/dummy/config/initializers/backtrace_silencers.rb', 'test/dummy/config/initializers/cookies_serializer.rb', 'test/dummy/config/initializers/filter_parameter_logging.rb', 'test/dummy/config/initializers/inflections.rb', 'test/dummy/config/initializers/mime_types.rb', 'test/dummy/config/initializers/session_store.rb', 'test/dummy/config/initializers/wrap_parameters.rb', 'test/dummy/config/locales/en.yml', 'test/dummy/config/routes.rb', 'test/dummy/config/secrets.yml', 'test/dummy/db/test.sqlite3', 'test/dummy/lib/assets/.keep', 'test/dummy/log/.keep', 'test/dummy/log/test.log', 'test/dummy/public/404.html', 'test/dummy/public/422.html', 'test/dummy/public/500.html', 'test/dummy/public/favicon.ico', 'test/exception_notification_server_test.rb', 'test/integration/navigation_test.rb', 'test/test_helper.rb']

  if s.respond_to? :specification_version
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0')
      s.add_runtime_dependency('rails', ['~> 4.1.0'])
      s.add_runtime_dependency('coderay', ['~> 1.1.0'])
      s.add_runtime_dependency('jquery-rails', ['>= 0'])
      s.add_runtime_dependency('jquery-ui-rails', ['>= 0'])
      s.add_runtime_dependency('will_paginate', ['>= 0'])
      s.add_runtime_dependency('haml', ['>= 0'])
      s.add_development_dependency('shoulda', ['>= 0'])
      s.add_development_dependency('rdoc', ['~> 3.12'])
      s.add_development_dependency('bundler', ['~> 1.0'])
      s.add_development_dependency('jeweler', ['~> 2.0.1'])
      s.add_development_dependency('simplecov', ['>= 0'])
      s.add_development_dependency('rubocop', ['>= 0'])
    else
      s.add_dependency('rails', ['~> 4.1.0'])
      s.add_dependency('coderay', ['~> 1.1.0'])
      s.add_dependency('jquery-rails', ['>= 0'])
      s.add_dependency('jquery-ui-rails', ['>= 0'])
      s.add_dependency('will_paginate', ['>= 0'])
      s.add_dependency('haml', ['>= 0'])
      s.add_dependency('shoulda', ['>= 0'])
      s.add_dependency('rdoc', ['~> 3.12'])
      s.add_dependency('bundler', ['~> 1.0'])
      s.add_dependency('jeweler', ['~> 2.0.1'])
      s.add_dependency('simplecov', ['>= 0'])
      s.add_dependency('rubocop', ['>= 0'])
    end
  else
    s.add_dependency('rails', ['~> 4.1.0'])
    s.add_dependency('coderay', ['~> 1.1.0'])
    s.add_dependency('jquery-rails', ['>= 0'])
    s.add_dependency('jquery-ui-rails', ['>= 0'])
    s.add_dependency('will_paginate', ['>= 0'])
    s.add_dependency('haml', ['>= 0'])
    s.add_dependency('shoulda', ['>= 0'])
    s.add_dependency('rdoc', ['~> 3.12'])
    s.add_dependency('bundler', ['~> 1.0'])
    s.add_dependency('jeweler', ['~> 2.0.1'])
    s.add_dependency('simplecov', ['>= 0'])
    s.add_dependency('rubocop', ['>= 0'])
  end
end
