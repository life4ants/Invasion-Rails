require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  def setup
    @user = users(:michael)
    @archer = users(:archer)
  end

  test "should redirect index when not logged in" do
    get :index
    assert_redirected_to login_url
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should redirect edit when not logged in" do
    get :edit, params: {id: @user}
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    patch :update, params: { id: @user, user: { name: @user.name, email: @user.email } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

    test "should redirect edit when logged in as wrong user" do
    log_in_as(@archer)
    get :edit, params: { id: @user }
    assert_not flash.empty?
    assert_redirected_to message_url
  end

  test "should redirect update when logged in as wrong user" do
    log_in_as(@archer)
    patch :update, params: {id: @user, user: { name: @user.name, email: @user.email } }
    assert_not flash.empty?
    assert_redirected_to message_url
  end

 test "should redirect destroy when not logged in" do
    assert_no_difference 'User.count' do
      delete :destroy, params: {id: @user}
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when logged in as a non-admin" do
    log_in_as(@archer)
    assert_no_difference 'User.count' do
      delete :destroy, params: {id: @user}
    end
    assert_not flash.empty?
    assert_redirected_to message_url
  end
end
