require 'test_helper'

class CollectionTypesControllerTest < ActionController::TestCase
  setup do
    @collection_type = collection_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:collection_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create collection_type" do
    assert_difference('CollectionType.count') do
      post :create, collection_type: {  }
    end

    assert_redirected_to collection_type_path(assigns(:collection_type))
  end

  test "should show collection_type" do
    get :show, id: @collection_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @collection_type
    assert_response :success
  end

  test "should update collection_type" do
    put :update, id: @collection_type, collection_type: {  }
    assert_redirected_to collection_type_path(assigns(:collection_type))
  end

  test "should destroy collection_type" do
    assert_difference('CollectionType.count', -1) do
      delete :destroy, id: @collection_type
    end

    assert_redirected_to collection_types_path
  end
end
