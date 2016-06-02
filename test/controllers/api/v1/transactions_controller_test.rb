require 'test_helper'

class Api::V1::TransactionsControllerTest < ActionController::TestCase
  test "it shows the invoice for a transaction" do
    id = Transaction.first.id
    get :invoice, id: id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal 980190962, parsed_json["id"]
    assert_equal "shipped",  parsed_json["status"]
  end
end
