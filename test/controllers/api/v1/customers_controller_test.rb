require 'test_helper'

class Api::V1::CustomersControllerTest < ActionController::TestCase
  test "it shows the invoice for an invoice item" do
    id = Customer.first.id
    get :invoices, id: id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal id, parsed_json.first["customer_id"]
    assert_equal "shipped",  parsed_json.first["status"]
    assert_equal 281110143,  parsed_json.first["id"]
  end
end
