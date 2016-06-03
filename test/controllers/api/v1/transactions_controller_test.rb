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

  test "it can show all instances of transaction by result" do
    get :find_all, result: "success", format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, parsed_json.count
    assert_equal Array, parsed_json.class
  end

  test "it can show the first instance of transaction by result" do
    get :find, result: "success", format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal 4, parsed_json.count
    assert_equal Hash, parsed_json.class
  end

  test "it can find a random transaction" do
    get :random, format: :json
    random_parse = JSON.parse(response.body)

    assert_response :success
    
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
