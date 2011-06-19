require 'test_helper'

class AddOnsControllerTest < ActionController::TestCase
  setup do
    @add_on = add_ons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:add_ons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create add_on" do
    assert_difference('AddOn.count') do
      post :create, :add_on => @add_on.attributes
    end

    assert_redirected_to add_on_path(assigns(:add_on))
  end

  test "should show add_on" do
    get :show, :id => @add_on.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @add_on.to_param
    assert_response :success
  end

  test "should update add_on" do
    put :update, :id => @add_on.to_param, :add_on => @add_on.attributes
    assert_redirected_to add_on_path(assigns(:add_on))
  end

  test "should destroy add_on" do
    assert_difference('AddOn.count', -1) do
      delete :destroy, :id => @add_on.to_param
    end

    assert_redirected_to add_ons_path
  end
end
