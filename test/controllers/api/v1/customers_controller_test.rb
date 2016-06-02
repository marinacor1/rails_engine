require 'test_helper'

class Api::V1::CustomersControllerTest < ActionController::TestCase
  test "it shows all customers" do
    get :index, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, parsed_json.count
  end

  test "it shows a single customer based on id" do
    id = Customer.first.id
    get :show, id: id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal "Lawrence", parsed_json["first_name"]
    refute_equal "Marina", parsed_json["first_name"]
    assert_equal Hash, parsed_json.class
  end

  test "it shows the invoices for a customer" do
    id = Customer.first.id
    get :invoices, id: id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal id, parsed_json.first["customer_id"]
    assert_equal "shipped",  parsed_json.first["status"]
    assert_equal 281110143,  parsed_json.first["id"]
  end

  test "it shows the transactions for a customer" do
    id = Customer.last.id
    get :transactions, id: id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal "pending", parsed_json.first["result"]
    assert_equal "123456789",  parsed_json.first["credit_card_number"]
  end

  test "it finds all possible customer matches in a query" do
   last_name = Customer.last.last_name
   get :find_all, last_name: last_name, format: :json
   parsed_json = JSON.parse(response.body)

   assert_equal 2, parsed_json.count
  end

  test "it finds the favorite merchant for a customer" do
    id = Customer.last.id
    get :favorite_merchant, id: id, format: :json
    parsed_json = JSON.parse(response.body)
    merchant = {"id"=>298486374, "name"=>"Mrs.Merchant"}
    
    assert_equal merchant, parsed_json
  end

end
