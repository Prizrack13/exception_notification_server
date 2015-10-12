module ExceptionNotificationServer
  module ApplicationHelper
    def pretty_json(data, lines = nil)
      json = JSON.pretty_generate(data).html_safe
      json_colored = CodeRay.scan(json, :json).span(css: :style, line_numbers: :inline, line_number_anchors: false)
      return "<pre>\n#{json_colored}</pre>".html_safe if lines.nil? || json.count("\n") < lines
      "<pre>\n#{json_colored.match(/([^\n]*\n){#{lines}}/m)}</span></pre>".html_safe
    rescue
      data
    end

    def status_options(options)
      options_for_select(Notification::STATUSES.map{|status| [status.to_s.humanize, status]}, options[:selected])
    end

    def application_options(options)
      options_for_select(Notification.group(:application).pluck(:application).map{|application| [application.humanize, application]}, options[:selected])
    end

    def environment_options(options)
      default_environment = ['production', 'staging', 'development', 'test']
      options_for_select((default_environment + Notification.group(:env).pluck(:env)).uniq.map{|env| [env.humanize, env]}, options[:selected])
    end

    def time_format
      ExceptionNotificationServer.configuration.time_format
    end

    def logo_string
      <<-Text
 ______                    _   _             _   _       _   _  __ _           _   _              _____
|  ____|                  | | (_)           | \\ | |     | | (_)/ _(_)         | | (_)            / ____|
| |__  __  _____ ___ _ __ | |_ _  ___  _ __ |  \\| | ___ | |_ _| |_ _  ___ __ _| |_ _  ___  _ __ | (___   ___ _ ____   _____ _ __
|  __| \\ \\/ / __/ _ \\ \'_ \\| __| |/ _ \\| \'_ \\| . ` |/ _ \\| __| |  _| |/ __/ _\` | __| |/ _ \\| \'_ \\ \\___ \\ / _ \\ \'__\\ \\ / / _ \\ \'__|
| |____ >  < (_|  __/ |_) | |_| | (_) | | | | |\\  | (_) | |_| | | | | (_| (_| | |_| | (_) | | | |____) |  __/ |   \\ V /  __/ |
|______/_/\\_\\___\\___| .__/ \\__|_|\\___/|_| |_|_| \\_|\\___/ \\__|_|_| |_|\\___\\__,_|\\__|_|\\___/|_| |_|_____/ \\___|_|    \\_/ \\___|_|
                    | |
                    |_|
      Text
    end

    def author
      'Author: Anatoliy Varanitsa'
    end
  end
end
