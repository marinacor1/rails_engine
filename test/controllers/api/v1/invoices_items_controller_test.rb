require 'test_helper'

class Api::V1::InvoiceItemsControllerTest < ActionController::TestCase
  test "it shows the invoice for an invoice item" do
    id = InvoiceItem.first.id
    get :invoice, id: id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal "shipped", parsed_json["status"]
    assert_equal 298486374,  parsed_json["merchant_id"]
    assert_equal 980190962,  parsed_json["customer_id"]
  end

  test "it shows the item for an invoice item" do
    id = InvoiceItem.first.id
    get :item, id: id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal "Large shiny Tvs", parsed_json["name"]
  end
end
