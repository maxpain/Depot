require 'test_helper'

class TipingsControllerTest < ActionController::TestCase
  setup do
    @tiping = tipings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tiping" do
    assert_difference('Tiping.count') do
      post :create, tiping: { description: @tiping.description, title: @tiping.title }
    end

    assert_redirected_to tiping_path(assigns(:tiping))
  end

  test "should show tiping" do
    get :show, id: @tiping
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tiping
    assert_response :success
  end

  test "should update tiping" do
    patch :update, id: @tiping, tiping: { description: @tiping.description, title: @tiping.title }
    assert_redirected_to tiping_path(assigns(:tiping))
  end

  test "should destroy tiping" do
    assert_difference('Tiping.count', -1) do
      delete :destroy, id: @tiping
    end

    assert_redirected_to tipings_path
  end
end
