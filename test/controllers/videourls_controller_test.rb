require 'test_helper'

class VideourlsControllerTest < ActionController::TestCase
  setup do
    @videourl = videourls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:videourls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create videourl" do
    assert_difference('Videourl.count') do
      post :create, videourl: { body_html: @videourl.body_html, description: @videourl.description, manufacturer: @videourl.manufacturer, medicaldevice: @videourl.medicaldevice }
    end

    assert_redirected_to videourl_path(assigns(:videourl))
  end

  test "should show videourl" do
    get :show, id: @videourl
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @videourl
    assert_response :success
  end

  test "should update videourl" do
    patch :update, id: @videourl, videourl: { body_html: @videourl.body_html, description: @videourl.description, manufacturer: @videourl.manufacturer, medicaldevice: @videourl.medicaldevice }
    assert_redirected_to videourl_path(assigns(:videourl))
  end

  test "should destroy videourl" do
    assert_difference('Videourl.count', -1) do
      delete :destroy, id: @videourl
    end

    assert_redirected_to videourls_path
  end
end
