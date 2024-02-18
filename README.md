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