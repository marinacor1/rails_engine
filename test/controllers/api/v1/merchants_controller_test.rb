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

  test "it finds all possible matches in a query" do
   name = Merchant.last.name
   get :find_all, name: name, format: :json
   parsed_json = JSON.parse(response.body)

   assert_equal 2, parsed_json.count
  end

end
