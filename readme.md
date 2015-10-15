# Exception Notification Server

**THIS README IS FOR THE MASTER BRANCH AND REFLECTS THE WORK CURRENTLY EXISTING ON THE MASTER BRANCH. IF YOU ARE WISHING TO USE A NON-MASTER BRANCH OF EXCEPTION NOTIFICATION, PLEASE CONSULT THAT BRANCH'S README AND NOT THIS ONE.**

-

The Exception Notification Server gem provides a engine for receiving notifications from Exception Notification gem (webhook-notifier).


## Requirements

* Ruby 1.9.2 or greater
* Rails 4.1 or greater.

For previous releases, please checkout [this](#versions).


## Getting Started

Add the following line to your application's Gemfile:

```ruby
gem 'exception_notification_server'
```

Run 
rails g exception_notification_server:install

This command generates an initialize file (`config/initializers/exception_notification_server.rb`) where you can customize your configurations, migration and add routes.

### Webhook notifier

This notifier ships notifications over the HTTP protocol.

#### Usage

Just add the [HTTParty](https://github.com/jnunemaker/httparty) gem to your `Gemfile`:

```ruby
gem 'httparty'
```

To configure it, you need to set the `url` option, like this:

```ruby
ExceptionNotification.configure do |config|
  config.add_notifier :webhook, {
      url: 'http://domain.com:5555/notifier/notifications.json',
      verify: false,
      basic_auth: {
        username: 'username',
        password: 'password'
      },
      body: {
        application: 'application_name',
        env: Rails.env
      }
    }
end
```
