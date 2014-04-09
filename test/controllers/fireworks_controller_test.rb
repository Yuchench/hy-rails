require 'test_helper'

class FireworksControllerTest < ActionController::TestCase
  setup do
    @firework = fireworks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fireworks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create firework" do
    assert_difference('Firework.count') do
      post :create, firework: { content: @firework.content, name: @firework.name, name_id: @firework.name_id, product_type: @firework.product_type }
    end

    assert_redirected_to firework_path(assigns(:firework))
  end

  test "should show firework" do
    get :show, id: @firework
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @firework
    assert_response :success
  end

  test "should update firework" do
    patch :update, id: @firework, firework: { content: @firework.content, name: @firework.name, name_id: @firework.name_id, product_type: @firework.product_type }
    assert_redirected_to firework_path(assigns(:firework))
  end

  test "should destroy firework" do
    assert_difference('Firework.count', -1) do
      delete :destroy, id: @firework
    end

    assert_redirected_to fireworks_path
  end
end
