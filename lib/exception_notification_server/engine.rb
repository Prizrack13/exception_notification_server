module ExceptionNotificationServer
  class Engine < ::Rails::Engine
    isolate_namespace ExceptionNotificationServer
    config.to_prepare do
      Rails.application.config.assets.precompile += %w(
        exception_notification_server/flot/excanvas.js
      )
    end
  end
end
