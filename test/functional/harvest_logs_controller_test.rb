require 'test_helper'

class HarvestLogsControllerTest < ActionController::TestCase
  setup do
    @harvest_log = harvest_logs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:harvest_logs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create harvest_log" do
    assert_difference('HarvestLog.count') do
      post :create, harvest_log: {  }
    end

    assert_redirected_to harvest_log_path(assigns(:harvest_log))
  end

  test "should show harvest_log" do
    get :show, id: @harvest_log
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @harvest_log
    assert_response :success
  end

  test "should update harvest_log" do
    put :update, id: @harvest_log, harvest_log: {  }
    assert_redirected_to harvest_log_path(assigns(:harvest_log))
  end

  test "should destroy harvest_log" do
    assert_difference('HarvestLog.count', -1) do
      delete :destroy, id: @harvest_log
    end

    assert_redirected_to harvest_logs_path
  end
end
