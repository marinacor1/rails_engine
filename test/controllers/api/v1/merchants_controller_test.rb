require 'test_helper'

class Api::V1::MerchantsControllerTest < ActionController::TestCase
  test "it shows all merchants" do
    get :index, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, parsed_json.count
  end

  test "the show pages returns hash not array" do
    id = Merchant.first.id
    get :show, id: id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal id, parsed_json["id"]
    assert_equal Hash, parsed_json.class
  end

  test "it finds first merchant matches in a query" do
   created_at = Merchant.last.created_at
   get :find, created_at: created_at, format: :json
   parsed_json = JSON.parse(response.body)
   assert_equal "Mr.Merchant", parsed_json["name"]
   assert_equal 2, parsed_json.count
  end

  test "it finds all possible merchant matches in a query" do
   created_at = Merchant.last.created_at
   get :find_all, created_at: created_at, format: :json
   parsed_json = JSON.parse(response.body)

   assert_equal "Mr.Merchant", parsed_json.first["name"]
  end

  test "it finds all possible merchant matches in a updated at query" do
   updated_at = Merchant.last.updated_at
   get :find_all, updated_at: updated_at, format: :json
   parsed_json = JSON.parse(response.body)

   assert_equal 2, parsed_json.count
  end

  test "it finds all possible merchant matches in a created at query" do
   created = Merchant.last.created_at
   get :find_all, created_at: created, format: :json
   parsed_json = JSON.parse(response.body)

   assert_equal 2, parsed_json.count
  end

  test "it sorts merchants by revenue when quantity is given" do
    skip
    get :most_revenue, quantity: 2, format: :json
    parsed_json = JSON.parse(response.body)

    assert_equal 2, parsed_json.count
    assert_equal "", parsed_json.first
  end

  test "it gives favorite customer" do
    skip
    id = Merchant.first.id
    get :favorite_customer, id: id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_equal 2, parsed_json.count
    assert_equal "", parsed_json.first
  end

  test "it gives customers with pending invoices for single merchant" do
    id = Merchant.first.id
    get :pending_invoices, id: id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_equal 1, parsed_json.count
    assert_equal "Cordoba", parsed_json.first['last_name']
  end
end
