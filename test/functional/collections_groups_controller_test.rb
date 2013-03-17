require 'test_helper'

class CollectionsGroupsControllerTest < ActionController::TestCase
  setup do
    @collections_group = collections_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:collections_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create collections_group" do
    assert_difference('CollectionsGroup.count') do
      post :create, collections_group: {  }
    end

    assert_redirected_to collections_group_path(assigns(:collections_group))
  end

  test "should show collections_group" do
    get :show, id: @collections_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @collections_group
    assert_response :success
  end

  test "should update collections_group" do
    put :update, id: @collections_group, collections_group: {  }
    assert_redirected_to collections_group_path(assigns(:collections_group))
  end

  test "should destroy collections_group" do
    assert_difference('CollectionsGroup.count', -1) do
      delete :destroy, id: @collections_group
    end

    assert_redirected_to collections_groups_path
  end
end
