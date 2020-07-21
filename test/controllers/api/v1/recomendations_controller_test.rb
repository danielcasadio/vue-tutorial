require 'test_helper'

class Api::V1::RecomendationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_recomendations_index_url
    assert_response :success
  end

end
