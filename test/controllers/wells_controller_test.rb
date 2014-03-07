require 'test_helper'

class WellsControllerTest < ActionController::TestCase
  setup do
    @well = wells(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wells)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create well" do
    assert_difference('Well.count') do
      post :create, well: { api_number: @well.api_number, operator_name: @well.operator_name, tracking_number: @well.tracking_number }
    end

    assert_redirected_to well_path(assigns(:well))
  end

  test "should show well" do
    get :show, id: @well
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @well
    assert_response :success
  end

  test "should update well" do
    patch :update, id: @well, well: { api_number: @well.api_number, operator_name: @well.operator_name, tracking_number: @well.tracking_number }
    assert_redirected_to well_path(assigns(:well))
  end

  test "should destroy well" do
    assert_difference('Well.count', -1) do
      delete :destroy, id: @well
    end

    assert_redirected_to wells_path
  end
end
