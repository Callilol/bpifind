require 'test_helper'

class HarvestSchedulesControllerTest < ActionController::TestCase
  setup do
    @harvest_schedule = harvest_schedules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:harvest_schedules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create harvest_schedule" do
    assert_difference('HarvestSchedule.count') do
      post :create, harvest_schedule: {  }
    end

    assert_redirected_to harvest_schedule_path(assigns(:harvest_schedule))
  end

  test "should show harvest_schedule" do
    get :show, id: @harvest_schedule
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @harvest_schedule
    assert_response :success
  end

  test "should update harvest_schedule" do
    put :update, id: @harvest_schedule, harvest_schedule: {  }
    assert_redirected_to harvest_schedule_path(assigns(:harvest_schedule))
  end

  test "should destroy harvest_schedule" do
    assert_difference('HarvestSchedule.count', -1) do
      delete :destroy, id: @harvest_schedule
    end

    assert_redirected_to harvest_schedules_path
  end
end
