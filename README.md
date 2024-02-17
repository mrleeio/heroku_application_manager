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

## Testing

Run non-system tests:

```
bundle exec rails test
```

Run system tests:

```
bundle exec rails test:system
```

### Cuprite

[Cuprite](https://github.com/rubycdp/cuprite) is a pure Ruby driver (read as no Selenium/WebDriver/ChromeDriver dependency) for [Capybara](https://github.com/teamcapybara/capybara). It allows you to run Capybara tests on a headless Chrome or Chromium. Under the hood it uses [Ferrum](https://github.com/rubycdp/ferrum#index) which is high-level API to the browser by CDP protocol.

#### Headless Mode

Use the `HEADLESS` environment variable to run tests in headless mode.

#### Docker Mode

User the `DOCKER` environment variable to add the `no-sandbox` option.