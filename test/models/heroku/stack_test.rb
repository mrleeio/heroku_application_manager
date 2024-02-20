require "test_helper"

class Heroku::StackTest < ActiveSupport::TestCase
  context "validations" do
    subject { create(:heroku_stack) }

    should validate_presence_of(:name)
    should validate_presence_of(:heroku_identifier)
    should validate_presence_of(:heroku_name)

    should validate_uniqueness_of(:name)
    should validate_uniqueness_of(:heroku_identifier).ignoring_case_sensitivity
    should validate_uniqueness_of(:heroku_name)

    should_not allow_value(" ").for(:heroku_identifier)
  end
end
