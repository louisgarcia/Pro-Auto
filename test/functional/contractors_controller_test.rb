require 'test_helper'

class ContractorsControllerTest < ActionController::TestCase
  setup do
    @contractor = contractors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contractors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contractor" do
    assert_difference('Contractor.count') do
      post :create, :contractor => @contractor.attributes
    end

    assert_redirected_to contractor_path(assigns(:contractor))
  end

  test "should show contractor" do
    get :show, :id => @contractor.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @contractor.to_param
    assert_response :success
  end

  test "should update contractor" do
    put :update, :id => @contractor.to_param, :contractor => @contractor.attributes
    assert_redirected_to contractor_path(assigns(:contractor))
  end

  test "should destroy contractor" do
    assert_difference('Contractor.count', -1) do
      delete :destroy, :id => @contractor.to_param
    end

    assert_redirected_to contractors_path
  end
end
