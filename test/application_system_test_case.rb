require "capybara/cuprite"

require "test_helper"
require "system/test_helpers/better_rails_system_tests"
require "system/test_helpers/capybara_setup"
require "system/test_helpers/cuprite_helpers"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by(
    :cuprite,
    using: :chrome,
    screen_size: [ 1400, 1400 ],
    options: {
      js_errors: true,
      headless: %w[0 false].exclude?(ENV["HEADLESS"]),
      slowmo: ENV["SLOWMO"]&.to_f,
      process_timeout: 15,
      timeout: 10,
      browser_options: ENV["DOCKER"] ? { "no-sandbox" => nil } : {}
    }
  )

  include BetterRailsSystemTests
  include CupriteHelpers
end
