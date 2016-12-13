require 'test_helper'

class CompanyWorkControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get company_work_index_url
    assert_response :success
  end

end
