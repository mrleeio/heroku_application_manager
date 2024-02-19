# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Configuration

### Rack Canonical Host

Rack middleware that lets you define a single host name as the canonical host for your application. Requests for other host names will then be redirected to the canonical host.

Use the `APPLICATION_HOST` environment variable in the production environment.

### Rack Timeout

Abort requests that are taking too long; an exception is raised.

A timeout of 15s is the default. It's recommended to set the timeout as low as realistically viable for your application. You can modify this by setting the `RACK_TIMEOUT_SERVICE_TIMEOUT` environment variable.

### Recipient Interceptor

Use the `EMAIL_RECIPIENTS` environment variable to intercept mail sent from the application.

Example:

```
EMAIL_RECIPIENTS="one@example.com,two@example.com"
```

Emails will be redirect to one@example.com and two@example.com.

## Development

### Based UUIID

https://github.com/pch/based_uuid

Generate “double-clickable”, URL-friendly UUIDs with optional prefixes.

Inheriting off of `ApplicationRecord ` will automatically generate a non-prefixed Based UUID for all models:

```
user = User.last
user.based_uuid #=> 12dm1qresn83st62reqdw7f7cv
```

Adding a prefix to your model can make Based UUIDs easier to identify:

```
class User < ApplicationRecord
  has_based_uuid prefix: :user
end

user = User.last
user.based_uuid #=> user_12dm1qresn83st62reqdw7f7cv
```

#### Default to Based UUID URL Identifiers

By default, `ApplicationRecord` uses the Based UUID in the URL:

> http://localhost:3000/users/user_01hq16adwnf10t9kenr2zj1qyf

To enable Based UUID lookup in controllers ensure you use the following methods:

```
User.find_by_based_uuid("user_12dm1qresn83st62reqdw7f7cv")

# or without the prefix:
User.find_by_based_uuid("12dm1qresn83st62reqdw7f7cv")

# there’s also the bang version:
User.find_by_based_uuid!("12dm1qresn83st62reqdw7f7cv")
```

User controller example:

```
class UsersController < ApplicationController
  ...
  private
  def set_user
    @user = User.find_by_based_uuid(params[:id])
  end
  ...
end
```

## Testing

Run non-system tests:

```
bundle exec rails test
```

Run system tests:

```
bundle exec rails test:system
```

### Factory Bot

Ruby on Rails generates factories instead of fixtures by default. Factories are locationed in `test/factories/*`.

For detailed instructions on how to use factories reference the official [documentation](https://thoughtbot.github.io/factory_bot/).

### Shoulda

[Shoulda Matchers](https://github.com/thoughtbot/shoulda-matchers) provides RSpec- and Minitest-compatible one-liners to test common Rails functionality that, if written by hand, would be much longer, more complex, and error-prone.

[Shoulda Context](https://github.com/thoughtbot/shoulda-context) makes it easy to write understandable and maintainable tests under Minitest and Test::Unit within Rails projects or plain Ruby projects. It's fully compatible with your existing tests and requires no retooling to use.

### Cuprite

[Cuprite](https://github.com/rubycdp/cuprite) is a pure Ruby driver (read as no Selenium/WebDriver/ChromeDriver dependency) for [Capybara](https://github.com/teamcapybara/capybara). It allows you to run Capybara tests on a headless Chrome or Chromium. Under the hood it uses [Ferrum](https://github.com/rubycdp/ferrum#index) which is high-level API to the browser by CDP protocol.

#### Headless Mode

Use the `HEADLESS` environment variable to run tests in headless mode.

#### Docker Mode

User the `DOCKER` environment variable to add the `no-sandbox` option.

