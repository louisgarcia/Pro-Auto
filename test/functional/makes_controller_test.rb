require 'test_helper'

class MakesControllerTest < ActionController::TestCase
  setup do
    @make = makes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:makes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create make" do
    assert_difference('Make.count') do
      post :create, :make => @make.attributes
    end

    assert_redirected_to make_path(assigns(:make))
  end

  test "should show make" do
    get :show, :id => @make.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @make.to_param
    assert_response :success
  end

  test "should update make" do
    put :update, :id => @make.to_param, :make => @make.attributes
    assert_redirected_to make_path(assigns(:make))
  end

  test "should destroy make" do
    assert_difference('Make.count', -1) do
      delete :destroy, :id => @make.to_param
    end

    assert_redirected_to makes_path
  end
end
