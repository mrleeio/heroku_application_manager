require "application_system_test_case"

module Pages
  class HomeTest < ApplicationSystemTestCase
    test "open home screen" do
      visit root_url
      assert_selector "h1", text: "Hello World!"
    end
  end
end
