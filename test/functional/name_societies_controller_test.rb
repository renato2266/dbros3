require 'test_helper'

class NameSocietiesControllerTest < ActionController::TestCase
  setup do
    @name_society = name_societies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:name_societies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create name_society" do
    assert_difference('NameSociety.count') do
      post :create, :name_society => @name_society.attributes
    end

    assert_redirected_to name_society_path(assigns(:name_society))
  end

  test "should show name_society" do
    get :show, :id => @name_society.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @name_society.to_param
    assert_response :success
  end

  test "should update name_society" do
    put :update, :id => @name_society.to_param, :name_society => @name_society.attributes
    assert_redirected_to name_society_path(assigns(:name_society))
  end

  test "should destroy name_society" do
    assert_difference('NameSociety.count', -1) do
      delete :destroy, :id => @name_society.to_param
    end

    assert_redirected_to name_societies_path
  end
end
