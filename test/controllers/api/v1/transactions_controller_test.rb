require 'test_helper'

class Api::V1::TransactionsControllerTest < ActionController::TestCase
  test "it shows all transactions" do
    get :index, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal 4, parsed_json.count
  end

  test "it shows a single transaction based on id" do
    id = Transaction.first.id
    get :show, id: id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal id, parsed_json["id"]
    assert_equal Hash, parsed_json.class
  end

  test "it shows the invoice for a transaction" do
    id = Transaction.first.id
    get :invoice, id: id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal 980190962, parsed_json["id"]
    assert_equal "shipped",  parsed_json["status"]
  end
end
