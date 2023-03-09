require "test_helper"

class PackagesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get packages_new_url
    assert_response :success
  end

  test "should get create" do
    get packages_create_url
    assert_response :success
  end
end
