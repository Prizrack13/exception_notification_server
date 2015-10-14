require 'rails/generators'
require 'rails/generators/migration'

module ExceptionNotificationServer
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration

      desc 'Generates migration for Notifications'
      def copy_initializer
        template 'exception_notification_server.rb', 'config/initializers/exception_notification_server.rb'
      end

      def mount_engine
        route 'mount ExceptionNotificationServer::Engine, at: \'/notifier\', as: \'notifier\''
      end

      def create_ckeditor_migration
        migration_template('migration.rb', File.join('db/migrate', 'create_exception_notification_server_notifications.rb'))
      end

      class << self
        def source_root
          @source_root ||= File.expand_path(File.join(File.dirname(__FILE__), 'templates'))
        end

        def next_migration_number(_dirname)
          Time.now.strftime('%Y%m%d%H%M%S')
        end
      end
    end
  end
end
