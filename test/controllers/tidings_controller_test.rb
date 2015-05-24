require 'test_helper'

class TidingsControllerTest < ActionController::TestCase
  setup do
    @tiding = tidings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tidings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tiding" do
    assert_difference('Tiding.count') do
      post :create, tiding: { description: @tiding.description, image_url: @tiding.image_url, title: @tiding.title }
    end

    assert_redirected_to tiding_path(assigns(:tiding))
  end

  test "should show tiding" do
    get :show, id: @tiding
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tiding
    assert_response :success
  end

  test "should update tiding" do
    patch :update, id: @tiding, tiding: { description: @tiding.description, image_url: @tiding.image_url, title: @tiding.title }
    assert_redirected_to tiding_path(assigns(:tiding))
  end

  test "should destroy tiding" do
    assert_difference('Tiding.count', -1) do
      delete :destroy, id: @tiding
    end

    assert_redirected_to tidings_path
  end
end
