require 'test_helper'

class ParseusersControllerTest < ActionController::TestCase
  setup do
    @parseuser = parseusers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:parseusers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create parseuser" do
    assert_difference('Parseuser.count') do
      post :create, parseuser: { email: @parseuser.email, name: @parseuser.name, password: @parseuser.password }
    end

    assert_redirected_to parseuser_path(assigns(:parseuser))
  end

  test "should show parseuser" do
    get :show, id: @parseuser
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @parseuser
    assert_response :success
  end

  test "should update parseuser" do
    patch :update, id: @parseuser, parseuser: { email: @parseuser.email, name: @parseuser.name, password: @parseuser.password }
    assert_redirected_to parseuser_path(assigns(:parseuser))
  end

  test "should destroy parseuser" do
    assert_difference('Parseuser.count', -1) do
      delete :destroy, id: @parseuser
    end

    assert_redirected_to parseusers_path
  end
end
