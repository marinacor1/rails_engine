require 'test_helper'

class Api::V1::MerchantItemsControllerTest < ActionController::TestCase
  test "it shows all merchant items" do
    id = Merchant.first.id
    get :index, id: id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert parsed_json.last["name"], "Magic marbles"
    refute_equal "Large shiny Tvs",  parsed_json.first["name"]
    refute_equal "Clean tupperware containers", parsed_json.first["name"]
  end
end
