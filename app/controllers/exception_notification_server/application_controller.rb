module ExceptionNotificationServer
  class ApplicationController < ActionController::Base
    before_action :redirect_to_root, unless: :admin?

    add_flash_types :error, :success, :info

    def redirect_to_root
      respond_to do |format|
        format.js { render js: "window.location = '#{Rails.application.routes.url_helpers.root_url}';" }
        format.all { redirect_to Rails.application.routes.url_helpers.root_url }
      end
    end

    protected

    def admin?
      ExceptionNotificationServer.configuration.access_callback.present? ? ExceptionNotificationServer.configuration.access_callback.try(:call, self) : true
    end
  end
end
