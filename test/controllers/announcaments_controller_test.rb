require 'test_helper'

class AnnouncamentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @announcament = announcaments(:one)
  end

  test "should get index" do
    get announcaments_url
    assert_response :success
  end

  test "should get new" do
    get new_announcament_url
    assert_response :success
  end

  test "should create announcament" do
    assert_difference('Announcament.count') do
      post announcaments_url, params: { announcament: { body: @announcament.body, city: @announcament.city, company_id: @announcament.company_id, req_count: @announcament.req_count, title: @announcament.title, worker_id: @announcament.worker_id } }
    end

    assert_redirected_to announcament_url(Announcament.last)
  end

  test "should show announcament" do
    get announcament_url(@announcament)
    assert_response :success
  end

  test "should get edit" do
    get edit_announcament_url(@announcament)
    assert_response :success
  end

  test "should update announcament" do
    patch announcament_url(@announcament), params: { announcament: { body: @announcament.body, city: @announcament.city, company_id: @announcament.company_id, req_count: @announcament.req_count, title: @announcament.title, worker_id: @announcament.worker_id } }
    assert_redirected_to announcament_url(@announcament)
  end

  test "should destroy announcament" do
    assert_difference('Announcament.count', -1) do
      delete announcament_url(@announcament)
    end

    assert_redirected_to announcaments_url
  end
end
