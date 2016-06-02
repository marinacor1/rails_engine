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

  test "it finds all possible merchant matches in a query" do
   created_at = Merchant.last.created_at
   get :find_all, created_at: created_at, format: :json
   parsed_json = JSON.parse(response.body)

   assert_equal "Mrs.Merchant", parsed_json["name"]
  end

  test "it finds all possible merchant matches in a updated at query" do
   updated_at = Merchant.last.updated_at
   get :find_all, updated_at: updated_at, format: :json
   parsed_json = JSON.parse(response.body)

   assert_equal 2, parsed_json.count
  end
end
