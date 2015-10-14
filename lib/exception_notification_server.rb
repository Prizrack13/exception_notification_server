require 'rubygems'
require 'coderay'
require 'exception_notification_server/engine'

module ExceptionNotificationServer
  def self.configure(&_block)
    yield configuration
  end

  def self.configuration
    @configuration ||= ExceptionNotificationServer::Configuration.new
  end

  class Configuration
    attr_accessor :name, :password, :access_callback, :time_format

    def initialize(name: 'webhook', password: '', access_callback: nil, time_format: '%m/%d/%Y %H:%M:%S')
      @name, @password, @access_callback, @time_format = name, password, access_callback, time_format
    end
  end
end
