require "test_helper"

class Heroku::StacksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @heroku_stack = create(:heroku_stack)
    @heroku_stack_attributes = attributes_for(:heroku_stack)
  end

  test "should get index" do
    get heroku_stacks_url
    assert_response :success
  end

  test "should get new" do
    get new_heroku_stack_url
    assert_response :success
  end

  test "should create heroku_stack" do
    assert_difference("Heroku::Stack.count") do
      post heroku_stacks_url, params: {
        heroku_stack: {
          heroku_identifier: @heroku_stack_attributes[:heroku_identifier],
          heroku_name: @heroku_stack_attributes[:heroku_name],
          name: @heroku_stack_attributes[:name]
        }
      }
    end

    assert_redirected_to heroku_stack_url(Heroku::Stack.last)
  end

  test "should show heroku_stack" do
    get heroku_stack_url(@heroku_stack)
    assert_response :success
  end

  test "should get edit" do
    get edit_heroku_stack_url(@heroku_stack)
    assert_response :success
  end

  test "should update heroku_stack" do
    patch heroku_stack_url(@heroku_stack), params: {
      heroku_stack: {
        heroku_identifier: @heroku_stack.heroku_identifier,
        heroku_name: @heroku_stack.heroku_name,
        name: @heroku_stack.name
      }
    }

    assert_redirected_to heroku_stack_url(@heroku_stack)
  end

  test "should destroy heroku_stack" do
    assert_difference("Heroku::Stack.count", -1) do
      delete heroku_stack_url(@heroku_stack)
    end

    assert_redirected_to heroku_stacks_url
  end
end
