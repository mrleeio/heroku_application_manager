require "application_system_test_case"

class Heroku::StacksTest < ApplicationSystemTestCase
  setup do
    @heroku_stack = create(:heroku_stack)
  end

  test "visiting the index" do
    visit heroku_stacks_url
    assert_selector "h1", text: "Stacks"
  end

  test "should create stack" do
    heroku_stack_attributes = attributes_for(:heroku_stack)

    visit heroku_stacks_url
    click_on "New stack"

    fill_in "Heroku identifier", with: heroku_stack_attributes[:heroku_identifier]
    fill_in "Heroku name", with: heroku_stack_attributes[:heroku_name]
    fill_in "Name", with: heroku_stack_attributes[:name]
    click_on "Create Stack"

    assert_text "Stack was successfully created"
    click_on "Back"
  end

  test "should update Stack" do
    heroku_stack_attributes = attributes_for(:heroku_stack, name: "Updated Name")

    visit heroku_stack_url(@heroku_stack)
    click_on "Edit this stack", match: :first

    fill_in "Heroku identifier", with: heroku_stack_attributes[:heroku_identifier]
    fill_in "Heroku name", with: heroku_stack_attributes[:heroku_name]
    fill_in "Name", with: heroku_stack_attributes[:name]
    click_on "Update Stack"

    assert_text "Stack was successfully updated"
    click_on "Back"
  end

  test "should destroy Stack" do
    visit heroku_stack_url(@heroku_stack)
    click_on "Destroy this stack", match: :first

    assert_text "Stack was successfully destroyed"
  end
end
