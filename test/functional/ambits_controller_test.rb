require 'test_helper'

class AmbitsControllerTest < ActionController::TestCase
  setup do
    @ambit = ambits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ambits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ambit" do
    assert_difference('Ambit.count') do
      post :create, :ambit => @ambit.attributes
    end

    assert_redirected_to ambit_path(assigns(:ambit))
  end

  test "should show ambit" do
    get :show, :id => @ambit.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @ambit.to_param
    assert_response :success
  end

  test "should update ambit" do
    put :update, :id => @ambit.to_param, :ambit => @ambit.attributes
    assert_redirected_to ambit_path(assigns(:ambit))
  end

  test "should destroy ambit" do
    assert_difference('Ambit.count', -1) do
      delete :destroy, :id => @ambit.to_param
    end

    assert_redirected_to ambits_path
  end
end
