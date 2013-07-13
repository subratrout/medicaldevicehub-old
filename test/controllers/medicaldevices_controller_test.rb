require 'test_helper'

class MedicaldevicesControllerTest < ActionController::TestCase
  setup do
    @medicaldevice = medicaldevices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medicaldevices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medicaldevice" do
    assert_difference('Medicaldevice.count') do
      post :create, medicaldevice: { advisory_committee: @medicaldevice.advisory_committee, applicant: @medicaldevice.applicant, city: @medicaldevice.city, description: @medicaldevice.description, generic_name: @medicaldevice.generic_name, pmak_number: @medicaldevice.pmak_number, product_code: @medicaldevice.product_code, state: @medicaldevice.state, street1: @medicaldevice.street1, street2: @medicaldevice.street2, trade_name: @medicaldevice.trade_name, zip: @medicaldevice.zip }
    end

    assert_redirected_to medicaldevice_path(assigns(:medicaldevice))
  end

  test "should show medicaldevice" do
    get :show, id: @medicaldevice
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medicaldevice
    assert_response :success
  end

  test "should update medicaldevice" do
    patch :update, id: @medicaldevice, medicaldevice: { advisory_committee: @medicaldevice.advisory_committee, applicant: @medicaldevice.applicant, city: @medicaldevice.city, description: @medicaldevice.description, generic_name: @medicaldevice.generic_name, pmak_number: @medicaldevice.pmak_number, product_code: @medicaldevice.product_code, state: @medicaldevice.state, street1: @medicaldevice.street1, street2: @medicaldevice.street2, trade_name: @medicaldevice.trade_name, zip: @medicaldevice.zip }
    assert_redirected_to medicaldevice_path(assigns(:medicaldevice))
  end

  test "should destroy medicaldevice" do
    assert_difference('Medicaldevice.count', -1) do
      delete :destroy, id: @medicaldevice
    end

    assert_redirected_to medicaldevices_path
  end
end
