require 'test_helper'

class Api::V1::InvoicesControllerTest < ActionController::TestCase
  test "it shows all invoice transactions" do
    id = Invoice.first.id
    get :transactions, id: id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert parsed_json.last["credit_card_number"], "1110"
    refute_equal "55556789834",  parsed_json.first["credit_card_number"]
    refute_equal "12345678900", parsed_json.first["credit_card_number"]
  end
end
