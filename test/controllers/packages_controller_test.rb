require 'test_helper'

class PackagesControllerTest < ActionController::TestCase
  setup do
    @package = packages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:packages)
  end

  test "should create package" do
    assert_difference('Package.count') do
      post :create, package: {  }
    end

    assert_response 201
  end

  test "should show package" do
    get :show, id: @package
    assert_response :success
  end

  test "should update package" do
    put :update, id: @package, package: {  }
    assert_response 204
  end

  test "should destroy package" do
    assert_difference('Package.count', -1) do
      delete :destroy, id: @package
    end

    assert_response 204
  end
end
