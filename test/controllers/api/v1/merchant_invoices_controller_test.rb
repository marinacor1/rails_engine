require 'test_helper'

class Api::V1::MerchantInvoicesControllerTest < ActionController::TestCase
  test "it shows all merchant invoices" do
    id = Merchant.first.id
    get :index, id: id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert parsed_json.last["status"], "shipped"
    assert parsed_json.last["customer_id"], "4"
    refute_equal "2",  parsed_json.first["customer_id"]
  end
end
