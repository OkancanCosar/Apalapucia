require 'test_helper'

class WorkerWorkControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get worker_work_index_url
    assert_response :success
  end

end
