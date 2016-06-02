require 'test_helper'

class Api::V1::TransactionsControllerTest < ActionController::TestCase
  test "it shows the invoice for a transaction" do
    id = Transaction.first.id
    get :invoice, id: id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal id, parsed_json.first["customer_id"]
    assert_equal "shipped",  parsed_json.first["status"]
    assert_equal 281110143,  parsed_json.first["id"]
  end
