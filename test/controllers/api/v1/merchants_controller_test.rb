require 'test_helper'

class Api::V1::MerchantsControllerTest < ActionController::TestCase
  test "it shows all merchants" do
    get :index, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, parsed_json.count
  end

  test "the show pages returns hash not array" do
    get :show, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal Hash, parsed_json.class
  end

end
